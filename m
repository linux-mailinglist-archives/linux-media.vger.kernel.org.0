Return-Path: <linux-media+bounces-61251-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKNMB8cfA2r10gEAu9opvQ
	(envelope-from <linux-media+bounces-61251-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:40:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 771ED520532
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 790C430FA006
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 12:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3823F30675F;
	Tue, 12 May 2026 12:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ALbgyGeK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D92D38886E
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589179; cv=none; b=S5YmaNJ7SW2eslGOq7WxQKHCIJTGQuaqFob/C8C1iOVb4JGQwBEDcxtAqap070PafM+7XWp5eg7gTP2j1PHIUqNAR9cdtw2GAsT3H9dSemO13dZx+TDmWxJ7rBS+dzvg2LoJ+2BC4h89VX+CY+AyA8Ho6hFGUZk+Sv/iKHDP+44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589179; c=relaxed/simple;
	bh=teztWQ3tyu/QL6R+4LPqgIrMxMqERk7ouuyPdyCvRx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cges+W5gWKTomEMD8dAVYK+NLKF/+ZeVNJcWlogCmZ4vLZZfQkMouEfiSPAkZ0cqaRubTpuOpP7DI4DTwYQ7Ws8nhAbWHZezPJKekTIUYjWqfknWL9a9Z31TX/Ue1iV5ojn7bpBGg0lI+e42kn4ZG9Hld0CCiEbS4s2Sw6sFv/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ALbgyGeK; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so8815618a12.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 05:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778589171; x=1779193971; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rFAo0Ehn3CGLLKd1DJCeX4v4j29k07PNf7cuUfDfabc=;
        b=ALbgyGeK8FzqiwPZY7nv2t3doqACZB8gFvVLhr8p30F3ri8mdCl5XteGnIVWus6Hch
         KeFldBDFm7TSEkP13uDxuOBGJv42oHaR5JS3hrQRWhKjnPAXTzCwlk0oFE6zAyWaeJjb
         4yoVl8Aow7XVzP4L9RFDrxfpQBbLw7sZbNkzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778589171; x=1779193971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFAo0Ehn3CGLLKd1DJCeX4v4j29k07PNf7cuUfDfabc=;
        b=m7VrbvFrtR9ODjTSgNWAJa9qrVqF3fvw7JJ88m+er9vfI61uLhGvW3+x85Ixn5ixRa
         NXQL+0DTjSvkK60lOXH/PcMsLCF+F89yDZf9H2reKMWzWQvgjy2T+W9vbTsap2zmxbMR
         och819lFLQfy+GXzcB3jJcWBV0JpUXQX8KazSHQ07X4/2cstkSE1u67mz5qx32ZmRWdL
         Q7+et4U4qYebV0WO6L9B1RUa2A2SxPGCXk/+WDYPWjEfgYx459RGTcnPP1n9vW6NJEyW
         2LSNwHqCJVyOwZ+ddfkWayZTvwJsrB9yaMEmNQMsYAp65zosX8gPK5GWQFoSOBpft3nE
         uclQ==
X-Gm-Message-State: AOJu0YwYD09K023qEO6mDR2UCbsOdv09Gw3gdEZNL6V6i7N+O3uA7LF1
	dHTqPTqS4+ipPRlJ5xx0538IHP+WOenLqUBHnkJ1DLxaZdqTd56GDWERp5j+4YtW1WVAc3m0j/H
	jCBKv7g+a
X-Gm-Gg: Acq92OHfwtXOEyjZcLdvk1pdYl0XCdkJ3FmEv8SRXp8inqFvGsSKMRKd/WJ6JT4tajw
	ok3QebzB4ArEMzYL8B/UbzFY7EBjjSjy3e4OZQGpnzmY0dBZj+AoOO8/s49wQQajhQaPsdHUJ7e
	aZwgpSgdhIApOZ9KvOotVxV9I/dOZ5ybG7/8dXsL9CusjQS9pVqhRFzWiiUqB1/wkJIpHflWpoH
	GI2j6Xv6RWLBT2mTIzJeYLaMKuN+yndiBcvoppD8AS9PlLT4T9PHQfm1lNd6z99FIdHRC8DHwRj
	12ke+n3efbn6aH0J51X/p6AdBVTPHxyKpH77EAOtujXh4ZrQ1Lw1JrgjJE0UZubocybTyD/cTBR
	ShS2RXB+qPkKkhjM7ARc9q0O4qb2hNvBpoiptpl88sFK359qMek5qqOohKWtZOK1rDhvIz+wWW9
	OU9D7U193nu77p9/YlKyIqme1duuu/6i9tUVg1eowCvCkX/kXDlowrn+R7YZxF
X-Received: by 2002:a05:6402:5d2:b0:67e:9e04:31d0 with SMTP id 4fb4d7f45d1cf-67e9e0432famr10215574a12.23.1778589170607;
        Tue, 12 May 2026 05:32:50 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0dfcfdasm5008372a12.18.2026.05.12.05.32.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 05:32:48 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9d9971d059so802638966b.2
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 05:32:48 -0700 (PDT)
X-Received: by 2002:a17:907:3e8c:b0:bcc:3dd8:58da with SMTP id
 a640c23a62f3a-bcc3dd85929mr720905366b.27.1778589166878; Tue, 12 May 2026
 05:32:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-uvc-hwtimestamp-v2-0-3c2905c733bb@chromium.org> <20260512-uvc-hwtimestamp-v2-5-3c2905c733bb@chromium.org>
In-Reply-To: <20260512-uvc-hwtimestamp-v2-5-3c2905c733bb@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 12 May 2026 14:32:34 +0200
X-Gmail-Original-Message-ID: <CANiDSCtYaMGC53SvuMPtuVS1ZJV=x5_jqz+z2G--oyMWbY1oxQ@mail.gmail.com>
X-Gm-Features: AVHnY4JMqYjG4zcAlAZmemF32M_EXzwzgb7jARLDdDzr0HfdyPQzR9DEXcg28T0
Message-ID: <CANiDSCtYaMGC53SvuMPtuVS1ZJV=x5_jqz+z2G--oyMWbY1oxQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] media: uvcvideo: clock: Do not run expensive code
 if not needed
To: Yunke Cao <yunkec@google.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 771ED520532
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
	TAGGED_FROM(0.00)[bounces-61251-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,ideasonboard.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Yunke

Could you also test this new patch?

Thanks!

On Tue, 12 May 2026 at 14:31, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> We only save relevant samples into the circular buffer.
>
> If the data is very similar to the previous one, exit early.
>
> If the data is not going to be added, do not calculate the wall time.
>
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 20 ++++++++++++++------
>  drivers/media/usb/uvc/uvcvideo.h  |  3 ++-
>  2 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 8d0fd7003c62..ea8a76f57963 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -524,7 +524,7 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
>
>         spin_lock_irqsave(&clock->lock, flags);
>
> -       if (clock->count > 0 && clock->last_sof > sample->dev_sof) {
> +       if (clock->count > 0 && clock->last_sof_processed > sample->dev_sof) {
>                 /*
>                  * Remove data from the circular buffer that is older than the
>                  * last SOF overflow. We only support one SOF overflow per
> @@ -606,6 +606,12 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>         sample.dev_sof = get_unaligned_le16(&data[header_size - 2]);
>         sample.dev_stc = get_unaligned_le32(&data[header_size - 6]);
>
> +       /* If the sample sof is very similar to the previous one quit early. */
> +       if (stream->clock.last_sof_raw == sample.dev_sof)
> +               return;
> +
> +       stream->clock.last_sof_raw = sample.dev_sof;
> +
>         /*
>          * STC (Source Time Clock) is the clock used by the camera. The UVC 1.5
>          * standard states that it "must be captured when the first video data
> @@ -644,8 +650,6 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>         if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
>                 sample.dev_sof = sample.host_sof;
>
> -       sample.host_time = uvc_video_get_time();
> -
>         /*
>          * The UVC specification allows device implementations that can't obtain
>          * the USB frame number to keep their own frame counters as long as they
> @@ -682,19 +686,23 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>          * all the data packets of the same frame contains the same SOF. In that
>          * case only the first one will match the host_sof.
>          */
> -       if (sof_diff(sample.dev_sof, stream->clock.last_sof) <=
> +       if (sof_diff(sample.dev_sof, stream->clock.last_sof_processed) <=
>             (UVC_MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
>                 return;
>
> +       /* This is expensive, only do it if needed */
> +       sample.host_time = uvc_video_get_time();
> +
>         uvc_video_clock_add_sample(&stream->clock, &sample);
> -       stream->clock.last_sof = sample.dev_sof;
> +       stream->clock.last_sof_processed = sample.dev_sof;
>  }
>
>  static void uvc_video_clock_reset(struct uvc_clock *clock)
>  {
>         clock->head = 0;
>         clock->count = 0;
> -       clock->last_sof = -1;
> +       clock->last_sof_processed = -1;
> +       clock->last_sof_raw = -1;
>         clock->last_sof_overflow = -1;
>         clock->sof_offset = -1;
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 0a0c01b2420f..7b8477e5a0ba 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -522,7 +522,8 @@ struct uvc_streaming {
>                 unsigned int size;
>                 unsigned int last_sof_overflow;
>
> -               u16 last_sof;
> +               u16 last_sof_processed;
> +               u16 last_sof_raw;
>                 u16 sof_offset;
>
>                 u8 last_scr[6];
>
> --
> 2.54.0.563.g4f69b47b94-goog
>


-- 
Ricardo Ribalda

