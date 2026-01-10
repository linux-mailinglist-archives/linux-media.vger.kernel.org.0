Return-Path: <linux-media+bounces-50332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB11D0CE17
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 04:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48AF630222D2
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 03:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBDC254AF5;
	Sat, 10 Jan 2026 03:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huYNZhm9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F2013B58A
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 03:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768016780; cv=none; b=DwklLQPfbDbL1sUPIdWsvQnMtkqJ/HepPB0KSdpp9ncGNnUFgjJzXqKY4O+hp7ZrD9jBwbmGxZ5UbR+CkHn+0wCuNf3hiMu2eFLjOHF1G+Vf1j79/2So5tuOOhkMhsNWv2tlKoN16u/10NQlJ0T+dcQ2XJbHMkqJJcxr587VSos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768016780; c=relaxed/simple;
	bh=Il2boBEAwxmBb6scch+XX0oqCWE3N+NmO1rnljMDW74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPuSpZzfxGbNwnuOT4F8qCxqt2TI/Uqv2qnYRKGF9uyiWzhfvWse0pWJzGbmAOU6mlTqFq3QX69IvTKD9LL0LAORPTRgJ4XC8GcewDnnWSK06b7b7KAub2iGfoLMGgd0c5jxz8nFjEU6J/VNU84z8iGEIeWopFV0+BLtgmgecgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huYNZhm9; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c1d84781bso2808929a91.2
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 19:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768016779; x=1768621579; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JV5XPQSlkP0KT1539S/zXsLMM0QQpO+Ub+Lr7dpN/aM=;
        b=huYNZhm9hi9wVWVuv3Wevsov90wln2lXitgcyrSc6WSk1Vboo3dNFVXfffnXJFrB7Q
         hjXp9yKflK+H5hs2WuHaE1yEWo9k7gyM6uvvyEovVQ9nMTnh9YMwarTZoD62FEmzi5ce
         U8+5/Pt7qIWay2BwqhINnolG87tKZ2Rn/M41K3EslujDZqCps0A0ARZC/KVmv/E6oW+M
         pwjZ9+MNlWKNuxwquQ3bGZz5XolnPAmIiKnvQUc7AHuGzug7XwKm7ZSM500SJfgHpOwn
         Me9PPetewzsAmokil+vybL43Pk9lqc/98do31n89dFF9ko6ZVwszqLe01SifcUhMgL5T
         P8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768016779; x=1768621579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV5XPQSlkP0KT1539S/zXsLMM0QQpO+Ub+Lr7dpN/aM=;
        b=r3NVC1GCZFddmUQYNFfPXfwdoMz+/KrZf1VR/jySVQRBsBt8uz6BXQ5z+y2V38nEhi
         G6snvw2K7yildjZ5jz2qID/73UbZfOvJwSzPKwXksLhdQ3dbqKf4hpn22IgLEj7cfpMi
         LDDXbeA24OshXMb+OWEptRmkG2IJ+ezwU19C6fb25hPbUEnLd8OJf7/DL4q434eJSSLu
         oMMC+SdaexqiwCx7sYzNha23kJ3co4zKQk2XEaIHKCiBSm1L1iSkwmI7aYh1nAiH+Hbw
         fJC6jaz2IQ+2EE0JBiAwLYDJeq5kJZDUrValw+RT7cIZSN0Gx8HYoEKGz+yguhghKtCa
         K5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4hThsrbf5unTFH8lkQg1lV+gs3YopSzjck1Ze3AJIfgxKwH8d4rJtaq3KEiHldRcrD6cj/S08iXsOkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDDHDO/vkWs+TLn5a6D4eMirt6qCZsciA3CVr+iR+ucNWI4yAI
	gytmm5USZySEzf41dy4d0KVCbJJJm5psy10hVBFjfQKEO2ju9P8t5Q0qXT2Ri0w0N1XtBrQLaLG
	sgzDeIq1bvfh/BlCs8r8+vQmHI9dit1s=
X-Gm-Gg: AY/fxX4g/r7oFhIumNyYx4ZQChxsJm81bir9EnP5hDOM07vvLm4EC2hxWvkhsN9lOQ7
	hHX8hradpGjlFOOoMJRr8AUfV2nkCE8tZ5WKzTnInIE06tKDG6mHhJMynnfWzbB7PKCkqvXO8UW
	V2SDZVH7+lhEQjrRyDpV0qRGzCimkA3krdh8hhai1aOuFKqr5tlkwnrwN3mJA1UFUzCbX7J6/ao
	Zjhx+ed76RqWt0ULsn5ef/KNrNpEjY4ygom+jP656N+bkteHKg/BTJ5/JdiM2JP3v6kJdfLUhYy
	//COHZGcEozX7LKojTh+3v1LlOJnu+zIrKJCUA==
X-Google-Smtp-Source: AGHT+IE4uECXxtDUReK7t4LLPjwqWqeyFbXYeIs/0hXGW+lG9xyxoex3kbCSBDFzmQ/oo56xKozqf2rYrgpaViDleWw=
X-Received: by 2002:a17:90b:5848:b0:34c:27ad:71e7 with SMTP id
 98e67ed59e1d1-34f68cccd55mr11259029a91.35.1768016778708; Fri, 09 Jan 2026
 19:46:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904054232.3848637-1-aha310510@gmail.com> <aa78a288-0a1e-4851-a2a5-4378e96da305@kernel.org>
In-Reply-To: <aa78a288-0a1e-4851-a2a5-4378e96da305@kernel.org>
From: Jeongjun Park <aha310510@gmail.com>
Date: Sat, 10 Jan 2026 12:46:07 +0900
X-Gm-Features: AQt7F2rCEhIfpIUArvj5ymsknplv85t0YI7wshsnxjoWUB6KQQyyPkQ5DRbZUGY
Message-ID: <CAO9qdTEgnft880Hm2V2jF8Li0m3d96iu2Zwi_jHN9ErHH7TOTQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] media: hackrf: fix to not free memory after the
 device is registered in hackrf_probe()
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: mchehab@kernel.org, hverkuil@kernel.org, 
	laurent.pinchart+renesas@ideasonboard.com, crope@iki.fi, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, syzbot+6ffd76b5405c006a46b7@syzkaller.appspotmail.com, 
	syzbot+f1b20958f93d2d250727@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Hans,

Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
> Hi Jeongjun Park,
>
> On 04/09/2025 07:42, Jeongjun Park wrote:
> > In hackrf driver, the following race condition occurs:
> > ```
> >               CPU0                                            CPU1
> > hackrf_probe()
> >   kzalloc(); // alloc hackrf_dev
> >   ....
> >   v4l2_device_register();
> >   ....
> >                                               open("/path/to/dev"); // open hackrf dev
> >                                               ....
> >   v4l2_device_unregister();
> >   ....
> >   kfree(); // free hackrf_dev
> >   ....
> >                                               ioctl(fd, ...);
> >                                                 v4l2_ioctl();
> >                                                   video_is_registered() // UAF!!
> >                                               ....
> >                                               close(fd);
> >                                                 v4l2_release() // UAF!!
> >                                                   hackrf_video_release()
> >                                                     kfree(); // DFB!!
> > ```
> >
> > When a V4L2 or video device is unregistered, the device node is removed so
> > new open() calls are blocked.
> >
> > However, file descriptors that are already open-and any in-flight I/O-do
> > not terminate immediately; they remain valid until the last reference is
> > dropped and the driver's release() is invoked.
> >
> > Therefore, freeing device memory on the error path after hackrf_probe()
> > has registered dev it will lead to a race to use-after-free vuln, since
> > those already-open handles haven't been released yet.
> >
> > And since release() free memory too, race to use-after-free and
> > double-free vuln occur.
> >
> > To prevent this, if device is registered from probe(), it should be
> > modified to free memory only through release() rather than calling
> > kfree() directly.
> >
> > Cc: <stable@vger.kernel.org>
> > Reported-by: syzbot+6ffd76b5405c006a46b7@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=6ffd76b5405c006a46b7
> > Reported-by: syzbot+f1b20958f93d2d250727@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=f1b20958f93d2d250727
> > Fixes: 8bc4a9ed8504 ("[media] hackrf: add support for transmitter")
> > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > ---
> > v2: Fix incorrect patch description style and CC stable mailing list
> > - Link to v1: https://lore.kernel.org/all/20250822142729.1156816-1-aha310510@gmail.com/
> > ---
> >  drivers/media/usb/hackrf/hackrf.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
> > index 0b50de8775a3..d7a84422193d 100644
> > --- a/drivers/media/usb/hackrf/hackrf.c
> > +++ b/drivers/media/usb/hackrf/hackrf.c
> > @@ -1515,6 +1515,8 @@ static int hackrf_probe(struct usb_interface *intf,
> >       video_unregister_device(&dev->rx_vdev);
> >  err_v4l2_device_unregister:
> >       v4l2_device_unregister(&dev->v4l2_dev);
>
> Instead of v4l2_device_unregister() this should call v4l2_device_put().
> Otherwise the memory will never be freed since the v4l2_device refcount
> will never reach 0.

Oh, you're right.

Calling v4l2_device_unregister() instead of v4l2_device_put() causes a
memory leak here.

I'll write a v3 patch for hackrf and as102 and send it to you right away.

>
> > +     dev_dbg(&intf->dev, "failed=%d\n", ret);
>
> Drop this line, it doesn't add anything.
>
> Regards,
>
>         Hans
>
> > +     return ret;
> >  err_v4l2_ctrl_handler_free_tx:
> >       v4l2_ctrl_handler_free(&dev->tx_ctrl_handler);
> >  err_v4l2_ctrl_handler_free_rx:
> > --
> >
>

Regards,
Jeongjun Park

