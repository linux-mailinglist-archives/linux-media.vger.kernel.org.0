Return-Path: <linux-media+bounces-21861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 647539D6B9D
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2024 22:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD8DDB2262C
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2024 21:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50EE1AAE09;
	Sat, 23 Nov 2024 21:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUarpqAZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31E819CCF4;
	Sat, 23 Nov 2024 21:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732397191; cv=none; b=He+h1Gf9YpBR7xD32lwmx91XskL8QrfAoxHsZ3OAnXhbPhi5phBzPNXI40YlO8qrBTQfysRh2hQi7ZjXRSSpANb0FDs5SRTpYU0bRe46OtGx/C6TdMPWSNnd9llYb++52vnmBI4kAPXOKmUOThUzWh2oMQBazs1651XyBwfLTMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732397191; c=relaxed/simple;
	bh=S9lNBdOz+fyWtttvxwI71Sb5SqCDucavC8LeLhcrfS0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dJm/ppKPyvYm/I60bF9BR0QrRb6eyZANi0kRz03D7PWt7D24Ul90Rx/h7kB2u3b92eBeAVXqa+OLJSQr94xILdm8eUUiGalchjXKrHMEPHM9gEdq2yxYHPbmeTOUeUyNbepRawXH5Bn9L4WSiRODmqwa/CNp7mrQb5MyOpR8lq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUarpqAZ; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-46677ef6910so5777011cf.2;
        Sat, 23 Nov 2024 13:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732397188; x=1733001988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqUmrgUyN7wLvObgizlW92PtLkKJTPkx4qrgq2LwcbI=;
        b=JUarpqAZwJxZoznhWBc5sdq2p4uDJViIIR0yaweJ/Td9cyD+gs7gW67/jwahVWMs7+
         HpdbEJm/jtTYkxXoiLP/gJUFbecXWLjsoekwNVioC+vnMNwlV/JlmOxhV5vJfflfjQfY
         0rbbTKVfT5eNUROSmxLvkjVK7k5HSqqoBK9+zz2GVMrUyuC4LOuvGAdBqV5NNA3XPo6g
         jHaTi/c3OOnBu3ABEBXhu0unz82VKrLEmCrhlBTWsBSayiFwBvqTqDianH+6eg7haCc1
         4iPwGkY5y5MTyrxZG4pkDUxti8P6z9xzmQYA8UPR6jKeXFxZPLVAUNeaOfjEIAI+JPei
         DTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732397188; x=1733001988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqUmrgUyN7wLvObgizlW92PtLkKJTPkx4qrgq2LwcbI=;
        b=QQ44x6YCXCv4OjLa9J5Fmz3i6iTXtBqEPnQekLw5q9SZVK0bRNsTDLPwDtQq8U8P/W
         qLLFiOw/maobuuR/91bRLfH/r+OgVOZDsBlEeE2Mr3aRe24VF5ClLTGlaNImXpm5Y751
         XEGDrSEOWma8Nq+vmqlSAVAjE4h6g5DcQDj4WzXf8xqAcgvBRKmF+jKUY5+uA9ouYHXi
         bjAd1+U3VgSSnvXBLDS+pbmA/B3HIzR0mP8ioXd01Oc9uv4SwpGWFORXB6QXNtY/iwr6
         pwYyrzvfEF2gXjIa7mJqoM60xESWLLLBz1/8Bt/46b65v3M6QNjZ9m80FyDwZKxnaJrt
         JNvw==
X-Forwarded-Encrypted: i=1; AJvYcCUpOpqBlv34zCGhvfr1lc3dYzY7coMuph4UVUjXRepXWWHaaxG/2y/qhjyZhD22h1Peh3l6rL3O5c+BZIWOsb1tiV4=@vger.kernel.org, AJvYcCX6V18ov77hnckE8U06aIoeej2iUjE7CGz4IoJ6SO/N9174/kaRDzdNbvfcF2oQav/bkuyg/S2PZFAdUu0=@vger.kernel.org, AJvYcCXHIDDAGVScHJs9hdC+jHn6gCWij3gYfkpKtcB4sbS3lapV7D+P6ywsBKeKoyuM3Ab8uc12RV7N8LBiSpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YztjWYGEEN/+xURI8bJc3Jdb8oZ/Zs64wcjLPjOS2ALuNz/8fKG
	z7wR4/ApRxdtSyV4M1D+g3Y8k3SwoQstaApaCd9/ywR0IS0Kh9vX
X-Gm-Gg: ASbGncs3WnP801GVje9EviEYJXY3wkXABE9tlGAVseB/S22K+3wouiKjnxgKY+q8JUA
	CGx2Tn7Y5GmyL1zZOk/0s+or+BhveYbUu4nHhjo3Hfg7e4NbKst3kjylMbcROMw0nplmLX+q4nQ
	uF4MVsUSwItfpnMeHKS1vgVrH50B0yA7k2rE9U3v97GxQECoNpRAYEVbg+fsvDg0ZSeD9IDpxUJ
	SwdzFQV3HsbwW0uqohtaQ+5osGaGVbfpQxX2lP0M5ue5jf2DO54srA6xOQwjm+jsGWcMRfF
X-Google-Smtp-Source: AGHT+IGVeho4+d3L/Ey18kxCOJChbkbT+3uU9PNEA4MwfJkMBnoVjxtA356iLEH6xkrsXSKgRSWvdw==
X-Received: by 2002:a05:622a:5c06:b0:464:af55:64ab with SMTP id d75a77b69052e-4653d6367damr127407211cf.50.1732397188592;
        Sat, 23 Nov 2024 13:26:28 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c3d9c14sm27763811cf.15.2024.11.23.13.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 13:26:28 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: krzk@kernel.org
Cc: sylvester.nawrocki@gmail.com,
	mchehab@kernel.org,
	dron0gus@gmail.com,
	tomasz.figa@gmail.com,
	alim.akhtar@samsung.com,
	kyungmin.park@samsung.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH RESEND v3 1/2] media: mipi-csis: Add check for clk_enable()
Date: Sat, 23 Nov 2024 21:26:24 +0000
Message-Id: <20241123212624.6237-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241123212624.6237-1-jiashengjiangcool@gmail.com>
References: <20241123212624.6237-1-jiashengjiangcool@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to gurantee the success.

Fixes: b5f1220d587d ("[media] v4l: Add v4l2 subdev driver for S5P/EXYNOS4 MIPI-CSI receivers")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. Correct alignment to match open parenthesis

v1 -> v2:

1. Power off the phy and disble regulators when clk_enable() fails.
2. Remove a redundant space before the label "unlock".
---
 drivers/media/platform/samsung/exynos4-is/mipi-csis.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
index 63f3eecdd7e6..452880b5350c 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -940,13 +940,19 @@ static int s5pcsis_pm_resume(struct device *dev, bool runtime)
 					       state->supplies);
 			goto unlock;
 		}
-		clk_enable(state->clock[CSIS_CLK_GATE]);
+		ret = clk_enable(state->clock[CSIS_CLK_GATE]);
+		if (ret) {
+			phy_power_off(state->phy);
+			regulator_bulk_disable(CSIS_NUM_SUPPLIES,
+					       state->supplies);
+			goto unlock;
+		}
 	}
 	if (state->flags & ST_STREAMING)
 		s5pcsis_start_stream(state);
 
 	state->flags &= ~ST_SUSPENDED;
- unlock:
+unlock:
 	mutex_unlock(&state->lock);
 	return ret ? -EAGAIN : 0;
 }
-- 
2.25.1


