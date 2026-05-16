Return-Path: <linux-media+bounces-61780-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMhOMv/WB2qILAMAu9opvQ
	(envelope-from <linux-media+bounces-61780-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 04:31:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0DE559E7A
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 04:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFF563022F5F
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 02:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F03E285C84;
	Sat, 16 May 2026 02:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1r75yAl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86DF4CB5B;
	Sat, 16 May 2026 02:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778898645; cv=none; b=Mp1GGj1/cq1GRVfNFY/wDGtq7xZpaeb702ddzP8LPWtJb5u+KQePzs92Z9OM2qGViY5JUkDpbUT05Ko4tiKq+lWc6y+15tInP30TRXhCNkPDrcuhLt0f2b77NvtgqyZv6ivsJHsm0aLm9cOTuYKTYGH7ALbuSOqNXWOE3W3fK4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778898645; c=relaxed/simple;
	bh=fXauv6pXRzSARsUh5lGbdtmEN6s8FRglmNcydc9LiIc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=EBDmXJEj3xIEbSkQZUL3jg5uNci0NNFxbDQS7X1aqTbqbj7lpXDpDKA5EJh4ik4ctvgtGF+LHQMIXSVTcafRKJh1blR3oXrcZJi82Cp6OjwPd/G3V2Q2InNGtpcL+AT6NXDTeFN8O4tU25433CrOvzc+OAtkL8KGqx3omxYKlDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1r75yAl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B63C2BCB0;
	Sat, 16 May 2026 02:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778898645;
	bh=fXauv6pXRzSARsUh5lGbdtmEN6s8FRglmNcydc9LiIc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=X1r75yAly27zWMpcuML/U2rhPS7KlWcCKMVwJ02XGYyAh65pN8uzBoELWtEQCmUie
	 DClCSqcA7Vt2ejiwL8LLQU2b3Pxy43WwVQGU/Sbinv4dl1Cw3hiL89xTqEcDA974dO
	 FbtwzTwU1FobIwQiBKT8P++aQOVVi3qB61/MQ+N1ec2cJ5FEwETzndDT/2paHnFYvW
	 hsMsaATfyguGgbqNQRRGPd/GBQ0N+5IrMRQ7cwIU/i438tPo7Zx5vaxDZNR2LGIKIp
	 bj2ZQGnvEoQB/ZX+2HvJwwibmEnhP3vS56o+S6xSAfrc85td69CtPsVAiTrlLQnOT8
	 bZ9CerOYXZNAw==
Date: Fri, 15 May 2026 21:30:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 afilipov@quicinc.com, Hariram Purushothaman <hariramp@quicinc.com>, 
 Gjorgji Rosikopulos <grosikop@quicinc.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kapatrala Syed <akapatra@quicinc.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-1-f38c2e1b3555@oss.qualcomm.com>
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
 <20260515-qcom-jpeg-v4l2-v1-1-f38c2e1b3555@oss.qualcomm.com>
Message-Id: <177889864336.2704850.15815754320818996790.robh@kernel.org>
Subject: Re: [PATCH 1/3] media: dt-bindings: qcom: add JPEG encoder binding
X-Rspamd-Queue-Id: 4A0DE559E7A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61780-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Action: no action


On Fri, 15 May 2026 14:46:59 +0300, Atanas Filipov wrote:
> Add YAML device tree binding for the Qualcomm JPEG encoder
> hardware. This binding is used by the newly added driver and
> describes all required resources, including clocks, power domains,
> IOMMU mappings and interconnect paths.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,jpeg-encoder.yaml          | 122 +++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml:44:5: [warning] wrong indentation: expected 6 but found 4 (indentation)

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:31.27-34 Unexpected 'GIC_SPI'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:31.39-59 Unexpected 'IRQ_TYPE_EDGE_RISING'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:32.37-58 Unexpected 'CAM_CC_TITAN_TOP_GDSC'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:43.23-44 Unexpected 'GCC_CAMERA_HF_AXI_CLK'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:44.23-44 Unexpected 'GCC_CAMERA_SF_AXI_CLK'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:45.25-44 Unexpected 'CAM_CC_CORE_AHB_CLK'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:46.25-44 Unexpected 'CAM_CC_CPAS_AHB_CLK'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:47.25-46 Unexpected 'CAM_CC_CAMNOC_AXI_CLK'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:48.25-40 Unexpected 'CAM_CC_JPEG_CLK'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:55.27-44 Unexpected 'MASTER_APPSS_PROC'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:55.54-70 Unexpected 'SLAVE_CAMERA_CFG'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:56.28-44 Unexpected 'MASTER_CAMNOC_HF'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:56.56-66 Unexpected 'SLAVE_EBI1'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:57.28-44 Unexpected 'MASTER_CAMNOC_SF'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:57.56-66 Unexpected 'SLAVE_EBI1'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:58.28-45 Unexpected 'MASTER_CAMNOC_ICP'
Lexical error: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dts:58.57-67 Unexpected 'SLAVE_EBI1'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/media/qcom,jpeg-encoder.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1639: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260515-qcom-jpeg-v4l2-v1-1-f38c2e1b3555@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


