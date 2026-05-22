Return-Path: <linux-media+bounces-62631-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFKXDi+NEGrEZQYAu9opvQ
	(envelope-from <linux-media+bounces-62631-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 19:06:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3F25B7ED6
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 19:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75C483003497
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 16:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D976201113;
	Fri, 22 May 2026 16:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbZy6fAy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5495B3AEB35;
	Fri, 22 May 2026 16:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779468552; cv=none; b=kW5apDMluuL0OUXOFN6UaU4kyZnVNrIxH9oJ8Xnd4UJouuYXrtVaCvVXBDZr1ifWUI2bEQgbV7ZX5HDLpSEQDqc7DxfkeL4+gGIdRKMCzH786GgKbTU8S8z4jrjV50EpfLk+NJ9Vor0aiG3dTnZ2Kz8SDlz4DIoj7F0xKLr5beY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779468552; c=relaxed/simple;
	bh=FfKTb9Hu7Ghj2YKZ+FDCk+lV/jMscXRaMlPUwPh7liA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=c1KolRDRDVuaopbFysTQGcZaq4t/IhiFhcjNEi7DaqJndB1f4Yoktzm4KMIFmmjDIWdTZdWuaCGOWHpDds1Q71MS1/POj99o5slFvwAvjKLLuxJPtOxIUQ+JT+OeDcW6m36rW6JdFz8f55NvoV8L4vGtcGspbIMX4tBwH2Om0Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbZy6fAy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4BB1F000E9;
	Fri, 22 May 2026 16:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779468551;
	bh=ug9eZQIFNypiqZgKpBIekjie2y0vmg+wE3aUAtX412Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=MbZy6fAy++HVsaBlZHx0t1kgW6LLk6tuuFn08+R2GoPkUYN16f5gsaWORYACAXjaP
	 Wk9ypySt/3+LkNZ3EJjM0ikhyLL01jJuGTggrBlQm8qSDs4HPdEzhJAVp6OKFRnrXC
	 aZZkqmPfnx7jBEu0VOkLP/Aibe+2/I7JBJIsLRWhc0EhQd2nI0hzgeBpDElgx+lukJ
	 wDyhptwqtDAqUlpKYJ6vVszAw7ixUtWL3fbF3w8x0O+Jwm0UI4HDHfM+Pw2ODDjr5W
	 rl6+iCt0gOy283aT6a4z+eSXJpL0raUXO1wE37IeEP0uFAYWWQFsJuyAOY+D5Tv0iX
	 R2htSe+Vxw0ww==
Date: Fri, 22 May 2026 11:49:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260522-x1e-csi2-phy-v7-1-79cb1280fad6@linaro.org>
References: <20260522-x1e-csi2-phy-v7-0-79cb1280fad6@linaro.org>
 <20260522-x1e-csi2-phy-v7-1-79cb1280fad6@linaro.org>
Message-Id: <177946855028.3571140.11988520251406266072.robh@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62631-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2C3F25B7ED6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 22 May 2026 15:45:09 +0100, Bryan O'Donoghue wrote:
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
> 
> The hardware can support both CPHY, DPHY and a special split-mode DPHY.
> 
> The schema here defines three ports:
> 
> port@0:
>     The first input port where a sensor is always required.
> 
> port@1:
>     A second optional input port which if present implies DPHY split-mode.
> 
> port@2:
>     A third always required output port which connects to the controller.
> 
> The CSIPHY devices have their own pinouts on the SoC as well as their own
> individual voltage rails.
> 
> The need to model voltage rails on a per-PHY basis leads us to define
> CSIPHY devices as individual nodes.
> 
> Two nice outcomes in terms of schema and DT arise from this change.
> 
> 1. The ability to define on a per-PHY basis voltage rails.
> 2. The ability to require those voltage.
> 
> We have had a complete bodge upstream for this where a single set of
> voltage rail for all CSIPHYs has been buried inside of CAMSS.
> 
> Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
> CAMSS parlance, the CSIPHY devices should be individually modelled.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 208 +++++++++++++++++++++
>  1 file changed, 208 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml: port@0: Missing additionalProperties/unevaluatedProperties constraint
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml: port@1: Missing additionalProperties/unevaluatedProperties constraint
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml: port@2: Missing additionalProperties/unevaluatedProperties constraint
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.example.dtb: csiphy@ace4000 (qcom,x1e80100-csi2-phy): ports:port@2:endpoint: Unevaluated properties are not allowed ('clock-lanes', 'data-lanes' were unexpected)
	from schema $id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260522-x1e-csi2-phy-v7-1-79cb1280fad6@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


