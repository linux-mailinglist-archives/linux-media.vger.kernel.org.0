Return-Path: <linux-media+bounces-7819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 900CF88BCA9
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 09:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 494E82E3654
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 08:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FA112B82;
	Tue, 26 Mar 2024 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bBu0x7Qq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D9A3DAC1F
	for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 08:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711442544; cv=none; b=oQ6y1P9TmOZ0QA/B1kD0N0I/3HwpWKY6ljKkSGIDBBf/zloYwGtKJiIxmPoOm0vFs5UGx7o2eWkfcy3Qxlew9lhbWMgbrodlgDidQFU9hXiCMkH76d6zGQWSoUsWNmdRfvdKauOVYmh0WMjQj4UKRgy9iwb5+qZN6l6RSS3dAs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711442544; c=relaxed/simple;
	bh=kuPEe1BoQTJFc2AUuBmgpz4yVcIxcJz3CaXsR1n7fk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCvpCWIYML/ItKnWGNmgdBlRXf1jrx634Ecnh/DOw/XAJAXIS1J7U3dDCqKWRNKGHVGe4qhAMYXqqGicFNHIO6V3QbzYsOSAayeMB6BWQFnwdoGwjJNpNghZiFi1yRAkKDMiWP4bwPO4yaYAx6dWjPMRyj8znIccsoTKF43060U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bBu0x7Qq; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e704078860so3700494b3a.0
        for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 01:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711442542; x=1712047342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/3h3bAU2IX0EB0gn3S1QQMZf5Ge3/aPCneW3boA4Y8M=;
        b=bBu0x7QqrswvAbYqo5uNV0u09VCgr807PK/YaSSduS80LNMZlzyTp7Dkz/C3XH1nJb
         M0/vS2ON0DuEOOh/D5I5L+vhbQn/+jLoZWwKg6NYZO9WcrQGADB88UYJsQzycUmNSzga
         LYcGEGcnnne9ICwkNJUaAwl5FSaa/AYePtWLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711442542; x=1712047342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3h3bAU2IX0EB0gn3S1QQMZf5Ge3/aPCneW3boA4Y8M=;
        b=t+9/Q1u9j40m6+3eMC+xwBcDtKD9HC5rsIFKMVdICuLXExCGH1ZafOYvG0gB/OUUQk
         XlkXVs16lipaq7UZPFWAhEnvhDRgLs+rK7eS5OaSGz8/G20+OEveS3XGpB2Fjeoapy3K
         LKl/poGWxNWUIZ3W8ZnbMPYrB6xK8hV8EzajOuh3hzf9rsswRTnI4JImIZ6WDOPMEK5o
         KwmOLYPyB9MXpuktxlep1YCx13UoXHACh5ZnXTLECYYSWQWVALBLbeqCo05IsiFEAQMa
         RIweki/o5+8pXV3vxhE3UC3bA8Tl8pk/mwHG0hXHJ2PJ2L6CpPvSJhxsa5mj3kBp4myY
         eZBg==
X-Forwarded-Encrypted: i=1; AJvYcCWH0g5JnFxDzoZ+Gy4hxptbpnQ1p1Loq3Ai23/b4b3RsXNieYJhBOJRPJODKKKXeOt7iLKTe5vpaRTOK6bIt5teyWO5yGVVyVlGfD4=
X-Gm-Message-State: AOJu0YxXSFL7hpajhHZB9oEKiIxE684I1ntByxrEAT+f5UkxUWb7N7k2
	ElJNUakE/kQHpBl6FpQmoBVAknUoyWWWiMUto3y2+fzFfElmV3ifCn9vP12rIQ==
X-Google-Smtp-Source: AGHT+IGve+mTHopZRTJXGmpkPMe6J2fEMTfF2BadNQ0JCYre3KPYhIGs7Z/mFu1RkFC5QTJ7USBTTQ==
X-Received: by 2002:a05:6a20:d398:b0:1a3:d60f:738f with SMTP id iq24-20020a056a20d39800b001a3d60f738fmr695431pzb.18.1711442541913;
        Tue, 26 Mar 2024 01:42:21 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:10b5:aeae:7583:f4c3])
        by smtp.gmail.com with ESMTPSA id ko12-20020a17090307cc00b001e0f2dc4165sm771704plb.60.2024.03.26.01.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 01:42:21 -0700 (PDT)
Date: Tue, 26 Mar 2024 17:42:17 +0900
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
Message-ID: <20240326084217.GB1041856@google.com>
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
>  drivers/media/usb/uvc/uvc_driver.c | 13 ++-------
>  drivers/media/usb/uvc/uvc_status.c | 57 ++++++++++++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c   | 22 ++++-----------
>  drivers/media/usb/uvc/uvcvideo.h   | 10 ++++---
>  4 files changed, 68 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 17fc945c8deb6..b579644ac0745 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2116,7 +2116,6 @@ static int uvc_probe(struct usb_interface *intf,
>  	INIT_LIST_HEAD(&dev->streams);
>  	kref_init(&dev->ref);
>  	atomic_set(&dev->nmappings, 0);
> -	mutex_init(&dev->lock);

Where is this getting initialized?

