Return-Path: <linux-media+bounces-11383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6988C335C
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2024 21:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82C6A1F219F7
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2024 19:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA201CD39;
	Sat, 11 May 2024 19:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ftJpnVCV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4C428E8;
	Sat, 11 May 2024 19:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715454577; cv=none; b=lHYy60EmgLTemc3VXkZMeaMtz5z/A7Nb2wFTRJVX/DvxLRrAYBJetIT06JTBNrzT47737BJ0wqI6Jy9ODYJFhPOl1eAm96m/qyUeCEUUERueS6wlfuyLwSWcopepkV3HU7ntpDrJhFFGQYVbYLn2Lav+/6xnJDmXXrO6iY/S0LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715454577; c=relaxed/simple;
	bh=O5knfMimufzf45RWMUVmIYUOJjDJ+9Mmy+EmmGf9XEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cL+bN2G88iHBv+tnf2tL9fsrIZReeSYShk/efQqSEoi2qvx5S2nEo2WiNuG9AirxjUzHqMF5vNMSziG3u99/RTymUs9+eMSujT11OM4kidM1YO4IqxbWDDaBQPYYToT7gbx6k0z21QRgI8KDYH4QJsv760UhgAYsgadvCrxlvsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ftJpnVCV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA09A114D;
	Sat, 11 May 2024 21:09:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715454562;
	bh=O5knfMimufzf45RWMUVmIYUOJjDJ+9Mmy+EmmGf9XEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ftJpnVCV022EtyvdyVYIFaxhhe05xfhFcY69SSZLyOOFBPCZCnAUnpDsSzCgQszxx
	 q2LhZaOHoJf8UPRedByFtj7PbQsTlHHIqBhs/JbKvcg/FnH5ViEyc9RSj5fxFrwqgj
	 CmIwkY0hQRr00ZUJ09aeVHl5jWxyOzBP09JGyMIQ=
Date: Sat, 11 May 2024 22:09:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: hi846: Fix V4L2_SUBDEV_FORMAT_TRY
 get_selection()
Message-ID: <20240511190919.GD17158@pendragon.ideasonboard.com>
References: <20240509-fix-hi846-v1-1-1e19dc517be1@chromium.org>
 <20240509193900.GA32013@pendragon.ideasonboard.com>
 <CANiDSCsv8S68x7z+aV1PhbZ+5Ktr=86nYUXaNpb1w4q4y1v38Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsv8S68x7z+aV1PhbZ+5Ktr=86nYUXaNpb1w4q4y1v38Q@mail.gmail.com>

Hi Ricardo,

On Sat, May 11, 2024 at 09:47:47AM +0200, Ricardo Ribalda wrote:
> On Thu, 9 May 2024 at 21:39, Laurent Pinchart wrote:
> > On Thu, May 09, 2024 at 05:05:55PM +0000, Ricardo Ribalda wrote:
> > > The current code does not return anything to the user.
> > >
> > > Although the code looks a bit dangerous (using a pointer without
> > > checking if it is valid), it should be fine. The code validates that
> >
> > I think you meant s/code/core/
> 
> Yes, sorry, fatty fingers :)
> 
> If you are planning to send a v5 of this
> https://patchwork.linuxtv.org/project/linux-media/patch/20240508214045.24716-4-laurent.pinchart+renesas@ideasonboard.com/
> 
> Maybe you could include this patch there?

Yes, I've already taken the patch in my tree. If Hans merges it to the
stage tree I'll drop it, otherwise I'll include it in the pull request
to avoid breaking CI.

> I found the issue when the CI tested your series (eventhough it is not
> caused by your series)
> 
> > > sel->pad has a valid value.
> > >
> > > Fix the following smatch error:
> > > drivers/media/i2c/hi846.c:1854 hi846_get_selection() warn: statement has no effect 31
> > >
> > > Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > > ---
> > > While running media-ci on the last patches there was a new sparse
> > > warning:
> > > https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/58524338/artifacts/external_file/junit/test-smatch.log.txt
> > > ---
> > >  drivers/media/i2c/hi846.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> > > index 9c565ec033d4..52d9ca68a86c 100644
> > > --- a/drivers/media/i2c/hi846.c
> > > +++ b/drivers/media/i2c/hi846.c
> > > @@ -1851,7 +1851,7 @@ static int hi846_get_selection(struct v4l2_subdev *sd,
> > >               mutex_lock(&hi846->mutex);
> > >               switch (sel->which) {
> > >               case V4L2_SUBDEV_FORMAT_TRY:
> > > -                     v4l2_subdev_state_get_crop(sd_state, sel->pad);
> > > +                     sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
> > >                       break;
> > >               case V4L2_SUBDEV_FORMAT_ACTIVE:
> > >                       sel->r = hi846->cur_mode->crop;
> > >
> > > ---
> > > base-commit: 48259b90973718d2277db27b5e510f0fe957eaa0
> > > change-id: 20240509-fix-hi846-c3d77768622e

-- 
Regards,

Laurent Pinchart

