Return-Path: <linux-media+bounces-16740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C396095E5F3
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 02:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D76231C20955
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 00:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA89637;
	Mon, 26 Aug 2024 00:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FfRFaKnL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDF8173
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 00:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724631173; cv=none; b=qh74MyMVKQ7HbctnKp0xX+6eBN14PiJYa0yPVG1cdNByAVXZru5mr9ty2PRW0OjSkclYIm+bPxN03rBAqMDl3IuxSC2HKntxB43ncJu7lOLNCISA0cxXlRDUqtxzzBHOJ+EhVyWygk5HOc2SF/VBauyY3+Qt2mrg6tnijCoLJQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724631173; c=relaxed/simple;
	bh=lyg+rcGvv9qOtKPMwUtiST+ZaMZX7OJm3HjUfxfQIEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r27gM2eGAS6VP/SC7FnmqYJLBw3PeK/zhZmtVmWSLj/F8CsHD04vWZSJIb46jFEZ9Cv5dO3a+MlK4+y4ok2BB09fiV3ZRstSTiMhGeuTp+6JkpfoCmtTcohL76DPhaKORlDV2T7iE8kvP+bETpkMTK6UnK9WO3r0LvQotSKP48I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FfRFaKnL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE4478BE;
	Mon, 26 Aug 2024 02:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724631104;
	bh=lyg+rcGvv9qOtKPMwUtiST+ZaMZX7OJm3HjUfxfQIEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfRFaKnL2l+eH6+u8VQWXD0nMoIVktlkYBkz9st9ekR7rrskFJdl6SbRHlrYjVXBo
	 l8fCWPxxXCG16dPxbw6mXEt1NiCvCqG2zEORxwv4UpfLbDqJwE24TQFV1OiOT5Y4pT
	 ElT0Xo1/XZn4f3412YO/3+siMepMS7emVDwp9ilE=
Date: Mon, 26 Aug 2024 03:12:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Perchanov <dmitry.perchanov@intel.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, sakari.ailus@iki.fi,
	demisrael@gmail.com
Subject: Re: [PATCH] [media] v4l: Add luma 16-bit interlaced pixel format
Message-ID: <20240826001246.GB7789@pendragon.ideasonboard.com>
References: <96a65ab833ab160ce2ecac97edb719bfa9fa18ca.camel@intel.com>
 <20240802152653.GK18732@pendragon.ideasonboard.com>
 <1743262e16eb893ea718f22a9bd5da6caa5b6f39.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1743262e16eb893ea718f22a9bd5da6caa5b6f39.camel@intel.com>

Hi Dmitry,

On Sun, Aug 18, 2024 at 04:20:50PM +0300, Dmitry Perchanov wrote:
> Hi Laurent,
> 
> Thanks for your review, I will update patch to match latest,
> as now it conflicts with merged updates.
> 
> Please see inline.
> 
> On Fri, 2024-08-02 at 18:26 +0300, Laurent Pinchart wrote:
> > On Sun, Jul 28, 2024 at 06:35:57AM -0400, Dmitry Perchanov wrote:
> > > The formats added by this patch are:
> > > 
> > >         V4L2_PIX_FMT_Y16I
> > >         UVC_GUID_FORMAT_Y16I
> > > 
> > > Interlaced lumina format primary use in RealSense
> > > Depth cameras with stereo stream for left and right
> > > image sensors.
> > > 
> > > Signed-off-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
> > 
> > The format itself looks fine. Could you split this patch in two, with
> > one patch that defines the new format (documentation, v4l2-ioctl.c and
> > videodev2.h), and another patch that adds it to the uvcvideo driver
> > (drivers/media/common/uvc.c, include/linux/usb/uvc.h) ? We usually do so
> > to ease backporting.
>
> This can be great idea but uvc patch will fail compilation - 
> it's depends on V4L2_PIX_FMT_Y16I defined at videodev2.h

That's fine, you can send both patches as a series, with the patch
introducing the format first and the patch to the UVC code second. They
will be applied together, in that order.

> > > ---
> > >  .../userspace-api/media/v4l/pixfmt-y16i.rst   | 80 +++++++++++++++++++
> > >  .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
> > >  drivers/media/common/uvc.c                    |  4 +
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
> > >  include/linux/usb/uvc.h                       |  3 +
> > >  include/uapi/linux/videodev2.h                |  1 +
> > >  6 files changed, 90 insertions(+)
> > >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst b/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
> > > new file mode 100644
> > > index 000000000000..3303b7832cdb
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
> > > @@ -0,0 +1,80 @@
> > > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > > +
> > > +.. _V4L2-PIX-FMT-Y16I:
> > > +
> > > +**************************
> > > +V4L2_PIX_FMT_Y16I ('Y16I')
> > > +**************************
> > > +
> > > +Interleaved grey-scale image, e.g. from a stereo-pair
> > > +
> > > +
> > > +Description
> > > +===========
> > > +
> > > +This is a grey-scale image with a depth of 16 bits per pixel, but with
> > > +pixels from 2 sources interleaved and unpacked. Each pixel is stored
> > > +in a 32-bit word in the little-endian order. On a little-endian machine
> > > +these pixels can be deinterlaced using
> > > +
> > > +.. code-block:: c
> > > +
> > > +    __u8 *buf;
> > > +    left0 = 0xffff & *(__u16 *)buf;
> > > +    right0 = 0xffff & *((__u16 *)buf + 1);
> > 
> > I think this is a bit overkill. I would simply write
> > 
> > This is a grey-scale image with a depth of 16 bits per pixel, but with pixels
> > from 2 sources interleaved and unpacked. Each pixel is stored in a 16-bit word
> > in the little-endian order. The first pixel is from the left source.
> > 
> > > +
> > > +**Pixel unpacked representation.**
> > > +Left/Right pixels 16-bit unpacked - 16-bit for each interleaved pixel.
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +
> > > +    * - Y'\ :sub:`0L[7:0]`
> > > +      - Y'\ :sub:`0L[15:8]`
> > > +      - Y'\ :sub:`0R[7:0]`
> > > +      - Y'\ :sub:`0R[15:8]`
> > > +
> > > +**Byte Order.**
> > > +Each cell is one byte.
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +
> > > +    * - start + 0:
> > > +      - Y'\ :sub:`00Llow`
> > > +      - Y'\ :sub:`00Lhigh`
> > > +      - Y'\ :sub:`00Rlow`
> > > +      - Y'\ :sub:`00Rhigh`
> > > +      - Y'\ :sub:`01Llow`
> > > +      - Y'\ :sub:`01Lhigh`
> > > +      - Y'\ :sub:`01Rlow`
> > > +      - Y'\ :sub:`01Rhigh`
> > > +    * - start + 8:
> > > +      - Y'\ :sub:`10Llow`
> > > +      - Y'\ :sub:`10Lhigh`
> > > +      - Y'\ :sub:`10Rlow`
> > > +      - Y'\ :sub:`10Rhigh`
> > > +      - Y'\ :sub:`11Llow`
> > > +      - Y'\ :sub:`11Lhigh`
> > > +      - Y'\ :sub:`11Rlow`
> > > +      - Y'\ :sub:`11Rhigh`
> > > +    * - start + 16:
> > > +      - Y'\ :sub:`20Llow`
> > > +      - Y'\ :sub:`20Lhigh`
> > > +      - Y'\ :sub:`20Rlow`
> > > +      - Y'\ :sub:`20Rhigh`
> > > +      - Y'\ :sub:`21Llow`
> > > +      - Y'\ :sub:`21Lhigh`
> > > +      - Y'\ :sub:`21Rlow`
> > > +      - Y'\ :sub:`21Rhigh`
> > > +    * - start + 24:
> > > +      - Y'\ :sub:`30Llow`
> > > +      - Y'\ :sub:`30Lhigh`
> > > +      - Y'\ :sub:`30Rlow`
> > > +      - Y'\ :sub:`30Rhigh`
> > > +      - Y'\ :sub:`31Llow`
> > > +      - Y'\ :sub:`31Lhigh`
> > > +      - Y'\ :sub:`31Rlow`
> > > +      - Y'\ :sub:`31Rhigh`
> > > diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> > > index 24b34cdfa6fe..78ee406d7647 100644
> > > --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
> > > +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> > > @@ -269,5 +269,6 @@ image.
> > >      pixfmt-yuv-luma
> > >      pixfmt-y8i
> > >      pixfmt-y12i
> > > +    pixfmt-y16i
> > >      pixfmt-uv8
> > >      pixfmt-m420
> > > diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> > > index 9c0ba7a6c185..246fb6da5903 100644
> > > --- a/drivers/media/common/uvc.c
> > > +++ b/drivers/media/common/uvc.c
> > > @@ -120,6 +120,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
> > >  		.guid		= UVC_GUID_FORMAT_Y12I,
> > >  		.fcc		= V4L2_PIX_FMT_Y12I,
> > >  	},
> > > +	{
> > > +		.guid		= UVC_GUID_FORMAT_Y16I,
> > > +		.fcc		= V4L2_PIX_FMT_Y16I,
> > > +	},
> > >  	{
> > >  		.guid		= UVC_GUID_FORMAT_Z16,
> > >  		.fcc		= V4L2_PIX_FMT_Z16,
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > index 6e7b8b682d13..49a17487e196 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1314,6 +1314,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> > >  	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
> > >  	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
> > >  	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
> > > +	case V4L2_PIX_FMT_Y16I:		descr = "Interleaved 16-bit Greyscale"; break;
> > >  	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
> > >  	case V4L2_PIX_FMT_INZI:		descr = "Planar 10:16 Greyscale Depth"; break;
> > >  	case V4L2_PIX_FMT_CNF4:		descr = "4-bit Depth Confidence (Packed)"; break;
> > > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > > index 88d96095bcb1..1c16be20c966 100644
> > > --- a/include/linux/usb/uvc.h
> > > +++ b/include/linux/usb/uvc.h
> > > @@ -118,6 +118,9 @@
> > >  #define UVC_GUID_FORMAT_Y12I \
> > >  	{ 'Y',  '1',  '2',  'I', 0x00, 0x00, 0x10, 0x00, \
> > >  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > > +#define UVC_GUID_FORMAT_Y16I \
> > > +	{ 'Y',  '1',  '6',  'I', 0x00, 0x00, 0x10, 0x00, \
> > > +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > >  #define UVC_GUID_FORMAT_Z16 \
> > >  	{ 'Z',  '1',  '6',  ' ', 0x00, 0x00, 0x10, 0x00, \
> > >  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > > index a8015e5e7fa4..d152027021d3 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -793,6 +793,7 @@ struct v4l2_pix_format {
> > >  #define V4L2_PIX_FMT_S5C_UYVY_JPG v4l2_fourcc('S', '5', 'C', 'I') /* S5C73M3 interleaved UYVY/JPEG */
> > >  #define V4L2_PIX_FMT_Y8I      v4l2_fourcc('Y', '8', 'I', ' ') /* Greyscale 8-bit L/R interleaved */
> > >  #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale 12-bit L/R interleaved */
> > > +#define V4L2_PIX_FMT_Y16I     v4l2_fourcc('Y', '1', '6', 'I') /* Greyscale 16-bit L/R interleaved */
> > >  #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
> > >  #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
> > >  #define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-bit block mode, two non-contiguous planes */

-- 
Regards,

Laurent Pinchart

