Return-Path: <linux-media+bounces-15025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A2C9315E4
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 15:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 578711C219F3
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 13:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB2718D4D8;
	Mon, 15 Jul 2024 13:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nN9rO/fB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C7118C180;
	Mon, 15 Jul 2024 13:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721050652; cv=none; b=cT0F/bzOVH2iD9NqMkQ5xyCM4ZY6urJQn+23Rf8ZbL9zIGbLiUS+IqwT6PmhcC/gWSsk3t1OcsZ4cFqxZAfQH36MMmaHWR6VfnOwHrgd1IEBWIXjxfDeLyFkcNJSisUGuKsph01lpDU9QAh24X1cOyVP4NiMQmbIgM4vfUcKmMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721050652; c=relaxed/simple;
	bh=rhP7ECBTlLPMeYVvuLIoPrMlFlZ3wXk9KQps5NZGa24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RiAAxRn7Zr+SNA752ECXM/+t3MkKmhtsz8zJWEjaF4jkFTSCTdZpUYfidKVvPETFajNyNa3Q6gjzfiiZbWdAo0OuL0RfXCeUOV/RO0QzjC3p8+zNcMTfM29LN7WPkfEpKQSYSIAbRVrRKyhLIvwyqbLf+fYNnP1IUrQ1m/hzvhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nN9rO/fB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5054C496;
	Mon, 15 Jul 2024 15:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721050612;
	bh=rhP7ECBTlLPMeYVvuLIoPrMlFlZ3wXk9KQps5NZGa24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nN9rO/fBDEmGpQTEbaK9W9LjgoV7flS932HO3p4WkV4Koo7vgTbvddxCKYrr2y5me
	 8daMj3cQ3uDj85gf/zZGuFtE9tI87bei3sdiSGH9AU/eE+1wBi1cRs7Yr6L93RMCfZ
	 TrmTm/6mCQhN+H0ktuP4e+uHotGB+dTMhnsGi3iI=
Date: Mon, 15 Jul 2024 15:37:25 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, mchehab@kernel.org, 
	ezequiel@vanguardiasur.com.ar, hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 1/2] media: videodev2: Add flags to unconditionnaly
 enumerate pixels formats
Message-ID: <xz3nq5hbdd24irfx2ip6t7ita4fitsc3f7azqzkuqlzbapwini@qt7gp4baf7rn>
References: <20240712103000.16655-1-benjamin.gaignard@collabora.com>
 <20240712103000.16655-2-benjamin.gaignard@collabora.com>
 <a4jvi5wg7ag6apodn4hkdr556r6dq6vknjzrqpti6mlsq56cpf@ygh6edcz5nci>
 <bc239839-bef4-486e-a636-0afab6723718@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc239839-bef4-486e-a636-0afab6723718@collabora.com>

Hi Benjamin

On Mon, Jul 15, 2024 at 08:09:55AM GMT, Benjamin Gaignard wrote:
>
> Le 12/07/2024 à 18:31, Jacopo Mondi a écrit :
> > Hi Benjamin
> >
> > On Fri, Jul 12, 2024 at 12:29:59PM GMT, Benjamin Gaignard wrote:
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
> > > changes in version 3:
> > > - Add a flag to inform userspace application that driver
> > >    as take care of the flag.
> > >
> > >   .../userspace-api/media/v4l/dev-stateless-decoder.rst    | 6 ++++++
> > >   .../userspace-api/media/v4l/vidioc-enum-fmt.rst          | 9 +++++++++
> > >   .../userspace-api/media/videodev2.h.rst.exceptions       | 2 ++
> > >   drivers/media/v4l2-core/v4l2-ioctl.c                     | 3 +++
> > >   include/uapi/linux/videodev2.h                           | 2 ++
> > >   5 files changed, 22 insertions(+)
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
> > > index 3adb3d205531..0399e0fc09b3 100644
> > > --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > > +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> > > @@ -234,6 +234,15 @@ the ``mbus_code`` field is handled differently:
> > >   	valid. The buffer consists of ``height`` lines, each having ``width``
> > >   	Data Units of data and the offset (in bytes) between the beginning of
> > >   	each two consecutive lines is ``bytesperline``.
> > > +    * - ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS``
> > > +      - 0x0400
> > > +      - Set by userland applications to enumerate all possible pixel formats
> > > +        without taking care of any OUTPUT or CAPTURE queue configuration.
> > This seems to be only relevant for codecs and m2m devices.
> >
> > For 'regular' capture (and I presume output) devices isn't the default
> > behaviour to enumerate all pixel formats, and userspace can decide to
> > restrict them by providing a media bus code (if the device reports the
> > V4L2_CAP_IO_MC capability)
>
> Yes is targeting codecs because they have two queues.

Well, m2m devices in general then

> When device have only one queue, like 'regular' capture devices,
> pixel enumeration doesn't have to take care of the other queue
> configuration because it doesn't exist.
>

This probably needs to be captured in the description here ?
We already have flags which apply only to some device types, and
that's specified in the flag description

    * - ``V4L2_FMT_FLAG_CSC_QUANTIZATION``
      - 0x0100
      - The driver allows the application to try to change the default
	quantization. This flag is relevant only for capture devices.

> >
> >
> > > +    * - ``V4L2_FMT_FLAG_ALL_FORMATS``
> > > +      - 0x0800
> > > +      - Set by the driver to indicated that format have been enumerated because
> > > +        :ref:`V4L2_FMT_FLAG_ENUM_ALL_FORMATS <v4l2-pix-fmt-flag-set-csc>` has
> > > +        been set by the userland application.
> > >
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
> > >
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
>

