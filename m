Return-Path: <linux-media+bounces-56571-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONgKK6KhvWkM/wIAu9opvQ
	(envelope-from <linux-media+bounces-56571-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 20:36:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 562272E0182
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 20:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D74B430330C6
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B243D34AA;
	Fri, 20 Mar 2026 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IZs9vDNC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3542034EF06
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 19:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774034995; cv=none; b=tzvRVqGto47zPEKd705f4gVj7ppwEJMMK/SsHNGxJ2ev48sH9J+28rm/cqNB1HULjLjshvoM8JR7WINDM9oM8x69B5gP4cgiqNk9y4eP/x4gNVNQBP1VdKAE57tUCr1FpG/0HMUigy0LfdVBTBe4vyzupvhFYOG7TTnHuYdvUGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774034995; c=relaxed/simple;
	bh=zoe2VP16sWo8SYvTzbtx+f7bYakzlAlUXhbpaU72QSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cppFqblT1QELnt0NxztdguBDsEyBiqIiyPtVWMtih33yybKu4q1T+nYnSPq+fKCygeEt59GUIxZU7YAxnS0CWmKwdk9jw6gzzTF15Oo2DPVbgTKSIkKgc7WZRwczQaiky+m7LtYF0zJU0jejkkgqfU97o/FkNjEGjNYRidgR33s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IZs9vDNC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b98133bdc4bso275740866b.0
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 12:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774034992; x=1774639792; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=04Wk3drV6NiQT7qqBZ6t9A9/Hnh58UpNVelZ74cDbWk=;
        b=IZs9vDNCzcozJOqbI2Yyjkgi7+9Rnj7ODZXQkW7n8nTWXRFSnLviyT/SuxPzSFd+H/
         22KW/mvndkNmQh43sQgYaw7C2n1qA30gnW6MDIdmdDTUGgmpa4zy4zAMqI2GfmIqYVQ+
         GPF55zordpaIEoOqOX4V+MP3Ez8S9dnV76gKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774034992; x=1774639792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04Wk3drV6NiQT7qqBZ6t9A9/Hnh58UpNVelZ74cDbWk=;
        b=oLBHOGvZ/kYrSKPYkkmxFnsWPzp2YH1ejCnwKudjWXsGWBE/TN8tcaI43JXb+QkCpE
         gEbg2u3PO4giosUUMvnuG+esFymd+UMbUypOW9Rqju4sx2mAfRi1lJzJqoGnu5GhIQp4
         LVEfuZUvfKMD2l7ZGA1MKRrrLp/q/WvQVJgNksY5OdWpV070370wLsBxerC3KoFnbskU
         7cCrMXHA5s5jySQD/hwAaEVjcbRm0zBqbrI98XNA8zvVUfmvcLy89WxgJXOsL89mDKWo
         7icfmqhLoLYKPMBEumG7GIrN/64NLIZuzmSLaqNad/OWtI91+JxVtN9ivJ0jk6RrGZxW
         D8OA==
X-Gm-Message-State: AOJu0Yz0iU1WfccSEog+1COfPi/b1jpOyBEpPoOJ0QA+P1vybJv0Iym2
	Zf1nAR9pn/EOeUNX907vj6tTdw1ihtCMe4jb/RW9FowIFDsnpzyCyLUkvLjNHPBeAC8cpf2BgH/
	1e6KWIOcq
X-Gm-Gg: ATEYQzw7+b+in8Dibrark1kSX+ri60u3MBOYyQQ26DPlQHZudQ+LBDTCkHnxvRW3e6I
	a7ccRDXG0Lq+Vrz7kOJSDXWVbwQc1QXkMusD1V4WNkPXBPgneUGnz+s+OdHJ5EVSQhKmwAMKzYD
	bdcKy3bgnX8m6WbQ+8s6hApTdu6Sjm26eaeeerT+4CcTksggxiZmlFxh85buFQlZdMr4xDduDCu
	rmrbbqXsoX44aEL0gPgASq0MjJmRD866/TkcMKIiQ7PIRKIiD7oK4Py83a5aggmit9WpbZfyllz
	NJOOt8OxrtGUJYWOOW9UUyGlApBkBTUX2kX8qEJqBksBqJPQ5znKmCNyYkuNArGzal7Pft22S8J
	RYFOzKd2mw8fY5f4Ctil/0oRIeSOUZM4Dgkw3KU9le+ccUcgOT+L5uD1bbh5fNXtoPqczO1Y6sC
	6+ScYbCJiBC27nPvSAmc0hEtwOo5vFzEtkloQMo1EuDhnh1VF3vG4loy83aKnO
X-Received: by 2002:a17:907:266a:b0:b97:554:f108 with SMTP id a640c23a62f3a-b982f3d7ee5mr207942666b.54.1774034992024;
        Fri, 20 Mar 2026 12:29:52 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f42c8fsm181203266b.9.2026.03.20.12.29.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 12:29:50 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b936331786dso235744766b.3
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 12:29:50 -0700 (PDT)
X-Received: by 2002:a17:906:e17:b0:b93:94b9:26fe with SMTP id
 a640c23a62f3a-b982f3a5c56mr275432766b.52.1774034989359; Fri, 20 Mar 2026
 12:29:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320-uvc-fid-v4-0-f24f168ca2f9@chromium.org> <20260320-uvc-fid-v4-2-f24f168ca2f9@chromium.org>
In-Reply-To: <20260320-uvc-fid-v4-2-f24f168ca2f9@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 20 Mar 2026 20:29:37 +0100
X-Gmail-Original-Message-ID: <CANiDSCsOPqxHT23hMGDRw5C03QNVofgSv0qS+63vibP23qCd0Q@mail.gmail.com>
X-Gm-Features: AaiRm52zYUW-PAi7nuamof1lDsLYOqigR6gS3SiNuNrmj9CfIDIttQHRuoYTVZw
Message-ID: <CANiDSCsOPqxHT23hMGDRw5C03QNVofgSv0qS+63vibP23qCd0Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: uvcvideo: Fix sequence number when no EOF
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yunke Cao <yunkec@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56571-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 562272E0182
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 20 Mar 2026 at 14:35, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> If the driver could not detect the EOF, the sequence number is increased
> twice:
>  1) When we enter uvc_video_decode_start() with the old buffer and FID has
>    fliped => We return -EAGAIN and last_fid is not flipped
>  2) When we enter uvc_video_decode_start() with the new buffer.
>
> Fix this issue by moving the new frame detection logic earlier in
> uvc_video_decode_start().
>
> Cc: stable@kernel.org
> Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
> Reported-by: Hans de Goede <hansg@kernel.org>
> Closes: https://lore.kernel.org/linux-media/CANiDSCuj4cPuB5_v2xyvAagA5FjoN8V5scXiFFOeD3aKDMqkCg@mail.gmail.com/T/#me39fb134e8c2c085567a31548c3403eb639625e4
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 48 ++++++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 9e06b1d0f0f9..2218e4d8e564 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1168,6 +1168,31 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>         header_len = data[0];
>         fid = data[1] & UVC_STREAM_FID;
>
> +       /*
> +        * Mark the buffer as done if we're at the beginning of a new frame.
> +        * End of frame detection is better implemented by checking the EOF
> +        * bit (FID bit toggling is delayed by one frame compared to the EOF
> +        * bit), but some devices don't set the bit at end of frame (and the
> +        * last payload can be lost anyway). We thus must check if the FID has
> +        * been toggled.
> +        *
> +        * stream->last_fid is initialized to -1, so the first isochronous
> +        * frame will never trigger an end of frame detection.
> +        *
> +        * Empty buffers (bytesused == 0) don't trigger end of frame detection
> +        * as it doesn't make sense to return an empty buffer. This also
> +        * avoids detecting end of frame conditions at FID toggling if the
> +        * previous payload had the EOF bit set.
> +        */
> +       if (stream->last_fid != -1 && fid != stream->last_fid &&
> +           buf && buf->bytesused != 0) {

This should be
if (stream->last_fid != (u8) -1 && fid != stream->last_fid &&
    buf && buf->bytesused != 0) {


I will wait a bit for more comments before sending a v5

Have a good weekend

> +               uvc_dbg(stream->dev, FRAME,
> +                       "Frame complete (FID bit toggled)\n");
> +               buf->state = UVC_BUF_STATE_READY;
> +
> +               return -EAGAIN;
> +       }
> +
>         /*
>          * Increase the sequence number regardless of any buffer states, so
>          * that discontinuous sequence numbers always indicate lost frames.
> @@ -1234,29 +1259,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>                 buf->state = UVC_BUF_STATE_ACTIVE;
>         }
>
> -       /*
> -        * Mark the buffer as done if we're at the beginning of a new frame.
> -        * End of frame detection is better implemented by checking the EOF
> -        * bit (FID bit toggling is delayed by one frame compared to the EOF
> -        * bit), but some devices don't set the bit at end of frame (and the
> -        * last payload can be lost anyway). We thus must check if the FID has
> -        * been toggled.
> -        *
> -        * stream->last_fid is initialized to -1, so the first isochronous
> -        * frame will never trigger an end of frame detection.
> -        *
> -        * Empty buffers (bytesused == 0) don't trigger end of frame detection
> -        * as it doesn't make sense to return an empty buffer. This also
> -        * avoids detecting end of frame conditions at FID toggling if the
> -        * previous payload had the EOF bit set.
> -        */
> -       if (fid != stream->last_fid && buf->bytesused != 0) {
> -               uvc_dbg(stream->dev, FRAME,
> -                       "Frame complete (FID bit toggled)\n");
> -               buf->state = UVC_BUF_STATE_READY;
> -               return -EAGAIN;
> -       }
> -
>         /*
>          * Some cameras, when running two parallel streams (one MJPEG alongside
>          * another non-MJPEG stream), are known to lose the EOF packet for a frame.
>
> --
> 2.53.0.959.g497ff81fa9-goog
>


-- 
Ricardo Ribalda

