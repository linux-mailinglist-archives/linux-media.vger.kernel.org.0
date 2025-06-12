Return-Path: <linux-media+bounces-34559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2F1AD64F8
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 03:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A63A2C0598
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 01:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046E9148827;
	Thu, 12 Jun 2025 01:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pq1+Mgyb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E04140E34
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 01:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690944; cv=none; b=oNBIe39xPE/sQBTIqq5FzheyzJFWaeQgoDctNI+6OcQsY/iG+4wlghiOmShYi93N83ZW1q1EbRiN1jnFwn9gDfxsuHjG0r6gRC4/zVCT3DVsowAchm7n/0DDEgG7yJNuDy5GoS1OeQ3JMlkMu7XnQB8fDLsLrd4GnNrtAJkUz1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690944; c=relaxed/simple;
	bh=348Owfu8+NKEBcDAc1yCBm1UctAgEMq/YnSiv+q1CJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L31xyKVc7mWKGDW8cso3HKQrd2qR0AFYCuFPDZSodD4qU+8NltEpuRy4PPuh6CJWE92muiKuocvVD6z3fAF4u1xL2O6B0Am1iAZDq+QKbslvct0FsPvYUajP/iaCykHXXL1sOfEjYDIQfKaKS2v+IRThVSGDwRsFB5lpCksZ7Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pq1+Mgyb; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553230a9753so13743e87.1
        for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 18:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690941; x=1750295741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6NTxmPbc5uooQyom/INTaDK9H/lohg3U1Eew3ZB4b0=;
        b=pq1+MgybuJ5kznaUELk4li9ICdbZKSuCzAQWNV/bwGrm0CwUDtOfuBrkaw27qCVbWB
         b198Ia5UtejMDalAGXXqhszVbjDyDJm/mR6GkzEUR41Q1RHjbl/ZK7ext1sCoqozqq7o
         XZv1vmvTo5zW4M8vdjvgx+xi8Ca7v6+gR7XNoZeMvwp4lUsHGssJCmyVhPYe3LF0th0E
         3cyEhwwri4rdCrWKVgvHt8S8oS0qpO+tP3w6jlLU4HYpWx16o3kYyNXPzGIUhIu/Kobt
         qxLJ3ihmgvkyctyrQ9h5ykVESkNi2RAu2fSeaKsKY0YDuyNAH3Du8EesSHaiclwY5SkL
         tyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690941; x=1750295741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6NTxmPbc5uooQyom/INTaDK9H/lohg3U1Eew3ZB4b0=;
        b=eX0nQ1uN+oKjmkIOIWsOIQe0rL5UC/n74m8B0ctUbc2HF3wvv+1JpPlWmR658PmCIG
         qTLndffmxdS3elZFXcZaDgi+c4nFRMBTx77sIuIuB6q9tsAxl/v+y908rhAPUnYy8aTD
         fC0Yen95NGsZlpNIj542gGGkynqmL4G99vjr60zHqVF1JSvzM9EriD1PUPDcSEElcoMh
         KhjAAJJT5jwJ1HSvaMjY3D6aAqXIx1FgCBcsxmo00WN9dJWOaOpuO8jvmYjMYnc9tPB3
         J///19Z+p+diiX/dIi4PRL+EuDIQWxyY16+gmqiIHEj82fs0teMlntXVHV2+PvNxJwTH
         FqkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqK+aDZYgMMMHkv5YGjNRDpTxQvAjyDuIrRsfxXKdH3zvU25o0n3pr0xGKRx1jfLH+w+wEsvyXeqGrjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6DL7D886OjB+brzuFRQQ9tXFZipMdDoPnLB27cHPODgmauP0F
	XwX08EkgILzGcI7k9U9ckf8y7G2LpQsHoREYBayrgf/5Sfh+auQdfpI73+5/+YuJ54Q=
X-Gm-Gg: ASbGncsyjOyHPKDk/KcQ7tFLTebPL/zhOmf/FnjcpwRGjcwoSnAwO9u/Q+OlHK3x/pq
	iKaoT13C34CP17Cx1E2nYbOCMZQIbxEUygf3Nh56t5IZRzUnzWtthsae0V88KoPwcW6IBnLNkoo
	3PuXVXa0qOmRaoPLOQGKRLnpOV17kTfQfKIIBbs2QbHCrjPokgWdC9bItEQeQEmvhYFX/dcGe6E
	XPbUloPebnQ0ddTSsC6uYrQ+sch3RxMM8myFXX8x8OD80bwFr1ZdZoTMFLZsNwucTncsKY6pcod
	uX5XaYOtIbShtM3vFgFv+sTY1JLyBI28y4CzVvjkSMd9r6KAA6A2HyoxkMoq/JXAEhLwNv5DXp2
	9+oDmVgyUIuv5fBubUKXroB0HB6P3Admfa/X26Rdz0DOSKMzoNk8=
X-Google-Smtp-Source: AGHT+IFkAkj7pcBqvW8bpnlcAqEv/PlsD4qP9gZ18v5DQ1XdvO0ptkX6z7eUF8xz3puBqvAG72yuvw==
X-Received: by 2002:a05:6512:33ca:b0:553:2c44:c259 with SMTP id 2adb3069b0e04-5539c246f64mr477988e87.9.1749690940689;
        Wed, 11 Jun 2025 18:15:40 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:40 -0700 (PDT)
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
Subject: [PATCH 02/10] media: qcom: camss: remove subdev resource argument from msm_csiphy_subdev_init()
Date: Thu, 12 Jun 2025 04:15:23 +0300
Message-ID: <20250612011531.2923701-3-vladimir.zapolskiy@linaro.org>
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

The removed argument is directly and unambiguously derived from other
ones.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 6 +++---
 drivers/media/platform/qcom/camss/camss-csiphy.h | 5 +----
 drivers/media/platform/qcom/camss/camss.c        | 1 -
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 2de97f58f9ae..1ba3fc2e33ac 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -569,16 +569,16 @@ static bool csiphy_match_clock_name(const char *clock_name, const char *format,
 
 /*
  * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
+ * @camss: CAMSS device
  * @csiphy: CSIPHY device
- * @res: CSIPHY module resources table
  * @id: CSIPHY module id
  *
  * Return 0 on success or a negative error code otherwise
  */
 int msm_csiphy_subdev_init(struct camss *camss,
-			   struct csiphy_device *csiphy,
-			   const struct camss_subdev_resources *res, u8 id)
+			   struct csiphy_device *csiphy, u8 id)
 {
+	const struct camss_subdev_resources *res = &camss->res->csiphy_res[id];
 	struct device *dev = camss->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	int i, j;
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 895f80003c44..d82dafd1d270 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -113,11 +113,8 @@ struct csiphy_device {
 	struct csiphy_device_regs *regs;
 };
 
-struct camss_subdev_resources;
-
 int msm_csiphy_subdev_init(struct camss *camss,
-			   struct csiphy_device *csiphy,
-			   const struct camss_subdev_resources *res, u8 id);
+			   struct csiphy_device *csiphy, u8 id);
 
 int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 			       struct v4l2_device *v4l2_dev);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 0d05f52a6e92..695f113472a5 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3074,7 +3074,6 @@ static int camss_init_subdevices(struct camss *camss)
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
 		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
-					     &res->csiphy_res[i],
 					     res->csiphy_res[i].csiphy.id);
 		if (ret < 0) {
 			dev_err(camss->dev,
-- 
2.49.0


