Return-Path: <linux-media+bounces-55903-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPoHGJ76t2n1XgEAu9opvQ
	(envelope-from <linux-media+bounces-55903-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:42:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D322999F3
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC82A30276AF
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 12:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84687396595;
	Mon, 16 Mar 2026 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RII1pUx0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE93396596
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 12:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773664849; cv=none; b=UzmuvqFIqQcUBGDpaqRRS/McFeKpIUambUaNKMWLnQiBRhNMLHWsnf42QN0zcJSgEBHGZvXjFbYjlFUc+Vy8buhPXimDEmwPqFCYhUPT8DTiNrbjFemyaysYpJQ/GTs38cKbJrF92pnEZRofUl0DRcSJksKeMCmgCJWzAYfQwBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773664849; c=relaxed/simple;
	bh=+t6f6710ZJub2vjiBPzipx/xwQjwtlrqmFpgwHKn03I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=isXPMF7B0Oo2GZ7vchTZfvnKmQGbYLbE4s6VesncJGcjx6rUGDnFm+rC9qkq7bLkagNR8jcPbcW16uBj72qO/KahILImEvD0vSkm+W1uUlC5MWgIj+4NthsWmqCh+Vlbxbz1hzAwo13eT4blDjY4oBKG4kIJWf0b8PsuBQgQ8Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RII1pUx0; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-664f8bef4e7so1883903a12.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 05:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773664845; x=1774269645; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gi4RHI+Y81wQCZttp37YwDWMGbQzC+jOC5s3RXzty/8=;
        b=RII1pUx0eKCZvNCf5X2tqlDZhl0ENbgXHlmH5bOD8dDCNo3OEVgfqyBt1o04CJ+Iwe
         G5/PciZX+85B46KocjLhQHqGRAF8I2XrfPbik/DhiFbePgmkWharkxXfAz31c8Zcdn1p
         rKI+WHmHghFLCfnlC84C6+wF1WlqImvaVFP18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773664845; x=1774269645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi4RHI+Y81wQCZttp37YwDWMGbQzC+jOC5s3RXzty/8=;
        b=qAsQ3vuYv7DtU4zcf3h92/HtkOVE5ZCiPVek42gwyDELnM7cNWZEz8ZaFbmrbcxam2
         slTl3Sret2ZisGrBxijvt+5k1FYewqKxSVED348dnupjAxC/3w8Yvms/0ftby5hjaXs+
         fA4jZ0mLl9RFMLThOeCRU61ESGxiTKXJgYjJ/x4NnN3q8oxlQd1hisj+qJwVy2iGcHWR
         mVjInjbIAhl8rbBkpJ+f/dhRpvrrglngoQN16KbsWlNPNoHdVnIv93EFINKZ4mG3LHgV
         gpPyQ760HKWzN2qbg1ONYGh1ETrqTNUTfuLz1VNG2RPIDym80gC7Z0lNWmaZ15XF9uTl
         mnbg==
X-Forwarded-Encrypted: i=1; AJvYcCUmrSVfWykAdteEKessWJgFxjMwuJNIgaO3ZNHRwMOTdvB0pq8Zbznk6WqsuGOYAFFTBiTmRy9HThLGIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpnPSIxlHGji1qPBxTkSeJ7jVcmUAWf1+F+7F0bI3/IXDwVgVI
	ABU3VdFTI6ykeR0ugHPCkXsD7m6aHBdAXxMT6QWqVpspi/G/POXJPbx9DrMNXQ6ZLZmEdL7GNc9
	QEic=
X-Gm-Gg: ATEYQzxer4wM5wCY6II+ijP9V1rTPJqQ8oI7+tFLfVb5y5q2oJPL/yqpcH1XzwO+6rD
	6L4Hqaet0gNcEvFLYPxAfVfa3tu67eyKL05f/phqbaR1E9S1FdLIoCZE09/E6vZGFQGbIjFjlmd
	zGkg+7e98UUz5oil1wyzyAgS4U9uhQNUKOYqOepNK7Z0a1kH4sZ35/XXqFv97H34syxQeyVRCME
	n40/BKoknNKTNwNhEblGYczvkglTCvapUyYy+qqbp8uMQflkpeHLguRu4z/CAFueCwp8KUGE/1Z
	FlwODTR/daUhwy6vJ96HgZcCbE8tNF9SAHRFkUVIBKoOJLZw51GtcW8mXauGbChaJ/TQ6gfRxYA
	BcEcl7JFIPRVo+nRPietgrYprShSH/B3sIrCXbgB+hWRiRT0qW/q+PmLMHMzGdBdIAVfnyPli5a
	S3Mam9Otm9Tb19gdq+dG/Jzs+5TURHwrKRAwfIAUmGZOG4D8gNTSRl4Kti1nI3
X-Received: by 2002:a17:907:98e:b0:b97:554:f12e with SMTP id a640c23a62f3a-b97650c2f9bmr685174766b.14.1773664844664;
        Mon, 16 Mar 2026 05:40:44 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97cb0d2df2sm68130766b.54.2026.03.16.05.40.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:40:44 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b97bca3797dso129045666b.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 05:40:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX990pL6CC2DAF9KqaB8J/Yac+jagvPpIzGgU8YbgX3R5PzfwkU7SFzaYR35t384+tu2d1pbzVe2GHpSw==@vger.kernel.org
X-Received: by 2002:a17:907:60cc:b0:b97:b2db:6365 with SMTP id
 a640c23a62f3a-b97b2db67b9mr270829066b.1.1773664843044; Mon, 16 Mar 2026
 05:40:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-uvc-fid-v2-1-3f7a996d9047@chromium.org> <41ecee5e-adcf-493b-839d-2390163700f5@kernel.org>
In-Reply-To: <41ecee5e-adcf-493b-839d-2390163700f5@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Mar 2026 13:40:30 +0100
X-Gmail-Original-Message-ID: <CANiDSCuj4cPuB5_v2xyvAagA5FjoN8V5scXiFFOeD3aKDMqkCg@mail.gmail.com>
X-Gm-Features: AaiRm523jMNHwsQRnDZGdty1VmPo00lSF5NTcl3lFCBGVEJK7tQZ3Ua-hwsc4Kg
Message-ID: <CANiDSCuj4cPuB5_v2xyvAagA5FjoN8V5scXiFFOeD3aKDMqkCg@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Fix buffer sequence in frame gaps
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55903-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email]
X-Rspamd-Queue-Id: C1D322999F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans

Thanks for looking into this. uvc_video_decode_start() is not a
beautiful function (not saying that I could have made it better).

On Mon, 16 Mar 2026 at 12:45, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi,
>
> On 13-Mar-26 7:21 PM, Ricardo Ribalda wrote:
> > In UVC, the FID flips with every frame. For every FID flip, we increase
> > the stream sequence number.
> >
> > Now, If a FID flips multiple times and there is no data transferred between
> > the flips, the buffer sequence number will be set to the value of the
> > stream sequence number after the first flip.
> >
> > Userspace uses the buffer sequence number to determine if there has been
> > missing frames. With the current behaviour, userspace will think that the
> > gap is in the wrong location.
> >
> > This patch modifies uvc_video_decode_start() to provide the correct
> > correct buffer sequence number and timestamp.
> >
> > Cc: stable@kernel.org
> > Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> So I'm trying to understand this patch, but while looking at this I'm having
> a hard time to figure out the current code.
>
> Lets take the following scenario. We have an active current buffer with some
> bytesused and uvc_video_decode_start() sees a fid flip.
>
> Now the following happens:
>
> First uvc_video_decode_start() run:
>
> 1. if (stream->last_fid != fid) check at line 1175 sees the flip does stream->sequence++;
> 2. if (fid != stream->last_fid && buf->bytesused != 0) check at line 1243 succeeds, marks
>    buffer as ready and returns -EAGAIN.
> 3. Note stream->last_fid is not updated in this case.
>
> Second uvc_video_decode_start() run because of -EGAIN with new fresh buffer
>
> 1. if (stream->last_fid != fid) check at line 1175 sees the flip does stream->sequence++;
> 2. if (buf->state != UVC_BUF_STATE_ACTIVE) check at line 1209 succeeds, updates
>    buf->buf.sequence , timestamp
> 3. if (fid != stream->last_fid && buf->bytesused != 0) check at line 1243 fails because
>    bytesused == 0
> 4. function exits normally doing:
>
>         stream->last_fid = fid;
>
>         return header_len;
>
> Notice that step 1. happens in both uvc_video_decode_start() runs so we are doing
> stream->sequence++ *twice* for a single fid flip. Am I missing something here or
> are we indeed increasing sequence twice. And if we are indeed increasing sequence
> twice, is that intentional and/or expected by userspace ?

During normal operation the driver will not reach line 1243, instead
it will detect the new frame using the EOF in the function
uvc_video_decode_end().

Something like this:

****EOF_CHANGE
uvc_video_decode_end()
  - set buf->state to READY
uvc_video_decode_isoc()
  - calls uvc_video_next_buffers(), which provides buffes with bytesused=0
uvc_vieo_decode_start()
  - Loops in "Dropping payload (out of sync)"

**** FID FLIP
- uvc_video_decode_start()
  - sequence++
  - set buf->state to ACTIVE
  - last_fid = fid


If I understood the code correctly, line 1243 was introduced for
cameras that do not implement EOF properly. For those cameras I agree
that it looks like the code will increment the sequence twice per
frame... which is wrong. I can send a patch if you want but I have no
camera to test it. Basically I would set stream->last_fid = fid before
return -EAGAIN


Regards!!!

>
> Regards,
>
> Hans
>
>
>
>
> > ---
> > Changes in v2 (Thanks Laurent):
> > - Improve commit message.
> > - Remove original timestamp and sequence assignment. It is not neeed
> > - Link to v1: https://lore.kernel.org/r/20260310-uvc-fid-v1-1-5e37dc3c7024@chromium.org
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 18 ++++++++++++++----
> >  1 file changed, 14 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 40c76c051da2..9e06b1d0f0f9 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1176,6 +1176,20 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >               stream->sequence++;
> >               if (stream->sequence)
> >                       uvc_video_stats_update(stream);
> > +
> > +             /*
> > +              * If there is a FID flip and the buffer has no data,
> > +              * initialize its sequence number and timestamp.
> > +              *
> > +              * The driver already takes care of injecting FID flips for
> > +              * UVC_QUIRK_STREAM_NO_FID and UVC_QUIRK_MJPEG_NO_EOF.
> > +              */
> > +             if (buf && !buf->bytesused) {
> > +                     buf->buf.field = V4L2_FIELD_NONE;
> > +                     buf->buf.sequence = stream->sequence;
> > +                     buf->buf.vb2_buf.timestamp =
> > +                                     ktime_to_ns(uvc_video_get_time());
> > +             }
> >       }
> >
> >       uvc_video_clock_decode(stream, buf, data, len);
> > @@ -1216,10 +1230,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >                       return -ENODATA;
> >               }
> >
> > -             buf->buf.field = V4L2_FIELD_NONE;
> > -             buf->buf.sequence = stream->sequence;
> > -             buf->buf.vb2_buf.timestamp = ktime_to_ns(uvc_video_get_time());
> > -
> >               /* TODO: Handle PTS and SCR. */
> >               buf->state = UVC_BUF_STATE_ACTIVE;
> >       }
> >
> > ---
> > base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
> > change-id: 20260310-uvc-fid-e1e55447b6f1
> >
> > Best regards,
>


-- 
Ricardo Ribalda

