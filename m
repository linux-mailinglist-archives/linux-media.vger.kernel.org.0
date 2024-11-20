Return-Path: <linux-media+bounces-21640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE8A9D3CF2
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C7D028377D
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7FB1B5ED4;
	Wed, 20 Nov 2024 13:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cK7c3Nlj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7194D157476;
	Wed, 20 Nov 2024 13:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732111174; cv=none; b=tGQbizKq/tI52m3xVr4mwd8UI5hBSQeCeaqhtZaVisLd1GBcInFQ5tywmNJcHIR5TqsQxHWe6CKicjSYpVj0yOLqr1fBYcni3k3XroOvVDptatzFgCPvW7iMUQFPwi+w1RZsL2gPfwu/gFRFXKVvZgcSrcrKukp6K58a1WTFps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732111174; c=relaxed/simple;
	bh=IkKedPkTMtnh++ircV0h5KPigzahuRt93ypyeH827Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXtc6YQwHYxBbdpnbDpLjQYVG2xn9ghd+fK7To6V72xdeZTjZp7l+cNiDeHHnZAPcQCc9c0F0azMKrWb6Ls/B93KWHr79i8b8pDZkfKHKtB7eNE/6weBCrrcHYvuhZDnsLEJV6tTHBov8FrNWntm4ZX5LE1LPFpamat9OtuGuok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cK7c3Nlj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBDF5675;
	Wed, 20 Nov 2024 14:59:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732111147;
	bh=IkKedPkTMtnh++ircV0h5KPigzahuRt93ypyeH827Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cK7c3Nlj8wSslHcGGf0aLLTjrBZf/Ybb05yeNV3yUtLVYUywh7inYvIZDoOLjLEty
	 Ca6/Hilh6bug/wtU+hzUYEKuYXJCpPkaywFkBWtQ0E5huJMb3yGu+CDeKlRAnkuPrl
	 c1Fh6MLVqawFD2YJ/npTKfrSLe8UezWCFKDjs53g=
Date: Wed, 20 Nov 2024 15:59:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: uvcvideo: Support partial control reads
Message-ID: <20241120135915.GV12409@pendragon.ideasonboard.com>
References: <20241008-uvc-readless-v2-0-04d9d51aee56@chromium.org>
 <20241008-uvc-readless-v2-1-04d9d51aee56@chromium.org>
 <5a5de76c-31a4-47af-bd31-b3a09b411663@redhat.com>
 <CANiDSCtXfdCT=-56m9crxW6hmVjuqBKvRE3NRQBf7nftW=OpNg@mail.gmail.com>
 <845fd4ee-dcf7-4657-beb6-6936d5ef04cc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <845fd4ee-dcf7-4657-beb6-6936d5ef04cc@redhat.com>

On Wed, Nov 20, 2024 at 11:50:15AM +0100, Hans de Goede wrote:
> On 18-Nov-24 5:57 PM, Ricardo Ribalda wrote:
> > On Mon, 18 Nov 2024 at 17:41, Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 8-Oct-24 5:00 PM, Ricardo Ribalda wrote:
> >>> Some cameras, like the ELMO MX-P3, do not return all the bytes
> >>> requested from a control if it can fit in less bytes.
> >>> Eg: Returning 0xab instead of 0x00ab.
> >>> usb 3-9: Failed to query (GET_DEF) UVC control 3 on unit 2: 1 (exp. 2).
> >>>
> >>> Extend the returned value from the camera and return it.
> >>>
> >>> Cc: stable@vger.kernel.org
> >>> Fixes: a763b9fb58be ("media: uvcvideo: Do not return positive errors in uvc_query_ctrl()")
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> ---
> >>>  drivers/media/usb/uvc/uvc_video.c | 19 +++++++++++++++++--
> >>>  1 file changed, 17 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> >>> index cd9c29532fb0..f125b3ba50f2 100644
> >>> --- a/drivers/media/usb/uvc/uvc_video.c
> >>> +++ b/drivers/media/usb/uvc/uvc_video.c
> >>> @@ -76,14 +76,29 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> >>>
> >>>       ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> >>>                               UVC_CTRL_CONTROL_TIMEOUT);
> >>> -     if (likely(ret == size))
> >>> +     if (ret > 0) {
> >>> +             if (size == ret)
> >>> +                     return 0;
> >>> +
> >>> +             /*
> >>> +              * In UVC the data is represented in little-endian by default.
> >>> +              * Some devices return shorter control packages that expected
> >>> +              * for GET_DEF/MAX/MIN if the return value can fit in less
> >>> +              * bytes.
> >>
> >> What about GET_CUR/GET_RES ? are those not affected?
> >>
> >> And if it is not affected should we limit this special handling to
> >> GET_DEF/MAX/MIN ?
> > 
> > I have only seen it with GET_DEF, but I would not be surprised if it
> > happens for all of them.
> > 
> > before:
> > a763b9fb58be ("media: uvcvideo: Do not return positive errors in
> > uvc_query_ctrl()")
> > We were applying the quirk to all the call types, so I'd rather keep
> > the old behaviour.
> > 
> > The extra logging will help us find bugs (if any).
> > 
> > Let me fix the doc.
> > 
> >>> +              * Zero all the bytes that the device have not written.
> >>> +              */
> >>> +             memset(data + ret, 0, size - ret);
> >>
> >> So your new work around automatically applies to all UVC devices which
> >> gives us a short return. I think that is both good and bad at the same
> >> time. Good because it avoids the need to add quirks. Bad because what
> >> if we get a short return for another reason.
> >>
> >> You do warn on the short return. So if we get bugs due to hitting the short
> >> return for another reason the warning will be i the logs.
> >>
> >> So all in all think the good outways the bad.
> >>
> >> So yes this seems like a good solution.
> >>
> >>> +             dev_warn(&dev->udev->dev,
> >>> +                      "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
> >>> +                      uvc_query_name(query), cs, unit, ret, size);
> >>
> >> I do wonder if we need to use dev_warn_ratelimited()
> >> or dev_warn_once() here though.
> >>
> >> If this only impacts GET_DEF/MAX/MIN we will only hit this
> >> once per ctrl, after which the cache will be populated.
> >>
> >> But if GET_CUR is also affected then userspace can trigger
> >> this warning. So in that case I think we really should use
> >> dev_warn_once() or have a flag per ctrl to track this
> >> and only warn once per ctrl if we want to know which
> >> ctrls exactly are buggy.

Rate-limiting won't help much, as I don't expect userspace to trigger
this at high frequency. dev_warn_once() is the simplest option. I'm a
bit concerned that we silently apply the workaround after the first
occurrence, it may lead to difficult to diagnose issues in bug reports.
A flag per control would be nice, but it's probably overkill :-/ Or
maybe it wouldn't be that hard to implement ?

> > Let me use dev_warn_once()
> 
> Great, thank you.
> 
> Re-reading this I think what would be best here is to combine
> dev_warn_once() with a dev_dbg logging the same thing.

That could be useful, but I don't expect most users would be able to
enable dev_dbg(), so it would be of limited value in bug reports.

> This way if we want the more fine grained messages for all
> controls / all of GET_* and not just the first call we can
> still get them by enabling the debug messages with dyndbg.
> 
> This combination is used for similar reasons in other places
> of the kernel.
> 
> Not sure what Laurent thinks of this though, Laurent ?
> 
> I wonder if we need some sort of helper for this:
> 
> dev_warn_once_and_debug(...(

That's an interesting concept :-)

> >> What we really do not want is userspace repeatedly calling
> >> VIDIOC_G_CTRL / VIDIOC_G_EXT_CTRLS resulting in a message
> >> in dmesg every call.
> >>
> >>>               return 0;
> >>> +     }
> >>>
> >>>       if (ret != -EPIPE) {
> >>>               dev_err(&dev->udev->dev,
> >>>                       "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
> >>>                       uvc_query_name(query), cs, unit, ret, size);
> >>> -             return ret < 0 ? ret : -EPIPE;
> >>> +             return ret ? ret : -EPIPE;
> >>
> >> It took me a minute to wrap my brain around this and even
> >> though I now understand this change I do not like it.
> >>
> >> There is no need to optimize an error-handling path like this
> >> and IMHO the original code is much easier to read:
> >>
> >>                 return ret < 0 ? ret : -ESOMETHING;
> >>
> >> is a well known pattern to check results from functions which
> >> return a negative errno, or the amount of bytes read, combined
> >> with an earlier success check for ret == amount-expected .
> >>
> >> By changing this to:
> >>
> >>                 return ret ? ret : -EPIPE;
> >>
> >> You are breaking the pattern recognition people familiar with
> >> this kinda code have and IMHO this is not necessary.
> >>
> >> Also not changing this reduces the patch-size / avoids code-churn
> >> which also is a good thing.
> >>
> >> Please drop this part of the patch.
> >
> > ack

-- 
Regards,

Laurent Pinchart

