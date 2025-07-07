Return-Path: <linux-media+bounces-36932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A428AFA9D3
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 04:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B36461789E4
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 02:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBF71E3DF2;
	Mon,  7 Jul 2025 02:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A32APTP8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657A11E0B91;
	Mon,  7 Jul 2025 02:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751856373; cv=none; b=iOY/5m1AVgvW9BaGwUwzhz8riyzvZoVjzfa9xkt6YeXZtT198qfhMwEGOVJvgxAaPjkLQto1x7cvsqQZpC+u3hNJ2Zrig8CrkuGwCro0NXkH2A7e8uJ7nMMtW/qyqSCAFEZcb7aqzZUYqxwbxAE7VlttJ8qfag+B8IXOqKz1wqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751856373; c=relaxed/simple;
	bh=7PYgJSXdMi4aGcKW4ofsObuc+McUS8R+eLPSagoqZzk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=XviqfL7t2jgFoF2wWLyyvlIcOcG5zffhzF6omOm/dVv1aHvipMYpA1fRk+CtMiYJdzgkzvvCs3tCAGmqkBmnuXsWy5TJAArN3YkuQOGlbgO6yz/jA9CyHVhIj6xyuxiWZ0XHd9AA0gqXaGYhgUNJsTCElT0EesMBJNbxDaMekyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A32APTP8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFAA5C4CEEE;
	Mon,  7 Jul 2025 02:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751856372;
	bh=7PYgJSXdMi4aGcKW4ofsObuc+McUS8R+eLPSagoqZzk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=A32APTP8IrKq/W/k2xX2mx39uvN7T1T8ErjSBQljGCCkUyM+yQeQAeGPG4F7q/7lP
	 ULdDtIeznXFM0cnCHP69UQSjgJmKquOsiAssj9AI+hCrZ985poM3T+uNZeG+/9auvG
	 c1US5grvRUS7brbkfcQkD9o1Wzr7/bF/AAf9amUe6V1+HPbujYnbzXmaeedKnj1+Dl
	 7aDCr7YlV2Ho5H7rMKXxFOywiEFgbDbJYeIV+4tH2bUCaPbEp/RMqWwJ+m+bSpPQhx
	 mGMRNU4bhT0xLiwGNq2NlMoLC4bYh4at6bRmVb+H9Plc3ssIHRpK24ilBmmMuKhhF7
	 AfgAbYaEOb/wQ==
Date: Sun, 06 Jul 2025 21:46:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-arm-kernel@lists.infradead.org
To: shangyao lin <shangyao.lin@mediatek.com>
In-Reply-To: <20250707013154.4055874-4-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-4-shangyao.lin@mediatek.com>
Message-Id: <175185636753.997469.8719246747333010338.robh@kernel.org>
Subject: Re: [PATCH v2 03/13] dt-bindings: media: mediatek: add cam-raw
 binding


On Mon, 07 Jul 2025 09:31:44 +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> Add camera isp7x module device document.
> 
> ---
> 
> Changes in v2:
>   - Rename binding file to mediatek,mt8188-cam-raw.yaml
>   - Various fixes per review comments
>   - Update maintainers list
> 
> Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
> ---
>  .../mediatek/mediatek,mt8188-cam-raw.yaml     | 156 ++++++++++++++++++
>  1 file changed, 156 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.yaml:156:4: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.yaml: properties:clock-names: {'items': [{'const': 'camsys_cam2mm0_cgpdn'}, {'const': 'camsys_cam2mm1_cgpdn'}, {'const': 'camsys_cam2sys_cgpdn'}, {'const': 'camsys_cam_cgpdn'}, {'const': 'camsys_camtg_cgpdn'}, {'const': 'camsys_rawa_larbx_cgpdn'}, {'const': 'camsys_rawa_cam_cgpdn'}, {'const': 'camsys_rawa_camtg_cgpdn'}, {'const': 'topckgen_top_cam'}, {'const': 'topckgen_top_camtg'}, {'const': 'topckgen_top_camtm'}], 'minItems': 4, 'maxItems': 16, 'description': 'Names of the clocks, must match the order of the clocks property.'} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.yaml: properties:reg-names: {'items': [{'const': 'base'}, {'const': 'inner_base'}], 'minItems': 1, 'maxItems': 2, 'description': 'Names for each register region. Must be "base" and optionally "inner_base".'} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-raw.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.yaml
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dts:33.13-34.43: Warning (reg_format): /example-0/soc/raw@16030000:reg: property has invalid length (32 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dts:37.13-59: Warning (dma_ranges_format): /example-0/soc/raw@16030000:dma-ranges: "dma-ranges" property has invalid length (24 bytes) (parent #address-cells == 2, child #address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dts:31.24-78.13: Warning (avoid_default_addr_size): /example-0/soc/raw@16030000: Relying on default #address-cells value
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dts:31.24-78.13: Warning (avoid_default_addr_size): /example-0/soc/raw@16030000: Relying on default #size-cells value
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: raw@16030000 (mediatek,mt8188-cam-raw): dma-ranges: [[2], [0], [0], [1073741824], [1], [0]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-raw.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.example.dtb: raw@16030000 (mediatek,mt8188-cam-raw): reg: [[0, 369295360], [0, 32768], [0, 369328128], [0, 32768]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-raw.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250707013154.4055874-4-shangyao.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


