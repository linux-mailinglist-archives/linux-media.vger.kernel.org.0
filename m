Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C169849C910
	for <lists+linux-media@lfdr.de>; Wed, 26 Jan 2022 12:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234314AbiAZLuj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jan 2022 06:50:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234297AbiAZLui (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jan 2022 06:50:38 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C66C06161C
        for <linux-media@vger.kernel.org>; Wed, 26 Jan 2022 03:50:37 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id o12so38434487eju.13
        for <linux-media@vger.kernel.org>; Wed, 26 Jan 2022 03:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TJlhrhkGqwkkidE/As086gXr9ITfDhPf/Brw28sTUDw=;
        b=KToZxq8ZqAwzfacefIuyrozSjjHade4ooPQsIaWFbmfY4pdNKzB6LqVXNO02WAP9Qm
         xMGbmAn0PHQKuma03kXD0RQGj16BAWsFWJ+sxmIQd+wFbj9a6FHb/pqdmz7YJgxfkARs
         UcPE1p6Rh9dkKWxKdLOfG599gukOCg0hGEfdXD0jBFeYOolDGpjGxFRoCY+ilp5B6kB5
         BMJd3A8ylviiisjhftIVX9nbeNJRezrPH8lqDJfaV8tkYsSh/EHtWbbRp7RRdp916aOG
         qsQcVCXZRopq6eDy6BtwaajLO9++QtTd5zusDCO+SBLGH16J5ndTX9MB6Hjqybbzvynr
         HQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TJlhrhkGqwkkidE/As086gXr9ITfDhPf/Brw28sTUDw=;
        b=XSRBJtjO1nsf3Ev0+gTQsWXw761Rsv0s/R9ved5oJ0Tm2V8TpGcRVJ0f+U4nAsyj50
         219V2oEsWOY/jaOAS/RjaB4hieSWSrwgJO9KhJb8CTHX/C4H3xbXGvfofsN/ZhGnKJww
         94eaRC0/HVfPsLwR1laErLGWVFDGi3V9crqz56u0ta6jEzD3+/Q/nowuty31knDwgZIM
         DIDaNuiEQzwx/8EhTFZgggUSSXeGMa9RGU8P0Wr4G4Vyt14SPWpXmkgZu+qduLQO+L95
         fR2Z1ItndsfXb3FFjx6GVNFxQGNhP82ilzJXQ0ox4LrpRijLc/cVH+U7qFcHEKqoWo8q
         +b5g==
X-Gm-Message-State: AOAM532grtGFuDuDY1JWn6t64JfBzvCN+eZwqwuicvoF6Ce7K1dEijtY
        7qrYnrlN8U6Oe+MGQvfWqi5IVzY9UBgiHbGjaNY1QQ==
X-Google-Smtp-Source: ABdhPJwStWcUjJXv86f/vzjgLVXlB3DG2qOYSUzrw+H6N/BtdX0ZcIEbpJ7vqMXJlo8X4lIq2qcn+ctIXleR/G5bPL8=
X-Received: by 2002:a17:907:7faa:: with SMTP id qk42mr19543833ejc.742.1643197836366;
 Wed, 26 Jan 2022 03:50:36 -0800 (PST)
MIME-Version: 1.0
References: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220123160857.24161-2-laurent.pinchart+renesas@ideasonboard.com> <20220124152224.o46gxdxp3polw2eu@ti.com>
In-Reply-To: <20220124152224.o46gxdxp3polw2eu@ti.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 26 Jan 2022 11:50:21 +0000
Message-ID: <CAPY8ntBFfpdp4f3oqxV0-d=EiB=xgz4WxMpR6ZQAa1SHwSUFsQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: Define MIPI CSI-2 data types in a shared
 header file
To:     Pratyush Yadav <p.yadav@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent and Pratyush

On Mon, 24 Jan 2022 at 15:22, Pratyush Yadav <p.yadav@ti.com> wrote:
>
> Hi Laurent,
>
> Thanks for the patch.
>
> On 23/01/22 06:08PM, Laurent Pinchart wrote:
> > There are many CSI-2-related drivers in the media subsystem that come
> > with their own macros to handle the CSI-2 data types (or just hardcode
> > the numerical values). Provide a shared header with definitions for
> > those data types that driver can use.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  include/media/mipi-csi2.h | 45 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 include/media/mipi-csi2.h
> >
> > diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
> > new file mode 100644
> > index 000000000000..392794e5badd
> > --- /dev/null
> > +++ b/include/media/mipi-csi2.h
> > @@ -0,0 +1,45 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * MIPI CSI-2 Data Types
> > + *
> > + * Copyright (C) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > + */
> > +
> > +#ifndef _MEDIA_MIPI_CSI2_H
> > +#define _MEDIA_MIPI_CSI2_H
> > +
> > +/* Short packet data types */
> > +#define MIPI_CSI2_DT_FS                      0x00
> > +#define MIPI_CSI2_DT_FE                      0x01
> > +#define MIPI_CSI2_DT_LS                      0x02
> > +#define MIPI_CSI2_DT_LE                      0x03
> > +#define MIPI_CSI2_DT_GENERIC_SHORT(n)        (0x08 + (n))    /* 0..7 */
>
> IIUC there is currently no way to actually capture packets with these
> data types, and these are added here for completeness's sake, right?

They aren't generally captured, but are of use.
For Unicam we have a packet compare & capture trigger generally used
for debug. However it can also be used for capturing the 16bit frame
number attached to FS and FE events.
It's been of use for devices such as Analog Devices ADV728[0|2]M which
use the frame number to identify the field when sending interlaced
content.

> > +
> > +/* Long packet data types */
> > +#define MIPI_CSI2_DT_NULL            0x10
> > +#define MIPI_CSI2_DT_BLANKING                0x11
> > +#define MIPI_CSI2_DT_EMBEDDED_8B     0x12
> > +#define MIPI_CSI2_DT_YUV420_8B               0x18
> > +#define MIPI_CSI2_DT_YUV420_10B              0x19
> > +#define MIPI_CSI2_DT_YUV420_8B_LEGACY        0x1a
> > +#define MIPI_CSI2_DT_YUV420_8B_CS    0x1c
> > +#define MIPI_CSI2_DT_YUV420_10B_CS   0x1d
> > +#define MIPI_CSI2_DT_YUV422_8B               0x1e
> > +#define MIPI_CSI2_DT_YUV422_10B              0x1f
> > +#define MIPI_CSI2_DT_RGB444          0x20
> > +#define MIPI_CSI2_DT_RGB555          0x21
> > +#define MIPI_CSI2_DT_RGB565          0x22
> > +#define MIPI_CSI2_DT_RGB666          0x23
> > +#define MIPI_CSI2_DT_RGB888          0x24
> > +#define MIPI_CSI2_DT_RAW24           0x27
>
> I have the CSI-2 spec v1.3, and it lists 0x27 as reserved under RGB
> Image data, and I don't see a data type value for RAW24. Where did you
> get this value from?
>
> > +#define MIPI_CSI2_DT_RAW6            0x28
> > +#define MIPI_CSI2_DT_RAW7            0x29
> > +#define MIPI_CSI2_DT_RAW8            0x2a
> > +#define MIPI_CSI2_DT_RAW10           0x2b
> > +#define MIPI_CSI2_DT_RAW12           0x2c
> > +#define MIPI_CSI2_DT_RAW14           0x2d
> > +#define MIPI_CSI2_DT_RAW16           0x2e
> > +#define MIPI_CSI2_DT_RAW20           0x2f
>
> These two are also listed as reserved in the spec I have. Rest of the
> values look good to me.

I'm also only on v1.3, but otherwise agree that all the other values match.
I see that MIPI are now up to v4.0, and their performance
highlights[1] include RAW16 and RAW24 support, so I assume they have
been added in a later revision.

  Dave

[1] https://www.mipi.org/specifications/csi-2

> > +#define MIPI_CSI2_DT_USER_DEFINED(n) (0x30 + (n))    /* 0..7 */
> > +
> > +#endif /* _MEDIA_MIPI_CSI2_H */
> > --
> > Regards,
> >
> > Laurent Pinchart
> >
>
> I think this patch is a good idea in general, and it should remove a lot
> of repetition in the drivers.
>
> BTW, I also see lots of drivers adding tables having mapping between
> MBUS formats, FOURCC formats, bpp, data type, etc. It would be useful to
> have those in a central place IMO.
>
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
