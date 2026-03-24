Return-Path: <linux-media+bounces-56813-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCf4BTQ/wmmCagQAu9opvQ
	(envelope-from <linux-media+bounces-56813-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:37:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE5E304103
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71B2B311CB2B
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 07:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395F636683B;
	Tue, 24 Mar 2026 07:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eqQ0YQ65"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FFF3CBE62
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 07:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774337055; cv=none; b=FsuUVUbIWUEiIzbKknPh1QdE6s8LmlinwodbeJhfhTNGcyO0kbkh5RrgGrg59dEHE28NpJIca/dqlPTAs586/fN5OQKWba3mVWddwMAHPHYVlp+p7LzvV77THBxiDm5O62IQ/+NzUtXQHpRARRvS72h8SolNc+t+gWir/Y0pyqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774337055; c=relaxed/simple;
	bh=7Rs9ePcYC20H5ERyEHChMtjs/3IuJ5xhtUQh0NcDeow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rpvaYGmZnyryYZv+aCGQf20UmcjWwWS6tHTfpDF9I9YXw0Ho6Gg9JLurJB/MjjFGsBTJxstHpyRbTbEdpdkxpV15601MgHGlU+dlhyLxTW/cyR/xhNra2KKFch+PXCPn9pF3TYYBI4JJKFkkF2b0+SPrkMuF1BT4UZFV7w6+3Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eqQ0YQ65; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b982518b73fso181934566b.1
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 00:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774337043; x=1774941843; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RHyRJFY8/PO17sMHA7wWMn7TdJaZW0qwco8uO0G3b3Y=;
        b=eqQ0YQ65zWDU97ClB+mkd2YZpr5YYtKgJHSzoAiXz+qOF4nrZ1rivF3+66DKtTrOO8
         rUra0S7P6wAWnE/LzdSB0tYfQVgfmSMUfToUXqb2b5oYfjORDBMBySuWEt3ENUpVgQPg
         q4RS4N9bI2wx5vRSKJHitVxZTeYup1aK8cOfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774337043; x=1774941843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHyRJFY8/PO17sMHA7wWMn7TdJaZW0qwco8uO0G3b3Y=;
        b=oD3SsiIpz9jlgZH9QMiqit+FOtA5hWXE+4XAiAheVfFFkwRm0GRpDVWw8v17ZPAK+T
         JXzE96MOQmzcXhUWgeXhrYRlhCxzul7WqYvrXz8zhyfoNPgzaooNyP63LjoS7zf1pRJe
         lmVZo7YB+I2YPuQuQtJSZYg77X4GZQswZkzTc9U2W9eDa9F4ZOSfFd9tg4RL+hns+ng9
         34s7sfxbBaWybxF+BfjSATerOJ3wjfEiNCANgTo2GzSrpUsrBcLpy3T++JNjZbDNK6Ac
         YXd8hBhcNidTLvr/mtC1BFy9GSVxFnGChfeiDngIEChnPgLX88JQixG66iOqFOP09g6C
         zw2w==
X-Forwarded-Encrypted: i=1; AJvYcCXWd5gGrGkdTBdm/P/TgbW5FMD2AS4M2M+2dyLzsC8a8sFoYQfPpNlPiVPXWxW+eT7BsjVpZbhr2DW+Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlcHpSTMyrke8Yqtow8y+1JeAWrvlH5GIdS2an0uC52CMsWI57
	PhSGcBq1C9QfhSwejralmhm3qa8SQUaGYTM+PgritvBwiYMVA72vQxI/ycjLtC+NnFqNZl0eTJ3
	bTGS77GhK
X-Gm-Gg: ATEYQzxlu85e+SI8j82BOY62syg+MZ+qgl60agYRKwgosz8tL0e0bi+FMStAyfHDO8o
	Xx32ECaOnG4zq3PO13gVSNq2UfuIchHjtA785r5m04kfmALw+ecn4H3GZZ6Tkbctjf2TGuRd9e+
	RK9IKrVfxryQ1PFCm31No7VC5lKBwhRzmbgAEqnWW7HuL6o/p0AITXUJqNMmtNkv1RNS129ogrp
	MyQJoHXoHsVv32OMRU54LjTA7Qx+W9h7JRl6BDVhw/KR3hamkkb076E2LrJDJmk7LW+EdNdyJhY
	0aaoJU+1siFvQfPkReUkLlCq3OyIwlgFWf4b+uxRhSJU3exFociEkfvfYwdV97qVmrEzsnDvWGa
	r5GlaZ79OwgzG/xtjcMzG07A5jvlpYUjP4flG38UiCUS08yCL3ukubm/02nhpAMV8xlpk5KKEA9
	2AJd/b4UcOju67p16D9NoXWvM6+N54cEUonmRA9DMTTbcTaOWFCUhsjy/0w/wzaIwd1bKR3+8=
X-Received: by 2002:a17:907:7fa9:b0:b98:3bb8:c10f with SMTP id a640c23a62f3a-b983bb8fcd1mr1080347766b.5.1774337042520;
        Tue, 24 Mar 2026 00:24:02 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98336630d4sm612559466b.46.2026.03.24.00.24.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 00:24:01 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b97a9f4b4dcso129152866b.3
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 00:24:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUf9dhVnGAQKsIxfX/NPNxghxQhnfXPHUb06mPi6GWLsjpvhRXVDb3pHQ4oIyqXJnJtV3/d10jzD1eizw==@vger.kernel.org
X-Received: by 2002:a17:906:36c8:b0:b96:d904:9616 with SMTP id
 a640c23a62f3a-b982f3c5400mr820161266b.40.1774337040395; Tue, 24 Mar 2026
 00:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-uvc-fid-v5-0-e2858b657aac@chromium.org>
 <20260323-uvc-fid-v5-1-e2858b657aac@chromium.org> <20260324002022.GC2334070@killaraus.ideasonboard.com>
In-Reply-To: <20260324002022.GC2334070@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 24 Mar 2026 08:23:47 +0100
X-Gmail-Original-Message-ID: <CANiDSCuK3aaKf8UWdpeEgx+3NButA92Fm-=sD8mfPs41D5J+Mw@mail.gmail.com>
X-Gm-Features: AaiRm53cRS-96lJ6HEmn9OVoQPLfVa7Ju2twCVaiigEWpIXS_e02F5CRqqfwNS0
Message-ID: <CANiDSCuK3aaKf8UWdpeEgx+3NButA92Fm-=sD8mfPs41D5J+Mw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] media: uvcvideo: Fix sequence number when no EOF
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
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
	TAGGED_FROM(0.00)[bounces-56813-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,mail.gmail.com:mid,ideasonboard.com:email]
X-Rspamd-Queue-Id: 6BE5E304103
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent


On Tue, 24 Mar 2026 at 01:20, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Mar 23, 2026 at 09:53:52AM +0000, Ricardo Ribalda wrote:
> > If the driver could not detect the EOF, the sequence number is increased
> > twice:
> >  1) When we enter uvc_video_decode_start() with the old buffer and FID has
> >    flipped => We return -EAGAIN and last_fid is not flipped
> >  2) When we enter uvc_video_decode_start() with the new buffer.
> >
> > Fix this issue by moving the new frame detection logic earlier in
> > uvc_video_decode_start().
> >
> > This also has some nice side affects:
> >
> > - The error status from the new packet will no longer get propagated
> >   to the previous frame-buffer.
> > - uvc_video_clock_decode() will no longer update the previous frame
> >   buf->stf with info from the new packet.
> > - uvc_video_clock_decode() and uvc_video_stats_decode() will no longer
> >   get called twice for the same packet.
> >
> > Cc: stable@kernel.org
> > Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
> > Reported-by: Hans de Goede <hansg@kernel.org>
> > Closes: https://lore.kernel.org/linux-media/CANiDSCuj4cPuB5_v2xyvAagA5FjoN8V5scXiFFOeD3aKDMqkCg@mail.gmail.com/T/#me39fb134e8c2c085567a31548c3403eb639625e4
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 92 ++++++++++++++++++++-------------------
> >  1 file changed, 47 insertions(+), 45 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 40c76c051da2..eddb4821b205 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1168,6 +1168,53 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >       header_len = data[0];
> >       fid = data[1] & UVC_STREAM_FID;
> >
> > +     /*
> > +      * Mark the buffer as done if we're at the beginning of a new frame.
> > +      * End of frame detection is better implemented by checking the EOF
> > +      * bit (FID bit toggling is delayed by one frame compared to the EOF
> > +      * bit), but some devices don't set the bit at end of frame (and the
> > +      * last payload can be lost anyway). We thus must check if the FID has
> > +      * been toggled.
> > +      *
> > +      * stream->last_fid is initialized to -1, and buf->bytesused to 0,
> > +      * so the first isochronous frame will never trigger an end of frame
> > +      * detection.
> > +      *
> > +      * Empty buffers (bytesused == 0) don't trigger end of frame detection
> > +      * as it doesn't make sense to return an empty buffer. This also
> > +      * avoids detecting end of frame conditions at FID toggling if the
> > +      * previous payload had the EOF bit set.
> > +      */
> > +     if (fid != stream->last_fid && buf && buf->bytesused != 0) {
> > +             uvc_dbg(stream->dev, FRAME,
> > +                     "Frame complete (FID bit toggled)\n");
> > +             buf->state = UVC_BUF_STATE_READY;
> > +
> > +             return -EAGAIN;
> > +     }
> > +
> > +     /*
> > +      * Some cameras, when running two parallel streams (one MJPEG alongside
> > +      * another non-MJPEG stream), are known to lose the EOF packet for a frame.
> > +      * We can detect the end of a frame by checking for a new SOI marker, as
> > +      * the SOI always lies on the packet boundary between two frames for
> > +      * these devices.
> > +      */
> > +     if (stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF &&
> > +         (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
> > +         stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
> > +             const u8 *packet = data + header_len;
> > +
> > +             if (len >= header_len + 2 &&
> > +                 packet[0] == 0xff && packet[1] == JPEG_MARKER_SOI &&
> > +                 buf && buf->bytesused != 0) {
>
> How about moving the buf && buf->bytesused != 0 to the outer condition,
> so that we don't inspect the packet when we don't need to ? It will also
> make the two end of frame detection blocks more similar.

SGTM. I will change this locally and upload it after someone reviews
2/2 to avoid bloating the list


Thanks!
>
> The patch otherwise looks fine, I don't see anything below this code
> that would need to be performed before.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > +                     buf->state = UVC_BUF_STATE_READY;
> > +                     buf->error = 1;
> > +                     stream->last_fid ^= UVC_STREAM_FID;
> > +                     return -EAGAIN;
> > +             }
> > +     }
> > +
> >       /*
> >        * Increase the sequence number regardless of any buffer states, so
> >        * that discontinuous sequence numbers always indicate lost frames.
> > @@ -1224,51 +1271,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >               buf->state = UVC_BUF_STATE_ACTIVE;
> >       }
> >
> > -     /*
> > -      * Mark the buffer as done if we're at the beginning of a new frame.
> > -      * End of frame detection is better implemented by checking the EOF
> > -      * bit (FID bit toggling is delayed by one frame compared to the EOF
> > -      * bit), but some devices don't set the bit at end of frame (and the
> > -      * last payload can be lost anyway). We thus must check if the FID has
> > -      * been toggled.
> > -      *
> > -      * stream->last_fid is initialized to -1, so the first isochronous
> > -      * frame will never trigger an end of frame detection.
> > -      *
> > -      * Empty buffers (bytesused == 0) don't trigger end of frame detection
> > -      * as it doesn't make sense to return an empty buffer. This also
> > -      * avoids detecting end of frame conditions at FID toggling if the
> > -      * previous payload had the EOF bit set.
> > -      */
> > -     if (fid != stream->last_fid && buf->bytesused != 0) {
> > -             uvc_dbg(stream->dev, FRAME,
> > -                     "Frame complete (FID bit toggled)\n");
> > -             buf->state = UVC_BUF_STATE_READY;
> > -             return -EAGAIN;
> > -     }
> > -
> > -     /*
> > -      * Some cameras, when running two parallel streams (one MJPEG alongside
> > -      * another non-MJPEG stream), are known to lose the EOF packet for a frame.
> > -      * We can detect the end of a frame by checking for a new SOI marker, as
> > -      * the SOI always lies on the packet boundary between two frames for
> > -      * these devices.
> > -      */
> > -     if (stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF &&
> > -         (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
> > -         stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
> > -             const u8 *packet = data + header_len;
> > -
> > -             if (len >= header_len + 2 &&
> > -                 packet[0] == 0xff && packet[1] == JPEG_MARKER_SOI &&
> > -                 buf->bytesused != 0) {
> > -                     buf->state = UVC_BUF_STATE_READY;
> > -                     buf->error = 1;
> > -                     stream->last_fid ^= UVC_STREAM_FID;
> > -                     return -EAGAIN;
> > -             }
> > -     }
> > -
> >       stream->last_fid = fid;
> >
> >       return header_len;
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

