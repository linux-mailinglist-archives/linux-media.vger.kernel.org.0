Return-Path: <linux-media+bounces-35095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C16ADCFF7
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBAB03B8380
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 14:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A39E2EF66A;
	Tue, 17 Jun 2025 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Xr10iyQL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17F52EF653
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 14:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170391; cv=none; b=kzSTmMxCrARIF/aVia9tYnc4AKHV/hNzJg3ARga5NdUC3+VNM6yjxoy6m4ymxDdfjfbQyu+Z4dc/2bVkJ+VNfCMroeHrvVvhocLbOtCx4D+1qgTIATPgzDdBhRrrk/zNNntFHcojOCMqz59wucEMTv0Dvl3E5J3r9iMW8dxQnlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170391; c=relaxed/simple;
	bh=wMbM76puJf3UDfEqOtCoByazKLQLkepWM70O2hu1zPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nUE7aHs/qq1ZhAm/05f7YAB7mM4pT9gwtGrVqeqTYmVQ6Dk27GYIPPNr3U/Tt/b52CU57SJeITqFYcaKr3MS5rSFqIqOL1xHZ9jYegDkiFciid/LNCitehvzb4HTZm0jYnme8wDHMMBRefZ3ncn/cuIGBDn5onie4PX2qNehw4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Xr10iyQL; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-531618a6023so101166e0c.3
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 07:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1750170386; x=1750775186; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YpOAwhaaQKzA9a+hLMz4Fdbv7o6Lk/Fl/Twzh3KUUnM=;
        b=Xr10iyQLc5SYfw8qsI+S5Q4TRW+DRlSFnwIbjP6XtU/Do+t7a5e4c2jmayYdQb/25r
         qBZiX2ik+rCwelSHW0Zey1b3yPdpA1tMdoecFzcmCSRS08mwJ1jiPysehg+cA5g8L/CO
         lgg8tllWtL5e3kPkuxZnj0g9v+hOZDTGQhZfDAk7ewWqZUPkpsjj+X8Qv+WlsBIYO1UE
         GjLK/M5+WjgZ8huEcureKP3XZmBBQxsjpzWw9LrONFFpfTBYysBX30GLGFg13IIQ4Yeu
         dT2y1U9NPI56a9lpf23CWdffconpMtZ9zaakqJiKMKDRMi1yi9dyHZ4JPYW54qX+l41y
         xp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170386; x=1750775186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpOAwhaaQKzA9a+hLMz4Fdbv7o6Lk/Fl/Twzh3KUUnM=;
        b=OzoTQA3UD1o9nIKTOz6S6/L0tGO/DznnvOwnBkJilDEsAma3suj2vT7fgHDC3H1gvs
         r5/ISY4yC4OXp8c1QeUnf6YR98A84jlCRZqzQeb/d/ZByQ+KdaAbLqdTZS1jvwggXytC
         fvRfnnrcfrQy6Enf4DIZfTtvoPA8SS0xVieBY0pgfLWcA/oNr2QR/2AB9U0FacskBEqd
         y5t5f1r5l+PS74elZHGjA5/cC3SGpfwfKOgL72vz5BXAU64vqMc9gHY4xNQFanb8938G
         ZrRaZHxBDysCL2nd6vKSrvauDEWMsGKPuF986fK5LG7LiRpq38MSqXrMtDEJLK04fuTJ
         Bv+A==
X-Forwarded-Encrypted: i=1; AJvYcCWsjhzJNMaGwfentqeFcoUC3zOxBLeGfvXvQUSAArgf22zm3rdGTv2zm00JMal3DRQh9qOC9Bn+x4N2EA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7n0B99ytZW3ghvLNSeTnaUmA9KfLhpWnHbx5y+06jxdH3lAsM
	HmzmteQLZd77CtNCz9cP1jnB4yRAS4VYey0zZwI70kLoro4k7dXGfcKvV5VJoxH6cEMeH3gDCv1
	mIEgnDtzUAiJrvi7kEyHWbYTax/IEcnAQTUqtuPVGBw==
X-Gm-Gg: ASbGncvW7z9Huv1wYMKBPd9ga7sYt4GFgB9Ys+hcazbrqgiz9WxqpJ1oUxlu/35tBev
	NC+aLogQV6MeSYoF1BoldPT3Xs0piSA8YKW9Ww6IVBd303ecgrWomM4/vUDa3LxJ3tA/OXU76Bw
	tEaSUQ5qW2E6gHSzVAlBG1LRfGfKjdOnrdxfMxzly2
X-Google-Smtp-Source: AGHT+IEvy629BwKiuNFR6pwMejlGO2WAZGwWZVOcmHQsFf0NqpfbXWmZwN4PhhADQC4Yr8/b+9IDSb34HzZ3UTA0+E8=
X-Received: by 2002:a05:6122:4881:b0:530:2422:68a8 with SMTP id
 71dfb90a1353d-53172c40e8cmr906039e0c.1.1750170386532; Tue, 17 Jun 2025
 07:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
 <20250617-pispbe-mainline-split-jobs-handling-v6-v8-4-e58ae199c17d@ideasonboard.com>
In-Reply-To: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-4-e58ae199c17d@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Tue, 17 Jun 2025 15:25:52 +0100
X-Gm-Features: Ac12FXxY2MjozgnKj7SQp4qGI8gl5dx5KqJMAcZDD_ubJWJD9OKIvfSseMEz2Tk
Message-ID: <CAEmqJPoxHSgXBp+EH+MWQVHVwYL2N5CnOwC-7W+AFWt1k7Zv+Q@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] media: pisp_be: Fix pm_runtime underrun in probe
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
	David Plowman <david.plowman@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo,

Thank you for this fix.

On Tue, 17 Jun 2025 at 14:54, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> During the probe() routine, the PiSP BE driver needs to power up the
> interface in order to identify and initialize the hardware.
>
> The driver resumes the interface by calling the
> pispbe_runtime_resume() function directly, without going
> through the pm_runtime helpers, but later suspends it by calling
> pm_runtime_put_autosuspend().
>
> This causes a PM usage count imbalance at probe time, notified by the
> runtime_pm framework with the below message in the system log:
>
>  pispbe 1000880000.pisp_be: Runtime PM usage count underflow!
>
> Fix this by resuming the interface using the pm runtime helpers instead
> of calling the resume function directly and use the pm_runtime framework
> in the probe() error path. While at it, remove manual suspend of the
> interface in the remove() function. The driver cannot be unloaded if in
> use, so simply disable runtime pm.
>
> To simplify the implementation, make the driver depend on PM as the
> RPI5 platform where the ISP is integrated in uses the PM framework by
> default.
>
> Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
> Cc: stable@vger.kernel.org
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Tested-by: Naushir Patuck <naush@raspberrypi.com>
Reviewed-by: Naushir Patuck <naush@raspberrypi.com>


> ---
>  drivers/media/platform/raspberrypi/pisp_be/Kconfig   | 1 +
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 ++---
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/Kconfig b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> index 46765a2e4c4d1573757ff842f208834216e582cb..a9e51fd94aadc6add70f883bfcea0c9fa91f0c4b 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> +++ b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> @@ -3,6 +3,7 @@ config VIDEO_RASPBERRYPI_PISP_BE
>         depends on V4L_PLATFORM_DRIVERS
>         depends on VIDEO_DEV
>         depends on ARCH_BCM2835 || COMPILE_TEST
> +       depends on PM
>         select VIDEO_V4L2_SUBDEV_API
>         select MEDIA_CONTROLLER
>         select VIDEOBUF2_DMA_CONTIG
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index ccc6cb99868b842ac0d295f9ec28470303e60788..be794a12362020f42b3cf5bd291b4a1625543b5f 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -1725,7 +1725,7 @@ static int pispbe_probe(struct platform_device *pdev)
>         pm_runtime_use_autosuspend(pispbe->dev);
>         pm_runtime_enable(pispbe->dev);
>
> -       ret = pispbe_runtime_resume(pispbe->dev);
> +       ret = pm_runtime_resume_and_get(pispbe->dev);
>         if (ret)
>                 goto pm_runtime_disable_err;
>
> @@ -1747,7 +1747,7 @@ static int pispbe_probe(struct platform_device *pdev)
>  disable_devs_err:
>         pispbe_destroy_devices(pispbe);
>  pm_runtime_suspend_err:
> -       pispbe_runtime_suspend(pispbe->dev);
> +       pm_runtime_put(pispbe->dev);
>  pm_runtime_disable_err:
>         pm_runtime_dont_use_autosuspend(pispbe->dev);
>         pm_runtime_disable(pispbe->dev);
> @@ -1761,7 +1761,6 @@ static void pispbe_remove(struct platform_device *pdev)
>
>         pispbe_destroy_devices(pispbe);
>
> -       pispbe_runtime_suspend(pispbe->dev);
>         pm_runtime_dont_use_autosuspend(pispbe->dev);
>         pm_runtime_disable(pispbe->dev);
>  }
>
> --
> 2.49.0
>

