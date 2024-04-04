Return-Path: <linux-media+bounces-8629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E0F8983A5
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 10:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99373282C8F
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 08:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F51E7351A;
	Thu,  4 Apr 2024 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="G+solaG5"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DFF3D96B
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 08:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712221133; cv=pass; b=JEhWeyuFPyHNAwsyb355GiXmaZj3YcF03exWjKDvlpczePIeLIioQugVS3MVxmBMHCCJvD7HdZiz//mqRveQWmdGg/6KvSQPvooaCJKmIY2MQ4b+j2J2tk6NqfwjVMdSzfnFxJoD2R8BpXU3ZjvQboRC2r6g+Ji5D4iG5mH1eNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712221133; c=relaxed/simple;
	bh=2Ba8M7fDvklkCiqhNIWw9nV2mdk8gXKus4iB176fKBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCVmdKWI3B72lLOgq/P9eRCt57Ez6NpisOhi1a+Rf1MaVPVMEhB/TLy4hHXiVi+BuoBeZI6mp7dkgQnoOQj4Ds6pw9ol0JjPnIb1vU+opB5aoE25m2s8ZRCXsRQ2oKWe0a47yNeWvyBUNpjYpyQgOAn9JllQfqTbl/+Asj38HSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=G+solaG5; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4V9FsL6P3Dz49Psw;
	Thu,  4 Apr 2024 11:58:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1712221127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NhAs9Jf0+CCYOSzTjIdtpOkcNQpMZgbb50KqMi4gok4=;
	b=G+solaG51O9AjM/9R4WVkMwYQVfGjaC+I1dAnn3r+H4q0z4KzUmv2NRIHHDbCrf5DHH1i6
	Y3W/nnNgUCbH27jHFVBYe/e6sdjfvKbDsXN23uMN2sUDrGBIZKUbUVxKzezxjOkRZZKYd0
	O7ZOYs+9L/eu2ceXNA0Mi0j6Hv39N4N1spAHInL9GB3FdW8nT2hjR4q8GjAMcpQO/74Qwu
	W4x+IHp8gUd4rS1YCeI9Wc/0cvplzU7K2ohCBeYka2CTqeGPxLvdpyDyS6HlYb0qg/Yydh
	cElSwSa6Hiu96N7lqa/5nNmhwFHmlGjevvnrnoYuprqgqLY3EceGZds084SLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1712221127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NhAs9Jf0+CCYOSzTjIdtpOkcNQpMZgbb50KqMi4gok4=;
	b=b+OePspJ3f9Owh6ABasqxIRBQjDwfS4+2u/zm9d++aLQPsc9M7O4XLU/f/VQUF2+pP2Buo
	HvyhqaVOkfsexQaSHb6Nz/7PgaTK/DPK53Z7YArwRKv3faSfzzv4/HMHFwD+S3kUCVO4wt
	NyPXg6ut5WaPbMAp2Xcq+EBy4Kk6SXfAjTpUE8Cdfhgi6B6sFpbB6DvzJtv085QK54Zu9f
	YkHc/bxm49desmlK8aDm70lI629odbnmzrXj8iAwRHr7h8vAVNP0NmOyX+gUEejX48CiYs
	VOnJU0K0hBw0rr5RqL00sigKIl3wHVzLLLj0B6e53uX1V040XZVC3xNQhphwcA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1712221127; a=rsa-sha256;
	cv=none;
	b=cYCK83UCjDi4cXPzVRqpD3Tpxj6asndApIeuC6gaSCcnkOiG7vwSkLML04H4xwyi1pF613
	CgsFGeRdxuHmYYCseUWgLL0JCq6eCLVBovRUTiCjd22eerCJOKnRsd4fXpyXBkd6mgOV4D
	ImHcUhJvmg71MWjmDohjIsMkzvG8ZugW4pBEyekGMKC9g42Us5wSJdO/WJAn/a4hLz22D3
	+pyFb3lIXnOZUYC9Bc+DW3RxQjLn7WUtrPyGAJ+80Ph0xDnjcVu7/0T65AzxKdExhN+7x7
	SAr3ExBsTF1kY5ygjWBUe6TYl/Fz1+v/WKi+Yv1+BSwdtJbQP81GXjL+4TINZw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BAA65634C93;
	Thu,  4 Apr 2024 11:58:45 +0300 (EEST)
Date: Thu, 4 Apr 2024 08:58:45 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-subdev: Remove stream support for the crop
 API
Message-ID: <Zg5rxcKlMohGbL_U@valkosipuli.retiisi.eu>
References: <20240403224233.18224-1-laurent.pinchart@ideasonboard.com>
 <ba1d234f-ec2b-4406-9c18-3e59445301de@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba1d234f-ec2b-4406-9c18-3e59445301de@xs4all.nl>

Hi Hans,

On Thu, Apr 04, 2024 at 10:27:49AM +0200, Hans Verkuil wrote:
> Hi Laurent,
> 
> On 04/04/2024 00:42, Laurent Pinchart wrote:
> > When support for streams was added to the V4L2 subdev API, the
> > v4l2_subdev_crop structure was extended with a stream field, but the
> > field was not handled in the core code that translates the
> > VIDIOC_SUBDEV_[GS]_CROP ioctls to the selection API. This could be
> > fixed, but the crop API is deprecated and shouldn't be used by new
> > userspace code. It's therefore best to avoid extending it with new
> > features. Drop the stream field from the v4l2_subdev_crop structure, and
> > update the documentation and kernel code accordingly.
> > 
> > Fixes: 2f91e10ee6fd ("media: subdev: add stream based configuration")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > This supersedes the "[PATCH] media: v4l2-subdev: Fix stream handling for
> > crop API" patch ([1]). I'll submit matching patches for v4l2-compliance.
> > 
> > [1] https://patchwork.linuxtv.org/project/linux-media/patch/20240401233725.2401-1-laurent.pinchart@ideasonboard.com/
> > ---
> >  .../userspace-api/media/v4l/vidioc-subdev-g-crop.rst        | 5 +----
> >  drivers/media/v4l2-core/v4l2-subdev.c                       | 6 ------
> >  include/uapi/linux/v4l2-subdev.h                            | 4 +---
> >  3 files changed, 2 insertions(+), 13 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
> > index 92d933631fda..7eeb7b553abf 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
> > @@ -96,10 +96,7 @@ modified format should be as close as possible to the original request.
> >        - ``rect``
> >        - Crop rectangle boundaries, in pixels.
> >      * - __u32
> > -      - ``stream``
> > -      - Stream identifier.
> > -    * - __u32
> > -      - ``reserved``\ [7]
> > +      - ``reserved``\ [8]
> >        - Reserved for future extensions. Applications and drivers must set
> >  	the array to zero.
> >  
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 4c6198c48dd6..02c2a2b472df 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -725,9 +725,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		struct v4l2_subdev_crop *crop = arg;
> >  		struct v4l2_subdev_selection sel;
> >  
> > -		if (!client_supports_streams)
> > -			crop->stream = 0;
> > -
> >  		memset(crop->reserved, 0, sizeof(crop->reserved));
> >  		memset(&sel, 0, sizeof(sel));
> >  		sel.which = crop->which;
> > @@ -749,9 +746,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		if (crop->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
> >  			return -EPERM;
> >  
> > -		if (!client_supports_streams)
> > -			crop->stream = 0;
> > -
> >  		memset(crop->reserved, 0, sizeof(crop->reserved));
> >  		memset(&sel, 0, sizeof(sel));
> >  		sel.which = crop->which;
> > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > index 7048c51581c6..f7eea12d8a2c 100644
> > --- a/include/uapi/linux/v4l2-subdev.h
> > +++ b/include/uapi/linux/v4l2-subdev.h
> > @@ -48,15 +48,13 @@ struct v4l2_subdev_format {
> >   * @which: format type (from enum v4l2_subdev_format_whence)
> >   * @pad: pad number, as reported by the media API
> >   * @rect: pad crop rectangle boundaries
> > - * @stream: stream number, defined in subdev routing
> >   * @reserved: drivers and applications must zero this array
> >   */
> >  struct v4l2_subdev_crop {
> >  	__u32 which;
> >  	__u32 pad;
> >  	struct v4l2_rect rect;
> > -	__u32 stream;
> > -	__u32 reserved[7];
> > +	__u32 reserved[8];
> >  };
> 
> Sorry, but you can't remove this field. This field has been in the uAPI since
> v6.3, and applications might be using it, even if only to set it to 0. Removing
> this field will break compilation of such applications.
> 
> Just fix the stream support instead, rather than removing it, as you did in
> your original patch:
> 
> https://lore.kernel.org/linux-media/20240401233725.2401-1-laurent.pinchart@ideasonboard.com/

Referring to the discussion that has already taken place, we'd rather offer
a single API to control cropping and that is the selection API. But I agree
that there is a theoretical possibility someone might have set this to zero
and thus compilation could fail.

I'm sure this could be handled on the application still as there was never
anything to configure here. Breaking binary compatibility would be a real
issue but that's not what we have here.

-- 
Kind regards,

Sakari Ailus

