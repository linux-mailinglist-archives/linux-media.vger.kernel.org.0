Return-Path: <linux-media+bounces-61265-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHYWF4IsA2oR1QEAu9opvQ
	(envelope-from <linux-media+bounces-61265-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:34:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE48E521496
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBFF034E60D7
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 13:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808AE37DAB4;
	Tue, 12 May 2026 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GOTmfqA4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA6C3E1733
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591731; cv=none; b=ZRRzcCcPdk9sNK3CDWGWSgrVU+zdb+6dGdK52NHlTalsweENLWFcLBWjxfllzgDpjuez0sp6VJpsyEdeTFnPXyooMVsTceRTAQIgMw0qlzUFD4UJN1AUbuqGazVpeafmEPpXMFR+ehSUUj/ACkJ/mEqc/PMCBiGIlkCY8vVPPGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591731; c=relaxed/simple;
	bh=vt/1e5lHBz2W8aO50pk7ZkG91uTdU0BlmRHgT19/7Jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKd1LcxUTsiXv1VIkaay3v3x5EzwojdgOtJLze5eHwZ6HYjVbZsFqUkL8V1ELmF4KjolfBSy28c8cJfQu5l0SjXG/zPjI+ZmCa3ei0kgi1EKLcj+mVwJmfukgJyGpTSpVtMgVZjkFNDhqV8I9H8wHqRbBrapoFwCc0Y0xqhxyt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GOTmfqA4; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bcc2b199c17so424316766b.3
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778591727; x=1779196527; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+wKgmg0Wvg2mRzqfRNbagJRv2KF7TryoL6bQoMszZa4=;
        b=GOTmfqA4lhDimmm5b3ogSZ+Rbb87LDB0wiDsKHamxez9YsyVxz0Yc3+iCMbQn82yez
         ltNeIool0OxfTG5gRDF5wC+qnKXFMtajdyI3ieXsIwwDu4GUh5wyafCrz2QoQQ5S/avX
         BiNtTUEGC+YKEehzK5DnIlZwbqMTrUf+apsA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591727; x=1779196527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wKgmg0Wvg2mRzqfRNbagJRv2KF7TryoL6bQoMszZa4=;
        b=bMC51vwotcIbvUHWUBnkIgtvDSgGoRkKZUvuq/jxAzaea9ClynRekDeuNxdvkhaMdZ
         Cx0rvab52kpuLE4ClktuGZyAIfbnqPEiUYlCrqx4dGYL8/Wk9P942G6XTNzO41kne5M3
         agtZmB1alFb2ancMTK6xe0ia0o/uPyT3aUUUBJfi5v9ra6BCB5T0R6zqc6YCDQ+wTvVC
         02/9LdNILsk880jwKAQdpqNfGCu8/y4Ft1RT+oqOP4RjBSgy7S7WXoXoGp4cfj+hGBDw
         nGkIBmeroPlEwsJFcH5FakryQLvlRra/6AJTDKqFFPCzVqJx85Y4wu6as6uY6pgDZPZy
         xF/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+uiEuhvQDgwDbwC88g5ijjtjfykyW2Na84bEqKzOJqI0tbGgs9liB7rguBdGu/L9mccSu1QDreauS6jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp/nyhxnpKtEIlztw2vHb7kFbnNyW9cBe+36nH3NLM+mJhZgX6
	h1a0K9VMFUaeRNL78Hx2rWffg89VxxGVc98vv8v6aLaAbex5xbArRzSQVso77ceyrYp/+GXXnqc
	5UkiOew9m
X-Gm-Gg: Acq92OHcPovBZSUntogeW/lzJJkoMKx116oaI0X/Z9VNzU6vMe4xF5Pmpmuo9SpV9LF
	JKMNdTX0mSfU8Y1ijK+mru0vnnqEcHH5Y/gnqDu/1AVRjNW4fUTR/iTejRf8qtUMNWYPxPAYOL7
	QUtRhGrjQi7bNAwrWV9K1TkKWwJBhfymY1Rr8Gr5xdiw/o6RJCIUlGmwReCsWx85xAHx+3C1ynY
	WvYhb4rYX7w9fZa46OntuqSD0Lk3EjgegPmGVMZd+toe62uGpElqpRfXORls9NRUs8z6Wijj117
	9R7Db1bEorQPu6AXPWVhICsgx8pgNUGYh+Esuh65mYwkYrKhS4sxK5t2yjNF2epST6WPH01GaKp
	bFCkOl2NxdonvIwrP3/ndPDdBEQrgAhb7LcBeL3BnKvDzTfoIwa7YkxC0rP23dm2HK/7StThxDF
	Hdf++E3QtTVdO4Phf7s/M/Dtg/51g8aS3gCtM6oqYHCQoBOkkem2wn26Ifyn8H
X-Received: by 2002:a17:907:7293:b0:bd0:6293:bd0a with SMTP id a640c23a62f3a-bd062a3013bmr478193366b.7.1778591727339;
        Tue, 12 May 2026 06:15:27 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcd9decf1a4sm441569066b.42.2026.05.12.06.15.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 06:15:26 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bcc2b199c17so424302466b.3
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:15:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/AZjrXMT6bglTtbZl41QGLoaJNvp2ekGomR7tp5djJjUgUtjgqA8x6rFKUk+1N14w2q75551nSxls7OQ==@vger.kernel.org
X-Received: by 2002:a17:907:782:b0:ba7:ade5:8605 with SMTP id
 a640c23a62f3a-bc56ae2897amr1773050666b.6.1778591724150; Tue, 12 May 2026
 06:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-uvc-hwtimestamp-v2-0-3c2905c733bb@chromium.org>
 <20260512-uvc-hwtimestamp-v2-5-3c2905c733bb@chromium.org> <cdd09883-51ec-4d6e-817e-3fd9017624d8@kernel.org>
In-Reply-To: <cdd09883-51ec-4d6e-817e-3fd9017624d8@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 12 May 2026 15:15:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCv3gM+s_On5KtGUMk2_4VYpS2UtpUTmqfb=RszwoKY7gw@mail.gmail.com>
X-Gm-Features: AVHnY4LMuhc3dq5bIJdmKOZXXkdm5QwpM0JwUYcqaP0RKLZkIF1z0x34Fzq3Vts
Message-ID: <CANiDSCv3gM+s_On5KtGUMk2_4VYpS2UtpUTmqfb=RszwoKY7gw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] media: uvcvideo: clock: Do not run expensive code
 if not needed
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Yunke Cao <yunkec@google.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: AE48E521496
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
	TAGGED_FROM(0.00)[bounces-61265-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,chromium.org:email,chromium.org:dkim]
X-Rspamd-Action: no action

Hi Hans

On Tue, 12 May 2026 at 15:02, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi,
>
> On 12-May-26 14:30, Ricardo Ribalda wrote:
> > We only save relevant samples into the circular buffer.
> >
> > If the data is very similar to the previous one, exit early.
> >
> > If the data is not going to be added, do not calculate the wall time.
> >
> > Suggested-by: Hans de Goede <hansg@kernel.org>
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> 2 nits here, first nit, this really seems to be 2 different
> changes, IMHO it would be cleaner to have the (non trivial)
> early-exit on raw sof match patch as a separate patch from
> the one moving the uvc_video_get_time() call ?

ack
>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 20 ++++++++++++++------
> >  drivers/media/usb/uvc/uvcvideo.h  |  3 ++-
> >  2 files changed, 16 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 8d0fd7003c62..ea8a76f57963 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -524,7 +524,7 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
> >
> >       spin_lock_irqsave(&clock->lock, flags);
> >
> > -     if (clock->count > 0 && clock->last_sof > sample->dev_sof) {
> > +     if (clock->count > 0 && clock->last_sof_processed > sample->dev_sof) {
> >               /*
> >                * Remove data from the circular buffer that is older than the
> >                * last SOF overflow. We only support one SOF overflow per
> > @@ -606,6 +606,12 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
> >       sample.dev_sof = get_unaligned_le16(&data[header_size - 2]);
> >       sample.dev_stc = get_unaligned_le32(&data[header_size - 6]);
> >
> > +     /* If the sample sof is very similar to the previous one quit early. */
> > +     if (stream->clock.last_sof_raw == sample.dev_sof)
> > +             return;
> > +
> > +     stream->clock.last_sof_raw = sample.dev_sof;
> > +
> >       /*
> >        * STC (Source Time Clock) is the clock used by the camera. The UVC 1.5
> >        * standard states that it "must be captured when the first video data
> > @@ -644,8 +650,6 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
> >       if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
> >               sample.dev_sof = sample.host_sof;
> >
> > -     sample.host_time = uvc_video_get_time();
> > -
> >       /*
> >        * The UVC specification allows device implementations that can't obtain
> >        * the USB frame number to keep their own frame counters as long as they
> > @@ -682,19 +686,23 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
> >        * all the data packets of the same frame contains the same SOF. In that
> >        * case only the first one will match the host_sof.
> >        */
> > -     if (sof_diff(sample.dev_sof, stream->clock.last_sof) <=
> > +     if (sof_diff(sample.dev_sof, stream->clock.last_sof_processed) <=
> >           (UVC_MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
> >               return;
> >
> > +     /* This is expensive, only do it if needed */
> > +     sample.host_time = uvc_video_get_time();
> > +
>
> I think it would be slightly cleaner to just move this call
> to inside uvc_video_clock_add_sample() ?

If you do not mind I prefer to keep it as is.

The other uvc_video_clock (add_sample, reset, init, cleanup) are
"content agnostic" and I would prefer to keep it that way.

Let me know if this is ok before I send v3.

Thanks!

>
> Regards,
>
> Hans
>
>
>
>
> >       uvc_video_clock_add_sample(&stream->clock, &sample);
> > -     stream->clock.last_sof = sample.dev_sof;
> > +     stream->clock.last_sof_processed = sample.dev_sof;
> >  }
> >
> >  static void uvc_video_clock_reset(struct uvc_clock *clock)
> >  {
> >       clock->head = 0;
> >       clock->count = 0;
> > -     clock->last_sof = -1;
> > +     clock->last_sof_processed = -1;
> > +     clock->last_sof_raw = -1;
> >       clock->last_sof_overflow = -1;
> >       clock->sof_offset = -1;
> >  }
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 0a0c01b2420f..7b8477e5a0ba 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -522,7 +522,8 @@ struct uvc_streaming {
> >               unsigned int size;
> >               unsigned int last_sof_overflow;
> >
> > -             u16 last_sof;
> > +             u16 last_sof_processed;
> > +             u16 last_sof_raw;
> >               u16 sof_offset;
> >
> >               u8 last_scr[6];
> >
>


-- 
Ricardo Ribalda

