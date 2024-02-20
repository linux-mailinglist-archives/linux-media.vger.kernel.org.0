Return-Path: <linux-media+bounces-5486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C5785B959
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 11:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47CB51C216F8
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 10:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B828C64A82;
	Tue, 20 Feb 2024 10:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KGisgCWt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB653EA88
	for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708425793; cv=none; b=qWc4VSgbM8orD/m9bPdm6LxIVpZBe3QHOa9emBJDio1ncMSCACxzTiorjCcSzcc4cwzG/2OJPRBMSJ69kV/cTXpV601vTzwMMUbW9KVdtFY7d61G/9McNfKPBgb1x/I1i9YtOWylwmRso7aTA+dATALK/o4g3Pls9YMQouUYIVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708425793; c=relaxed/simple;
	bh=VkR0B/TOuKeGtTOK9qEC13UDMig/E9hScfb+cujwVY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUPyysi+5i7Rkw1DJ2gF1Z9tCepI+Zbm8GClXIoeiiJNBoTMgBGX7LDAYfCK+ucBA41X1AxQN+7JJRRcjnM2wBIHFZt4Eqh/n6uXlGDgQ289LU6k/qRlcZGbFQfjGEa4e1Gz6FOvdN42wXYCadMIsbAPwQPFHIhde3INiHNejhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KGisgCWt; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-563c2b2bddbso7406308a12.1
        for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 02:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708425789; x=1709030589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07TryGGvvDSKgfkSXszhhTVFd+qTH1nT47NESrZ5/Fs=;
        b=KGisgCWtKPD4vYHHGP40/vn4ZAkgP1qLYk2y23cbRAA6/l4pGNOWxpEQZcj63WIgzK
         IzNDf9VjFwT6PKS0O3nRzjUw9tOS8b2w4PBhkk+2wZSeHeiPf8+u1Bw87s3cGQGAhskb
         cH8xx0UkwuMziwU3qeLG5oNmYvzxwrhs12Fgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708425789; x=1709030589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07TryGGvvDSKgfkSXszhhTVFd+qTH1nT47NESrZ5/Fs=;
        b=pxwd7DUv+hLVpdyES9pSZ5dZ86qGm0VmVrvv8hAO/UYiUfW0Qdvfg9Ws08G9MYfDxV
         UbEAAWDVwwDHwpEvVD0T3aIzQ2We8108fi8FFiA0hSr3VCS9xgS+1sl//yB5C8IKI2Bf
         uupdB/rZb6/ylggoFJbnUAcsrUXKiUgL/WcumCxqU5M6VqBx5YQ9ztfoq+0XKwFAkEZ2
         sZ9vlMex53K4snXShLop4G90bWNh5+ldP1GmXXVeasetGZD4p0OPcS32tUfRlUAvR0XA
         /xuLzUzDP68GUA8glK7/vcV+tm3XTUzEbZiQFGhvCMcH9wug3RTOPYoRc3xySLuHUqzs
         qpjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4xg9Apcsaf7Uhn5Li9k1r1ieja9q0/Yc3+NaBliq4gl7BHEaEn2JhFsg6AveHiHgSj2N5WdRg6OlfIDeMg7XyH3MCbdQLj/3n8os=
X-Gm-Message-State: AOJu0YxepL1weXwLEBI+jblTqbIniry9uQWfEMs1Kk4ROrqf9Rlt6EQm
	4gI0cc1BD1EZF7nOgZd6XJJIMD2DCUQcl6KAOdTaJDOvUjbWiPmEAd5AB06LIUHRHZmklcElRQX
	kIQ==
X-Google-Smtp-Source: AGHT+IE0+xHd2Dbd/QhKng5dbILGS/Yr37E2hQWmhJxbQHhTNlsrHrA7AjfqVUWJCROlNaCWK7IOSA==
X-Received: by 2002:a05:6402:31f6:b0:564:dd13:56e9 with SMTP id dy22-20020a05640231f600b00564dd1356e9mr79868edb.29.1708425789296;
        Tue, 20 Feb 2024 02:43:09 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id x3-20020aa7d383000000b005646c7b9712sm2053335edq.16.2024.02.20.02.43.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 02:43:08 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33ce8cbf465so2570827f8f.3
        for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 02:43:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUR0lijiS1h6GxKKm7yXmLUjrW2wYO8N0A/Obc7OIigw0Rjt7avVH2aM6yDaajcNGWczKuyQU0rE3tmxO8nsshsT4MPle6zflbsLcc=
X-Received: by 2002:a05:6000:1e8f:b0:33d:2120:1011 with SMTP id
 dd15-20020a0560001e8f00b0033d21201011mr6506170wrb.54.1708425788061; Tue, 20
 Feb 2024 02:43:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220080628.13141-1-benjamin.gaignard@collabora.com>
In-Reply-To: <20240220080628.13141-1-benjamin.gaignard@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 20 Feb 2024 19:42:47 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DR5z7xhXrnHc94FVY9Si9KWW2gYH+=Ov3yT1HMUpjhzg@mail.gmail.com>
Message-ID: <CAAFQd5DR5z7xhXrnHc94FVY9Si9KWW2gYH+=Ov3yT1HMUpjhzg@mail.gmail.com>
Subject: Re: [PATCH] media: usbtv: Remove useless locks in usbtv_video_free()
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 5:06=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
> Remove locks calls in usbtv_video_free() because
> are useless and may led to a deadlock as reported here:
> https://syzkaller.appspot.com/x/bisect.txt?x=3D166dc872180000
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: c838530d230b ("media: media videobuf2: Be more flexible on the num=
ber of queue stored buffers")
> ---
>  drivers/media/usb/usbtv/usbtv-video.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/us=
btv/usbtv-video.c
> index 62a583040cd4..96276358d116 100644
> --- a/drivers/media/usb/usbtv/usbtv-video.c
> +++ b/drivers/media/usb/usbtv/usbtv-video.c
> @@ -963,15 +963,9 @@ int usbtv_video_init(struct usbtv *usbtv)
>
>  void usbtv_video_free(struct usbtv *usbtv)
>  {
> -       mutex_lock(&usbtv->vb2q_lock);
> -       mutex_lock(&usbtv->v4l2_lock);
> -
>         usbtv_stop(usbtv);
>         vb2_video_unregister_device(&usbtv->vdev);
>         v4l2_device_disconnect(&usbtv->v4l2_dev);
>
> -       mutex_unlock(&usbtv->v4l2_lock);
> -       mutex_unlock(&usbtv->vb2q_lock);
> -
>         v4l2_device_put(&usbtv->v4l2_dev);
>  }
> --
> 2.40.1
>

From looking at the code in related vb2 functions and how the uvc
driver handles the cleanup, these locks shouldn't be necessary indeed,
but it would be good if someone could test this.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

