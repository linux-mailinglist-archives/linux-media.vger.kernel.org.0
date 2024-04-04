Return-Path: <linux-media+bounces-8634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4CD8984E7
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 12:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A238728695D
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 10:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791A17602D;
	Thu,  4 Apr 2024 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hm2WvoGt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4243D96B
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712225977; cv=none; b=HSus/7JiJ8M2CzEJD0tNAppqQIbitq/oQn8edWWyd4tYcBKH9mWfel1J9Lx7iyqeLecRPlRPoV0r8WUqnijQot6TKX2pFWQdriQ1aLivGrNSyZipxpr9JDf7ea19tkW5hu0xsIRbX/tw8689Br4xU8vCh6brDc3G+LLjZQThRI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712225977; c=relaxed/simple;
	bh=t8NxyP9hKUI/5EgSMREzlDDjCnsKAmuwgqrm40+J4E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2HAGob1zJEENil4nhNryVIu6IWA6OosVYFSyMga/8j6rjtdWzGYgFMj2jD1NwloCbKHRjX5U+GuIO4nWuufkyL8NrpH8xbZe5NnT6mtbOSz8zJF8uLagI+eFqMkScZi41JKclRZUeaiC+pCaQCfZmftoPOelsIdcdLhO+OI7Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Hm2WvoGt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E2BF1A2;
	Thu,  4 Apr 2024 12:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712225936;
	bh=t8NxyP9hKUI/5EgSMREzlDDjCnsKAmuwgqrm40+J4E4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hm2WvoGtQ7HHdEnb7ByQBSNUQT9BI2vsIxNUjyBp6ZTWtYbtegCNqo0QN+jAR3Jan
	 uDoKNuezR+VX5LB3/DnnM45cIdytmGx0WZx5Nk7ln/qBizK4MljmrEGumhUWeiv1Fl
	 PqhwdFRx2wR8YsTjO/Lh8DIW6RsiU4Eu2HPcKSco=
Date: Thu, 4 Apr 2024 13:19:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-subdev: Remove stream support for the crop
 API
Message-ID: <20240404101923.GN23803@pendragon.ideasonboard.com>
References: <20240403224233.18224-1-laurent.pinchart@ideasonboard.com>
 <ba1d234f-ec2b-4406-9c18-3e59445301de@xs4all.nl>
 <Zg5rxcKlMohGbL_U@valkosipuli.retiisi.eu>
 <81a6f089-b6ac-4871-aa0a-96b43d7bde7f@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <81a6f089-b6ac-4871-aa0a-96b43d7bde7f@xs4all.nl>

On Thu, Apr 04, 2024 at 12:09:38PM +0200, Hans Verkuil wrote:
> On 04/04/2024 10:58, Sakari Ailus wrote:
> > On Thu, Apr 04, 2024 at 10:27:49AM +0200, Hans Verkuil wrote:
> >> On 04/04/2024 00:42, Laurent Pinchart wrote:
> >>> When support for streams was added to the V4L2 subdev API, the
> >>> v4l2_subdev_crop structure was extended with a stream field, but the
> >>> field was not handled in the core code that translates the
> >>> VIDIOC_SUBDEV_[GS]_CROP ioctls to the selection API. This could be
> >>> fixed, but the crop API is deprecated and shouldn't be used by new
> >>> userspace code. It's therefore best to avoid extending it with new
> >>> features. Drop the stream field from the v4l2_subdev_crop structure, and
> >>> update the documentation and kernel code accordingly.
> >>>
> >>> Fixes: 2f91e10ee6fd ("media: subdev: add stream based configuration")
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> ---
> >>> This supersedes the "[PATCH] media: v4l2-subdev: Fix stream handling for
> >>> crop API" patch ([1]). I'll submit matching patches for v4l2-compliance.
> >>>
> >>> [1] https://patchwork.linuxtv.org/project/linux-media/patch/20240401233725.2401-1-laurent.pinchart@ideasonboard.com/
> >>> ---
> >>>  .../userspace-api/media/v4l/vidioc-subdev-g-crop.rst        | 5 +----
> >>>  drivers/media/v4l2-core/v4l2-subdev.c                       | 6 ------
> >>>  include/uapi/linux/v4l2-subdev.h                            | 4 +---
> >>>  3 files changed, 2 insertions(+), 13 deletions(-)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
> >>> index 92d933631fda..7eeb7b553abf 100644
> >>> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
> >>> @@ -96,10 +96,7 @@ modified format should be as close as possible to the original request.
> >>>        - ``rect``
> >>>        - Crop rectangle boundaries, in pixels.
> >>>      * - __u32
> >>> -      - ``stream``
> >>> -      - Stream identifier.
> >>> -    * - __u32
> >>> -      - ``reserved``\ [7]
> >>> +      - ``reserved``\ [8]
> >>>        - Reserved for future extensions. Applications and drivers must set
> >>>  	the array to zero.
> >>>  
> >>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >>> index 4c6198c48dd6..02c2a2b472df 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >>> @@ -725,9 +725,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >>>  		struct v4l2_subdev_crop *crop = arg;
> >>>  		struct v4l2_subdev_selection sel;
> >>>  
> >>> -		if (!client_supports_streams)
> >>> -			crop->stream = 0;
> >>> -
> >>>  		memset(crop->reserved, 0, sizeof(crop->reserved));
> >>>  		memset(&sel, 0, sizeof(sel));
> >>>  		sel.which = crop->which;
> >>> @@ -749,9 +746,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >>>  		if (crop->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
> >>>  			return -EPERM;
> >>>  
> >>> -		if (!client_supports_streams)
> >>> -			crop->stream = 0;
> >>> -
> >>>  		memset(crop->reserved, 0, sizeof(crop->reserved));
> >>>  		memset(&sel, 0, sizeof(sel));
> >>>  		sel.which = crop->which;
> >>> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> >>> index 7048c51581c6..f7eea12d8a2c 100644
> >>> --- a/include/uapi/linux/v4l2-subdev.h
> >>> +++ b/include/uapi/linux/v4l2-subdev.h
> >>> @@ -48,15 +48,13 @@ struct v4l2_subdev_format {
> >>>   * @which: format type (from enum v4l2_subdev_format_whence)
> >>>   * @pad: pad number, as reported by the media API
> >>>   * @rect: pad crop rectangle boundaries
> >>> - * @stream: stream number, defined in subdev routing
> >>>   * @reserved: drivers and applications must zero this array
> >>>   */
> >>>  struct v4l2_subdev_crop {
> >>>  	__u32 which;
> >>>  	__u32 pad;
> >>>  	struct v4l2_rect rect;
> >>> -	__u32 stream;
> >>> -	__u32 reserved[7];
> >>> +	__u32 reserved[8];
> >>>  };
> >>
> >> Sorry, but you can't remove this field. This field has been in the uAPI since
> >> v6.3, and applications might be using it, even if only to set it to 0. Removing
> >> this field will break compilation of such applications.
> >>
> >> Just fix the stream support instead, rather than removing it, as you did in
> >> your original patch:
> >>
> >> https://lore.kernel.org/linux-media/20240401233725.2401-1-laurent.pinchart@ideasonboard.com/
> > 
> > Referring to the discussion that has already taken place, we'd rather offer
> > a single API to control cropping and that is the selection API. But I agree
> > that there is a theoretical possibility someone might have set this to zero
> > and thus compilation could fail.
> > 
> > I'm sure this could be handled on the application still as there was never
> > anything to configure here. Breaking binary compatibility would be a real
> > issue but that's not what we have here.
> 
> So there is one patch that just fixes the bug and allows the old crop API to be used
> with streams, and one kernel patch + several v4l-utils to remove support for it and
> potentially break compilation for applications.
> 
> It's silly to remove support when you can just fix it. Yes, there are (and have been
> for a long time) two crop APIs (crop and selection), but as long as drivers just have
> to deal with one API (selection), I don't really see why you care if applications use
> the crop API. You can't remove that ioctl anyway, and the impact is minimal if it is
> handled in the core.
> 
> It is really too late to remove the stream field from the crop struct.

I should have replied to this e-mail instead of an earlier one in the
thread.

No application should set the stream field to anything else than 0, as
stream support is disabled in the mainline kernel. However, even if I
think the risk is very small, there is indeed a risk than an application
may be setting it to 0.

> Perhaps instead make a patch adding a comment to v4l2-subdev.h that that crop struct
> is frozen and must not be extended with new features going forward, to prevent the
> same thing happening in the future.

That's a good idea.

> Sorry, but I'm not going to accept this patch. It is trivial to fix the crop stream
> support, and that patch looks good. And adding a patch to note that v4l2_subdev_crop is
> frozen is fine as well and makes perfect sense.

Another option is to keep the stream field in the structure, document it
as not being used (which is the current behaviour), and dropping the
partial handling inside the kernel. I have a feeling this may not be
favoured by many though :-)

-- 
Regards,

Laurent Pinchart

