Return-Path: <linux-media+bounces-56497-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AQwDuYQvWlf6QIAu9opvQ
	(envelope-from <linux-media+bounces-56497-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:18:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A66782D7E1C
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57BBF3050A06
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D14D348440;
	Fri, 20 Mar 2026 09:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YqZEuGhY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5394D31B839
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 09:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998277; cv=none; b=Amt7RBOGzqOJENbrusjRTISbqpThGd3gLt5nWrjoMtrp+3kltU117SybwnL3iSpXpiJsgUoEGrEsG3EFT04xZ+jCsQlfHzOJkvpE5pOcC5I7GSwwpuJXzyLtZC0muwhkwSUj9tEhHGxnZ/5MhdH8pf8FWZhKikuapNxTsJ2wg90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998277; c=relaxed/simple;
	bh=/r2gJrYxIerN6lNQDQFbRgwI+H9YsxeBL97pLqKoA3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nR8KBp4RdTN2BCtTAhOY+dwO4nbGCy0zmktjt3720MmYpiThdiLpamCt2STZHgT0cdWYR/BQbpjN+nu8F0KeuHNhZGp72mdP7IwbGnl1D9xusprIdGep2p+wZmgNEIVTz8RhMMtZf45ueu1869omc1vZ11fgbFAPUSO3+o8HmoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YqZEuGhY; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b97bca3797dso226742666b.0
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 02:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773998274; x=1774603074; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ysjOz6MT7roTJpJXV03GRi4Doh5/NLxbA23TLf4iWQg=;
        b=YqZEuGhYcEQx8epfsS84IMtz8kclNKoFFxO3K+jH4qd2KOUeC4YHd4m2h0CWhX/q8f
         /pBt0vwUQuGzvoDSJzAUfV3l3refyg/r9EsKLfK/JOyRaKQh3jtcXvuKxmAmKCT972RB
         EEkjLFtMH9Pkg6Pt17lywIHPexombL20nVXr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773998274; x=1774603074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysjOz6MT7roTJpJXV03GRi4Doh5/NLxbA23TLf4iWQg=;
        b=kvyTNQ5cAxJzwUByX+9WXdHRjHz5doPbJ63n9q3vDVoTstGypNwgKo8BKsmV7CfnxK
         vcI3DBxgcGYbx13TYLQ5eh5hbEh8FO6Orc5R6rR9qkWAno2d9LYavsxncQO4+5saoD1y
         LYwMdx6B61ly1PeE26yZXepDNBaWPKhH8f0T6XlssJV/is3CgjxyMuzXHIj/pex4xYll
         TCDpxzCB8g9a0U9su/nxUyT0ruO1Mjne4/4t+cGEqGI/uY4UiQJan/sKgYDw9KZYzc9r
         LG0+HSSCfh3n+4oUK3p5R/QgMh9+P6x/bwXblt9yml+6pijVzQkpkNlaV/9qMsnTwRiK
         tnBA==
X-Forwarded-Encrypted: i=1; AJvYcCVjRPfQKKR4N2NyCRZrMK7CrzceAE3hoTvQshLDsWvPJJVfopx62t1vp8ViVUaMZVEnyW2pPBJLcSbKWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyWK+Ew0n75EPb7cDTyITfTQtgaIG+yycnCtmYwGeA3NEznoRR
	Uy8/jfhBjc5WigNLQu3oOIX5Ph0iVJ59RWAFXOq61EbUdHbRHqjUN54AC+J34Rv1uDZVnnHzxjo
	UZjlD6eOE
X-Gm-Gg: ATEYQzy10ZwcvqD6XjghGtMzscG02+GNbg5E3ZC7UvDNSjlPbXcTnHntF3YJhYWMhSL
	4tDgzUOt3XBJf+CsXCT6/LV4FbG3NbkrsT5cjy62m8f749nnSfBWoSr4luw5RgucRwI1O15IHNW
	ymPREDXn0Sq2F0n0RTu0LqM4YPb6AWxWGHeyHvliGFk2KWdCW9icKFjhhtz+jE5GhWGD8Sfu/KV
	KFLaL+2p20qiY8CXH8Pa/1iAANkQU9vTjOLMvIYNq1/LvnL7lVhjrdtvJSsvXJX0IA1Fu4HCV5h
	tkttYR6DEpJKEkp9doXtnEOpz2qXAKdXlhjekfdk1un0uUXViiJtbj/wy1Il/gG0PyH/Q73fNcN
	Z1FIQnLV47fBBSJXBb9b2xORI2yh+04FnhGvZzA3csU89//W2VyYs2SlSkhxuNyhz4fb4oOLftp
	nJi6Q17QaepzdUvYrFGvmr9vS4RZ9LB3VdWuI+pY6yUjIQ2Vp7dzidJdfD0Fot
X-Received: by 2002:a17:907:3e8c:b0:b98:33c5:1bb9 with SMTP id a640c23a62f3a-b9833c56776mr129696366b.35.1773998274136;
        Fri, 20 Mar 2026 02:17:54 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8c177sm130590966b.15.2026.03.20.02.17.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 02:17:53 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-664f8bef4e7so2479541a12.3
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 02:17:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4/VZYc4RknOuYUuQpmDWWmRmNYhMq1ylp5pOL8zSttSJIcM37rhCfKsAWpEJi9n83KQoK9OA5/bIlvw==@vger.kernel.org
X-Received: by 2002:a17:907:8d8e:b0:b98:2c19:6c50 with SMTP id
 a640c23a62f3a-b982f0c7fbbmr156854166b.1.1773998272505; Fri, 20 Mar 2026
 02:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316155823.1855434-1-sean.anderson@linux.dev>
In-Reply-To: <20260316155823.1855434-1-sean.anderson@linux.dev>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 20 Mar 2026 10:17:39 +0100
X-Gmail-Original-Message-ID: <CANiDSCvHyfpL4gry+nWVmOtomKhsh9R6Nc=gGag1ePBaJxJhnQ@mail.gmail.com>
X-Gm-Features: AaiRm53HsuyQOxG0jid8CrUmCbVuFXUhebjU2VJbW6CeTnLRAo9g5cK5LckLi_g
Message-ID: <CANiDSCvHyfpL4gry+nWVmOtomKhsh9R6Nc=gGag1ePBaJxJhnQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Fix deadlock if uvc_status_stop is
 called from async_ctrl.work
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-56497-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email]
X-Rspamd-Queue-Id: A66782D7E1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sean

Thanks for the patch

On Mon, 16 Mar 2026 at 16:58, Sean Anderson <sean.anderson@linux.dev> wrote:
>
> If a UVC camera has an asynchronous control, uvc_status_stop may be
> called from async_ctrl.work:
>
> uvc_ctrl_status_event_work()
>     uvc_ctrl_status_event()
>         uvc_ctrl_clear_handle()
>             uvc_pm_put()
>                 uvc_status_put()
>                     uvc_status_stop()
>                         cancel_work_sync()
>
> This will cause a deadlock, since cancel_work_sync will wait for
> uvc_ctrl_status_event_work to complete before returning.
>
> Fix this by returning early from uvc_status_stop if we are currently in
> the work function. flush_status now remains false until uvc_status_start
> is called again, ensuring that uvc_ctrl_status_event_work won't resubmit
> the URB.
>
> Fixes: a32d9c41bdb8 ("media: uvcvideo: Make power management granular")
> Closes: https://lore.kernel.org/all/6733bdfb-3e88-479f-8956-ab09c04c433e@linux.dev/
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Tested-by: Ricardo Ribalda <ribalda@chromium.org> # Tested normal flow
with a camera with no delayed control, plus some device disconnect
enumation via authorized.
> ---
>
> Changes in v2:
> - Update comments with review feedback
> - Use flush_work instead of cancel_work_sync since the work should never
>   be rescheduled.
>
>  drivers/media/usb/uvc/uvc_status.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 231cfee8e7c2c..ea45b11642e59 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -316,6 +316,15 @@ static int uvc_status_start(struct uvc_device *dev, gfp_t flags)
>         if (!dev->int_urb)
>                 return 0;
>
> +       /*
> +        * If the work called uvc_status_stop it may still be running. Wait for
> +        * it to finish before we submit the urb.
> +        */
> +       flush_work(&dev->async_ctrl.work);
> +
> +       /* Clear the flush status if we were previously stopped. */
> +       smp_store_release(&dev->flush_status, false);
> +
>         return usb_submit_urb(dev->int_urb, flags);
>  }
>
> @@ -336,6 +345,15 @@ static void uvc_status_stop(struct uvc_device *dev)
>          */
>         smp_store_release(&dev->flush_status, true);
>
> +       /*
> +        * If we are called from the event work function, the URB is guaranteed
> +        * to not be in flight as it has completed and has not been resubmitted.
> +        * There's no need to cancel the work (which would deadlock), or to kill
> +        * the URB.
> +        */
> +       if (current_work() == &w->work)
> +               return;
> +
>         /*
>          * Cancel any pending asynchronous work. If any status event was queued,
>          * process it synchronously.
> @@ -354,15 +372,6 @@ static void uvc_status_stop(struct uvc_device *dev)
>          */
>         if (cancel_work_sync(&w->work))
>                 uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
> -
> -       /*
> -        * From this point, there are no events on the queue and the status URB
> -        * is dead. No events will be queued until uvc_status_start() is called.
> -        * The barrier is needed to make sure that flush_status is visible to
> -        * uvc_ctrl_status_event_work() when uvc_status_start() will be called
> -        * again.
> -        */
> -       smp_store_release(&dev->flush_status, false);
>  }
>
>  int uvc_status_resume(struct uvc_device *dev)
> --
> 2.35.1.1320.gc452695387.dirty
>


-- 
Ricardo Ribalda

