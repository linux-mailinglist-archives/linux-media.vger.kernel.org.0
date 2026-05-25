Return-Path: <linux-media+bounces-62716-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPTfAEYoFGrfKAcAu9opvQ
	(envelope-from <linux-media+bounces-62716-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 12:45:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE035C956C
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 12:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BA6E301C58D
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 10:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2C0367F3A;
	Mon, 25 May 2026 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSCuc8IE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4C436C0CF;
	Mon, 25 May 2026 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705822; cv=none; b=pXjuNTxgc0xP8CbUK5e14iHU6wT+NSfSn2OEIY+Qns4tfLbFrd/SUwNUxOVQqeKVKYdRrFx1YOrsVUuj2avdFQ61M+80jO7artJUq+XwT7GgCupJZZeUWWhFeSm3ZeHHDcVdYrDPTYgCzX5ZaLyLs4JS2rZQj1yOIe0zAldjErQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705822; c=relaxed/simple;
	bh=Fsxrsphi2dCnqeJa7qeWKFhhL3tAPkBX0WZVGYk+vwU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=nqjIHlpK3naLOkSoHhltTSlvXbtF1xatZjA25+opj5f/ISUNuUs8D7Hdv53Eq0LwAqdteK2zXwxLLfXU4PNVrYP0BO9TZ3F9YxyzLC8pYg/WefNclR/mjNHUQiwpatXTErlnai3otpZg6OliLUBLCIJrC5UZEsqfDz2tCbz3+Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSCuc8IE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 236C81F000E9;
	Mon, 25 May 2026 10:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779705819;
	bh=srjqsu/CzyJPLcISmZtzPE6Hh7zthtKm0bgXC6QNd2o=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=RSCuc8IEgkJu8PXT7ayTk7inXAFejDcQRYa1aZbfh9Zr7qEit8g4+yFvXyD2Ln7+g
	 9OV4t9U9fgIFBRXpOm69/x6mEvNakoihDrzcpmp8uGbVbep6Fnk6vMHpqVDhJ2Wphv
	 4g2O1dpHN09pOAyPNPFRKxXj08oPgcy/B9S+ak78QFmJan8Cno182lbgdTpg8mx8Ef
	 QdXLuCrkKju+UctYLxHWfHhC/0FeZyjCsxNbnGJF1UNFD7EgOwQWw7DziirHb+WI4M
	 TGXJD+thL/kKPrd3uumOvJ/RTcdUn8HFN27gDneoTjGrons6jncQ1neK98OezxyDMx
	 e3mzXtiqN9dbA==
Date: Mon, 25 May 2026 05:43:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, 
 Conor Dooley <conor+dt@kernel.org>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
In-Reply-To: <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
References: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
 <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
Message-Id: <177970581844.3566674.15613967035246417411.robh@kernel.org>
Subject: Re: [PATCH v8 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pengutronix.de,lists.linux.dev,kernel.org,nxp.com,vger.kernel.org,ideasonboard.com,gmail.com,lists.infradead.org,oss.qualcomm.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62716-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5EE035C956C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 25 May 2026 16:12:22 +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The i.MX95 CSI pixel formatting module uses packet info, pixel and
> non-pixel data from the CSI-2 host controller and reformat them to
> match Pixel Link(PL) definition.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v8:
> - Use standard port reference instead of video-interfaces.yaml
> - Add parent syscon node in example to show device integration
> - Add required constraints for port@0 and port@1 in ports node
> 
> Changes in v7:
> - Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
>   Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
> ---
>  .../bindings/media/fsl,imx95-csi-formatter.yaml    | 92 ++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.example.dtb: syscon@4ac10000 (nxp,imx95-camera-csr): '#address-cells', '#size-cells', 'formatter@20' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/clock/nxp,imx95-blk-ctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.example.dtb: syscon@4ac10000 (nxp,imx95-camera-csr): reg: [[0, 1254162432], [0, 65536]] is too long
	from schema $id: http://devicetree.org/schemas/clock/nxp,imx95-blk-ctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.example.dtb: syscon@4ac10000 (nxp,imx95-camera-csr): '#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/nxp,imx95-blk-ctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.example.dtb: syscon@4ac10000 (nxp,imx95-camera-csr): 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/clock/nxp,imx95-blk-ctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.example.dtb: syscon@4ac10000 (nxp,imx95-camera-csr): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/clock/nxp,imx95-blk-ctl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


