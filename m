Return-Path: <linux-media+bounces-38419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B8FB10FF2
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 18:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA2867AA89D
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CBC2EA735;
	Thu, 24 Jul 2025 16:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFGPmoZQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8006117A318;
	Thu, 24 Jul 2025 16:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753375989; cv=none; b=uUXOY48UjGW+TNxkbAdI4K9dQ3WERLAiA4EW7z36M+ScJAI/hukNplQQw3ZsVgluFNuVpqSJtHZZWVqYKhRbCvrytiprUn6YDpRz/j9eYSl1cH19TWrddcTeDPdC/4dzziIRBSLzfENVXmqoONbH8mCFY4s1ITh6MUrxIg/AoOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753375989; c=relaxed/simple;
	bh=RPFTWQjJq7t352u/7yfijJPQX6YI3jQpOdzPpYZRyqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3bmK1VggXBRQn36IJzwNfDRgyqBYodI5+ZTPQlliF5VYBTxph2AcS+Gdl9JEyk2HsfLZo6Oyu4cL4vb1bN4x/AFGwRNfJf5CCd3f7WoEI0M+aDOV4MiFiGTu6NkS8YhuJVPoUMkl2xsQKMtsTIrgQD+kmif/S9zh8pbGoJ18p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFGPmoZQ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a575a988f9so746289f8f.0;
        Thu, 24 Jul 2025 09:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753375984; x=1753980784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/CekTkP/h/gv4OVSd7deA47r1bR5gUAYOsxIHs6IZU=;
        b=UFGPmoZQ/DvTng7ewlAdmQDaFdj4e2cxnbtRzopYQX2/zpIJbohQzIye6DXgdbwGKC
         NvNwN7x/v7rpOo4FDHqYnklcnf/BMl0qOqrAin8Bjd1Tb+qfGWWq93mdlRvzRXgbvTpN
         J4PSFb03HSgwrNkcx35FXa3UbcJelp+7CFz+wL0Hr16vusIOuxETOjEGq0S6pRS3mVub
         0oQBjtq68sRT2aizn7gGGtdGO/QGan8kEiKqFnWLoE9jh1Be6U6aFcwlW+5kyJfyrid/
         q6rHsq4gNrUjJ2nWZnsho9rWEHhedng/7tISGyWXu2MhRJ3MVoi4ZG25fcwUcbdFAxWf
         MHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753375984; x=1753980784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/CekTkP/h/gv4OVSd7deA47r1bR5gUAYOsxIHs6IZU=;
        b=DXyqVTkCqUAFocehDxe2J/eqFRJAbP8cYajd7ilymlhB1E7QCa9qbXhoJW1vNOvBLg
         YvfAgdbmX6LIMZ8tDzuw/hRZqzC0/fKkuMDwEtf1Dz1Kr8a1A7dZl8cgArIWzlB2LujB
         JgLYSUUabfeUs//LhAQ5UjKEy8QsxqPzucy2/RgzUaMOJfP6ceNS17pY4P2efzTgRUmD
         UnN8aqcY1VdZcNwd7J1XV5vpjMQiJqjIu5qdl3jlyziFwLL/hZv4hGI7eh0FfVIWiNHr
         1p3bBOBcwH9HHW6eyat3fh51eNTjJ0wq7DnbzlyS0iXofDL5xUElZ6Px3We8+VBwjPpV
         aItQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWXmM+tU2bwKoe9jzxC9WytWOTjqdGL6XpmiLngxiHcNgBS+zNT7OkAIxTkWYnAHNh1bu442vnknPA@vger.kernel.org, AJvYcCXvgtoRGFjid1+db0z88ze7GuZy28yUWiiiM1/gyddtA3fLExayn0c0PLA0uRVSIXf5D3H8zyUbRLSKArYtYmJ/+ME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yylw2TDxpjMAokQ92DmuEzC0YlZSDtfkEZko9mDR046QAPUhFFu
	xmZvHDrXX34GUkMl5E4RQ3f/4Fi65Z/PJ+gVwYtoIkfzBXN6SlgkhGmw5FuimxeeJ0bcx51DQo7
	uWQqPBdZOcgw/jKvXOLnH+A92tJnENbuUdUCz
X-Gm-Gg: ASbGncueUfHM1pUcGCyB2vAhHTGU0fjgpqJXJkBbzV0uLJrEmvMqNl9wglo4i/WLCFD
	Hc8Om+PTfhYydeR1fXC3r5OmZsY5awYkSDmn/t8yVwu0fr6HB4dz7cY6IXhcBDF9l3QNdB6l8xR
	fqK17KZthhWLVAllOEKDtFzsGGqzo/pB0KQ0XtULMGd0eM6cnoAgDQeP6+Dp66gLaIretLmVv4K
	2nJinzP
X-Google-Smtp-Source: AGHT+IEaH/QojWxZwswwUyzZl56blnpwjrUR0oSZc4apwLlqI7DXLumid0YCafwAGahxsdpmE4HfxhYrXlXWI8hrZ+s=
X-Received: by 2002:a05:6000:290e:b0:3a6:d7ec:c701 with SMTP id
 ffacd0b85a97d-3b768f1ab39mr5837402f8f.30.1753375983121; Thu, 24 Jul 2025
 09:53:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714-ivc-v4-0-534ea488c738@ideasonboard.com> <20250714-ivc-v4-2-534ea488c738@ideasonboard.com>
In-Reply-To: <20250714-ivc-v4-2-534ea488c738@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Jul 2025 17:52:35 +0100
X-Gm-Features: Ac12FXzKK_YmI8q1QdPlXg6Pk7iOCVypR8Bg-si68jd11CWdvdVg7vvU3dZZMBk
Message-ID: <CA+V-a8s-WA8wyka6Z3Y-Fp1xNbcB=i8wPucJqA-nsp_fOKk=BQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] media: platform: Add Renesas Input Video Control
 block driver
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, jacopo.mondi@ideasonboard.com, 
	biju.das.jz@bp.renesas.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thank you for the patch.

On Mon, Jul 14, 2025 at 4:25=E2=80=AFPM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> Add a driver for the Input Video Control block in an RZ/V2H SoC which
> feeds data into the Arm Mali-C55 ISP.
>
s/V2H/V2HP everywhere.

> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
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
>  .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     | 229 +++++++++
>  .../platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c  | 376 ++++++++++++++
>  .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 568 +++++++++++++++=
++++++
>  .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   | 131 +++++
>  8 files changed, 1329 insertions(+)
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
> index 0000000000000000000000000000000000000000..5a4a3c052a3ae0f242e844689=
132d91a75b8a302
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config VIDEO_RZV2H_IVC
> +       tristate "Renesas RZ/V2H Input Video Control block driver"
> +       depends on V4L_PLATFORM_DRIVERS
> +       depends on VIDEO_DEV
> +       depends on ARCH_RENESAS || COMPILE_TEST
> +       depends on OF
> +       select CONFIG_PM
> +       select VIDEOBUF2_DMA_CONTIG
> +       select MEDIA_CONTROLLER
> +       select VIDEO_V4L2_SUBDEV_API
> +       help
> +          Support for the Renesas RZ/V2H Input Video Control Block
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
> index 0000000000000000000000000000000000000000..ce2e3a3af8d19900241add7d2=
61f7a40f2551265
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H Input Video Control Block driver
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
> +       const char * const resource_names[RZV2H_IVC_NUM_HW_RESOURCES] =3D=
 {
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
> +        * RZ/V2H documentation says software controlled single context m=
ode is
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
> +       if (!--ivc->vvalid_ifp)
> +               queue_work(ivc->buffers.async_wq, &ivc->buffers.work);
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
> +       SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                               pm_runtime_force_resume)
> +       RUNTIME_PM_OPS(rzv2h_ivc_runtime_suspend, rzv2h_ivc_runtime_resum=
e,
> +                          NULL)
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
> +       if (ivc->irqnum < 0) {
> +               dev_err(dev, "failed to get interrupt\n");
dev_err_probe()

> +               return ret;
> +       }
> +
> +       ret =3D rzv2h_ivc_initialise_subdevice(ivc);
> +       if (ret)
> +               return ret;
we could drop the below statement and just do `return
rzv2h_ivc_initialise_subdevice(ivc);`

> +
> +       return 0;
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
> +       { /* Sentinel */ },
`,` not needed.

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
> +MODULE_DESCRIPTION("Renesas RZ/V2H Input Video Control Block driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c =
b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..eb2913153d406fbad2491bb36=
e1c5ea754bea6f2
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
> @@ -0,0 +1,376 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H Input Video Control Block driver
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
> +                       mf->width, mf->height,
> +                       pix->width, pix->height);
> +               ret =3D -EPIPE;
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
> index 0000000000000000000000000000000000000000..005a5700b5e2351b1e7ba5d99=
539ce4468f3db8b
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> @@ -0,0 +1,568 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H Input Video Control Block driver
> + *
> + * Copyright (C) 2025 Ideas on Board Oy
> + */
> +
> +#include "rzv2h-ivc.h"
> +
> +#include <linux/cleanup.h>
> +#include <linux/iopoll.h>
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
> +static void rzv2h_ivc_transfer_buffer(struct work_struct *work)
> +{
> +       struct rzv2h_ivc *ivc =3D container_of(work, struct rzv2h_ivc,
> +                                            buffers.work);
> +       struct rzv2h_ivc_buf *buf;
> +
> +       scoped_guard(spinlock, &ivc->buffers.lock) {
> +               if (ivc->buffers.curr) {
> +                       ivc->buffers.curr->vb.sequence =3D ivc->buffers.s=
equence++;
> +                       vb2_buffer_done(&ivc->buffers.curr->vb.vb2_buf,
> +                                       VB2_BUF_STATE_DONE);
> +                       ivc->buffers.curr =3D NULL;
> +               }
> +
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
> +static int rzv2h_ivc_pipeline_started(struct media_entity *entity)
> +{
> +       struct video_device *vdev =3D media_entity_to_video_device(entity=
);
> +       struct rzv2h_ivc *ivc =3D video_get_drvdata(vdev);
> +
> +       guard(spinlock)(&ivc->buffers.lock);
> +
> +       if (list_empty(&ivc->buffers.queue)) {
> +               /*
> +                * The driver waits for interrupts to send a new frame an=
d
> +                * tracks their receipt in the vvalid_ifp variable. .buf_=
queue()
> +                * will queue work if vvalid_ifp =3D=3D 0 to trigger a ne=
w frame (an
> +                * event that normally would only occur if no buffer was =
ready
> +                * when the interrupt arrived). If there are no buffers i=
n the
> +                * queue yet, we set vvalid_ifp to zero so that the next =
queue
> +                * will trigger the work.
> +                */
> +               scoped_guard(spinlock_irqsave, &ivc->spinlock) {
> +                       ivc->vvalid_ifp =3D 0;
> +               }
> +       } else {
> +               queue_work(ivc->buffers.async_wq, &ivc->buffers.work);
> +       }
> +
> +       return 0;
> +}
> +
> +static void rzv2h_ivc_pipeline_stopped(struct media_entity *entity)
> +{
> +       struct video_device *vdev =3D media_entity_to_video_device(entity=
);
> +       struct rzv2h_ivc *ivc =3D video_get_drvdata(vdev);
> +       u32 val =3D 0;
> +
> +       rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_STOP, 0x1);
> +       readl_poll_timeout(ivc->base + RZV2H_IVC_REG_FM_STOP,
> +                          val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_=
MSEC);
> +}
> +
> +static const struct media_entity_operations rzv2h_ivc_media_ops =3D {
> +       .pipeline_started =3D rzv2h_ivc_pipeline_started,
> +       .pipeline_stopped =3D rzv2h_ivc_pipeline_stopped,
> +};
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
> +       scoped_guard(spinlock, &ivc->buffers.lock) {
> +               list_add_tail(&buf->queue, &ivc->buffers.queue);
> +       }
> +
> +       scoped_guard(spinlock_irqsave, &ivc->spinlock) {
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
> +       guard(spinlock)(&ivc->buffers.lock);
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
> +       ivc->vvalid_ifp =3D 2;
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
> +       ret =3D video_device_pipeline_started(&ivc->vdev.dev);
> +       if (ret < 0)
> +               goto err_stop_pipeline;
> +
> +       return 0;
> +
> +err_stop_pipeline:
> +       video_device_pipeline_stop(&ivc->vdev.dev);
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
> +
> +       video_device_pipeline_stopped(&ivc->vdev.dev);
> +       rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_ERROR);
> +       video_device_pipeline_stop(&ivc->vdev.dev);
> +       pm_runtime_mark_last_busy(ivc->dev);
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
> +       ivc->vdev.dev.entity.ops =3D &rzv2h_ivc_media_ops;
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
> +       if (!ivc->sched)
> +               return;
> +
> +       vb2_video_unregister_device(vdev);
> +       media_entity_cleanup(&vdev->entity);
> +       vb2_queue_release(vb2q);
> +}
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h b/drive=
rs/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..709c6a9398fe2484c2acb03d4=
43d58ea4e153a66
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> @@ -0,0 +1,131 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Renesas RZ/V2H Input Video Control Block driver
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
> +       struct media_job_scheduler *sched;
This is unused, we are just checking if  !=3DNULL in deinit.

I gave these patch a try on next-20250724.

ISP Probe:
[   11.600383] mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.3103202=
2.0
[   11.622062] mali-c55 16080000.isp: Runtime PM usage count underflow!

Logs from IVC:
root@rzv2h-evk:~/c55# media-ctl -p
Media controller API version 6.16.0

Media device information
------------------------
driver          mali-c55
model           ARM Mali-C55 ISP
serial
bus info        platform:16080000.isp
hw revision     0x1d982d6
driver version  6.16.0

Device topology
- entity 1: mali-c55 tpg (1 pad, 1 link, 0 routes)
            type V4L2 subdev subtype Sensor flags 0
            device node name /dev/v4l-subdev0
        pad0: SOURCE
                [stream:0 fmt:SRGGB20_1X20/1920x1080 field:none
colorspace:raw xfer:none ycbcr:601 quantization:lim-range]
                -> "mali-c55 isp":0 []

- entity 3: mali-c55 isp (5 pads, 6 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev1
        pad0: SINK,MUST_CONNECT
                [stream:0 fmt:SGRBG20_1X20/2304x1296 field:none
colorspace:raw xfer:none ycbcr:601 quantization:lim-range
                 crop:(0,0)/2304x1296]
                <- "mali-c55 tpg":0 []
                <- "rzv2h ivc block":1 [ENABLED]
        pad1: SOURCE
                [stream:0 fmt:RGB121212_1X36/2304x1296 field:none
colorspace:srgb xfer:none ycbcr:601 quantization:lim-range]
                -> "mali-c55 resizer fr":0 [ENABLED,IMMUTABLE]
        pad2: SOURCE
                [stream:0 fmt:SGRBG20_1X20/2304x1296 field:none
colorspace:raw xfer:none ycbcr:601 quantization:lim-range]
                -> "mali-c55 resizer fr":2 [ENABLED,IMMUTABLE]
        pad3: SOURCE
                [stream:0 fmt:unknown/0x0 field:none]
                -> "mali-c55 3a stats":0 []
        pad4: SINK
                [stream:0 fmt:unknown/0x0 field:none]
                <- "mali-c55 3a params":0 []

- entity 9: mali-c55 resizer fr (3 pads, 3 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev2
        pad0: SINK
                [stream:0 fmt:RGB121212_1X36/2304x1296 field:none
colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
                 crop:(0,0)/2304x1296
                 compose:(0,0)/2304x1296]
                <- "mali-c55 isp":1 [ENABLED,IMMUTABLE]
        pad1: SOURCE
                [stream:0 fmt:RGB121212_1X36/2304x1296 field:none
colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
                -> "mali-c55 fr":0 [ENABLED]
        pad2: SINK
                <- "mali-c55 isp":2 [ENABLED,IMMUTABLE]

- entity 13: mali-c55 fr (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video0
        pad0: SINK
                <- "mali-c55 resizer fr":1 [ENABLED]

- entity 17: mali-c55 3a params (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video1
        pad0: SOURCE
                -> "mali-c55 isp":4 []

- entity 21: mali-c55 3a stats (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video2
        pad0: SINK
                <- "mali-c55 isp":3 []

- entity 37: rzv2h ivc block (2 pads, 2 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev3
        pad0: SINK
                [stream:0 fmt:SGRBG10_1X10/2304x1296 field:none
colorspace:raw xfer:none ycbcr:601 quantization:full-range]
                <- "rzv2h-ivc":0 [ENABLED,IMMUTABLE]
        pad1: SOURCE
                [stream:0 fmt:SGRBG20_1X20/2304x1296 field:none
colorspace:raw xfer:none ycbcr:601 quantization:full-range]
                -> "mali-c55 isp":0 [ENABLED]

- entity 40: rzv2h-ivc (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video3
        pad0: SOURCE
                -> "rzv2h ivc block":0 [ENABLED,IMMUTABLE]

root@rzv2h-evk:~/c55#
root@rzv2h-evk:~# v4l2-ctl -d3 --stream-out-mmap
--stream-from=3D/root/c55/frame-15.bin --stream-loop
>>>> VIDIOC_STREAMON returned -1 (Input/output error)
root@rzv2h-evk:~#

Logs from ISP:
root@rzv2h-evk:~/c55# ./isp.sh
Device /dev/video0 opened.
Device `ARM Mali-C55 ISP' on `platform:16080000.isp' (driver
'mali-c55') supports video, capture, with mplanes.
Video format set: RGB565 (50424752) 2304x1296 field none, 1 planes:
 * Stride 4608, buffer size 5971968
Video format: RGB565 (50424752) 2304x1296 field none, 1 planes:
 * Stride 4608, buffer size 5971968
8 buffers requested.
length: 1 offset: 4017363672 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffff81f2e000.
length: 1 offset: 4017363672 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffff8197c000.
length: 1 offset: 4017363672 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffff813ca000.
length: 1 offset: 4017363672 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffff80e18000.
length: 1 offset: 4017363672 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffff80866000.
length: 1 offset: 4017363672 timestamp type/source: mono/EoF
Buffer 5/0 mapped at address 0xffff802b4000.
length: 1 offset: 4017363672 timestamp type/source: mono/EoF
Buffer 6/0 mapped at address 0xffff7fd02000.
length: 1 offset: 4017363672 timestamp type/source: mono/EoF
Buffer 7/0 mapped at address 0xffff7f750000.
[   92.647719] kauditd_printk_skb: 8 callbacks suppressed
[   92.647734] audit: type=3D1006 audit(1753371566.385:25): pid=3D407
uid=3D0 old-auid=3D4294967295 auid=3D0 tty=3D(none) old-ses=3D4294967295 se=
s=3D4
res=3D1
[   92.665263] audit: type=3D1300 audit(1753371566.385:25):
arch=3Dc00000b7 syscall=3D64 success=3Dyes exit=3D1 a0=3D7 a1=3Dffffc4ff574=
0 a2=3D1
a3=3D1 items=3D0 ppid=3D1 pid=3D407 auid=3D0 uid=3D0 gid=3D0 euid=3D0 suid=
=3D0 fsuid=3D0
egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4 comm=3D"sshd"
exe=3D"/usr/sbin/sshd" key=3D(null)
[   92.689604] audit: type=3D1327 audit(1753371566.385:25):
proctitle=3D737368643A20726F6F74205B707269765D

[  100.932191] rz-dmac 11400000.dma-controller: dma_sync_wait: timeout!
[  100.938566] mali-c55 16080000.isp: Failed to DMA xfer ISP config
[  100.944702] mali-c55 16080000.isp: failed to write ISP config
[  100.950562] mali-c55 16080000.isp: Failed to start ISP

Cheers,
Prabhakar

