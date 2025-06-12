Return-Path: <linux-media+bounces-34595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FA7AD6C3E
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 11:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA9BA1BC3989
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 09:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DDA22A4E5;
	Thu, 12 Jun 2025 09:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Yw9CX+0X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284DC1E5B62
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 09:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720659; cv=none; b=YYj4un+xSb91ObidYXHUJBkNV4wLNPAtsCSEiK0X5J972rqps+iae6Tt0UGkyciu3+Ae0Fo89hHXiYoq41vL9WzFFmoZK97YPXL32tEO+3J8yT/4Sm21GQEfFYZ31srg7RF87zuShZ+alwiTLxBH5yW1UDB0vgzSSq3BMEICrfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720659; c=relaxed/simple;
	bh=cCwWw9sTvHj5PdPsJ3yibTXuI4iOD0bHCNDKmdQqR9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YpAtKG5o9eN9M7OXBnh0gqKcKc6f1lpmsOZzFzXGMXg2MvuG9qbz8emAKxgXHuQcrPHvx2UM8fE1Omhnvj/39VUVALRLqS8lXADBP03Rz0GxGkCP3w7E2ZmcBhtJRG/mchFWgr4htGQxGH4E7xrrUno3wtG6Xi2UVI8XCT7FT78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Yw9CX+0X; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553331c3dc7so565963e87.3
        for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 02:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749720655; x=1750325455; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EY6fVQgCafne+t6zpmu4ZzZIepFlffFJV42q5eV6obY=;
        b=Yw9CX+0XiiCbRM5qj6Evmcq6V82tvxkUriwvSTZiQvLQbzVEzN1lPwuPvILippHGUO
         +FRmO8DfnwYzbHtbQ6qRv4Pw6TfzozwoHZQ0UsW6F9EU303lCuxHyR0nkG9oHQpUkDkM
         Mz8CotwPesJi7L9xA2+WCWMXVUGujyuYZf72Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749720655; x=1750325455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EY6fVQgCafne+t6zpmu4ZzZIepFlffFJV42q5eV6obY=;
        b=eQ+tE8VGqbVrCpAm53jRjsD+1NQIlAwEgKCGQhLn4kjiW7U6909u3SZlxDD58roknY
         jP8cXNrdHf5E3G2DkgPtLWOfbvPq/DEd3cAOqZnVQdHb49SEYfUfAjPkhW4lVYOYNFyc
         k+2X8HGEuuu4RWtV2FkUq5hf8KkrAaB93H9vqfVL23LGOGg/8CIX6OE1qDDkwl8cYWyh
         bAooLGLg0iLwTS+myxmm7Om0V9P1W2ePBFKf3nYZUvrHtmHakBxzNQs9vHe6kMMiIdCX
         +5jTSVCPEjEJRp0Y0FImVO9X4CDXdELcSHKOkMLVWv+olhksS0Kb5UJO7YwFxn1GTta/
         b4yA==
X-Forwarded-Encrypted: i=1; AJvYcCVtyN1WpukHkhz/D1heZ0UpkzfYarYdmxQVyulUTSEspVS7PpjaiaizpDXszd2IPXQOTBggW/ZdxK6vqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyDwnbRj3OqqOpRrDzQjvphyWXnS4VcR0YF1wcmMIRHdqUqrTe
	6wCOQvsOYfmnadrBP9cSCO0nm5OXaQKYPQudq/puZrkv9jaYFKBaGZE6gGvmS4iVb483sJphFWu
	yT84=
X-Gm-Gg: ASbGncu3OKi5aZ86jVoqwunPIabx3BHnub7Stc6NtCgQXXovNJYTOY1xJXUQqfm7hYX
	v9/pYZfCUX46qVAisuTD1zCR4kVAhyOKGCE9oglhjtGjAts6dsmTjsAYhbfUcS8grBLFT2GUzN1
	+YyZSyviG8zvRqnS4YpFWpTvnDplUroejzyKHzbNSdKd/trHhfFFB4pmmbkRncn7QAtKUFR2tII
	zHz3WFODFWBJPeeKtV/m1VIqTrgSVTUXDSLVODGcKoSo2K0bHCyYvOyY0Q1itwXt0LUVjHlAmGz
	clrSYzKtkjSvR0nB+uPzsY0CkA7LN55l0kynnZy94e4pREYsEVW8p9flwgo9dRBLrSrPHgqqp5K
	x0gbEhsDOD49194oRN1hPScRZ
X-Google-Smtp-Source: AGHT+IGpj6kgAGUoZxsuZiCKwUU/Uf/Gy7V1hluyn7aNjJGH4NLqXqu01r49HL9B/DbjSOqoPdN8Eg==
X-Received: by 2002:a05:6512:6d0:b0:553:6526:82eb with SMTP id 2adb3069b0e04-553a650f2aamr717519e87.14.1749720654735;
        Thu, 12 Jun 2025 02:30:54 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f6627sm49996e87.216.2025.06.12.02.30.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 02:30:53 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54b10594812so728800e87.1
        for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 02:30:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVISk9EVlPfrr8bhuc4WXG3ImHP2P6KvnIBiMi50BYE/5W51vvT2sUkzWd47qoyTkNaEtRfQq49UALNtg==@vger.kernel.org
X-Received: by 2002:a05:6512:6d0:b0:553:1f90:cca4 with SMTP id
 2adb3069b0e04-553a650ef0fmr554833e87.13.1749720652786; Thu, 12 Jun 2025
 02:30:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_39B2EF87C824951B6527F31CC86123F56107@qq.com>
In-Reply-To: <tencent_39B2EF87C824951B6527F31CC86123F56107@qq.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 12 Jun 2025 11:30:40 +0200
X-Gmail-Original-Message-ID: <CANiDSCvB+qeBW7aPvBo_--J8gw3s3auhmy78VtkmMRReyg0-wQ@mail.gmail.com>
X-Gm-Features: AX0GCFudZZkP2K3U6antsr0U79mjiGMJVWoijCOws11T55VmVkYza9w--FRgXg0
Message-ID: <CANiDSCvB+qeBW7aPvBo_--J8gw3s3auhmy78VtkmMRReyg0-wQ@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-dev: optimize device node number allocation logic
To: Haipeng Jiang <haipengjiang@foxmail.com>
Cc: hverkuil@xs4all.nl, mchehab@kernel.org, sebastian.fricke@collabora.com, 
	bartosz.golaszewski@linaro.org, hljunggr@cisco.com, make24@iscas.ac.cn, 
	viro@zeniv.linux.org.uk, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Haipeng

Thanks for the patch.

Please note that devnode_find should be a very efficient bit
operation, it is most of the time done in O(1) and not in O(N) despide
it would sound otherwise.

If you want to refactor the code, I would suggest modifying
devnode_find() instead. Something like this (untested)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c
b/drivers/media/v4l2-core/v4l2-dev.c
index c369235113d9..400240afb85d 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -138,10 +138,20 @@ static inline void devnode_clear(struct
video_device *vdev)
        clear_bit(vdev->num, devnode_bits(vdev->vfl_type));
 }

-/* Try to find a free device node number in the range [from, to> */
+/* Try to find a free device node number in the range [from, to> , wrapping */
 static inline int devnode_find(struct video_device *vdev, int from, int to)
 {
-       return find_next_zero_bit(devnode_bits(vdev->vfl_type), to, from);
+       int ret;
+
+       ret = find_next_zero_bit(devnode_bits(vdev->vfl_type), to, from);
+       if (ret == to && from == 0)
+               return -ENOSPC;
+
+       ret = find_next_zero_bit(devnode_bits(vdev->vfl_type), from, 0);
+       if (ret == from)
+               return -ENOSPC;
+
+       return ret;
 }

 struct video_device *video_device_alloc(void)
@@ -994,10 +1004,8 @@ int __video_register_device(struct video_device *vdev,

        /* Pick a device node number */
        mutex_lock(&videodev_lock);
-       nr = devnode_find(vdev, nr == -1 ? 0 : nr, minor_cnt);
-       if (nr == minor_cnt)
-               nr = devnode_find(vdev, 0, minor_cnt);
-       if (nr == minor_cnt) {
+       nr = devnode_find(vdev, (nr == -1) ? 0 : nr, minor_cnt);
+       if (nr == -ENOSPC) {
                pr_err("could not get a free device node number\n");
                mutex_unlock(&videodev_lock);
                return -ENFILE;


Regards

On Wed, 11 Jun 2025 at 16:06, Haipeng Jiang <haipengjiang@foxmail.com> wrote:
>
> Refactor the device node number selection to:
> 1. Avoid redundant search in auto-allocation case (nr < 0)
> 2. Simplify error handling with unified boundary check
> 3. Maintain identical behavior for both auto and specific allocation
>
> For automatic allocation (start = 0):
> - Only search [0, minor_cnt) once
> - Return -ENFILE if no free node found
>
> For specific node request (start > 0):
> - First search [start, minor_cnt)
> - Then search [0, start) if first fails
> - Return -ENFILE if both ranges have no free node
>
> Signed-off-by: Haipeng Jiang <haipengjiang@foxmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index c369235113d9..23d04c890e6b 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -907,6 +907,7 @@ int __video_register_device(struct video_device *vdev,
>         int ret;
>         int minor_offset = 0;
>         int minor_cnt = VIDEO_NUM_DEVICES;
> +       int start;
>         const char *name_base;
>
>         /* A minor value of -1 marks this video device as never
> @@ -994,10 +995,11 @@ int __video_register_device(struct video_device *vdev,
>
>         /* Pick a device node number */
>         mutex_lock(&videodev_lock);
> -       nr = devnode_find(vdev, nr == -1 ? 0 : nr, minor_cnt);
> -       if (nr == minor_cnt)
> -               nr = devnode_find(vdev, 0, minor_cnt);
> -       if (nr == minor_cnt) {
> +       start = (nr < 0) ? 0 : nr;
> +       nr = devnode_find(vdev, start, minor_cnt);
> +       if (nr == minor_cnt && start != 0)
> +               nr = devnode_find(vdev, 0, start);
> +       if (nr == (start != 0 ? start : minor_cnt)) {
>                 pr_err("could not get a free device node number\n");
>                 mutex_unlock(&videodev_lock);
>                 return -ENFILE;
> --
> 2.46.2.windows.1
>


-- 
Ricardo Ribalda

