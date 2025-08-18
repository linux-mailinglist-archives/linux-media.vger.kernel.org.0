Return-Path: <linux-media+bounces-40171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35686B2AC1E
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 17:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43AAD17AD60
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542D3248861;
	Mon, 18 Aug 2025 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KUiF0n1/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8BB246BB6
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755529233; cv=none; b=JmCL8t2/pJlwO5vYyV+YJXvmL0wsopgiNOmUOTKkpdj4m61/xRO1xC1BW/JEvSvDCEFYDjv9MzkyHAOrlMPRXVmKuj2lLjLWEeWUAKXLicxY1sm+H1FdHkInCk1V3i/802l5veXgLGmzlcdwLM0LI0seAWk0R0R6e/t64MmsBXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755529233; c=relaxed/simple;
	bh=Ms2tm8eSPj+yyHVyy0nMlIqaL/8sChwRGDPzw8xrjQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RXzw5CFlu1Km7fWVDer7fHZAQJgjq/nr0AjrgQyQrPf2FCOLVPwpgBFehMjICukdG7M4RplMcQHjH4bCEukTfexZ7hlBRxGYUJd3TmmIkkfAk3AIxjb9aro2EFSYyAyQwqhE381AVNN36QfGNQX8+RHjP6dOTR7CaNkwiDKs2Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KUiF0n1/; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb79fb221so56279166b.2
        for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 08:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755529230; x=1756134030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cxeHMaFeRoTnXdz6BB5Z9gunYIPP1fHWmLLmZCX7qm4=;
        b=KUiF0n1/SJOwBe45ykgOeyRnvtaleiw+O/CnsCHOGaj2OUPHAp04YGuj5YTC/NPtBb
         3pYA4G2PbQz6uw5EEEinDxDWyIDKIAJA3JjUbToplXQ2R0Wo7DQxGjEW7g7ZWsOYXkep
         civ8hIwlsZDI6MczuVSEwU8OZkCQPQWgjKiQSP+yL8TgjeT9mJTGzo9FmUzVuT11igCI
         5a19Wnw9jvd6Wk/YE/Moid1nU8uBivDHc6BWXq2m7f5M8pRtaO96eaSsd9JTbTITQPGJ
         HywSsdaqLITelasVOzq/RV6Q9amLq8k19RExlsFl5g9B+61b49Kr4axXltemd89hsGbq
         apYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755529230; x=1756134030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxeHMaFeRoTnXdz6BB5Z9gunYIPP1fHWmLLmZCX7qm4=;
        b=xQhri2epM7rI6pn2+hUgFGZNbw9h9FxWaW8euMTb3ylF/wNaxJsDxioUMqLf3m5F5W
         3nG2QzOh8kaFGMttRSCJmOxbftIUTmKQZZkrfst9k2//ffkGKbmRcYTp2DOyV8VFgZub
         8mSpx3H+VhVIH/4tiNKsnLso6L1na2DHh+qTmNsFRdnZUg5xOMakkTByeP0irnKdzqfJ
         KkAz2xOkpuC9G1WjMG35vFberoA01aYomzEhetHlWj1hCX4NIf2IC0o71Du5HGDkzhnP
         +UFvQjPO70q/Awu7lUZqqJRJmkOWd49dP1Bdhj0Dht9zVHPcVWCeMCm+d+z/uYIPzS0J
         gkFw==
X-Forwarded-Encrypted: i=1; AJvYcCXHWbmI6kYz4XuvNId+Sb120/NgNgrUKcGT0nl+9Q55WcLAftDPcgAI9fFgLVtQ/5JcSsgKEnK34qMqTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKxq3UkKfRFUzWDj8+GroCFFeBLxrRB/QjE3nd7FchAtZcqovy
	LKS6sKZqY60VLJ2M5ucliB+eYA2MCQRD0/8TXiDeitDTB74INdyaP/fHmrb79DWQ84o=
X-Gm-Gg: ASbGnctvrg4lt/oQcFZAt/Yh3r6mnBZ9wTNnsujiHCjEP71eXkqWxfKTLjkNRIlAndx
	B0MVSaTCUgrmWk4W5A97BgEk2t3/Vu9FHwxsaJiNjZeTtXP2M8opCDfM3NhUu3Jz7QTnD+L/exy
	/t2TknN/TE8GQbjt0wlyPt8WgYYJDTgsO8Z+awPgYJqUWmjd3wntyp3oxere+QGbdF2bWbwnq6V
	dsvUQSyY/qEVZSD0IslJtW6NE9Dt7HhrBVd9kIuCUU6/9ZdBq3t21rO2Ss79gsjwy3kRg6mxcg0
	F9YwhEg/ibGXs9lX59a8matCf3jFkFbG9alVZR4Z06tbXvd13+Oo9mhUVyR/paTvpDxCrDu0MKv
	+HNAC3tZm7T27O3gcQ+jP9+TBvjAY6d017ncBNwhO+Rla
X-Google-Smtp-Source: AGHT+IHwC1nONOxe4B1Apce8RAMU+taw2uF1ulOiUiKYst5+SrxfAMVJDZG84JEqu3yM0sNCvGdUbA==
X-Received: by 2002:a17:907:1c12:b0:ae3:c5b3:37fa with SMTP id a640c23a62f3a-afcdbe7ae89mr546376466b.1.1755529230161;
        Mon, 18 Aug 2025 08:00:30 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53c46sm819358266b.18.2025.08.18.08.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 08:00:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Leon Luo <leonl@leopardimaging.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] media: i2c: imx: Add note to prevent buggy code re-use
Date: Mon, 18 Aug 2025 17:00:26 +0200
Message-ID: <20250818150025.247209-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Ms2tm8eSPj+yyHVyy0nMlIqaL/8sChwRGDPzw8xrjQI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoo0AJ4YKBmDS36w6tjNwLC5Ycrt6V1uEODHWVx
 07yX0JI9A2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKNACQAKCRDBN2bmhouD
 16iGD/9aIu0JQfW1DzczENn0SO/onxhzMQTa401Lqze7xtFdkWZ/r+DzzuXDRoiDgvALEoFLYGX
 61FE/mUpefnL0v1Ddt19RYEIWJGX2E/Ic0P4Brx+HNCHSHc7gytCHXQci86Djw6Y5Ma3tPfEWSe
 JBhvdOKeFpemn+YS3K8n64xIs09fC3NuKoVwkjwQVDY0sMeAOr7JQ9mpZI6N+XT0BACwq4j1xt3
 PzNWkjuxw05oBuMCFMSt/ijsKcOlxhoNMaXvZ4wChMCYdfADBv/KPeGl5uAe0iIk58VuLqkSiA1
 XfnA7QT9tg/FgtbImKWXXjwCXdQJS+bCaxO/pxCy/kt4pHcvwc2IzXlYz9E8osE04FBhDWmSpbW
 t7ChtycbI3SDkQcA/PG9cyRRQWJ68rxhyHfN1lfBqnkjG1dYkIGbCLWT001Tkso86zCWpOdmIc6
 meX4FLG5HRcgDphRFFcRacusjwC1laf/PH1nXru5exGR20pDDxDb43MEho9ePUYA6UlmJuyxTYX
 pTAnso1fSpRrxK8lmZMaqdYIXjLT1wchGCQKXebDQ9FNMSEYaF5oFBh4h9IiWRt6dDBIoYYR6Hh
 b8AOdpKuv5vDjt+Tf1NyVLaiMBDpYthGA6UeuTVrHyA1b1mAfYIO4LaFMcqzkyYZn6S1dw8JGve f60YyFQIPx3B0FA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Multiple Sony IMX sensor drivers have mixed up logical and line level
for XCLR signal.  They call it a reset signal (it indeed behaves like
that), but drivers assert the reset to operate which is clearly
incorrect and relies on incorrect DTS.

People in discussions copy existing poor code and claim they can repeat
same mistake, so add a note to prevent that.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Fix language typo
---
 drivers/media/i2c/imx219.c | 4 ++++
 drivers/media/i2c/imx274.c | 2 ++
 drivers/media/i2c/imx334.c | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 3b4f68543342..2dcea9517cd6 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1034,6 +1034,10 @@ static int imx219_power_on(struct device *dev)
 		goto reg_off;
 	}
 
+	/*
+	 * Note: Misinterpretation of reset assertion - do not re-use this code.
+	 * XCLR pin is using incorrect (for reset signal) logical level.
+	 */
 	gpiod_set_value_cansleep(imx219->reset_gpio, 1);
 	usleep_range(IMX219_XCLR_MIN_DELAY_US,
 		     IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);
diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index a2b824986027..d86d08c29174 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -826,6 +826,8 @@ static int imx274_start_stream(struct stimx274 *priv)
  * if rst = 0, keep it in reset;
  * if rst = 1, bring it out of reset.
  *
+ * Note: Misinterpretation of reset assertion - do not re-use this code.
+ * XCLR pin is using incorrect (for reset signal) logical level.
  */
 static void imx274_reset(struct stimx274 *priv, int rst)
 {
diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 846b9928d4e8..53158babf3ea 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -1070,6 +1070,10 @@ static int imx334_power_on(struct device *dev)
 	struct imx334 *imx334 = to_imx334(sd);
 	int ret;
 
+	/*
+	 * Note: Misinterpretation of reset assertion - do not re-use this code.
+	 * XCLR pin is using incorrect (for reset signal) logical level.
+	 */
 	gpiod_set_value_cansleep(imx334->reset_gpio, 1);
 
 	ret = clk_prepare_enable(imx334->inclk);
-- 
2.48.1


