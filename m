Return-Path: <linux-media+bounces-28194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E155CA60CCA
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 10:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FF07461139
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 09:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53811DF963;
	Fri, 14 Mar 2025 09:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i+2AbyM3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5221DE3AD;
	Fri, 14 Mar 2025 09:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741943392; cv=none; b=BpB2mf3Wy78jW7giXdeRgNJePoG2hTfweY2VJ6Y/io25A5na6lGyqpdxNRmSXFmKGeZSZiNUn4BCbm97U1fqK/axxA7sEMj2Yn4WAM+6Q/oIHxZ3WPRz7GaFyZme1YpqPn/+x1IwM1cUMl4DmgAeUg0eGCc/Oh1+mqyGJt6vbo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741943392; c=relaxed/simple;
	bh=TlmG2L5R+I3AdyCukinQlJkSWU33w6Q3hwD9UJHGjYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odkB4vK/kHU3U5Y3w9CxCOPa3Sv+vKO51rlBQNBsvKYAW+R3Z+3l0BvF/Z1KCMVxgowU5JfosrbmL2/VIpxR4LIChryKBMVAn6v5ELcMgCFHcrROmedesmjdkJ2iBDjrWUHVz8deHZe3oy36/9dkblvUOmjPXJWHjl2lKTdZvLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i+2AbyM3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (ip-185-104-138-24.ptr.icomera.net [185.104.138.24])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90B778D4;
	Fri, 14 Mar 2025 10:08:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741943282;
	bh=TlmG2L5R+I3AdyCukinQlJkSWU33w6Q3hwD9UJHGjYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+2AbyM3JKtCGMu9inhOg5zYq1eoI/RodlcnyVoNHYZJjBmT03mu1vcARRYjnY+D1
	 yo03LTTOlgxeRFzmZOU3RMF6T+ic1swf0WOe2Sh4TpE9Vf2EZVlQs+wmjlX7h5AxRz
	 4cIArSaOV8sCPcvadtPz+SvmPziEMKbiVxgu9fU8=
Date: Fri, 14 Mar 2025 11:09:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] media: uvcvideo: Introduce
 V4L2_META_FMT_UVC_CUSTOM
Message-ID: <20250314090919.GE19612@pendragon.ideasonboard.com>
References: <20250313-uvc-metadata-v3-0-c467af869c60@chromium.org>
 <20250313-uvc-metadata-v3-3-c467af869c60@chromium.org>
 <20250314073456.25817a3d@foz.lan>
 <CANiDSCuNzwqhYOORqY+PGUbK8=tqxm6stpzQC3BFYF7pxgRG6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuNzwqhYOORqY+PGUbK8=tqxm6stpzQC3BFYF7pxgRG6w@mail.gmail.com>

Hi Ricardo,

On Fri, Mar 14, 2025 at 09:28:34AM +0100, Ricardo Ribalda wrote:
> On Fri, 14 Mar 2025 at 07:35, Mauro Carvalho Chehab wrote:
> > Em Thu, 13 Mar 2025 12:06:27 +0000 Ricardo Ribalda escreveu:
> >
> > > The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
> > > V4L2_META_FMT_D4XX. The only difference between the two of them is that
> > > V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
> > > V4L2_META_FMT_D4XX copies the whole metadata section.
> > >
> > > Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
> > > devices, but it is useful to have the whole metadata section for any
> > > device where vendors include other metadata, such as the one described by
> > > Microsoft:
> > > https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> > >
> > > This patch introduces a new format V4L2_META_FMT_UVC_CUSTOM, that is
> > > identical to V4L2_META_FMT_D4XX but it is available to all the UVC
> > > devices.
> > >
> > > Suggested-by: Hans de Goede <hdegoede@redhat.com>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
> > >  .../userspace-api/media/v4l/metafmt-uvc-custom.rst | 31 +++++++++++++++++
> > >  MAINTAINERS                                        |  1 +
> > >  drivers/media/usb/uvc/uvc_metadata.c               | 40 ++++++++++++++++++----
> > >  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
> > >  include/uapi/linux/videodev2.h                     |  1 +
> > >  6 files changed, 69 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > index 86ffb3bc8ade2e0c563dd84441572ecea1a571a6..9fd83f4a3cc8509702a2a9f032fdc04bf6c6d1bc 100644
> > > --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > @@ -19,6 +19,7 @@ These formats are used for the :ref:`metadata` interface only.
> > >      metafmt-pisp-fe
> > >      metafmt-rkisp1
> > >      metafmt-uvc
> > > +    metafmt-uvc-custom
> > >      metafmt-vivid
> > >      metafmt-vsp1-hgo
> > >      metafmt-vsp1-hgt
> > > diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..9f150fc2b6f379cc4707ff45041dd014956ae11a
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst
> > > @@ -0,0 +1,31 @@
> > > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > > +
> > > +.. _v4l2-meta-fmt-uvc-custom:
> > > +
> > > +*********************************
> > > +V4L2_META_FMT_UVC_CUSTOM ('UVCC')
> > > +*********************************
> > > +
> > > +UVC Custom Payload Metadata.
> > > +
> > > +
> > > +Description
> > > +===========
> > > +
> > > +V4L2_META_FMT_UVC_CUSTOM buffers follow the metadata buffer layout of
> > > +V4L2_META_FMT_UVC with the only difference that it includes all the UVC
> > > +metadata, not just the first 2-12 bytes.
> > > +
> > > +The most common metadata format is the one proposed by Microsoft(R)'s UVC
> > > +extension [1_], but other vendors might have different formats.
> > > +
> > > +Applications might use information from the Hardware Database (hwdb)[2_] to
> > > +process the camera's metadata accordingly.
> >
> > Having something like that at the userspace API shouldn't be handled
> > lightly. This sounds to me that passing a blank check for vendors to stream
> > whatever they want without any requirements to provide and sort of
> > documentation for the usersace to decode it.
> 
> As HdG previously mentioned, all the processing is done in the camera
> so the metadata is not going to hide highly secret required for
> processing:
> https://lore.kernel.org/linux-media/67c1a857-7656-421f-994c-751709b6ae01@redhat.com/

Without judging whether or not such an undocumented format should be
supported by the driver, a correction is needed here: the issue is not
"secrets required for processing", but giving closed-source application
an unfair advantage.

> > Also, it would be hard for userspace to distinguish what metatata
> > is contained for a random UVC camera. Please let's not do that.
> 
> Userspace will use hwdb info to properly parse the metadata.

I don't have experience with that, so I would like to see the effort
being started on hwdb support to see how it will look like before we
merge this patch. A few cameras should be added as examples, and a
stategy to ensure the hwdb will be properly populated should be
proposed.

> > As the specific issue here is to support an already known extension,
> > which is already documented, Just add an specific format for it, e.g.
> > you could add something like that at the documentation:
> 
> The problem here is how do we know from the driver if a device
> supports V4L2_META_FMT_MSXU_UVC_1_5 or not.
> 
> In Windows it seems that vendors add that information to the device
> .inf file. That is equivalent to the hwdb proposal.
> In ChromeOS we are trying to push vendors to use an extension saying
> if there is metadata or not. But that will take some time to land and
> there are thousands of modules out there not ChromeOS compliant.
> 
> >
> >         V4L2_META_FMT_MSXU_UVC_1_5
> >            Microsoft extensions to USB Video Class 1.5 specification.
> >
> >            For more details, see: https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
> >
> > And then add the corresponding format to V4L2 API.

-- 
Regards,

Laurent Pinchart

