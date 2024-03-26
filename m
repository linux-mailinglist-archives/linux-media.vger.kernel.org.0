Return-Path: <linux-media+bounces-7821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 042CE88BCFB
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 09:59:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B933B22363
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 08:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEF41BC3F;
	Tue, 26 Mar 2024 08:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TIouS957"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DFD1643A
	for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711443572; cv=none; b=UMEiHwR2zsO1lHHE9zO5B3BzClg4UAp0ec2W532/sAT0/UoLuC98NohXtXH+klPPufl+9kJVnNSWX1KZ/tvOdOEDKB8NkVFodwsCqayZ9bi0DJTmkiRT/Eo7jnXh9NmiTbrv+OiGapLSAbva+a+c7XDF+FW32N9GmB4Wt8fXVFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711443572; c=relaxed/simple;
	bh=wV/EQGWM37o9gV7TNgoer7nZ6ODRKLvAZpARz5FCfPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDiqdifFAkWOiyoKQ6CtKl3IEZl/oSU/YsLrzOI6Wvk1a+tbenDMLnt5xbyUJYDSENlwAM9uTDWfmW4VI3Oht+usp8k+VTZrqMBIi5/oBTnSU9ySGWEejD/PFDh3HQd7pzG+sjK4DS5MaHKesBD8l0Ku1FmsJlt0XXJ0zMtLLVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TIouS957; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-29c731ba369so3789264a91.3
        for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 01:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711443570; x=1712048370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wXXZ7I2S+pmCNq9J5Ztqf++BnYQI/03nvNeZpPx+xyU=;
        b=TIouS957g664/9o/NlYLMlWnLE8xzLeKPi6GYxx5afU/fGnq612ir0NSN/64b/Rj2m
         waRZtLOs+UZpKNb5iUDAIrEuy29CBtt/DXljynfTo69vHB0cKPEgQ25A0+ewpVKS27Tl
         XwuAHnO56pMd3CgWkonPY6CavyrAa8C3kZu/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711443570; x=1712048370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXXZ7I2S+pmCNq9J5Ztqf++BnYQI/03nvNeZpPx+xyU=;
        b=n10jDsbfc6UHB7ywBH12zqzVvC/Oc8um+jC+iZBvMFNIw3ipkm3gUCvSJaC3s6e7Nj
         fUTS3OYw2I8L4SC5chVv9YQiZJJ/LUrqD/SWQCpgUzBMvtwL8DapOMLGOkUdxhp7IU6F
         LTWu6NxWfVaSVokiChf2OCF5eUOBQI4tejigAU6sn5fRL7UE1pAJWoa9kmwsvTqoKKJ6
         tpWleyaEqu5VMrR2H0PpTu+YtabAz8328Kl2qet/MjawaIwCXHBdCdvjQCrd5TzwmCGV
         ED1Hp2Syv/tWBl7KrDrOUrif019ANqtBwAjq3Zcd4wkS8Mq59/A8qSruONK3zEnGSrje
         e8jg==
X-Forwarded-Encrypted: i=1; AJvYcCV3mpNZOPdRbSnPX8s1Ra9s77DHU9LpxPKkP8Jw7pNH54ZJF9rYvYpPlKXD2DSYmJS3WbN0AhmZmhW0wYu4jF1bFEWa98z1gJWa6ls=
X-Gm-Message-State: AOJu0YwFlYiDED1WUejOO0A+ASiw5AfSzCHHmhk8x4vxpXWibfcwB5pG
	i9oqi5a+3okopWvKvMW8GiwLKZ8snKHozZ6MxLUq4Z2OnW3W9UmTEbwtSndFvQ==
X-Google-Smtp-Source: AGHT+IG0I3qcKcasVVSl6gTL9bPuD+8TYH73Fvc0nKcDLKacOqN+6H1VA4Nj6RAlv+k6gDuO4078Qw==
X-Received: by 2002:a17:90a:fa95:b0:2a0:4c10:da52 with SMTP id cu21-20020a17090afa9500b002a04c10da52mr7776876pjb.36.1711443570013;
        Tue, 26 Mar 2024 01:59:30 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:10b5:aeae:7583:f4c3])
        by smtp.gmail.com with ESMTPSA id l18-20020a17090a599200b0029beb0fc60fsm11226563pji.28.2024.03.26.01.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 01:59:29 -0700 (PDT)
Date: Tue, 26 Mar 2024 17:59:25 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Max Staudt <mstaudt@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sean Paul <seanpaul@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 2/3] media: uvcvideo: Refactor the status irq API
Message-ID: <20240326085925.GC1041856@google.com>
References: <20240325-guenter-mini-v3-0-c4bc61d84e03@chromium.org>
 <20240325-guenter-mini-v3-2-c4bc61d84e03@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325-guenter-mini-v3-2-c4bc61d84e03@chromium.org>

On (24/03/25 16:31), Ricardo Ribalda wrote:
>  
>  void uvc_status_unregister(struct uvc_device *dev)
>  {
> -	usb_kill_urb(dev->int_urb);
> +	uvc_status_suspend(dev);
>  	uvc_input_unregister(dev);
>  }


Was the removal of usb_kill_urb() intended? If so, does it deserve
to be a patch on its own?

