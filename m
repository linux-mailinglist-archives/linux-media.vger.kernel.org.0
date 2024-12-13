Return-Path: <linux-media+bounces-23404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C61069F173C
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 21:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93B2516240A
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 20:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64A9196455;
	Fri, 13 Dec 2024 20:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="tk+mx4uh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9302E1957E2
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 20:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734120442; cv=none; b=GQtALfIoFtvHqq6pQPEnW4UqbRfxJMUsdUFjqoQuphlc55s+vhZ+GJ845ggBjyeOD9yZqt6WRljl39v5qwZommD9YWMv0aPIRgoG9NMreQqqZW1Az7/5VJvK8qFqrurPy+QCwX9XtU79AUCcUfcjgDJUrcvHZ52+nCBsR5CJk7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734120442; c=relaxed/simple;
	bh=SsnJoFoePTlUZrixqJFW99HfJirP/j+5pqCyoHHBdfw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k3kpYDp77mfXv/Vej+QDpuvRGCT26Ht0tesdQKUZB7ZM02wV1ISNK1OODhi8RoZnePF+aV0Qm8qGts17YFxj5wDqAl5Oq2jF1Ev1OSH10EJgCgbXxItTmSHRTi9fCyPx0ms8xlOSur4fWaRlATeeIJfZfo0Sh7GVqKyY6bINfug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=tk+mx4uh; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d8f544d227so12388106d6.1
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 12:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1734120439; x=1734725239; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a6oLYGmh7RUyaWnrBaFPRXv1f5n9VduloV/UE0rp8V8=;
        b=tk+mx4uhe/bhDlpx7UkjclOE6IsDiSYEA6KHMp/RXkrQXYq+6Fx0r8YPuJ1sewdhn5
         lbyxfDFVFRZgZXVBmn8uR1XE2MsBbwVQDiM29Yh4HZSHKnePgUY6sdC5at75kUGcVoWk
         mvVQLYeBqBSoRrHlG8fkBnj+NHHHXtNKkWJo2yL4EjQJ49kmJlln9RyWUWugoyXzxqMX
         0wYU25ISrwHXrynLepOa+x3TtiVcrX1Ke8tW3bTbOgc+CZao0FVZ4LqpIplx09D6qO3c
         fxoKn9qkthe4NpIQKGb+g1HHWyxEMIZpwxc7CGAQRPFqwv0FbO5+LZXK5JncvoBSKyiG
         V9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734120439; x=1734725239;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6oLYGmh7RUyaWnrBaFPRXv1f5n9VduloV/UE0rp8V8=;
        b=CRYgnIlR6S+QfoCBH4mfLfkUchmkxNrEiwz/ogPMDW2vef533zvTlyR/fk+jxsLu/r
         j4OaFDkr03QdeWQtIiDaGxvCrXuC2vDMNn99KO4fSTX1TSfWAgCuAtUmiH5qevCEo5pM
         ezu2bpCQQrdC173vai/6kHkQP0zJHI0Hle2DtZKGMFkWMCc8YEj549bxTODvqTiStXvd
         65L6Gcrt7+qY4Pnhjy5IcKDcloME1v8oUwYUJI1vhWV0a/Tnx87yVvJKA+THTqeoXvrC
         7enJIhHKQjTbJsBxayvXppjxRKiBvBPVgehi5OrbLLphyb6ZioZxiG0W34f48/nNk21u
         WkHw==
X-Forwarded-Encrypted: i=1; AJvYcCWx/QmOPrxzGfvshQkCuia9NlN0MmfiCH5PEtzbCeG2FnJBmESIp4KsWEOibFABLnj3m5VQ93bs6ZWv4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/aOwo7PLySRfZU3wkvI5Oabe+WVG6bCHo6riNvG66i3yRErfx
	m+bsUuOJ7XdQ4ctZ9iLAuBZhcl7N7IIqiBYlcW/Rp6kKMLkmy5+8C1PW7xrmOsZV4RBMzM83vPR
	e
X-Gm-Gg: ASbGnct27k//5iuMchdpn+7V0YNb4WR7WxNuEQTQ/qBK5ohjPRDwLOk4CrRFbSJlfri
	jkCZn8ZBIp4GTNMDlzWOtXAT7BlCKBiC8QOpKgW9ad/ET8IkzPk15gBQtmfSTvem/oiVBxr2xyB
	ERIgLEHnRxOLF6MYnSdDhTNaHO6SURMxvvlodADLVeLrBlUss/c2/teovIWYV2O91F6nLv69rwi
	pKknpb8+WRRKULAST0yo2t8UJ0xSI+3tcV+ulsiPYI/lm/sg/tTbusPAg==
X-Google-Smtp-Source: AGHT+IGmV7/cwCsyWpsk2OCfKijVIMvtY5YsBK+GTyB1ZEp5t0HzeoYXue1S/RTy+63abbKGBpTbBg==
X-Received: by 2002:ad4:5d6f:0:b0:6d8:cff9:f373 with SMTP id 6a1803df08f44-6dc9032070bmr58460366d6.30.1734120439201;
        Fri, 13 Dec 2024 12:07:19 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd25658esm705926d6.28.2024.12.13.12.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 12:07:18 -0800 (PST)
Message-ID: <309aa9037dd8b181fed2c28e71d890173b2d1179.camel@ndufresne.ca>
Subject: Re: [PATCH] media: test-drivers: vivid: don't call schedule in loop
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Cc: "Artem S. Tashkinov" <aros@gmx.com>
Date: Fri, 13 Dec 2024 15:07:18 -0500
In-Reply-To: <f7bc5105-332f-414b-8160-3c0ff679c608@xs4all.nl>
References: <f7bc5105-332f-414b-8160-3c0ff679c608@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le lundi 09 d=C3=A9cembre 2024 =C3=A0 16:00 +0100, Hans Verkuil a =C3=A9cri=
t=C2=A0:
> Artem reported that the CPU load was 100% when capturing from
> vivid at low resolution with ffmpeg.
>=20
> This was caused by:
>=20
> while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
>        !kthread_should_stop())
>         schedule();
>=20
> If there are no other processes running that can be scheduled,
> then this is basically a busy-loop.
>=20
> Change it to wait_event_interruptible_timeout() which doesn't
> have that problem.
>=20
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> Reported-by: Artem S. Tashkinov <aros@gmx.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D219570

Looks to me, I'm surprised there isn't any more straightforward helper for =
doing
that, but its pretty high level software work that probably don't exist in =
the
kernel normally (I didn't find anything nice myself).

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/test-drivers/vivid/vivid-kthread-cap.c  | 11 ++++++++---
>  drivers/media/test-drivers/vivid/vivid-kthread-out.c  | 11 ++++++++---
>  .../media/test-drivers/vivid/vivid-kthread-touch.c    | 11 ++++++++---
>  drivers/media/test-drivers/vivid/vivid-sdr-cap.c      | 11 ++++++++---
>  4 files changed, 32 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drive=
rs/media/test-drivers/vivid/vivid-kthread-cap.c
> index 669bd96da4c7..273e8ed8c2a9 100644
> --- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
> @@ -789,9 +789,14 @@ static int vivid_thread_vid_cap(void *data)
>  			next_jiffies_since_start =3D jiffies_since_start;
>=20
>  		wait_jiffies =3D next_jiffies_since_start - jiffies_since_start;
> -		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
> -		       !kthread_should_stop())
> -			schedule();
> +		if (!time_is_after_jiffies(cur_jiffies + wait_jiffies))
> +			continue;
> +
> +		wait_queue_head_t wait;
> +
> +		init_waitqueue_head(&wait);
> +		wait_event_interruptible_timeout(wait, kthread_should_stop(),
> +					cur_jiffies + wait_jiffies - jiffies);
>  	}
>  	dprintk(dev, 1, "Video Capture Thread End\n");
>  	return 0;
> diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-out.c b/drive=
rs/media/test-drivers/vivid/vivid-kthread-out.c
> index fac6208b51da..015a7b166a1e 100644
> --- a/drivers/media/test-drivers/vivid/vivid-kthread-out.c
> +++ b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
> @@ -235,9 +235,14 @@ static int vivid_thread_vid_out(void *data)
>  			next_jiffies_since_start =3D jiffies_since_start;
>=20
>  		wait_jiffies =3D next_jiffies_since_start - jiffies_since_start;
> -		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
> -		       !kthread_should_stop())
> -			schedule();
> +		if (!time_is_after_jiffies(cur_jiffies + wait_jiffies))
> +			continue;
> +
> +		wait_queue_head_t wait;
> +
> +		init_waitqueue_head(&wait);
> +		wait_event_interruptible_timeout(wait, kthread_should_stop(),
> +					cur_jiffies + wait_jiffies - jiffies);
>  	}
>  	dprintk(dev, 1, "Video Output Thread End\n");
>  	return 0;
> diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c b/dri=
vers/media/test-drivers/vivid/vivid-kthread-touch.c
> index fa711ee36a3f..c862689786b6 100644
> --- a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
> +++ b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
> @@ -135,9 +135,14 @@ static int vivid_thread_touch_cap(void *data)
>  			next_jiffies_since_start =3D jiffies_since_start;
>=20
>  		wait_jiffies =3D next_jiffies_since_start - jiffies_since_start;
> -		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
> -		       !kthread_should_stop())
> -			schedule();
> +		if (!time_is_after_jiffies(cur_jiffies + wait_jiffies))
> +			continue;
> +
> +		wait_queue_head_t wait;
> +
> +		init_waitqueue_head(&wait);
> +		wait_event_interruptible_timeout(wait, kthread_should_stop(),
> +					cur_jiffies + wait_jiffies - jiffies);
>  	}
>  	dprintk(dev, 1, "Touch Capture Thread End\n");
>  	return 0;
> diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/m=
edia/test-drivers/vivid/vivid-sdr-cap.c
> index 74a91d28c8be..c633fc2ed664 100644
> --- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
> @@ -206,9 +206,14 @@ static int vivid_thread_sdr_cap(void *data)
>  			next_jiffies_since_start =3D jiffies_since_start;
>=20
>  		wait_jiffies =3D next_jiffies_since_start - jiffies_since_start;
> -		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
> -		       !kthread_should_stop())
> -			schedule();
> +		if (!time_is_after_jiffies(cur_jiffies + wait_jiffies))
> +			continue;
> +
> +		wait_queue_head_t wait;
> +
> +		init_waitqueue_head(&wait);
> +		wait_event_interruptible_timeout(wait, kthread_should_stop(),
> +					cur_jiffies + wait_jiffies - jiffies);
>  	}
>  	dprintk(dev, 1, "SDR Capture Thread End\n");
>  	return 0;


