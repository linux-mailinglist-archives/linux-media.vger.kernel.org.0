Return-Path: <linux-media+bounces-28287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84319A62D9D
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 14:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3669B7A5DCA
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 13:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5262E1FCD07;
	Sat, 15 Mar 2025 13:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NNZdh92u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3A11FCD00
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 13:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742046039; cv=none; b=kTJLYrlOsF3KIdbsenN4OUHpN2QRzgVfmSQ3fsIPOSAA9ZVTI2ITKPsb+pA9V0B4Y5fcj1BJ/E6kx+XbkjYeEp9nc2+h5mHrV4yRxkcexotqin3U6kU6i9756OTXDHDi/NKNY7ZOIllCtBX2EU14pWApFn+aIwYL71Ri0d4UNKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742046039; c=relaxed/simple;
	bh=ob7EuhXpGnktGfDcOTWv+3MsFvXv3RvEalxeOvINqTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RzHeOpCuMZUeMpXKMClM4Y0ZWibsuPUgeOl5JbxFTWJ7O8kekEFhkpjhqEDo7hIVpPZ6A4bMhPzBiLcA12R51ObsLUBpBiAoj2g3y2cey0Oq0BwL7Lqkj+Tq2whqhQCvYG5sE2FBRVAgUVpQ7CvXWjN9qUEKv4W6LsM1RaK65gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NNZdh92u; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac345bd8e13so109544266b.0
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 06:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742046036; x=1742650836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZKOsr5RYKkjXg4DicEjwNb17WMUuY3yeez9AejhVeU=;
        b=NNZdh92uXLHVYcbIDJqL0HU0oLZr8OnB3s6WHXHrNFtUfk7IphrYAZaEjpquvrU7lE
         3VdFI4kfpGAsbigwhCdHXt/UvL0gvj1md7zfzaTnCK8kzaUW1hfVFKrSM8wan4xkWIhB
         +iQHYagPBh8eK/LgkLinsHvVkbMCjXoUzAg3vF/p5Tke+XGL/VgPU+JBnIf67rvu3SG2
         mOyXljpW7njtTuQ0LgAC81+JzrhqB+Y7VMHP5CeUj5+HbTwM1nq5YsveOL/VQRgWx1sX
         EsOVx3SHfZBgGXvR+iQecCTIgg/9bcmW+V1uC/+s20eqMADfJuWx2vA4HUwvpZWUlhBA
         b/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742046036; x=1742650836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZKOsr5RYKkjXg4DicEjwNb17WMUuY3yeez9AejhVeU=;
        b=DoCM8tsO/7jL2h+e8MwhA+yu9YfOKPSJQSlIekPRaznMDEODSNgTbzgio5YUwpJkhZ
         48YHR4ZMmC6Mcz7RnI3O7mbmi/ajJSDOyOXhr68CjvCaUX/MmclLmjybUdrszmFQLMc6
         5Ozp2q0T84/4+qtiz4PPoFyGEc2CYFdHG0qoLebhonB93GvwwyELI80hKlg3+822Cu8Z
         bcZR+JbLw+1iDjOk79iI/Gp9h3Xk7TEOul2CYs+MFLhWXGBf1oRxX2ntY4X+279HZeVD
         9aHqFEPyOINsAjgZ4hcELKAvhHk5hRo+adwh1c6in7ej/5EDPpYX9s9+u6HiktfkYkoA
         oZ9g==
X-Forwarded-Encrypted: i=1; AJvYcCWeqiUFFa/f6CYo1PfN2JqPNS4rTiZmGCcdVK+v8N2Gnv/dgXLlj/lYP3zv81B8kYkYXL8EZTUmTQ2paA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiPjzS/QX5ORRTo/CjP7nPYroEams2i0FskxEVZm9pYknFah22
	McK/lfgQXQHMfMTLOOso76dwDqo20h2F2jVcSEKlUg0mJOxHaOg7ZJqfMAV/m8xm1m8p/MKeLbe
	ANxwbeg==
X-Gm-Gg: ASbGncv79CWgrMDj/2xZP2x+3fb+zJ+ADP7k015BmGOFF9BjoW+7PbQXZKDxsZiQcIf
	0kB2bR0AMy7C8x7k/bdwEdApTokX7tcXbIIYsko3RgI6CQa6/HqkBHO/N8Ukd95x4FceRHyR3Yu
	XTxXOGhG8rwjUDhsVpMoZuEyP0m8NtpDgF53ldBN/yeKKZWjieR/Xp8BXQsMqP25feqJj8+vWyK
	kd3x/ZLaE31GGNoSVxtI5FuVsBkz0G5i3ZFcnxPpFpAgySKIGxlP23suW102/5BF6rRIvqixEIf
	2BJkLAFWnZfwNir6pLkvY/28/3ZKCv310iEY46JzlANKfZGyP22f3RCg83hGFUKyKfnGLpvY/KW
	mVsokEZkMwdZAij2H2YON30mPDrVbLFW9WPctUnb+8bA02imlGXiC6Y+952L+IChz1jgtMpN8hQ
	==
X-Google-Smtp-Source: AGHT+IEryYAH4U5xOlJZ0FtsmMv+Gy8KrllKo4b7oROpG2tcDnL7/rwT07hALb3ex+6PnWMyNDc53A==
X-Received: by 2002:a17:907:96a1:b0:ac1:fb60:2269 with SMTP id a640c23a62f3a-ac3301e8eb6mr659028366b.27.1742046036348;
        Sat, 15 Mar 2025 06:40:36 -0700 (PDT)
Received: from localhost.localdomain (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b009fsm3378824a12.34.2025.03.15.06.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 06:40:35 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: hdegoede@redhat.com
Cc: sakari.ailus@linux.intel.com,
	heimir.sverrisson@gmail.com,
	linux-media@vger.kernel.org,
	stanislaw.gruszka@linux.intel.com,
	ingvar@redpill-linpro.com,
	hao.yao@intel.com,
	mchehab@kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 3/4] media: i2c: ov02c10: Implement power-on reset
Date: Sat, 15 Mar 2025 13:40:08 +0000
Message-ID: <20250315134009.157132-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315134009.157132-1-bryan.odonoghue@linaro.org>
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250315134009.157132-1-bryan.odonoghue@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement recommended power-on reset.

ov02c10 documentation states that the hardware reset is active low and that
the reset pulse should be greater than 2 milliseconds.

The power-on timing tables shows that t5 the time between XSHUTDOWN
deassert to system ready is a minimum 5 millseconds.

Implement the recommended power-on reset minimums.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov02c10.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 595998e60b22..d3dc614a3c01 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -696,8 +696,10 @@ static int ov02c10_power_on(struct device *dev)
 	}
 
 	if (ov02c10->reset) {
+		gpiod_set_value_cansleep(ov02c10->reset, 1);
+		usleep_range(2000, 2200);
 		gpiod_set_value_cansleep(ov02c10->reset, 0);
-		usleep_range(1500, 1800);
+		usleep_range(5000, 5100);
 	}
 
 	return 0;
-- 
2.48.1


