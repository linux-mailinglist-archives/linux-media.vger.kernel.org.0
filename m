Return-Path: <linux-media+bounces-19270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 995B79952EA
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 17:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B025B25E8D
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 14:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE3E1DFE3F;
	Tue,  8 Oct 2024 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="WbRsFP9I"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B7F18CBED;
	Tue,  8 Oct 2024 14:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728399227; cv=fail; b=ZfxMk2y5iphpZO1jtg7TfpqBljCnjl3CRPW3ciarwKEplY4C0XUScOuOZx8Bv1hHf3ix6stDF9cd9pWAz37G3W2jrObySUi6kMErSxjq6St0ZzoZ1J/LQq9Y6wRGI6ASljS1kGI40/0gxnwKIkRU5nIeiMqAwSxkmhPotFsXfW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728399227; c=relaxed/simple;
	bh=uwrEVu2YVzECSuFLuirw0Zmoo2dueTCA+JkY9BBSBRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEar7YVjiilLP2p5gljrFMYrP/qZ8rFFC1tFqfAlYifw9/QRX/K8ACQ2OG5jAPONi8+i1fstS5TejmD7/S8sjpzC0WEpX9mLBspuImmBk4ouZwZbvfpAo/DdVVtJm245ws6G1H+VUAIzywt/KB7RzTdj7jADvuAn1Zvvtg+Q5rE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=WbRsFP9I; arc=fail smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4XNJtZ0VxxzyRx;
	Tue,  8 Oct 2024 17:53:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1728399222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j0JeZSJN2mKse0mj9LusjqSsyrt5dT1wFsgs0GhF+P4=;
	b=WbRsFP9I7M56/s2LP20z/4ADTAflGaI5MBHHG6+YT4Vcl7gNimo84XtE2u+SHAjSwdXbkZ
	aZfNYNOgrx7KGNlX6Sfsv8xbL6ExQD7ESwrBmY9eRBvA7KgMZuMgSgIC19RXtaO8RvSc86
	Ol0bjKI++j3/UHE8BwGWfwQVVdPrK7k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1728399222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j0JeZSJN2mKse0mj9LusjqSsyrt5dT1wFsgs0GhF+P4=;
	b=MrD3ltbDNoH+QsQiof4UK/e39OmMCj8C53OJTAkp8aVth3evgITeur23h97hn2Vdk6EsaQ
	SKGD5ymCC3qtFpIjoLsR2OBnnRUk73PxE1AjiLE07zV57U0hxRpRN5cghnrMNzQH1c3SFu
	Mnp8f4N9Zk/Wi9lrOACffqSQJjGFeNI=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1728399222; a=rsa-sha256; cv=none;
	b=zJvpwm8JmciAh9f9StnqMWFvneUv9UnvRFh6Zhpa3ymZuoEFWi1fimk9v9vR91V0Orhw7p
	uYjwlzeIOGGwNL2G6bg3ekmL6/P+KUN5t8sHQhwTwSYhg0Y6Hv8y/gXJHwSceazmTRN+xf
	rZz9uQjCCxsjHzYshI5tkkATueoHxMU=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6D608634CA9;
	Tue,  8 Oct 2024 17:53:40 +0300 (EEST)
Date: Tue, 8 Oct 2024 14:53:40 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: uvcvideo: Refactor uvc_query_ctrl
Message-ID: <ZwVHdMY2H3ip4f0i@valkosipuli.retiisi.eu>
References: <20241008-uvc-readless-v1-0-042ac4581f44@chromium.org>
 <20241008-uvc-readless-v1-2-042ac4581f44@chromium.org>
 <ZwUfD5Kfzv93-46f@valkosipuli.retiisi.eu>
 <CANiDSCu5ho_CFCgRQVdUzaWtfSi_eNk+N7c-DGxcO+6Ks_Vmvg@mail.gmail.com>
 <ZwU0JyfBPRpkINCu@valkosipuli.retiisi.eu>
 <CANiDSCs_VXgJ5pV7r_NFTbPfoOfvMGEq_X2woA0GgSx8=8nUeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCs_VXgJ5pV7r_NFTbPfoOfvMGEq_X2woA0GgSx8=8nUeA@mail.gmail.com>

Hi Ricardo,

On Tue, Oct 08, 2024 at 09:38:58PM +0800, Ricardo Ribalda wrote:
> On Tue, 8 Oct 2024 at 21:31, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > Hi Ricardo,
> >
> > On Tue, Oct 08, 2024 at 09:22:25PM +0800, Ricardo Ribalda wrote:
> > > Hi Sakari!
> > >
> > > On Tue, 8 Oct 2024 at 20:01, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > > >
> > > > Hi Ricardo,
> > > >
> > > > On Tue, Oct 08, 2024 at 07:06:15AM +0000, Ricardo Ribalda wrote:
> > > > > Move the query control error logic to its own function.
> > > > > There is no functional change introduced by this patch.
> > > > >
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > ---
> > > > >  drivers/media/usb/uvc/uvc_video.c | 45 ++++++++++++++++++++++-----------------
> > > > >  1 file changed, 26 insertions(+), 19 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > > > index 853dfb7b5f7b..a57272a2c9e1 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > > @@ -67,30 +67,12 @@ static const char *uvc_query_name(u8 query)
> > > > >       }
> > > > >  }
> > > > >
> > > > > -int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > > > > -                     u8 intfnum, u8 cs, void *data, u16 size)
> > > > > +static int uvc_query_ctrl_error(struct uvc_device *dev, u8 intfnum, void *data)
> > > > >  {
> > > > >       int ret;
> > > > >       u8 error;
> > > > >       u8 tmp;
> > > > >
> > > > > -     ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> > > > > -                             UVC_CTRL_CONTROL_TIMEOUT);
> > > > > -     if (likely(ret == size))
> > > > > -             return 0;
> > > > > -
> > > > > -     if (ret > 0 && ret < size) {
> > > > > -             memset(data + ret, 0, size - ret);
> > > > > -             return 0;
> > > > > -     }
> > > > > -
> > > > > -     if (ret != -EPIPE) {
> > > > > -             dev_err(&dev->udev->dev,
> > > > > -                     "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> > > > > -                     uvc_query_name(query), cs, unit, ret, size);
> > > > > -             return ret ? ret : -EPIPE;
> > > > > -     }
> > > > > -
> > > > >       /* Reuse data[0] to request the error code. */
> > > > >       tmp = *(u8 *)data;
> > > > >
> > > > > @@ -135,6 +117,31 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > > > >       return -EPIPE;
> > > > >  }
> > > > >
> > > > > +int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > > > > +                u8 intfnum, u8 cs, void *data, u16 size)
> > > > > +{
> > > > > +     int ret;
> > > > > +
> > > > > +     ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> > > > > +                            UVC_CTRL_CONTROL_TIMEOUT);
> > > > > +     if (likely(ret == size))
> > > > > +             return 0;
> > > > > +
> > > > > +     if (ret == -EPIPE)
> > > > > +             return uvc_query_ctrl_error(dev, intfnum, data);
> > > > > +
> > > > > +     dev_err(&dev->udev->dev,
> > > > > +             "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> > > > > +             uvc_query_name(query), cs, unit, ret, size);
> > > >
> > > > This message should probably be printed after the check below.
> > >
> > > If the device is returning less bytes, the hardware is not behaving
> > > according to spec and it is good information, specially if you are
> > > bringing up a new device.
> > > I could make it  a dev_warn() (or even uvc_debug) if ret <size. WDYT?
> >
> > What I also came to think whether this is worth an explicit quirk flag.
> > There could well be devices that have other bugs that would still fall
> > under the same check.
> 
> Before https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/media/usb/uvc/uvc_video.c?id=a763b9fb58be869e252a7d33acb0a6390b01c801
> we were accepting short reads and showing the error.
> We are returning to the old behaviour, plus the memset.
> 
> A quirk will be difficult to maintain. If we can find a heuristics
> that works I would vote for that.

Seems reasonable.

> 
> 
> >
> > Either way, there should not be a message every single time this workaround
> > is applied. Isn't uvc_query_ctrl() also used in some IOCTLs outside probe?
> 
> I have only seen this behaviour for GET_DEF, and that value is cached.
> Meaning that the warning will only be shown once per control.

Could you add a comment with this information, also mentioning where this
has been noticed?

Perhaps we should wait for Laurent's comments still.

-- 
Kind regards,

Sakari Ailus

