Return-Path: <linux-media+bounces-7613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E7488695D
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 10:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ED811F213D1
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 09:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE99210EE;
	Fri, 22 Mar 2024 09:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lKxBDPt0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DB520DC5;
	Fri, 22 Mar 2024 09:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711100164; cv=none; b=U/rTkZTwMYMtJTQLjI8Y5FsWdO5oioNZuqnAMHXP6RSFY/x+Zu4fPX9pE9A09Y9IxUpI9gcXHoUn2Hg1hlsnbtvX5pUE44kD6OiCIwYpZ1himiW0ViTFx1rYE5YPxUO2APOyuiUJa/Q95iCUOiA7RDLbQY1uF9+5787GpKcNJA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711100164; c=relaxed/simple;
	bh=Ufp0zrM0qX+RX8b3KATGeapavTnxHX5+0luVxD6E1dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lpi8oJAdedHCTsMsIBgWRgR2I3NE25ngOc2+RbfDxD0Le2bJ9f5Oqfrhmc1Ge4C9BzV4HuyxdOZOOtOeG39LY/1AzXOT2uAISySk98nljdYSeBjhWpPALp001qFkYY9SJ8wCX8CFUs9rDHVdHkFSctHCaC5bbpzquDW8IYnaj+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lKxBDPt0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBD2182A;
	Fri, 22 Mar 2024 10:35:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711100133;
	bh=Ufp0zrM0qX+RX8b3KATGeapavTnxHX5+0luVxD6E1dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKxBDPt0nXfjWRLKBMgrAE+TdMkw/GEgLZSTGHHSkhyeknBQAfhJbwjOe+cs6TgUM
	 E2UJINzffH9RPi3QC/jqHjlcS8bB+aHPs2Qy520vAg6lIaBqd9fE5NJpg3HOXPohW7
	 IqI+9UjInALb4J/UK3068MyG8X4wYdIu34LGbwCY=
Date: Fri, 22 Mar 2024 11:35:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v9 1/6] media: uvcvideo: Fix negative modulus calculation
Message-ID: <20240322093557.GO18799@pendragon.ideasonboard.com>
References: <20220920-resend-hwtimestamp-v9-0-55a89f46f6be@chromium.org>
 <20220920-resend-hwtimestamp-v9-1-55a89f46f6be@chromium.org>
 <20240212225940.GA19316@pendragon.ideasonboard.com>
 <CANiDSCuoskaERyyzuLen+ReGHBNnOrFducbWYAvFQ6HfbUCPcg@mail.gmail.com>
 <20240219104046.GB13043@pendragon.ideasonboard.com>
 <CANiDSCsqYHModDZCi2hooDYsFgu+bN_OioBGEJQJuZgdiJO=ug@mail.gmail.com>
 <20240321215047.GA20938@pendragon.ideasonboard.com>
 <20240322091948.GA10059@pendragon.ideasonboard.com>
 <CANiDSCuxytDTC73Ni51h9v7yCZ46D5489fvt0Hy0ugcm=jcKRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuxytDTC73Ni51h9v7yCZ46D5489fvt0Hy0ugcm=jcKRQ@mail.gmail.com>

On Fri, Mar 22, 2024 at 10:29:03AM +0100, Ricardo Ribalda wrote:
> On Fri, 22 Mar 2024 at 10:19, Laurent Pinchart wrote:
> > On Thu, Mar 21, 2024 at 11:50:48PM +0200, Laurent Pinchart wrote:
> > > On Mon, Feb 19, 2024 at 04:07:12PM +0100, Ricardo Ribalda wrote:
> > > > On Mon, 19 Feb 2024 at 11:40, Laurent Pinchart wrote:
> > > > > On Mon, Feb 19, 2024 at 11:28:03AM +0100, Ricardo Ribalda wrote:
> > > > > > On Mon, 12 Feb 2024 at 23:59, Laurent Pinchart wrote:
> > > > > > > On Wed, Mar 15, 2023 at 02:30:12PM +0100, Ricardo Ribalda wrote:
> > > > > > > > If head is 0, last will be addressing the index 0 instead of clock->size
> > > > > > > > -1. Luckily clock->head is unsiged, otherwise it would be addressing
> > > > > > > > 0xffffffff.
> > > > > > >
> > > > > > > I'm not following you. In the expression
> > > > > > >
> > > > > > >         (clock->head - 1) % clock->size
> > > > > > >
> > > > > > > clock->head is an unsigned int, and 1 as a signed int, so the result of
> > > > > > > the subtraction is promoted to an unsigned int. When clock->head is 0, the expression evaluates to
> > > > > > >
> > > > > > >         0xffffffff % clock->size
> > > > > > >
> > > > > > > clock->size is a power of two (hardcoded to 32 at the moment), so the
> > > > > > > expression evaluates to 31, as intended.
> > > > > > >
> > > > > > > Am I missing something ?
> > > > > >
> > > > > > Take a look to: https://godbolt.org/z/xYeqTx6ba
> > > > > >
> > > > > > The expression only works because the size is a power of two. In this
> > > > > > set I am allowing sizes that are not powers of two.
> > > > >
> > > > > Could you then update the commit message to explain that ?
> > > > >
> > > > > I'll review the rest of the series this week.
> > > > Thanks
> > > >
> > > > Will update with the following text after the review:
> > > >
> > > > The tail of the list lives at the position before the head. This is
> > > > mathematically noted as
> > > > ```
> > > > (head-1)  mod size.
> > > > ```
> > > >
> > > > Unfortunately C, does not have a modulus operator, but a remainder
> > > > operator (%).
> > > > The reminder operation has a different result than the modulus if
> > > > (head -1) is a negative number and size is not a power of two.
> > > >
> > > > Adding size to (head-1) allows the code to run with any value of size.
> > >
> > > Could you please add
> > >
> > > This does not change the current behaviour of the driver, as the size is
> > > always a power of two, but prepares for reworks that will change the
> > > size to a non power of two.
> > >
> > > or something similar ?
> > >
> > > > > > > > Nontheless, this is not the intented behaviour and should be fixed.
> > > > > > > >
> > > > > > > > Fixes: 66847ef013cc ("[media] uvcvideo: Add UVC timestamps support")
> > >
> > > I think this should be dropped, the patch doesn't fix an issue, but
> > > prepares for further changes that add new features. I'd also like to
> > > update the commit message to avoid stating "Fix", to avoid this being
> > > picked for stable kernels automatically.
> >
> > After reviewing the whole series, it seems that clock->size stays at its
> > current value of 32. Do we thus need this patch ?
> 
> I remember that at some point, when I changed the size, it had been
> really painful to figure out why the code was not working.
> 
> I'd rather keep this patch with a different commit message.
> 
> """
> This does not change the current behaviour of the driver, as the size is
> always a power of two, but avoid tedious debugging if we ever change its size.
> """
> 
> WDYT?

I'm OK with that.

> > > > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > > > ---
> > > > > > > >  drivers/media/usb/uvc/uvc_video.c | 2 +-
> > > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > > > > > > index d4b023d4de7c..4ff4ab4471fe 100644
> > > > > > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > > > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > > > > > @@ -732,7 +732,7 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
> > > > > > > >               goto done;
> > > > > > > >
> > > > > > > >       first = &clock->samples[clock->head];
> > > > > > > > -     last = &clock->samples[(clock->head - 1) % clock->size];
> > > > > > > > +     last = &clock->samples[(clock->head - 1 + clock->size) % clock->size];
> > > > > > > >
> > > > > > > >       /* First step, PTS to SOF conversion. */
> > > > > > > >       delta_stc = buf->pts - (1UL << 31);

-- 
Regards,

Laurent Pinchart

