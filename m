Return-Path: <linux-media+bounces-34852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E242ADA85D
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 08:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 141743A5F9A
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 06:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D3C1DF267;
	Mon, 16 Jun 2025 06:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RsjcP4bj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A63D20330
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 06:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750056023; cv=none; b=MSVsOhEUDywN3EuXxq17KLE7rJK99J+tly2c9A0k/3fCagY34aliAR22Ce+dHVxddaufGV4g8ABePWdpK3O+y3faqABlnZjSLlq9CxcQTWg0aFLC8oeu1Xr2kkVmQXLNlzWBCDdgmbe1+3NCcGxPtkVnElV9Vi1zAIqrwbMKfdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750056023; c=relaxed/simple;
	bh=VFWA4Atl4CIsPjyUwk9cWGE1CauDYOg5K4rdZsiaq4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhHAIFBEJRs+KBuELAFqQlCJGhRrKJAASL/UKmlG8ImqWLxhfqBcT7Y+V4sJQRH+Om7Cp7h6gFIPE/KkqFD8rgkdv2id51AXtYR8jY3Q5duY2Jgz5GpGA5tFtHgY3VqPp+9lwMjpgO8Q03rzvKspctCuWRSrrApKT5yu2W4R3LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RsjcP4bj; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32aabfd3813so35605631fa.3
        for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 23:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750056020; x=1750660820; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/mdJuHcFfJk+C4dBwp+PRb3AjA9baPO4pSDq7v2nj04=;
        b=RsjcP4bjxS6zKbOFODAanjxCXqnfS0d58rDE74iFvrNps32sM6WHPVL9hG5kNEIgnV
         +2n6UlBndYXm6KbxnO/QPy0rhYnM7kF9YYbStWBPz4l2P0H6ojXQMtvRmPSofr5bAHRD
         KkJ+QH1cl043QjCKyQdi8jzhAiGvhR6Rya64E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750056020; x=1750660820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mdJuHcFfJk+C4dBwp+PRb3AjA9baPO4pSDq7v2nj04=;
        b=uvwstAv9wvXpTXqF0F/wB269YPUAHsUsV813bI8AL2B/n8qzxq4/DL6kLu4jN29Qn8
         CvTwdOcKolJCd/3hI7oRf4LFRV5JnJTcHJ56UXlHugpA0ry6hDCOkwp+2idkV8K7E8mx
         zfuT6jHMwdIO5ES0DPvc1yWHhVRMqLCQU1y8oDWQAY+XejaZQwUaCZejc6Y2Ou84gWyT
         RtLbmpWoyY19j66hBxY74GaBYiv8q//1YFGp4iTh+s2pz6OQ8ZUnWIzmCQXFL1ZAYM+w
         mSwxrE0sl+D+5m7sDKnlUdnljozs7E7YqGQCMt4ROEv9FrkyDqrB3Wo+8qCA0QCRzG9T
         PsQA==
X-Forwarded-Encrypted: i=1; AJvYcCUXwOeJD54zUV5Bs3xF29OXaPXhEP5P6zxu6Ox6I4auGmwp4dWAYeTPYzc79NrAn8ZRNTrDmAnjv8B5Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBhW32DEcToGLtNQUrunw9W0qg3cSNRLhpvZZ+DFpUzS5CSn+B
	fMSKdOF9ZQqG+lTp7Eu74jfAKC2jACtL25rM12sxgoSl245zs6U+ZMu7uzZliwdMe0bfHwuXpPi
	qnYo=
X-Gm-Gg: ASbGncvwPc5jKTVrRaYEOkjEWU8rfYLjSQMQnrceq+ggAMDzxXpzB8zT9mnpzOQP7RX
	jp6LotoAApuT1nWd0KLj8+SlOpTKSFyYHuLeX9Xntok+2n/ZskrqZAvP3X/91yPYncQAn23wRHW
	rNDZVg5xzAh9AFWqYlF+9joE91Xn/wgxwUdzPTdA26KDiar6kxYrph1NFO2O0ZbS3/uG68q9zJ8
	mTJxDPlUFTmwM6PapQKupaSfQboIY8VVgYtIa+tgP8N/spEiGhBpdO5AvDwsPtRvLwYl+YlgCYu
	HTkXArtWB3frh7zqBBMCz5MOSVtVih0QHS0as9WqDTclv3wZDgbU1Vym5uSopnro4WXBQg0cCww
	wf2oTfn1rzCjPyDqhzvTcVk2y
X-Google-Smtp-Source: AGHT+IFidJvBMlWO5MeXO8ElCJbTa6ETpvFnjuZ+yO+vv7RogwsCEuS+6UjPLMwVfguNx3oiPj7Kig==
X-Received: by 2002:a05:651c:b0e:b0:32a:8aac:e450 with SMTP id 38308e7fff4ca-32b4a6dadd6mr20291311fa.33.1750056019543;
        Sun, 15 Jun 2025 23:40:19 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3318e8b9sm14283971fa.81.2025.06.15.23.40.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 23:40:18 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b6a349ccso1723712e87.0
        for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 23:40:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVic/d+2dNxoCJBvvRCcnwf+qScmkan150Uzx8jcoinr7ZH1AcQoo0u2uEWD2I0bpAOo8PlsBy38rRp0w==@vger.kernel.org
X-Received: by 2002:a05:6512:33cc:b0:550:e527:886f with SMTP id
 2adb3069b0e04-553b6f6a9d5mr2042362e87.51.1750056018124; Sun, 15 Jun 2025
 23:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCvB+qeBW7aPvBo_--J8gw3s3auhmy78VtkmMRReyg0-wQ@mail.gmail.com>
 <tencent_F17FCCD7216F8C3E86E3BF032289559E9409@qq.com>
In-Reply-To: <tencent_F17FCCD7216F8C3E86E3BF032289559E9409@qq.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 08:40:05 +0200
X-Gmail-Original-Message-ID: <CANiDSCtn7o4SvTPx76s7DA87Nyop-fGJzV4k6uUS9=EF0aLA1A@mail.gmail.com>
X-Gm-Features: AX0GCFu0dhRV6zUgu_SUkzZpG18Tuff4S0QPnjNish3Qbwsoc1olBwLUEhd4tnw
Message-ID: <CANiDSCtn7o4SvTPx76s7DA87Nyop-fGJzV4k6uUS9=EF0aLA1A@mail.gmail.com>
Subject: Re: [PATCH v2] media: v4l2-dev: implement wrap-around search in devnode_find
To: Haipeng Jiang <haipengjiang@foxmail.com>
Cc: bartosz.golaszewski@linaro.org, hljunggr@cisco.com, hverkuil@xs4all.nl, 
	linux-media@vger.kernel.org, make24@iscas.ac.cn, mchehab@kernel.org, 
	sebastian.fricke@collabora.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Jun 2025 at 08:35, Haipeng Jiang <haipengjiang@foxmail.com> wrote:
>
> Moved wrap-around search logic into devnode_find() to avoid redundant
> lookups when nr=0. Returns -ENOSPC when device node numbers are
> exhausted.
>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Haipeng Jiang <haipengjiang@foxmail.com>
> ---
> Changes in v2:
> - Implemented wrap-around search logic directly in devnode_find()
>
>  drivers/media/v4l2-core/v4l2-dev.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index c369235113d9..39e175d529a4 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -138,10 +138,22 @@ static inline void devnode_clear(struct video_device *vdev)
>         clear_bit(vdev->num, devnode_bits(vdev->vfl_type));
>  }
>
> -/* Try to find a free device node number in the range [from, to> */
> +/* Try to find a free device node number in the range [from, to>, wrapping */
>  static inline int devnode_find(struct video_device *vdev, int from, int to)
>  {
> -       return find_next_zero_bit(devnode_bits(vdev->vfl_type), to, from);
> +       int ret;
> +
> +       ret = find_next_zero_bit(devnode_bits(vdev->vfl_type), to, from);
> +
> +       if (ret == to) {
> +               if (from == 0)
> +                       return -ENOSPC;
> +               ret = find_next_zero_bit(devnode_bits(vdev->vfl_type), from, 0);
> +               if (ret == from)
> +                       return -ENOSPC;
> +       }
> +
> +       return ret;
>  }
>

The code is correct, but I would have implemented it a bit differently
to avoid indentation level.
Probably nitpicking.

ret = find_next_zero()
if (ret != to)
  return ret;
if (from == 0)
   return -ENOSPC;
ret = find_next_zero()
if (ret == from)
  return -ENOSPC
return ret;

As I previously said, find_next_zero_bit is really fast, so there is
no big harm to run it twice even if it is not needed. Up to the
maintainer to decide if they need the patch or not :)

Thanks



>  struct video_device *video_device_alloc(void)
> @@ -995,9 +1007,7 @@ int __video_register_device(struct video_device *vdev,
>         /* Pick a device node number */
>         mutex_lock(&videodev_lock);
>         nr = devnode_find(vdev, nr == -1 ? 0 : nr, minor_cnt);
> -       if (nr == minor_cnt)
> -               nr = devnode_find(vdev, 0, minor_cnt);
> -       if (nr == minor_cnt) {
> +       if (nr == -ENOSPC) {
>                 pr_err("could not get a free device node number\n");
>                 mutex_unlock(&videodev_lock);
>                 return -ENFILE;
> --
> 2.46.2.windows.1
>


-- 
Ricardo Ribalda

