Return-Path: <linux-media+bounces-23776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCD99F79C4
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 11:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1524E16E4CC
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 10:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF764222D76;
	Thu, 19 Dec 2024 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H6fR/n3O"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA2F22256E;
	Thu, 19 Dec 2024 10:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734605047; cv=none; b=q9rW8BaLCI/SgaWY4rOQ5e9gL4STAdJ4ZkI1DrWIK9kWCRK1wwXb1B9Y9ugu7B9/R+AIiWV0KnLFDmg46DpQn2OG/ijttWMqIuP1afNx+detU+nRgcVXPM2x9nRUBSAsdjdBugbh2zBohDm0ItcHzPh4J20Hx7SGdJMohGG0P28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734605047; c=relaxed/simple;
	bh=KpiBPph0Gu8P36/nc+BaL1QztxpR7NzK1NNDiaT6XTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUjO8A0D948V9e8BY8x1hGHf9wM5yPPPfzBW8Bi1fL88x/XzbnOyQLPMpzpVWoaiaNZ+BskDnZlq40izFlXX650d0ZfVhj6u9bmGFBjkNIl9vYijcALcYUJcrFCFAaKOjII8GYha+jAFBxinXyIN4MGvT8YtS/2di6jJTfN3b1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H6fR/n3O; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3819163;
	Thu, 19 Dec 2024 11:43:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734605003;
	bh=KpiBPph0Gu8P36/nc+BaL1QztxpR7NzK1NNDiaT6XTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H6fR/n3OhVX1rJV1XEaSYDQex24nGrjk89qXW2t4zEKPUU2o+jryw3X4+SmDIUFTr
	 1h5PtBghdMX9FAAMEeTT0hLCAUNrPBdKwZAdjOfbc2rJFwGFS+1rVeqYmjEFTJMP+o
	 +nC+JL4srfC49xF9ywGlIzmOtSqjQ2p0d1cyaj84=
Date: Thu, 19 Dec 2024 12:43:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Filter hw errors while enumerating
 controls
Message-ID: <20241219104358.GA2510@pendragon.ideasonboard.com>
References: <20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org>
 <CANiDSCvL_C5mgGoXz9zWjJA7fXizM751hjm5jadWsRiymTRYsQ@mail.gmail.com>
 <20241218232838.GG5518@pendragon.ideasonboard.com>
 <CANiDSCtyRHgxOkEMYTi56AhoWS7xjskU-BMvGxpeJ=XBNJ=okw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCtyRHgxOkEMYTi56AhoWS7xjskU-BMvGxpeJ=XBNJ=okw@mail.gmail.com>

On Thu, Dec 19, 2024 at 09:18:30AM +0100, Ricardo Ribalda wrote:
> On Thu, 19 Dec 2024 at 00:28, Laurent Pinchart wrote:
> > On Wed, Dec 18, 2024 at 03:38:34PM +0100, Ricardo Ribalda wrote:
> > > On Fri, 13 Dec 2024 at 12:21, Ricardo Ribalda wrote:
> > > >
> > > > To implement VIDIOC_QUERYCTRL, we need to read from the hardware all the
> > > > values that were not cached previously. If that read fails, we used to
> > > > report back the error to the user.
> > > >
> > > > Unfortunately this does not play nice with userspace. When they are
> > > > enumerating the contols, the only expect an error when there are no
> > > > "next" control.
> > > >
> > > > This is probably a corner case, and could be handled in userspace, but
> > > > both v4l2-ctl and yavta fail to enumerate all the controls if we return
> > > > then -EIO during VIDIOC_QUERYCTRL. I suspect that there are tons of
> > > > userspace apps handling this wrongly as well.
> > >
> > > Actually it CANNOT be handled in userspace.
> > >
> > > If we return anything different than 0, the structure is not copied to
> > > userspace:
> >
> > That could be fixed, we do copy data back to userspace in case of
> > failure for some ioctls. I don't think that would be needed though, I
> > believe we can either mark controls as broken in the uvcvideo driver
> > through quirks, or in a dynamic fashion.
> 
> I'd rather not introduce more differences between uvc and the rest of
> the drivers.
> 
> the ctrl framework only seems to return -EINVAL or 0.

True, but that's likely because there's no driver today other than
uvcvideo that needs to interogate the hardware in a way that can fail to
implement QUERYCTRL. I wish we didn't have to, but UVC is special from
that point of view.

Anyway, as mentioned in a separate answer in this mail thread, we may
not need this if we hide the problematic controls from applications.

> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/v4l2-core/v4l2-ioctl.c#n2929
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/v4l2-core/v4l2-ioctl.c#n3490

-- 
Regards,

Laurent Pinchart

