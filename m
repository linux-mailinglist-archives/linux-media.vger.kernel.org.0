Return-Path: <linux-media+bounces-37695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CB6B0461E
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 19:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6742B189B57A
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8FE261591;
	Mon, 14 Jul 2025 17:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pD4CIn60"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1373FD4;
	Mon, 14 Jul 2025 17:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752512895; cv=none; b=fenAcJ9h3+SXzQOkFTIdTE5ZylFTak+yayD3r9zvFOIx1rbZxAollodOma5aPO2ZThXpg7CAb9egtc17EmaxU7yPvwOWNuQ1Cxo8aQAAKdHIzjZ7yleapZTxnda9rKTemSxVnLEq9i/4fqqxytrA1e0IduMr5TZnbkBVx5It7X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752512895; c=relaxed/simple;
	bh=9k/+fL/6ozQpVW7PA+MTn0NMNv3pLc8FRDELsEyuLrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRMxDoNRwdOSGaJvD5OX0AybXzSnRpR8c4O4hEMbqriwLLrHY8M+tjHjZDcDjGs4gusmUbRSIKhBBuStVJqy9Tv7K922VZoNf+/iKq0T4LigQEyRGGzqu5x1I4qUt1C4GAcaYQEQNo1rZR8uRZWAGCYjqhjLugqywVS/d7W+riw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pD4CIn60; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 42E3C289;
	Mon, 14 Jul 2025 19:07:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752512860;
	bh=9k/+fL/6ozQpVW7PA+MTn0NMNv3pLc8FRDELsEyuLrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pD4CIn60PU1001RvQbsBRLkBWUWuzoOe8xfHYS6RZfZWn0tEAIAZO7v+k/8xg8aIi
	 Kj2x4SNpuMCERKdJszF2x6HUPnZHj4y1Me2txLkFgY0YXDAaAhWnQ8ZstNj5GqUfzf
	 yfkfmf/xiiJt835BW2PJ1SrLmCJtB09zrnLHDGek=
Date: Mon, 14 Jul 2025 20:07:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 4/5] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_MSXU_1_5
Message-ID: <20250714170740.GC20231@pendragon.ideasonboard.com>
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
 <20250707-uvc-meta-v8-4-ed17f8b1218b@chromium.org>
 <20250714145935.GL8243@pendragon.ideasonboard.com>
 <CANiDSCt=cS9_BsEvo8fEpRDfud9nob2nzgDR6CvmcFczZurG2w@mail.gmail.com>
 <20250714162700.GA20231@pendragon.ideasonboard.com>
 <CANiDSCstp18Ee6JXtuOEgyZyg9=NsMPvbrkHHrN0KydLXqAO3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCstp18Ee6JXtuOEgyZyg9=NsMPvbrkHHrN0KydLXqAO3A@mail.gmail.com>

On Mon, Jul 14, 2025 at 06:42:14PM +0200, Ricardo Ribalda wrote:
> On Mon, 14 Jul 2025 at 18:27, Laurent Pinchart wrote:
> > On Mon, Jul 14, 2025 at 06:21:05PM +0200, Ricardo Ribalda wrote:
> > > On Mon, 14 Jul 2025 at 17:00, Laurent Pinchart wrote:
> > > >
> > > > Hi Ricardo,
> > > >
> > > > A bit of a stupid question, or rather a question that I wonder why I
> > > > didn't think of before.
> > >
> > > I believe we discussed this in the very beginning, when I just enabled
> > > V4L2_META_FMT_D4XX for all the devices.
> >
> > Sorry if that was the case, it was a while ago.
> >
> > > We thought that it could break applications. Imagine an APP that can
> > > work with D4XX but not with other formats: if it tries to parse MSXU
> > > format it might crash.
> >
> > How so, if V4L2_META_FMT_D4XX and V4L2_META_FMT_UVC_MSXU_1_5 identify
> > the same format ?
> 
> D4XX uses vendor IDs from MSXU (0x80000000-2) [1]. There is no
> guarantee that other vendors will collide with that ID.

I assume you mean "will not collide" ? There's also no guarantee that
different vendors implementing the MSXU won't use vendor-specific
metadata with colliding IDs, is there ?

> Also, we do not know how apps will behave with IDs that they do not
> know or with sizes that they have not been tested with.

The change won't cause any regression for those apps when using Intel
D4xx devices.

> [1] https://www.kernel.org/doc/html/v5.8/userspace-api/media/v4l/pixfmt-meta-d4xx.html#id8
>
> > > > On Mon, Jul 07, 2025 at 06:34:04PM +0000, Ricardo Ribalda wrote:
> > > > > The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
> > > > > V4L2_META_FMT_D4XX. The only difference between the two of them is that
> > > > > V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
> > > > > V4L2_META_FMT_D4XX copies the whole metadata section.
> > > > >
> > > > > Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
> > > > > devices, but it is useful to have the whole metadata payload for any
> > > > > device where vendors include other metadata, such as the one described by
> > > > > Microsoft:
> > > > > https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> > > > >
> > > > > This patch introduces a new format V4L2_META_FMT_UVC_MSXU_1_5, that is
> > > > > identical to V4L2_META_FMT_D4XX.
> > > >
> > > > Wouldn't it be simpler for everybody to just
> > > >
> > > > #define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('D', '4', 'X', 'X') /* UVC MSXU metadata */
> > > > #define V4L2_META_FMT_D4XX      V4L2_META_FMT_UVC_MSXU_1_5 /* For backward compatibility */
> > > >
> > > > ? I'm a bit uncomfortable with committing to a UABI with two different
> > > > 4CCs for the exact same format.
> > > >
> > > > > Let the user enable this format with a quirk for now. This way they can
> > > > > test if their devices provide useful metadata without rebuilding the
> > > > > kernel. They can later contribute patches to auto-quirk their devices.
> > > > > We will also work in methods to auto-detect devices compatible with this
> > > > > new metadata format.
> > > > >
> > > > > Suggested-by: Hans de Goede <hdegoede@redhat.com>
> > > > > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > ---
> > > > >  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
> > > > >  .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 ++++++++++++++++++++++
> > > > >  MAINTAINERS                                        |  1 +
> > > > >  drivers/media/usb/uvc/uvc_metadata.c               |  4 ++++
> > > > >  drivers/media/usb/uvc/uvcvideo.h                   |  1 +
> > > > >  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
> > > > >  include/uapi/linux/videodev2.h                     |  1 +
> > > > >  7 files changed, 32 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > > > index bb6876cfc271e1a0543eee4209d6251e1a6a73cc..0de80328c36bf148051a19abe9e5241234ddfe5c 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > > > @@ -20,6 +20,7 @@ These formats are used for the :ref:`metadata` interface only.
> > > > >      metafmt-pisp-fe
> > > > >      metafmt-rkisp1
> > > > >      metafmt-uvc
> > > > > +    metafmt-uvc-msxu-1-5
> > > > >      metafmt-vivid
> > > > >      metafmt-vsp1-hgo
> > > > >      metafmt-vsp1-hgt
> > > > > diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> > > > > new file mode 100644
> > > > > index 0000000000000000000000000000000000000000..dd1c3076df243d770a13e7f6d07c3296a269e16a
> > > > > --- /dev/null
> > > > > +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> > > > > @@ -0,0 +1,23 @@
> > > > > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > > > > +
> > > > > +.. _v4l2-meta-fmt-uvc-msxu-1-5:
> > > > > +
> > > > > +***********************************
> > > > > +V4L2_META_FMT_UVC_MSXU_1_5 ('UVCM')
> > > > > +***********************************
> > > > > +
> > > > > +Microsoft(R)'s UVC Payload Metadata.
> > > > > +
> > > > > +
> > > > > +Description
> > > > > +===========
> > > > > +
> > > > > +V4L2_META_FMT_UVC_MSXU_1_5 buffers follow the metadata buffer layout of
> > > > > +V4L2_META_FMT_UVC with the only difference that it includes all the UVC
> > > > > +metadata in the `buffer[]` field, not just the first 2-12 bytes.
> > > > > +
> > > > > +The metadata format follows the specification from Microsoft(R) [1].
> > > > > +
> > > > > +.. _1:
> > > > > +
> > > > > +[1] https://docs.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index 658543062bba3b7e600699d7271ffc89250ba7e5..fdde1d37ed2ef9058e3ea3417bec25afe454dfc0 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -25827,6 +25827,7 @@ S:    Maintained
> > > > >  W:   http://www.ideasonboard.org/uvc/
> > > > >  T:   git git://linuxtv.org/media.git
> > > > >  F:   Documentation/userspace-api/media/drivers/uvcvideo.rst
> > > > > +F:   Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
> > > > >  F:   Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > > > >  F:   drivers/media/common/uvc.c
> > > > >  F:   drivers/media/usb/uvc/
> > > > > diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> > > > > index 4bcbc22f47e67c52baf6e133f240131ff3d32a03..77e03273d3cf6b00cac6ebb9b29b941f1cbfd9f7 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_metadata.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_metadata.c
> > > > > @@ -195,6 +195,10 @@ void uvc_meta_init(struct uvc_device *dev)
> > > > >           !WARN_ON(dev->info->meta_format == V4L2_META_FMT_UVC))
> > > > >               dev->meta_formats[i++] = dev->info->meta_format;
> > > > >
> > > > > +     if (dev->quirks & UVC_QUIRK_MSXU_META &&
> > > > > +         !WARN_ON(dev->info->meta_format == V4L2_META_FMT_UVC_MSXU_1_5))
> > > > > +             dev->meta_formats[i++] = V4L2_META_FMT_UVC_MSXU_1_5;
> > > > > +
> > > > >        /* IMPORTANT: for new meta-formats update UVC_MAX_META_DATA_FORMATS. */
> > > > >       dev->meta_formats[i++] = 0;
> > > > >  }
> > > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > > index b3c094c6591e7a71fc00e1096bcf493a83f330ad..616adc417c62a58686beccbc440a5dfac0a2d588 100644
> > > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > > @@ -77,6 +77,7 @@
> > > > >  #define UVC_QUIRK_DISABLE_AUTOSUSPEND        0x00008000
> > > > >  #define UVC_QUIRK_INVALID_DEVICE_SOF 0x00010000
> > > > >  #define UVC_QUIRK_MJPEG_NO_EOF               0x00020000
> > > > > +#define UVC_QUIRK_MSXU_META          0x00040000
> > > > >
> > > > >  /* Format flags */
> > > > >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > index be94a79b976e3de4eb957f5d2584ec6d4230469e..993b36417b4655456ce545cb42a41b55b98e4d6c 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > @@ -1463,6 +1463,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> > > > >       case V4L2_META_FMT_VSP1_HGO:    descr = "R-Car VSP1 1-D Histogram"; break;
> > > > >       case V4L2_META_FMT_VSP1_HGT:    descr = "R-Car VSP1 2-D Histogram"; break;
> > > > >       case V4L2_META_FMT_UVC:         descr = "UVC Payload Header Metadata"; break;
> > > > > +     case V4L2_META_FMT_UVC_MSXU_1_5:        descr = "UVC MSXU Metadata"; break;
> > > > >       case V4L2_META_FMT_D4XX:        descr = "Intel D4xx UVC Metadata"; break;
> > > > >       case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
> > > > >       case V4L2_META_FMT_RK_ISP1_PARAMS:      descr = "Rockchip ISP1 3A Parameters"; break;
> > > > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > > > > index 6f7bd38dd5aa4b1b2084685512512a380d76a5e4..863bc5b7dec32303e852d7e9c3891011ce5a3d71 100644
> > > > > --- a/include/uapi/linux/videodev2.h
> > > > > +++ b/include/uapi/linux/videodev2.h
> > > > > @@ -867,6 +867,7 @@ struct v4l2_pix_format {
> > > > >  #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
> > > > >  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
> > > > >  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
> > > > > +#define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('U', 'V', 'C', 'M') /* UVC MSXU metadata */
> > > > >  #define V4L2_META_FMT_VIVID    v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
> > > > >
> > > > >  /* Vendor specific - used for RK_ISP1 camera sub-system */

-- 
Regards,

Laurent Pinchart

