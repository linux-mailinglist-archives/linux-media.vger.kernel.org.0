Return-Path: <linux-media+bounces-28259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4BBA616C3
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 17:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66538189106D
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089D72036E6;
	Fri, 14 Mar 2025 16:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="abNLYvn1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE9020409B
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 16:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970919; cv=none; b=QNN/efWJdI1BLpgrIkDlpQ0xvULwaJLxWaaEzpBGCqSDfpWEUFJ78W5MjQoQwWifhBKcOAUAIGz1zZ3d+jrkivn7EW4Zi03YawiUnxmpOTlVsw9ymap7yE6A/2c2eeBnA74rZOd15vxX3VNVNfUOANQ45frIbhp/DzF5d6MmzWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970919; c=relaxed/simple;
	bh=Wm6XysKRvaiFEjpkeqDH2169Ycwmxr4WLD/kLfKdP/8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pQCiOaK6Gh93sCjukw1pew8C50t1HlONqw5TLtdp79kOWPsCAgQ8Km/cH0iYnnLZQhftqof91puNQ/OfyU+CdL6xqD7H8d29vTlopJolxZ01o711tV4aXHbw2hoqYbZr9wx2rgFzO+fs5rFiKJQYGlWLklfmz4YshYTV8qeDLAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=abNLYvn1; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-22423adf751so38003565ad.2
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 09:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741970915; x=1742575715; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LukerloPz7+npFTigicqrBagkMi5/btBZ+YEgTTx5oo=;
        b=abNLYvn1cziv6XAkhpGOirCunUovglLQ2zZgXgqIsdX9DuMEdEOJPsPzNJGSTqqXN8
         PiRtBFroFepBfQqJezKkhfIsUgfTNb8bpjcPG/zrzdAN1+XHB3QNS2Sdm49hiG839/sI
         1EU6AO1YhFFhmTzUdxx5jGKKeb2b6fb5kIUsu+UUEMNFayLxu4/Um3P/x1gytKM9jDb1
         +SGtWN8sYd+dWp1kLiqjoF46x+jYo1BZya3laUVHoN+D8J4GX4NXXj92f6ZVS4ajCPsH
         WDauA7xLm8SWKd8ny8OzZ4MWI5N8AIxn2Vx3kc9Au9xNieXy43nbUyAAcce/8NShZL5R
         kOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741970915; x=1742575715;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LukerloPz7+npFTigicqrBagkMi5/btBZ+YEgTTx5oo=;
        b=QzQ1ByAwW+Hn6c39uNhw++Y82TPec9QJweMbK3RTowNb0hW3+cSJKimuYjvDiFOT1y
         PndfVbQa4x9UuAayTG5AMT5a6tZ1QRkJXnhZBjThTDrivzw54rQ0ZBcKgJnhWcMky/NO
         1Y8nCMiDC/ZCAzfCko2BsSHJJbyk827KH3XLvCwYAfNHg6UpVSdHr3EE9ADEdzVvAhu3
         iq2qtvIBfoF1FBmj/qW03s7AGHm7xKOgFc+sKn56oOcHlYggNcH2yPOEdszVkRzLPq7o
         Kst1i/Xtdj4JuPej/LlqBZv2ZyHjxX56ZQPqZ1L9yBcrQdV0/pvCRDqOPC4/tAOCVS1O
         iqvA==
X-Gm-Message-State: AOJu0YxSxx91kCrB3I7R3lARGb/BBFuaDrMvqnATRxysWWAi6afq37OR
	Di0n/wCVVI3ZvbXqoanIZo5H9gV+4uWQK9p4Z0hUoFqVfzJnaYKyZwdCt+lkGkE=
X-Gm-Gg: ASbGncsvgxhO3W1PiBiJk35DlRlp1dj1XN9XS2iFm2ph5YbjQ8u0LmHyVGzziFbyyfV
	iuUm/i40tcjRfzWtWuYjyBWNpx0zR+dYvGOj9QuC3ngkE6VyyM6Cx4nDxlZ9bY7U7OmhTrsju0z
	vI9B6piyy1zN9XGln8WfYBsX/okJ9Ga4mKLZtS0yNorlKrGeyvj0ycjm7Bx+2yAbnoKNVamMqOD
	1cZzXmspKC4XdizBxk6yF/p8J3T85r7shSuNI9lCY+1txZ0tj/prA1HVff+IzkT4a7Hu8zj8WnK
	x+hkfedRG/N/qbpYZosA/6lHCt0ccC+C9Jc5MDVq37o=
X-Google-Smtp-Source: AGHT+IEaWY7KhRs1WKiJyOa0RRj5x6/StXYf3HCRI59wffIwUsDar1c7Wp/e4FQuNjazog3bVRA44g==
X-Received: by 2002:a05:6a00:21d3:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-73722470508mr4478805b3a.21.1741970915337;
        Fri, 14 Mar 2025 09:48:35 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea964e3sm2967774a12.76.2025.03.14.09.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 09:48:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Paul Kocialkowski <paulk@sys-base.io>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Laurent Pinchart
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
In-Reply-To: <3ea9c657-1324-44f0-8820-02817020cf0d@xs4all.nl>
References: <ab1fef54-d83f-46e2-a6c8-42b0761368fc@xs4all.nl>
 <d29353c7-7ae2-411b-9c13-3fbd7bd63da2@xs4all.nl>
 <Z88gGktbzEsmuehK@collins>
 <3ea9c657-1324-44f0-8820-02817020cf0d@xs4all.nl>
Date: Fri, 14 Mar 2025 09:48:34 -0700
Message-ID: <7hplijsgm5.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hans Verkuil <hverkuil@xs4all.nl> writes:

> I can confirm that the Media Summit will be held in Nice. I hope to be able to
> post more details by the end of this week.

Since this is now confirmed for Nice, for those of you also interested
in attending ER (14-16 may), registration is open:

   https://embedded-recipes.org/2025/attend/

Kevin

