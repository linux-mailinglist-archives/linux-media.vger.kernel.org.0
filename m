Return-Path: <linux-media+bounces-16193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2634B9504A3
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 14:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A00D1C22F4B
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38561199385;
	Tue, 13 Aug 2024 12:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LlUAdA81"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE1E1990C7
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 12:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723551232; cv=none; b=bHTNAs6qm92t25r3VTcCuf61nyHprv0Ru5Rzb2qQlKAfxG5o9N7pGVdxxq7d744aaVYKSxBYhpOQxIdVj3kFyT369Gb7+XFslxeykkQy7Bffl4yfa6eKV19L4jBHjdawGPi/RK3X5L3mPFeNfJO3zAEzgCdxz3ZXeBSoz8039WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723551232; c=relaxed/simple;
	bh=AhtVc0eRB313SzivG95eO+fvDnddIaj+hD0gJVu5zyc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mrnr9k7XAkTxnEpuG1AATwj8aAD33/V0YzKQd+eCXBZXFA9fmt3TjaqyO0UFj0xopeUD5bAeqx4fcupm+MZJ8oAtpc5o8PkJjm9t/UEBjqO94spY8OXLQxgmeCkazI9fYn7dqiS9sTga5nB0mVberVu36HUnKZoxhv0pSaKjs9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LlUAdA81; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a1d42da3baso343429085a.1
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 05:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551230; x=1724156030; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=exEVIAJZd/rYdUXslfft3lBWpWIRwR1McJc3b9INl9w=;
        b=LlUAdA81g9wNGeTxYHkTqkJrJDjxHBrv0nj3BkwaduKYWicDObc7qmitZ/DB6rgTB9
         uU9ZwxIgXnI173noR03bRPrBd3QjJiApY1aH3HMzSOl8t4LF1jwq+9J4bwpAHoID44tT
         xMsSA7gvr2VzSPc95u03vFP1VMFKnEJAwG+fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551230; x=1724156030;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exEVIAJZd/rYdUXslfft3lBWpWIRwR1McJc3b9INl9w=;
        b=hG2sQL8KK8mIpnUlHAFZZcg/JJy0S/IFnHZp7FjKxIcXKx7pM8KD3ZYEm7AeIHK8VL
         bvPcmuVjRWATtv85Z1Tw2//5vfZx0Wj4+UQ0/LN/y1YH7uLkuWuz6k7OwPanfqLx+VG9
         s1Wcf+/xdiAiHB+s4Lz9OxV2lgnj0+JxO2Gn51uBvLZIYe85hn+Ioq52l82nMb1jq2un
         pS2BHadHu9M5qJUyISkfaS32VQDAZGObtFbOan9v06d0CtZWg1fkPj7soHVVMWww+iFF
         onfRTkKLKfXY/xUSgJCn+iO674TJHE1fJzVP4hkYeWz6Y1Y0UL8iowZzY8mv0hGFc5LM
         Ey8w==
X-Forwarded-Encrypted: i=1; AJvYcCXKIV7e9wFfJTHsJWwdcaULBcDaiUMo8rYbhWR1M8Z7ivPPmkmFNdF9wS3zp4rX8Udu4k0O4OyyX775gjWYtVRl0On+LiJUkPoM0og=
X-Gm-Message-State: AOJu0Yya97zGaqZfCoIO08TCncp6oe1mLM+CnsA5NHjXAApB5pqexmzy
	h3Uqplellb2x40XgDhiRUscy5vmu/GNF1g3nWS1QyywR6BIfS7hR/KZltXIszw==
X-Google-Smtp-Source: AGHT+IHEAC5qNhYBF14RuyiMsQL8IDhPP6lbNZuwJIZWarWyGBLPSFdo+w5w+ficdZzhLBjRgODR3A==
X-Received: by 2002:a05:620a:460a:b0:7a2:db1:573d with SMTP id af79cd13be357-7a4e153e4femr367590785a.36.1723551229916;
        Tue, 13 Aug 2024 05:13:49 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/6] media: Fix last smatch warnings
Date: Tue, 13 Aug 2024 12:13:47 +0000
Message-Id: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPtNu2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC0Nj3eLcxJLkDN3knPzkbF2jtETjJENDcxMLU3MloJaCotS0zAqwcdG
 xtbUAgffoXl4AAAA=
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

This series completes the smatch warning cleanout.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (6):
      media: ar0521: Refactor ar0521_power_off()
      media: i2c: ov5645: Refactor ov5645_set_power_off()
      media: i2c: s5c73m3: Move clk_prepare to its own function
      media: tc358746: Move clk_prepare to its own function
      media: meson: vdec_1: Refactor vdec_1_stop()
      media: meson: vdec: hevc: Refactor vdec_hevc_start and vdec_hevc_stop

 drivers/media/i2c/ar0521.c                   | 15 ++++++++--
 drivers/media/i2c/ov5645.c                   | 15 ++++++++--
 drivers/media/i2c/s5c73m3/s5c73m3-core.c     | 13 ++++++++-
 drivers/media/i2c/tc358746.c                 | 12 +++++++-
 drivers/staging/media/meson/vdec/vdec_1.c    | 16 ++++++++---
 drivers/staging/media/meson/vdec/vdec_hevc.c | 43 +++++++++++++++++++++-------
 6 files changed, 92 insertions(+), 22 deletions(-)
---
base-commit: c80bfa4f9e0ebfce6ac909488d412347acbcb4f9
change-id: 20240813-smatch-clock-2fa3b1174857

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


