<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<s:if test="!firstDisplay">
	<p class="bg-danger"><br/>Il y a des probl�mes, voyez les messages ci-dessous:
		<s:if test="!raisonSocialeOK">
			<br/><span class="glyphicon glyphicon-remove"></span>&nbsp;
			 La raison sociale de votre exploitation est obligatoire
		</s:if>
		<s:if test="!sirenOK">
			<br/><span class="glyphicon glyphicon-remove"></span>&nbsp;
			 Votre code siren est obligatoire
		</s:if>
		<s:if test="!ligneAdresse1OK">
			<br/><span class="glyphicon glyphicon-remove"></span>&nbsp;
			 Vous devez saisir votre adresse
		</s:if>
		<s:if test="!codePostalOK">
			<br/><span class="glyphicon glyphicon-remove"></span>&nbsp;
			 Votre code postal contient des erreurs
		</s:if>
		<s:if test="!villeOK">
			<br/><span class="glyphicon glyphicon-remove"></span>&nbsp;
			 Vous devez saisir une ville
		</s:if>
		<s:if test="!latitudeOK">
			<br/><span class="glyphicon glyphicon-remove"></span>&nbsp;
			 Probl�me de latitude
		</s:if>
		<s:if test="!longitudeOK">
			<br/><span class="glyphicon glyphicon-remove"></span>&nbsp;
			 Probl�me de longitude
		</s:if>
		<s:if test="!descriptionOK">
			<br/><span class="glyphicon glyphicon-remove"></span>&nbsp;
			 Veuillez d�crire votre exploitation
		</s:if>
		<s:if test="!delaiLivraisonOK">
			<br/><span class="glyphicon glyphicon-remove"></span>&nbsp;
			 Votre d�lai n'est pas correct
		</s:if>
		<s:if test="!imageOK">
			<br/><span class="glyphicon glyphicon-remove"></span>&nbsp;
			 Veuillez nous fournir une photo de votre production
		</s:if>
		<br/><br/>
	</p>
</s:if>

	<s:if test="fromdB">
<s:if test="firstDisplay">
		<s:if test="idProducteur > 0">
			<p class="bg-danger">
				<br/><span class="glyphicon glyphicon-save"></span>&nbsp;
					Bravo, vous �tes r�f�renc�(e) parmi nos fines gueules.
					Vous pouvez ajouter un nouveau producteur
			</p>
		</s:if>
		<s:if test="idProducteur = 0">
			<p class="bg-danger">
				<br/><span class="glyphicon glyphicon-remove"></span>&nbsp;
					L'enregistrement de vos param�tres a �chou�.
			</p>
		</s:if>
	</s:if>
	<br/><br/>
</s:if>

<div class="col-md-8 col-md-offset-2 row">
	<span class="glyphicon glyphicon-map-marker" style="font-size: 2em;color:red"></span>
	<p>
	Pour saisir un producteur, tous les champs du formulaire sont obligatoires, except�e la seconde ligne
	d'adresse.
	</p>
</div>

<div class="row" id="divFormProducteur" data-messErrorCodePostal="<s:property value="messErrorCodePostal"/>">

<s:actionerror/>
<%-- 	<s:form action="ajout-producteur" method="post" enctype="multipart/form-data" class="form-horizontal"> --%>

	<form class="form-horizontal row" id="FormProducteur" method="post" enctype="multipart/form-data"
		action="<s:url action='ajout-producteur' />">
		<fieldset>
		
			<legend> Producteur : </legend>
			
			<div class="form-group row">
				<label for="idRaisonSociale" class="col-sm-2 control-label">Raison sociale du producteur : </label>
				<div class="col-sm-6">
					<input type="text" class="form-control input-lg" id="idRaisonSociale" maxlength="50"
						name="raisonSociale" value="<s:property value="raisonSociale"/>">
				</div>
			</div>
			
			<div class="form-group row">
				<label for="idSiren" class="col-sm-2 control-label">SIREN : </label>
				<div class="col-sm-6">
					<input type="text" class="form-control input-lg" id="idSiren" maxlength="50"
						name="siren" value="<s:property value="siren"/>"> 
				</div>
			</div>
			
			<div class="form-group row">
				<label for="idDelai" class="col-sm-2 control-label">D�lai de livraison : </label>
				<div class="col-sm-2">
					<input type="number" class="form-control" id="idDelai" name="delaiLivraison" min="0"
						value="<s:property value="delaiLivraison" />" >
				</div>
			</div>
			
			<div class="form-group row">
				<label for="idDescription" class="col-sm-2 control-label">Description : </label>
				<div class="col-sm-6">
					<textarea class="form-control" name="description" id="idDescription" rows="5"><s:property value="description" /></textarea>
				</div>
			</div>
			
			
<!-- 			<div class="form-group row"> -->
<!-- 				<div class="col-sm-6"> -->
<%-- 					<s:file name="userImage" label="User Image"> <s:property value="imageName" /></s:file> --%>
<!-- 				</div> -->
<!-- 			</div> -->
			
			<div class="form-group">
				<label for="idPhotoProducteur" class="col-sm-2 control-label">Photo de votre producteur : </label>
				<div class="col-sm-6">
					<input type="file" name="userImage" id="idPhotoProducteur" />
				</div>
			</div>
		</fieldset>
			
			
		<fieldset>
			<legend> Adresse : </legend>
			<div class="form-group row">
				<label for="idLigneAdresse1" class="col-sm-2 control-label">Rue : </label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="idLigneAdresse1" maxlength="50"
						name="ligneAdresse1" value="<s:property value="ligneAdresse1" />">
				</div>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="idLigneAdresse2" maxlength="50"
						name="ligneAdresse2" value="<s:property value="ligneAdresse2" />">
				</div>
			</div>
			
			<div class="form-group row">
				<label for="idCodePostal" class="col-sm-2 control-label">Code Postal : </label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="idCodePostal"
						name="codePostal" pattern="\d{5}"
						value="<s:property value="codePostal" />"> <span
 						id="idHelpCodePostal" class="help-block"></span>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputVille" class="col-sm-2 control-label">Ville : </label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="idVille" name="ville" maxlength="50"
						value="<s:property value="ville" />" placeholder="Ville">
				</div>
			</div>
			
			
			<input type="hidden" class="form-control" id="fromDb" name="fromDb" 
					value="<s:property value="fromDb" />" >
					
			
			<input type="hidden" class="form-control" id="idProducteur" name="idProducteur" 
									value="<s:property value="idProducteur" />" >
								
			
			
			<div class="form-group row">
				<label for="idLatitude" class="col-sm-2 control-label">Latitude : </label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="idLatitude"
						name="latitude" value="<s:property value="latitude"/>">
				</div>
			</div>
			
			<div class="form-group row">
				<label for="idLongitude" class="col-sm-2 control-label">Longitude : </label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="idLongitude"
						name="longitude" value="<s:property value="longitude"/>">
				</div>
			</div>
		</fieldset>
		<br/>
				
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-primary btn-lg">Enregistrer Producteur</button>
			</div>
		</div>
		
<!-- 		<div class="form-group row"> -->
<!-- 			<div class="col-sm-offset-2 col-sm-10"> -->
<%-- 				<s:submit value="Upload" align="center"></s:submit> --%>
<!-- 			</div>  -->
<!-- 		</div>  -->
		
		
	</form>
<%-- </s:form> --%>

</div>