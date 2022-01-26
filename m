Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8A149C6C6
	for <lists+linux-media@lfdr.de>; Wed, 26 Jan 2022 10:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbiAZJrS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jan 2022 04:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbiAZJrR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jan 2022 04:47:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C17DC06161C;
        Wed, 26 Jan 2022 01:47:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07F52478;
        Wed, 26 Jan 2022 10:47:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643190435;
        bh=2WiLyVTUBql9jQVHlWK4OlGsUtAPEUzER6s1TGfqyFA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tqBU+M/Nd+vwCmriWIsMMIxc25UhD2vnwfKcZ9JBzDOJhn3xxCFiMaen48j3ftJjN
         AtrNAJigUiPq9PpF23ZSxjvCiMoHMlFXHz/sD99CoHZLrwD0eA8X3M9snqmBz5dH1/
         zHZtTRR/sJtHfypjn56hQihcjnu/hXaGNPWmyDvk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220123160857.24161-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com> <20220123160857.24161-2-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/6] media: Define MIPI CSI-2 data types in a shared header file
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Pratyush Yadav <p.yadav@ti.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Wed, 26 Jan 2022 09:47:12 +0000
Message-ID: <164319043247.533872.16458073657870076497@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Quoting Laurent Pinchart (2022-01-23 16:08:52)
> There are many CSI-2-related drivers in the media subsystem that come
> with their own macros to handle the CSI-2 data types (or just hardcode
> the numerical values). Provide a shared header with definitions for
> those data types that driver can use.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  include/media/mipi-csi2.h | 45 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 include/media/mipi-csi2.h
>=20
> diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
> new file mode 100644
> index 000000000000..392794e5badd
> --- /dev/null
> +++ b/include/media/mipi-csi2.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * MIPI CSI-2 Data Types
> + *
> + * Copyright (C) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.co=
m>
> + */
> +
> +#ifndef _MEDIA_MIPI_CSI2_H
> +#define _MEDIA_MIPI_CSI2_H
> +
> +/* Short packet data types */
> +#define MIPI_CSI2_DT_FS                        0x00
> +#define MIPI_CSI2_DT_FE                        0x01
> +#define MIPI_CSI2_DT_LS                        0x02
> +#define MIPI_CSI2_DT_LE                        0x03
> +#define MIPI_CSI2_DT_GENERIC_SHORT(n)  (0x08 + (n))    /* 0..7 */
> +
> +/* Long packet data types */
> +#define MIPI_CSI2_DT_NULL              0x10
> +#define MIPI_CSI2_DT_BLANKING          0x11
> +#define MIPI_CSI2_DT_EMBEDDED_8B       0x12
> +#define MIPI_CSI2_DT_YUV420_8B         0x18
> +#define MIPI_CSI2_DT_YUV420_10B                0x19
> +#define MIPI_CSI2_DT_YUV420_8B_LEGACY  0x1a
> +#define MIPI_CSI2_DT_YUV420_8B_CS      0x1c
> +#define MIPI_CSI2_DT_YUV420_10B_CS     0x1d
> +#define MIPI_CSI2_DT_YUV422_8B         0x1e
> +#define MIPI_CSI2_DT_YUV422_10B                0x1f
> +#define MIPI_CSI2_DT_RGB444            0x20
> +#define MIPI_CSI2_DT_RGB555            0x21
> +#define MIPI_CSI2_DT_RGB565            0x22
> +#define MIPI_CSI2_DT_RGB666            0x23
> +#define MIPI_CSI2_DT_RGB888            0x24
> +#define MIPI_CSI2_DT_RAW24             0x27
> +#define MIPI_CSI2_DT_RAW6              0x28
> +#define MIPI_CSI2_DT_RAW7              0x29
> +#define MIPI_CSI2_DT_RAW8              0x2a
> +#define MIPI_CSI2_DT_RAW10             0x2b
> +#define MIPI_CSI2_DT_RAW12             0x2c
> +#define MIPI_CSI2_DT_RAW14             0x2d
> +#define MIPI_CSI2_DT_RAW16             0x2e
> +#define MIPI_CSI2_DT_RAW20             0x2f
> +#define MIPI_CSI2_DT_USER_DEFINED(n)   (0x30 + (n))    /* 0..7 */

I don't have an easy way to validate those values right now so as with
Niklas I'll leave those to your judgement, and Pratyush's review.

Also along side Pratyush's comment, I concur that the mapping tables too
could be common, but I suspect that's an even bigger topic as maybe that
falls into the trap of also being common to DRM formats...

And finally, are these defines in a location that can be accessible from
device tree? Or would it have to be further duplicated there still?

For instance, the bindings for the Xilinx CSI2 RX explicitly list DT
values to specify as the xlnx,csi-pxl-format which I think should also
come from this common header definition.

For the patches here so far, I can't see anything stark that is wrong
so for the series:


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

as further extending this to the device tree bindings can be done on
top.


> +
> +#endif /* _MEDIA_MIPI_CSI2_H */
> --=20
> Regards,
>=20
> Laurent Pinchart
>
