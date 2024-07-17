Return-Path: <linux-media+bounces-15090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D766F933E25
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 16:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35481B22721
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 14:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5004180A98;
	Wed, 17 Jul 2024 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KM10pLYQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532BD1802A3;
	Wed, 17 Jul 2024 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721225094; cv=none; b=YFdMS0+4M1Rz6QM9OcTAs4OTBYaCPZgs1/1TjFgsL0tZWtsvhJgZjDSBZ+0k8Oaj+QJXkcx0NTBUvln9P0f3CeT0Qd723QLFJSJrDcdYdMI/Lo58bklmA6i0WWxkVBW01qhCtXULVjgyfk1sqLCnTA7x2bmRLoZRnlvk5ykxLpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721225094; c=relaxed/simple;
	bh=UZYCS86EJeax8Fo8uvo2+rpYlepn1M3UFz4n4r+qc/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6WZV4hRGg5Sz+MCqBkzzm4mPWheovabbxoRltXp7tAK7GtMWap2MNiyH7EZ/jTDHolIJC8czUDeZlOQHpKW4xOrU19VwUt5d8A9vzH3lchL1tpeGLzhbed9c7BFmsFh0MILxuaIywaMU2TucqaBxMNGiuyWWYTFKEb5JmZYtiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KM10pLYQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97CEB667;
	Wed, 17 Jul 2024 16:04:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721225052;
	bh=UZYCS86EJeax8Fo8uvo2+rpYlepn1M3UFz4n4r+qc/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KM10pLYQIgJ8RgIk+OT6Fy8bOHIut/FNAc7+Uo4ESbpCaY9x0lOOIg1gHSSLY0fm6
	 ojx1YljWuSmo4hQyvdgvC3HRRckdEusWP0roUU0xcIffg4mOvH0adr9Aps/uUb813n
	 rhedv1OiUPmVs8fHviS9VkDvIBrZ/6AfhT1EyiZM=
Date: Wed, 17 Jul 2024 16:04:47 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, mchehab@kernel.org, 
	ezequiel@vanguardiasur.com.ar, hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 1/2] media: videodev2: Add flags to unconditionnaly
 enumerate pixels formats
Message-ID: <ok2a4ubzka6rhzyj2c5op73ij7pw35g6e75whc2jjget62fatx@zka2ewyt3kfv>
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
 <20240717131430.159727-2-benjamin.gaignard@collabora.com>
 <2kbxr3hkjbcnaqescxmlcerziixg72icqpug6wa25eeggy2pnj@vqmxe4ojcwml>
 <dfc292f8-0014-4bf4-9429-31f729a176cd@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfc292f8-0014-4bf4-9429-31f729a176cd@collabora.com>

Hi Benjamin

On Wed, Jul 17, 2024 at 03:44:24PM GMT, Benjamin Gaignard wrote:
>
> Le 17/07/2024 à 15:20, Jacopo Mondi a écrit :
> > Hi Benjamin
> >
> > On Wed, Jul 17, 2024 at 03:14:29PM GMT, Benjamin Gaignard wrote:
> > > Add new flags to enumerate all pixels formats when calling VIDIOC_ENUM_FMT ioctl.
> > > When this V4L2_FMT_FLAG_ENUM_ALL_FORMATS flag is set drivers must
> > > ignore the configuration and return the hardware supported pixel
> > > formats for the specified queue.
> > > To distinguish this particular enumeration case V4L2_FMT_FLAG_ALL_FORMATS
> > > flag must be set by the drivers to highlight support of this feature
> > > to user space applications.
> > > This will permit to discover which pixel formats are supported
> > > without setting codec-specific information so userland can more easily
> > > know if the driver suits its needs well.
> > > The main target are stateless decoders so update the documentation
> > > about how to use this flag.
> > >
> > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > ---
> > > changes in version 4:
> > > - Explicitly document that the new flags are targeting mem2mem devices.
> > >
> > >   .../userspace-api/media/v4l/dev-stateless-decoder.rst |  6 ++++++
> > >   .../userspace-api/media/v4l/vidioc-enum-fmt.rst       | 11 +++++++++++
> > >   .../userspace-api/media/videodev2.h.rst.exceptions    |  2 ++
> > >   drivers/media/v4l2-core/v4l2-ioctl.c                  |  3 +++
> > >   include/uapi/linux/videodev2.h                        |  2 ++
> > >   5 files changed, 24 insertions(+)
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
> > > index 35ed05f2695e..b0b657de910d 100644
> > > --- a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
> > > +++ b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
> > > @@ -58,6 +58,12 @@ Querying capabilities
> > >        default values for these controls being used, and a returned set of formats
> > >        that may not be usable for the media the client is trying to decode.
> > >
> > > +   * If the ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS`` flag is set the driver must enumerate
> > > +     all the supported formats without taking care of codec-dependent controls
> > > +     set on the ``OUTPUT`` queue. To indicate that the driver has take care of this
> > > +     flag it must set ``V4L2_FMT_FLAG_ALL_FORMATS`` flag for each format while
> > > +     enumerating.
> > > +
> > >   3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect supported
> > >      resolutions for a given format, passing desired pixel format in
> > >      :c:type:`v4l2_frmsizeenum`'s ``pixel_format``.
> > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > > index 3adb3d205531..15bc2f59c05a 100644
> > > --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > > +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > > @@ -234,6 +234,17 @@ the ``mbus_code`` field is handled differently:
> > >   	valid. The buffer consists of ``height`` lines, each having ``width``
> > >   	Data Units of data and the offset (in bytes) between the beginning of
> > >   	each two consecutive lines is ``bytesperline``.
> > > +    * - ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS``
> > > +      - 0x0400
> > > +      - Set by userland applications to enumerate all possible pixel formats
> > > +        without taking care of any OUTPUT or CAPTURE queue configuration.
> > > +        This flag is relevant only for mem2mem devices.
> > > +    * - ``V4L2_FMT_FLAG_ALL_FORMATS``
> > > +      - 0x0800
> > > +      - Set by the driver to indicated that format have been enumerated because
> > > +        :ref:`V4L2_FMT_FLAG_ENUM_ALL_FORMATS <v4l2-pix-fmt-flag-set-csc>` has
> > > +        been set by the userland application.
> > > +        This flag is relevant only for mem2mem devices.
> > Thanks, however I think this can be wrapper on the previous line
>
> ok
>
> >
> > >   Return Value
> > >   ============
> > > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > > index bdc628e8c1d6..7a3a1e9dc055 100644
> > > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > > @@ -216,6 +216,8 @@ replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
> > >   replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
> > >   replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
> > >   replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
> > > +replace define V4L2_FMT_FLAG_ENUM_ALL_FORMATS fmtdesc-flags
> > > +replace define V4L2_FMT_FLAG_ALL_FORMATS fmtdesc-flags
> > >
> > >   # V4L2 timecode types
> > >   replace define V4L2_TC_TYPE_24FPS timecode-type
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > index 4c76d17b4629..5785a98b6ba2 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1569,6 +1569,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
> > >   	int ret = check_fmt(file, p->type);
> > >   	u32 mbus_code;
> > >   	u32 cap_mask;
> > > +	u32 flags;
> > >
> > >   	if (ret)
> > >   		return ret;
> > > @@ -1578,8 +1579,10 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
> > >   		p->mbus_code = 0;
> > >
> > >   	mbus_code = p->mbus_code;
> > > +	flags = p->flags & V4L2_FMT_FLAG_ENUM_ALL_FORMATS;
> > >   	memset_after(p, 0, type);
> > >   	p->mbus_code = mbus_code;
> > > +	p->flags = flags;
> > Won't this set V4L2_FMT_FLAG_ENUM_ALL_FORMATS (if present) in the
> > flags returned to userspace ? Shouldn't be drivers to set
> > V4L2_FMT_FLAG_ALL_FORMATS instead ?
>
> memset_after zeroed flags field so we need this to send V4L2_FMT_FLAG_ENUM_ALL_FORMATS
> flag to drivers. Return it to userspace is a side effect but I don't that is problem
> since it set it anyway.
>

Ok, if the expectation is that the flag is preserved through the ioctl
call, this is fine with me

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> >
> > >   	switch (p->type) {
> > >   	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > > index fe6b67e83751..b6a5da79ba21 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -886,6 +886,8 @@ struct v4l2_fmtdesc {
> > >   #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
> > >   #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
> > >   #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
> > > +#define V4L2_FMT_FLAG_ENUM_ALL_FORMATS		0x0400
> > > +#define V4L2_FMT_FLAG_ALL_FORMATS		0x0800
> > >
> > >   	/* Frame Size and frame rate enumeration */
> > >   /*
> > > --
> > > 2.43.0
> > >
> > >
> > _______________________________________________
> > Kernel mailing list -- kernel@mailman.collabora.com
> > To unsubscribe send an email to kernel-leave@mailman.collabora.com
> > This list is managed by https://mailman.collabora.com

