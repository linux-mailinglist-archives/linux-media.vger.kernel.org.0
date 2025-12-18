Return-Path: <linux-media+bounces-49036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFD7CC9FF7
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 02:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA61E301A19E
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 01:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174EF262FE7;
	Thu, 18 Dec 2025 01:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GWmz4Dlo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8832824E016
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 01:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766022127; cv=none; b=NkYq+MJ3vxev5h8x2Hw1guGLprTmorC8MQbhVWl6ZNMmAhKR4+9FDwToqzopUdSb0zOOIse398sfsB4U7BwK4hniYQojXvsWb1xFO3lMJJF64F4GeQ0QaPZ4tXSg7UtJ10QA0ZL/0XJL6d4Kzzk08Wtw+gtXdIFahiNwlNV8bjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766022127; c=relaxed/simple;
	bh=RCQrLsLWRXRRqQ1tQLdehtkf7c/7VusJfpAXEhvj/Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HdU/1cETslvWkBqFLocSoZuyi/RtodFklL/jn5BedmxdG9nJUG03W10r0xzucyhYc6f4BMMSmtKt6VFKFtWAyWXp4KdEQQypyEMMtliys6JRMSjbFh9LZiCjm7O08Aky2Zr/BC9GziVKJgPdsxMnj7JkE3Qm0u0PsNSDHvfI5nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GWmz4Dlo; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-598e9f63169so12814e87.2
        for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 17:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766022124; x=1766626924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/GB85vWadv9/UQTZVlQLWL6a/6d+W6la/UnGPku5hdo=;
        b=GWmz4DloD6Qm1VcebuUoHM9yx6tppZsKY1Z+EIaGrdEZncCcywcRk0AtuvmtfJuiHr
         OQPF0Jf5R9PTzTJ5+5qYsUDEfTet395AkbAZgLrPDzvm6bVp0izSwPAjn87UG0MXzJco
         IQFczpg40wknH30HHo1ni7CxqOyCO9bt28WlkuxNbAB6RbIj0KEok19VpbYr4c9BpKgY
         mwZZ9g8ybk3kpi+5p+CQKrFQlwU9mYO2U42gOPgu8QQC7r0HGmDfdCUk72eNN1oX7JKp
         wDmFbaxikFXO6+W+3RjPVM3eqyMSeEiGbuLdp9ul2f25+o2jzkS1aktN5gKZEE9gt0e3
         ooJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022124; x=1766626924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GB85vWadv9/UQTZVlQLWL6a/6d+W6la/UnGPku5hdo=;
        b=JgEeTnQ4we2G2BzYSs564t6uw0HNfVY98pypLGGoCoinDrJ96I0VL4iv3ec8Wl0mlf
         1v0fOrJObPj8zcj0E2Qyh/41MYOxEk/EypUel91r1EncuVtYeB7suLob9PFzEKMA+se6
         VyZCzp1PVD86VcE0EX/jHOKt50W3k5rjw9Cn9Gi/eWw6Wj2uB6BG21leP5Qua5y4Iiw2
         cBJMguK/ECkQjIUZTK3V01QbP7MkxuuDztMAdAc/8bNiD1v2rv5ATeqSC4X8IVryBn4M
         hsUYcLwmCR8RVd57xgyJEGpqZF9VywEZA3QdryybI8CL/FHA5fSzOdSVfe8A97BRQAOh
         gPRA==
X-Gm-Message-State: AOJu0Yy89naQ8H5UG4sH3eDtVbAOT0tdfBCPxvJ72uZNKDjM5A8QKSLC
	ci1lMTNZ+MXVlh6sGHxtcxL76EcC3E8qgy/TEeDUbA+b0oqrk+ahvVzWU+tNnteBpBs7of4Dm9W
	zmNlp
X-Gm-Gg: AY/fxX6O3UttJdrAoczsi4Jczkwb81UZ8KqTchEqlVGv8Dg2QQ/HXbfY/r0Pb97/KsQ
	irIF3FB9h4h/as0QEERa6fnn/cmpIgMDXNRvsp8mB9O8/7lV1RsmgQF1BsHNfSM1QvOwhKebZo5
	vtrjXJUgy/FB3P9niYPBV41bUFtbtbUfBNonmU0qULjnK7m2HKq3NhlInJwwt1aoHS7615e61LX
	dCAPfit1EneIZrKSgh8b8Xk6jAIgEY3xumpaVD9OYz4EpkK+Qz0R83DCbteiR/XxqEIBhmsMcnU
	TLEzX5lcfp3PJ1Tal5zq6obLB0OMnG7didbwE0HsHKsj5mvymVRRbicRz5G2zHwuuZjUraah27g
	/hR1WKkBtlOFw0UQGS8a5EGry03m5Ej+A+iD9eimZYXiRET6NGppa/eTR1x54QvcpxLgB0gQKHP
	E45SWLeYh/Rn/VOKmH8vBoiYyWvfXOduYGEZzTfOHO+EVsehHcwtgjTA==
X-Google-Smtp-Source: AGHT+IHe1v8M4pLi70sUIl8zdEof1qVildi2zWStP3gcCtC5v2OwGe21tOfHEwxU2QtKrJEPA3hzvg==
X-Received: by 2002:a2e:be22:0:b0:378:f0d6:8fb1 with SMTP id 38308e7fff4ca-381158b9129mr969691fa.5.1766022123512;
        Wed, 17 Dec 2025 17:42:03 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381132cc663sm4354631fa.0.2025.12.17.17.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:42:01 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: ov6211/og0ve1b: make configurable vblank controls
Date: Thu, 18 Dec 2025 03:41:53 +0200
Message-ID: <20251218014155.3265999-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configurable vertical blanking size control allows a user to set a wanted
image frame rate, initially V4L2_CID_VBLANK control for Omnivision OV6211
and Omnivision OG0VE1B sensor drivers was implemented as a read-only one.

Vladimir Zapolskiy (2):
  media: i2c: ov6211: make configurable vblank control of the sensor
  media: i2c: og0ve1b: make configurable vblank control of the sensor

 drivers/media/i2c/og0ve1b.c | 54 ++++++++++++++++++++++++++-----------
 drivers/media/i2c/ov6211.c  | 54 ++++++++++++++++++++++++++-----------
 2 files changed, 78 insertions(+), 30 deletions(-)

-- 
2.49.0


