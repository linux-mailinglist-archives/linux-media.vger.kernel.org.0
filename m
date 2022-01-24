Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41730497AF8
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 10:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236331AbiAXJGU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 04:06:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236284AbiAXJGT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 04:06:19 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D349C06173D
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 01:06:19 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id n23so10083366ljg.1
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 01:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=o/pd9eYE39D6+0/pijWJkJQfTRyYtE3DUkjzF4rb9hU=;
        b=k6epzFdtf8sUTfc/aLhHqJ7NOaiOjaTHghnPurVrCAprVkmWfwRmerY3NlaVUSFDbe
         +1qmuQ1+liVxp6Ae3DExt+bCvJub73ewLOUZX2wzflL0vZ0visBv4KHrahNSUZUZ/zPe
         KOei7Pd8hDKsf9uCnp8mnZqS+tZugUCRf8iRh8wAOsTnyfxPkRSd2Lpa9QMRWIwo1VFR
         85ilWOx11KX9h9XuyqZZOfj5Hk34jo2QXgYk7ue+BeVLPzC82PW3BehXtiDsj6+fRyUs
         wZQZrcJ9ZA9YqBoZjQTKHkxmDg3p/QTxXlUW4M8+PZfu1IktL+Vbv+jdM50bA8TcXCsX
         Q8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=o/pd9eYE39D6+0/pijWJkJQfTRyYtE3DUkjzF4rb9hU=;
        b=fcRbuiuUscDERBQU4w23D7NZ1kaLs6DYawEYwnRSR97M4ImRtWf4X8Cv5aqiSv1D9e
         c92prFNVaQ1plqVmtU12Gj4rVEB3VKJUDOQ50xnaM94qwrtTdGIONAViTIY4L8fWNz/H
         M3ndb1QKZ8Wq7tznmnhWPewJ2KQFZzvFPNI8AvcyYE67WijcFtr6l+QBvtqmVvTcFajd
         oyHlgCBNqxdW9Me4WP++g6pcXnf8QXQJMTuB5PIZ6yIyEuDuhC3Py+E7+IN/0GhzOOwM
         NLMO6+iIWo95dKg3gjGFj44y+nygJdSbld9kZusx3GSTT2qkxeBaZdaKKhN9rPcTyZDG
         lS1A==
X-Gm-Message-State: AOAM532LIuQEgp6Qj/M1dr2LibHartTtJnaGYfMUwavpictCsqlQUrub
        ArH3BWIikg70O2UocKyjAvJ1Rw==
X-Google-Smtp-Source: ABdhPJwIpBZGVW7iIcYx+MWXKgdNTPjp1ddNkGhl6tDu55EoxXQQ1fkT4I0EmfP36zTdFY8MOUINTQ==
X-Received: by 2002:a2e:9c5:: with SMTP id 188mr6219957ljj.418.1643015177562;
        Mon, 24 Jan 2022 01:06:17 -0800 (PST)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id s16sm1103116lfr.300.2022.01.24.01.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 01:06:17 -0800 (PST)
Date:   Mon, 24 Jan 2022 10:06:16 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 1/6] media: Define MIPI CSI-2 data types in a shared
 header file
Message-ID: <Ye5sCDwX1e9UwqAN@oden.dyn.berto.se>
References: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220123160857.24161-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220123160857.24161-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your work.

On 2022-01-23 18:08:52 +0200, Laurent Pinchart wrote:
> There are many CSI-2-related drivers in the media subsystem that come
> with their own macros to handle the CSI-2 data types (or just hardcode
> the numerical values). Provide a shared header with definitions for
> those data types that driver can use.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I like this effort. I have not double checked each DT code with the spec 
but choose to trust you on those.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

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
> +#define MIPI_CSI2_DT_RAW6		0x28
> +#define MIPI_CSI2_DT_RAW7		0x29
> +#define MIPI_CSI2_DT_RAW8		0x2a
> +#define MIPI_CSI2_DT_RAW10		0x2b
> +#define MIPI_CSI2_DT_RAW12		0x2c
> +#define MIPI_CSI2_DT_RAW14		0x2d
> +#define MIPI_CSI2_DT_RAW16		0x2e
> +#define MIPI_CSI2_DT_RAW20		0x2f
> +#define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
> +
> +#endif /* _MEDIA_MIPI_CSI2_H */
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Kind Regards,
Niklas Söderlund
