Return-Path: <linux-media+bounces-48731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E23CBA5AC
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 06:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0240830CC94A
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 05:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DF626A1A4;
	Sat, 13 Dec 2025 05:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfHts4fo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9388F19DF62
	for <linux-media@vger.kernel.org>; Sat, 13 Dec 2025 05:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765605074; cv=none; b=GHJ8cKN1aMc3STW58erPUT181DMO5sl+qyun2KhE4xY+af/JvVpHzaJA73kPc8KFvYCZMpoDS8PViATAwEHjpzVJ4WKAMCJC9bAmI/VBQrgbQB5TIR57u/XgpgWxyFgRTlanMRzcgKIu8ookgmZlFzr/l/IcviUg4H4R++asifw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765605074; c=relaxed/simple;
	bh=Ucg9q3D0v6rAtcTIoC3bcbK6UjxarZfs96WicJi60fE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OUSnEToTP1LlSnGWG5WcojDJXrbl3YrQe+rb7Jo/cBcoAD1TjSD2RBIZ19SQoC3MIzx+Gj44QocjD2PyRDtbjwoZWFjJBcK9ww2G9QhSgANaeIl7XBmNZwAH7K/mZzcWVEuOR4DDEWfucu1mQUOlLvXm79hK65aHl3JZn2uOJ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfHts4fo; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29f08b909aeso3727085ad.2
        for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 21:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765605071; x=1766209871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ucg9q3D0v6rAtcTIoC3bcbK6UjxarZfs96WicJi60fE=;
        b=TfHts4foRnrTIe/9wDkPEs2gaKxOyzYDz3J+lcDPMgl99IyXH3qcut464sxE4A3tsJ
         V7o/d1M4jn11DZ7uxc9SUqPgkYMQ40TeX5JjnJuutxN3yMRCEPw1AdQNKp0dgRkqshol
         hOsl9oyJNUK3jqz6PlHN/yFBhbt+6YEEvTwqLdyh/hNaZDXQvJb47BDSt6yxd0lKwPlK
         eJPEsUg4cK21VK1RIjYqp6KTUVQxfhtkZvIiRqhzDNpY7WQAfw0cYZf6ArPJdfyhUCPB
         CHYvLqUL2JlGcOXncptoM/egaqWQLACCKf1Oatn5IuO0v5WTK72EaA2rSfv5AHYjS9BN
         X7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765605071; x=1766209871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ucg9q3D0v6rAtcTIoC3bcbK6UjxarZfs96WicJi60fE=;
        b=T79T91Fcekb2SUUiSwwXPE4BxNuHLc4fVB0QlCTtITD5Abr+F4xyh993MGFiUY9RIM
         bZi1VFBycpt9mnHL13/d8qDbbaTV7VXvN8ytg5Zuw6iAGJWQzy7MgbklMQB4Wh55uXBB
         qo/KwVAnl+FGVMEhNH6PvwC3BSsVDhYODtc+xSS293PJGth3+zOTHRbJSKxJwU7BV1+m
         r+rR3BUUMshrnMu2/D17700nUF8zu3zokduqTKW9Yux2jzh8ew2xS2CLjslA4zTceFZg
         TPinSZcmurA2diPhQWlbv++Q9V8mk3u7jLjNR9TBmf63Djmlo/hbJaimZBsUOsaFTLb4
         VNUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA1mDny87/UJTKYZam4KfFXA4Ccxw4qyLEIhiM278+7ifoTdTeY1Iqao9XZVYOjnrsTfwC5rLCXRYhCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUCqR3yuVGooPhXE2CFRDM/9S+l7Rh34kCBdvW28xKeSRcVqhn
	uEOigRL6QgavsYr61yklhTWjRJrUwa4//DkrbRlUoANw/H+3qECe/DNX
X-Gm-Gg: AY/fxX46LWEU0E4kg7vd3zLEpTPQca2AyW/tZLH6l4PV27j2WJsbmnnX3GOwfX3eD3i
	cA+3FbHNwLflPmFEeScN8FgsQQPwm/TqXP6RcDHK+ENigBtpqmS1Ih2at353l3a3rj28/euuNPU
	2D1bEYL5EqpW3GmZY17FCMc1px3hPCTb85VppXKJAdru1P/mSM8aczjPtJlaSkXTfrQ0peIhin1
	FSnRwY8f8cN3voLaodcfAceChON1nNNm9O+Zs2xzcJwq6iC6sbdKcduL6N5o4zZX8xpRqFLgczO
	GiYMWfOa9DzRoL+cVYneOGMuxApJSN0MPYwXJ7UtAadotIf/RldD6K+MCMEdFCZ5lW4ukmDloTx
	w5v2XkYJP/9t1ZgYoAxulAF4AdRk1LhNZxTb5EFFNplCw3ag7H7UBzYW9qCbVxAVdD2jpe9gf8f
	yUeKE3wfyDf+ZWUq7mV+LMZA==
X-Google-Smtp-Source: AGHT+IEVdF3D+n6cGQxNGJqnrYCRTg/VLTUaOirWaicTa+47OE5NWo1Zj/EmbxRkTtSFJrNN1gu79A==
X-Received: by 2002:a17:903:2cd:b0:297:df7c:ed32 with SMTP id d9443c01a7336-29f237bac9dmr25852125ad.0.1765605070738;
        Fri, 12 Dec 2025 21:51:10 -0800 (PST)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea043d62sm69743215ad.82.2025.12.12.21.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 21:51:10 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: jonas@kwiboo.se
Cc: detlev.casanova@collabora.com,
	ezequiel@vanguardiasur.com.ar,
	heiko@sntech.de,
	hverkuil@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com
Subject: Re: [PATCH] media: rkvdec: set ctx->image_fmt in rkvdec_s_capture_fmt
Date: Sat, 13 Dec 2025 13:50:52 +0800
Message-ID: <20251213055052.3046554-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5c2dec91-667f-48f6-b958-e0cf81cab569@kwiboo.se>
References: <5c2dec91-667f-48f6-b958-e0cf81cab569@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 12 Dec 2025 17:43:35 +0100, Jonas Karlman wrote:
>Chromium should be fixed to follow spec at 4.5.3.2. Initialization [1]:

Hi Jonas,

Thank you for guiding me to the spec, I will look into chromium and try
to fix it.

Best regards,
Jianfeng

