Return-Path: <linux-media+bounces-61411-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFRsJ69mBGpVIAIAu9opvQ
	(envelope-from <linux-media+bounces-61411-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:55:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A375329E2
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 820D030E8FF8
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3668A3FFAA4;
	Wed, 13 May 2026 11:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IAcCDMU6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1073A3A16BE
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673082; cv=none; b=mHSKqi174CclJBCUdrftH6dowzyFl9mFNbKWaNN56Gd57FttEzbD17IOIg7OpeKKjMlzu1amKXH9pJvaUe6z3asotY4o6szgIn1Pvm4F+0/NbfbpvW+Hshw42gohkB3dx9CM9Yzs/bCdBl5QGLkpt5M5nbUEzmKh7vH8GsHjn98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673082; c=relaxed/simple;
	bh=75TUQIZkypLwoR8DRfvoyh1YFztZQAcIa1BmTtogMjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hcU6n0zoDQ4BM8Xf1H3kn8g1zp8JMDEQp3PLC5wanYlxfjPYWpi4myHBGkFWCOrryO/jiBSCJU6X1Ry6TU8uRZnBOHQQC/RyQjoIMCDEoYwEZteserICOCOv2bit9YFAxPIp7dltXE1xZBpmxuyezHY8a+/FbL1jekxQi280UN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IAcCDMU6; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so10664234a12.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 04:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778673079; x=1779277879; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y32yEFiYyRsO7dPNCj0L6p2gfndeIIlW5kAPWaEhJ1w=;
        b=IAcCDMU6ldVuBVe9v73U5cXk+5Cy6bxlflIF+4uVtUQNUqsigIUy+Sie8f5EISROXY
         +vgfUAZS+d1pHipApfBYWOxvA+XUREc/l3MKHd1NZQ1+422YqjFhUFRxQIv5IAeD8n6U
         647T44+xwi9hAaDk3WnebunfNLXfl1i0nYh1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673079; x=1779277879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y32yEFiYyRsO7dPNCj0L6p2gfndeIIlW5kAPWaEhJ1w=;
        b=WnsoXSZZMLsrwbS88NVdcgw4rvxzqpfg+tmhL8HKD9AA+1fYEqxvz/mEVGJlOO3k4D
         LvNu+Oej87Zr295Y0fl2uIV0/LeQvkjFwrnZ6F42jxsyl7NHHhozgyzcDhj1wwY5GiCD
         bg+HhtvYFMRpbFoft709tVFE/F+OWc66qVWEUpJfKAU+lIWQZOaCIKN9JJMjTD/Zyotr
         zyo7vOewNWyMCLdUUgSuD094IBNTE2qva+sUdZk2S9zzTsSHiAIRcB7I5Jn+CFWvPj0k
         A7a6RfDGkTx3BRxIUxaxLSxdLNbfb83/l5rXvl6vsXjcgh8be1d0DFe7D91tJHPxowkS
         Zo8g==
X-Forwarded-Encrypted: i=1; AFNElJ+ANP8iBk3OdhYuJCMwsZRyjN/yp3AfTNme0Ym7dQTcE3kFrQUdtEfFMWzocIyIUPcZnEpc+EVMMBOQbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmvqT9jHDQOMoHxoCQuWhtg2OFaXz7BnedT8525ZDVKocB67w5
	5gzGBxIGpX6RjmgoOuFvDu78xbHri+hpIavYrYuGStQlemrekbIfLrKkQMRuccLq8BP7IanwWIp
	5WrO/mk4P
X-Gm-Gg: Acq92OFOk0L7o3/MNIkC6anAEw5bpeNnHKjVRLI6ce6wo+/ePdPNqe7Yb9MzG0Y5aN+
	2p7qk6dLCEgLxifuO4E47qA4AY/KMST1sl3R+aIddaNQzzvUFwWuE2O6d6p76mzyFRFtZmjftsw
	XpybWj76xYe9j80A8S5qESx8xgh/JQrzcBE7JVc8PyGc2FR1u9DZh+ZZucKlJUxF9hfbDSXFMo5
	BvB6ZF5ytsVVOMlCymKWnkLSkSMKjUWUrIGmH77iO0Qlc4RVx4MQJEI9NwfJhaB83Rh7mZdo10V
	6pJA63nHIbHLLv/JpZ1IYUeu7IHUMVPBnPAO4pkdt90kmPHmcBj71BobramKgmmvfYxBfueW+cn
	tGK96gtvCZGHwmeyZLx72YKot1nRNM3ZsywgRWU7uHxSKW/IWPlik+ttiiFXROn5jwYR8OOKeDM
	pqPYtz7pLEdi6CIJZ3qDSOEzcde/CaOvaL4HLUSL/Xhwx+FDYN/q8UKHeH57kdmzDkK7lZv14=
X-Received: by 2002:a05:6402:4344:b0:674:b355:555e with SMTP id 4fb4d7f45d1cf-682a761179cmr1153595a12.17.1778673079433;
        Wed, 13 May 2026 04:51:19 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b8a939sm6198302a12.13.2026.05.13.04.51.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 04:51:16 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bd22b2abaa4so358694066b.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 04:51:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8fYL4Ie83vk2L8NIgJJ97oOASimyxzv/mDcMZHNEUZpuvS1Ml0ukmPFlfDPk7py/p1YTALnJxSCDTBZw==@vger.kernel.org
X-Received: by 2002:a17:907:97c2:b0:b9d:6d06:b78a with SMTP id
 a640c23a62f3a-bd3e025e2fcmr150312066b.17.1778673075122; Wed, 13 May 2026
 04:51:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org> <20260513-uvc-hwtimestamp-v3-4-7a64838b0b02@chromium.org>
In-Reply-To: <20260513-uvc-hwtimestamp-v3-4-7a64838b0b02@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 13 May 2026 13:51:02 +0200
X-Gmail-Original-Message-ID: <CANiDSCu4fjMpgwbdEq+_Uw=nRGya3Fu6aM0A9N14JLsJauk9fQ@mail.gmail.com>
X-Gm-Features: AVHnY4Lgx11bR8Or1Dxd2VZsKqsoBhl7G-pzaH-gTXE-qB6RaCPEhsNcduKIk6U
Message-ID: <CANiDSCu4fjMpgwbdEq+_Uw=nRGya3Fu6aM0A9N14JLsJauk9fQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] media: uvcvideo: Do not add clock samples with
 small sof delta
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: F0A375329E2
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
	TAGGED_FROM(0.00)[bounces-61411-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,chromium.org:email,chromium.org:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Hans

On Wed, 13 May 2026 at 13:49, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Some UVC 1.1 cameras running in fast isochronous mode tend to spam the
> USB host with a lot of empty packets. These packets contain clock
> information and are added to the clock buffer but do not add any
> accuracy to the calculation. In fact, it is quite the opposite, in our
> calculations, only the first and the last timestamp is used, and we only
> have 32 slots.
>
> Ignore the samples that will produce less than MIN_HW_TIMESTAMP_DIFF
> data.
>
> Fixes: 141270bd95d4 ("media: uvcvideo: Refactor clock circular buffer")
> Cc: stable@vger.kernel.org
> Tested-by: Yunke Cao <yunkec@google.com>
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 355b9bfb799e..63850b779e24 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -544,6 +544,15 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
>         spin_unlock_irqrestore(&clock->lock, flags);
>  }
>
> +static inline u16 sof_diff(u16 a, u16 b)
> +{
> +       /*
> +        * Because the result is modulo 2048 (via & 2047), we do not need a
> +        * special case for a < b.
> +        */
> +       return (a - b) & 2047;
> +}
I have modified this function but kept your R-b. Hope that it is fine.

Thanks!


> +
>  static void
>  uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>                        const u8 *data, int len)
> @@ -664,12 +673,13 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>         sample.dev_sof = (sample.dev_sof + stream->clock.sof_offset) & 2047;
>
>         /*
> -        * To limit the amount of data, drop SCRs with an SOF identical to the
> +        * To limit the amount of data, drop SCRs with an SOF similar to the
>          * previous one. This filtering is also needed to support UVC 1.5, where
>          * all the data packets of the same frame contains the same SOF. In that
>          * case only the first one will match the host_sof.
>          */
> -       if (sample.dev_sof == stream->clock.last_sof)
> +       if (sof_diff(sample.dev_sof, stream->clock.last_sof) <=
> +           (UVC_MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
>                 return;
>
>         uvc_video_clock_add_sample(&stream->clock, &sample);
>
> --
> 2.54.0.563.g4f69b47b94-goog
>


-- 
Ricardo Ribalda

