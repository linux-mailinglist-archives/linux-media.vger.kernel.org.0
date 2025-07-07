Return-Path: <linux-media+bounces-36931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F11C1AFA9D4
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 04:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D19467AC9D8
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 02:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC461DF72C;
	Mon,  7 Jul 2025 02:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fo8RjBOo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6991D88A4;
	Mon,  7 Jul 2025 02:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751856372; cv=none; b=Oh1FYm56iCqYekvQOQOLkEQ4Lgg2GpTJwLHI8tnjQUUR+9TzmOp8qJ1ZGdvbDZzXaYcehrDyC52JRo9kh+3Fafta67p2MOmVjwHXRN/Jvii1bEaGn7FP/xWzDRuJPkcjT1IYyrdPhllIW6Nf54zF/jPV0j5nQ8b7+Xvqa6irLV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751856372; c=relaxed/simple;
	bh=O5Hgio/Vaz/6ZdJwy0hkNl7oxxg8G5TC6RUvMsPIFUA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kUE/n/z0JCuO6GlizXkuP0s9Dc4nkamPSVjMod+vKf3qpCFLQj8fWg6vGn33w6RcpDdPhffJ38TBFLN5Qt8OyNZaPTKCqDKft1DGJkALTPMQnxvkkAQwtSdGWJ6UdW0aCYn9qtzaNYSEUttGLwzmtczbSf3z2rLDWLGZoVJsCqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fo8RjBOo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28B6C4CEED;
	Mon,  7 Jul 2025 02:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751856371;
	bh=O5Hgio/Vaz/6ZdJwy0hkNl7oxxg8G5TC6RUvMsPIFUA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=fo8RjBOobJRrYc4Lf7R7KggYpJShs6u7PMCzEYwrqSjyzrRMBvvYwBQgQQuvB5KAG
	 cRMUpyKTsmYqIDOZ4fWd0Fmp/G4afWnzNy449hJpi75rkrvOJMUPei+QNW3qWgNrUM
	 BSVNNMDd0Sb8lhPhlAtKNGuvNvKHK2L6l1YW9jHSszuIdPDZypSHF6MhXKOcDaSj58
	 BS+W3zpHQGygncpQI9P+fCUCejWYTXqBlceCDjYjfzItb3n1qSwF5TABO4TQmm9xrL
	 ActNbr10rb4pBhqBMWg5JHlcgBQez4WLFnlL+miIMTeKmoNA2kkw6V+rl10roYGnta
	 PSWkE7juESRRA==
Date: Sun, 06 Jul 2025 21:46:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel@lists.freedesktop.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: shangyao lin <shangyao.lin@mediatek.com>
In-Reply-To: <20250707013154.4055874-3-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-3-shangyao.lin@mediatek.com>
Message-Id: <175185636571.997426.15392435248406197474.robh@kernel.org>
Subject: Re: [PATCH v2 02/13] dt-bindings: media: mediatek: add seninf-core
 binding


On Mon, 07 Jul 2025 09:31:43 +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> 1. Add camera isp7x module device document
> 
> ---
> 
> Changes in v2:
>   - Rename binding file to mediatek,mt8188-seninf-core.yaml
>   - Various fixes per review comments
>   - Update maintainers list
> 
> Question for reviewer (CK):
> 
> Hi CK,
> 
> Thank you for your review and suggestions on this patch, especially for providing the reference patch (https://patchwork.kernel.org/project/linux-mediatek/list/?series=874617) and for mentioning in another patch ([V1,02/10] MEDIA: PLATFORM: MEDIATEK: ADD SENINF CONTROLLER) the suggestion to "Move the phy part to phy/mediatek/ folder. You could refer to phy/mediatek/phy-mtk-mipi-csi-0-5.c".
> 
> After reading your comments and the reference patches, my understanding is that only the seninf-core driver should manage all ports internally, and each port corresponds to a PHY. During probe, the driver will parse each port, obtain the corresponding PHY (e.g., devm_phy_get(dev, "csi0"), devm_phy_get(dev, "csi1"), etc.), and operate the PHY for each port individually during stream on/off or power on/off.
> 
> Could you please confirm if my understanding is correct?
> If you have any additional reference patches or examples, I would greatly appreciate it.
> 
> Thank you for your guidance!
> 
> Best regards,
> Shangyao
> 
> Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
> ---
>  .../mediatek/mediatek,mt8188-seninf-core.yaml | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml:6:10: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml:121:4: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml: properties:clock-names: {'items': [{'const': 'clk_cam_seninf'}, {'const': 'clk_top_seninf'}, {'const': 'clk_top_seninf1'}, {'const': 'clk_top_camtm'}], 'minItems': 4, 'maxItems': 4} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml: properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'clk_cam_seninf'}, {'const': 'clk_top_seninf'}, {'const': 'clk_top_seninf1'}, {'const': 'clk_top_camtm'}] is too long
	[{'const': 'clk_cam_seninf'}, {'const': 'clk_top_seninf'}, {'const': 'clk_top_seninf1'}, {'const': 'clk_top_camtm'}] is too short
	False schema does not allow 4
	1 was expected
	4 is greater than the maximum of 2
	4 is greater than the maximum of 3
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml: properties:reg-names: {'items': [{'const': 'base'}], 'minItems': 1, 'maxItems': 1} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml: properties:reg-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'base'}] is too short
	False schema does not allow 1
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml: properties:reg: 'anyOf' conditional failed, one must be fixed:
	'minItems' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	1 is less than the minimum of 2
		hint: Arrays must be described with a combination of minItems/maxItems/items
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.example.dtb: seninf@16010000 (mediatek,mt8188-seninf-core): reg: [[0, 369164288], [0, 32768]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250707013154.4055874-3-shangyao.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


