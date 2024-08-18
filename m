Return-Path: <linux-media+bounces-16412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35336955CC0
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 15:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DCE6B20FA2
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 13:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061DB4AEC6;
	Sun, 18 Aug 2024 13:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M03S+5aM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3006318B09
	for <linux-media@vger.kernel.org>; Sun, 18 Aug 2024 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723987292; cv=none; b=fu2NmVxKZRre+MezGVJzv0Q1k2KvBsQZZNKRk4LbQs3gvQv8drpImatgy8XGx7vKh2tk4tIcKGYQxphdclqYy1poPWi1Uq+37Q3tnez/ubav3OKmplaB54Vd9rZM0VRqY281CQMxAGKTQYCIVXtJNE5wQ/OT4jtXoPONU1bV9xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723987292; c=relaxed/simple;
	bh=jc3Kaauoo9b/vnD+moluYNwFrEbqYJw1jJ50f679h24=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kj3q4nf5oWEhW/MQ7CVx11VlSwup0uazmSz3jH3cZhQUwmn2bmU5wcaaOFJ6HuT7aso45XLqBJs8hdgd+hu9W8f3NJ/68av5WUJqshhEEBn0H1EcNLxidnJlGATy7muldfjrTRi85KbXWELYcz4swesjvqTQXcyoIgRx0+yr1w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M03S+5aM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723987290; x=1755523290;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=jc3Kaauoo9b/vnD+moluYNwFrEbqYJw1jJ50f679h24=;
  b=M03S+5aMZDgOYsWATN+3QPY45dy70mmqnnOe8LzVGv3ujQiJtZrTKpnJ
   +mrf9TNECPBVElkr0d9yX9Mf1a2uL79k5b7Wro9cZIhajNzFoH2xOTM4g
   xleNBALyyaL0ajbRw0p2OQRmRXM7jTWbFgijbU/43EpEFF123JqKi/WS6
   9Bgmj/MEYSjtq2DdPDT1Jz9Pj9tO4jbX8V8X6eCYlkMF2fZJtt36d8T8H
   ALOgeMsOuecG7bCp1BAyC1ayHu0MfRnr6ttQlVhLFynHcqTgWkFpSFLGs
   dyxYjzvA6GEKiiYyg4HXpQ1AbqWKrC2ePyiiKDBmmV93/aHCxp22QPc51
   w==;
X-CSE-ConnectionGUID: SKCtxobzSfmSj+5+XVyQFg==
X-CSE-MsgGUID: AKzU0uavR+W3oD63AJpZRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="33381319"
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="33381319"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2024 06:21:30 -0700
X-CSE-ConnectionGUID: G3JkQH8SR5iNehsexD+iVA==
X-CSE-MsgGUID: VuIHCxu+QvWhaUDslL1QPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="65007815"
Received: from ubuntu24.iil.intel.com ([143.185.122.15])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2024 06:21:28 -0700
Message-ID: <1743262e16eb893ea718f22a9bd5da6caa5b6f39.camel@intel.com>
Subject: Re: [PATCH] [media] v4l: Add luma 16-bit interlaced pixel format
From: Dmitry Perchanov <dmitry.perchanov@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, sakari.ailus@iki.fi, 
	demisrael@gmail.com
Date: Sun, 18 Aug 2024 16:20:50 +0300
In-Reply-To: <20240802152653.GK18732@pendragon.ideasonboard.com>
References: <96a65ab833ab160ce2ecac97edb719bfa9fa18ca.camel@intel.com>
	 <20240802152653.GK18732@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Laurent,

Thanks for your review, I will update patch to match latest,
as now it conflicts with merged updates.

Please see inline.

On Fri, 2024-08-02 at 18:26 +0300, Laurent Pinchart wrote:
> Hi Dmitry,
>=20
> Thank you for the patch.
>=20
> On Sun, Jul 28, 2024 at 06:35:57AM -0400, Dmitry Perchanov wrote:
> > The formats added by this patch are:
> >=20
> >         V4L2_PIX_FMT_Y16I
> >         UVC_GUID_FORMAT_Y16I
> >=20
> > Interlaced lumina format primary use in RealSense
> > Depth cameras with stereo stream for left and right
> > image sensors.
> >=20
> > Signed-off-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
>=20
> The format itself looks fine. Could you split this patch in two, with
> one patch that defines the new format (documentation, v4l2-ioctl.c and
> videodev2.h), and another patch that adds it to the uvcvideo driver
> (drivers/media/common/uvc.c, include/linux/usb/uvc.h) ? We usually do so
> to ease backporting.
This can be great idea but uvc patch will fail compilation -=A0
it's depends on V4L2_PIX_FMT_Y16I defined at videodev2.h
>=20
> > ---
> >  .../userspace-api/media/v4l/pixfmt-y16i.rst   | 80 +++++++++++++++++++
> >  .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
> >  drivers/media/common/uvc.c                    |  4 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
> >  include/linux/usb/uvc.h                       |  3 +
> >  include/uapi/linux/videodev2.h                |  1 +
> >  6 files changed, 90 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16i.r=
st
> >=20
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst b/Do=
cumentation/userspace-api/media/v4l/pixfmt-y16i.rst
> > new file mode 100644
> > index 000000000000..3303b7832cdb
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
> > @@ -0,0 +1,80 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _V4L2-PIX-FMT-Y16I:
> > +
> > +**************************
> > +V4L2_PIX_FMT_Y16I ('Y16I')
> > +**************************
> > +
> > +Interleaved grey-scale image, e.g. from a stereo-pair
> > +
> > +
> > +Description
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +This is a grey-scale image with a depth of 16 bits per pixel, but with
> > +pixels from 2 sources interleaved and unpacked. Each pixel is stored
> > +in a 32-bit word in the little-endian order. On a little-endian machin=
e
> > +these pixels can be deinterlaced using
> > +
> > +.. code-block:: c
> > +
> > +    __u8 *buf;
> > +    left0 =3D 0xffff & *(__u16 *)buf;
> > +    right0 =3D 0xffff & *((__u16 *)buf + 1);
>=20
> I think this is a bit overkill. I would simply write
>=20
> This is a grey-scale image with a depth of 16 bits per pixel, but with pi=
xels
> from 2 sources interleaved and unpacked. Each pixel is stored in a 16-bit=
 word
> in the little-endian order. The first pixel is from the left source.
>=20
> > +
> > +**Pixel unpacked representation.**
> > +Left/Right pixels 16-bit unpacked - 16-bit for each interleaved pixel.
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +
> > +    * - Y'\ :sub:`0L[7:0]`
> > +      - Y'\ :sub:`0L[15:8]`
> > +      - Y'\ :sub:`0R[7:0]`
> > +      - Y'\ :sub:`0R[15:8]`
> > +
> > +**Byte Order.**
> > +Each cell is one byte.
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +
> > +    * - start + 0:
> > +      - Y'\ :sub:`00Llow`
> > +      - Y'\ :sub:`00Lhigh`
> > +      - Y'\ :sub:`00Rlow`
> > +      - Y'\ :sub:`00Rhigh`
> > +      - Y'\ :sub:`01Llow`
> > +      - Y'\ :sub:`01Lhigh`
> > +      - Y'\ :sub:`01Rlow`
> > +      - Y'\ :sub:`01Rhigh`
> > +    * - start + 8:
> > +      - Y'\ :sub:`10Llow`
> > +      - Y'\ :sub:`10Lhigh`
> > +      - Y'\ :sub:`10Rlow`
> > +      - Y'\ :sub:`10Rhigh`
> > +      - Y'\ :sub:`11Llow`
> > +      - Y'\ :sub:`11Lhigh`
> > +      - Y'\ :sub:`11Rlow`
> > +      - Y'\ :sub:`11Rhigh`
> > +    * - start + 16:
> > +      - Y'\ :sub:`20Llow`
> > +      - Y'\ :sub:`20Lhigh`
> > +      - Y'\ :sub:`20Rlow`
> > +      - Y'\ :sub:`20Rhigh`
> > +      - Y'\ :sub:`21Llow`
> > +      - Y'\ :sub:`21Lhigh`
> > +      - Y'\ :sub:`21Rlow`
> > +      - Y'\ :sub:`21Rhigh`
> > +    * - start + 24:
> > +      - Y'\ :sub:`30Llow`
> > +      - Y'\ :sub:`30Lhigh`
> > +      - Y'\ :sub:`30Rlow`
> > +      - Y'\ :sub:`30Rhigh`
> > +      - Y'\ :sub:`31Llow`
> > +      - Y'\ :sub:`31Lhigh`
> > +      - Y'\ :sub:`31Rlow`
> > +      - Y'\ :sub:`31Rhigh`
> > diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Do=
cumentation/userspace-api/media/v4l/yuv-formats.rst
> > index 24b34cdfa6fe..78ee406d7647 100644
> > --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> > @@ -269,5 +269,6 @@ image.
> >      pixfmt-yuv-luma
> >      pixfmt-y8i
> >      pixfmt-y12i
> > +    pixfmt-y16i
> >      pixfmt-uv8
> >      pixfmt-m420
> > diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> > index 9c0ba7a6c185..246fb6da5903 100644
> > --- a/drivers/media/common/uvc.c
> > +++ b/drivers/media/common/uvc.c
> > @@ -120,6 +120,10 @@ static const struct uvc_format_desc uvc_fmts[] =3D=
 {
> >  		.guid		=3D UVC_GUID_FORMAT_Y12I,
> >  		.fcc		=3D V4L2_PIX_FMT_Y12I,
> >  	},
> > +	{
> > +		.guid		=3D UVC_GUID_FORMAT_Y16I,
> > +		.fcc		=3D V4L2_PIX_FMT_Y16I,
> > +	},
> >  	{
> >  		.guid		=3D UVC_GUID_FORMAT_Z16,
> >  		.fcc		=3D V4L2_PIX_FMT_Z16,
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-=
core/v4l2-ioctl.c
> > index 6e7b8b682d13..49a17487e196 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1314,6 +1314,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc =
*fmt)
> >  	case V4L2_PIX_FMT_IPU3_Y10:	descr =3D "10-bit greyscale (IPU3 Packed)=
"; break;
> >  	case V4L2_PIX_FMT_Y8I:		descr =3D "Interleaved 8-bit Greyscale"; brea=
k;
> >  	case V4L2_PIX_FMT_Y12I:		descr =3D "Interleaved 12-bit Greyscale"; br=
eak;
> > +	case V4L2_PIX_FMT_Y16I:		descr =3D "Interleaved 16-bit Greyscale"; br=
eak;
> >  	case V4L2_PIX_FMT_Z16:		descr =3D "16-bit Depth"; break;
> >  	case V4L2_PIX_FMT_INZI:		descr =3D "Planar 10:16 Greyscale Depth"; br=
eak;
> >  	case V4L2_PIX_FMT_CNF4:		descr =3D "4-bit Depth Confidence (Packed)";=
 break;
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index 88d96095bcb1..1c16be20c966 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -118,6 +118,9 @@
> >  #define UVC_GUID_FORMAT_Y12I \
> >  	{ 'Y',  '1',  '2',  'I', 0x00, 0x00, 0x10, 0x00, \
> >  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > +#define UVC_GUID_FORMAT_Y16I \
> > +	{ 'Y',  '1',  '6',  'I', 0x00, 0x00, 0x10, 0x00, \
> > +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> >  #define UVC_GUID_FORMAT_Z16 \
> >  	{ 'Z',  '1',  '6',  ' ', 0x00, 0x00, 0x10, 0x00, \
> >  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index a8015e5e7fa4..d152027021d3 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -793,6 +793,7 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_S5C_UYVY_JPG v4l2_fourcc('S', '5', 'C', 'I') /* S=
5C73M3 interleaved UYVY/JPEG */
> >  #define V4L2_PIX_FMT_Y8I      v4l2_fourcc('Y', '8', 'I', ' ') /* Greys=
cale 8-bit L/R interleaved */
> >  #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greys=
cale 12-bit L/R interleaved */
> > +#define V4L2_PIX_FMT_Y16I     v4l2_fourcc('Y', '1', '6', 'I') /* Greys=
cale 16-bit L/R interleaved */
> >  #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth=
 data 16-bit */
> >  #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Media=
tek compressed block mode  */
> >  #define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Media=
tek 8-bit block mode, two non-contiguous planes */
>=20


