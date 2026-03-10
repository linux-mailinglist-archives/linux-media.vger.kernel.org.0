Return-Path: <linux-media+bounces-55263-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIKZB6+WsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55263-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:09:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9490C258BB3
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CE0331ADF65
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F5C3DE43B;
	Tue, 10 Mar 2026 22:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EtvotgDf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE36338D693
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180511; cv=none; b=ZDlwgSlES6PA+unhptJuKBRDvfBm7y4jRWZ+hnMDyVlbT0MU8Ku63ra8W7qd/5q6mNRCwZNcY9U1fsW1CB2BMCGLQ+CJO++TN1lMnNdEc/Ln4sCsgN4z+8osdCvfR6WhoYLSuSdyje3g40aSf/MNqbrTTsVkCwVUluEWZY5NdNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180511; c=relaxed/simple;
	bh=EkT3jVK1vb20RIv1qVCCL85jx8kkGbuMtERBRD038OA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EnETzuC/NP058AfpmP7epoaRIlqhOYRebhCY2PzTGEtVxwaaFNY6qecZN+0oFbrACstqiDaTuMtS2er/UwGVyZtCtiJ1Q0ob4PDfkn1FnS5FKos0Y1nIA69/R5Azsn6n3VQX6ZAKaB8WyzqdjvL/AloR+f00SpRbrECzXJ7V6xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EtvotgDf; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b941ec6a368so664739566b.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 15:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773180507; x=1773785307; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7T57TbUh1a9gPuEhl9gX+JZqR5FWHQ6K3iwhXdSBh1Y=;
        b=EtvotgDfEkRNVUDvQFZ1KnBnuWl9bV9ApZ5oSgYJE6S1RoY9boauLx5vpKxlZwhwn+
         0f6R1bkJGjimOwWOPlkzfUbHcNygR53g29nhAMmIH1uDYhTQxsmz+9Xee7nFC/voIlcC
         JDJWrhLzIDkaOBc364z9UDgnB78Oolqk475UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773180507; x=1773785307;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7T57TbUh1a9gPuEhl9gX+JZqR5FWHQ6K3iwhXdSBh1Y=;
        b=F2p1E+qaRvbAgCNlwh/EQ0Lpk/o9c80p48cBsEiMF0kpBCRVCMsru1LKoW+440gXN0
         uRnK+9/DlaITxgVpKfpfu+QNNNL1wjOaOAWBSGYWrCv0h1kTvvffL3VkgwjA075BkpiG
         OsWIKV7aKgr8wtk3RjGJP4AFz6ZtjvAoCbC238Sqc0xKCSDlUkRCSoFX4RCFUtqR4+p4
         s5gA77vsx4Q3pl4d3ZfkMVAHu8oqTagMmtcZZ+9JhajcQWOR16bWtafQzJJqa0zdjOXI
         xYDfL193f7KB/yg1kJoml0hKC+VegF3YODJJLpYpAaYRsJ3Yz7k1PA0o7nIOnNvggtf0
         L0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUmsukb/k1Fycv8ctZ5++rXWGh9hwGnXlbJvS9LfKJVuPwu4cKXr0u6Swi1qX7v+EAai/cPKfYY1P6IlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhNKpjLJBljYYzcmyI89SQVS3I6GEuFdEYCM16KChvWoOzCTnz
	C+PhZQvDchG6A+Marq/7OCOctrPx5UJWWKHBgX2n34klguxKFuQqqAB6qgDAKR2Ej1e+wkKpHxj
	pfEw0tlPG
X-Gm-Gg: ATEYQzySf7HVk/DgrLz1FvCVSXIZ5WCXGCGclZ2IUVFmlB3spE6Yu5ij8G3/sQA77tH
	woNfTH03aaliCNPYPkIrbdmdPVCv81VJUe3wvn3pTttGtF09BbxreAWfKJ2F/PmB4Us9D9oDzDm
	AXDKX6T373W1CT9pxstNFbDjg/9hvoW7XMVq9WqNTKfGHF3z23J7sZYAjdnEG19DFzqc/+Lywn5
	CZKjxBTpEFV1HQCCP5OBLner560aNJ/0vt5h+ivzwcaJ6IJQI6lfWkWB7DfYcc2aQavp2TgaBmu
	QJnv/5ngY3zhtqywV8p4/Z1zj/UYTJjLUpRYOAo/ikB9JRoeL2KzWUQt1bOohb5z1s3KZYyDAOR
	dBmGzSYs+xQNfOkwhCXlYR/K2SBjAJtis5nZphe3ciBwJdgoZeeAckM183+D8KV6sLq2q0CQqrn
	FMh6WIcBlT9hFK/3XGjw4a+RpqhHiTNN5EwsGowCI42tsRGC5ztlzJdmykIQmN
X-Received: by 2002:a17:907:e98b:b0:b96:f657:45ca with SMTP id a640c23a62f3a-b972e1b74dbmr10063266b.17.1773180506855;
        Tue, 10 Mar 2026 15:08:26 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de0bcc8sm6464466b.5.2026.03.10.15.08.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 15:08:26 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b96da7b2e2eso510832666b.2
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 15:08:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVShVzggicKLUeNrAJeoeho0ATTT7itpBXd6hMt4AhgnKZY7lkEieijGD2KEeJevcuXAw2iAlyjdA5lHA==@vger.kernel.org
X-Received: by 2002:a17:906:fe05:b0:b93:6bb6:cb3d with SMTP id
 a640c23a62f3a-b972e5db7damr7346366b.58.1773180504840; Tue, 10 Mar 2026
 15:08:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6733bdfb-3e88-479f-8956-ab09c04c433e@linux.dev>
 <fba86ac0-e13e-4c54-9515-c091b24f9f80@linux.dev> <CANiDSCtLj-N+M+JmP3C_y=vNtSy-UN7XtkXaZ=dLN6f0kd7rYg@mail.gmail.com>
 <d5793f17-61cf-42be-b2fe-7d1549310989@linux.dev>
In-Reply-To: <d5793f17-61cf-42be-b2fe-7d1549310989@linux.dev>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Mar 2026 23:08:12 +0100
X-Gmail-Original-Message-ID: <CANiDSCt4dkbXQ7TJpvL-1e5er571rRq0ofnO0SRU9SsEXUrhYA@mail.gmail.com>
X-Gm-Features: AaiRm50XOVm87K1Q-vDN0LsYBCOyd5MoJTfNKT6h6Cl9SSOIuVJLMmVYf5OnOJE
Message-ID: <CANiDSCt4dkbXQ7TJpvL-1e5er571rRq0ofnO0SRU9SsEXUrhYA@mail.gmail.com>
Subject: Re: [BUG] uvc_status_stop hangs if called from async_ctrl.work
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 9490C258BB3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55263-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.dev:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Sean

On Tue, 10 Mar 2026 at 22:23, Sean Anderson <sean.anderson@linux.dev> wrote:
>
> On 3/10/26 16:56, Ricardo Ribalda wrote:
> > Hi Sean
> >
> > Thanks for the report.
> >
> > I have not been able to repro with qv4l2 on my computer :(.
> >
> > Could you try if this patch works for you? Not saying that it is
> > beautiful patch, or the way to do it.... but it will let me know if I
> > am looking in the right place.
> >
> >
> > diff --git a/drivers/media/usb/uvc/uvc_status.c
> > b/drivers/media/usb/uvc/uvc_status.c
> > index 231cfee8e7c2..cca2aed162c3 100644
> > --- a/drivers/media/usb/uvc/uvc_status.c
> > +++ b/drivers/media/usb/uvc/uvc_status.c
> > @@ -340,7 +340,9 @@ static void uvc_status_stop(struct uvc_device *dev)
> >          * Cancel any pending asynchronous work. If any status event was queued,
> >          * process it synchronously.
> >          */
> > -       if (cancel_work_sync(&w->work))
> > +       if (&w->work == current_work())
> > +               cancel_work(&w->work);
> > +       else if (cancel_work_sync(&w->work))
> >                 uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
> >
> >         /* Kill the urb. */
> > @@ -352,7 +354,7 @@ static void uvc_status_stop(struct uvc_device *dev)
> >          * cancelled before returning or it could then race with a future
> >          * uvc_status_start() call.
> >          */
> > -       if (cancel_work_sync(&w->work))
> > +       if (&w->work != current_work() && cancel_work_sync(&w->work))
> >                 uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
> >
> >         /*
>
> I don't think this works since the urb will be rescheduled as flush_status
> is set to false again. However, the following patch works for me:

It does not work, in the sense that the urb is re submited... but if
would have confirmed the rootcause of the lockdep. But you have
already proven that with your patch, which I think is correct :).
Thanks for that

Can you resend it as a proper patch?

You probably want to add:
Fixes: a32d9c41bdb8 ("media: uvcvideo: Make power management granular")

I will try to review with extra care and a big cup of tea tomorrow morning.

Thanks!

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
>
> The first cancel_work_sync also seems superfluous to me, since we have to cancel
> again anyway.

It has been a while since we did this, but I believe that since we did
not use locks, the only way to guarantee the event queue was flushed
and the URB was killed was to have the double cancel_work() in that
order.

>
> --Sean



-- 
Ricardo Ribalda

