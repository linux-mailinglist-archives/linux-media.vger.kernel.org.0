Return-Path: <linux-media+bounces-16314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A37951F99
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 18:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04000282F32
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 16:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016B81B8E99;
	Wed, 14 Aug 2024 16:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fvUXnbDd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B681B86F0
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 16:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723652095; cv=none; b=QcdtPLxN2TDai/KNWqRHqX08hA2lnVQEf56ZA4G14jvNIG9MPmYN5O4G+plF3vYOThuJdKb/I7siH7bpp1HW1F2/Plg0pkL5IjgU+R/rec5Bs6aDhFPrwQpZHySBOqQyslH8FfNl/L5IJjmFr2uO7VHbrcPgU/pufr/VFPQxDOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723652095; c=relaxed/simple;
	bh=gqbMiXNwJFJXl+62Es6Vo115fZrEynorUGC4qCQ9vDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Isjoawj2FUAt2h51iuT38gRoHOLTRK6o/x3Z+ptsVnNz53gxhlUUsTXf0GTs2SI2se7T0bdMShRp1FF8yxneCDTamECmHgX3vL89rXbKhGX0SfycsFQCl2Uor5fOSBgZ+mYCyg4ygaEsV7uBaLnmMUcjtSkf675CR6ZSJnT8NAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fvUXnbDd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4280c55e488so112255e9.0
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 09:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723652091; x=1724256891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdXwJjU7Fbh1uS/qpTeyladuU6fek5vMFj3oZ/ZloqM=;
        b=fvUXnbDdf4G8UMXheWZNCgWZGhAIj3EK6CT8XBt/pxqXA6oJOD35EF9XT9l0fcnNrB
         3UtYNYGfv6SntLc5FAsIMAi1lbGe09Lk4PVWhH/La9OUbgxvY54Lwt+f484A75ONlJdT
         LhtqoENvjcFUTDBRrge40hIwHmza1VFCn21aIOSQyYA606MhJBmLTT0/JWTvVCllbBW6
         LDYSoZuUCekK6jxmve2Oe60iU5zReBx+sYC6HXCeS4mUG4bU5scvVPqEFPgMxSoe+8fG
         dlghwehHY3eDt4X7Dx/SaPPYS2B9vVc8Hyir5l/lKneInSxKo4SSlWHDfFrINlEC8Cx3
         3OZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723652091; x=1724256891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdXwJjU7Fbh1uS/qpTeyladuU6fek5vMFj3oZ/ZloqM=;
        b=knJ4LNdP17PFh5JtXW++YiZfc7fHLL9cujMkWKY+zxStyT5tv9YGaGvChFUIAKGFWY
         axEqKNa2jIs2NEJB6uhuqTx8f/IoDzw5nlyAnBOK0O2XV8vfF7c2tL60Xki9I0G9YYDL
         K9G8KerwAQ5n0Sdi4/1Rdg6ug2yzFfvtO8uGG3n9WntneJ0vFd9IfYxMH3y/IdbPxR6I
         WoS3uAaQqCbS0SPcPFPSMm7mwqnk5JjaQsvdm7tu56Oe6xFZLIGX6sKbPMMoIXn3L3RB
         4mCdbFKuauwqdMeDuSaCz3SQJ75YTtCDtW5D4VV5MrLfjgd7cggJ8n0PbFedW5ks3X7v
         XRrg==
X-Forwarded-Encrypted: i=1; AJvYcCXFyKjr/1sHRq+45qc068/VodCOsVBvfuj6E8P445XZU5llGnEqe+FJc0zlt378QxCJzW0tVYFgVqavbG+ggjpau4IzhQyFKa0MgG8=
X-Gm-Message-State: AOJu0YxR7fmO+GU0RhX5752/+ntXg00/sWbVyIB+MOkzisfI8LdXIi5C
	gbD0dvjc+C+v6JX4DaeCpY1YoSaeHwUaV/m2zwEtM67sEthJ48ep305TlB6ClWE=
X-Google-Smtp-Source: AGHT+IElmNJ3m8B/wz85EEfNBjA8nlEQnCbDf5OaWkj2K/ZAN1S51QP7jcXUNJ02UuqmthaHICfZmA==
X-Received: by 2002:a05:600c:4f55:b0:426:67fa:f7 with SMTP id 5b1f17b1804b1-429e2344fb9mr1509995e9.9.1723652090851;
        Wed, 14 Aug 2024 09:14:50 -0700 (PDT)
Received: from sagittarius-a.ht.home ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3cc80sm24200835e9.21.2024.08.14.09.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 09:14:50 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: quic_depengs@quicinc.com,
	rfoss@kernel.org,
	todor.too@gmail.com,
	mchehab@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@quicinc.com,
	quic_yon@quicinc.com,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH] media: qcom: camss: Add hooks to get CSID wrapper resources
Date: Wed, 14 Aug 2024 17:14:34 +0100
Message-ID: <20240814161434.1484857-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <44efa3ba-f60d-4a17-a8a1-fa7d49aa3234@linaro.org>
References: <44efa3ba-f60d-4a17-a8a1-fa7d49aa3234@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New SoCs have CSID devices inside of a shared "wrapper" i.e. a set of regs
which is responsible for manging the muxes of the CSID to various other
blocks throughout CAMSS.

Not every SoC has this top-level muxing layer so make it optional depending
on whether its declared as a resource or not.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 12 ++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e797f3275fb0c..6da04cac93f3d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2037,6 +2037,7 @@ static int camss_of_parse_ports(struct camss *camss)
  */
 static int camss_init_subdevices(struct camss *camss)
 {
+	struct platform_device *pdev = to_platform_device(camss->dev);
 	const struct camss_resources *res = camss->res;
 	unsigned int i;
 	int ret;
@@ -2064,6 +2065,17 @@ static int camss_init_subdevices(struct camss *camss)
 		}
 	}
 
+	/* Get optional CSID wrapper regs shared between CSID devices */
+	if (res->csid_wrapper_res) {
+		char *reg = res->csid_wrapper_res->reg;
+		void __iomem *base;
+
+		base = devm_platform_ioremap_resource_byname(pdev, reg);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+		camss->csid_wrapper_base = base;
+	}
+
 	for (i = 0; i < camss->res->csid_num; i++) {
 		ret = msm_csid_subdev_init(camss, &camss->csid[i],
 					   &res->csid_res[i], i);
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 867e275db4bec..a9b733cc626d8 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -66,6 +66,10 @@ struct resources_icc {
 	struct icc_bw_tbl icc_bw_tbl;
 };
 
+struct resources_wrapper {
+	char *reg;
+};
+
 enum pm_domain {
 	PM_DOMAIN_VFE0 = 0,
 	PM_DOMAIN_VFE1 = 1,
@@ -94,6 +98,7 @@ struct camss_resources {
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;
 	const struct camss_subdev_resources *vfe_res;
+	const struct resources_wrapper *csid_wrapper_res;
 	const struct resources_icc *icc_res;
 	const unsigned int icc_path_num;
 	const unsigned int csiphy_num;
@@ -111,6 +116,7 @@ struct camss {
 	struct csid_device *csid;
 	struct ispif_device *ispif;
 	struct vfe_device *vfe;
+	void __iomem *csid_wrapper_base;
 	atomic_t ref_count;
 	int genpd_num;
 	struct device *genpd;
-- 
2.45.2


