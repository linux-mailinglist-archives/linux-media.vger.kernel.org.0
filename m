Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 659DD2A1B87
	for <lists+linux-media@lfdr.de>; Sun,  1 Nov 2020 01:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgKAAnj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Oct 2020 20:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbgKAAnj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Oct 2020 20:43:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FA6C0617A6
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2020 17:43:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18027240;
        Sun,  1 Nov 2020 01:43:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604191415;
        bh=xYyruJX+L9pMaiADrIOZFyZMi75UTPmFgRR3qaSbJYU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fNv18ngUXApqc1tpwl/+JzutHR/m4pRXS4hZV4lAzYKHdP9ODP3AY4EuCsXBhwDnn
         3p96u5DfdfdUPj7B23Stzx7VnUCJVRnjyqeRTAYXieVI16N7P8j+QHLHl5UiAtmIS+
         iYGjv0gIELFogzz+nmTlMtsj4uiuzFjEM+8ZZU0M=
Date:   Sun, 1 Nov 2020 02:42:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Subject: Re: [PATCH/RFC 16/16] media: v4l2: Add 10- and 12-bpc luma-only
 formats with linear packing
Message-ID: <20201101004246.GE4225@pendragon.ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
 <20200923024333.920-17-laurent.pinchart@ideasonboard.com>
 <88b9d4edaac40c9a91d88db7c147c2debff79f5c.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <88b9d4edaac40c9a91d88db7c147c2debff79f5c.camel@ndufresne.ca>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Thu, Sep 24, 2020 at 02:27:58PM -0400, Nicolas Dufresne wrote:
> Le mercredi 23 septembre 2020 à 05:43 +0300, Laurent Pinchart a écrit :
> > Add two new formats storing luma only in 10- and 12-bpc variants, with
> > linear packing. They are used by the Xilinx Video Frame Buffer
> > Read/Write IP cores.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../media/v4l/pixfmt-yuv-luma.rst             | 23 +++++++++++++++++++
> >  include/uapi/linux/videodev2.h                |  2 ++
> >  2 files changed, 25 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > index b24947b52cf8..3e2a7af5ed67 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > @@ -24,6 +24,7 @@ are often referred to as greyscale formats.
> >     - Y'\ :sub:`x`\ [9:2] denotes bits 9 to 2 of the Y' value for pixel at colum
> >       `x`.
> >     - `0` denotes padding bits set to 0.
> > +   - `-` denotes padding bits with undefined values.
> >  
> >  
> >  .. flat-table:: Luma-Only Image Formats
> > @@ -82,6 +83,17 @@ are often referred to as greyscale formats.
> >        - Y'\ :sub:`3`\ [9:2]
> >        - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [1:0] Y'\ :sub:`1`\ [1:0] Y'\ :sub:`0`\ [1:0]
> >  
> > +    * .. _V4L2-PIX-FMT-Y10X:
> 
> That's interesting, you are using a different convention here. If I
> refer to the XYUV_2101010 one, usign that convention instead would be
> XY10X10V10. It's not much more readable, and you have to deduce the 2
> bits, just like you have to deduce that X here is 6bits. Perhaps we can
> find a compromises that makes it consistent ? YX_10_2 ?

I'm not sure to follow you. This is a greyscale format, it only stores
the luma component, so XY10X10V10 doesn't match (and I assume you meant
XY10U10V10).

> > +
> > +      - ``V4L2_PIX_FMT_Y10X``
> > +      - 'Y10X'
> > +
> > +      - Y'\ :sub:`0`\ [7:0]
> > +      - Y'\ :sub:`1`\ [5:0] Y'\ :sub:`0`\ [9:8]
> > +      - Y'\ :sub:`2`\ [3:0] Y'\ :sub:`1`\ [9:6]
> > +      - `- -` Y'\ :sub:`2`\ [9:4]
> > +      - ...
> > +
> >      * .. _V4L2-PIX-FMT-Y12:
> >  
> >        - ``V4L2_PIX_FMT_Y12``
> > @@ -93,6 +105,17 @@ are often referred to as greyscale formats.
> >        - ...
> >        - ...
> >  
> > +    * .. _V4L2-PIX-FMT-Y12X:
> > +
> > +      - ``V4L2_PIX_FMT_Y12X``
> > +      - 'Y12X'
> > +
> > +      - Y'\ :sub:`0`\ [7:0]
> > +      - Y'\ :sub:`1`\ [3:0] Y'\ :sub:`0`\ [11:8]
> > +      - Y'\ :sub:`1`\ [11:4]
> > +      - Y'\ :sub:`2`\ [7:0]
> > +      - `- - - -` Y'\ :sub:`2`\ [11:8]
> > +
> >      * .. _V4L2-PIX-FMT-Y14:
> >  
> >        - ``V4L2_PIX_FMT_Y14``
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 9b4cab651df7..3d137a020cdb 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -579,6 +579,8 @@ struct v4l2_pix_format {
> >  /* Grey bit-packed formats */
> >  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
> >  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
> > +#define V4L2_PIX_FMT_Y10X    v4l2_fourcc('Y', '1', '0', 'X') /* 10  Greyscale, 3 pixels in 4 bytes */
> > +#define V4L2_PIX_FMT_Y12X    v4l2_fourcc('Y', '1', '2', 'X') /* 12  Greyscale, 4 pixels in 5 bytes */
> >  
> >  /* Palette formats */
> >  #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */
> 

-- 
Regards,

Laurent Pinchart
