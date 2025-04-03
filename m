Return-Path: <linux-media+bounces-29331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBB1A7A557
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 16:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72A083A6C0E
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 14:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3814524EF8B;
	Thu,  3 Apr 2025 14:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aR2eCKYW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9360124EF80;
	Thu,  3 Apr 2025 14:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690933; cv=none; b=eiKaxtZO6rmZz38/HUGRTT/fgcD5ov38zD6AJPsp0HGvyV/3eJ4vGCI5QG43acHk/2JCaCtIE9MUGpAZltniIuhkPK5DbnjyJiyabFhE1GBP1D90LLa0sxMSq8mLyjkXRiyUSl6JUlKSx6nOT92RTJRh3TOrX2TcLgipCUOhSmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690933; c=relaxed/simple;
	bh=clMVZUg7aCr+NLtc+S3LZyI+5cu7m6OvVqqIogY95n8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=BvpaZTZICfnHY9WcO4ilDeC+6QLLu3hrwyWQfB0ukrWyIcNIz6ZuCSbqOsvwkfAY+Mhb92n2cBZoAmnCt/zW2eobGhm6PXR+zMyw0/WzS0m26HRp/qfWEeFf1pbSYEH6wx9zc+vh/EiNpwxq1G4WIh4SR9knhyUhlSFgwbwb0a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aR2eCKYW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E180BC4CEE7;
	Thu,  3 Apr 2025 14:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743690933;
	bh=clMVZUg7aCr+NLtc+S3LZyI+5cu7m6OvVqqIogY95n8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aR2eCKYWqx5ayDSWmvE0vxYepUcrgLBeCnS9cIvGjXbHgppnW4SxtTNIzXiUQan/Q
	 VTL1hg/RJE9aTF6y5UR/rmznPWGYAc7h0MXPHjaK2yzCU0sxOk5220aGMqE+6VJy0V
	 ZuM2bSXzWTdE1DRgNymiy9VL5Yf8qB3QA2cmok7vlU88OmoyOKg4VdLE/Qm4jITOAF
	 odaeVsQMRDt5a7Dk3e6jsE5eGmM/IjSg7/Z/lh2elUV+jJvYA3R07dWz6VsestSlcG
	 MR4mKg949sC8PniPeFnAc72TiYKyE12tAcL5oPeHQ5AXefSc+ScyD1oIJIhWoKElps
	 ljIVpTMqORryw==
Date: Thu, 03 Apr 2025 09:35:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 mtk29348 <Bo.Kong@mediatek.com>, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Teddy.Chen@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 zhaoyuan.chen@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: "bo.kong" <bo.kong@mediatek.com>
In-Reply-To: <20250403074005.21472-1-bo.kong@mediatek.com>
References: <20250403074005.21472-1-bo.kong@mediatek.com>
Message-Id: <174369066367.2789561.14328496849433879876.robh@kernel.org>
Subject: Re: [PATCH v5 0/4] Add AIE driver support for mt8188


On Thu, 03 Apr 2025 15:38:32 +0800, bo.kong wrote:
> From: Bo Kong <Bo.Kong@mediatek.com>
> 
> AIE(AI Engine) is one of the units in mt8188 ISP which provides hardware accelerated face detection function, it can detect different sizes of faces in a raw image.
> 
> Bo Kong (4):
>   media: dt-bindings: add MT8188 AIE
>   arm64: dts: mt8188: add aie node
>   uapi: linux: add MT8188 AIE
>   media: mediatek: add MT8188 AIE driver
> 
>  .../bindings/media/mediatek,mt8188-aie.yaml   |   78 +
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi      |   33 +
>  drivers/media/platform/mediatek/Kconfig       |    1 +
>  drivers/media/platform/mediatek/Makefile      |    1 +
>  drivers/media/platform/mediatek/aie/Kconfig   |   12 +
>  drivers/media/platform/mediatek/aie/Makefile  |    5 +
>  drivers/media/platform/mediatek/aie/mtk_aie.h |  870 ++++++
>  .../media/platform/mediatek/aie/mtk_aie_drv.c | 2398 +++++++++++++++++
>  .../platform/mediatek/aie/mtk_aie_v4l2.c      | 1295 +++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    3 +
>  include/uapi/linux/mtk_aie_v4l2_controls.h    |  308 +++
>  include/uapi/linux/videodev2.h                |    6 +
>  12 files changed, 5010 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
>  create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
>  create mode 100644 drivers/media/platform/mediatek/aie/Makefile
>  create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
>  create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
>  create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_v4l2.c
>  create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h
> 
> --
> 2.45.2
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250403 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250403074005.21472-1-bo.kong@mediatek.com:

arch/arm64/boot/dts/mediatek/mt8188.dtsi:2359.25-2370.5: ERROR (phandle_references): /soc/larb@15340000: Reference to non-existent node or label "smi_img1"
ERROR: Input tree has errors, aborting (use -f to force output)
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb] Error 2
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/mediatek] Error 2
make[2]: Target 'arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: mediatek/mt8188-geralt-ciri-sku4.dtb] Error 2
arch/arm64/boot/dts/mediatek/mt8188.dtsi:2359.25-2370.5: ERROR (phandle_references): /soc/larb@15340000: Reference to non-existent node or label "smi_img1"
ERROR: Input tree has errors, aborting (use -f to force output)
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb] Error 2
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/mediatek] Error 2
make[2]: Target 'arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: mediatek/mt8370-genio-510-evk.dtb] Error 2
arch/arm64/boot/dts/mediatek/mt8188.dtsi:2359.25-2370.5: ERROR (phandle_references): /soc/larb@15340000: Reference to non-existent node or label "smi_img1"
ERROR: Input tree has errors, aborting (use -f to force output)
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb] Error 2
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/mediatek] Error 2
make[2]: Target 'arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: mediatek/mt8390-genio-700-evk.dtb] Error 2
arch/arm64/boot/dts/mediatek/mt8188.dtsi:2359.25-2370.5: ERROR (phandle_references): /soc/larb@15340000: Reference to non-existent node or label "smi_img1"
ERROR: Input tree has errors, aborting (use -f to force output)
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb] Error 2
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/mediatek] Error 2
make[2]: Target 'arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: mediatek/mt8188-geralt-ciri-sku1.dtb] Error 2
arch/arm64/boot/dts/mediatek/mt8188.dtsi:2359.25-2370.5: ERROR (phandle_references): /soc/larb@15340000: Reference to non-existent node or label "smi_img1"
ERROR: Input tree has errors, aborting (use -f to force output)
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb] Error 2
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/mediatek] Error 2
make[2]: Target 'arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: mediatek/mt8188-geralt-ciri-sku7.dtb] Error 2
arch/arm64/boot/dts/mediatek/mt8188.dtsi:2359.25-2370.5: ERROR (phandle_references): /soc/larb@15340000: Reference to non-existent node or label "smi_img1"
ERROR: Input tree has errors, aborting (use -f to force output)
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb] Error 2
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/mediatek] Error 2
make[2]: Target 'arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: mediatek/mt8188-geralt-ciri-sku3.dtb] Error 2
arch/arm64/boot/dts/mediatek/mt8188.dtsi:2359.25-2370.5: ERROR (phandle_references): /soc/larb@15340000: Reference to non-existent node or label "smi_img1"
ERROR: Input tree has errors, aborting (use -f to force output)
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/mediatek/mt8188-evb.dtb] Error 2
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/mediatek] Error 2
make[2]: Target 'arch/arm64/boot/dts/mediatek/mt8188-evb.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: mediatek/mt8188-evb.dtb] Error 2
arch/arm64/boot/dts/mediatek/mt8188.dtsi:2359.25-2370.5: ERROR (phandle_references): /soc/larb@15340000: Reference to non-existent node or label "smi_img1"
ERROR: Input tree has errors, aborting (use -f to force output)
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb] Error 2
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/mediatek] Error 2
make[2]: Target 'arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: mediatek/mt8188-geralt-ciri-sku6.dtb] Error 2
arch/arm64/boot/dts/mediatek/mt8188.dtsi:2359.25-2370.5: ERROR (phandle_references): /soc/larb@15340000: Reference to non-existent node or label "smi_img1"
ERROR: Input tree has errors, aborting (use -f to force output)
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb] Error 2
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/mediatek] Error 2
make[2]: Target 'arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: mediatek/mt8188-geralt-ciri-sku0.dtb] Error 2
arch/arm64/boot/dts/mediatek/mt8188.dtsi:2359.25-2370.5: ERROR (phandle_references): /soc/larb@15340000: Reference to non-existent node or label "smi_img1"
ERROR: Input tree has errors, aborting (use -f to force output)
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb] Error 2
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/mediatek] Error 2
make[2]: Target 'arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: mediatek/mt8188-geralt-ciri-sku2.dtb] Error 2
arch/arm64/boot/dts/mediatek/mt8188.dtsi:2359.25-2370.5: ERROR (phandle_references): /soc/larb@15340000: Reference to non-existent node or label "smi_img1"
ERROR: Input tree has errors, aborting (use -f to force output)
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb] Error 2
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/mediatek] Error 2
make[2]: Target 'arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: mediatek/mt8188-geralt-ciri-sku5.dtb] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'mediatek/mt8183-pumpkin.dtb' not remade because of errors.
make: Target 'mediatek/mt6797-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-kodama-sku16.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-fennel14.dtb' not remade because of errors.
make: Target 'mediatek/mt8395-genio-1200-evk.dtb' not remade because of errors.
make: Target 'mediatek/mt7986a-bananapi-bpi-r3.dtb' not remade because of errors.
make: Target 'mediatek/mt8173-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt7986b-rfb.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-tentacruel-sku262144.dtb' not remade because of errors.
make: Target 'mediatek/mt8195-cherry-tomato-r2.dtb' not remade because of errors.
make: Target 'mediatek/mt7981b-openwrt-one.dtb' not remade because of errors.
make: Target 'mediatek/mt8173-elm.dtb' not remade because of errors.
make: Target 'mediatek/mt7622-rfb1.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-damu.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-tentacool-sku327681.dtb' not remade because of errors.
make: Target 'mediatek/mt6779-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku4.dtb' not remade because of errors.
make: Target 'mediatek/mt8173-elm-hana-rev7.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-starmie-sku1.dtb' not remade because of errors.
make: Target 'mediatek/mt8370-genio-510-evk.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-kenzo.dtb' not remade because of errors.
make: Target 'mediatek/mt2712-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-tentacool-sku327683.dtb' not remade because of errors.
make: Target 'mediatek/mt7981b-cudy-wr3000-v1.dtb' not remade because of errors.
make: Target 'mediatek/mt8192-asurada-hayato-r1.dtb' not remade because of errors.
make: Target 'mediatek/mt8390-genio-700-evk.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb' not remade because of errors.
make: Target 'mediatek/mt8395-kontron-3-5-sbc-i1200.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-pico6.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku1.dtb' not remade because of errors.
make: Target 'mediatek/mt8195-demo.dtb' not remade because of errors.
make: Target 'mediatek/mt8173-elm-hana.dtb' not remade because of errors.
make: Target 'mediatek/mt6755-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-chinchou-sku16.dtb' not remade because of errors.
make: Target 'mediatek/mt8192-asurada-spherion-r0.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-chinchou-sku0.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-kodama-sku32.dtb' not remade because of errors.
make: Target 'mediatek/mt7622-bananapi-bpi-r64.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-chinchou-sku1.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-voltorb-sku589825.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-magneton-sku393218.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku7.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-magneton-sku393216.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku3.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb' not remade because of errors.
make: Target 'mediatek/mt6797-x20-dev.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-cozmo.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-krane-sku0.dtb' not remade because of errors.
make: Target 'mediatek/mt8365-evk.dtb' not remade because of errors.
make: Target 'mediatek/mt8195-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8395-radxa-nio-12l.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-steelix-sku131073.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-voltorb-sku589824.dtb' not remade because of errors.
make: Target 'mediatek/mt7988a-bananapi-bpi-r4.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-starmie-sku0.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-burnet.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku6.dtb' not remade because of errors.
make: Target 'mediatek/mt7986a-acelink-ew-7886cax.dtb' not remade because of errors.
make: Target 'mediatek/mt8516-pumpkin.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-kakadu-sku22.dtb' not remade because of errors.
make: Target 'mediatek/mt7986a-rfb.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-kodama-sku288.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-krane-sku176.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku0.dtb' not remade because of errors.
make: Target 'mediatek/mt6795-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-tentacruel-sku262148.dtb' not remade because of errors.
make: Target 'mediatek/mt8167-pumpkin.dtb' not remade because of errors.
make: Target 'mediatek/mt7981b-xiaomi-ax3000t.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku2.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-steelix-sku131072.dtb' not remade because of errors.
make: Target 'mediatek/mt8195-cherry-dojo-r1.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-kappa.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-kakadu.dtb' not remade because of errors.
make: Target 'mediatek/mt7986a-bananapi-bpi-r3-mini.dtb' not remade because of errors.
make: Target 'mediatek/mt6795-sony-xperia-m5.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-magneton-sku393217.dtb' not remade because of errors.
make: Target 'mediatek/mt8192-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8195-cherry-tomato-r3.dtb' not remade because of errors.
make: Target 'mediatek/mt8195-cherry-tomato-r1.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-katsu-sku32.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-katsu-sku38.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku5.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-rusty-sku196608.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-pico.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-kodama-sku272.dtb' not remade because of errors.






