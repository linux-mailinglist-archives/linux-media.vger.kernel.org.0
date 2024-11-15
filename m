Return-Path: <linux-media+bounces-21464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3438E9CF399
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 19:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8E78282ECF
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 18:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E821D8DE8;
	Fri, 15 Nov 2024 18:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="17WXqp05"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEDD188CD8
	for <linux-media@vger.kernel.org>; Fri, 15 Nov 2024 18:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731694048; cv=none; b=hCLKv4qB/JtDSksd33nrmsu7aT8IDKLmSzFHWXpP4o7V4MFjnKmAgQd62wmx3EHG+K8r7hzQ80fQ7oPo0jIlPWPT2i0QZJYKUFSs2cofjuISq4jX+G5d9FFRCySRGZ5zbQ6m/RUv4jO0s0Zwk0G1hlaDyeOwX0amP5ZmQV9TAzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731694048; c=relaxed/simple;
	bh=AH9lmUK/nV3spgNCYYokydJm+WFX/Jy8tWVheghWbEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IwFya4qxCHQcD98u9FO8uXWv04L/mIULTexSpuj668FEl/MgvjeClF+lmwrvwOLRxekADKQoigzcJvNNUVUw4vlosNxvv76ZJE+AMqPiXVFDX/xHnPNfRfUBjIm+FYC7OJpDYc1+UNNTT0rnm1HJcpHK8tr9UIKfVEAr5T3XD20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=17WXqp05; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4316cce103dso22392605e9.3
        for <linux-media@vger.kernel.org>; Fri, 15 Nov 2024 10:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731694044; x=1732298844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o419LoPHEwZk9uqC04SIW17qJKyWQe/rAVJ23MnW91M=;
        b=17WXqp0579ZvxyQ9DfImD7X+mA9B4kj59aZMMqw8/xhnrfgYcrEUJBe3RE8yN3f5Jl
         izuahg5wYJGyaPF0wUjwvpxSHOlfI2hs0e1RDPST6dBUOmfKf286i6qsk4F71eSOSWzA
         okvEZSO3qr+r+jbNMI43tjRpTA3huL+hWQQHeijB15ynEF+fvNw0olb8KZMzE1oy235i
         5kzEGsgckpXD8+D5J0TXQngeT7e9qBrZBRWonMbsHgYj916JUBJCmdOpLWoh+WymlTXB
         hq+wgTzkAuvgDGxIH+f+Kl13Dz2JTfo4Z8inP+z0ElfPyC1RF62zzr9wVBByPXfZy6K+
         JTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731694044; x=1732298844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o419LoPHEwZk9uqC04SIW17qJKyWQe/rAVJ23MnW91M=;
        b=G663EaWOX+pcl5iZcIIp5qv099uTSe80mPWBsM+ZZhBn1Ru0MTYe7Ez22hUCfgzcmK
         XzwLO6A8fSdWqOOE3WSCudemnLyo+NKloqr8mUS2T/KpqhlgCc8nx5S8ZyycVUrCO4hq
         99GCOClrOOTV/KnHMH1ezooJAaXOtNjK7/UxqpH6VET75uu1pCJwRHaTPTk+2CzUash4
         +xf7qdVrZLvHi0oszicqGt+Ff2x29SibmzXLmMD0TemPXyEK0jWrfGhU7bSRkrqto00H
         bWMh85l1DIGxuR+Gmyp4mpf+oo0qsJ8nw/ehLMDzBws4rF7nv/0s0oD4Lr4Yc219RidM
         xCPw==
X-Forwarded-Encrypted: i=1; AJvYcCWdT1Cxtf153hGnj4lI5kw+gNPXe6baGV1UUb1RxCNvKw9Dsr7kw+h7b5RIJQ7JiMOOT5z7qMm55xAa5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGBGOM1DdPdS5BSQQvcwpnQh+G3dM4dcPbShdn5cl0LH0Gv//8
	A/Ls50w2s29ZFI09l6ZBsGXsMdi20avJMSGVkGybzxdiE8E0yXs/GTFJPNShf2w=
X-Google-Smtp-Source: AGHT+IG7RtnvTlDkMryRojxaNybiE5sp971d9ovbcqBFKVQ5zzkyDuenimLIyd8f6VCrJr4dMs8DRQ==
X-Received: by 2002:a05:600c:3583:b0:431:5f8c:ccb9 with SMTP id 5b1f17b1804b1-432df74fc2emr41328725e9.17.1731694043625;
        Fri, 15 Nov 2024 10:07:23 -0800 (PST)
Received: from localhost.localdomain ([188.27.128.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821adbbd82sm4957755f8f.52.2024.11.15.10.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 10:07:23 -0800 (PST)
From: Alexandru Ardelean <aardelean@baylibre.com>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	manivannan.sadhasivam@linaro.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	kieran.bingham@ideasonboard.com,
	naush@raspberrypi.com,
	Alexandru Ardelean <aardelean@baylibre.com>
Subject: [PATCH v2] drivers: media: imx296: Add standby delay during probe
Date: Fri, 15 Nov 2024 20:07:17 +0200
Message-ID: <20241115180717.10820-1-aardelean@baylibre.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241115142021.574402-1-aardelean@baylibre.com>
References: <20241115142021.574402-1-aardelean@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Naushir Patuck <naush@raspberrypi.com>

Add a 2-5ms delay when coming out of standby and before reading the
sensor info register durning probe, as instructed by the datasheet. This
standby delay is already present when the sensor starts streaming.

During a cold-boot, reading the IMX296_SENSOR_INFO register would often
return a value of 0x0000, if this delay is not present before.

Fixes: cb33db2b6ccfe ("media: i2c: IMX296 camera sensor driver")
Tested-by: Alexandru Ardelean <aardelean@baylibre.com>
Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
---

Changelog v1 -> v2:
* https://lore.kernel.org/linux-media/20241115142021.574402-1-aardelean@baylibre.com/
* Technically, this is not a true V2, but rather a new patch
  - But in V1, the attempt was to fix an issue found with the upstream
    IMX296 driver, which was pointed out by Kieran that it was already
    fixed (more elegantly) in the RPi tree.
  - The standby delay helps during a cold-boot so that the driver can read
    the IMX296_SENSOR_INFO register. If the delay isn't present the value
    read is 0xx0000.
  - Original patch can be found:
    https://github.com/raspberrypi/linux/commit/7713ce38e6a26425ace3a57b3d03ba0125c16f89
  - From the original patch of Naushir Patuck,
    - Added comment 
      -------
      During a cold-boot, reading the IMX296_SENSOR_INFO register would often 
      return a value of 0x0000, if this delay is not present before.
      -------
    - Added 'Tested-by: Alexandru Ardelean <aardelean@baylibre.com>
    - Added 'Fixes: cb33db2b6ccfe ("media: i2c: IMX296 camera sensor driver")'

 drivers/media/i2c/imx296.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
index f942f66fa664..395bfe4fb23d 100644
--- a/drivers/media/i2c/imx296.c
+++ b/drivers/media/i2c/imx296.c
@@ -940,6 +940,8 @@ static int imx296_identify_model(struct imx296 *sensor)
 		return ret;
 	}
 
+	usleep_range(2000, 5000);
+
 	ret = imx296_read(sensor, IMX296_SENSOR_INFO);
 	if (ret < 0) {
 		dev_err(sensor->dev, "failed to read sensor information (%d)\n",
-- 
2.46.1


