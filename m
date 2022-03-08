Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9364D133B
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 10:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345316AbiCHJVg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 04:21:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245196AbiCHJVf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 04:21:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126E441319
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 01:20:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AE54488;
        Tue,  8 Mar 2022 10:20:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646731237;
        bh=jxobq/I9QPbpXdkK5tcy5MyjRrLmhLieWkS7mA0RKvI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S4HsMpD8wu5ZAGYWmYI0Rr7Zg94/zU2vd2wNAgVndPMUCpIciyxY/u5UKrytKV49w
         waFrzC9DFZg11qndqy3gPf42i3HLAH/5ASHb/jSsRnu8zHDcmqPkks+3iArrglPfi8
         xFv3YwkRxHw6kpmjxm6rIqhi+Zt/48CvBBjoi4y0=
Date:   Tue, 8 Mar 2022 11:20:23 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 1/3] media: v4l: Add packed YUV 4:4:4 YUVA and YUVX pixel
 formats
Message-ID: <Yicf16ffXXDOW27N@pendragon.ideasonboard.com>
References: <20220307180342.10666-1-laurent.pinchart@ideasonboard.com>
 <20220307180342.10666-2-laurent.pinchart@ideasonboard.com>
 <20220308083722.qapoft64p3ghgibx@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220308083722.qapoft64p3ghgibx@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 08, 2022 at 09:37:22AM +0100, Jacopo Mondi wrote:
> Hi Laurent
> 
> On Mon, Mar 07, 2022 at 08:03:40PM +0200, Laurent Pinchart wrote:
> > The new YUVA and YUVX are permutations of the existing AYUV and XYUV
> > formats. They are use by the NXP i.MX8 ISI hardware.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> All three patches looks good
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> Slighlty unrelated: aren't the following format definitions identical ?
> Is this intentional ?

They are identical indeed. I think it's a historical mistake, AYUV32 has
likely been added without realizing YUV32 was already providing the same
format.

V4L2_PIX_FMT_YUV32 is used by ivtv, exynos-gsc, vivid and the staging
IMX drivers. I think it would make sense to deprecate it so that new
drivers will exaplicitly pick either the A or the X variant.

Hans, any opinion on this ?

>     * .. _V4L2-PIX-FMT-YUV32:
> 
>       - ``V4L2_PIX_FMT_YUV32``
>       - 'YUV4'
> 
>       - A\ :sub:`7-0`
>       - Y'\ :sub:`7-0`
>       - Cb\ :sub:`7-0`
>       - Cr\ :sub:`7-0`
> 
>     * .. _V4L2-PIX-FMT-AYUV32:
> 
>       - ``V4L2_PIX_FMT_AYUV32``
>       - 'AYUV'
> 
>       - A\ :sub:`7-0`
>       - Y'\ :sub:`7-0`
>       - Cb\ :sub:`7-0`
>       - Cr\ :sub:`7-0`
> 
> > ---
> >  .../media/v4l/pixfmt-packed-yuv.rst           | 20 +++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 ++
> >  include/uapi/linux/videodev2.h                |  2 ++
> >  3 files changed, 24 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> > index 62bc2bb3f499..92394786251a 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> > @@ -229,6 +229,26 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
> >        - Y'\ :sub:`7-0`
> >        - X\ :sub:`7-0`
> >
> > +    * .. _V4L2-PIX-FMT-YUVA32:
> > +
> > +      - ``V4L2_PIX_FMT_YUVA32``
> > +      - 'YUVA'
> > +
> > +      - Y'\ :sub:`7-0`
> > +      - Cb\ :sub:`7-0`
> > +      - Cr\ :sub:`7-0`
> > +      - A\ :sub:`7-0`
> > +
> > +    * .. _V4L2-PIX-FMT-YUVX32:
> > +
> > +      - ``V4L2_PIX_FMT_YUVX32``
> > +      - 'YUVX'
> > +
> > +      - Y'\ :sub:`7-0`
> > +      - Cb\ :sub:`7-0`
> > +      - Cr\ :sub:`7-0`
> > +      - X\ :sub:`7-0`
> > +
> >      * .. _V4L2-PIX-FMT-YUV24:
> >
> >        - ``V4L2_PIX_FMT_YUV24``
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index aeecaca3edba..ca3c7bd19d7e 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1290,6 +1290,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >  	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
> >  	case V4L2_PIX_FMT_VUYA32:	descr = "32-bit VUYA 8-8-8-8"; break;
> >  	case V4L2_PIX_FMT_VUYX32:	descr = "32-bit VUYX 8-8-8-8"; break;
> > +	case V4L2_PIX_FMT_YUVA32:	descr = "32-bit YUVA 8-8-8-8"; break;
> > +	case V4L2_PIX_FMT_YUVX32:	descr = "32-bit YUVX 8-8-8-8"; break;
> >  	case V4L2_PIX_FMT_YUV410:	descr = "Planar YUV 4:1:0"; break;
> >  	case V4L2_PIX_FMT_YUV420:	descr = "Planar YUV 4:2:0"; break;
> >  	case V4L2_PIX_FMT_HI240:	descr = "8-bit Dithered RGB (BTTV)"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index df8b9c486ba1..16dcd9dd1a50 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -592,6 +592,8 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_XYUV32  v4l2_fourcc('X', 'Y', 'U', 'V') /* 32  XYUV-8-8-8-8  */
> >  #define V4L2_PIX_FMT_VUYA32  v4l2_fourcc('V', 'U', 'Y', 'A') /* 32  VUYA-8-8-8-8  */
> >  #define V4L2_PIX_FMT_VUYX32  v4l2_fourcc('V', 'U', 'Y', 'X') /* 32  VUYX-8-8-8-8  */
> > +#define V4L2_PIX_FMT_YUVA32  v4l2_fourcc('Y', 'U', 'V', 'A') /* 32  YUVA-8-8-8-8  */
> > +#define V4L2_PIX_FMT_YUVX32  v4l2_fourcc('Y', 'U', 'V', 'X') /* 32  YUVX-8-8-8-8  */
> >  #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV 4:2:0 2 lines y, 1 line uv interleaved */
> >
> >  /* two planes -- one Y, one Cr + Cb interleaved  */

-- 
Regards,

Laurent Pinchart
