Return-Path: <linux-media+bounces-27175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B132A48A03
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 21:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA4D2188F938
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 20:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED56626F466;
	Thu, 27 Feb 2025 20:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="h0vs5VMf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A2422577E
	for <linux-media@vger.kernel.org>; Thu, 27 Feb 2025 20:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740688902; cv=none; b=r8YL6/vJ9S6aAuot8wzMGCgMhPhYVbmFXXU5An45LzpnlNi31ZI7xiTYsxZL2wfNDecltMUaMUGKTWYVZNcp24iiP0RmQZP8KwpuqJ1Z6s3ZdSf4apvHZninhqE6CmBvJv3lv1N1yKr6yf7EbKu9NMCTJzbPtj79Tc+iNOMhITU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740688902; c=relaxed/simple;
	bh=Tx6boC4gYXJ9Th5zfPZTmDvjQqxy63e31h6S21OZJVM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HAEjEnzbyk2j/HlW84b8xHGNAqGQP1T/c2QRuJrLLh5volFMweCImhoYfrgaa81Z7ysCG6PCGgPso0qR/G0lUz0MESOjvkDVldEf00e5Lko9jCdh6uF+AcWA0WXM4G7tjWFe331f8WPMCtJl/VVLicnz5JM7QfUtKjEu+7kKP/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=h0vs5VMf; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso2391878a91.1
        for <linux-media@vger.kernel.org>; Thu, 27 Feb 2025 12:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740688898; x=1741293698; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=clTRvC/wdzopEiQfx/ePTR85z0m/Iogbs7VUPatsFdo=;
        b=h0vs5VMfCjRz7naYFN0Z7s/CP/e/6Q6QG0iHSTt7gJtxB/x7gJV45HxEhlpy2YxzMs
         ExZz5HgdfTvYFwuYJxtrS26UP0K7XNm6zx/5rRkfEBOUbeo2D9zc32oldYTF48TKmO6c
         XS2M1CiLLHDWbLblgnmy/uwdm+0jN86q6tqBtLAUZysvP3K90pq+vGK+sppE5YDhwnHX
         9gYDgc23F0Gy2lONiAGM1e8o/w6/Wv4SY4U0eVWFdvmbkYq4S8vybsVRWw+51cOuteYy
         45WO5eigoKyWYmac2tOwLgRB9yD7BhdFAmOKvE+/607o884dv5wCBPiSpQkf/w81GlKN
         utsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740688898; x=1741293698;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clTRvC/wdzopEiQfx/ePTR85z0m/Iogbs7VUPatsFdo=;
        b=DlRlCzOLvcVgNxbt6UvI08q3ER3egib3Po89m+92deS9CeLVSKBiVI36Z8j+z06ufs
         9gxOtPI708KRsMIRWEE6NHhmsaVNIVz5VKS/Htngn/UNKo/9Y8TpXT3VLBJ/yKjQ1JyK
         6iBb9/ukBGg+qrcdltENogL14rhweuP/VnIGC4NNZ8Tnqj8Suy3844p6PG8/m1dhs5xM
         6zDZejSaNjLAAAGMQ1pT/rdhBOGOi0oLFv8sG53d3Sv7VFZGpvxtyPceSwcAbcWYE6bS
         jBw9N1Gz0kpfF5+jCgbFzIdtWW0YM3seNDTgVhQkowkOlQU6UCIYXC9YoSOOyJ30+ofs
         G5Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWyGYUgL1ZDrmLSw3bvDI8QIxnRFuYq5Ch/wHrksysZyEWscge1ywTj8CZu1ZV8kxcobD9pZhJHxkLMDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Zd2QmBEAxiMucgO/otYlsQhdAs2RhIqxhrAFDGps6mlhFdrB
	x5u3eGtC9Fk/H0NZlBh/WyfOGxNfddWD9BG/tAoxh/9EQVjbBX18psZZpodIoUc=
X-Gm-Gg: ASbGnctmW1nxNwL+1juop51SkAk9Yp37E41QkQMqtIV6gDTzyiZqGgJlwziHbHn12rB
	OqpLPCUrG2duYr9fi8AJUsuIM5Rdtffb5UNj5PLnMtwHGrvMSpJ4+icYuSXbhyabP6xduCqbEwo
	c/t73DGx3aCBusLkjBuPSsf0jTtQLb6gSK/ydK9GPQFXJ+Rn1aJ0luCOJQ5anIjg6Gh8uRSkmoT
	+PWpcet8WsHGbl4MMap2/h0ydvA7Y9NPgi+LiYhEd5ZD0b4t4Iylx/Par6/FWNY7R2D5RLx9vth
	8y37lEGeSCTBgy2bBgTSJj8/
X-Google-Smtp-Source: AGHT+IGcDSq9kQm9GN3jvlclLNo2d1g344gWvKk/waPzxPhjaU3mjk7KECM79FXosWxmAwGGgt/Q9g==
X-Received: by 2002:a17:90b:3a89:b0:2fe:8c4f:e7c4 with SMTP id 98e67ed59e1d1-2febab760a0mr1133381a91.15.1740688898561;
        Thu, 27 Feb 2025 12:41:38 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe82840b64sm4668880a91.38.2025.02.27.12.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 12:41:38 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
 <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ricardo Ribalda
 <ribalda@chromium.org>, Niklas =?utf-8?Q?S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat
 <alain.volmat@foss.st.com>, "stanimir.k.varbanov@gmail.com"
 <stanimir.k.varbanov@gmail.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Michael Tretter
 <m.tretter@pengutronix.de>, Tomasz Figa <tfiga@chromium.org>, "Hu, Jerry
 W" <jerry.w.hu@intel.com>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Steve Cho <stevecho@chromium.org>, Kieran
 Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANN v2] Media Summit 2025: Nice in May or Amsterdam in August?
In-Reply-To: <ab1fef54-d83f-46e2-a6c8-42b0761368fc@xs4all.nl>
References: <ab1fef54-d83f-46e2-a6c8-42b0761368fc@xs4all.nl>
Date: Thu, 27 Feb 2025 12:41:37 -0800
Message-ID: <7hmse7xgqm.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hans Verkuil <hverkuil@xs4all.nl> writes:

[...]

> 1) Co-locate with the Embedded Recipes conference in Nice in France which is held on May 14-16:
>
>    https://embedded-recipes.org/2025/
>
>    So a media summit would probably take place on May 11 or 12.
>
>    This conference is a one room, one track format. But the room holds up to 200
>    people and the expectation is that it is not a problem to get tickets for it.
>    And we might be able to reserve some tickets for us as well.
>
>    There is a libcamera workshop on Friday, and AFAIK a pipewire workshop on the same day.
>    GStreamer plans an event during the weekend after ER.

I'm one of the organizers of ER, so If you end up co-locating with ER,
it would be great to have you attend ER also.  I'm also still organizing
talks & speakers for ER, so if you have any ideas for good talks, please
don't hesitate to check our CFP and submit your idea(s):

   https://embedded-recipes.org/2025/cfp/

Hope to see/meet some of you in Nice!

Kevin

