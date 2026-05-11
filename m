Return-Path: <linux-media+bounces-61174-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGdgLyRMAmpaqQEAu9opvQ
	(envelope-from <linux-media+bounces-61174-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 23:37:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 489DC5165B7
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 23:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B67D302AD26
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 21:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073E24D90CA;
	Mon, 11 May 2026 21:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lxPVL1Cz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3EF4D90C7
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 21:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535450; cv=none; b=HgcKOpWB+Dbfw5FV8L1dnSUwAOriosPVXTa2zrWj2kZx0O/SPBsLAKd6hxLkWGVX4g81x4FkOY7lNMObInN5KDN1tOHjxPh+/7h5ahnMlzRxr1xxlXDPJLhdZza4x8OdUiaHjVMRhp3xS45vdBkvy13pqtOTFa3dwBheiMKtCvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535450; c=relaxed/simple;
	bh=A3MJypCEqW61QXNqmA+FMxYPBjIm/S7t+aAdvmTTzZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=niIHd+dWSevqzfSLXMwapy/qY46uJMQFRsXveBnBw0h3nGFkySHT4WB9LazAFSJAKbf/eH5Mxx1jM20bewHVpn+YYkyd5WJsH+OySK9/jrGr3PWr62nMT5sql1dWUH6kjlkxNWKoDsONAz8w8ywnn06Lc/cYutQp+I/89fnGjJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lxPVL1Cz; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67b32c695efso9388266a12.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 14:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778535446; x=1779140246; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fLoelSKoan22JmqYjfWJMk8ZdX9uFP9e2dwS6RmeLfQ=;
        b=lxPVL1CzEAmmsmZZV+CzLNQfn3pE79l+DBGPxriqAr4K8p2O5MJPIRj/5ouZ2uOOJf
         p34I3ZrZVzGAbuMPqhzRE63RHgrQbB7s2IrL9IDOJdn5KMUsVkjxN9BDKUea9rgGynko
         lX61AYlZ5S7SxkBxN7sRJ7qnwL01U4mnVJyn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778535446; x=1779140246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLoelSKoan22JmqYjfWJMk8ZdX9uFP9e2dwS6RmeLfQ=;
        b=pLcyuRxmckBaS03/5zu5oHshY6ZVi4mfN5KwdsOsx0AbQRdoL3CZbGzkf0LKtuKJ19
         1DHDZqmVCcy8XEKGZsC+VJOHbes37UNobBVaasmC23vVaAl8I9PuuAIhdKnV3J+5Itfx
         0oyyLbQ2hwskMYzNiRozjdHqZcVO6s9BOysOt3BUM5zNLuASPrX43YyD3dzLwy8PGRni
         RO61Pv5OTOSdww15DsLqGBXvY3IEFChKh11XHXo6lhy4UTwdw6rDwIG+Cq9xK4UkvqGY
         DeG70LHDkNXzCuTrw29DPD2OzQ1+g7aoWmN/rnih58f/pjb7XlzPzKIwYXdJ94+V6sfy
         gxYw==
X-Forwarded-Encrypted: i=1; AFNElJ/6p0QyZAd7YRe8nUzTyFFxDXfmD0qauEpUU0qKeuHI+/vRxs7vZnB8r9ntAjpkJ6d7LeovfgipsNjC6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGsSZN7PZ5s3nvTITcPdFyS8Si2MZznXV4mAOCm++vS03/2VAS
	/T4nLgiluog0UMmbxuW/0/jG66g9GCKAbCuqkEY+b1YsvZ/5CeXzUJ4wDtEDhZcNUCedVrpCveq
	tXKg=
X-Gm-Gg: Acq92OGQbe2fwxNnYEwneWLu6I1iHBGyRjWKS2H62hzKvpYxYUhx4RfsExIHXvVNLlU
	x8cx9VHgClYHuob5/wtWfzBEOhhOoVtkiMrn2kdLQpg75X+sRMDNxJ4ptA5rqO5YNoDh1Sl7umC
	MyuLYRL8OXg6L3hIou/lkGLY/WbwYxPeHT7OLTrHbk+BY2YSKtXqGSORsJOE84NX7c8OBTvLEyP
	z7JCi2T45IXnBF2YlYqXRrD3MQHfVU46Y03fRIM+ma28dR9T43eU+kknTNFg2EQi2CP8TMFjfE3
	kj/ku0zCQZVV4VqxsOKvKb9913plCp+uT1fPKZwZxNuZzWqrZyHXrm9IYBV6z6U6xyRrDhxadNu
	ENa7z7X5O5OxE6mxRU7YySF8gi9fqCpChMzh9RnesoRJKXXZlDFrU01+IdHB84e5GEzsEJPKgyQ
	cKXHJb3z0Zw96H7k/QSjvpKvAy/6L7N+Ayl/7aUEcMqJZjNsfUDIy8RmIcKTdJ
X-Received: by 2002:a17:907:198c:b0:b9c:bf69:8b54 with SMTP id a640c23a62f3a-bd23b905dfdmr75051666b.18.1778535446373;
        Mon, 11 May 2026 14:37:26 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcfebf0ab11sm209302166b.62.2026.05.11.14.37.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 14:37:26 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bcda7765d64so326545566b.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 14:37:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+FPCJG6X/uakM+W+Bxm9KhT8ReuaDej0zWSlWoAQN3WBovwZ0YAuzokFHajwGGEqaMUnss8brfd1JzTQ==@vger.kernel.org
X-Received: by 2002:a17:906:6a1c:b0:bd0:6293:bd0d with SMTP id
 a640c23a62f3a-bd23ae147d3mr75481766b.7.1778535443392; Mon, 11 May 2026
 14:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
 <20260323-uvc-hwtimestamp-v1-4-aa42e3865204@chromium.org> <10a08462-30ce-4a79-bb5d-001ab7f3d0d8@kernel.org>
 <CANiDSCs9gby6bNBCRmxT15D8c-nksdUmwH8iUDAsiV1tmQTM3Q@mail.gmail.com> <2edd1e71-d345-4c91-92f0-15d39299f0b9@kernel.org>
In-Reply-To: <2edd1e71-d345-4c91-92f0-15d39299f0b9@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 11 May 2026 23:36:57 +0200
X-Gmail-Original-Message-ID: <CANiDSCsoRP9vzKHPN3arKX1OZ-dyyTxgsfMC9Xxp8kE6+UStAQ@mail.gmail.com>
X-Gm-Features: AVHnY4KLsR7QkcvaLV23mSwAoBpguXDr49sx5Ko_0bX2dba0T-pPbP8RgjI8tuo
Message-ID: <CANiDSCsoRP9vzKHPN3arKX1OZ-dyyTxgsfMC9Xxp8kE6+UStAQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: uvcvideo: Do not add clock samples with small
 sof delta
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Yunke Cao <yunkec@google.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 489DC5165B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61174-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Hans

(Hi Laurent :P)



On Mon, 11 May 2026 at 20:33, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi,
>
> On 11-May-26 18:50, Ricardo Ribalda wrote:
> > Hi Hans
> >
> > On Mon, 11 May 2026 at 18:07, Hans de Goede <hansg@kernel.org> wrote:
> >>
> >> Hi,
> >>
> >> On 23-Mar-26 14:10, Ricardo Ribalda wrote:
> >>> Some UVC 1.1 cameras running in fast isochronous mode tend to spam the
> >>> USB host with a lot of empty packets. These packets contain clock
> >>> information and are added to the clock buffer but do not add any
> >>> accuracy to the calculation. In fact, it is quite the opposite, in our
> >>> calculations, only the first and the last timestamp is used, and we only
> >>> have 32 slots.
> >>>
> >>> Ignore the samples that will produce less than MIN_HW_TIMESTAMP_DIFF
> >>> data.
> >>>
> >>> Fixes: 141270bd95d4 ("media: uvcvideo: Refactor clock circular buffer")
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> ---
> >>>  drivers/media/usb/uvc/uvc_video.c | 18 ++++++++++++++++--
> >>>  1 file changed, 16 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> >>> index dcbc0941ffe6..e1a4e84d6841 100644
> >>> --- a/drivers/media/usb/uvc/uvc_video.c
> >>> +++ b/drivers/media/usb/uvc/uvc_video.c
> >>> @@ -544,6 +544,19 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
> >>>       spin_unlock_irqrestore(&clock->lock, flags);
> >>>  }
> >>>
> >>> +static inline u16 sof_diff(u16 a, u16 b)
> >>> +{
> >>> +     u32 aux;
> >>> +
> >>> +     a &= 2047;
> >>> +     b &= 2047;
> >>> +     if (a >= b)
> >>> +             return a - b;
> >>> +
> >>> +     aux = a + 2048;
> >>> +     return (u16)(aux - b);
> >>> +}
> >>> +
> >>>  static void
> >>>  uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
> >>>                      const u8 *data, int len)
> >>> @@ -664,12 +677,13 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
> >>>       sample.dev_sof = (sample.dev_sof + stream->clock.sof_offset) & 2047;
> >>>
> >>>       /*
> >>> -      * To limit the amount of data, drop SCRs with an SOF identical to the
> >>> +      * To limit the amount of data, drop SCRs with an SOF similar to the
> >>>        * previous one. This filtering is also needed to support UVC 1.5, where
> >>>        * all the data packets of the same frame contains the same SOF. In that
> >>>        * case only the first one will match the host_sof.
> >>>        */
> >>> -     if (sample.dev_sof == stream->clock.last_sof)
> >>> +     if (sof_diff(sample.dev_sof, stream->clock.last_sof) <=
> >>> +         (MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
> >>>               return;
> >>
> >> If I understand things correctly then uvc_video_clock_update() uses
> >> first->host_time + some correction time. But you might end up not
> >> storing a sample for the very first isochronous USB packet of a frame
> >> because of this new check.  Which means that the first->host_time used
> >> as a starting point for the timestamp just has become inaccurate ?
> >
> > In UVC 1.5 All the ISOC packets have the same dev_sof and dev_stc.
> > So this check will avoid adding a whole frame into the timestamp
> > circular buffer when running at more than 320 Hz (1/(0.1/32))
> >
> > In UVC 1.1 all ISOC packets have the same dev_stc but different dev_sof.
> > This check will avoid adding some of those packets into the circular
> > buffer, but the accuracy will not be lost. We will use the data from
> > the neighbour packets (even from previous frames) to recover the sof.
> >
> > The biggest winner for this patch is UVC 1.1, which will have much
> > more accurate timestamps, because the distance between the first and
> > last will be bigger (as in uvc1.5)
>
> I'm still trying to wrap my head about the whole concept of the hw
> timestamps TBH.
>
> Upon reading it a couple of times I now see that when exactly we
> take samples is not important because the actual frame time in
> STC units is stored in buf->pts and that is supposed to be our
> starting point. And the rest is just used to calculate
> a factor + offset.
>
> At least that is what the big comment says but I'm confused by
> the code which is supposed to implement:
>
>  * SOF = (SOF2 - SOF1) / (STC2 - STC1) * PTS
>  *     + (SOF1 * STC2 - SOF2 * STC1) / (STC2 - STC1)
>  *
>  * or
>  *
>  * SOF = ((SOF2 - SOF1) * PTS + SOF1 * STC2 - SOF2 * STC1) / (STC2 - STC1)   (1)
>
> I think that the code tries to implement the second formula:
>
> We've (with some checks removed):
>
>         /* First step, PTS to SOF conversion. */
>         delta_stc = buf->pts - (1UL << 31);
>         x1 = first->dev_stc - delta_stc;
>         x2 = last->dev_stc - delta_stc;
>
>         y1 = (first->dev_sof + 2048) << 16;
>         y2 = (last->dev_sof + 2048) << 16;
>         if (y2 < y1)
>                 y2 += 2048 << 16;
>
>         y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2
>           - (u64)y2 * (u64)x1;
>         y = div_u64(y, x2 - x1);
>
>         sof = y;
>
> Simplifying this by removing all the range-shifting
> and using sof1/sof2 instead of y1/y2 like in the comment
> we end up with:
>
>         x1 = first->dev_stc - buf->pts;
>         x2 = last->dev_stc - buf->pts;
>
>         sof1 = first->dev_sof;
>         sof2 = last->dev_sof
>
>         sof = ((sof2 - sof1) + sof1 * x2 - sof2 * x1) / (x2 - x1)
>
> Now substitute stc1/stc2 for first->dev_stc / last->dev_stc
> and just pts for buf->pts and expand x1 + x2 we get:
>
>         sof = ((sof2 - sof1) + sof1 * (stc2 - pts) - sof2 * (stc1 - pts)) /
>               ((stc2 - pts) - (stc1 - pts))



I think this is where your explanation goes slightly off:

x2 is actually stc2 - pts + (1UL << 31), and x1 is stc1 - pts + (1UL << 31).

Before you scream at me, look at the end of the mail! :P


>
> We can simplify the divisor here by getting rid of the pts bit
> since the 2 "- pts" parts negate each other:
>
>         sof = ((sof2 - sof1) + sof1 * (stc2 - pts) - sof2 * (stc1 - pts)) /
>               (stc2 - stc1)
>
> Now lets get rid of the () from expanding x1 / x2:
>
>         sof = ((sof2 - sof1) + sof1 * stc2 - sof1 * pts - sof2 * stc1 + sof2 * pts)) /
>               (stc2 - stc1)
>
> Shuffle bringing " * pts" parts to the front:
>
>         sof = (sof2 * pts - sof1 * pts + (sof2 - sof1) + sof1 * stc2 - sof2 * stc1)) /
>               (stc2 - stc1)
>
> Simplify:
>
>         sof = ((sof2 - sof1) * pts + (sof2 - sof1) + sof1 * stc2 - sof2 * stc1) /
>               (stc2 - stc1)
>
> Looks a lot like the comment except there is a + (sof2 - sof1) too much
> in there ?
>
> And some of the range shifting also feels wrong. As long as we're only
> subtracting the range shifting is fine. But as soon as we start multiplying
> variables in different shifted ranges the end result actually changes.
>
> Especially weird here is that we range-shift by (1UL << 31) for calculating
> delta_stc and then *multiply* (y2 - y1) by (1ULL << 31) I guess this is
> to compensate for the (1ULL << 31) component of x1/x2 but the first->dev_stc
> and pts parts of x1 where never multiplied by (1ULL << 31) so these
> are still in their original *scale*. Either we should multiply all
> parts to go to some other fixed scale and the sof value are both range-shifted
> by 2048 as well as multiplied by 65536, which also seems wrong to me as
> soon as we do sof1 * stc2 or sof2 * stc1
>
> All in all this all feels like there are some issues lurking here and it
> does not seem to match the comment at the top.
>
> Regards,
>
> Hans
>
>
>

Lets go back to the beggining:

SOF = ((SOF2 - SOF1) * PTS + SOF1 * STC2 - SOF2 * STC1) / (STC2 - STC1)

This is the formula for a straight line when you know two points. The
names are super ugly, lets use something we are more used to:

y = ((y2 - y1) * x + y1 * x2 - y2 * x1) / (x2 - x1) ;

Ok. how would this look if we want x to be exactly at (1 << 31) to
prevent unsigned underflow? ?

we just have to move things around:

delta = x - (1<<31);

new_x1 = x1 - delta = x1 - x + (1<<31)
new_x2 = x2 - delta = x2 - x + (1<<31)

We plug this in the formula and:

y = ((y2-y1) * (1 <<31) + y1 * new_x2 - y2*new_x1) /(new_x2-new_x1);
Which is exactly what we have.


Now lets look at the scaling:

         delta_stc = buf->pts - (1UL << 31);
         x1 = first->dev_stc - delta_stc;
         x2 = last->dev_stc - delta_stc;

X1 and X2 are NOT scaled

         y1 = (first->dev_sof + 2048) << 16;
         y2 = (last->dev_sof + 2048) << 16;
         if (y2 < y1)
                 y2 += 2048 << 16;

Y1 and Y2 is scaled 16 (ignore the +2048, the variable is mod(2048))

         y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2
           - (u64)y2 * (u64)x1;
         y = div_u64(y, x2 - x1);

y = (SCALE16 - SCALE16)*K + SCALE16*SCALE1 - SCALE16*SCALE1; => Result
is SCALE16
y = div64(SCALE16, SCALE1) => Result is SCALE16

So it looks good to me. It is a painful code, but I think it is correct.

(Painful, but I would probably fail to do it better :P)

Regards



-- 
Ricardo Ribalda

