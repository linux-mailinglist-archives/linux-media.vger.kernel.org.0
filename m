Return-Path: <linux-media+bounces-32396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89FAB56F8
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 421181898CE6
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43841165EFC;
	Tue, 13 May 2025 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YRAR3QL1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61192BDC2E
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146248; cv=none; b=Vkr8GoKhrRFOt+RzHRw9HAB12yO2I2SYqsSw/AkMhBHKHuBJEj7m2bbCbhjkDthoDzr+zUzAAxiXXueekpLNVO1G2ynh9hKeANtzCkJbglQVJqIR/XjTweDnG288JOZPk+CZ8gjPyapn+kcuKoiaX+B3mS60qoxRgMdyCrzB1cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146248; c=relaxed/simple;
	bh=wd5OK2vpaUbdVbTuvyN3zcrNtkQAd/14OzJXAvp/rRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8mf3Y0HJRqxQhBEugLKL6NUj1mL8//ewNIvQuXu2L1M79u//9JxIU5hz9LGyjuVS6ZOz1pT1OroVHd7SD6dBIhb47ii/ISow0GYwSWRpn/UMiKXZWcKAql63k48BN3Mvu2AeqBfycjTzXTYrng86050fQhxsZhK/4GphkOKWdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YRAR3QL1; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54fccaf9278so469116e87.0
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146245; x=1747751045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEIMfORhvN5jRYVM9DDW32f9X7YFOQS1p/b7fC45Eds=;
        b=YRAR3QL1Re1fx1MzODCXIAK0USJlEWwf0LjciRTqe3ijwLebpaRreVtKVhWfrUsab2
         Ta8wMX2DSjXF2zUGPLxCdqaM4GkpTZTTtUSMs4wdxnsH7KLE+2G7WRbIhVVO7vEG2h+M
         4hDwpz/WE8FlCt+m6fk/DUSUKd/eOssHC7TXXqAWCBRF6Nd8zaz5be64jtsXtrEfiKpg
         bsW9kznacQMdNiavaovZLwWInaS9hXZP9B0N/i6j+Aiz8fefUodDf8gAPMouqemy5BgF
         mkKyCQRF1i/j3Gxjfa6xxjQwC3WYWtaudrd0J9bnz3DiwX7GlCaeo5G854w00VfJtffU
         4WlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146245; x=1747751045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEIMfORhvN5jRYVM9DDW32f9X7YFOQS1p/b7fC45Eds=;
        b=Ciyq+Qz+EpUihoVKmwbATNo3TDXwhfB8opJGWN//WXuoZJVNQh6Z6L+6B7E7wucmzk
         zxcVzuk/wuCAgOme2sgKyHvF8hLbK4cO7vyskC09G8nTYDqJklF+oj69JSRXDWfmvQTc
         R/QT53Up+DWPP11eg8bn2Qv+42NiDJXA+7tGIG1HtyGUUFGsxTrelhr///LwwYY/3cG4
         spKexkRcOKKQvHFi+0xLWGjkUeHnb+jvK1162I/GYsNB4qZwmM1+4gImop4UtybOo++9
         N0WWrqtfzoJLnYIzvIUoskC6sNWSu/GrJ3P0ZRYcXT49JVAI63gfNjKs2KBvP2mm6c6n
         o7zA==
X-Gm-Message-State: AOJu0YzuUYmEaI+8cTKPwQmUSvdKLR0yDMaOYDs/xBnN/fBrgeMA4FKf
	Yy3tZXun2FYE0K/9iz5pjg7rbG9OHS+Bm0Vxnt1NgAYzaFn0Yu0yWAMv3jTHOBkooxgI1YSD5y4
	H
X-Gm-Gg: ASbGncuHH6K00A0z2sJPyArIMmTH19q3m/dnmQe6gjW8QobpOnVC8I29YVsujYg1UDA
	y0Q8SJSGS63PsLWC/72cLF9giUNxOkcGmLshLiraYK9h9v8jHdOKCvTL4aN211M4bAm0e5oC0UE
	LBnpYsF2VcDae8ePzY1u95167ykBFI8Rcwn1deYqjiZF5J8LAwph9pSJSOQNX0/wIyNO/PqWMmr
	yU2cRvGRSqhCPExjgSJrjuzslcVI/0wuRWuPs11L8w34qWgs3t8x+IpcZjsmZcGG5G11I1+Z5Zj
	6P3ZFpGfnnrNvWHUkUjzAZsvXgZruL68vht1WnhU/YhGvojViZ3zR0oPDKLwOxnxbCVke+BX1YD
	AFKvFH5uA29jgFII1eZZ7YWzGXmUrEZnpCiRlQoqn
X-Google-Smtp-Source: AGHT+IG4ecE3HUplA9i8a8L1PN8LSDGDhOHpOg/H8jWcK3aNKhgRCeYMXpbwZbnyw+FZV+J05fzC9A==
X-Received: by 2002:a05:6512:159d:b0:549:8faf:e20b with SMTP id 2adb3069b0e04-54fc67c3400mr2319152e87.9.1747146244761;
        Tue, 13 May 2025 07:24:04 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fba0sm1871813e87.23.2025.05.13.07.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:04 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/9] media: qcom: camss: remove .link_entities
Date: Tue, 13 May 2025 17:23:47 +0300
Message-ID: <20250513142353.2572563-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no potential for a custom .link_entities callback,
remove it by replacing with a common camss_link_entities().

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 14 +-------------
 drivers/media/platform/qcom/camss/camss.h |  1 -
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 8c844ebf9cb6..2977aeaf27e1 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3143,7 +3143,6 @@ static int camss_init_subdevices(struct camss *camss)
 }
 
 /*
- * camss_link_entities - Register subdev nodes and create links
  * camss_link_err - print error in case link creation fails
  * @src_name: name for source of the link
  * @sink_name: name for sink of the link
@@ -3642,7 +3641,7 @@ static int camss_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
 
-	ret = camss->res->link_entities(camss);
+	ret = camss_link_entities(camss);
 	if (ret < 0)
 		goto err_register_subdevs;
 
@@ -3726,7 +3725,6 @@ static const struct camss_resources msm8916_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8x16),
 	.csid_num = ARRAY_SIZE(csid_res_8x16),
 	.vfe_num = ARRAY_SIZE(vfe_res_8x16),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources msm8953_resources = {
@@ -3740,7 +3738,6 @@ static const struct camss_resources msm8953_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8x96),
 	.csid_num = ARRAY_SIZE(csid_res_8x53),
 	.vfe_num = ARRAY_SIZE(vfe_res_8x53),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources msm8996_resources = {
@@ -3752,7 +3749,6 @@ static const struct camss_resources msm8996_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8x96),
 	.csid_num = ARRAY_SIZE(csid_res_8x96),
 	.vfe_num = ARRAY_SIZE(vfe_res_8x96),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sdm660_resources = {
@@ -3764,7 +3760,6 @@ static const struct camss_resources sdm660_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_660),
 	.csid_num = ARRAY_SIZE(csid_res_660),
 	.vfe_num = ARRAY_SIZE(vfe_res_660),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sdm670_resources = {
@@ -3775,7 +3770,6 @@ static const struct camss_resources sdm670_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_670),
 	.csid_num = ARRAY_SIZE(csid_res_670),
 	.vfe_num = ARRAY_SIZE(vfe_res_670),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sdm845_resources = {
@@ -3787,7 +3781,6 @@ static const struct camss_resources sdm845_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_845),
 	.csid_num = ARRAY_SIZE(csid_res_845),
 	.vfe_num = ARRAY_SIZE(vfe_res_845),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sm8250_resources = {
@@ -3801,7 +3794,6 @@ static const struct camss_resources sm8250_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
 	.csid_num = ARRAY_SIZE(csid_res_8250),
 	.vfe_num = ARRAY_SIZE(vfe_res_8250),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sc8280xp_resources = {
@@ -3816,7 +3808,6 @@ static const struct camss_resources sc8280xp_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_sc8280xp),
 	.csid_num = ARRAY_SIZE(csid_res_sc8280xp),
 	.vfe_num = ARRAY_SIZE(vfe_res_sc8280xp),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sc7280_resources = {
@@ -3830,7 +3821,6 @@ static const struct camss_resources sc7280_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_7280),
 	.csid_num = ARRAY_SIZE(csid_res_7280),
 	.vfe_num = ARRAY_SIZE(vfe_res_7280),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sm8550_resources = {
@@ -3845,7 +3835,6 @@ static const struct camss_resources sm8550_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
 	.csid_num = ARRAY_SIZE(csid_res_8550),
 	.vfe_num = ARRAY_SIZE(vfe_res_8550),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources x1e80100_resources = {
@@ -3860,7 +3849,6 @@ static const struct camss_resources x1e80100_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
 	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
-	.link_entities = camss_link_entities
 };
 
 static const struct of_device_id camss_dt_match[] = {
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 63c0afee154a..1d0f83e4a2c9 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -107,7 +107,6 @@ struct camss_resources {
 	const unsigned int csiphy_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
-	int (*link_entities)(struct camss *camss);
 };
 
 struct camss {
-- 
2.45.2


