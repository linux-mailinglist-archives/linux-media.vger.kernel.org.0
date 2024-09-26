Return-Path: <linux-media+bounces-18659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A43BB987AA3
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 23:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AB381F24573
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 21:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53419186E25;
	Thu, 26 Sep 2024 21:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kXwyJu4Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4D5186E5D
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 21:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727385609; cv=none; b=QL74YYnkBqskZeJWvXSjZgbWv4tnlJKUbFNcwVO3Lj/tXaZ/O1hgAms12v6GQG23wXMqYYIza1btoUzb9dgv+qc1iu9S7Kl3ZuGXGhr9tDswElnCm1Wce9RJwb20MtdUprkgIW1dBMwkIyvymsI2s8uzUiPXi4QpM1bU4GLiRVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727385609; c=relaxed/simple;
	bh=q2zF7lxzKfQMfOhfMXTaYwlRNAzT/RB4zH8dqPskQdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBH6eD5+QqRrokqF+/EO3c/zomo2EgnemZDnqMX3JLlf6vKfQvxrFHAc7LZ9aXP0pEdzUKgXXr7JQOhg/h8NOefD0uX7mB6y+LgDD0ervNsFGe5RcYgAxiOCHsQVvcqfqDbWl6do8vtEdYbOMKpTQQB5EjED9uJJ/u0beTn+01Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kXwyJu4Z; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f7544b016cso957741fa.3
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 14:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727385606; x=1727990406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6Y1/WkIGQRrlUcp2wwPurQ8bXp3tw07oCjiTxEkujU=;
        b=kXwyJu4ZASdJXQRAPN+3vhOhcJ7Lw4ygF8d/9ID8+cgI9/czzSeyfSW7Q14v/NjnOQ
         ODoen18zCuD3H65ZaZ8mL+VGzwqeeCKU2phwdnpnUB9yBshTobibraxkNtwmrO+eyg+m
         ezrM9iuCFHafCRgLtgCYyD6m2aCCV0mMGce1LMis6T9D2VC3wtBmKVuCJA5NkrP9A0Zs
         BpuYC3WRxM1z1iuzD3EMnwnFaXAbwCSA/oS0XwnV6bGOejbK+5N1voCZXuJ5XL1yME4w
         aOjf2XvbbZM6vLeJxN2LQerMaKH4o6ml+nNMVPWQ/DMTDxCy0jocYzvLwTN2aOhwo04T
         P4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727385606; x=1727990406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6Y1/WkIGQRrlUcp2wwPurQ8bXp3tw07oCjiTxEkujU=;
        b=rgIpVh29ZUT2ejn2ylvLqVhiPwI+z4OTFMTzp/2Akz97FwhbVu+Goj5a1LRnoGeLF7
         HIf3cCGGFGauYn2JbjOpLVVWaSDe/eurcxZ8f0s41Q2PCHzr2TvQbP1e9+Jil6pxuDRJ
         yCdOarH6cxaP5uVM19yifvEGJM/XByiZkAGfEBsv6pTybT1Bk6447LlSa+mXtCzaSoVX
         96pDB3uRYQn1U8RVqhfLQK11EJCzUwA3yGfvcw2lv8VxaRaeo6aFYYylIMGrDD6GKC7u
         RTCu5c+lnvsbfo5ExBMPOAKcgbfr1NkloS258ZwYyvRG0Mt9f2xIUDZjsrq+JyZ5FUbt
         sZQw==
X-Forwarded-Encrypted: i=1; AJvYcCVvlD/zrFi626d+kOvfgzjSUR3dy7Zw1BqltRY5NBJKQBgcp9NQ0yKRUURElp7nly2dyQKxZtlw9kEAlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP1TK7bblHSs4cP6eajyCctyjKCFAyy7a57s3J0IDEkpB9dG2w
	2RjZ7vC1TMjVH4MtpV4fjZKnf8+qC8K1+b/BbVr0qJttfkTOn8iEvkN2+t1OQOo=
X-Google-Smtp-Source: AGHT+IGA8hoVnU65FCITisImzud6KgxPL3RDqmaxoEcpS1FIBddGSS5WA2Z3+DPc05xxb5JaD9f1TA==
X-Received: by 2002:a05:651c:1591:b0:2f7:5c24:97b with SMTP id 38308e7fff4ca-2f9d4199f11mr1548001fa.12.1727385605903;
        Thu, 26 Sep 2024 14:20:05 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f9d4618a80sm684901fa.107.2024.09.26.14.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 14:20:05 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] media: qcom: camss: add management of supply regulators to CSIPHY
Date: Fri, 27 Sep 2024 00:19:56 +0300
Message-ID: <20240926211957.4108692-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926211957.4108692-1-vladimir.zapolskiy@linaro.org>
References: <20240926211957.4108692-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change allows to properly assign and manage supply regulator
resources by CSIPHY subdevices of CAMSS, this is needed to fine tune
description of supply regulators on newer platforms, conversion of
old platforms to the new scheme is also anticipated.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../media/platform/qcom/camss/camss-csiphy.c  | 35 ++++++++++++++++++-
 .../media/platform/qcom/camss/camss-csiphy.h  |  2 ++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 2f7361dfd461..68a3ea1ba2a5 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -212,14 +212,25 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 		if (ret < 0)
 			return ret;
 
+		ret = regulator_bulk_enable(csiphy->num_supplies,
+					    csiphy->supplies);
+		if (ret < 0) {
+			pm_runtime_put_sync(dev);
+			return ret;
+		}
+
 		ret = csiphy_set_clock_rates(csiphy);
 		if (ret < 0) {
+			regulator_bulk_disable(csiphy->num_supplies,
+					       csiphy->supplies);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
 
 		ret = camss_enable_clocks(csiphy->nclocks, csiphy->clock, dev);
 		if (ret < 0) {
+			regulator_bulk_disable(csiphy->num_supplies,
+					       csiphy->supplies);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
@@ -234,6 +245,8 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 
 		camss_disable_clocks(csiphy->nclocks, csiphy->clock);
 
+		regulator_bulk_disable(csiphy->num_supplies, csiphy->supplies);
+
 		pm_runtime_put_sync(dev);
 	}
 
@@ -676,7 +689,27 @@ int msm_csiphy_subdev_init(struct camss *camss,
 		}
 	}
 
-	return 0;
+	/* CSIPHY supplies */
+	for (i = 0; i < ARRAY_SIZE(res->regulators); i++) {
+		if (res->regulators[i])
+			csiphy->num_supplies++;
+	}
+
+	if (csiphy->num_supplies) {
+		csiphy->supplies = devm_kmalloc_array(camss->dev,
+						      csiphy->num_supplies,
+						      sizeof(*csiphy->supplies),
+						      GFP_KERNEL);
+		if (!csiphy->supplies)
+			return -ENOMEM;
+	}
+
+	for (i = 0; i < csiphy->num_supplies; i++)
+		csiphy->supplies[i].supply = res->regulators[i];
+
+	ret = devm_regulator_bulk_get(camss->dev, csiphy->num_supplies,
+				      csiphy->supplies);
+	return ret;
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 47f0b6b09eba..eebc1ff1cfab 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -91,6 +91,8 @@ struct csiphy_device {
 	bool *rate_set;
 	int nclocks;
 	u32 timer_clk_rate;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
 	struct csiphy_config cfg;
 	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
 	const struct csiphy_subdev_resources *res;
-- 
2.45.2


