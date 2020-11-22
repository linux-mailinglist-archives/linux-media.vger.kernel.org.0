Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C63D2BC2EE
	for <lists+linux-media@lfdr.de>; Sun, 22 Nov 2020 02:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbgKVBCa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Nov 2020 20:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbgKVBC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Nov 2020 20:02:29 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4299C0613D1
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2020 17:02:28 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id oq3so18258337ejb.7
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2020 17:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K9oj1jZNjwyubHbEqnynv/Se7vgMAMWMdAYmcz95zz4=;
        b=gl5hVqbvJq6lGDv65VLLiqYwVVAm7B6II0IjXvMyOIrz+3IEyepw7gAW8PJjwh6EWH
         rAE63Vkk5piYgj1aF6EuSNhUVZXT5367JFsQm1+XuX3FOUPZ8xTZUUSbncx0M33JRfDU
         vQfKgKTc9ApnZ5kGFQLD/ICX8UYq+LRLSQd2rS+fXDXSGZtnb4uOsPNUVpjX51E2O9hC
         ooCOZi9K4UnJ1OjYY19DRHqQ/vEG5E/+juICcTKi5ay5uDX1rQPX+eeAYtiWxWcBGIOY
         J89iSrgf0gTCXFVtNYfyKzueS5eslYawQ5k538XhMAHXdZ3fTi0nu9dn1VJA9dGEyyJC
         aOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K9oj1jZNjwyubHbEqnynv/Se7vgMAMWMdAYmcz95zz4=;
        b=PhBOfRrg+LzgIVC5k8mRoK3hBwnwNHluC3QiI6vcGJsDKL4Ea1Wh3z4JtsJGCSuNiS
         Pf2ZctKFggmxtsHzinKHdI9B6xTWivI4lMrna1TS3xaPJGJCDyj2cdh+yHOUjimDzpwl
         ZSi8Z0J3RK6NUvKcmXwRxeKlfoe8q4zTBuhYrCnBl9lyXnd2jgiYNVsFJAZ4+MMv4TSR
         oDLSKcRKv6Qukf6e+4yt57Pzy0mhnSPANt0+L85o5BpxWAM9mzl94B9EXPQXF2/bxhIN
         ppXsnukCQkhLfB6zcjsAVletFGfKx+XDUvHKxR0D6ZHWcySoWfCPRjbDEBdZhkgrgq/+
         m8Bw==
X-Gm-Message-State: AOAM532Nu3M07MFTwQ4PTHZfMoYJ54wihEC+HXB4b2pbQ8evfvtHEYjK
        zkg71vxSSEHTGhy/hz7kY+VAmfYeovf7B4tSG3/cxA==
X-Google-Smtp-Source: ABdhPJwtHhPutwaLggyGRigreNs+Yh/IGc/u3dvhTaCjpSNNitrzRtnUzEaROcW0wXLe6/ECG/ujJxHoUFAXGP6U7ok=
X-Received: by 2002:a17:906:1945:: with SMTP id b5mr38468149eje.388.1606006947375;
 Sat, 21 Nov 2020 17:02:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1513038011.git.digetx@gmail.com> <3d565db80f8dccafd14224924305243b37b75a07.1513038011.git.digetx@gmail.com>
In-Reply-To: <3d565db80f8dccafd14224924305243b37b75a07.1513038011.git.digetx@gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sat, 21 Nov 2020 22:02:15 -0300
Message-ID: <CAAEAJfBZD0u6MDxcp3See-agzyCSJS7dKpwK28LMJwPvE9DLtQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] staging: media: Introduce NVIDIA Tegra video
 decoder driver
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media <linux-media@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

On Mon, 11 Dec 2017 at 21:27, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> NVIDIA Tegra20/30/114/124/132 SoC's have video decoder engine that
> supports standard set of video formats like H.264 / MPEG-4 / WMV / VC1.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  MAINTAINERS                                 |    9 +
>  drivers/staging/media/Kconfig               |    2 +
>  drivers/staging/media/Makefile              |    1 +
>  drivers/staging/media/tegra-vde/Kconfig     |    7 +
>  drivers/staging/media/tegra-vde/Makefile    |    1 +
>  drivers/staging/media/tegra-vde/TODO        |    4 +
>  drivers/staging/media/tegra-vde/tegra-vde.c | 1213 +++++++++++++++++++++++++++
>  drivers/staging/media/tegra-vde/uapi.h      |   78 ++
>  8 files changed, 1315 insertions(+)
>  create mode 100644 drivers/staging/media/tegra-vde/Kconfig
>  create mode 100644 drivers/staging/media/tegra-vde/Makefile
>  create mode 100644 drivers/staging/media/tegra-vde/TODO
>  create mode 100644 drivers/staging/media/tegra-vde/tegra-vde.c
>  create mode 100644 drivers/staging/media/tegra-vde/uapi.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7d195739f892..7f7c24949a06 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8706,6 +8706,15 @@ T:       git git://linuxtv.org/media_tree.git
>  S:     Maintained
>  F:     drivers/media/dvb-frontends/stv6111*
>
> +MEDIA DRIVERS FOR NVIDIA TEGRA - VDE
> +M:     Dmitry Osipenko <digetx@gmail.com>
> +L:     linux-media@vger.kernel.org
> +L:     linux-tegra@vger.kernel.org
> +T:     git git://linuxtv.org/media_tree.git
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
> +F:     drivers/staging/media/tegra-vde/
> +
>  MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
>  M:     Mauro Carvalho Chehab <mchehab@s-opensource.com>
>  M:     Mauro Carvalho Chehab <mchehab@kernel.org>
> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
> index 3a09140700e6..227437f22acf 100644
> --- a/drivers/staging/media/Kconfig
> +++ b/drivers/staging/media/Kconfig
> @@ -31,4 +31,6 @@ source "drivers/staging/media/imx/Kconfig"
>
>  source "drivers/staging/media/omap4iss/Kconfig"
>
> +source "drivers/staging/media/tegra-vde/Kconfig"
> +
>  endif
> diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
> index f25327163c67..59a47f69884f 100644
> --- a/drivers/staging/media/Makefile
> +++ b/drivers/staging/media/Makefile
> @@ -5,3 +5,4 @@ obj-$(CONFIG_VIDEO_IMX_MEDIA)   += imx/
>  obj-$(CONFIG_VIDEO_DM365_VPFE) += davinci_vpfe/
>  obj-$(CONFIG_VIDEO_OMAP4)      += omap4iss/
>  obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
> +obj-$(CONFIG_TEGRA_VDE)                += tegra-vde/
> diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
> new file mode 100644
> index 000000000000..ec3ddddebdaa
> --- /dev/null
> +++ b/drivers/staging/media/tegra-vde/Kconfig
> @@ -0,0 +1,7 @@
> +config TEGRA_VDE
> +       tristate "NVIDIA Tegra Video Decoder Engine driver"
> +       depends on ARCH_TEGRA || COMPILE_TEST
> +       select SRAM
> +       help
> +           Say Y here to enable support for the NVIDIA Tegra video decoder
> +           driver.
> diff --git a/drivers/staging/media/tegra-vde/Makefile b/drivers/staging/media/tegra-vde/Makefile
> new file mode 100644
> index 000000000000..444c1d62daa1
> --- /dev/null
> +++ b/drivers/staging/media/tegra-vde/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_TEGRA_VDE)        += tegra-vde.o
> diff --git a/drivers/staging/media/tegra-vde/TODO b/drivers/staging/media/tegra-vde/TODO
> new file mode 100644
> index 000000000000..31aaa3e66d80
> --- /dev/null
> +++ b/drivers/staging/media/tegra-vde/TODO
> @@ -0,0 +1,4 @@
> +TODO:
> +       - Implement V4L2 API once it gains support for stateless decoders.
> +
> +Contact: Dmitry Osipenko <digetx@gmail.com>

The API for H264 stateless decoding is ready.
See https://lkml.org/lkml/2020/11/18/795.

One minor comment below.

> diff --git a/drivers/staging/media/tegra-vde/uapi.h b/drivers/staging/media/tegra-vde/uapi.h
> new file mode 100644
> index 000000000000..a50c7bcae057
> --- /dev/null
> +++ b/drivers/staging/media/tegra-vde/uapi.h
> @@ -0,0 +1,78 @@
> +/*
> + * Copyright (C) 2016-2017 Dmitry Osipenko <digetx@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#ifndef _UAPI_TEGRA_VDE_H_
> +#define _UAPI_TEGRA_VDE_H_
> +
> +#include <linux/types.h>
> +#include <asm/ioctl.h>
> +
> +#define FLAG_B_FRAME           (1 << 0)
> +#define FLAG_REFERENCE         (1 << 1)
> +
> +struct tegra_vde_h264_frame {
> +       __s32 y_fd;
> +       __s32 cb_fd;
> +       __s32 cr_fd;
> +       __s32 aux_fd;
> +       __u32 y_offset;
> +       __u32 cb_offset;
> +       __u32 cr_offset;
> +       __u32 aux_offset;
> +       __u32 frame_num;
> +       __u32 flags;
> +
> +       __u32 reserved;
> +} __attribute__((packed));
> +
> +struct tegra_vde_h264_decoder_ctx {
> +       __s32 bitstream_data_fd;
> +       __u32 bitstream_data_offset;
> +
> +       __u64 dpb_frames_ptr;
> +       __u8  dpb_frames_nb;
> +       __u8  dpb_ref_frames_with_earlier_poc_nb;
> +
> +       // SPS
> +       __u8  baseline_profile;
> +       __u8  level_idc;
> +       __u8  log2_max_pic_order_cnt_lsb;
> +       __u8  log2_max_frame_num;
> +       __u8  pic_order_cnt_type;
> +       __u8  direct_8x8_inference_flag;
> +       __u8  pic_width_in_mbs;
> +       __u8  pic_height_in_mbs;
> +
> +       // PPS
> +       __u8  pic_init_qp;
> +       __u8  deblocking_filter_control_present_flag;
> +       __u8  constrained_intra_pred_flag;
> +       __u8  chroma_qp_index_offset;
> +       __u8  pic_order_present_flag;
> +

This seems to be bottom_field_pic_order_in_frame_present_flag,
as there is no "pic_order_present_flag" syntax element.

Thanks,
Ezequiel
