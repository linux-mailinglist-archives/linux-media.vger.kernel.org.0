Return-Path: <linux-media+bounces-45455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DD5C04966
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 08:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADD683A1F4D
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 06:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9115727874F;
	Fri, 24 Oct 2025 06:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcMBRtUT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8542580E2
	for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 06:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761288976; cv=none; b=tDtaKgzziPKoKgIfvHrhEbUTqeFS+2KIC6JToJATV7W6QwdZ+yEURM/KGRZUDV08uvcw8WOVOE7auyysv4tWONH0BfDY5gvikvMpOrpCmxnXyS83EkpahjQBXa7IOMDoO+YUQPMtLon9jmNJCAvSFA6mW6nS/QgqB7MkI244Ndo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761288976; c=relaxed/simple;
	bh=TrRZNmNWl1/ASZI1Bcieum4zsQ/5zQqr7OhSYOOzEBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aAbig5galyoK5Ip7juFpGHRww6z/d8SmHG5r1xrqzatlD86flc9NmILA25Xv7ELgnDnXm7UzIJ7Pv2hpsNkO5XdSgyCUYGk9frkEF5+pfaMNbXR40CEDOvfOfsETvmu8yfdbyFeguCdzIm9+ZJMI9H+cg3pjqJ/TSqn64VKDogU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcMBRtUT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-475c696ab72so13223175e9.1
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 23:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761288971; x=1761893771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Tvg8VRYGkQDAdt67CJqhfAEM+TZOEbvl2MnO2qKjII=;
        b=QcMBRtUTINQ14MM6TFiXrAOi1zPNMokc7tROGtztCHnCFyyIBetIi/SKseXImsFZyH
         ImfzhA+0saBZmYAxpZnLuk3rxrgp+jPYg4K4TVK9b/l0i4n1l2vP09TyEKg9w4HFx6li
         7a7yrlmqTT3ocR9WAho+yt7Y18RuwIMXfsx19qIZWoTK1HOtLno1eaNLqt97X0uKM76H
         a0Q7ux968vLqcL6XDiZ+PKgCwcpirdI/NJJ5Stli/rMbR8p3rC5cF1IUgkIbmj3cwyQQ
         AvXv/5KTlcBmpphQxiPVYTW24x2Df4EY09/sNPOwJukIExK9m1iqnH0halA/NkmOh5w5
         jnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761288971; x=1761893771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Tvg8VRYGkQDAdt67CJqhfAEM+TZOEbvl2MnO2qKjII=;
        b=euVHYQHf8HG3O3fkI+252uHI10QJEJEdfaxR8UbgVnIs+4OHYGKsnKNU9QH1DkYE84
         /jxE1dPWxPjvPu9PwN1IZHFYhZ5VMii96tqBvkiWw7O+2Wj1PkNlGIOAlR6KWzht0g/6
         02yGgeJgNMBoM2WJmZ4QD4mDRsfJBDDduqdA+JLGF6/lfjEaS6+SsoVqEoInZBicW2Ir
         7yNbfEQ/NqtFmPsJEInKl2GwDJIn6AcnxD/6hyQovUJBsAEgJcKTcH97UuMccKpF7y2W
         76otJmF6ecGw2ZhZxcsP3NDxY7KkoiOSWVR7Wm8aP14/NdwQo3V6wswz/QiuhnGubFwO
         ueuw==
X-Gm-Message-State: AOJu0Yz3c85hTrvWve1W/apBQXcgaHOO+tho4ZRI2usefwzRONt7ev+0
	sbjHIqP9ZLrzSHmno2h/LlLASAnqItvFAPqCvAfOefViSVfRhPAThMhffADW1OY1CimvwlvzrPC
	LS/auqXAumfLN0MH5Bet7a1dZwdm2tvQ=
X-Gm-Gg: ASbGnctmRi9Bv36eKxIU3X3BBQjUMLv4e69Fa4Uwd/mV/KO0XL/1UD9BR0E/Y/tMrxe
	NxCOdVcsVzohh7D5Afkn1oI6yxCKB80YIp0HQFL66yfkvZHJlmDN6vzImAvAiKBsejJ/KooRkgU
	zBBUavDtPo4qMEhgBzy5uAuoillWTHXkaAidrTTxnocAygpiz1oCkOrs7aRtB80lX8aEqws0dYX
	1umXGy0BejhyI+YPPcAI2VgPQaBYMlimhU174w6sB20/RbwpuRmXZT3NWaLkBWc8Nq5aUcm9caI
	8inzVfp5
X-Google-Smtp-Source: AGHT+IEoh4q4B1PatYd6MvL2E4jTUwyTr1dKK+ddikwIY1KHabZ9/0Sejise+0ZU58qoAl1o0uggeklLcGPJmq6Q7ys=
X-Received: by 2002:a05:6000:4008:b0:429:8a19:96c9 with SMTP id
 ffacd0b85a97d-42990717e98mr888745f8f.19.1761288970559; Thu, 23 Oct 2025
 23:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-ivc-v5-0-192c663fa70b@ideasonboard.com> <20251002-ivc-v5-2-192c663fa70b@ideasonboard.com>
In-Reply-To: <20251002-ivc-v5-2-192c663fa70b@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Oct 2025 07:55:42 +0100
X-Gm-Features: AWmQ_bn_qJfiB14WFQMoaJ5U-NRcLDDYCKy82k6qam7NKjhFfpeWb4K9ASVV3CA
Message-ID: <CA+V-a8ukCKP3LocazbGHOVXkoBVH1art+=J6aD30xi_S63iY6Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] media: platform: Add Renesas Input Video Control
 block driver
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, jacopo.mondi@ideasonboard.com, 
	biju.das.jz@bp.renesas.com, laurent.pinchart@ideasonboard.com, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thank you for the patch.

On Thu, Oct 2, 2025 at 11:38=E2=80=AFAM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> Add a driver for the Input Video Control block in an RZ/V2H(P) SoC
> which feeds data into the Arm Mali-C55 ISP.
>
> [ivc: Remove check on buffers list in start_streaming]
> [ivc: put_autosuspend() implies mark_last_busy()]
> [media: rzv2h-ivc: Do not delay frame completion]
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v7:
>
>         - Returned buffers to userspace as soon as the first
>           interrupt is received instead of waiting until the
>           second
>         - Fixes to the pm runtime invocations
>         - Some minor formatting changes
>
> Changes in v6:
>
>         - Minor formatting changes
>         - Dropped CONFIG_ prefix from Kconfig symbols
>         - Collected tags
>         - Replaced "RZ/V2H" with "RZ/V2H(P)"
>         - Reformatted probe function
>         - Removed leftover reference to media job scheduler
>         - Drop the .pipeline_started() and .pipeline_stopped()
>           media entity operations to remove a dependency for the
>           set.
>
> Changes in v5:
>
>         - Fixed .enum_frame_sizes() to properly check that the
>           given mbus_code matches the source pads format.
>         - Tidy up extra space in Kconfig
>         - Revise Kconfig option message
>         - Don't mark functions inline
>         - Fixup misleading comment
>         - select CONFIG_PM
>         - Use the new pm_sleep_ptr() functionality
>         - Minor formatting
>
> Changes in v4:
>
>         - Update the compatible to renesas,r9a09g057-ivc
>         - Dropped the media jobs / scheduler functionality, and re
>           worked the driver to have its own workqueue pushing frames
>         - Fix .enum_mbus_code() to return 20-bit output for source
>           pad.
>         - Fix some alignment issues
>         - Make the forwarding of sink to source pad format a more
>           explicit operation.
>         - Rename rzv2h_initialise_video_device_and_queue()
>         - Reversed order of v4l2_subdev_init_finalize() and
>           v4l2_async_register_subdev() to make sure everything is
>           finished initialising before registering the subdev.
>         - Change function to MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER
>         - Use a parametised macro for min vblank
>         - Minor formatting
>         - Use the DEFAULT macros for quantization / ycbcr_enc values
>         - Switch to using the mplane API
>         - Dropped select RESET_CONTROLLER
>         - Used the new helpers for starting a media pipeline
>         - Switch from threaded irq to normal with driver workqueue
>           and revised startup routine
>
> Changes in v3:
>
>         - Account for the renamed CRU pixel formats
>
> Changes in v2:
>
>         - Added selects and depends statements to Kconfig entry
>         - Fixed copyright year
>         - Stopped including in .c files headers already included in .h
>         - Fixed uninitialized variable in iterator
>         - Only check vvalid member in interrupt function and wait
>           unconditionally elsewhere
>         - __maybe_unused for the PM ops
>         - Initialise the subdevice after setting up PM
>         - Fixed the remove function for the driver to actually do
>           something.
>         - Some minor formatting changes
>         - Fixed the quantization member for the format
>         - Changes accounting for the v2 of the media jobs framework
>         - Change min_queued_buffers to 0
> ---
>  drivers/media/platform/renesas/Kconfig             |   1 +
>  drivers/media/platform/renesas/Makefile            |   1 +
>  drivers/media/platform/renesas/rzv2h-ivc/Kconfig   |  18 +
>  drivers/media/platform/renesas/rzv2h-ivc/Makefile  |   5 +
>  .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     | 238 +++++++++
>  .../platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c  | 375 +++++++++++++++
>  .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 533 +++++++++++++++=
++++++
>  .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   | 130 +++++
>  8 files changed, 1301 insertions(+)
>
> diff --git a/drivers/media/platform/renesas/Kconfig b/drivers/media/platf=
orm/renesas/Kconfig
> index 27a54fa7908384f2e8200f0f7283a82b0ae8435c..bd8247c0b8aa734d2b412438e=
694f3908d910b25 100644
> --- a/drivers/media/platform/renesas/Kconfig
> +++ b/drivers/media/platform/renesas/Kconfig
> @@ -42,6 +42,7 @@ config VIDEO_SH_VOU
>  source "drivers/media/platform/renesas/rcar-isp/Kconfig"
>  source "drivers/media/platform/renesas/rcar-vin/Kconfig"
>  source "drivers/media/platform/renesas/rzg2l-cru/Kconfig"
> +source "drivers/media/platform/renesas/rzv2h-ivc/Kconfig"
>
>  # Mem2mem drivers
>
> diff --git a/drivers/media/platform/renesas/Makefile b/drivers/media/plat=
form/renesas/Makefile
> index 1127259c09d6a51b70803e76c495918e06777f67..b6b4abf01db246aaf8269b802=
7efee9b0b32083a 100644
> --- a/drivers/media/platform/renesas/Makefile
> +++ b/drivers/media/platform/renesas/Makefile
> @@ -6,6 +6,7 @@
>  obj-y +=3D rcar-isp/
>  obj-y +=3D rcar-vin/
>  obj-y +=3D rzg2l-cru/
> +obj-y +=3D rzv2h-ivc/
>  obj-y +=3D vsp1/
>
>  obj-$(CONFIG_VIDEO_RCAR_CSI2) +=3D rcar-csi2.o
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/Kconfig b/drivers/m=
edia/platform/renesas/rzv2h-ivc/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..b30702489d380902bfdcff57f=
0d70498c85e1d24
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config VIDEO_RZV2H_IVC
> +       tristate "Renesas RZ/V2H(P) Input Video Control block driver"
> +       depends on V4L_PLATFORM_DRIVERS
> +       depends on VIDEO_DEV
> +       depends on ARCH_RENESAS || COMPILE_TEST
> +       depends on OF
> +       select PM
> +       select VIDEOBUF2_DMA_CONTIG
> +       select MEDIA_CONTROLLER
> +       select VIDEO_V4L2_SUBDEV_API
> +       help
> +          Support for the Renesas RZ/V2H(P) Input Video Control Block
> +          (IVC).
> +
> +          To compile this driver as a module, choose M here: the
> +          module will be called rzv2h-ivc.
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/Makefile b/drivers/=
media/platform/renesas/rzv2h-ivc/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..080ee3570f09c236d87abeaea=
5d8dd578fefb6d3
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +rzv2h-ivc-y :=3D rzv2h-ivc-dev.o rzv2h-ivc-subdev.o rzv2h-ivc-video.o
> +
> +obj-$(CONFIG_VIDEO_RZV2H_IVC) +=3D rzv2h-ivc.o
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c b/d=
rivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..aa0bee68deb37166fc07b77a7=
167dc8e2877fbf5
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
> @@ -0,0 +1,238 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H(P) Input Video Control Block driver
> + *
> + * Copyright (C) 2025 Ideas on Board Oy
> + */
> +
> +#include "rzv2h-ivc.h"
> +
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +void rzv2h_ivc_write(struct rzv2h_ivc *ivc, u32 addr, u32 val)
> +{
> +       writel(val, ivc->base + addr);
> +}
> +
> +void rzv2h_ivc_update_bits(struct rzv2h_ivc *ivc, unsigned int addr,
> +                          u32 mask, u32 val)
> +{
> +       u32 orig, new;
> +
> +       orig =3D readl(ivc->base + addr);
> +
> +       new =3D orig & ~mask;
> +       new |=3D val & mask;
> +
> +       if (new !=3D orig)
> +               writel(new, ivc->base + addr);
> +}
> +
> +static int rzv2h_ivc_get_hardware_resources(struct rzv2h_ivc *ivc,
> +                                           struct platform_device *pdev)
> +{
> +       static const char * const resource_names[RZV2H_IVC_NUM_HW_RESOURC=
ES] =3D {
> +               "reg",
> +               "axi",
> +               "isp",
> +       };
> +       struct resource *res;
> +       int ret;
> +
> +       ivc->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &re=
s);
> +       if (IS_ERR(ivc->base))
> +               return dev_err_probe(ivc->dev, PTR_ERR(ivc->base),
> +                                    "failed to map IO memory\n");
> +
> +       for (unsigned int i =3D 0; i < ARRAY_SIZE(resource_names); i++)
> +               ivc->clks[i].id =3D resource_names[i];
> +
> +       ret =3D devm_clk_bulk_get(ivc->dev, ARRAY_SIZE(resource_names), i=
vc->clks);
> +       if (ret)
> +               return dev_err_probe(ivc->dev, ret, "failed to acquire cl=
ks\n");
> +
> +       for (unsigned int i =3D 0; i < ARRAY_SIZE(resource_names); i++)
> +               ivc->resets[i].id =3D resource_names[i];
> +
> +       ret =3D devm_reset_control_bulk_get_optional_shared(
> +               ivc->dev, ARRAY_SIZE(resource_names), ivc->resets);
> +       if (ret)
> +               return dev_err_probe(ivc->dev, ret, "failed to acquire re=
sets\n");
> +
> +       return 0;
> +}
> +
> +static void rzv2h_ivc_global_config(struct rzv2h_ivc *ivc)
> +{
> +       /* Currently we only support single-exposure input */
> +       rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_PLNUM, RZV2H_IVC_ONE_EXP=
OSURE);
> +
> +       /*
> +        * Datasheet says we should disable the interrupts before changin=
g mode
> +        * to avoid spurious IFP interrupt.
> +        */
> +       rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_INT_EN, 0x0);
> +
> +       /*
> +        * RZ/V2H(P) documentation says software controlled single contex=
t mode
> +        * is not supported, and currently the driver does not support th=
e
> +        * multi-context mode. That being so we just set single context s=
w-hw
> +        * mode.
> +        */
> +       rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_CONTEXT,
> +                       RZV2H_IVC_SINGLE_CONTEXT_SW_HW_CFG);
> +
> +       /*
> +        * We enable the frame end interrupt so that we know when we shou=
ld send
> +        * follow-up frames.
> +        */
> +       rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_INT_EN, RZV2H_IVC_VVAL_IFPE=
);
> +}
> +
> +static irqreturn_t rzv2h_ivc_isr(int irq, void *context)
> +{
> +       struct device *dev =3D context;
> +       struct rzv2h_ivc *ivc =3D dev_get_drvdata(dev);
> +
> +       guard(spinlock)(&ivc->spinlock);
> +
> +       /* IRQ should never be triggered before vvalid_ifp has been reset=
 to 2 */
> +       if (WARN_ON(!ivc->vvalid_ifp))
> +               return IRQ_HANDLED;
> +
> +       /*
> +        * The first interrupt indicates that the buffer transfer has bee=
n
> +        * completed.
> +        */
> +       if (--ivc->vvalid_ifp) {
> +               rzv2h_ivc_buffer_done(ivc);
> +               return IRQ_HANDLED;
> +       }
> +
> +       /*
> +        * The second interrupt indicates that the post-frame transfer VB=
LANK
> +        * has completed, we can now schedule a new frame transfer, if an=
y.
> +        */
> +       queue_work(ivc->buffers.async_wq, &ivc->buffers.work);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int rzv2h_ivc_runtime_resume(struct device *dev)
> +{
> +       struct rzv2h_ivc *ivc =3D dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret =3D request_irq(ivc->irqnum, rzv2h_ivc_isr, 0, dev_driver_str=
ing(dev),
> +                         dev);
> +       if (ret) {
> +               dev_err(dev, "failed to request irq\n");
> +               return ret;
> +       }
I think we could move the request_irq after the below initialization.

> +
> +       ret =3D clk_bulk_prepare_enable(ARRAY_SIZE(ivc->clks), ivc->clks)=
;
> +       if (ret) {
> +               dev_err(ivc->dev, "failed to enable clocks\n");
> +               goto err_free_irqnum;
> +       }
> +
> +       ret =3D reset_control_bulk_deassert(ARRAY_SIZE(ivc->resets), ivc-=
>resets);
> +       if (ret) {
> +               dev_err(ivc->dev, "failed to deassert resets\n");
> +               goto err_disable_clks;
> +       }
> +
> +       rzv2h_ivc_global_config(ivc);
> +
> +       return 0;
> +
> +err_disable_clks:
> +       clk_bulk_disable_unprepare(ARRAY_SIZE(ivc->clks), ivc->clks);
> +err_free_irqnum:
> +       free_irq(ivc->irqnum, dev);
> +
> +       return ret;
> +}
> +
> +static int rzv2h_ivc_runtime_suspend(struct device *dev)
> +{
> +       struct rzv2h_ivc *ivc =3D dev_get_drvdata(dev);
> +
> +       reset_control_bulk_assert(ARRAY_SIZE(ivc->resets), ivc->resets);
> +       clk_bulk_disable_unprepare(ARRAY_SIZE(ivc->clks), ivc->clks);
> +       free_irq(ivc->irqnum, dev);
> +
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops rzv2h_ivc_pm_ops =3D {
> +       SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_re=
sume)
> +       RUNTIME_PM_OPS(rzv2h_ivc_runtime_suspend, rzv2h_ivc_runtime_resum=
e,
> +                      NULL)
> +};
> +
> +static int rzv2h_ivc_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct rzv2h_ivc *ivc;
> +       int ret;
> +
> +       ivc =3D devm_kzalloc(dev, sizeof(*ivc), GFP_KERNEL);
> +       if (!ivc)
> +               return -ENOMEM;
> +
> +       ivc->dev =3D dev;
> +       platform_set_drvdata(pdev, ivc);
> +       mutex_init(&ivc->lock);
we could switch to devm_mutex_init().

> +       spin_lock_init(&ivc->spinlock);
> +
> +       ret =3D rzv2h_ivc_get_hardware_resources(ivc, pdev);
> +       if (ret)
> +               return ret;
> +
> +       pm_runtime_set_autosuspend_delay(dev, 2000);
> +       pm_runtime_use_autosuspend(dev);
> +       pm_runtime_enable(dev);
> +
> +       ivc->irqnum =3D platform_get_irq(pdev, 0);
> +       if (ivc->irqnum < 0)
> +               return ivc->irqnum;
we need to disable pm_runtime in the error path.

> +
> +       return rzv2h_ivc_initialise_subdevice(ivc);
> +}
> +
> +static void rzv2h_ivc_remove(struct platform_device *pdev)
> +{
> +       struct rzv2h_ivc *ivc =3D platform_get_drvdata(pdev);
> +
> +       rzv2h_deinit_video_dev_and_queue(ivc);
> +       rzv2h_ivc_deinit_subdevice(ivc);
> +       mutex_destroy(&ivc->lock);
> +}
> +
> +static const struct of_device_id rzv2h_ivc_of_match[] =3D {
> +       { .compatible =3D "renesas,r9a09g057-ivc", },
> +       { /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rzv2h_ivc_of_match);
> +
> +static struct platform_driver rzv2h_ivc_driver =3D {
> +       .driver =3D {
> +               .name =3D "rzv2h-ivc",
> +               .of_match_table =3D rzv2h_ivc_of_match,
> +               .pm =3D &rzv2h_ivc_pm_ops,
> +       },
> +       .probe =3D rzv2h_ivc_probe,
> +       .remove =3D rzv2h_ivc_remove,
> +};
> +
> +module_platform_driver(rzv2h_ivc_driver);
> +
> +MODULE_AUTHOR("Daniel Scally <dan.scally@ideasonboard.com>");
> +MODULE_DESCRIPTION("Renesas RZ/V2H(P) Input Video Control Block driver")=
;
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c =
b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..5b7bebc0f7e72bc1aee4247d7=
d15820705bb6b15
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
> @@ -0,0 +1,375 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H(P) Input Video Control Block driver
> + *
> + * Copyright (C) 2025 Ideas on Board Oy
> + */
> +
> +#include "rzv2h-ivc.h"
> +
> +#include <linux/media.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/v4l2-mediabus.h>
> +
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-event.h>
> +
> +#define RZV2H_IVC_N_INPUTS_PER_OUTPUT          6
> +
> +/*
> + * We support 8/10/12/14/16/20 bit input in any bayer order, but the out=
put
> + * format is fixed at 20-bits with the same order as the input.
> + */
> +static const struct {
> +       u32 inputs[RZV2H_IVC_N_INPUTS_PER_OUTPUT];
> +       u32 output;
> +} rzv2h_ivc_formats[] =3D {
> +       {
> +               .inputs =3D {
> +                       MEDIA_BUS_FMT_SBGGR8_1X8,
> +                       MEDIA_BUS_FMT_SBGGR10_1X10,
> +                       MEDIA_BUS_FMT_SBGGR12_1X12,
> +                       MEDIA_BUS_FMT_SBGGR14_1X14,
> +                       MEDIA_BUS_FMT_SBGGR16_1X16,
> +                       MEDIA_BUS_FMT_SBGGR20_1X20,
> +               },
> +               .output =3D MEDIA_BUS_FMT_SBGGR20_1X20
> +       },
> +       {
> +               .inputs =3D {
> +                       MEDIA_BUS_FMT_SGBRG8_1X8,
> +                       MEDIA_BUS_FMT_SGBRG10_1X10,
> +                       MEDIA_BUS_FMT_SGBRG12_1X12,
> +                       MEDIA_BUS_FMT_SGBRG14_1X14,
> +                       MEDIA_BUS_FMT_SGBRG16_1X16,
> +                       MEDIA_BUS_FMT_SGBRG20_1X20,
> +               },
> +               .output =3D MEDIA_BUS_FMT_SGBRG20_1X20
> +       },
> +       {
> +               .inputs =3D {
> +                       MEDIA_BUS_FMT_SGRBG8_1X8,
> +                       MEDIA_BUS_FMT_SGRBG10_1X10,
> +                       MEDIA_BUS_FMT_SGRBG12_1X12,
> +                       MEDIA_BUS_FMT_SGRBG14_1X14,
> +                       MEDIA_BUS_FMT_SGRBG16_1X16,
> +                       MEDIA_BUS_FMT_SGRBG20_1X20,
> +               },
> +               .output =3D MEDIA_BUS_FMT_SGRBG20_1X20
> +       },
> +       {
> +               .inputs =3D {
> +                       MEDIA_BUS_FMT_SRGGB8_1X8,
> +                       MEDIA_BUS_FMT_SRGGB10_1X10,
> +                       MEDIA_BUS_FMT_SRGGB12_1X12,
> +                       MEDIA_BUS_FMT_SRGGB14_1X14,
> +                       MEDIA_BUS_FMT_SRGGB16_1X16,
> +                       MEDIA_BUS_FMT_SRGGB20_1X20,
> +               },
> +               .output =3D MEDIA_BUS_FMT_SRGGB20_1X20
> +       },
> +};
> +
> +static u32 rzv2h_ivc_get_mbus_output_from_input(u32 mbus_code)
> +{
> +       unsigned int i, j;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(rzv2h_ivc_formats); i++) {
> +               for (j =3D 0; j < RZV2H_IVC_N_INPUTS_PER_OUTPUT; j++) {
> +                       if (rzv2h_ivc_formats[i].inputs[j] =3D=3D mbus_co=
de)
> +                               return rzv2h_ivc_formats[i].output;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int rzv2h_ivc_enum_mbus_code(struct v4l2_subdev *sd,
> +                                   struct v4l2_subdev_state *state,
> +                                   struct v4l2_subdev_mbus_code_enum *co=
de)
> +{
> +       const struct v4l2_mbus_framefmt *fmt;
> +       unsigned int order_index;
> +       unsigned int index;
> +
> +       /*
> +        * On the source pad, only the 20-bit format corresponding to the=
 sink
> +        * pad format's bayer order is supported.
> +        */
> +       if (code->pad =3D=3D RZV2H_IVC_SUBDEV_SOURCE_PAD) {
> +               if (code->index)
> +                       return -EINVAL;
> +
> +               fmt =3D v4l2_subdev_state_get_format(state,
> +                                                  RZV2H_IVC_SUBDEV_SINK_=
PAD);
> +               code->code =3D rzv2h_ivc_get_mbus_output_from_input(fmt->=
code);
> +
> +               return 0;
> +       }
> +
> +       if (code->index >=3D ARRAY_SIZE(rzv2h_ivc_formats) *
> +                                     RZV2H_IVC_N_INPUTS_PER_OUTPUT)
> +               return -EINVAL;
> +
> +       order_index =3D code->index / RZV2H_IVC_N_INPUTS_PER_OUTPUT;
> +       index =3D code->index % RZV2H_IVC_N_INPUTS_PER_OUTPUT;
> +
> +       code->code =3D rzv2h_ivc_formats[order_index].inputs[index];
> +
> +       return 0;
> +}
> +
> +static int rzv2h_ivc_enum_frame_size(struct v4l2_subdev *sd,
> +                                    struct v4l2_subdev_state *state,
> +                                    struct v4l2_subdev_frame_size_enum *=
fse)
> +{
> +       const struct v4l2_mbus_framefmt *fmt;
> +
> +       if (fse->index > 0)
> +               return -EINVAL;
> +
> +       if (fse->pad =3D=3D RZV2H_IVC_SUBDEV_SOURCE_PAD) {
> +               fmt =3D v4l2_subdev_state_get_format(state,
> +                                                  RZV2H_IVC_SUBDEV_SINK_=
PAD);
> +
> +               if (fse->code !=3D rzv2h_ivc_get_mbus_output_from_input(f=
mt->code))
> +                       return -EINVAL;
> +
> +               fse->min_width =3D fmt->width;
> +               fse->max_width =3D fmt->width;
> +               fse->min_height =3D fmt->height;
> +               fse->max_height =3D fmt->height;
> +
> +               return 0;
> +       }
> +
> +       if (!rzv2h_ivc_get_mbus_output_from_input(fse->code))
> +               return -EINVAL;
> +
> +       fse->min_width =3D RZV2H_IVC_MIN_WIDTH;
> +       fse->max_width =3D RZV2H_IVC_MAX_WIDTH;
> +       fse->min_height =3D RZV2H_IVC_MIN_HEIGHT;
> +       fse->max_height =3D RZV2H_IVC_MAX_HEIGHT;
> +
> +       return 0;
> +}
> +
> +static int rzv2h_ivc_set_fmt(struct v4l2_subdev *sd,
> +                            struct v4l2_subdev_state *state,
> +                            struct v4l2_subdev_format *format)
> +{
> +       struct v4l2_mbus_framefmt *fmt =3D &format->format;
> +       struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
> +
> +       if (format->pad =3D=3D RZV2H_IVC_SUBDEV_SOURCE_PAD)
> +               return v4l2_subdev_get_fmt(sd, state, format);
> +
> +       sink_fmt =3D v4l2_subdev_state_get_format(state,
> +                                               RZV2H_IVC_SUBDEV_SINK_PAD=
);
> +
> +       sink_fmt->code =3D rzv2h_ivc_get_mbus_output_from_input(fmt->code=
) ?
> +                        fmt->code : rzv2h_ivc_formats[0].inputs[0];
> +
> +       sink_fmt->width =3D clamp(fmt->width, RZV2H_IVC_MIN_WIDTH,
> +                               RZV2H_IVC_MAX_WIDTH);
> +       sink_fmt->height =3D clamp(fmt->height, RZV2H_IVC_MIN_HEIGHT,
> +                                RZV2H_IVC_MAX_HEIGHT);
> +
> +       *fmt =3D *sink_fmt;
> +
> +       src_fmt =3D v4l2_subdev_state_get_format(state,
> +                                              RZV2H_IVC_SUBDEV_SOURCE_PA=
D);
> +       *src_fmt =3D *sink_fmt;
> +       src_fmt->code =3D rzv2h_ivc_get_mbus_output_from_input(sink_fmt->=
code);
> +
> +       return 0;
> +}
> +
> +static int rzv2h_ivc_enable_streams(struct v4l2_subdev *sd,
> +                                   struct v4l2_subdev_state *state, u32 =
pad,
> +                                   u64 streams_mask)
> +{
> +       /*
> +        * We have a single source pad, which has a single stream. V4L2 c=
ore has
> +        * already validated those things. The actual power-on and progra=
mming
> +        * of registers will be done through the video device's .vidioc_s=
treamon
> +        * so there's nothing to actually do here...
> +        */
> +
> +       return 0;
> +}
> +
> +static int rzv2h_ivc_disable_streams(struct v4l2_subdev *sd,
> +                                    struct v4l2_subdev_state *state, u32=
 pad,
> +                                    u64 streams_mask)
> +{
> +       return 0;
> +}
> +
> +static const struct v4l2_subdev_pad_ops rzv2h_ivc_pad_ops =3D {
> +       .enum_mbus_code         =3D rzv2h_ivc_enum_mbus_code,
> +       .enum_frame_size        =3D rzv2h_ivc_enum_frame_size,
> +       .get_fmt                =3D v4l2_subdev_get_fmt,
> +       .set_fmt                =3D rzv2h_ivc_set_fmt,
> +       .enable_streams         =3D rzv2h_ivc_enable_streams,
> +       .disable_streams        =3D rzv2h_ivc_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_core_ops rzv2h_ivc_core_ops =3D {
> +       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> +       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_ops rzv2h_ivc_subdev_ops =3D {
> +       .core   =3D &rzv2h_ivc_core_ops,
> +       .pad    =3D &rzv2h_ivc_pad_ops,
> +};
> +
> +static int rzv2h_ivc_init_state(struct v4l2_subdev *sd,
> +                               struct v4l2_subdev_state *state)
> +{
> +       struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
> +
> +       sink_fmt =3D v4l2_subdev_state_get_format(state,
> +                                               RZV2H_IVC_SUBDEV_SINK_PAD=
);
> +       sink_fmt->width =3D RZV2H_IVC_DEFAULT_WIDTH;
> +       sink_fmt->height =3D RZV2H_IVC_DEFAULT_HEIGHT;
> +       sink_fmt->field =3D V4L2_FIELD_NONE;
> +       sink_fmt->code =3D MEDIA_BUS_FMT_SRGGB16_1X16;
> +       sink_fmt->colorspace =3D V4L2_COLORSPACE_RAW;
> +       sink_fmt->xfer_func =3D V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colo=
rspace);
> +       sink_fmt->ycbcr_enc =3D V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colo=
rspace);
> +       sink_fmt->quantization =3D V4L2_MAP_QUANTIZATION_DEFAULT(
> +               true, sink_fmt->colorspace, sink_fmt->ycbcr_enc);
> +
> +       src_fmt =3D v4l2_subdev_state_get_format(state,
> +                                              RZV2H_IVC_SUBDEV_SOURCE_PA=
D);
> +
> +       *src_fmt =3D *sink_fmt;
> +       src_fmt->code =3D MEDIA_BUS_FMT_SRGGB20_1X20;
> +
> +       return 0;
> +}
> +
> +static int rzv2h_ivc_registered(struct v4l2_subdev *sd)
> +{
> +       struct rzv2h_ivc *ivc =3D container_of(sd, struct rzv2h_ivc, subd=
ev.sd);
> +
> +       return rzv2h_ivc_init_vdev(ivc, sd->v4l2_dev);
> +}
> +
> +static const struct v4l2_subdev_internal_ops rzv2h_ivc_subdev_internal_o=
ps =3D {
> +       .init_state =3D rzv2h_ivc_init_state,
> +       .registered =3D rzv2h_ivc_registered,
> +};
> +
> +static int rzv2h_ivc_link_validate(struct media_link *link)
> +{
> +       struct video_device *vdev =3D
> +               media_entity_to_video_device(link->source->entity);
> +       struct rzv2h_ivc *ivc =3D video_get_drvdata(vdev);
> +       struct v4l2_subdev *sd =3D
> +               media_entity_to_v4l2_subdev(link->sink->entity);
> +       const struct rzv2h_ivc_format *fmt;
> +       const struct v4l2_pix_format_mplane *pix;
> +       struct v4l2_subdev_state *state;
> +       struct v4l2_mbus_framefmt *mf;
> +       unsigned int i;
> +       int ret =3D 0;
> +
> +       state =3D v4l2_subdev_lock_and_get_active_state(sd);
> +       mf =3D v4l2_subdev_state_get_format(state, link->sink->index);
> +
> +       pix =3D &ivc->format.pix;
> +       fmt =3D ivc->format.fmt;
> +
> +       if (mf->width !=3D pix->width || mf->height !=3D pix->height) {
> +               dev_dbg(ivc->dev,
> +                       "link '%s':%u -> '%s':%u not valid: %ux%u !=3D %u=
x%u\n",
> +                       link->source->entity->name, link->source->index,
> +                       link->sink->entity->name, link->sink->index,
> +                       mf->width, mf->height, pix->width, pix->height);
> +               ret =3D -EPIPE;
Do we want to continue further in case of error?

Cheers,
Prabhakar

> +       }
> +
> +       for (i =3D 0; i < ARRAY_SIZE(fmt->mbus_codes); i++)
> +               if (mf->code =3D=3D fmt->mbus_codes[i])
> +                       break;
> +
> +       if (i =3D=3D ARRAY_SIZE(fmt->mbus_codes)) {
> +               dev_dbg(ivc->dev,
> +                       "link '%s':%u -> '%s':%u not valid: pixel format =
%p4cc cannot produce mbus_code 0x%04x\n",
> +                       link->source->entity->name, link->source->index,
> +                       link->sink->entity->name, link->sink->index,
> +                       &pix->pixelformat, mf->code);
> +               ret =3D -EPIPE;
> +       }
> +
> +       v4l2_subdev_unlock_state(state);
> +
> +       return ret;
> +}
> +
> +static const struct media_entity_operations rzv2h_ivc_media_ops =3D {
> +       .link_validate =3D rzv2h_ivc_link_validate,
> +};
> +
> +int rzv2h_ivc_initialise_subdevice(struct rzv2h_ivc *ivc)
> +{
> +       struct v4l2_subdev *sd;
> +       int ret;
> +
> +       /* Initialise subdevice */
> +       sd =3D &ivc->subdev.sd;
> +       sd->dev =3D ivc->dev;
> +       v4l2_subdev_init(sd, &rzv2h_ivc_subdev_ops);
> +       sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EV=
ENTS;
> +       sd->entity.function =3D MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> +       sd->internal_ops =3D &rzv2h_ivc_subdev_internal_ops;
> +       sd->entity.ops =3D &rzv2h_ivc_media_ops;
> +
> +       ivc->subdev.pads[RZV2H_IVC_SUBDEV_SINK_PAD].flags =3D MEDIA_PAD_F=
L_SINK;
> +       ivc->subdev.pads[RZV2H_IVC_SUBDEV_SOURCE_PAD].flags =3D MEDIA_PAD=
_FL_SOURCE;
> +
> +       snprintf(sd->name, sizeof(sd->name), "rzv2h ivc block");
> +
> +       ret =3D media_entity_pads_init(&sd->entity, RZV2H_IVC_NUM_SUBDEV_=
PADS,
> +                                    ivc->subdev.pads);
> +       if (ret) {
> +               dev_err(ivc->dev, "failed to initialise media entity\n");
> +               return ret;
> +       }
> +
> +       ret =3D v4l2_subdev_init_finalize(sd);
> +       if (ret) {
> +               dev_err(ivc->dev, "failed to finalize subdev init\n");
> +               goto err_cleanup_subdev_entity;
> +       }
> +
> +       ret =3D v4l2_async_register_subdev(sd);
> +       if (ret) {
> +               dev_err(ivc->dev, "failed to register subdevice\n");
> +               goto err_cleanup_subdev;
> +       }
> +
> +       return 0;
> +
> +err_cleanup_subdev:
> +       v4l2_subdev_cleanup(sd);
> +err_cleanup_subdev_entity:
> +       media_entity_cleanup(&sd->entity);
> +
> +       return ret;
> +}
> +
> +void rzv2h_ivc_deinit_subdevice(struct rzv2h_ivc *ivc)
> +{
> +       struct v4l2_subdev *sd =3D &ivc->subdev.sd;
> +
> +       v4l2_subdev_cleanup(sd);
> +       media_entity_remove_links(&sd->entity);
> +       v4l2_async_unregister_subdev(sd);
> +       media_entity_cleanup(&sd->entity);
> +}
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b=
/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..b7fb2ef1964f882d49dce6cf7=
aa5c6d99ff450b0
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> @@ -0,0 +1,533 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H(P) Input Video Control Block driver
> + *
> + * Copyright (C) 2025 Ideas on Board Oy
> + */
> +
> +#include "rzv2h-ivc.h"
> +
> +#include <linux/cleanup.h>
> +#include <linux/iopoll.h>
> +#include <linux/lockdep.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/minmax.h>
> +#include <linux/mutex.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#define RZV2H_IVC_FIXED_HBLANK                 0x20
> +#define RZV2H_IVC_MIN_VBLANK(hts)              max(0x1b, 15 + (120501 / =
(hts)))
> +
> +struct rzv2h_ivc_buf {
> +       struct vb2_v4l2_buffer vb;
> +       struct list_head queue;
> +       dma_addr_t addr;
> +};
> +
> +#define to_rzv2h_ivc_buf(vbuf) \
> +       container_of(vbuf, struct rzv2h_ivc_buf, vb)
> +
> +static const struct rzv2h_ivc_format rzv2h_ivc_formats[] =3D {
> +       {
> +               .fourcc =3D V4L2_PIX_FMT_SBGGR8,
> +               .mbus_codes =3D {
> +                       MEDIA_BUS_FMT_SBGGR8_1X8,
> +               },
> +               .dtype =3D MIPI_CSI2_DT_RAW8,
> +       },
> +       {
> +               .fourcc =3D V4L2_PIX_FMT_SGBRG8,
> +               .mbus_codes =3D {
> +                       MEDIA_BUS_FMT_SGBRG8_1X8,
> +               },
> +               .dtype =3D MIPI_CSI2_DT_RAW8,
> +       },
> +       {
> +               .fourcc =3D V4L2_PIX_FMT_SGRBG8,
> +               .mbus_codes =3D {
> +                       MEDIA_BUS_FMT_SGRBG8_1X8,
> +               },
> +               .dtype =3D MIPI_CSI2_DT_RAW8,
> +       },
> +       {
> +               .fourcc =3D V4L2_PIX_FMT_SRGGB8,
> +               .mbus_codes =3D {
> +                       MEDIA_BUS_FMT_SRGGB8_1X8,
> +               },
> +               .dtype =3D MIPI_CSI2_DT_RAW8,
> +       },
> +       {
> +               .fourcc =3D V4L2_PIX_FMT_RAW_CRU10,
> +               .mbus_codes =3D {
> +                       MEDIA_BUS_FMT_SBGGR10_1X10,
> +                       MEDIA_BUS_FMT_SGBRG10_1X10,
> +                       MEDIA_BUS_FMT_SGRBG10_1X10,
> +                       MEDIA_BUS_FMT_SRGGB10_1X10
> +               },
> +               .dtype =3D MIPI_CSI2_DT_RAW10,
> +       },
> +       {
> +               .fourcc =3D V4L2_PIX_FMT_RAW_CRU12,
> +               .mbus_codes =3D {
> +                       MEDIA_BUS_FMT_SBGGR12_1X12,
> +                       MEDIA_BUS_FMT_SGBRG12_1X12,
> +                       MEDIA_BUS_FMT_SGRBG12_1X12,
> +                       MEDIA_BUS_FMT_SRGGB12_1X12
> +               },
> +               .dtype =3D MIPI_CSI2_DT_RAW12,
> +       },
> +       {
> +               .fourcc =3D V4L2_PIX_FMT_RAW_CRU14,
> +               .mbus_codes =3D {
> +                       MEDIA_BUS_FMT_SBGGR14_1X14,
> +                       MEDIA_BUS_FMT_SGBRG14_1X14,
> +                       MEDIA_BUS_FMT_SGRBG14_1X14,
> +                       MEDIA_BUS_FMT_SRGGB14_1X14
> +               },
> +               .dtype =3D MIPI_CSI2_DT_RAW14,
> +       },
> +       {
> +               .fourcc =3D V4L2_PIX_FMT_SBGGR16,
> +               .mbus_codes =3D {
> +                       MEDIA_BUS_FMT_SBGGR16_1X16,
> +               },
> +               .dtype =3D MIPI_CSI2_DT_RAW16,
> +       },
> +       {
> +               .fourcc =3D V4L2_PIX_FMT_SGBRG16,
> +               .mbus_codes =3D {
> +                       MEDIA_BUS_FMT_SGBRG16_1X16,
> +               },
> +               .dtype =3D MIPI_CSI2_DT_RAW16,
> +       },
> +       {
> +               .fourcc =3D V4L2_PIX_FMT_SGRBG16,
> +               .mbus_codes =3D {
> +                       MEDIA_BUS_FMT_SGRBG16_1X16,
> +               },
> +               .dtype =3D MIPI_CSI2_DT_RAW16,
> +       },
> +       {
> +               .fourcc =3D V4L2_PIX_FMT_SRGGB16,
> +               .mbus_codes =3D {
> +                       MEDIA_BUS_FMT_SRGGB16_1X16,
> +               },
> +               .dtype =3D MIPI_CSI2_DT_RAW16,
> +       },
> +};
> +
> +void rzv2h_ivc_buffer_done(struct rzv2h_ivc *ivc)
> +{
> +       struct rzv2h_ivc_buf *buf;
> +
> +       lockdep_assert_in_irq();
> +
> +       scoped_guard(spinlock, &ivc->buffers.lock) {
> +               if (!ivc->buffers.curr)
> +                       return;
> +
> +               buf =3D ivc->buffers.curr;
> +               ivc->buffers.curr =3D NULL;
> +       }
> +
> +       buf->vb.sequence =3D ivc->buffers.sequence++;
> +       vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +}
> +
> +static void rzv2h_ivc_transfer_buffer(struct work_struct *work)
> +{
> +       struct rzv2h_ivc *ivc =3D container_of(work, struct rzv2h_ivc,
> +                                            buffers.work);
> +       struct rzv2h_ivc_buf *buf;
> +
> +       /* Setup buffers */
> +       scoped_guard(spinlock_irqsave, &ivc->buffers.lock) {
> +               buf =3D list_first_entry_or_null(&ivc->buffers.queue,
> +                                              struct rzv2h_ivc_buf, queu=
e);
> +       }
> +
> +       if (!buf)
> +               return;
> +
> +       list_del(&buf->queue);
> +
> +       ivc->buffers.curr =3D buf;
> +       buf->addr =3D vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> +       rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_SADDL_P0, buf->addr);
> +
> +       scoped_guard(spinlock_irqsave, &ivc->spinlock) {
> +               ivc->vvalid_ifp =3D 2;
> +       }
> +       rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_FRCON, 0x1);
> +}
> +
> +static int rzv2h_ivc_queue_setup(struct vb2_queue *q, unsigned int *num_=
buffers,
> +                                unsigned int *num_planes, unsigned int s=
izes[],
> +                                struct device *alloc_devs[])
> +{
> +       struct rzv2h_ivc *ivc =3D vb2_get_drv_priv(q);
> +
> +       if (*num_planes && *num_planes > 1)
> +               return -EINVAL;
> +
> +       if (sizes[0] && sizes[0] < ivc->format.pix.plane_fmt[0].sizeimage=
)
> +               return -EINVAL;
> +
> +       *num_planes =3D 1;
> +
> +       if (!sizes[0])
> +               sizes[0] =3D ivc->format.pix.plane_fmt[0].sizeimage;
> +
> +       return 0;
> +}
> +
> +static void rzv2h_ivc_buf_queue(struct vb2_buffer *vb)
> +{
> +       struct rzv2h_ivc *ivc =3D vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +       struct rzv2h_ivc_buf *buf =3D to_rzv2h_ivc_buf(vbuf);
> +
> +       scoped_guard(spinlock_irq, &ivc->buffers.lock) {
> +               list_add_tail(&buf->queue, &ivc->buffers.queue);
> +       }
> +
> +       scoped_guard(spinlock_irq, &ivc->spinlock) {
> +               if (vb2_is_streaming(vb->vb2_queue) && !ivc->vvalid_ifp)
> +                       queue_work(ivc->buffers.async_wq, &ivc->buffers.w=
ork);
> +       }
> +}
> +
> +static void rzv2h_ivc_format_configure(struct rzv2h_ivc *ivc)
> +{
> +       const struct rzv2h_ivc_format *fmt =3D ivc->format.fmt;
> +       struct v4l2_pix_format_mplane *pix =3D &ivc->format.pix;
> +       unsigned int vblank;
> +       unsigned int hts;
> +
> +       /* Currently only CRU packed pixel formats are supported */
> +       rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_PXFMT,
> +                       RZV2H_IVC_INPUT_FMT_CRU_PACKED);
> +
> +       rzv2h_ivc_update_bits(ivc, RZV2H_IVC_REG_AXIRX_PXFMT,
> +                             RZV2H_IVC_PXFMT_DTYPE, fmt->dtype);
> +
> +       rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_HSIZE, pix->width);
> +       rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_VSIZE, pix->height);
> +       rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_STRD,
> +                       pix->plane_fmt[0].bytesperline);
> +
> +       /*
> +        * The ISP has minimum vertical blanking requirements that must b=
e
> +        * adhered to by the IVC. The minimum is a function of the Iridix=
 blocks
> +        * clocking requirements and the width of the image and horizonta=
l
> +        * blanking, but if we assume the worst case then it boils down t=
o the
> +        * below (plus one to the numerator to ensure the answer is round=
ed up)
> +        */
> +
> +       hts =3D pix->width + RZV2H_IVC_FIXED_HBLANK;
> +       vblank =3D RZV2H_IVC_MIN_VBLANK(hts);
> +
> +       rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_BLANK,
> +                       RZV2H_IVC_VBLANK(vblank));
> +}
> +
> +static void rzv2h_ivc_return_buffers(struct rzv2h_ivc *ivc,
> +                                    enum vb2_buffer_state state)
> +{
> +       struct rzv2h_ivc_buf *buf, *tmp;
> +
> +       guard(spinlock_irqsave)(&ivc->buffers.lock);
> +
> +       if (ivc->buffers.curr) {
> +               vb2_buffer_done(&ivc->buffers.curr->vb.vb2_buf, state);
> +               ivc->buffers.curr =3D NULL;
> +       }
> +
> +       list_for_each_entry_safe(buf, tmp, &ivc->buffers.queue, queue) {
> +               list_del(&buf->queue);
> +               vb2_buffer_done(&buf->vb.vb2_buf, state);
> +       }
> +}
> +
> +static int rzv2h_ivc_start_streaming(struct vb2_queue *q, unsigned int c=
ount)
> +{
> +       struct rzv2h_ivc *ivc =3D vb2_get_drv_priv(q);
> +       int ret;
> +
> +       ivc->buffers.sequence =3D 0;
> +       ivc->vvalid_ifp =3D 0;
> +
> +       ret =3D pm_runtime_resume_and_get(ivc->dev);
> +       if (ret)
> +               goto err_return_buffers;
> +
> +       ret =3D video_device_pipeline_alloc_start(&ivc->vdev.dev);
> +       if (ret) {
> +               dev_err(ivc->dev, "failed to start media pipeline\n");
> +               goto err_pm_runtime_put;
> +       }
> +
> +       rzv2h_ivc_format_configure(ivc);
> +
> +       queue_work(ivc->buffers.async_wq, &ivc->buffers.work);
> +
> +       return 0;
> +
> +err_pm_runtime_put:
> +       pm_runtime_put(ivc->dev);
> +err_return_buffers:
> +       rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_QUEUED);
> +
> +       return ret;
> +}
> +
> +static void rzv2h_ivc_stop_streaming(struct vb2_queue *q)
> +{
> +       struct rzv2h_ivc *ivc =3D vb2_get_drv_priv(q);
> +       u32 val =3D 0;
> +
> +       rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_STOP, 0x1);
> +       readl_poll_timeout(ivc->base + RZV2H_IVC_REG_FM_STOP,
> +                          val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_=
MSEC);
> +
> +       rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_ERROR);
> +       video_device_pipeline_stop(&ivc->vdev.dev);
> +       pm_runtime_put_autosuspend(ivc->dev);
> +}
> +
> +static const struct vb2_ops rzv2h_ivc_vb2_ops =3D {
> +       .queue_setup            =3D &rzv2h_ivc_queue_setup,
> +       .buf_queue              =3D &rzv2h_ivc_buf_queue,
> +       .wait_prepare           =3D vb2_ops_wait_prepare,
> +       .wait_finish            =3D vb2_ops_wait_finish,
> +       .start_streaming        =3D &rzv2h_ivc_start_streaming,
> +       .stop_streaming         =3D &rzv2h_ivc_stop_streaming,
> +};
> +
> +static const struct rzv2h_ivc_format *
> +rzv2h_ivc_format_from_pixelformat(u32 fourcc)
> +{
> +       for (unsigned int i =3D 0; i < ARRAY_SIZE(rzv2h_ivc_formats); i++=
)
> +               if (fourcc =3D=3D rzv2h_ivc_formats[i].fourcc)
> +                       return &rzv2h_ivc_formats[i];
> +
> +       return &rzv2h_ivc_formats[0];
> +}
> +
> +static int rzv2h_ivc_enum_fmt_vid_out(struct file *file, void *fh,
> +                                     struct v4l2_fmtdesc *f)
> +{
> +       if (f->index >=3D ARRAY_SIZE(rzv2h_ivc_formats))
> +               return -EINVAL;
> +
> +       f->pixelformat =3D rzv2h_ivc_formats[f->index].fourcc;
> +       return 0;
> +}
> +
> +static int rzv2h_ivc_g_fmt_vid_out(struct file *file, void *fh,
> +                                  struct v4l2_format *f)
> +{
> +       struct rzv2h_ivc *ivc =3D video_drvdata(file);
> +
> +       f->fmt.pix_mp =3D ivc->format.pix;
> +
> +       return 0;
> +}
> +
> +static void rzv2h_ivc_try_fmt(struct v4l2_pix_format_mplane *pix,
> +                             const struct rzv2h_ivc_format *fmt)
> +{
> +       pix->pixelformat =3D fmt->fourcc;
> +
> +       pix->width =3D clamp(pix->width, RZV2H_IVC_MIN_WIDTH,
> +                          RZV2H_IVC_MAX_WIDTH);
> +       pix->height =3D clamp(pix->height, RZV2H_IVC_MIN_HEIGHT,
> +                           RZV2H_IVC_MAX_HEIGHT);
> +
> +       pix->field =3D V4L2_FIELD_NONE;
> +       pix->colorspace =3D V4L2_COLORSPACE_RAW;
> +       pix->ycbcr_enc =3D V4L2_MAP_YCBCR_ENC_DEFAULT(pix->colorspace);
> +       pix->quantization =3D V4L2_MAP_QUANTIZATION_DEFAULT(true,
> +                                                         pix->colorspace=
,
> +                                                         pix->ycbcr_enc)=
;
> +
> +       v4l2_fill_pixfmt_mp(pix, pix->pixelformat, pix->width, pix->heigh=
t);
> +}
> +
> +static void rzv2h_ivc_set_format(struct rzv2h_ivc *ivc,
> +                                struct v4l2_pix_format_mplane *pix)
> +{
> +       const struct rzv2h_ivc_format *fmt;
> +
> +       fmt =3D rzv2h_ivc_format_from_pixelformat(pix->pixelformat);
> +
> +       rzv2h_ivc_try_fmt(pix, fmt);
> +       ivc->format.pix =3D *pix;
> +       ivc->format.fmt =3D fmt;
> +}
> +
> +static int rzv2h_ivc_s_fmt_vid_out(struct file *file, void *fh,
> +                                  struct v4l2_format *f)
> +{
> +       struct rzv2h_ivc *ivc =3D video_drvdata(file);
> +       struct v4l2_pix_format_mplane *pix =3D &f->fmt.pix_mp;
> +
> +       if (vb2_is_busy(&ivc->vdev.vb2q))
> +               return -EBUSY;
> +
> +       rzv2h_ivc_set_format(ivc, pix);
> +
> +       return 0;
> +}
> +
> +static int rzv2h_ivc_try_fmt_vid_out(struct file *file, void *fh,
> +                                    struct v4l2_format *f)
> +{
> +       const struct rzv2h_ivc_format *fmt;
> +
> +       fmt =3D rzv2h_ivc_format_from_pixelformat(f->fmt.pix.pixelformat)=
;
> +       rzv2h_ivc_try_fmt(&f->fmt.pix_mp, fmt);
> +
> +       return 0;
> +}
> +
> +static int rzv2h_ivc_querycap(struct file *file, void *fh,
> +                             struct v4l2_capability *cap)
> +{
> +       strscpy(cap->driver, "rzv2h-ivc", sizeof(cap->driver));
> +       strscpy(cap->card, "Renesas Input Video Control", sizeof(cap->car=
d));
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops rzv2h_ivc_v4l2_ioctl_ops =3D {
> +       .vidioc_reqbufs =3D vb2_ioctl_reqbufs,
> +       .vidioc_querybuf =3D vb2_ioctl_querybuf,
> +       .vidioc_create_bufs =3D vb2_ioctl_create_bufs,
> +       .vidioc_qbuf =3D vb2_ioctl_qbuf,
> +       .vidioc_expbuf =3D vb2_ioctl_expbuf,
> +       .vidioc_dqbuf =3D vb2_ioctl_dqbuf,
> +       .vidioc_prepare_buf =3D vb2_ioctl_prepare_buf,
> +       .vidioc_streamon =3D vb2_ioctl_streamon,
> +       .vidioc_streamoff =3D vb2_ioctl_streamoff,
> +       .vidioc_enum_fmt_vid_out =3D rzv2h_ivc_enum_fmt_vid_out,
> +       .vidioc_g_fmt_vid_out_mplane =3D rzv2h_ivc_g_fmt_vid_out,
> +       .vidioc_s_fmt_vid_out_mplane =3D rzv2h_ivc_s_fmt_vid_out,
> +       .vidioc_try_fmt_vid_out_mplane =3D rzv2h_ivc_try_fmt_vid_out,
> +       .vidioc_querycap =3D rzv2h_ivc_querycap,
> +       .vidioc_subscribe_event =3D v4l2_ctrl_subscribe_event,
> +       .vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
> +};
> +
> +static const struct v4l2_file_operations rzv2h_ivc_v4l2_fops =3D {
> +       .owner =3D THIS_MODULE,
> +       .unlocked_ioctl =3D video_ioctl2,
> +       .open =3D v4l2_fh_open,
> +       .release =3D vb2_fop_release,
> +       .poll =3D vb2_fop_poll,
> +       .mmap =3D vb2_fop_mmap,
> +};
> +
> +int rzv2h_ivc_init_vdev(struct rzv2h_ivc *ivc, struct v4l2_device *v4l2_=
dev)
> +{
> +       struct v4l2_pix_format_mplane pix =3D { };
> +       struct video_device *vdev;
> +       struct vb2_queue *vb2q;
> +       int ret;
> +
> +       spin_lock_init(&ivc->buffers.lock);
> +       INIT_LIST_HEAD(&ivc->buffers.queue);
> +       INIT_WORK(&ivc->buffers.work, rzv2h_ivc_transfer_buffer);
> +
> +       ivc->buffers.async_wq =3D alloc_workqueue("rzv2h-ivc", 0, 0);
> +       if (!ivc->buffers.async_wq)
> +               return -EINVAL;
> +
> +       /* Initialise vb2 queue */
> +       vb2q =3D &ivc->vdev.vb2q;
> +       vb2q->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +       vb2q->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +       vb2q->drv_priv =3D ivc;
> +       vb2q->mem_ops =3D &vb2_dma_contig_memops;
> +       vb2q->ops =3D &rzv2h_ivc_vb2_ops;
> +       vb2q->buf_struct_size =3D sizeof(struct rzv2h_ivc_buf);
> +       vb2q->min_queued_buffers =3D 0;
> +       vb2q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +       vb2q->lock =3D &ivc->lock;
> +       vb2q->dev =3D ivc->dev;
> +
> +       ret =3D vb2_queue_init(vb2q);
> +       if (ret) {
> +               dev_err(ivc->dev, "vb2 queue init failed\n");
> +               goto err_destroy_workqueue;
> +       }
> +
> +       /* Initialise Video Device */
> +       vdev =3D &ivc->vdev.dev;
> +       strscpy(vdev->name, "rzv2h-ivc", sizeof(vdev->name));
> +       vdev->release =3D video_device_release_empty;
> +       vdev->fops =3D &rzv2h_ivc_v4l2_fops;
> +       vdev->ioctl_ops =3D &rzv2h_ivc_v4l2_ioctl_ops;
> +       vdev->lock =3D &ivc->lock;
> +       vdev->v4l2_dev =3D v4l2_dev;
> +       vdev->queue =3D vb2q;
> +       vdev->device_caps =3D V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STR=
EAMING;
> +       vdev->vfl_dir =3D VFL_DIR_TX;
> +       video_set_drvdata(vdev, ivc);
> +
> +       pix.pixelformat =3D V4L2_PIX_FMT_SRGGB16;
> +       pix.width =3D RZV2H_IVC_DEFAULT_WIDTH;
> +       pix.height =3D RZV2H_IVC_DEFAULT_HEIGHT;
> +       rzv2h_ivc_set_format(ivc, &pix);
> +
> +       ivc->vdev.pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +       ret =3D media_entity_pads_init(&ivc->vdev.dev.entity, 1, &ivc->vd=
ev.pad);
> +       if (ret)
> +               goto err_release_vb2q;
> +
> +       ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +       if (ret) {
> +               dev_err(ivc->dev, "failed to register IVC video device\n"=
);
> +               goto err_cleanup_vdev_entity;
> +       }
> +
> +       ret =3D media_create_pad_link(&vdev->entity, 0, &ivc->subdev.sd.e=
ntity,
> +                                   RZV2H_IVC_SUBDEV_SINK_PAD,
> +                                   MEDIA_LNK_FL_ENABLED |
> +                                   MEDIA_LNK_FL_IMMUTABLE);
> +       if (ret) {
> +               dev_err(ivc->dev, "failed to create media link\n");
> +               goto err_unregister_vdev;
> +       }
> +
> +       return 0;
> +
> +err_unregister_vdev:
> +       video_unregister_device(vdev);
> +err_cleanup_vdev_entity:
> +       media_entity_cleanup(&vdev->entity);
> +err_release_vb2q:
> +       vb2_queue_release(vb2q);
> +err_destroy_workqueue:
> +       destroy_workqueue(ivc->buffers.async_wq);
> +
> +       return ret;
> +}
> +
> +void rzv2h_deinit_video_dev_and_queue(struct rzv2h_ivc *ivc)
> +{
> +       struct video_device *vdev =3D &ivc->vdev.dev;
> +       struct vb2_queue *vb2q =3D &ivc->vdev.vb2q;
> +
> +       vb2_video_unregister_device(vdev);
> +       media_entity_cleanup(&vdev->entity);
> +       vb2_queue_release(vb2q);
> +}
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h b/drive=
rs/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..64e4993209030df4dab187157=
dcf55996cbaf69b
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Renesas RZ/V2H(P) Input Video Control Block driver
> + *
> + * Copyright (C) 2025 Ideas on Board Oy
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/reset.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +#include <linux/videodev2.h>
> +#include <linux/workqueue.h>
> +
> +#include <media/media-entity.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#define RZV2H_IVC_REG_AXIRX_PLNUM                      0x0000
> +#define RZV2H_IVC_ONE_EXPOSURE                         0x00
> +#define RZV2H_IVC_TWO_EXPOSURE                         0x01
> +#define RZV2H_IVC_REG_AXIRX_PXFMT                      0x0004
> +#define RZV2H_IVC_INPUT_FMT_MIPI                       (0 << 16)
> +#define RZV2H_IVC_INPUT_FMT_CRU_PACKED                 (1 << 16)
> +#define RZV2H_IVC_PXFMT_DTYPE                          GENMASK(7, 0)
> +#define RZV2H_IVC_REG_AXIRX_SADDL_P0                   0x0010
> +#define RZV2H_IVC_REG_AXIRX_SADDH_P0                   0x0014
> +#define RZV2H_IVC_REG_AXIRX_SADDL_P1                   0x0018
> +#define RZV2H_IVC_REG_AXIRX_SADDH_P1                   0x001c
> +#define RZV2H_IVC_REG_AXIRX_HSIZE                      0x0020
> +#define RZV2H_IVC_REG_AXIRX_VSIZE                      0x0024
> +#define RZV2H_IVC_REG_AXIRX_BLANK                      0x0028
> +#define RZV2H_IVC_VBLANK(x)                            ((x) << 16)
> +#define RZV2H_IVC_REG_AXIRX_STRD                       0x0030
> +#define RZV2H_IVC_REG_AXIRX_ISSU                       0x0040
> +#define RZV2H_IVC_REG_AXIRX_ERACT                      0x0048
> +#define RZV2H_IVC_REG_FM_CONTEXT                       0x0100
> +#define RZV2H_IVC_SOFTWARE_CFG                         0x00
> +#define RZV2H_IVC_SINGLE_CONTEXT_SW_HW_CFG             BIT(0)
> +#define RZV2H_IVC_MULTI_CONTEXT_SW_HW_CFG              BIT(1)
> +#define RZV2H_IVC_REG_FM_MCON                          0x0104
> +#define RZV2H_IVC_REG_FM_FRCON                         0x0108
> +#define RZV2H_IVC_REG_FM_STOP                          0x010c
> +#define RZV2H_IVC_REG_FM_INT_EN                                0x0120
> +#define RZV2H_IVC_VVAL_IFPE                            BIT(0)
> +#define RZV2H_IVC_REG_FM_INT_STA                       0x0124
> +#define RZV2H_IVC_REG_AXIRX_FIFOCAP0                   0x0208
> +#define RZV2H_IVC_REG_CORE_CAPCON                      0x020c
> +#define RZV2H_IVC_REG_CORE_FIFOCAP0                    0x0228
> +#define RZV2H_IVC_REG_CORE_FIFOCAP1                    0x022c
> +
> +#define RZV2H_IVC_MIN_WIDTH                            640
> +#define RZV2H_IVC_MAX_WIDTH                            4096
> +#define RZV2H_IVC_MIN_HEIGHT                           480
> +#define RZV2H_IVC_MAX_HEIGHT                           4096
> +#define RZV2H_IVC_DEFAULT_WIDTH                                1920
> +#define RZV2H_IVC_DEFAULT_HEIGHT                       1080
> +
> +#define RZV2H_IVC_NUM_HW_RESOURCES                     3
> +
> +struct device;
> +
> +enum rzv2h_ivc_subdev_pads {
> +       RZV2H_IVC_SUBDEV_SINK_PAD,
> +       RZV2H_IVC_SUBDEV_SOURCE_PAD,
> +       RZV2H_IVC_NUM_SUBDEV_PADS
> +};
> +
> +struct rzv2h_ivc_format {
> +       u32 fourcc;
> +       /*
> +        * The CRU packed pixel formats are bayer-order agnostic, so each=
 could
> +        * support any one of the 4 possible media bus formats.
> +        */
> +       u32 mbus_codes[4];
> +       u8 dtype;
> +};
> +
> +struct rzv2h_ivc {
> +       struct device *dev;
> +       void __iomem *base;
> +       struct clk_bulk_data clks[RZV2H_IVC_NUM_HW_RESOURCES];
> +       struct reset_control_bulk_data resets[RZV2H_IVC_NUM_HW_RESOURCES]=
;
> +       int irqnum;
> +       u8 vvalid_ifp;
> +
> +       struct {
> +               struct video_device dev;
> +               struct vb2_queue vb2q;
> +               struct media_pad pad;
> +       } vdev;
> +
> +       struct {
> +               struct v4l2_subdev sd;
> +               struct media_pad pads[RZV2H_IVC_NUM_SUBDEV_PADS];
> +       } subdev;
> +
> +       struct {
> +               /* Spinlock to guard buffer queue */
> +               spinlock_t lock;
> +               struct workqueue_struct *async_wq;
> +               struct work_struct work;
> +               struct list_head queue;
> +               struct rzv2h_ivc_buf *curr;
> +               unsigned int sequence;
> +       } buffers;
> +
> +       struct {
> +               struct v4l2_pix_format_mplane pix;
> +               const struct rzv2h_ivc_format *fmt;
> +       } format;
> +
> +       /* Mutex to provide to vb2 */
> +       struct mutex lock;
> +       /* Lock to protect the interrupt counter */
> +       spinlock_t spinlock;
> +};
> +
> +int rzv2h_ivc_init_vdev(struct rzv2h_ivc *ivc, struct v4l2_device *v4l2_=
dev);
> +void rzv2h_deinit_video_dev_and_queue(struct rzv2h_ivc *ivc);
> +void rzv2h_ivc_buffer_done(struct rzv2h_ivc *ivc);
> +int rzv2h_ivc_initialise_subdevice(struct rzv2h_ivc *ivc);
> +void rzv2h_ivc_deinit_subdevice(struct rzv2h_ivc *ivc);
> +void rzv2h_ivc_write(struct rzv2h_ivc *ivc, u32 addr, u32 val);
> +void rzv2h_ivc_update_bits(struct rzv2h_ivc *ivc, unsigned int addr,
> +                          u32 mask, u32 val);
>
> --
> 2.43.0
>
>

