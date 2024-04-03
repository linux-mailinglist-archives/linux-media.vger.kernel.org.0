Return-Path: <linux-media+bounces-8470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2E9896544
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 09:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC603284650
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 07:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BF655C22;
	Wed,  3 Apr 2024 07:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iHQv9DZW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B57548FD
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 07:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712127693; cv=none; b=HwmRfWbNnZqO07X2IkFUBeYgR/bafy3eYFYW6OaxllV+otJ+bPv1Uttf/XPphgw0+JMI7n+iCWo/U9xOK3ALQahesr3XFvaIy8fOSEz5E0GxJj81Lk4fjaDa8XnLd5QkaSYArQ4OnLNt/pKkDh7oefMYerDlZAxCdUzbQ/3cHKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712127693; c=relaxed/simple;
	bh=txFtA9KM1Ry7MTHWFveEbwhK7K4JAL0WUu/+qt4pOKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntjpcv2Jx9en26kP7ITbXnDE09zDSkC28aHFEMA0k7mygigDLqN8ONKrtW3ZCn15kNgeUPmtsM+BKSbJzMaUR+b8z85ww5sI082A98dPh+W5OuWzegrrcgD06wS7Bsxbd6a/OZbK/ATxEG2HNOgIYo2fMeCWma/ome/Rx4vd0qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iHQv9DZW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15F96674;
	Wed,  3 Apr 2024 09:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712127653;
	bh=txFtA9KM1Ry7MTHWFveEbwhK7K4JAL0WUu/+qt4pOKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHQv9DZW4gC2WvFpAqJ3Uzat6erm3Q7L/bIWv3o8Vh+i9I3tjbtOyIqN0o36pwhct
	 +VSKhiJCBDbt7WKH7KZ5QOPqjYrxpX6afJFf9b0mBBldAH7lNOwDVNBlmrUArdI2bM
	 LY+TQ7r/IOwPOVslW8drdpJschx1PaG6U+w6kw4g=
Date: Wed, 3 Apr 2024 10:01:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: v4l2-subdev: Fix stream handling for crop API
Message-ID: <20240403070119.GI16740@pendragon.ideasonboard.com>
References: <20240401233725.2401-1-laurent.pinchart@ideasonboard.com>
 <Zgu_xhcadm2F1Rxl@valkosipuli.retiisi.eu>
 <20240402084407.GC10288@pendragon.ideasonboard.com>
 <ZgvF1wi2UpkUTC9-@valkosipuli.retiisi.eu>
 <d5f3af05-77e7-4647-877a-ffddfd9a2623@ideasonboard.com>
 <Zgwi14Z7tciTBlIG@valkosipuli.retiisi.eu>
 <20240402201137.GB32172@pendragon.ideasonboard.com>
 <86075433-94d7-422c-bef2-65875faeaedb@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86075433-94d7-422c-bef2-65875faeaedb@ideasonboard.com>

On Wed, Apr 03, 2024 at 09:51:01AM +0300, Tomi Valkeinen wrote:
> On 02/04/2024 23:11, Laurent Pinchart wrote:
> > On Tue, Apr 02, 2024 at 03:23:03PM +0000, Sakari Ailus wrote:
> >> On Tue, Apr 02, 2024 at 12:11:30PM +0300, Tomi Valkeinen wrote:
> >>> On 02/04/2024 11:46, Sakari Ailus wrote:
> >>>> On Tue, Apr 02, 2024 at 11:44:07AM +0300, Laurent Pinchart wrote:
> >>>>> On Tue, Apr 02, 2024 at 08:20:22AM +0000, Sakari Ailus wrote:
> >>>>>> Moi,
> >>>>>>
> >>>>>> On Tue, Apr 02, 2024 at 02:37:25AM +0300, Laurent Pinchart wrote:
> >>>>>>> When support for streams was added to the V4L2 subdev API, the
> >>>>>>> v4l2_subdev_crop structure was extended with a stream field, but the
> >>>>>>> field was not handled in the core code that translates the
> >>>>>>> VIDIOC_SUBDEV_[GS]_CROP ioctls to the selection API. Fix it.
> >>>>>>
> >>>>>> The field is indeed in the UAPI headers. But do we want to support the CROP
> >>>>>> IOCTL for streams? Shouldn't the callers be using the [GS]_SELECTION
> >>>>>> instead?
> >>>>>
> >>>>> They should, but if the field is there, we should support it :-) The
> >>>>> alternative is to remove it. It will cause failures in v4l2-compliance
> >>>>> that we'll need to handle though.
> >>>>
> >>>> I'd prefer to stick to selections here, this is new functionality so
> >>>> [GS]_CROP support isn't required. I don't have a strong opinion on the
> >>>> matter though.
> >>>
> >>> Maybe it's easier to just support the stream field, instead of making
> >>> [GS]_CROP the odd case which looks like it should support streams, but then
> >>> doesn't...
> >>
> >> It's an old IOCTL already replaced by the [GS]_SELECTION. I mainly write
> >> kernel space software but overall I think it's better if we can provide a
> >> single API for controlling cropping instead of two with similar
> >> functionality, of which the user then should choose from.
> >>
> >> It should be also documented in this context if we choose support
> >> [GS]_CROP.
> >>
> >> So I believe we have less work to do and have a better result if we just
> >> drop the stream field there. :-)
> > 
> > I tend to agree, even if that's only a slight preference. Tomi, if
> > you're fine with this, I'll update the patch.
> 
> I'm fine with it. So we now should move the 'stream' field back to 
> reserved, and add documentation saying that [GS]_CROP works differently 
> than the other ioctls?

That's the idea. I'll send patches.

-- 
Regards,

Laurent Pinchart

