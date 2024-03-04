Return-Path: <linux-media+bounces-6376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DF4870A17
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 20:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84437282098
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 19:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3067078B7E;
	Mon,  4 Mar 2024 19:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="crpxnchY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C639D78B5A
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 19:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579325; cv=none; b=VtYCCGiF4dX7EIvjtV4CMI6fTkksP6GqZn1UJu107etbFCPKkRCAaT5hBVHnDFPb3pcugGFHLp/fSoj/zBieQ5cyjx+HLzt2mvi0w3Hjg5fFUxCkETfAnZM/7bZEeZOq1h0QPPeJtsAtlijE7fmtCklexGmqsehiMsNmKrRXpP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579325; c=relaxed/simple;
	bh=mRDSwqdoBOgR60f41rg057O4MqxhUn7CLJRQlZz8+3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odnrxaj4EKS9+PoDbMboeEtYlynqi5sjuheNndSuFlFdXk5viNsjte8dIquNc54nvMCDULd+/AQjr5LVE0E5TO6oEbGhjdhrBJF8jJdZ0QeCyLno3CsB/X30wYoIY8Wa6g81Fb2t8SWBm6UcK0jcL+xmStSpCClZ4iw0VAtHntQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=crpxnchY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BFC51FB2;
	Mon,  4 Mar 2024 20:08:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709579304;
	bh=mRDSwqdoBOgR60f41rg057O4MqxhUn7CLJRQlZz8+3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=crpxnchYfOmLdU+6A+LxEHv9VYB0Hf/v+hjGRKqPNL+S1+BTXcNHAb3OVnrjaH4yv
	 /JizOfhbAgkYNUT30X/FNK9WBovR4CA8REf0u4QYWi2COZYq8FYaapX6H1swwC0vfR
	 PQaa03fXwHnVStdce1FLMM8pUFThF31JspZr2rik=
Date: Mon, 4 Mar 2024 21:08:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v6 06/15] media: v4l: Add V4L2-PIX-FMT-Y12P format
Message-ID: <20240304190842.GB9233@pendragon.ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-7-laurent.pinchart@ideasonboard.com>
 <dslznbfmxhshdipthsp3u624c33dfse2333xjgs6e4t3mfjozp@xmq5rm3ax2av>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dslznbfmxhshdipthsp3u624c33dfse2333xjgs6e4t3mfjozp@xmq5rm3ax2av>

On Mon, Mar 04, 2024 at 12:11:44PM +0100, Jacopo Mondi wrote:
> Hi Laurent
> 
> Ah
> https://patchwork.linuxtv.org/project/linux-media/patch/20240223163012.300763-2-jacopo.mondi@ideasonboard.com/
> 
> same for the Y14 one
> 
> I guess we have upported the same patch twice ?

Indeed :-)

> Whichever series gets in first wins

I'm fine with that.

> On Fri, Mar 01, 2024 at 11:32:21PM +0200, Laurent Pinchart wrote:
> > From: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> >
> > This is a packed grey-scale image format with a depth of 12 bits per
> > pixel. Two consecutive pixels are packed into 3 bytes. The first 2 bytes
> > contain the 8 high order bits of the pixels, and the 3rd byte contains
> > the 4 least significants bits of each pixel, in the same order.
> >
> > Add the entry in userspace API, and document it.
> >
> > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../userspace-api/media/v4l/pixfmt-yuv-luma.rst       | 11 +++++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c                  |  1 +
> >  include/uapi/linux/videodev2.h                        |  1 +
> >  3 files changed, 13 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > index cf8e4dfbfbd4..a650ceda7cdb 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > @@ -114,6 +114,17 @@ are often referred to as greyscale formats.
> >        - ...
> >        - ...
> >
> > +    * .. _V4L2-PIX-FMT-Y12P:
> > +
> > +      - ``V4L2_PIX_FMT_Y12P``
> > +      - 'Y12P'
> > +
> > +      - Y'\ :sub:`0`\ [11:4]
> > +      - Y'\ :sub:`1`\ [11:4]
> > +      - Y'\ :sub:`1`\ [3:0] Y'\ :sub:`0`\ [3:0]
> > +      - ...
> > +      - ...
> > +
> >      * .. _V4L2-PIX-FMT-Y14:
> >
> >        - ``V4L2_PIX_FMT_Y14``
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index f3697ff65817..69ac4482d844 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1313,6 +1313,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >  	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
> >  	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
> >  	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
> > +	case V4L2_PIX_FMT_Y12P:		descr = "12-bit Greyscale (MIPI Packed)"; break;
> >  	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
> >  	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
> >  	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 117a081c9db9..5122ac0c6765 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -599,6 +599,7 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
> >  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
> >  #define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
> > +#define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
> >
> >  /* Palette formats */
> >  #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */

-- 
Regards,

Laurent Pinchart

