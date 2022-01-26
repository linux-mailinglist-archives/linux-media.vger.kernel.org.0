Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA58C49C92D
	for <lists+linux-media@lfdr.de>; Wed, 26 Jan 2022 12:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241018AbiAZL5h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jan 2022 06:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241017AbiAZL5c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jan 2022 06:57:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A59EC06161C;
        Wed, 26 Jan 2022 03:57:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30899478;
        Wed, 26 Jan 2022 12:57:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643198250;
        bh=Jgaftd6Zf7JrQgZQSrsTMB6KTNWW4FlW+Nu7MMiYLYI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oi2VWGUH5lnbKjSbvFINwCOKiCTA2o6Cd3XJPSS+H9YYYsJ8ByhiX7dpWVSWwZ0Ul
         nLtFYFMZoMDoSJpAv/yhtY2t8aN3Hq5K2vkmHiv0Tg616FMmPVYYFRtHGfc44oqgBa
         mHJySkCMRY3NhGCM8fYL2a6Q2uNh562ABUXApwUs=
Date:   Wed, 26 Jan 2022 13:57:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 1/6] media: Define MIPI CSI-2 data types in a shared
 header file
Message-ID: <YfE3F75mV0licnRI@pendragon.ideasonboard.com>
References: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220123160857.24161-2-laurent.pinchart+renesas@ideasonboard.com>
 <164319043247.533872.16458073657870076497@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <164319043247.533872.16458073657870076497@Monstersaurus>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Jan 26, 2022 at 09:47:12AM +0000, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2022-01-23 16:08:52)
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
> > +#define MIPI_CSI2_DT_FS                        0x00
> > +#define MIPI_CSI2_DT_FE                        0x01
> > +#define MIPI_CSI2_DT_LS                        0x02
> > +#define MIPI_CSI2_DT_LE                        0x03
> > +#define MIPI_CSI2_DT_GENERIC_SHORT(n)  (0x08 + (n))    /* 0..7 */
> > +
> > +/* Long packet data types */
> > +#define MIPI_CSI2_DT_NULL              0x10
> > +#define MIPI_CSI2_DT_BLANKING          0x11
> > +#define MIPI_CSI2_DT_EMBEDDED_8B       0x12
> > +#define MIPI_CSI2_DT_YUV420_8B         0x18
> > +#define MIPI_CSI2_DT_YUV420_10B                0x19
> > +#define MIPI_CSI2_DT_YUV420_8B_LEGACY  0x1a
> > +#define MIPI_CSI2_DT_YUV420_8B_CS      0x1c
> > +#define MIPI_CSI2_DT_YUV420_10B_CS     0x1d
> > +#define MIPI_CSI2_DT_YUV422_8B         0x1e
> > +#define MIPI_CSI2_DT_YUV422_10B                0x1f
> > +#define MIPI_CSI2_DT_RGB444            0x20
> > +#define MIPI_CSI2_DT_RGB555            0x21
> > +#define MIPI_CSI2_DT_RGB565            0x22
> > +#define MIPI_CSI2_DT_RGB666            0x23
> > +#define MIPI_CSI2_DT_RGB888            0x24
> > +#define MIPI_CSI2_DT_RAW24             0x27
> > +#define MIPI_CSI2_DT_RAW6              0x28
> > +#define MIPI_CSI2_DT_RAW7              0x29
> > +#define MIPI_CSI2_DT_RAW8              0x2a
> > +#define MIPI_CSI2_DT_RAW10             0x2b
> > +#define MIPI_CSI2_DT_RAW12             0x2c
> > +#define MIPI_CSI2_DT_RAW14             0x2d
> > +#define MIPI_CSI2_DT_RAW16             0x2e
> > +#define MIPI_CSI2_DT_RAW20             0x2f
> > +#define MIPI_CSI2_DT_USER_DEFINED(n)   (0x30 + (n))    /* 0..7 */
> 
> I don't have an easy way to validate those values right now so as with
> Niklas I'll leave those to your judgement, and Pratyush's review.
> 
> Also along side Pratyush's comment, I concur that the mapping tables too
> could be common, but I suspect that's an even bigger topic as maybe that
> falls into the trap of also being common to DRM formats...

Same information could be shared. I usually push back against
centralizing the mapping between media bus codes and pixel formats, as
that's device-specific, but the CSI-2 specification has an informative
section with recommended memory formats, so that at least could be
shared among drivers.

> And finally, are these defines in a location that can be accessible from
> device tree? Or would it have to be further duplicated there still?

They're not, but we can move them if needed.

> For instance, the bindings for the Xilinx CSI2 RX explicitly list DT
> values to specify as the xlnx,csi-pxl-format which I think should also
> come from this common header definition.

That's a good point. I don't see how it could work with the DT schema
though. At the moment, we have

  xlnx,csi-pxl-format:
    description: [...]
    $ref: /schemas/types.yaml#/definitions/uint32
    oneOf:
      - minimum: 0x1e
        maximum: 0x24
      - minimum: 0x28
        maximum: 0x2f

and as far as I know, you can't #include a C header in the schema
itself. It could be done in the examples and the device trees themselves
though.

> For the patches here so far, I can't see anything stark that is wrong
> so for the series:
> 
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> as further extending this to the device tree bindings can be done on
> top.
> 
> > +
> > +#endif /* _MEDIA_MIPI_CSI2_H */

-- 
Regards,

Laurent Pinchart
