Return-Path: <linux-media+bounces-53731-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EOkLdu7oWmswAQAu9opvQ
	(envelope-from <linux-media+bounces-53731-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 16:44:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CEB1BA264
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 16:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4026330F9E7A
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 15:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5863843DA56;
	Fri, 27 Feb 2026 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLlDRao4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A99438FF3;
	Fri, 27 Feb 2026 15:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206929; cv=none; b=LEFUM9rLIq9gzt+HY2KT0dP9LNCgpSsXdNQBX/tXjBu8OJSDlW5bLgTT5KQ0GFMDOftpEa8t/3GLL20CEZDqDp5xtKQ2+wkZ3kCGltXhkaUm4cGAgKXpvpAWzJ2wbGazRiXbeNcIucgcxruG+MtvrFlMvhZrjhVRO4dwuZuyhqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206929; c=relaxed/simple;
	bh=H4F4fXW8IVEP1W4RpRlj8AR+PZsegR6Ym1A0cP7rrSU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ajjNFjOFq0X43KJhMDtuLwLWwRpn2z93gMZtsz/Bm0xq4epxsUD7J+WHo3PmYzxxm19t+vXO9zPndyIexfMG/4PGKm5Mvtms9GLTPFmwBITJFPIKO+MiiseUvlW8cD5f65a3whtnAUBY/0Ioq8HU6Q4YNyRGk/CySnJRtRC6844=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLlDRao4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE78C116C6;
	Fri, 27 Feb 2026 15:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772206929;
	bh=H4F4fXW8IVEP1W4RpRlj8AR+PZsegR6Ym1A0cP7rrSU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BLlDRao44Ywr3A4nFRYO7rd7oo2MtJb9RXIjuWtGBWq4TaghxWJHvvufLzFdpkV7b
	 V0AvDcyGbm7BpUOY1wo8kR4ZYql6dgNOez4mj+ODfJuLCSnXnYQsJvxTBgg0a8sr0m
	 A8YFryBSAGl8jyVAA3RD1GBzbcFYyN3hSAUyp5rYGMgeqYEyHQBTwBlOsnoFezCymw
	 sL6f7oKz4tlCjDIAXS1Opc6tb/dSLy9v0uczAf+gvgRdXtvx1keOfImKNDhb9V+eH5
	 LtJogS/GP7mCRGEJJ2l4m/+aCbNRfq2uaf0kwn02o27ZiBLdkDY+sOliPqQt+/G2ie
	 gtKqn11bvSNUw==
Date: Fri, 27 Feb 2026 09:42:08 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: iommu@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Will Deacon <will@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Saravana Kannan <saravanak@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, linux-media@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-arm-msm@vger.kernel.org, 
 Hans Verkuil <hverkuil@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
Message-Id: <177220692821.4084988.9709880172251199727.robh@kernel.org>
Subject: Re: [PATCH v2 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53731-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,1c00000:email,0.30.132.128:email,devicetree.org:url]
X-Rspamd-Queue-Id: 37CEB1BA264
X-Rspamd-Action: no action


On Fri, 27 Feb 2026 19:41:17 +0530, Vikash Garodia wrote:
> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> compared to previous generation, iris3x, it has,
> - separate power domains for stream and pixel processing hardware blocks
>   (bse and vpp).
> - additional power domain for apv codec.
> - power domains for individual pipes (VPPx).
> - different clocks and reset lines.
> 
> iommu-map include all the different stream-ids which can be possibly
> generated by vpu4 hardware as below,
> bitstream stream from vcodec
> non-pixel stream from vcodec
> non-pixel stream from tensilica
> pixel stream from vcodec
> secure bitstream stream from vcodec
> secure non-pixel stream from vcodec
> secure non-pixel stream from tensilica
> secure pixel stream from vcodec
> firmware stream from tensilica (might be handled by the TZ / hyp)
> 
> This patch is depend on the below dt-schema patch.
> Link: https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-iris.yaml        | 261 +++++++++++++++++++++
>  include/dt-bindings/media/qcom,iris.h              |  18 ++
>  2 files changed, 279 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdm845.example.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 4294967295, 7184, 1, 256, 4294967295, 7185, 1, 512, 4294967295, 7186, 1, 768, 4294967295, 7187, 1, 1024, 4294967295, 7188, 1, 1280, 4294967295, 7189, 1, 1536, 4294967295, 7190, 1, 1792, 4294967295, 7191, 1, 2048, 4294967295, 7192, 1, 2304, 4294967295, 7193, 1, 2560, 4294967295, 7194, 1, 2816, 4294967295, 7195, 1, 3072, 4294967295, 7196, 1, 3328, 4294967295, 7197, 1, 3584, 4294967295, 7198, 1, 3840, 4294967295, 7199, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sdm845.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdm845.example.dtb: pcie@1c00000 (qcom,pcie-sdm845): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'vddpe-3v3-supply', 'wake-gpios' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sdm845.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdm845.example.dtb: pcie@1c00000 (qcom,pcie-sdm845): iommu-map:0: [0, 4294967295, 7184, 1, 256, 4294967295, 7185, 1, 512, 4294967295, 7186, 1, 768, 4294967295, 7187, 1, 1024, 4294967295, 7188, 1, 1280, 4294967295, 7189, 1, 1536, 4294967295, 7190, 1, 1792, 4294967295, 7191, 1, 2048, 4294967295, 7192, 1, 2304, 4294967295, 7193, 1, 2560, 4294967295, 7194, 1, 2816, 4294967295, 7195, 1, 3072, 4294967295, 7196, 1, 3328, 4294967295, 7197, 1, 3584, 4294967295, 7198, 1, 3840, 4294967295, 7199, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.example.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:0: [0, 4294967295, 512, 1, 256] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sdx55.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.example.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:1:0: 4294967295 is greater than the maximum of 65535
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sdx55.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.example.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:1: [4294967295, 513, 1, 512, 4294967295] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sdx55.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.example.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:2:3: 4294967295 is greater than the maximum of 65536
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sdx55.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.example.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:2: [514, 1, 768, 4294967295, 515] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sdx55.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.example.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:3: [1, 1024, 4294967295, 516, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sdx55.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.example.dtb: pcie@1c00000 (qcom,pcie-sdx55): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sdx55.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.example.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:0: [0, 4294967295, 512, 1, 256] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.example.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:1:0: 4294967295 is greater than the maximum of 65535
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.example.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:1: [4294967295, 513, 1, 512, 4294967295] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.example.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:2:3: 4294967295 is greater than the maximum of 65536
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.example.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:2: [514, 1, 768, 4294967295, 515] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.example.dtb: pcie@1c00000 (qcom,pcie-sdx55): iommu-map:3: [1, 1024, 4294967295, 516, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:0: [256, 4294967295, 6468, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:1: [257, 4294967295, 6464, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:2: [257, 4294967295, 6688, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:3: [258, 4294967295, 6467, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:4: [512, 4294967295, 6470, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:5: [513, 4294967295, 6465, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:6: [513, 4294967295, 6689, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:7: [514, 4294967295, 6469, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:8: [768, 4294967295, 6690, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


