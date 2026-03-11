Return-Path: <linux-media+bounces-55426-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLF3LR6TsWnkDAAAu9opvQ
	(envelope-from <linux-media+bounces-55426-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 17:06:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5B0266F8D
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 17:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 71A8D3013C59
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 16:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB083DB63A;
	Wed, 11 Mar 2026 16:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J8mVieeP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4693D890D
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 16:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245199; cv=none; b=j0GLghkQCfv167zkLk2jsbUSFY8Tu7E7gruk72tuAMDb6U/vC8zELimhFZprFM3rcn91BaCWZOYN8CaArACpBQsNstrnOLuNLGSdp8Aj6J8Qy3wNDvwDYNhqvZdK7flaXhY3OpvsyLABA1ziqwceRkyNf987i/Su06KUeOeh3dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245199; c=relaxed/simple;
	bh=4vT7MT7O8oJTf36VsH2x1epVJ0r/6HuLLWzr+zgJjNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KS1w23m+UyquMXUu7eCAFfgx55HKkgtW89Yx20jeGYoAkCsXy+vbDfTNPsPqBYUq3i4mhcLNjJPq4GOlQrX1m4wu1a0l15r3ZngLPd2a4WG8cBGCKSYf78i7uoau2AQgcz9yukDlJixIpNDzylywaDIWYdF++fNlSYFaZEi6zD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J8mVieeP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b886fc047d5so2337283866b.3
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 09:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773245196; x=1773849996; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnfOE2A/E/AH+F9/oECUQgfQ0CNn4XyNCPDDZQC8IpQ=;
        b=J8mVieePzbJJVxOJTukalUek6qcmZ/GFuA4ZejcdxrsSnyBTEqJpEQaUFg8LyFvC83
         HkbXXZn9mmXAro8sd7Lghlor0a6djTiWEEbATgFlxAXobkyobks6SpMfbdkfYig/II6z
         5sEDObTUdW7wSdpCsQwwGCV/hcE1+Hdb0zhPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245196; x=1773849996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnfOE2A/E/AH+F9/oECUQgfQ0CNn4XyNCPDDZQC8IpQ=;
        b=rI1pmMyXBxOQOilerChPcUGqU3rtFp821RuB7Qttmp1eN92/hVruQPIOlSWSR3f31B
         AEoBaf1EPjaKf8rDF1u8KNlrB+FcfcFb7lL5xqHCEYf9F6WoI6OyJLJx7+KarT0xvmSb
         elwXFoCNC09J8Kzxh6TbVepj12Y9JfVbzVFxPUHXesdtp9sXmW4fJMDSZqK8DOkXIOxU
         11ZW4lkAouooW8549Ba7cKU5f4m+UoEx4NnMxyJzcXu2kh+uQYSZnv2YFuf0scpxTBNs
         gpdtbv/M1LLt3sjZpTDukqeE7HdG3Fcsyk+jWEtXwX+Cpk5Y63o80hsWw8QtsDlCOxLJ
         QKtg==
X-Forwarded-Encrypted: i=1; AJvYcCWREafE7jVOS4TuV0IEvVDpgUZJQzf/zfPY6gNhcZZNHvYzW56NLjPRYjWMA2eM0YfIHInpPBF4EWECjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyfTmK4rHoL3U5j4gtH6mJkt8bdu2PVZ6XHUMKpkxU0d9fra+O
	6kh16n2Lp3itw1aXXLCAVGTMm5daWOqE/xKYW7LNubxpkWrmxUPkLeHpeigoqVZnybLvEh3y997
	2NxZyNw==
X-Gm-Gg: ATEYQzx8EoyPyagmeXcgpxRMtrBPYBKRs6FzTKKXTuFTkJZKufTHj9BoixNrBNzyFrU
	1PRSyhenzrbddd2GB9B16X1auhvhrNnJOjrjzQp3sugn3KU/m6qxiJ+jjni9PKR16VNCE9hQRbO
	fGIus94otKvfsdjBVAAGA/3dLyTWii+lWn2Gdenlkwqd/nHC4e20FgRZNKQ4wX1NXvVJujWK5hs
	ZyrOCunHDqOWIYGoB2fTOI+Ao1LoEi3qQtG8hEluDqUSb+ZlzTM95jAvu+WD6W7W69kxhs1QhHU
	SrVzpxL5QvUDyZbQxVvkcEPAhmBDWuh1exCNnKLYk+wYUpmR7paEFRIKiZp6eA+h2ab7Sl/tzNi
	0YCG2XtbraYzdzDBAh4UoKxY7m8rCz7Z2N+genzB+8zZG2jBxjhaxM0izi/wiP3fd3kYiaNc+c5
	gZizZ/zT5NLH8KaZ2KzgZyi56M7MkEKz8g7qJuaDv5ImUNI+owlRosN3uJgH3/Ch3qWgTcevg=
X-Received: by 2002:a17:907:6e86:b0:b97:72d:673 with SMTP id a640c23a62f3a-b972e6527d7mr171094166b.59.1773245195360;
        Wed, 11 Mar 2026 09:06:35 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e1be0c7sm65270566b.62.2026.03.11.09.06.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 09:06:34 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b95c0fc928bso814201066b.0
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 09:06:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqqR5Ytb5vr3bFFj3f+q8+0dOb9Eq+vDg3OHFUiPbEEmvsnADWmk4KvJx0VxgV47dOafAFkfRcwhesBg==@vger.kernel.org
X-Received: by 2002:a17:907:6e86:b0:b97:72d:673 with SMTP id
 a640c23a62f3a-b972e6527d7mr171087066b.59.1773245193351; Wed, 11 Mar 2026
 09:06:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310222259.1202061-1-sean.anderson@linux.dev>
In-Reply-To: <20260310222259.1202061-1-sean.anderson@linux.dev>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 11 Mar 2026 17:06:20 +0100
X-Gmail-Original-Message-ID: <CANiDSCsa5mLGGarqKVgZ8aS1m6_7VSwT7ps1ZZwb9a8hk-kkQw@mail.gmail.com>
X-Gm-Features: AaiRm53_GOMRgJdqSyYDEgSYBIZ5slNPKeurzXvRW6pM1mFS5MksXQNuXf2f448
Message-ID: <CANiDSCsa5mLGGarqKVgZ8aS1m6_7VSwT7ps1ZZwb9a8hk-kkQw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix deadlock if uvc_status_stop is
 called from async_ctrl.work
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55426-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.dev:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AE5B0266F8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sean

Thanks for the patch. In your original report you mentioned that you
could repro with qv4l2 and changing a control.
May I assume that it was while the camera was not streaming and the
control was a "slow" controp (zoom, focus)... Can you give more some
more details?

I have tested your change with 3 threads running:

1 # while true; do yavta --capture=3 /dev/video0; sleep 1;done
2 #  while true; do yavta -w "0x00980900 64" /dev/video0; yavta -w
"0x00980900 0" /dev/video0; done
3 /sys/bus/usb/devices/3-6 # while true; do echo 1 > authorized; sleep
3; echo 0 > authorized; sleep 3 ; done

And I have not seen any freeze. So that is good :), But I also could
not repro without your patch :P.

Anyway I agree with the lockdep report that we introduced a bug when
uvc_status_stop can be called from the async work, So we must fix it.


On Tue, 10 Mar 2026 at 23:23, Sean Anderson <sean.anderson@linux.dev> wrote:
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
Tested-by: Ricardo Ribalda <ribalda@chromium.org>
Acked-by: Ricardo Ribalda <ribalda@chromium.org>

Your patch is very similar to what I sent some time ago (I did not
have the cancel_work_sync() in uvc_status_start())
You can see the old discussion:
https://lore.kernel.org/all/Y6sAO7URJpSIulye@pendragon.ideasonboard.com/

For now, I am only ack the patch because I want to ensure the locking
is working as expected and need to re-read the old threads.
It would be great if Hans or Laurent also take a look at this.

Thanks again


> Fixes: a32d9c41bdb8 ("media: uvcvideo: Make power management granular")
> Closes: https://lore.kernel.org/all/6733bdfb-3e88-479f-8956-ab09c04c433e@linux.dev/
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
>
>  drivers/media/usb/uvc/uvc_status.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 231cfee8e7c2c..2a23606c7f4c6 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -316,6 +316,14 @@ static int uvc_status_start(struct uvc_device *dev, gfp_t flags)
>         if (!dev->int_urb)
>                 return 0;
>
> +       /*
> +        * If the work called uvc_status_stop it may still be running. Wait for
> +        * it to finish before we submit the urb.
> +        */
> +       cancel_work_sync(&dev->async_ctrl.work);
> +
> +       /* Clear the flush status if we were previously stopped */
> +       smp_store_release(&dev->flush_status, false);
>         return usb_submit_urb(dev->int_urb, flags);
>  }
>
> @@ -336,6 +344,14 @@ static void uvc_status_stop(struct uvc_device *dev)
>          */
>         smp_store_release(&dev->flush_status, true);
>
> +       /*
> +        * We will deadlock if we are currently in the work function.
> +        * Fortunately, we know that the URB is already dead and that no
> +        * further work can be queued, so there's nothing left for us to do.
> +        */
> +       if (current_work() == &w->work)
> +               return;
> +
>         /*
>          * Cancel any pending asynchronous work. If any status event was queued,
>          * process it synchronously.
> @@ -354,15 +370,6 @@ static void uvc_status_stop(struct uvc_device *dev)
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

