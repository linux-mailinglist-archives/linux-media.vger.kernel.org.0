Return-Path: <linux-media+bounces-55721-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G2HBxgwtGmuigAAu9opvQ
	(envelope-from <linux-media+bounces-55721-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:41:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C2242286365
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 843F930F6CEA
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8793B3BF7;
	Fri, 13 Mar 2026 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkUd8MjI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B407F3B0AC9;
	Fri, 13 Mar 2026 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773416042; cv=none; b=csmcZgcAoEYNRdtpUQUnjCM/8XU8kiPs1wB8iIj17WLm3UFNTMU7nSaYAb6ygCF+2ycS+E6H2GNo8KO6r8wMfvzo2wCVJIjKoHPBk70hQsXyO5ti+gdzyP/i78ie9tFcAdE7Hr36nqj2Hoeau5S3ARTSMzBJmBRfOC356oM6+3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773416042; c=relaxed/simple;
	bh=n0oryTkKXXG30HHv4vKKPbziF7Oijm4Me1JDK+7BI38=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=RdXJKJId1Zm6Z+60rLkiRdxd04frVe/MweXDe/eji6vWNapihLTnnM2fGD9s++E6pcfGaEWs2HYwwTZvhq+h1VsZmlju4aG+DTCOmFFFbQI/BFKl/FhuwSne2rTX/RCiLBiyvp1kfu2QPuVpjNda7B9K+DJ+EOLaksyk4bk/uz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkUd8MjI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D152C19425;
	Fri, 13 Mar 2026 15:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773416042;
	bh=n0oryTkKXXG30HHv4vKKPbziF7Oijm4Me1JDK+7BI38=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KkUd8MjI+K3gw7jPy8lZlNK/xn0txUqaLiCJRZ38sPsEjJCjh2kLOaUoAvvK20i+G
	 vbOpy8dVLlxYWBz1EHywIJZCL8xMTbtNE1+8RDYWare6spxDCD7KSaKSmKutOJe96N
	 EPngX7ZTkx/MDg9eXvz6Mbz/+IjoOtT5MjSnBuYqpFdlxRF/jDPkw4C8BN9wynORLW
	 8xyyLvukqtHZ645JNxWmuy3aKtYUhK0GUR1mJHxcAjvsX1zcdC8G10rxwuS1wcumm6
	 G/QdT9kRVvfcnFv7J0Xc6U1cCD33EJJjA8mRvkyQbvIDrR+5DKRXwoUnoD0e6Nor9a
	 3DnZYsPKTP/Mg==
Date: Fri, 13 Mar 2026 10:34:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Will Deacon <will@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>, 
 iommu@lists.linux.dev, Bryan O'Donoghue <bod@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, 
 Joerg Roedel <joro@8bytes.org>, Saravana Kannan <saravanak@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, devicetree@vger.kernel.org
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com>
Message-Id: <177341604120.2395180.12059531482894091898.robh@kernel.org>
Subject: Re: [PATCH v3 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55721-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.30.132.128:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1c00000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,devicetree.org:url,0.0.0.0:email]
X-Rspamd-Queue-Id: C2242286365
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 13 Mar 2026 18:49:35 +0530, Vikash Garodia wrote:
> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> compared to previous generation, iris3x, it has,
> - separate power domains for stream and pixel processing hardware blocks
>   (bse and vpp).
> - additional power domain for apv codec.
> - power domains for individual pipes (VPPx).
> - different clocks and reset lines.
> 
> This patch depends on
> https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
> 
> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-iris.yaml        | 254 +++++++++++++++++++++
>  include/dt-bindings/media/qcom,kaanapali-iris.h    |  18 ++
>  2 files changed, 272 insertions(+)
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
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:0: [0, 4294967295, 6468, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:1: [1, 4294967295, 6464, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:2: [1, 4294967295, 6688, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:3: [2, 4294967295, 6467, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:4: [3, 4294967295, 6470, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:5: [4, 4294967295, 6465, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:6: [4, 4294967295, 6689, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:7: [5, 4294967295, 6469, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.example.dtb: video-codec@2000000 (qcom,kaanapali-iris): iommu-map:8: [6, 4294967295, 6690, 0, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


