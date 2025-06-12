Return-Path: <linux-media+bounces-34561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEB0AD64FE
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 03:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B632D1715EE
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 01:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8457B1519BC;
	Thu, 12 Jun 2025 01:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IP3v5LXw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFC21494A8
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 01:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690949; cv=none; b=JNI8sjpw19jMZq6YdZfIPpOwk/rr4rOLJTOmwLumfH6+gtZVqvslUzNclBL4g5ZIo+2AHxIRgqRZvGVacpEXyjOvyI/TAg37AjW40hSc20nE0KLFqm1pD/nMblyBFo+KQRrMi2HP4PNMJkKtpjmSmNXmm1+8Wl3ayq6nfrhPyKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690949; c=relaxed/simple;
	bh=8LFRR6aw1kzUR2Mwvq9YmarBBuVI7fsD11sKv+PqvhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyqbIfIQVEnr4q+q93uh63SSe1siH/RD3EVjdHIjH0ZsSVTtoXCcsWC0ueTSkbGYfGg17iJd5axCUapCHerfAyUtetaECA6S1OdAx1lbKimr6ZkrM6P0C9onF+LfXVQI+Gqw6sYLyWzo1oDiN+Hqcn5dGjrG6XyADayZiys8yoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IP3v5LXw; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553230a9753so13746e87.1
        for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 18:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690945; x=1750295745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Hw07cXyVozJ7xLFB0976rzOhihiAuNg6d3ccF7eDVc=;
        b=IP3v5LXwKzgGtYh8UVDmSX/6lyLIJ+hBpOmM4xz7Y59Vyc1tRRltuXLMZw7ZbxvInE
         JQxwyEZk6Zyj6vH1r+RE5utqx5Fd9oonScExua2UT0ZaQICO71h/LK5Dfvk1cKwg7jSF
         Y0kov7u2fklrpaulCZBR4blj6vwQQtaLf8GLMDRdWjtI70LtvHrZCShR9UFmakSivi6S
         crXTalrIX+TpzTd9i3OPcGpSf4l8KOzomdKgIfEzns+QungaXhMPSFMjBoCIsuUTBXiI
         PEp8304jNbYJvae5z+ABUwPI2AFM6cDf9HbWJtQBtULQdA0I0wdDUbPKQIAWkOet6U4Z
         IvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690945; x=1750295745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Hw07cXyVozJ7xLFB0976rzOhihiAuNg6d3ccF7eDVc=;
        b=f8qiDdMlY/kq4OkRr947wN6NxgotJqXfxFTljcOQKliQXKZVJwV0iUU97mAjVX7ARw
         wEKbC0VKiHa+UMNflBxaa4j8cbK5g7OFlF2idiRlwFg0TJhBI7RJLWZ1bscPzuSHWZHJ
         MHEp6B1KhypWU6ay/H5Mrqnezt3oMX31B6jFZWG3RbxeOuk7kNHaWp7U6pfJKF45+9G/
         fMXNRyqEBOzIDhlNGpbFvSgFipmRSV8hqVDPK4JBWQzjqOwTfwOTfCXG44j9QvLVadY3
         ry2yZXn3UNCvfqz52Mzh8FL3c6u1twMtO+FWWg8Kmgjh4tQuOS5QxGeRnXzowD0qmAyM
         zPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeydH/XkYiDYJiM2KNMJmOB/GXQ1K6MI+aK2FqQsjbwp1uBL2FRGcm7XgmbHwVO1QzEMsZep0qwDeZSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw3uhgRJCi35ykr3w1uaDHMVhGrAEA2FN/XGqyg4heSSkPrn3x
	YqRld+grtETy65j1b6UZ8r9qSV1Ofo2te3ACvcXi9TLxXIpwKh8jjyZ+8LKYy8GyO4o=
X-Gm-Gg: ASbGncv203Po52uPKRg33yoygLoNEhBqOTJ5YnFPTTqXWrFVF8P9LDNeo3yA7NY5YAm
	nrprs6S9vxucyA+qRWYWzzZfDr7DtLLJ25339P87H+Ur4cyYlnFaR9WT4SXhBUINWwbhov+2BkX
	Nov2jUy6zTRGRmr6oty6ISedT94dRSZ5nZzBj8pRclefJEnP2JATXor7wMe7mNKi6d0wejZ5Xqo
	gqsY5xGrhmnZiDpxDr54XGx7HbSywyCNIIw5B6sEM2uryiuVOXagJoD4j16nytW91hjbvpb+bMY
	nxtas+kdfH8bStc0jipxkbWlHJPYNQcFJ7dqt/gLXWdSzQM8F4xyneeyk6wjFD82/8XnGIbWH93
	DEgImUAd1U39qaWvQWMRw8MAb/PKmL2+sS2FFZDoZKunuKYBAaSU=
X-Google-Smtp-Source: AGHT+IGekwp7EF+dtU4JS1ed4hOg7nluotXxCX3FAdah8xWHHrvdm7rQ2nqJB3VIiCQQDM/LY5MjbA==
X-Received: by 2002:a05:6512:acf:b0:553:34fc:3bd5 with SMTP id 2adb3069b0e04-5539c2004a5mr587311e87.8.1749690945252;
        Wed, 11 Jun 2025 18:15:45 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:44 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 04/10] media: qcom: camss: populate CAMSS children subdevices of CSIPHY IPs
Date: Thu, 12 Jun 2025 04:15:25 +0300
Message-ID: <20250612011531.2923701-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To add a number of CSIPHY devices under CAMSS device tree node populate
the children devices, if they are present, and exclude handling of such
discovered CSIPHY devices in runtime from the CAMSS device driver.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../media/platform/qcom/camss/camss-csiphy.h  |  1 +
 drivers/media/platform/qcom/camss/camss.c     | 77 ++++++++++++++++++-
 2 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 3b73248f1364..f092b7ff2f26 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -91,6 +91,7 @@ struct csiphy_device_regs {
 };
 
 struct csiphy_device {
+	struct device *dev;
 	struct camss *camss;
 	u8 id;
 	struct v4l2_subdev subdev;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 695f113472a5..71a37447e17a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -3059,6 +3060,47 @@ static int camss_parse_ports(struct camss *camss)
 	return ret;
 }
 
+static void camss_csiphy_put(struct camss *camss)
+{
+	unsigned int i;
+
+	for (i = 0; i < camss->res->csiphy_num; i++)
+		put_device(camss->csiphy[i].dev);
+}
+
+static void camss_csiphy_get(struct camss *camss)
+{
+	struct device_node *camss_node = dev_of_node(camss->dev);
+	unsigned int i;
+	int phys;
+
+	phys = of_count_phandle_with_args(camss_node, "phys", NULL);
+	if (phys < 0)
+		return;
+
+	if (phys != camss->res->csiphy_num)
+		dev_info(camss->dev, "Number of phys is unexpected\n");
+
+	for (i = 0; i < camss->res->csiphy_num; i++) {
+		struct platform_device *phy_pdev;
+		struct device_node *phy_node;
+
+		phy_node = of_parse_phandle(camss_node, "phys", i);
+		if (!phy_node ||
+		    !of_node_name_eq(phy_node, "phy") ||
+		    !of_device_is_available(phy_node))
+			continue;
+
+		/* At this point it shall be possible to reference the phy */
+		phy_pdev = of_find_device_by_node(phy_node);
+		of_node_put(phy_node);
+		if (!phy_pdev)
+			continue;
+
+		camss->csiphy[i].dev = &phy_pdev->dev;
+	}
+}
+
 /*
  * camss_init_subdevices - Initialize subdev structures and resources
  * @camss: CAMSS device
@@ -3073,6 +3115,10 @@ static int camss_init_subdevices(struct camss *camss)
 	int ret;
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
+		/* Initialize only non-registered CSIPHY subdevices */
+		if (camss->csiphy[i].dev)
+			continue;
+
 		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
 					     res->csiphy_res[i].csiphy.id);
 		if (ret < 0) {
@@ -3155,6 +3201,9 @@ static int camss_link_entities(struct camss *camss)
 	int ret;
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
+		if (camss->csiphy[i].dev)
+			continue;
+
 		for (j = 0; j < camss->res->csid_num; j++) {
 			ret = media_create_pad_link(&camss->csiphy[i].subdev.entity,
 						    MSM_CSIPHY_PAD_SRC,
@@ -3265,6 +3314,9 @@ static int camss_register_entities(struct camss *camss)
 	int ret;
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
+		if (camss->csiphy[i].dev)
+			continue;
+
 		ret = msm_csiphy_register_entity(&camss->csiphy[i],
 						 &camss->v4l2_dev);
 		if (ret < 0) {
@@ -3321,7 +3373,8 @@ static int camss_register_entities(struct camss *camss)
 	i = camss->res->csiphy_num;
 err_reg_csiphy:
 	for (i--; i >= 0; i--)
-		msm_csiphy_unregister_entity(&camss->csiphy[i]);
+		if (!camss->csiphy[i].dev)
+			msm_csiphy_unregister_entity(&camss->csiphy[i]);
 
 	return ret;
 }
@@ -3337,7 +3390,8 @@ static void camss_unregister_entities(struct camss *camss)
 	unsigned int i;
 
 	for (i = 0; i < camss->res->csiphy_num; i++)
-		msm_csiphy_unregister_entity(&camss->csiphy[i]);
+		if (!camss->csiphy[i].dev)
+			msm_csiphy_unregister_entity(&camss->csiphy[i]);
 
 	for (i = 0; i < camss->res->csid_num; i++)
 		msm_csid_unregister_entity(&camss->csid[i]);
@@ -3379,6 +3433,9 @@ static int camss_subdev_notifier_complete(struct v4l2_async_notifier *async)
 		if (!csiphy)
 			continue;
 
+		if (csiphy->dev)
+			continue;
+
 		input = &csiphy->subdev.entity;
 		sensor = &sd->entity;
 
@@ -3585,13 +3642,22 @@ static int camss_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = devm_of_platform_populate(camss->dev);
+	if (ret) {
+		dev_err(camss->dev,
+			"Failed to populate camss children devices: %d\n", ret);
+		goto err_genpd_cleanup;
+	}
+
+	camss_csiphy_get(camss);
+
 	ret = camss_init_subdevices(camss);
 	if (ret < 0)
-		goto err_genpd_cleanup;
+		goto err_csiphy_put;
 
 	ret = dma_set_mask_and_coherent(dev, 0xffffffff);
 	if (ret)
-		goto err_genpd_cleanup;
+		goto err_csiphy_put;
 
 	camss->media_dev.dev = camss->dev;
 	strscpy(camss->media_dev.model, "Qualcomm Camera Subsystem",
@@ -3648,6 +3714,8 @@ static int camss_probe(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 err_media_device_cleanup:
 	media_device_cleanup(&camss->media_dev);
+err_csiphy_put:
+	camss_csiphy_put(camss);
 err_genpd_cleanup:
 	camss_genpd_cleanup(camss);
 
@@ -3680,6 +3748,7 @@ static void camss_remove(struct platform_device *pdev)
 	if (atomic_read(&camss->ref_count) == 0)
 		camss_delete(camss);
 
+	camss_csiphy_put(camss);
 	camss_genpd_cleanup(camss);
 }
 
-- 
2.49.0


