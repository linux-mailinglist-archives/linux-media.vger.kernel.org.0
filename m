Return-Path: <linux-media+bounces-65965-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZhKtDad6QmrO8AkAu9opvQ
	(envelope-from <linux-media+bounces-65965-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:01:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D86E6DBAC7
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:01:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OeJswE8+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65965-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65965-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0B3430230CC
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B0D229B18;
	Mon, 29 Jun 2026 13:41:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE9F218821;
	Mon, 29 Jun 2026 13:41:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740503; cv=none; b=Oi/w+EteQjNN4xdg5ZRBMpOf/czg2/jbSnPFX7ATAYvvCWCGn1xmTcqoEiqnPZ+j9cwSDuKBuf6WtluZ8lyKt4tSexae4WEPIE3+8AVSsJMcwbcjknLN1DGUrpbzJQPX03jJHEiStH5iDt4V5nY7ZEFpoSKddV94nDzB2ixyoxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740503; c=relaxed/simple;
	bh=PLBW3AClXNvvjaolygKZhhTKB+Ecfv/eXC2mOoVJhQs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=oiPkOcZXVdGPFTY609u1/gDMylWnO6tcEk/Mkg+mhEzIrF8Pp9idTWNdJIOrojESaKKfA80IqUPLfssRU6mYxqpbz5Nw7Tx2PI+Y8b3wrj9lrHYmf/k4CSkkX0UO8XBs8LCQkq1JQ3aiS5X1hgMQaZlKkJo5UoO9ylxbi9CaxNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OeJswE8+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9AA1F000E9;
	Mon, 29 Jun 2026 13:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782740501;
	bh=/7ZcTAQhoY+x2mux18jAzhO+4wtD5sAX1WcgMSapXxs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=OeJswE8+CTKfucRhAZ+H2AzuQT7kqaigOeja+rc9TTSrE2HzP43ClT0zwJFKUEFwy
	 gUhMN3E946bTwsgl/7SGTbJNk601z3nqWTeexjgyv0spicYLSS+e2ZEWdx8rf+wLu9
	 7d7td2pnR4wsFI5GdZb4ZaTjQalUPJvUoumWEqQkEg/XZtC0XkSXo60Wj4Td667Cbz
	 02x3J7/wp8O8aYrpc80oA86W7EtiWekkxEWIAmdGJ0zgEnFtED0NTBqsWqiABZ+abe
	 06kVHNw7g5BXRRF2Wyi87lw3MIyOFox3doYjpJVzvl12n6RH91dq6oF0YEgmMVkbzp
	 LlTnKukLUq0oQ==
Date: Mon, 29 Jun 2026 08:41:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: quic_vgarodia@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 mchehab@kernel.org, quic_jesszhan@quicinc.com, andersson@kernel.org, 
 conor+dt@kernel.org
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
Message-Id: <178274050065.2710327.6215834228835412891.robh@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: media: qcom: Add JPEG encoder
 binding
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65965-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:quic_vgarodia@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:mchehab@kernel.org,m:quic_jesszhan@quicinc.com,m:andersson@kernel.org,m:conor+dt@kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D86E6DBAC7


On Mon, 29 Jun 2026 15:17:48 +0300, Atanas Filipov wrote:
> Add device-tree binding for the Qualcomm JPEG encoder hardware block
> present in SM8250 (Kona) SoCs.
> 
> The JPEG encoder is a standalone hardware IP within the camera subsystem
> that performs JPEG compression in memory-to-memory fashion.  It is
> separate from the CAMSS ISP pipeline and has its own register space,
> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,jpeg-encoder.yaml     | 160 ++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dtb: camss@ac6a000 (qcom,sm8250-camss): '#address-cells', '#size-cells', 'jpeg-encoder@ac53000', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dtb: camss@ac6a000 (qcom,sm8250-camss): 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dtb: camss@ac6a000 (qcom,sm8250-camss): reg: [[0, 180789248, 0, 8192]] is too short
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dtb: camss@ac6a000 (qcom,sm8250-camss): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dtb: camss@ac6a000 (qcom,sm8250-camss): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dtb: camss@ac6a000 (qcom,sm8250-camss): 'interconnects' is a required property
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dtb: camss@ac6a000 (qcom,sm8250-camss): 'interconnect-names' is a required property
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dtb: camss@ac6a000 (qcom,sm8250-camss): 'interrupt-names' is a required property
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dtb: camss@ac6a000 (qcom,sm8250-camss): 'iommus' is a required property
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dtb: camss@ac6a000 (qcom,sm8250-camss): 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dtb: camss@ac6a000 (qcom,sm8250-camss): 'reg-names' is a required property
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dtb: camss@ac6a000 (qcom,sm8250-camss): 'vdda-phy-supply' is a required property
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dtb: camss@ac6a000 (qcom,sm8250-camss): 'vdda-pll-supply' is a required property
	from schema $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


