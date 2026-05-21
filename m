Return-Path: <linux-media+bounces-62532-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CG+LPA8D2rQIAYAu9opvQ
	(envelope-from <linux-media+bounces-62532-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 19:12:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B54B15A9F3F
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 19:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14316302FAF1
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 15:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E0733F58E;
	Thu, 21 May 2026 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WH2q71/J"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802B5302149;
	Thu, 21 May 2026 15:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779376555; cv=none; b=C7bhzutMgq26Odac+T5AGPaHBcWKLHARyfOovAhMRHNo15F92B5/14opDWz/EPqtK6/D3IxO4ofcWDxfO+BxOt/9+S4UyoyGS6EcTH3K8ZkDARuj595NQrqpMSxVgyZWFw/EjjfrCIisP/wMPSYt4+eyyykMBKlIZwhzPPkxdoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779376555; c=relaxed/simple;
	bh=c6708tXft9gLhDUY1x+PmJB9Hj8ECYv5J+JeI7o7NyY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=LhOGJg1odTQFEuuhw+02xGpbjBt0TL3zJKVoFzcX9g66GfEALgf8kOpFDmfjdtY4dIjSGgeozH53T0XpfH6evIc0d6t2O5iYbm35g8V4ScZ8F2zRPuCV4KP0P1YXY2XiByZhYF4nBni/O/1K5Hz2QamC8X3x8LyXx9Vrls+wPE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WH2q71/J; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED471F00A3B;
	Thu, 21 May 2026 15:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779376554;
	bh=6+hPFg766OszpUSn1xTNsvl7vipNukyxXO874O2maWg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=WH2q71/J6y0dFUjb7NBabK7U82iWvGQixkAmY0LxWgp3ltpqlgBBhXJD6QrjiWCvC
	 WDicWNNAvjRQ5HZhFPtlEqzBdgCRJeunIr5v99a38F7faeQwSM7j6qrEABeVtQn76A
	 aD04TSH7GhElThcrlErG3k+X8otgHzK836QoyPjDk6aWOnDTRGr4ePnTTMng4uw21/
	 GW9JPDLS0wod1oo3RwrSdRgI8e83q/hFjpLftRNkmZBjsu8i1sBPSr2IexAQqomzsM
	 nUhBuAhrJLZDE9v3Vgu/dYBHIU9vNwh9+HRY8WFKqT30AnEuf/8aEJ/SsB1Bg5Seky
	 bDnXphfoTyTHw==
Date: Thu, 21 May 2026 10:15:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260521-x1e-csi2-phy-v6-1-9d73d9bd7d20@linaro.org>
References: <20260521-x1e-csi2-phy-v6-0-9d73d9bd7d20@linaro.org>
 <20260521-x1e-csi2-phy-v6-1-9d73d9bd7d20@linaro.org>
Message-Id: <177937655318.1947776.1539787576186189902.robh@kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62532-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,0.0.0.2:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,0.0.0.1:email,linaro.org:email]
X-Rspamd-Queue-Id: B54B15A9F3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 21 May 2026 13:20:08 +0100, Bryan O'Donoghue wrote:
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
>  .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 205 +++++++++++++++++++++
>  1 file changed, 205 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml: port@0: Missing additionalProperties/unevaluatedProperties constraint
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml: port@1: Missing additionalProperties/unevaluatedProperties constraint
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml: port@2: Missing additionalProperties/unevaluatedProperties constraint
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.example.dtb: csiphy@ace4000 (qcom,x1e80100-csi2-phy): ports:port@0:endpoint: 'data-lanes' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.example.dtb: csiphy@ace4000 (qcom,x1e80100-csi2-phy): ports:port@0:endpoint: 'clock-lanes' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260521-x1e-csi2-phy-v6-1-9d73d9bd7d20@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


