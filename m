Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6522A1B80
	for <lists+linux-media@lfdr.de>; Sun,  1 Nov 2020 01:39:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgKAAjD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Oct 2020 20:39:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58304 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgKAAjD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Oct 2020 20:39:03 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5C9A240;
        Sun,  1 Nov 2020 01:39:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604191140;
        bh=JasllCkg6ZfCScPS0C1BvgdiP90pDqzyShttsshoU6Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HoNjkkI0tAuoloSnaxciPdkBH/WSQEmmkng7E0XLAKas5WbuiqUNllTRjlzuA+fwS
         TAJm12Xfh/n/fuukOts1Jtn0nkNLe3DCO1ZyC156sE4wZpcsCFs13Xl2pBUyq5zt4B
         rIwCJmtKxoT+7maYxUtHNaDw+J7ulho83Oar3n1E=
Date:   Sun, 1 Nov 2020 02:38:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>, Vishal Sagar <vsagar@xilinx.com>
Subject: Re: [PATCH/RFC 15/16] media: v4l2: Add 10-, 12- and 16-bpc 4:4:4
 packed VUY formats
Message-ID: <20201101003811.GD4225@pendragon.ideasonboard.com>
References: <20200923024333.920-1-laurent.pinchart@ideasonboard.com>
 <20200923024333.920-16-laurent.pinchart@ideasonboard.com>
 <9254388432492f46a38af8cfe5fb927f63e9e73b.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9254388432492f46a38af8cfe5fb927f63e9e73b.camel@ndufresne.ca>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Thu, Sep 24, 2020 at 02:24:44PM -0400, Nicolas Dufresne wrote:
> Le mercredi 23 septembre 2020 à 05:43 +0300, Laurent Pinchart a écrit :
> > Add three new formats storing packed YUV 4:4:4 in 10-, 12- and 16-bpc
> > variants, with component order VUY. They are used by the Xilinx Video
> > Frame Buffer Read/Write IP cores.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../media/v4l/pixfmt-packed-yuv.rst           | 55 +++++++++++++++++++
> >  include/uapi/linux/videodev2.h                |  3 +
> >  2 files changed, 58 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> > index 3c7c8e38b7b7..4753ee8c6b7d 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> > @@ -264,6 +264,61 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
> >        applications and drivers.
> >  
> >  
> > +The next table lists the packed YUV 4:4:4 formats with more than 8 bits per
> > +component. They are named similarly to the formats with less than 8 bits per
> > +components, based on the order of the Y, Cb and Cr components as seen in a
> > +word, which is then stored in memory in little endian byte order, and on the
> > +number of bits for each component.
> > +
> > +.. flat-table:: Packed YUV Image Formats (more than 8bpc)
> > +    :header-rows: 1
> > +    :stub-columns: 0
> > +
> > +    * - Identifier
> > +      - Code
> > +      - Byte 0
> > +      - Byte 1
> > +      - Byte 2
> > +      - Byte 3
> > +      - Byte 4
> > +      - Byte 5
> > +
> > +    * .. _V4L2-PIX-FMT-XVUY2101010:
> > +
> > +      - ``V4L2_PIX_FMT_XVUY2101010``
> > +      - 'VY30'
> > +
> > +      - Y'\ :sub:`7-0`
> > +      - Cb\ :sub:`5-0` Y'\ :sub:`9-8`
> > +      - Cr\ :sub:`3-0` Cb\ :sub:`9-6`
> > +      - `-`\ :sub:`1-0` Cr\ :sub:`9-4`
> > +      -
> > +
> > +    * .. _V4L2-PIX-FMT-XVUY4121212:
> > +
> > +      - ``V4L2_PIX_FMT_XVUY4121212``
> > +      - 'VY36'
> > +
> > +      - Y'\ :sub:`7-0`
> > +      - Cb\ :sub:`3-0` Y'\ :sub:`11-8`
> > +      - Cb\ :sub:`11-4`
> > +      - Cr\ :sub:`7-0`
> > +      - `-`\ :sub:`3-0` Cr\ :sub:`11-8`
> > +      -
> > +
> > +    * .. _V4L2-PIX-FMT-VUY161616:
> > +
> > +      - ``V4L2_PIX_FMT_VUY161616``
> > +      - 'VY40'
> > +
> > +      - Y'\ :sub:`7-0`
> > +      - Y'\ :sub:`15-8`
> > +      - Cb\ :sub:`7-0`
> > +      - Cb\ :sub:`15-8`
> > +      - Cr\ :sub:`7-0`
> > +      - Cr\ :sub:`15-8`
> > +
> > +
> >  4:2:2 Subsampling
> >  =================
> >  
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 503a938ea98c..9b4cab651df7 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -605,6 +605,9 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_YUVA32  v4l2_fourcc('Y', 'U', 'V', 'A') /* 32  YUVA-8-8-8-8  */
> >  #define V4L2_PIX_FMT_YUVX32  v4l2_fourcc('Y', 'U', 'V', 'X') /* 32  YUVX-8-8-8-8  */
> >  #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV 4:2:0 2 lines y, 1 line uv interleaved */
> > +#define V4L2_PIX_FMT_XVUY2101010 v4l2_fourcc('V', 'Y', '3', '0') /* 32  XVUY-2-10-10-10 */
> > +#define V4L2_PIX_FMT_XVUY4121212 v4l2_fourcc('V', 'Y', '3', '6') /* 40  XVUY-4-12-12-12 */
> > +#define V4L2_PIX_FMT_VUY161616 v4l2_fourcc('V', 'Y', '4', '8') /* 48  VUY-16-16-16 */
> 
> That is very hard to read. I'm fine with being more verbose, but I
> think it would be nice if it remains human readable. A possible fix
> could be:
> 
>   V4L2_PIX_FMT_XVUY_2_10_10_10

Hans has proposed an interleave naming scheme in the review of 13/16.
This would become X2V10U10Y10. He also mentioned an alternative option
that would match your proposal above. I don't have a strong preference.
Can you and Hans agree on the best option ?

> Another approach is a bit-per-component and pixel size approach. That
> one would be XYUV10_32. It is more cryptic, and you need more doc to
> understand.
> 
> That brings me to endianness, I believe it does matter for these
> unaligned component, so that should be documented (little).

That's already documented in
Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst.

> >  /* two planes -- one Y, one Cr + Cb interleaved  */
> >  #define V4L2_PIX_FMT_NV12    v4l2_fourcc('N', 'V', '1', '2') /* 12  Y/CbCr 4:2:0  */

-- 
Regards,

Laurent Pinchart
