Return-Path: <linux-media+bounces-7933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBE888DC5C
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 12:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18CDE1C28B2C
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 11:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825D559B54;
	Wed, 27 Mar 2024 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SC008rqL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6702F5A4E5
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711538337; cv=none; b=mSo4IgUWKQja97s3Kh7erBPhbikSPtvs8k8XR6tLRZVn/wiTvzZeIchs/UVazV3faKSx9+sJKIgjyYAS6fZn+SPt8ALmO9XcWGwse+YN67W1kNRX7pY3oBLESfds5pesIpB0IBsuTTt58eRLz5FDpkmZemwE+RwJwMLFw0QmmSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711538337; c=relaxed/simple;
	bh=A/qZnRvNef9vz/LP+xMwa22pXtsXasypJSl3mW5s4Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVl3vapPUbgQi6mhxAuDm6QZjbh8WF3AZlJPkY2Ee5srh1v4VN5sOE1X9BZMmUfPnp9G3Wp60X39x3QYiDfoWmgEdIC/NnsoqQvLv7CdGscboCDKauhk+Uz5xMQhr3T1XRQuoK0Tnn7lmniQxT0T5bt7gDOpLbpciIKBoteUBAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SC008rqL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 498AF675;
	Wed, 27 Mar 2024 12:18:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711538301;
	bh=A/qZnRvNef9vz/LP+xMwa22pXtsXasypJSl3mW5s4Oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SC008rqLrh+d+As4TJATaQqgkOccnuHfUxXbwAIP0BM0dd/ksgsVjo/3NaCDXL5mI
	 LfcliCUV8KftgOezQPavK9qvNl3YKhuKKRyELAxXH3mRYHvUP7Kw023qWqoQEc3Hae
	 sgeT7cIwmgl8BIqw6fvAhZ9uNLhCc3q2qcUDh6ps=
Date: Wed, 27 Mar 2024 13:18:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v7 06/15] media: v4l: Add V4L2-PIX-FMT-Y12P format
Message-ID: <20240327111844.GB4721@pendragon.ideasonboard.com>
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
 <20240324220854.15010-7-laurent.pinchart@ideasonboard.com>
 <fd863fe8-af0d-4e4d-b760-9ad2f5740602@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fd863fe8-af0d-4e4d-b760-9ad2f5740602@ideasonboard.com>

On Wed, Mar 27, 2024 at 01:08:31PM +0200, Tomi Valkeinen wrote:
> On 25/03/2024 00:08, Laurent Pinchart wrote:
> > From: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > 
> > This is a packed grey-scale image format with a depth of 12 bits per
> > pixel. Two consecutive pixels are packed into 3 bytes. The first 2 bytes
> > contain the 8 high order bits of the pixels, and the 3rd byte contains
> > the 4 least significants bits of each pixel, in the same order.
> > 
> > Add the entry in userspace API, and document it.
> 
> You probably noticed, but Jacopo has similar patches to this and the 
> next one in his BE series.

Yes, and we decided that whoever gets their series merged first wins :-)

> > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   .../userspace-api/media/v4l/pixfmt-yuv-luma.rst       | 11 +++++++++++
> >   drivers/media/v4l2-core/v4l2-ioctl.c                  |  1 +
> >   include/uapi/linux/videodev2.h                        |  1 +
> >   3 files changed, 13 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > index cf8e4dfbfbd4..a650ceda7cdb 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > @@ -114,6 +114,17 @@ are often referred to as greyscale formats.
> >         - ...
> >         - ...
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
> >       * .. _V4L2-PIX-FMT-Y14:
> >   
> >         - ``V4L2_PIX_FMT_Y14``
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 72cdea3c1316..01959d030b84 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1313,6 +1313,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >   	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
> >   	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
> >   	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
> > +	case V4L2_PIX_FMT_Y12P:		descr = "12-bit Greyscale (MIPI Packed)"; break;
> >   	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
> >   	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
> >   	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 8b5a8286f138..a7ff109cf8b3 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -599,6 +599,7 @@ struct v4l2_pix_format {
> >   #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
> >   #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
> >   #define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
> > +#define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
> >   
> >   /* Palette formats */
> >   #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */

-- 
Regards,

Laurent Pinchart

