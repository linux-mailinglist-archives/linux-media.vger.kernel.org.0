Return-Path: <linux-media+bounces-8360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2956E894E94
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 11:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD9261F23899
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 09:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB5E57860;
	Tue,  2 Apr 2024 09:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UOFQTKDL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C911E525
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 09:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712049757; cv=none; b=qf4oR3xrFj2yejwsTy+OgpKkOhI6IOdKtp1hageoEh5St/87JuX7/4tl00KZApm0JPC+bouFGCux54IQKzvJY7+D+w2M6QhPR5m7McYno/xhGdqBKb5vSNU1i+m7UbVNYEcPcYvd6gl9DxXdMIT6Py8UYzALd65wz4cOm0aEWuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712049757; c=relaxed/simple;
	bh=WHCnz22++MsliagW1Qil5+b1nBkNRh5xElpH6ikOze0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hz8IJVhfQuxDTfPmp5oI4XjimGXSeOeN8Ut9CT3iG0QIqhBIH54uvERdYlgHBSYZxINGHzd7B4BUcGhjwiAAEECnPh04aHHsPasDpbtWInLAZw/uQ+dEdjWy8kKi+9/JldHbtDQ+bmfgHPFDts+rrm2YiwTeJYl2DuoZRv3hXW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UOFQTKDL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BB44564;
	Tue,  2 Apr 2024 11:21:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712049717;
	bh=WHCnz22++MsliagW1Qil5+b1nBkNRh5xElpH6ikOze0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UOFQTKDL3YSmba5SJ5yvt3OU4j02d0LDQW6+B3fyQKg99vqvgYS/zDg+xiWczIL1X
	 NE8cQVPlqzZ6GrL1z11DS/Af5MtnAIBfUTMMWOwr5O9eTciK/7E8U8TWmKnwGSMFBM
	 Z+EqhOY7N/rR5lz2CIo16jzCeJOq20kuCzNKCejM=
Date: Tue, 2 Apr 2024 12:22:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: v4l2-subdev: Fix stream handling for crop API
Message-ID: <20240402092224.GE10288@pendragon.ideasonboard.com>
References: <20240401233725.2401-1-laurent.pinchart@ideasonboard.com>
 <Zgu_xhcadm2F1Rxl@valkosipuli.retiisi.eu>
 <20240402084407.GC10288@pendragon.ideasonboard.com>
 <ZgvF1wi2UpkUTC9-@valkosipuli.retiisi.eu>
 <d5f3af05-77e7-4647-877a-ffddfd9a2623@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d5f3af05-77e7-4647-877a-ffddfd9a2623@ideasonboard.com>

On Tue, Apr 02, 2024 at 12:11:30PM +0300, Tomi Valkeinen wrote:
> On 02/04/2024 11:46, Sakari Ailus wrote:
> > On Tue, Apr 02, 2024 at 11:44:07AM +0300, Laurent Pinchart wrote:
> >> On Tue, Apr 02, 2024 at 08:20:22AM +0000, Sakari Ailus wrote:
> >>> Moi,
> >>>
> >>> On Tue, Apr 02, 2024 at 02:37:25AM +0300, Laurent Pinchart wrote:
> >>>> When support for streams was added to the V4L2 subdev API, the
> >>>> v4l2_subdev_crop structure was extended with a stream field, but the
> >>>> field was not handled in the core code that translates the
> >>>> VIDIOC_SUBDEV_[GS]_CROP ioctls to the selection API. Fix it.
> >>>
> >>> The field is indeed in the UAPI headers. But do we want to support the CROP
> >>> IOCTL for streams? Shouldn't the callers be using the [GS]_SELECTION
> >>> instead?
> >>
> >> They should, but if the field is there, we should support it :-) The
> >> alternative is to remove it. It will cause failures in v4l2-compliance
> >> that we'll need to handle though.
> > 
> > I'd prefer to stick to selections here, this is new functionality so
> > [GS]_CROP support isn't required. I don't have a strong opinion on the
> > matter though.
> 
> Maybe it's easier to just support the stream field, instead of making 
> [GS]_CROP the odd case which looks like it should support streams, but 
> then doesn't...

I'll let the two of you argue and decide, and implement the result :-)

> >>>> Fixes: 2f91e10ee6fd ("media: subdev: add stream based configuration")
> >>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>> ---
> >>>>   drivers/media/v4l2-core/v4l2-subdev.c | 2 ++
> >>>>   1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >>>> index 4c6198c48dd6..45836f0a2b0a 100644
> >>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >>>> @@ -732,6 +732,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >>>>   		memset(&sel, 0, sizeof(sel));
> >>>>   		sel.which = crop->which;
> >>>>   		sel.pad = crop->pad;
> >>>> +		sel.stream = crop->stream;
> >>>>   		sel.target = V4L2_SEL_TGT_CROP;
> >>>>   
> >>>>   		rval = v4l2_subdev_call(
> >>>> @@ -756,6 +757,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >>>>   		memset(&sel, 0, sizeof(sel));
> >>>>   		sel.which = crop->which;
> >>>>   		sel.pad = crop->pad;
> >>>> +		sel.stream = crop->stream;
> >>>>   		sel.target = V4L2_SEL_TGT_CROP;
> >>>>   		sel.r = crop->rect;
> >>>>   
> >>>>
> >>>> base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f

-- 
Regards,

Laurent Pinchart

