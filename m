Return-Path: <linux-media+bounces-8355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0964B894DCC
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 10:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B9161C215DA
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 08:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF9453E3D;
	Tue,  2 Apr 2024 08:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eQZkxwnA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DC13FB14
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712047460; cv=none; b=VBhryELK1jmomMECmq9Yqr0/vw+nige2PAKnQOk7LU2cbrh/N2bTLDifvOy5p4em+NjqyYYOM26Ty5rPhX4JbHJvimZ9zptBZwah9ZnXf5vfspeWDzDw8ayRvYJTq3FMd1rilMl7f65iPVSyfQOPy+IcsDKnrU81JF5EnOAn3K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712047460; c=relaxed/simple;
	bh=DFf2XXbyzdGdOOxjqPRYlcTIWuWmEB5RJXwnILx4noM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4FJtcC9qgXiWB3D/PnDqhY2xrFEKb2yyI5t/sQwtxKz+WcXfBmrMev6tY3WxloxLByEMlrkXtCNZ+Pms+UduyQv0lXTGJ2gN3T8PtmI7iZtfCvUjHNWrsPYWHw6JHMJN0G02dMPyYx95JjRg0AxMSiWcfwjIymrXy6CVTUK6EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eQZkxwnA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 810BB564;
	Tue,  2 Apr 2024 10:43:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712047421;
	bh=DFf2XXbyzdGdOOxjqPRYlcTIWuWmEB5RJXwnILx4noM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQZkxwnAD7FSVKm4FWNDqwfK30JCvOb/n/DjhbaoNBmJPWpdlIDzkpuK25CbKI9yO
	 JdL0uv4rXqguyanVlcJOs9g5b/+Uyj1bhqekFmFfBEKqSXmgqraaIwTD+Y3SJsakE3
	 5ltEgaUPpfiNyQ3xvhzTKiTTGAbANcESqsRMPFe8=
Date: Tue, 2 Apr 2024 11:44:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: v4l2-subdev: Fix stream handling for crop API
Message-ID: <20240402084407.GC10288@pendragon.ideasonboard.com>
References: <20240401233725.2401-1-laurent.pinchart@ideasonboard.com>
 <Zgu_xhcadm2F1Rxl@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zgu_xhcadm2F1Rxl@valkosipuli.retiisi.eu>

On Tue, Apr 02, 2024 at 08:20:22AM +0000, Sakari Ailus wrote:
> Moi,
> 
> On Tue, Apr 02, 2024 at 02:37:25AM +0300, Laurent Pinchart wrote:
> > When support for streams was added to the V4L2 subdev API, the
> > v4l2_subdev_crop structure was extended with a stream field, but the
> > field was not handled in the core code that translates the
> > VIDIOC_SUBDEV_[GS]_CROP ioctls to the selection API. Fix it.
> 
> The field is indeed in the UAPI headers. But do we want to support the CROP
> IOCTL for streams? Shouldn't the callers be using the [GS]_SELECTION
> instead?

They should, but if the field is there, we should support it :-) The
alternative is to remove it. It will cause failures in v4l2-compliance
that we'll need to handle though.

> > Fixes: 2f91e10ee6fd ("media: subdev: add stream based configuration")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 4c6198c48dd6..45836f0a2b0a 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -732,6 +732,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		memset(&sel, 0, sizeof(sel));
> >  		sel.which = crop->which;
> >  		sel.pad = crop->pad;
> > +		sel.stream = crop->stream;
> >  		sel.target = V4L2_SEL_TGT_CROP;
> >  
> >  		rval = v4l2_subdev_call(
> > @@ -756,6 +757,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		memset(&sel, 0, sizeof(sel));
> >  		sel.which = crop->which;
> >  		sel.pad = crop->pad;
> > +		sel.stream = crop->stream;
> >  		sel.target = V4L2_SEL_TGT_CROP;
> >  		sel.r = crop->rect;
> >  
> > 
> > base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f

-- 
Regards,

Laurent Pinchart

