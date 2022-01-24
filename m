Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181B2498373
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 16:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240242AbiAXPWr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 10:22:47 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:42052 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235210AbiAXPWq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 10:22:46 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20OFMQL1111141;
        Mon, 24 Jan 2022 09:22:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1643037746;
        bh=zOnzFu5sFzwZwDerNnUxer4nJpBoloZhQX4jqfxbdJE=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=Y1ktI5UX04I9Y+gVQ/o+bKzaVZZfqO+GiMxx4A6Hx3ls7cq5+ktz4Q8jukdlC7EtK
         j6FOl6pUq1VEPaHrrf56Khb/u0E9XlIEIM/Uao6JvZlthk7vtpQAgthB4jYCMoeMsX
         nRx09Zw4gKe1Iu3GBQgJ2oZdfv1g/zzdieGtTYRg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20OFMQsc097530
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 Jan 2022 09:22:26 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 24
 Jan 2022 09:22:25 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 24 Jan 2022 09:22:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20OFMPTj097128;
        Mon, 24 Jan 2022 09:22:25 -0600
Date:   Mon, 24 Jan 2022 20:52:24 +0530
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH 1/6] media: Define MIPI CSI-2 data types in a shared
 header file
Message-ID: <20220124152224.o46gxdxp3polw2eu@ti.com>
References: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220123160857.24161-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220123160857.24161-2-laurent.pinchart+renesas@ideasonboard.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the patch.

On 23/01/22 06:08PM, Laurent Pinchart wrote:
> There are many CSI-2-related drivers in the media subsystem that come
> with their own macros to handle the CSI-2 data types (or just hardcode
> the numerical values). Provide a shared header with definitions for
> those data types that driver can use.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  include/media/mipi-csi2.h | 45 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 include/media/mipi-csi2.h
> 
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
> + * Copyright (C) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + */
> +
> +#ifndef _MEDIA_MIPI_CSI2_H
> +#define _MEDIA_MIPI_CSI2_H
> +
> +/* Short packet data types */
> +#define MIPI_CSI2_DT_FS			0x00
> +#define MIPI_CSI2_DT_FE			0x01
> +#define MIPI_CSI2_DT_LS			0x02
> +#define MIPI_CSI2_DT_LE			0x03
> +#define MIPI_CSI2_DT_GENERIC_SHORT(n)	(0x08 + (n))	/* 0..7 */

IIUC there is currently no way to actually capture packets with these 
data types, and these are added here for completeness's sake, right?

> +
> +/* Long packet data types */
> +#define MIPI_CSI2_DT_NULL		0x10
> +#define MIPI_CSI2_DT_BLANKING		0x11
> +#define MIPI_CSI2_DT_EMBEDDED_8B	0x12
> +#define MIPI_CSI2_DT_YUV420_8B		0x18
> +#define MIPI_CSI2_DT_YUV420_10B		0x19
> +#define MIPI_CSI2_DT_YUV420_8B_LEGACY	0x1a
> +#define MIPI_CSI2_DT_YUV420_8B_CS	0x1c
> +#define MIPI_CSI2_DT_YUV420_10B_CS	0x1d
> +#define MIPI_CSI2_DT_YUV422_8B		0x1e
> +#define MIPI_CSI2_DT_YUV422_10B		0x1f
> +#define MIPI_CSI2_DT_RGB444		0x20
> +#define MIPI_CSI2_DT_RGB555		0x21
> +#define MIPI_CSI2_DT_RGB565		0x22
> +#define MIPI_CSI2_DT_RGB666		0x23
> +#define MIPI_CSI2_DT_RGB888		0x24
> +#define MIPI_CSI2_DT_RAW24		0x27

I have the CSI-2 spec v1.3, and it lists 0x27 as reserved under RGB 
Image data, and I don't see a data type value for RAW24. Where did you 
get this value from?

> +#define MIPI_CSI2_DT_RAW6		0x28
> +#define MIPI_CSI2_DT_RAW7		0x29
> +#define MIPI_CSI2_DT_RAW8		0x2a
> +#define MIPI_CSI2_DT_RAW10		0x2b
> +#define MIPI_CSI2_DT_RAW12		0x2c
> +#define MIPI_CSI2_DT_RAW14		0x2d
> +#define MIPI_CSI2_DT_RAW16		0x2e
> +#define MIPI_CSI2_DT_RAW20		0x2f

These two are also listed as reserved in the spec I have. Rest of the 
values look good to me.

> +#define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
> +
> +#endif /* _MEDIA_MIPI_CSI2_H */
> -- 
> Regards,
> 
> Laurent Pinchart
> 

I think this patch is a good idea in general, and it should remove a lot 
of repetition in the drivers.

BTW, I also see lots of drivers adding tables having mapping between 
MBUS formats, FOURCC formats, bpp, data type, etc. It would be useful to 
have those in a central place IMO.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
