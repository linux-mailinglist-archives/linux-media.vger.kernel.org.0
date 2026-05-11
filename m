Return-Path: <linux-media+bounces-61155-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHWIJQgPAmplngEAu9opvQ
	(envelope-from <linux-media+bounces-61155-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:16:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0F45133AE
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63A2830763CB
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 16:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3114043C045;
	Mon, 11 May 2026 16:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cwTmoJA3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0B742EEC7
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 16:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518222; cv=none; b=t6vcMaJoVrQ9txYCkdgkeMevz3ABBv2xlBFA4q3x7i2eq/+bV1zoRjxBWQlbkEcEw3xyH7bCqHhEJS2BFWwTCO0X15GKRWRsneylcYeYv8IqouBqs1Wu+MiS1PyMo8tt+a4ogKQbf2xTpMkG7BBpWxLsa6TFxoGjDgvegqENboI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518222; c=relaxed/simple;
	bh=3ddHCI/u6AMzCPiKrNEM/VNWHhoOwc6c1h5VWFgOqig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d7oQuTfkaDbEGO7s4Z3xeaKI0nh3hNcIwdvbwXrqPeQVgoIDzwpPYIw+7cZn3SekHODso544u1E1BevsErinVsR0Ix6/my9KTBIspniFh4by8H4rEtdRNo7+M1HFDUs9Y3FT25hRpWgHCnN+CpKkYWer+KdJMmRYIqgeJEN5A9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cwTmoJA3; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67e24b8ef55so6253037a12.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778518219; x=1779123019; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pyc2irlV4hpTozzdn4QAIYkKHdvExB4pAKBzqwiHQiY=;
        b=cwTmoJA3d/+psOsBsCkW7T/Xbets/AL5b/UABqEcs0e2QXQBiqeGNDs1PdAEEmxJkC
         YpJNGapd2iAB7yfDm/4FB9OaqQZQ//aryHxbejLYZIiBOBKobp/Xi6SSnN+lA0cKJraL
         eF6uZj9bET+/x6tdUhkySUSoZBCuMO6ID+Gzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518219; x=1779123019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyc2irlV4hpTozzdn4QAIYkKHdvExB4pAKBzqwiHQiY=;
        b=RJo6sVsfdoD7yTySV7qwJXbWVPgKkBcZ8d3b1qWJ3aMT3Px70yesYOu6ZPbqeylZKs
         LWDTmzYkSmkri6jJHcN/aT/SnqGwXvzefH5lz9dzlzC3B0igkDpeSXpEN77zIPcDakI2
         S6fz9welZm2a9aUJ6eSbPAU37xus2KwGTRx0skHkLILlIrZOKpwF+jxQDEYZyPaWKUhD
         C8TQi/TEZRTCYqL7xaa5rpGQPGRrftlkP/eVjr/R9aSY71TIRwlmbHiUaQ+MjHCH/dpg
         4ZwpxUiuxPDGKWBa8TEDzyBU0hg7C/ZAS0qWV/jww+n7nxJ7RxFwGyRbmWVyWah4bdyF
         Q6XA==
X-Forwarded-Encrypted: i=1; AFNElJ9M52bryQIWoAHNh5i8PN42JXQJRa/HH7MejA2U9JSv3FOgIc55Sq0t+j0VzNYbm43IYPPX6vp+klmRvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrF8rs73rkc3Y85AJufAsU54KdE+n2AKHDpPBxru2NwreRRL1p
	b4yWK+IIKFVSCa+OoNAQTVhgafYqTKBEdP5SuANxw/abLGrazHtLYmZBKF1XDLTxRIlBBSXwtZg
	zBsk=
X-Gm-Gg: Acq92OHcnddy375a3B6g/WcD8XuITroDtn81HWti5+2VOom1Z/AwvjmrWzI7OGjqlwc
	O82tr7f0QBC7FsbNDwTEZO2hPciqZNHsCBgT50148pqKKUlzdFh2HSIhl1cFjKBbMQ0bZL1rqco
	nCBaiQCk7X1QXQf0N5xZlz2WvkedTPL/MTW7hNlOe/ygDrCtGr/C+G84t127zsqwetKSumkMplL
	/OkSilxuApeZ2QU94QcxEn5w5e259zCa/TKPUW1qF8PG7dM9NairxxvNsnUHmSCzdhlo4maYxaO
	WiY1T6Bo5MTq7REfcxwDU1mU9iCppcRZALbyV7DnbRNk/5umsYGk7CL2WMjRtvsyuICGeqchaLl
	WsRAz6STQ5vBPOh3lzhYpmnkd0QG/oMC87UhSdIKs82bEvjYIQ717NhNiGIsC74qR0iS363DnYZ
	DQE8i4hAzI4UjvlbFpCz0fJktfIPAyLa5iLCtPcOJdTQbSfkzjI7cZG6/hsJmIcNzQi8+Ynyk=
X-Received: by 2002:a05:6402:5017:b0:67d:6c95:9c8e with SMTP id 4fb4d7f45d1cf-67d6c95a081mr12315957a12.14.1778518219352;
        Mon, 11 May 2026 09:50:19 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e1af63sm3927481a12.25.2026.05.11.09.50.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 09:50:19 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bcb5370bb0dso568271866b.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:50:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9jmrqQP5nE8Eii4zK5lg5xb3TsQgcI3HJ+SSwFkq+oucd/Y/2ATOKhRM7Cv7C2U4No1IkiJ4y8xHki+g==@vger.kernel.org
X-Received: by 2002:a17:907:748:b0:ba8:9137:da5f with SMTP id
 a640c23a62f3a-bc56e6fb36emr1500682166b.32.1778518216661; Mon, 11 May 2026
 09:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
 <20260323-uvc-hwtimestamp-v1-4-aa42e3865204@chromium.org> <10a08462-30ce-4a79-bb5d-001ab7f3d0d8@kernel.org>
In-Reply-To: <10a08462-30ce-4a79-bb5d-001ab7f3d0d8@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 11 May 2026 18:50:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCs9gby6bNBCRmxT15D8c-nksdUmwH8iUDAsiV1tmQTM3Q@mail.gmail.com>
X-Gm-Features: AVHnY4JL0Aa54-Afx6BfrRiZHEfsHTgnEN1oSkHuKXH696j2MXYzf_2uO0CcVZg
Message-ID: <CANiDSCs9gby6bNBCRmxT15D8c-nksdUmwH8iUDAsiV1tmQTM3Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: uvcvideo: Do not add clock samples with small
 sof delta
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Yunke Cao <yunkec@google.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 0F0F45133AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61155-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,chromium.org:email,chromium.org:dkim]
X-Rspamd-Action: no action

Hi Hans

On Mon, 11 May 2026 at 18:07, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi,
>
> On 23-Mar-26 14:10, Ricardo Ribalda wrote:
> > Some UVC 1.1 cameras running in fast isochronous mode tend to spam the
> > USB host with a lot of empty packets. These packets contain clock
> > information and are added to the clock buffer but do not add any
> > accuracy to the calculation. In fact, it is quite the opposite, in our
> > calculations, only the first and the last timestamp is used, and we only
> > have 32 slots.
> >
> > Ignore the samples that will produce less than MIN_HW_TIMESTAMP_DIFF
> > data.
> >
> > Fixes: 141270bd95d4 ("media: uvcvideo: Refactor clock circular buffer")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index dcbc0941ffe6..e1a4e84d6841 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -544,6 +544,19 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
> >       spin_unlock_irqrestore(&clock->lock, flags);
> >  }
> >
> > +static inline u16 sof_diff(u16 a, u16 b)
> > +{
> > +     u32 aux;
> > +
> > +     a &= 2047;
> > +     b &= 2047;
> > +     if (a >= b)
> > +             return a - b;
> > +
> > +     aux = a + 2048;
> > +     return (u16)(aux - b);
> > +}
> > +
> >  static void
> >  uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
> >                      const u8 *data, int len)
> > @@ -664,12 +677,13 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
> >       sample.dev_sof = (sample.dev_sof + stream->clock.sof_offset) & 2047;
> >
> >       /*
> > -      * To limit the amount of data, drop SCRs with an SOF identical to the
> > +      * To limit the amount of data, drop SCRs with an SOF similar to the
> >        * previous one. This filtering is also needed to support UVC 1.5, where
> >        * all the data packets of the same frame contains the same SOF. In that
> >        * case only the first one will match the host_sof.
> >        */
> > -     if (sample.dev_sof == stream->clock.last_sof)
> > +     if (sof_diff(sample.dev_sof, stream->clock.last_sof) <=
> > +         (MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
> >               return;
>
> If I understand things correctly then uvc_video_clock_update() uses
> first->host_time + some correction time. But you might end up not
> storing a sample for the very first isochronous USB packet of a frame
> because of this new check.  Which means that the first->host_time used
> as a starting point for the timestamp just has become inaccurate ?

In UVC 1.5 All the ISOC packets have the same dev_sof and dev_stc.
So this check will avoid adding a whole frame into the timestamp
circular buffer when running at more than 320 Hz (1/(0.1/32))

In UVC 1.1 all ISOC packets have the same dev_stc but different dev_sof.
This check will avoid adding some of those packets into the circular
buffer, but the accuracy will not be lost. We will use the data from
the neighbour packets (even from previous frames) to recover the sof.

The biggest winner for this patch is UVC 1.1, which will have much
more accurate timestamps, because the distance between the first and
last will be bigger (as in uvc1.5)
>
> Regards,
>
> Hans
>
>


-- 
Ricardo Ribalda

