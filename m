Return-Path: <linux-media+bounces-34704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45284AD83E9
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 09:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B85343AB683
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 07:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1292882B2;
	Fri, 13 Jun 2025 07:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bwItP8lG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD322853EA
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 07:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798969; cv=none; b=T2dw/ftKAJnrHhrHUlx6EwwduJVFJBNtza/R1wqxLY629PfZ57RZujttTQCasMibjCqofYqUfGFYRerj4ervZ8g/9A0qnlK1jhfv9oZkkAf+CSOn1eRSFILuTV5vRthph82DRSEACMDnKpjgCPsB+4pDjYfoWqol+fOY6sEYDRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798969; c=relaxed/simple;
	bh=m6qHT7ZGx3axLWtAA1ik9FjqdHgd8DBCvLXWUV8VpHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J9/lkm6I5o6QP/tqe0AgQ49SUEGhqW/AodUuI3SO6eHIRDjiGoqGFXKmc6LEOQdMinY8nrDTvPnjVy6LJhBbwLy+0JERI+tKTmUP2E/1qKx+ONQBocb1FoxJvyFm+ea7Ln7SFy+9y7oT0enbhh7rrBwksegPWOBTs0oMRJm28VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bwItP8lG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4531898b208so1913695e9.3
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 00:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749798966; x=1750403766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5kZ7u7Dr0fsKDXt1wjhWFkaPUY7KtvLcENII4UEcyQ=;
        b=bwItP8lGOXzBcHUFFattj3uWzKftto7bIWs38yRmEejSObW4KERYVANy0VQdtPt92t
         qcUmbUD02VmLFUnuQssFmUmWJhcYCPGbmURQb8m1XXtozDlz4qU6JFSzXNYBa6smm9SM
         4NUEVAwHG/3F8KXxOlaA2Ec2e9uRZbQTQalte5WP7MkJrsdCzmI9tZEcyofcHj+8qBO7
         B/6dhsEEEGpg1X+bLpPCMKhsTFuqky55CF1cdYrUDR3dBzBwmVgWJqH9/8WmQPZz7Phf
         bT0Aeywz4keTLBU8myJtlziA2/q4iBe4kiO9MYgfgpcw5OqTQqWSGPwpKCBOWV7fgHfo
         wXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749798966; x=1750403766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5kZ7u7Dr0fsKDXt1wjhWFkaPUY7KtvLcENII4UEcyQ=;
        b=YiUuQeDWHOWPR6cY5FORjYMKGwo76Xwqjl0CyO6QdmE2B35mwM8Lp5mdnFzUDwK6Gm
         zVGLBCznTsTclSETEZGLATRZ3lylxivGcyX9ZKS90h2bnGvaIrnidlLq+JtA2mrsAHgb
         8peMzJz9GJSFXTN3GdbjA9fLuUm5ax3NHiWzQgNAyGgYLaF//4FWsfS9hkPx53azrdXS
         xKxIhWNg/ZQVWwA6nv5LhqJyPxPPvDVQrN8BlItSXVhmE0CphDwsvqlI7cFSvHpliDTq
         rSkX8ocb5QQyoEl2XLqNSt+32QWsZNgHhQfoXkdf2PdJ7T/X+IGiPpVFvi5NnFFU4fkn
         mbcw==
X-Forwarded-Encrypted: i=1; AJvYcCUVXuySV2GwNgkW4Izy2jbwDKixDnMBbAhHPuAHS3+758chqKqdM35aE1Cxt1omXrGY8Ht4QYKDk+KtQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy25T+8tN7zkRWzeXnRuV16XMHDf4Cg9irYOE7Oy9MQOPPs00bG
	YatmWbMCAXHMz+us2rvxbpUkX91R/OXnO6dYN8epyT+hVcLh82gwaSyXiI6Tzk1d10g=
X-Gm-Gg: ASbGncv4W2nNXc2oe9ZTyBfQ8DoeltSB2ge379IxgJOHeYF0Nvx753rSNwn6AcbT8OD
	tOmuLZsVy9ieItNvFH6rUkwi7LXUmcHTxHws7S8kj/x+RcoIKy1j2ymta4s8gi2H/PlHfxqL1II
	sVRhkiM190EpUBQTSjP9jV/SFdjRdheTeGyurwtOPUvio/L8KpXcHDdyDl4J0PF/fGq6DrjubRw
	2+pbj5OE76HR7aR8G+qN0pfiK0J5imeOqqkDCwgNm0HA1agIYqG43Kek0lVEU698Vv6kqLzpa5/
	YzV0f1w4PR0ZAvileIgxBkbeOuN+6P83QVrnO6J51JnyOVMnw6ZqygKP5dPLQ60LP0heY2c8Jw=
	=
X-Google-Smtp-Source: AGHT+IG5fdCQC4xaFcWmupiR1XNMdJV3tpCXa2Aa0dhnWO62Uu1xkclF26M8m6TAJ2GxEAXFunYgsQ==
X-Received: by 2002:a05:600c:1d24:b0:441:d244:1463 with SMTP id 5b1f17b1804b1-453349bff4dmr7398455e9.0.1749798965705;
        Fri, 13 Jun 2025 00:16:05 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d98sm1456138f8f.7.2025.06.13.00.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 00:16:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: exynos4-is: fimc-is: Fully open-code compatible for grepping
Date: Fri, 13 Jun 2025 09:15:57 +0200
Message-ID: <20250613071556.46521-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2257; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=m6qHT7ZGx3axLWtAA1ik9FjqdHgd8DBCvLXWUV8VpHI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoS9AsRRjfFwrBhrAdu6YhTXWliEG4OfD3sB8xm
 u9Go3bASU+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEvQLAAKCRDBN2bmhouD
 1/ilD/4/zLqseRzSCkCDre89I0rSm1KMGMk+UqY9BuQkG2ooiHyUFkBGTWUWzbEIt2nYYAKK+Vj
 Y/RnC0IOf1Z+N36zVqQVmZWfZ31dPCWh3Kr+oCBy53v65WSmJYpFt2fq57HhNNVaZock0CV2UY4
 cfwgcSLPVPkoRojPiWn5JtnpRaYw0irSwPcUhIwDk7qJoC9uCt3kajj82cSzzfA+XHHUfnnukjQ
 JOjs2YdOzReWwtyydz349ZOvJBCIH1L2km/BAeeJAcA8mpAH+T3HOSHYrqbO+2mQhIaBR2QL0dw
 nYOPFdlIkBJEDAjkOks+r2VFHOvED4gnTa3WTSxW6KhWZOq0KwLSenfohvAOzjvlVNwkJZCvmhh
 v43wkRC9ojZwug8PGq504B/ukGqpiUNdQgB1VMQ0FDZcoyfnE9iX1Mlv1J0gQ1ZiVWaHnGPMRx+
 Yqhyx2u8MkyVo4Rox9g6+xPHIHXe+94xDprndb/PHypnN39SQ5eVuxD58vkonvraBT1mma/K5g9
 A4JYCaP6K43pFci+7f6FvWVqERy2CD/nQZVYVNuz2mh77d43k4CgD2DV4hoAOoX2TFnQtUHZCxw
 Qpc6/BTgjgs+O3HVJUoE9+ARzSG0DvpK7NmCz+HTvJqSxDKiEP7G2ZTeAAPMm2m1fvWOCb3Bb0X tVc9mUs8NAOu5xw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

It is very useful to find driver implementing compatibles with `git grep
compatible`, so driver should not use defines for that string, even if
this means string will be effectively duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c | 2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.h | 2 --
 drivers/media/platform/samsung/exynos4-is/fimc-is.c     | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c b/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c
index b243cbb1d010..b5b37b6f8fa8 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c
@@ -131,7 +131,7 @@ static const struct dev_pm_ops fimc_is_i2c_pm_ops = {
 };
 
 static const struct of_device_id fimc_is_i2c_of_match[] = {
-	{ .compatible = FIMC_IS_I2C_COMPATIBLE },
+	{ .compatible = "samsung,exynos4212-i2c-isp" },
 	{ },
 };
 
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.h b/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.h
index a23bd20be6c8..69d597e5c297 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.h
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.h
@@ -6,7 +6,5 @@
  * Sylwester Nawrocki <s.nawrocki@samsung.com>
  */
 
-#define FIMC_IS_I2C_COMPATIBLE	"samsung,exynos4212-i2c-isp"
-
 int fimc_is_register_i2c_driver(void);
 void fimc_is_unregister_i2c_driver(void);
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index 2e8fe9e49735..ed7b7ca16f71 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -207,7 +207,7 @@ static int fimc_is_register_subdevs(struct fimc_is *is)
 	if (ret < 0)
 		return ret;
 
-	for_each_compatible_node(i2c_bus, NULL, FIMC_IS_I2C_COMPATIBLE) {
+	for_each_compatible_node(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
 		for_each_available_child_of_node(i2c_bus, child) {
 			ret = fimc_is_parse_sensor_config(is, index, child);
 
-- 
2.45.2


