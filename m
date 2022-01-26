Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38FA649C935
	for <lists+linux-media@lfdr.de>; Wed, 26 Jan 2022 12:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241031AbiAZL7v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jan 2022 06:59:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50682 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241020AbiAZL7v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jan 2022 06:59:51 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84D7A478;
        Wed, 26 Jan 2022 12:59:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643198389;
        bh=TO0FVhpUW0h+fe2AQn3u9bRgCqshN6cd/ZVa1OnEU/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t2mUCw01AtCZGF3qYlgCC/PRa+zPG+CVfJ3A9JoSSLTFDLJ609dLn+9/Evy6EDBZY
         P3OCKB01d6+zWuS9REBzN0apsQ6foBiy6W3afH2kaNLJyII51XbZTyLloSP34BqUM3
         JbVvOQHwedsULl4cJPYt/lV7MzKCOMxiJISUeLwM=
Date:   Wed, 26 Jan 2022 13:59:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH 1/6] media: Define MIPI CSI-2 data types in a shared
 header file
Message-ID: <YfE3oqVXCIhMZf+D@pendragon.ideasonboard.com>
References: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220123160857.24161-2-laurent.pinchart+renesas@ideasonboard.com>
 <20220124152224.o46gxdxp3polw2eu@ti.com>
 <CAPY8ntBFfpdp4f3oqxV0-d=EiB=xgz4WxMpR6ZQAa1SHwSUFsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntBFfpdp4f3oqxV0-d=EiB=xgz4WxMpR6ZQAa1SHwSUFsQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, Jan 26, 2022 at 11:50:21AM +0000, Dave Stevenson wrote:
> On Mon, 24 Jan 2022 at 15:22, Pratyush Yadav <p.yadav@ti.com> wrote:
> > On 23/01/22 06:08PM, Laurent Pinchart wrote:
> > > There are many CSI-2-related drivers in the media subsystem that come
> > > with their own macros to handle the CSI-2 data types (or just hardcode
> > > the numerical values). Provide a shared header with definitions for
> > > those data types that driver can use.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  include/media/mipi-csi2.h | 45 +++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 45 insertions(+)
> > >  create mode 100644 include/media/mipi-csi2.h
> > >
> > > diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
> > > new file mode 100644
> > > index 000000000000..392794e5badd
> > > --- /dev/null
> > > +++ b/include/media/mipi-csi2.h
> > > @@ -0,0 +1,45 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * MIPI CSI-2 Data Types
> > > + *
> > > + * Copyright (C) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > + */
> > > +
> > > +#ifndef _MEDIA_MIPI_CSI2_H
> > > +#define _MEDIA_MIPI_CSI2_H
> > > +
> > > +/* Short packet data types */
> > > +#define MIPI_CSI2_DT_FS                      0x00
> > > +#define MIPI_CSI2_DT_FE                      0x01
> > > +#define MIPI_CSI2_DT_LS                      0x02
> > > +#define MIPI_CSI2_DT_LE                      0x03
> > > +#define MIPI_CSI2_DT_GENERIC_SHORT(n)        (0x08 + (n))    /* 0..7 */
> >
> > IIUC there is currently no way to actually capture packets with these
> > data types, and these are added here for completeness's sake, right?
> 
> They aren't generally captured, but are of use.
> For Unicam we have a packet compare & capture trigger generally used
> for debug. However it can also be used for capturing the 16bit frame
> number attached to FS and FE events.
> It's been of use for devices such as Analog Devices ADV728[0|2]M which
> use the frame number to identify the field when sending interlaced
> content.
> 
> > > +
> > > +/* Long packet data types */
> > > +#define MIPI_CSI2_DT_NULL            0x10
> > > +#define MIPI_CSI2_DT_BLANKING                0x11
> > > +#define MIPI_CSI2_DT_EMBEDDED_8B     0x12
> > > +#define MIPI_CSI2_DT_YUV420_8B               0x18
> > > +#define MIPI_CSI2_DT_YUV420_10B              0x19
> > > +#define MIPI_CSI2_DT_YUV420_8B_LEGACY        0x1a
> > > +#define MIPI_CSI2_DT_YUV420_8B_CS    0x1c
> > > +#define MIPI_CSI2_DT_YUV420_10B_CS   0x1d
> > > +#define MIPI_CSI2_DT_YUV422_8B               0x1e
> > > +#define MIPI_CSI2_DT_YUV422_10B              0x1f
> > > +#define MIPI_CSI2_DT_RGB444          0x20
> > > +#define MIPI_CSI2_DT_RGB555          0x21
> > > +#define MIPI_CSI2_DT_RGB565          0x22
> > > +#define MIPI_CSI2_DT_RGB666          0x23
> > > +#define MIPI_CSI2_DT_RGB888          0x24
> > > +#define MIPI_CSI2_DT_RAW24           0x27
> >
> > I have the CSI-2 spec v1.3, and it lists 0x27 as reserved under RGB
> > Image data, and I don't see a data type value for RAW24. Where did you
> > get this value from?
> >
> > > +#define MIPI_CSI2_DT_RAW6            0x28
> > > +#define MIPI_CSI2_DT_RAW7            0x29
> > > +#define MIPI_CSI2_DT_RAW8            0x2a
> > > +#define MIPI_CSI2_DT_RAW10           0x2b
> > > +#define MIPI_CSI2_DT_RAW12           0x2c
> > > +#define MIPI_CSI2_DT_RAW14           0x2d
> > > +#define MIPI_CSI2_DT_RAW16           0x2e
> > > +#define MIPI_CSI2_DT_RAW20           0x2f
> >
> > These two are also listed as reserved in the spec I have. Rest of the
> > values look good to me.
> 
> I'm also only on v1.3, but otherwise agree that all the other values match.
> I see that MIPI are now up to v4.0, and their performance
> highlights[1] include RAW16 and RAW24 support, so I assume they have
> been added in a later revision.

I don't have access to more a more recent version of the CSI-2
specification, but I've gathered RAW16, RAW20 and RAW24 from out-of-tree
code. Sakari, could you confirm those values ?

> [1] https://www.mipi.org/specifications/csi-2
> 
> > > +#define MIPI_CSI2_DT_USER_DEFINED(n) (0x30 + (n))    /* 0..7 */
> > > +
> > > +#endif /* _MEDIA_MIPI_CSI2_H */
> >
> > I think this patch is a good idea in general, and it should remove a lot
> > of repetition in the drivers.
> >
> > BTW, I also see lots of drivers adding tables having mapping between
> > MBUS formats, FOURCC formats, bpp, data type, etc. It would be useful to
> > have those in a central place IMO.

I agree. Patches are welcome :-)

-- 
Regards,

Laurent Pinchart
