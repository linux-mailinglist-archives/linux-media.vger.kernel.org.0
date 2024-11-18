Return-Path: <linux-media+bounces-21501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 665D69D0B29
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 09:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A44A2B222AD
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 08:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AE11714B7;
	Mon, 18 Nov 2024 08:44:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C325342A8F
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731919453; cv=none; b=G0x9PtKy9+61p9ZdeICc99+ljYSnU0KvLHESHExpBMvAKiaOMXHUdgGURgULphlFWvx7Ul3XSsPBllpL7LOVuzis0aUM/OR1slmAH62rOD0WyPB5BUf8TmR+2myRhik5Pdq3ds8SgwU+55T9OkQr7yKXnMjlmeGZmaOzQSxLTqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731919453; c=relaxed/simple;
	bh=gh0A0rwtkGz/vL4L9fDN9DxTKMTkUPLostrjoe07mAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jtZpoa8B1APfoDPeRd+h4j3zxs3RlR5nt45iLrIjE/cpv4pB8lXFUJlbx/G1MKh1exqjrNoZFV+XvrwASWo3KkR9Qh8fmp4B5AdB5gPEe5Eivd5rY9grkt6ZhWJRdIORtvqAA8GUk/PYMJ6Nx778jwBz8QNTkfdrZjlu8htNA/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D08C4CECC;
	Mon, 18 Nov 2024 08:44:12 +0000 (UTC)
Message-ID: <9cc4e898-534c-45d2-8168-59c5fac8723f@xs4all.nl>
Date: Mon, 18 Nov 2024 09:44:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fw: [PATCH 1/2] MAINTAINERS: update location of media main tree
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, patchwork@linuxtv.org,
 linux-media@vger.kernel.org
References: <20241118092448.0f263340@foz.lan>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241118092448.0f263340@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/11/2024 09:24, Mauro Carvalho Chehab wrote:
> 
> 
> Forwarded message:
> 
> Date: Mon, 18 Nov 2024 07:09:18 +0100
> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> To: 
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
> Subject: [PATCH 1/2] MAINTAINERS: update location of media main tree
> 
> 
> There were some recent changes on the way we're handling
> media patches. Now, the official tree is located at:
> 
> 	https://git.linuxtv.org/media.git/
> 
> Update it at MAINTAINERS file.

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

Regards,

	Hans

> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  MAINTAINERS | 332 ++++++++++++++++++++++++++--------------------------
>  1 file changed, 166 insertions(+), 166 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b599693deb13..aab0827938b6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -701,7 +701,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/radio-aimslab*
>  
>  AIO
> @@ -809,7 +809,7 @@ ALLWINNER A10 CSI DRIVER
>  M:	Maxime Ripard <mripard@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
>  F:	drivers/media/platform/sunxi/sun4i-csi/
>  
> @@ -818,7 +818,7 @@ M:	Yong Deng <yong.deng@magewell.com>
>  M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
>  F:	drivers/media/platform/sunxi/sun6i-csi/
>  
> @@ -826,7 +826,7 @@ ALLWINNER A31 ISP DRIVER
>  M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
>  F:	drivers/staging/media/sunxi/sun6i-isp/
>  F:	drivers/staging/media/sunxi/sun6i-isp/uapi/sun6i-isp-config.h
> @@ -835,7 +835,7 @@ ALLWINNER A31 MIPI CSI-2 BRIDGE DRIVER
>  M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
>  F:	drivers/media/platform/sunxi/sun6i-mipi-csi2/
>  
> @@ -3348,7 +3348,7 @@ ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
>  M:	Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
>  F:	drivers/media/i2c/ak7375.c
>  
> @@ -3765,7 +3765,7 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/usb/dvb-usb-v2/az6007.c
>  
>  AZTECH FM RADIO RECEIVER DRIVER
> @@ -3773,7 +3773,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/radio-aztech*
>  
>  B43 WIRELESS DRIVER
> @@ -3857,7 +3857,7 @@ M:	Fabien Dessenne <fabien.dessenne@foss.st.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/platform/st/sti/bdisp
>  
>  BECKHOFF CX5020 ETHERCAT MASTER DRIVER
> @@ -4865,7 +4865,7 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Odd fixes
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/driver-api/media/drivers/bttv*
>  F:	drivers/media/pci/bt8xx/bttv*
>  
> @@ -4979,13 +4979,13 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/radio-cadet*
>  
>  CAFE CMOS INTEGRATED CAMERA CONTROLLER DRIVER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/admin-guide/media/cafe_ccic*
>  F:	drivers/media/platform/marvell/
>  
> @@ -5169,7 +5169,7 @@ M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	http://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/ABI/testing/debugfs-cec-error-inj
>  F:	Documentation/devicetree/bindings/media/cec/cec-common.yaml
>  F:	Documentation/driver-api/media/cec-core.rst
> @@ -5186,7 +5186,7 @@ M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	http://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
>  F:	drivers/media/cec/platform/cec-gpio/
>  
> @@ -5393,7 +5393,7 @@ CHRONTEL CH7322 CEC DRIVER
>  M:	Joe Tessler <jrt@google.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
>  F:	drivers/media/cec/i2c/ch7322.c
>  
> @@ -5582,7 +5582,7 @@ M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/pci/cobalt/
>  
>  COCCINELLE/Semantic Patches (SmPL)
> @@ -6026,7 +6026,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Odd Fixes
>  W:	http://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/cs3308.c
>  
>  CS5535 Audio ALSA driver
> @@ -6057,7 +6057,7 @@ M:	Andy Walls <awalls@md.metrocast.net>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/pci/cx18/
>  F:	include/uapi/linux/ivtv*
>  
> @@ -6066,7 +6066,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/common/cx2341x*
>  F:	include/media/drv-intf/cx2341x.h
>  
> @@ -6084,7 +6084,7 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Odd fixes
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/driver-api/media/drivers/cx88*
>  F:	drivers/media/pci/cx88/
>  
> @@ -6320,7 +6320,7 @@ DEINTERLACE DRIVERS FOR ALLWINNER H3
>  M:	Jernej Skrabec <jernej.skrabec@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml
>  F:	drivers/media/platform/sunxi/sun8i-di/
>  
> @@ -6447,7 +6447,7 @@ M:	Hugues Fruchet <hugues.fruchet@foss.st.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/platform/st/sti/delta
>  
>  DENALI NAND DRIVER
> @@ -6855,7 +6855,7 @@ DONGWOON DW9714 LENS VOICE COIL DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
>  F:	drivers/media/i2c/dw9714.c
>  
> @@ -6863,13 +6863,13 @@ DONGWOON DW9719 LENS VOICE COIL DRIVER
>  M:	Daniel Scally <djrscally@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/dw9719.c
>  
>  DONGWOON DW9768 LENS VOICE COIL DRIVER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
>  F:	drivers/media/i2c/dw9768.c
>  
> @@ -6877,7 +6877,7 @@ DONGWOON DW9807 LENS VOICE COIL DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
>  F:	drivers/media/i2c/dw9807-vcm.c
>  
> @@ -7860,7 +7860,7 @@ DSBR100 USB FM RADIO DRIVER
>  M:	Alexey Klimov <alexey.klimov@linaro.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/dsbr100.c
>  
>  DT3155 MEDIA DRIVER
> @@ -7868,7 +7868,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Odd Fixes
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/pci/dt3155/
>  
>  DVB_USB_AF9015 MEDIA DRIVER
> @@ -7913,7 +7913,7 @@ S:	Maintained
>  W:	https://linuxtv.org
>  W:	http://github.com/mkrufky
>  Q:	http://patchwork.linuxtv.org/project/linux-media/list/
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/usb/dvb-usb/cxusb*
>  
>  DVB_USB_EC168 MEDIA DRIVER
> @@ -8282,7 +8282,7 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/admin-guide/media/em28xx*
>  F:	drivers/media/usb/em28xx/
>  
> @@ -8578,7 +8578,7 @@ EXTRON DA HD 4K PLUS CEC DRIVER
>  M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/cec/usb/extron-da-hd-4k-plus/
>  
>  EXYNOS DP DRIVER
> @@ -9400,7 +9400,7 @@ GALAXYCORE GC2145 SENSOR DRIVER
>  M:	Alain Volmat <alain.volmat@foss.st.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
>  F:	drivers/media/i2c/gc2145.c
>  
> @@ -9448,7 +9448,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/radio-gemtek*
>  
>  GENERIC ARCHITECTURE TOPOLOGY
> @@ -9830,56 +9830,56 @@ GS1662 VIDEO SERIALIZER
>  M:	Charles-Antoine Couret <charles-antoine.couret@nexvision.fr>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/spi/gs1662.c
>  
>  GSPCA FINEPIX SUBDRIVER
>  M:	Frank Zago <frank@zago.net>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/usb/gspca/finepix.c
>  
>  GSPCA GL860 SUBDRIVER
>  M:	Olivier Lorin <o.lorin@laposte.net>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/usb/gspca/gl860/
>  
>  GSPCA M5602 SUBDRIVER
>  M:	Erik Andren <erik.andren@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/usb/gspca/m5602/
>  
>  GSPCA PAC207 SONIXB SUBDRIVER
>  M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Odd Fixes
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/usb/gspca/pac207.c
>  
>  GSPCA SN9C20X SUBDRIVER
>  M:	Brian Johnson <brijohn@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/usb/gspca/sn9c20x.c
>  
>  GSPCA T613 SUBDRIVER
>  M:	Leandro Costantino <lcostantino@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/usb/gspca/t613.c
>  
>  GSPCA USB WEBCAM DRIVER
>  M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Odd Fixes
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/usb/gspca/
>  
>  GTP (GPRS Tunneling Protocol)
> @@ -9996,7 +9996,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Odd Fixes
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/usb/hdpvr/
>  
>  HEWLETT PACKARD ENTERPRISE ILO CHIF DRIVER
> @@ -10503,7 +10503,7 @@ M:	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/platform/st/sti/hva
>  
>  HWPOISON MEMORY FAILURE HANDLING
> @@ -10531,7 +10531,7 @@ HYNIX HI556 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/hi556.c
>  
>  HYNIX HI846 SENSOR DRIVER
> @@ -11502,7 +11502,7 @@ M:	Dan Scally <djrscally@gmail.com>
>  R:	Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
>  F:	drivers/media/pci/intel/ipu3/
>  
> @@ -11523,7 +11523,7 @@ M:	Bingbu Cao <bingbu.cao@intel.com>
>  R:	Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/admin-guide/media/ipu6-isys.rst
>  F:	drivers/media/pci/intel/ipu6/
>  
> @@ -12036,7 +12036,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/radio-isa*
>  
>  ISAPNP
> @@ -12138,7 +12138,7 @@ M:	Andy Walls <awalls@md.metrocast.net>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/admin-guide/media/ivtv*
>  F:	drivers/media/pci/ivtv/
>  F:	include/uapi/linux/ivtv*
> @@ -12286,7 +12286,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/radio-keene*
>  
>  KERNEL AUTOMOUNTER
> @@ -13573,7 +13573,7 @@ MA901 MASTERKIT USB FM RADIO DRIVER
>  M:	Alexey Klimov <alexey.klimov@linaro.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/radio-ma901.c
>  
>  MAC80211
> @@ -13868,7 +13868,7 @@ MAX2175 SDR TUNER DRIVER
>  M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/max2175.txt
>  F:	Documentation/userspace-api/media/drivers/max2175.rst
>  F:	drivers/media/i2c/max2175*
> @@ -14048,7 +14048,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/radio-maxiradio*
>  
>  MAXLINEAR ETHERNET PHY DRIVER
> @@ -14131,7 +14131,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	https://www.linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/mc/
>  F:	include/media/media-*.h
>  F:	include/uapi/linux/media.h
> @@ -14140,7 +14140,7 @@ MEDIA DRIVER FOR FREESCALE IMX PXP
>  M:	Philipp Zabel <p.zabel@pengutronix.de>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/platform/nxp/imx-pxp.[ch]
>  
>  MEDIA DRIVERS FOR ASCOT2E
> @@ -14149,7 +14149,7 @@ L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	https://linuxtv.org
>  W:	http://netup.tv/
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/dvb-frontends/ascot2e*
>  
>  MEDIA DRIVERS FOR CXD2099AR CI CONTROLLERS
> @@ -14157,7 +14157,7 @@ M:	Jasmin Jessich <jasmin@anw.at>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/dvb-frontends/cxd2099*
>  
>  MEDIA DRIVERS FOR CXD2841ER
> @@ -14166,7 +14166,7 @@ L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	https://linuxtv.org
>  W:	http://netup.tv/
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/dvb-frontends/cxd2841er*
>  
>  MEDIA DRIVERS FOR CXD2880
> @@ -14174,7 +14174,7 @@ M:	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	http://linuxtv.org/
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/dvb-frontends/cxd2880/*
>  F:	drivers/media/spi/cxd2880*
>  
> @@ -14182,7 +14182,7 @@ MEDIA DRIVERS FOR DIGITAL DEVICES PCIE DEVICES
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/pci/ddbridge/*
>  
>  MEDIA DRIVERS FOR FREESCALE IMX
> @@ -14190,7 +14190,7 @@ M:	Steve Longerbeam <slongerbeam@gmail.com>
>  M:	Philipp Zabel <p.zabel@pengutronix.de>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/admin-guide/media/imx.rst
>  F:	Documentation/devicetree/bindings/media/imx.txt
>  F:	drivers/staging/media/imx/
> @@ -14204,7 +14204,7 @@ M:	Martin Kepplinger <martin.kepplinger@puri.sm>
>  R:	Purism Kernel Team <kernel@puri.sm>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/admin-guide/media/imx7.rst
>  F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> @@ -14219,7 +14219,7 @@ L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	https://linuxtv.org
>  W:	http://netup.tv/
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/dvb-frontends/helene*
>  
>  MEDIA DRIVERS FOR HORUS3A
> @@ -14228,7 +14228,7 @@ L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	https://linuxtv.org
>  W:	http://netup.tv/
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/dvb-frontends/horus3a*
>  
>  MEDIA DRIVERS FOR LNBH25
> @@ -14237,14 +14237,14 @@ L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	https://linuxtv.org
>  W:	http://netup.tv/
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/dvb-frontends/lnbh25*
>  
>  MEDIA DRIVERS FOR MXL5XX TUNER DEMODULATORS
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/dvb-frontends/mxl5xx*
>  
>  MEDIA DRIVERS FOR NETUP PCI UNIVERSAL DVB devices
> @@ -14253,7 +14253,7 @@ L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	https://linuxtv.org
>  W:	http://netup.tv/
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/pci/netup_unidvb/*
>  
>  MEDIA DRIVERS FOR NVIDIA TEGRA - VDE
> @@ -14261,7 +14261,7 @@ M:	Dmitry Osipenko <digetx@gmail.com>
>  L:	linux-media@vger.kernel.org
>  L:	linux-tegra@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
>  F:	drivers/media/platform/nvidia/tegra-vde/
>  
> @@ -14270,7 +14270,7 @@ M:	Jacopo Mondi <jacopo@jmondi.org>
>  L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/renesas,ceu.yaml
>  F:	drivers/media/platform/renesas/renesas-ceu.c
>  F:	include/media/drv-intf/renesas-ceu.h
> @@ -14280,7 +14280,7 @@ M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>  L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/renesas,drif.yaml
>  F:	drivers/media/platform/renesas/rcar_drif.c
>  
> @@ -14289,7 +14289,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/renesas,fcp.yaml
>  F:	drivers/media/platform/renesas/rcar-fcp.c
>  F:	include/media/rcar-fcp.h
> @@ -14299,7 +14299,7 @@ M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/renesas,fdp1.yaml
>  F:	drivers/media/platform/renesas/rcar_fdp1.c
>  
> @@ -14308,7 +14308,7 @@ M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
>  L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
>  F:	Documentation/devicetree/bindings/media/renesas,isp.yaml
>  F:	Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -14322,7 +14322,7 @@ M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/renesas,vsp1.yaml
>  F:	drivers/media/platform/renesas/vsp1/
>  
> @@ -14330,14 +14330,14 @@ MEDIA DRIVERS FOR ST STV0910 DEMODULATOR ICs
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/dvb-frontends/stv0910*
>  
>  MEDIA DRIVERS FOR ST STV6111 TUNER ICs
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/dvb-frontends/stv6111*
>  
>  MEDIA DRIVERS FOR STM32 - DCMI / DCMIPP
> @@ -14345,7 +14345,7 @@ M:	Hugues Fruchet <hugues.fruchet@foss.st.com>
>  M:	Alain Volmat <alain.volmat@foss.st.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
>  F:	Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
>  F:	drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -14357,7 +14357,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
>  Q:	http://patchwork.kernel.org/project/linux-media/list/
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/admin-guide/media/
>  F:	Documentation/devicetree/bindings/media/
>  F:	Documentation/driver-api/media/
> @@ -14933,7 +14933,7 @@ L:	linux-media@vger.kernel.org
>  L:	linux-amlogic@lists.infradead.org
>  S:	Supported
>  W:	http://linux-meson.com/
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
>  F:	drivers/media/cec/platform/meson/ao-cec-g12a.c
>  F:	drivers/media/cec/platform/meson/ao-cec.c
> @@ -14943,7 +14943,7 @@ M:	Neil Armstrong <neil.armstrong@linaro.org>
>  L:	linux-media@vger.kernel.org
>  L:	linux-amlogic@lists.infradead.org
>  S:	Supported
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
>  F:	drivers/media/platform/amlogic/meson-ge2d/
>  
> @@ -14959,7 +14959,7 @@ M:	Neil Armstrong <neil.armstrong@linaro.org>
>  L:	linux-media@vger.kernel.org
>  L:	linux-amlogic@lists.infradead.org
>  S:	Supported
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
>  F:	drivers/staging/media/meson/vdec/
>  
> @@ -15557,7 +15557,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Odd Fixes
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/radio-miropcm20*
>  
>  MITSUMI MM8013 FG DRIVER
> @@ -15709,7 +15709,7 @@ MR800 AVERMEDIA USB FM RADIO DRIVER
>  M:	Alexey Klimov <alexey.klimov@linaro.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/radio-mr800.c
>  
>  MRF24J40 IEEE 802.15.4 RADIO DRIVER
> @@ -15776,7 +15776,7 @@ MT9M114 ONSEMI SENSOR DRIVER
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
>  F:	drivers/media/i2c/mt9m114.c
>  
> @@ -15784,7 +15784,7 @@ MT9P031 APTINA CAMERA SENSOR
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
>  F:	drivers/media/i2c/mt9p031.c
>  
> @@ -15792,7 +15792,7 @@ MT9T112 APTINA CAMERA SENSOR
>  M:	Jacopo Mondi <jacopo@jmondi.org>
>  L:	linux-media@vger.kernel.org
>  S:	Odd Fixes
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/mt9t112.c
>  F:	include/media/i2c/mt9t112.h
>  
> @@ -15800,7 +15800,7 @@ MT9V032 APTINA CAMERA SENSOR
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/mt9v032.txt
>  F:	drivers/media/i2c/mt9v032.c
>  F:	include/media/i2c/mt9v032.h
> @@ -15809,7 +15809,7 @@ MT9V111 APTINA CAMERA SENSOR
>  M:	Jacopo Mondi <jacopo@jmondi.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
>  F:	drivers/media/i2c/mt9v111.c
>  
> @@ -16996,13 +16996,13 @@ OMNIVISION OV01A10 SENSOR DRIVER
>  M:	Bingbu Cao <bingbu.cao@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/ov01a10.c
>  
>  OMNIVISION OV02A10 SENSOR DRIVER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
>  F:	drivers/media/i2c/ov02a10.c
>  
> @@ -17010,14 +17010,14 @@ OMNIVISION OV08D10 SENSOR DRIVER
>  M:	Jimmy Su <jimmy.su@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/ov08d10.c
>  
>  OMNIVISION OV08X40 SENSOR DRIVER
>  M:	Jason Chen <jason.z.chen@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/ov08x40.c
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
>  
> @@ -17025,14 +17025,14 @@ OMNIVISION OV13858 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/ov13858.c
>  
>  OMNIVISION OV13B10 SENSOR DRIVER
>  M:	Arec Kao <arec.kao@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/ov13b10.c
>  
>  OMNIVISION OV2680 SENSOR DRIVER
> @@ -17040,7 +17040,7 @@ M:	Rui Miguel Silva <rmfrfs@gmail.com>
>  M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
>  F:	drivers/media/i2c/ov2680.c
>  
> @@ -17048,7 +17048,7 @@ OMNIVISION OV2685 SENSOR DRIVER
>  M:	Shunqian Zheng <zhengsq@rock-chips.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
>  F:	drivers/media/i2c/ov2685.c
>  
> @@ -17058,14 +17058,14 @@ R:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  R:	Bingbu Cao <bingbu.cao@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/ov2740.c
>  
>  OMNIVISION OV4689 SENSOR DRIVER
>  M:	Mikhail Rudenko <mike.rudenko@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
>  F:	drivers/media/i2c/ov4689.c
>  
> @@ -17073,7 +17073,7 @@ OMNIVISION OV5640 SENSOR DRIVER
>  M:	Steve Longerbeam <slongerbeam@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/ov5640.c
>  
>  OMNIVISION OV5647 SENSOR DRIVER
> @@ -17081,7 +17081,7 @@ M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
>  M:	Jacopo Mondi <jacopo@jmondi.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
>  F:	drivers/media/i2c/ov5647.c
>  
> @@ -17089,7 +17089,7 @@ OMNIVISION OV5670 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
>  F:	drivers/media/i2c/ov5670.c
>  
> @@ -17097,7 +17097,7 @@ OMNIVISION OV5675 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
>  F:	drivers/media/i2c/ov5675.c
>  
> @@ -17105,7 +17105,7 @@ OMNIVISION OV5693 SENSOR DRIVER
>  M:	Daniel Scally <djrscally@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
>  F:	drivers/media/i2c/ov5693.c
>  
> @@ -17113,21 +17113,21 @@ OMNIVISION OV5695 SENSOR DRIVER
>  M:	Shunqian Zheng <zhengsq@rock-chips.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/ov5695.c
>  
>  OMNIVISION OV64A40 SENSOR DRIVER
>  M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
>  F:	drivers/media/i2c/ov64a40.c
>  
>  OMNIVISION OV7670 SENSOR DRIVER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ov7670.txt
>  F:	drivers/media/i2c/ov7670.c
>  
> @@ -17135,7 +17135,7 @@ OMNIVISION OV772x SENSOR DRIVER
>  M:	Jacopo Mondi <jacopo@jmondi.org>
>  L:	linux-media@vger.kernel.org
>  S:	Odd fixes
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
>  F:	drivers/media/i2c/ov772x.c
>  F:	include/media/i2c/ov772x.h
> @@ -17143,7 +17143,7 @@ F:	include/media/i2c/ov772x.h
>  OMNIVISION OV7740 SENSOR DRIVER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ov7740.txt
>  F:	drivers/media/i2c/ov7740.c
>  
> @@ -17151,7 +17151,7 @@ OMNIVISION OV8856 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
>  F:	drivers/media/i2c/ov8856.c
>  
> @@ -17160,7 +17160,7 @@ M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>  M:	Nicholas Roth <nicholas@rothemail.net>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
>  F:	drivers/media/i2c/ov8858.c
>  
> @@ -17168,7 +17168,7 @@ OMNIVISION OV9282 SENSOR DRIVER
>  M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
>  F:	drivers/media/i2c/ov9282.c
>  
> @@ -17184,7 +17184,7 @@ R:	Akinobu Mita <akinobu.mita@gmail.com>
>  R:	Sylwester Nawrocki <s.nawrocki@samsung.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ov9650.txt
>  F:	drivers/media/i2c/ov9650.c
>  
> @@ -17193,7 +17193,7 @@ M:	Tianshu Qiu <tian.shu.qiu@intel.com>
>  R:	Bingbu Cao <bingbu.cao@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/ov9734.c
>  
>  ONBOARD USB HUB DRIVER
> @@ -18638,7 +18638,7 @@ PULSE8-CEC DRIVER
>  M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/cec/usb/pulse8/
>  
>  PURELIFI PLFXLC DRIVER
> @@ -18653,7 +18653,7 @@ L:	pvrusb2@isely.net	(subscribers-only)
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	http://www.isely.net/pvrusb2/
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/driver-api/media/drivers/pvrusb2*
>  F:	drivers/media/usb/pvrusb2/
>  
> @@ -18661,7 +18661,7 @@ PWC WEBCAM DRIVER
>  M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Odd Fixes
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/usb/pwc/*
>  F:	include/trace/events/pwc.h
>  
> @@ -19165,7 +19165,7 @@ R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  L:	linux-media@vger.kernel.org
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/*venus*
>  F:	drivers/media/platform/qcom/venus/
>  
> @@ -19210,14 +19210,14 @@ RADIOSHARK RADIO DRIVER
>  M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/radio-shark.c
>  
>  RADIOSHARK2 RADIO DRIVER
>  M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/radio-shark2.c
>  F:	drivers/media/radio/radio-tea5777.c
>  
> @@ -19241,7 +19241,7 @@ RAINSHADOW-CEC DRIVER
>  M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/cec/usb/rainshadow/
>  
>  RALINK MIPS ARCHITECTURE
> @@ -19332,7 +19332,7 @@ M:	Sean Young <sean@mess.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	http://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/driver-api/media/rc-core.rst
>  F:	Documentation/userspace-api/media/rc/
>  F:	drivers/media/rc/
> @@ -20046,7 +20046,7 @@ ROTATION DRIVER FOR ALLWINNER A83T
>  M:	Jernej Skrabec <jernej.skrabec@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-de2-rotate.yaml
>  F:	drivers/media/platform/sunxi/sun8i-rotate/
>  
> @@ -20300,7 +20300,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Odd Fixes
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/saa6588*
>  
>  SAA7134 VIDEO4LINUX DRIVER
> @@ -20308,7 +20308,7 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Odd fixes
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/driver-api/media/drivers/saa7134*
>  F:	drivers/media/pci/saa7134/
>  
> @@ -20316,7 +20316,7 @@ SAA7146 VIDEO4LINUX-2 DRIVER
>  M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/common/saa7146/
>  F:	drivers/media/pci/saa7146/
>  F:	include/media/drv-intf/saa7146*
> @@ -20934,7 +20934,7 @@ SHARP RJ54N1CB0C SENSOR DRIVER
>  M:	Jacopo Mondi <jacopo@jmondi.org>
>  L:	linux-media@vger.kernel.org
>  S:	Odd fixes
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/rj54n1cb0c.c
>  F:	include/media/i2c/rj54n1cb0c.h
>  
> @@ -20984,7 +20984,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Odd Fixes
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/silabs,si470x.yaml
>  F:	drivers/media/radio/si470x/radio-si470x-i2c.c
>  
> @@ -20993,7 +20993,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/si470x/radio-si470x-common.c
>  F:	drivers/media/radio/si470x/radio-si470x-usb.c
>  F:	drivers/media/radio/si470x/radio-si470x.h
> @@ -21003,7 +21003,7 @@ M:	Eduardo Valentin <edubezval@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Odd Fixes
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/si4713/si4713.?
>  
>  SI4713 FM RADIO TRANSMITTER PLATFORM DRIVER
> @@ -21011,7 +21011,7 @@ M:	Eduardo Valentin <edubezval@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Odd Fixes
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/si4713/radio-platform-si4713.c
>  
>  SI4713 FM RADIO TRANSMITTER USB DRIVER
> @@ -21019,7 +21019,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/si4713/radio-usb-si4713.c
>  
>  SIANO DVB DRIVER
> @@ -21027,7 +21027,7 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Odd fixes
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/common/siano/
>  F:	drivers/media/mmc/siano/
>  F:	drivers/media/usb/siano/
> @@ -21403,14 +21403,14 @@ SONY IMX208 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/imx208.c
>  
>  SONY IMX214 SENSOR DRIVER
>  M:	Ricardo Ribalda <ribalda@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
>  F:	drivers/media/i2c/imx214.c
>  
> @@ -21418,7 +21418,7 @@ SONY IMX219 SENSOR DRIVER
>  M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
>  F:	drivers/media/i2c/imx219.c
>  
> @@ -21426,7 +21426,7 @@ SONY IMX258 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
>  F:	drivers/media/i2c/imx258.c
>  
> @@ -21434,7 +21434,7 @@ SONY IMX274 SENSOR DRIVER
>  M:	Leon Luo <leonl@leopardimaging.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
>  F:	drivers/media/i2c/imx274.c
>  
> @@ -21443,7 +21443,7 @@ M:	Kieran Bingham <kieran.bingham@ideasonboard.com>
>  M:	Umang Jain <umang.jain@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
>  F:	drivers/media/i2c/imx283.c
>  
> @@ -21451,7 +21451,7 @@ SONY IMX290 SENSOR DRIVER
>  M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
>  F:	drivers/media/i2c/imx290.c
>  
> @@ -21460,7 +21460,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
>  F:	drivers/media/i2c/imx296.c
>  
> @@ -21468,20 +21468,20 @@ SONY IMX319 SENSOR DRIVER
>  M:	Bingbu Cao <bingbu.cao@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/imx319.c
>  
>  SONY IMX334 SENSOR DRIVER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
>  F:	drivers/media/i2c/imx334.c
>  
>  SONY IMX335 SENSOR DRIVER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
>  F:	drivers/media/i2c/imx335.c
>  
> @@ -21489,13 +21489,13 @@ SONY IMX355 SENSOR DRIVER
>  M:	Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/imx355.c
>  
>  SONY IMX412 SENSOR DRIVER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
>  F:	drivers/media/i2c/imx412.c
>  
> @@ -21503,7 +21503,7 @@ SONY IMX415 SENSOR DRIVER
>  M:	Michael Riesch <michael.riesch@wolfvision.net>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>  F:	drivers/media/i2c/imx415.c
>  
> @@ -21792,7 +21792,7 @@ M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>  M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
>  F:	drivers/media/i2c/st-mipid02.c
>  
> @@ -21828,7 +21828,7 @@ M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>  M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
>  F:	Documentation/userspace-api/media/drivers/vgxy61.rst
>  F:	drivers/media/i2c/vgxy61.c
> @@ -22118,7 +22118,7 @@ STK1160 USB VIDEO CAPTURE DRIVER
>  M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/usb/stk1160/
>  
>  STM32 AUDIO (ASoC) DRIVERS
> @@ -22555,7 +22555,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
>  Q:	http://patchwork.linuxtv.org/project/linux-media/list/
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/tuners/tda18250*
>  
>  TDA18271 MEDIA DRIVER
> @@ -22601,7 +22601,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/tda9840*
>  
>  TEA5761 TUNER DRIVER
> @@ -22609,7 +22609,7 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Odd fixes
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/tuners/tea5761.*
>  
>  TEA5767 TUNER DRIVER
> @@ -22617,7 +22617,7 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/tuners/tea5767.*
>  
>  TEA6415C MEDIA DRIVER
> @@ -22625,7 +22625,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/tea6415c*
>  
>  TEA6420 MEDIA DRIVER
> @@ -22633,7 +22633,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/tea6420*
>  
>  TEAM DRIVER
> @@ -22921,7 +22921,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/radio/radio-raremono.c
>  
>  THERMAL
> @@ -22997,7 +22997,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  M:	Paul Elder <paul.elder@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
>  F:	Documentation/userspace-api/media/drivers/thp7312.rst
>  F:	drivers/media/i2c/thp7312.c
> @@ -23584,7 +23584,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Odd Fixes
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/pci/tw68/
>  
>  TW686X VIDEO4LINUX DRIVER
> @@ -23592,7 +23592,7 @@ M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	http://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/pci/tw686x/
>  
>  U-BOOT ENVIRONMENT VARIABLES
> @@ -24076,7 +24076,7 @@ M:	Hans de Goede <hdegoede@redhat.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	http://www.ideasonboard.org/uvc/
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/usb/uvc/
>  F:	include/uapi/linux/uvcvideo.h
>  
> @@ -24182,7 +24182,7 @@ V4L2 ASYNC AND FWNODE FRAMEWORKS
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/v4l2-core/v4l2-async.c
>  F:	drivers/media/v4l2-core/v4l2-fwnode.c
>  F:	include/media/v4l2-async.h
> @@ -24348,7 +24348,7 @@ M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/test-drivers/vicodec/*
>  
>  VIDEO I2C POLLING DRIVER
> @@ -24376,7 +24376,7 @@ M:	Daniel W. S. Almeida <dwlsalmeida@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/test-drivers/vidtv/*
>  
>  VIMC VIRTUAL MEDIA CONTROLLER DRIVER
> @@ -24385,7 +24385,7 @@ R:	Kieran Bingham <kieran.bingham@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/test-drivers/vimc/*
>  
>  VIRT LIB
> @@ -24633,7 +24633,7 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/test-drivers/vivid/*
>  
>  VM SOCKETS (AF_VSOCK)
> @@ -25187,7 +25187,7 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	https://linuxtv.org
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	drivers/media/tuners/xc2028.*
>  
>  XDP (eXpress Data Path)
> @@ -25411,7 +25411,7 @@ XILINX VIDEO IP CORES
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
> -T:	git git://linuxtv.org/media_tree.git
> +T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/xilinx/
>  F:	drivers/media/platform/xilinx/
>  F:	include/uapi/linux/xilinx-v4l2-controls.h


