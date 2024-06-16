Return-Path: <linux-media+bounces-13354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE91890A0DD
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08B42B20FF1
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D27873466;
	Sun, 16 Jun 2024 23:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M6hVrubX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C3B225D6;
	Sun, 16 Jun 2024 23:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718581657; cv=none; b=YPS0bqP8H+YXxhwRC3rNvLhBz2AgBnSEnLtpEnDsfnv+Tui7engyZznOGfqlxNKje8yTifeNcfh4OAzhJ4e9v5Xv/7VgVncDXtStMuirsqC28uonspnBVuAWjENOPBZqmsXZ2z1uoklOdBuh4k/4wLGcFKayIFpfiUVfhdGTI0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718581657; c=relaxed/simple;
	bh=3Z70xRstFnXx2pEIuXrZeSAWUg8S5J47l+rUhS4+S0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPhditvOrEjAwj7CYR3dpeXiuXSowkV/IFvLsk+SNQzdjEI0NeNCOE8ZwK/rvO/NHDLUOXzogxXSsI/S8Xvqm7+seqK7yrjUEL4QSveV0dvoBuwNsuIcyEn4vfAWDRwABuXLtGSGqt+Nk3BLti2tBH2g8GMOo6ZbtYCfO771ysY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M6hVrubX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C1262D5;
	Mon, 17 Jun 2024 01:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718581638;
	bh=3Z70xRstFnXx2pEIuXrZeSAWUg8S5J47l+rUhS4+S0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M6hVrubXswjSrW5pHcZ9AKFmRiJkKJ5WOGZ/7h/64uZR+nYp7eyU/649ZqHxrdyhx
	 rXZTi+VjnHwrYvZw2XRcMz5jzmroBLyHHq67JQGiMFjTiElZhsNdsmHcFcSXNXLpXq
	 CPZR36nsKVnlwPSuLlP5//hsLv5GfMUiA5d2p3Uo=
Date: Mon, 17 Jun 2024 02:47:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v3] uvc_video: move clock_decode and stats_decode to the
 end of decode_start
Message-ID: <20240616234712.GL4782@pendragon.ideasonboard.com>
References: <20240221-uvc-host-video-decode-start-v3-1-40e9b9ced97b@pengutronix.de>
 <CANiDSCv13TmKFNKP6khYh7cCv=mOrhVKGJ79H9knYuB6iJKqDA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCv13TmKFNKP6khYh7cCv=mOrhVKGJ79H9knYuB6iJKqDA@mail.gmail.com>

On Mon, Mar 18, 2024 at 10:43:16AM +0100, Ricardo Ribalda wrote:
> On Mon, 18 Mar 2024 at 10:28, Michael Grzeschik wrote:
> >
> > When the uvc request will get parsed by uvc_video_decode_start it will
> > leave the function with -EAGAIN to be restarted on the next frame. While
> > the first wrong parse the statistics will already be updated with
> > uvc_video_stats_decode.
> >
> > One value e.g. is the error_count, which therefor will be incremented
> > twice in case the fid has changed on the way. This patch fixes the
> > unnecessary extra parsing by moving the decode functions to the
> > end of decode_start, when it is save to really parse the data.
>
> nit: safe
>
> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>
> > ---
> > Changes in v3:
> > - Moved the clock_decode and stat_decode to end of function as suggested by Ricardo Ribalda
> > - Link to v2: https://lore.kernel.org/r/20240221-uvc-host-video-decode-start-v2-1-88c6e17e487a@pengutronix.de
> >
> > Changes in v2:
> > - Moved the EAGAIN bailout after the sequence handling as mentioned by Ricardo Ribalda
> > - Link to v1: https://lore.kernel.org/r/20240221-uvc-host-video-decode-start-v1-1-228995925c70@pengutronix.de
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 7cbf4692bd875..7471bff0ca894 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1078,9 +1078,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >                         uvc_video_stats_update(stream);
> >         }
> >
> > -       uvc_video_clock_decode(stream, buf, data, len);
> > -       uvc_video_stats_decode(stream, data, len);
> > -
> >         /*
> >          * Store the payload FID bit and return immediately when the buffer is
> >          * NULL.
> > @@ -1147,6 +1144,9 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >                 return -EAGAIN;
> >         }
> >
> > +       uvc_video_clock_decode(stream, buf, data, len);
> > +       uvc_video_stats_decode(stream, data, len);

uvc_video_stats_decode() needs to be called before
uvc_video_stats_update(), so I don't think this is right.

> > +
> >         stream->last_fid = fid;
> >
> >         return data[0];
> >
> > ---
> > base-commit: d99e42ce6b8341d3f09e22c6706461ec900fe172
> > change-id: 20240221-uvc-host-video-decode-start-af53df5924cd

-- 
Regards,

Laurent Pinchart

