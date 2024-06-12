Return-Path: <linux-media+bounces-12997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28665904D11
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 09:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7F85B25533
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 07:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C07B16C843;
	Wed, 12 Jun 2024 07:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f3WjcOL7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CC716C685;
	Wed, 12 Jun 2024 07:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718178247; cv=none; b=gY4WEoM0CJ0qumgEd+tYsgzJfAc9YIxk0MGa/4fMIB9hoot2fHKUEe2k67ejU2PARer55Q+h4kZBilrb9iLjiuBxVFzN8crzGhtAah6N4nn7S54HVBwuRn7Lr/lMZhaPkiUb+S+1WSUUe+RCuERCweWVagktL3zEIbq+PKsafZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718178247; c=relaxed/simple;
	bh=ySaU8p04x5+FtLkadYh8dpkc0ORMCbVpWxrM8Sm7l1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+8q3zjtocQnw22m74NK2mEZkyhRB1blzat8FrS1tDHq5aqLRh5GKbWY2f03jOk94YJ8joWttdpzNkxxj8aNA5dBrKXrmIMQFv/ZaAlxqjKpQOpMCfOVZshHFVi1G/Ez5wTEXem2CGkHUmEBmbYzXP+N4OvmEqLElffmplI4kVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f3WjcOL7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C10A4D0;
	Wed, 12 Jun 2024 09:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718178230;
	bh=ySaU8p04x5+FtLkadYh8dpkc0ORMCbVpWxrM8Sm7l1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3WjcOL7saW7LFZlcDgPeEAGqmXgNxMkpPXhEiZrjZ7QaipAhdFyfxGH5oogCMbbd
	 +sFDtKke59lA3nQYYtGewTwABn/B/w0YDHNburz7YIMzK5IOSr5CBOd/JbfOQT3I4b
	 ptokX7vpmhmmmw7qEBKEdcQ7QY/totbzYCqiBgmw=
Date: Wed, 12 Jun 2024 10:43:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	"hn.chen" <hn.chen@sunplusit.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v10 4/6] media: uvcvideo: Allow hw clock updates with
 buffers not full
Message-ID: <20240612074342.GA28989@pendragon.ideasonboard.com>
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
 <20240323-resend-hwtimestamp-v10-4-b08e590d97c7@chromium.org>
 <4kck7oedsnj6kfiv7ykwsjg35qodg5bdktu5t5w3xtg2xuscto@2yh6kfdqwimc>
 <20240610114306.GR18479@pendragon.ideasonboard.com>
 <CAAFQd5DAXq6fTrp6jF42URrwzwE+tGz_jJCRM2bhieD76u+QpA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5DAXq6fTrp6jF42URrwzwE+tGz_jJCRM2bhieD76u+QpA@mail.gmail.com>

On Wed, Jun 12, 2024 at 12:28:56PM +0900, Tomasz Figa wrote:
> On Mon, Jun 10, 2024 at 8:43 PM Laurent Pinchart wrote:
> > On Wed, May 29, 2024 at 05:03:08PM +0900, Tomasz Figa wrote:
> > > On Sat, Mar 23, 2024 at 10:48:05AM +0000, Ricardo Ribalda wrote:
> > > > With UVC 1.5 we get as little as one clock sample per frame. Which means
> > > > that it takes 32 frames to move from the software timestamp to the
> > > > hardware timestamp method.
> > > >
> > > > This results in abrupt changes in the timestamping after 32 frames (~1
> > > > second), resulting in noticeable artifacts when used for encoding.
> > > >
> > > > With this patch we modify the update algorithm to work with whatever
> > > > amount of values are available.
> > > >
> > > > Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> > > > Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_video.c | 16 ++++++++++++++--
> > > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > > index d6ca383f643e3..af25b9f1b53fe 100644
> > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > @@ -768,10 +768,10 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
> > > >
> > > >     spin_lock_irqsave(&clock->lock, flags);
> > > >
> > > > -   if (clock->count < clock->size)
> > > > +   if (clock->count < 2)
> > > >             goto done;
> > > >
> > > > -   first = &clock->samples[clock->head];
> > > > +   first = &clock->samples[(clock->head - clock->count + clock->size) % clock->size];
> > > >     last = &clock->samples[(clock->head - 1 + clock->size) % clock->size];
> > > >
> > > >     /* First step, PTS to SOF conversion. */
> > > > @@ -786,6 +786,18 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
> > > >     if (y2 < y1)
> > > >             y2 += 2048 << 16;
> > > >
> > > > +   /*
> > > > +    * Have at least 1/4 of a second of timestamps before we
> > > > +    * try to do any calculation. Otherwise we do not have enough
> > > > +    * precision. This value was determined by running Android CTS
> > > > +    * on different devices.
> > > > +    *
> > > > +    * dev_sof runs at 1KHz, and we have a fixed point precision of
> > > > +    * 16 bits.
> > > > +    */
> > > > +   if ((y2 - y1) < ((1000 / 4) << 16))
> > > > +           goto done;
> > >
> > > Not a comment for this patch directly, but...
> > >
> > > This kind of makes me wonder if we don't want to have some documentation
> > > that specifies what the userspace can expect from the timestamps, so
> > > that this isn't changed randomly in the future breaking what was fixed
> > > by this patch.
> >
> > I think timestamp handling should really be moved to userspace. It will
> > be easier to handle with floating-point arithmetic there. That would
> > have been difficult to manage for applications a while ago, but now that
> > we have libcamera, we could implement it there. This isn't high on my
> > todo list though.
> 
> While indeed that would probably be a better way to handle the complex
> logic if we designed the driver today, we already have userspace that
> expects the timestamps to be handled correctly in the kernel. I
> suspect moving it to the userspace would require some core V4L2
> changes to define a new timestamp handling mode, where multiple raw
> hardware timestamps are exposed to the userspace, instead of the high
> level system monotonic one.

The uvcvideo driver already supports exposing the packet headers to
userspace through a metadata capture device, so I think we have all the
components we need. The only missing thing would be the implementation
in libcamera :-)

-- 
Regards,

Laurent Pinchart

