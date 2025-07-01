Return-Path: <linux-media+bounces-36458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0064AF00A6
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 18:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39246176F8F
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 16:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EB627E07C;
	Tue,  1 Jul 2025 16:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bBKaTWT4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828B927D780
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 16:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388518; cv=none; b=C7+xhLGA/ljUBwqUy0CxU73kSpVHMqdEm7Jry1lIQRa+MrLPclciJlCyo3fogmcNhJy4MW833ptldGqsnnZzsAx7mqHhAQJCUFsydiMaFCa1HoWiuUgsUDPs14iRjK3fdX07+rbET6wDhLc+TlWMU7GkLHQvKgOikUUxPMZnvZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388518; c=relaxed/simple;
	bh=tI+4wKtSKHs0zOZaF0kRYAvQFo9ILAwIjWfI+LgVGds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6ql7eLJ0dRoytRum9GDHrcraekflaDoBQRbvpFRD9isWYZZMcTfX9wuGkwt2GxAURSbPvo0UfgM7g/HL3UhfoTxjJ4ilfmaAKWr/rV7Hu85726F6JmgkKnsj4RjJnb2+o74+f4eAxz2bLSQ5pf7Kxjnxgi9JVVjHkrqZc9GpSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bBKaTWT4; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5551a770828so2765122e87.1
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 09:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751388514; x=1751993314; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P8f/YI2ig587JvEzYvoYDEUyD2K6VzX+ZT6F/a8hE1A=;
        b=bBKaTWT4KOCePPrrQ+RV4FE01er5AlkiVCsQrp35BkKxv/Bo8Svz8SB3nvAaY2bdAK
         QBiwwISPTdrbvRSodrUOUHtPrH/EtLBCoaCM1pv4kiVkEQPRo6cr0N1nAMbR2xYV9lPt
         moDglLcIbxUDH2v8WOW7jkXdbBt6S+Tam3uNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751388514; x=1751993314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8f/YI2ig587JvEzYvoYDEUyD2K6VzX+ZT6F/a8hE1A=;
        b=lkp78BuEnoc2/1wNJwACfPz97oNoVB9/xPhwOn5c31PukCb99VH9LDUbNoO+dGxqQk
         I7c1jknoiw5DhlYTzbXAzDxEtMNkr4DMV0AnYNVyFk3oZDkhbBHURzF3x/TGBw4/OAbf
         SGtWnaUBY8LOfWZ+5cqeHypc8nDlIKg8D7djED6FrrrUmLhPEJ2fjqih9NwqZmoxnggR
         joxPUtzDqot/pzYWSNBy2EyKNeeWMBcg2Rxulc0zwEz0O687iw9Z+5y1yZ96ByMiBKnP
         +IP9tbxNJi/xHi/WF6MefOQB9uiUpYrpDFV99P0qh1a99kw0K8RVr9F6iYKzrtcGhuhG
         MUgg==
X-Forwarded-Encrypted: i=1; AJvYcCVW9IUJoGZUELPpL2/RIepqDikQiRWzfqHhQ4BWkk7QiFjX3kUuM30dxU/gCI4BPim1eBNKJX5ygFjODQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7iPd7tSL0+eUDXGdpXGuNlagIv8aOectLvhdVUl1ua1cSOVsS
	AJ3DbkPgM8W60piR8lH2oN+HmJyfOxfiTX7SewGBuydEa1HU7r7eqhR7KOLO+691gBQ53luCwdv
	PAWyUXg==
X-Gm-Gg: ASbGncv8JphhOEGz1Dw4huZS8ixyBHMmj6hSIKmjzG3Zc7iRdGMSnsGQS12pZxLHFKP
	j35f5UhBb/4xP8V++locAEbchqr09xnz004OE064I5jTlllHySWc6efjsiw9ZPMWKNBrf0GFMkn
	LPzXflbwnp0rkJb3gYdf1Dx1NPm8BcHLXYeYNvaWg/HGzHI3jUw9nJr+YIHof+se91K4DJAcuRF
	cznU9xkP79jhjV81hfFGBMSbXgJIWtKP/F9s/XdQfC9MUwKAPsmj7k+RJpi8gs+hQSQLr88j0ti
	xEo0H27M5+ZFHoGAZqwHhx5XVX+TC89dhzXAnZm1cqoQl0jpmLZd+pIiBYwCCIWdcxT/O6n+QJp
	ayUNW8xkXhpwZ01ohpwk6uOf7
X-Google-Smtp-Source: AGHT+IHNkI0flK4dn9MU2+Rm9G4XkhPnRrXXvhzuvga8sWlNxYWHjDEgCKmWgGJ10a4czSZExvdC1A==
X-Received: by 2002:a05:6512:398e:b0:554:fa07:c56 with SMTP id 2adb3069b0e04-5550b9efd5fmr5823842e87.26.1751388514360;
        Tue, 01 Jul 2025 09:48:34 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24012asm1902055e87.7.2025.07.01.09.48.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 09:48:34 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553cf020383so6624812e87.2
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 09:48:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6OqlTKagrCdPgCqblV1+C3aTAm0gh0D12JA0hHBDv0R2Js9zsoPM8brA3tJPZCrSxxwjbkvAyoSOfFg==@vger.kernel.org
X-Received: by 2002:a05:6512:b97:b0:553:adff:87da with SMTP id
 2adb3069b0e04-5550b9eec3cmr5635002e87.29.1751388513261; Tue, 01 Jul 2025
 09:48:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701145240.105959-1-desnesn@redhat.com>
In-Reply-To: <20250701145240.105959-1-desnesn@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 18:48:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCs_Pz-wgnYNVA7Zt4RhtgN256i32aCw0mE4XFv3b49ygw@mail.gmail.com>
X-Gm-Features: Ac12FXySL1Z_QmxcJurW6V_oa_rceHTH3CgKaysROWFAC3NSUzFBeTQCoFgVYQw
Message-ID: <CANiDSCs_Pz-wgnYNVA7Zt4RhtgN256i32aCw0mE4XFv3b49ygw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: avoid variable shadowing in uvc_ctrl_cleanup_fh
To: Desnes Nunes <desnesn@redhat.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Desnes

On Tue, 1 Jul 2025 at 16:59, Desnes Nunes <desnesn@redhat.com> wrote:
>
> This avoids a variable loop shadowing occurring between the local loop
> iterating through the uvc_entity's controls and the global one going
> through the pending async controls of the file handle
>
> Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter per IOCTL")
If you add a fixes you need to add
Cc: stable@kernel.org

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 44b6513c5264..91cc874da798 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -3260,7 +3260,6 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  {
>         struct uvc_entity *entity;
> -       int i;
>
>         guard(mutex)(&handle->chain->ctrl_mutex);
>
> @@ -3278,7 +3277,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>         if (!WARN_ON(handle->pending_async_ctrls))
>                 return;
>
> -       for (i = 0; i < handle->pending_async_ctrls; i++)

nitpick: I would have called the variable i, not j.  For me j usually
means nested loop. But up to you

I am also not against your first version with a different commit message.

Thanks!
> +       for (unsigned int j = 0; j < handle->pending_async_ctrls; j++)
>                 uvc_pm_put(handle->stream->dev);
>  }
>
> --
> 2.49.0
>
>


-- 
Ricardo Ribalda

