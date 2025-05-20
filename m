Return-Path: <linux-media+bounces-32857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F002ABCEEC
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EAD11B65D11
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 06:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEFC25CC48;
	Tue, 20 May 2025 06:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y9je46LL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A02D25C805
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 06:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747721006; cv=none; b=VdAYpqzsrx/lG6K0B0Adk93BmZHUuYYowVJcmkSEzdl0Jot6Tc4UxH5bjARJE0YycsXbfEa2tvWB3ZZ8KfHYPN1uZxDz3Pw9AVO0Q3AJQI9R+Egbd0M6GUxdNqKFPTWFzUvgmiezruC92UApjgro7ZWo3IACPNXTrk/Zto2jh/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747721006; c=relaxed/simple;
	bh=s5ZFlWa2MpdvYNmAn19sW48vqvwbzszHzHufPZ8IlvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KeXdK2I2SZ6po/jknem0doNoM3AVt/924KDAlo/rCv34ylUp2drv+4g4DOK6sPW/6JHu2kud7gUm+vkQp6cua8GSl+v29EKtv3nEtu2pjwiOMluhQPNrgPuyNSJqmz4gdjmoRdmQ4uPSGnnxHKpMfj86ye3gB4GLVK2Qupf3lAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y9je46LL; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5faaa717cfbso898445a12.0
        for <linux-media@vger.kernel.org>; Mon, 19 May 2025 23:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747721003; x=1748325803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GunpgoETVGf3K3HF59YPy781/KUyyc4hFczZi9N9xRw=;
        b=Y9je46LLNnQXdbG7GCBaSwOXxuGl6ZS/bymKriIOQL3TflNf0zT73JntNhOoc8Qgo5
         3GTGG8MIppdiPWRDTEFdE/Bbe9RINQZFywUu6ZDGSuoyWGNwPoep+nKZQLd6qfr4N8eT
         TONcy13rfRk9QobZNqZtndAB8vupBiNnsTJoXTBxcuO5oDuKnwQRKFTlZzq67hIPsgN2
         FxoMSaGswDEwJLV4eWycEzcOMDNYJf354UJ3FEf73LJCbjerD5FvENo+mW/9sj13C0TR
         k0kPpKY0RGR6Qnti9bh/nu4PrQLrPXnq/vUaOQSzn0YTetNDkuyJ0iwDvIOKTTP3olQW
         C1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747721003; x=1748325803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GunpgoETVGf3K3HF59YPy781/KUyyc4hFczZi9N9xRw=;
        b=caxeUbWxuXUN09PqjR5OUN4HedUWyKgDCLkM02WE/DVWoylamHGeGDxTd9K52E7XBV
         dbOfcdOK3xqPCi25IfrjWzfcrbKf9zVl18GwXbKQPWCzHKoTUXc5qsc6izcdNxvP2wVd
         DbU3jMeVvJu7/BFsW9Df4bA/qZvwYu6cydevDMYlRtsPz/O2aRce82FzKSzPHv9LA3fI
         p8cej27LJlBWs2gcRfV3ogOJg4yX0LHtgyN+AirOUWlGgOgcgYw9L6ZzmQSwYni1qeK7
         QDYq7YzwD2VEwBIHYVVyX+KOXtzljGPZHsOJeXUCaxJu/ePIdcIYpgGVw1Gy9Qejusaw
         jB+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxYC6WEdMJBXf0aID3AD1RDdjpeHYJA9hMuBY/ZFYLcaCfpofm3uUoVjjkEYa+YpQgWM1OFTP9coLPug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0HTbu9aQYPY+so+9KQ9WeSoli7MDfvYHzXf9/16kAowS9I40G
	ay9+KVLvnHGWfOj40YIaTQ8dmR8fD43vRkMyPqNzpMIq57wgZLLBp9AqpNWLzycphe8=
X-Gm-Gg: ASbGnctvm1MhmGHkkIlQgK5NaGE/JMCADGp28vsAi6FXG+DvjJZmL7YmBBQBN7gBYRW
	6f+VHgrjQqziva+W0f5fnrbRaMrWUE4XCrfr1wcUNTm+eIlWGpXb7aHRMS2Agan7vemLjAOC1uc
	Wjna0/q3GrfHxrEQHwaw48oepRugd0qg8C1ZLvRALiqxCOyTS8SzCnw7WSDOgCTic7+hmH45I68
	SaQapIRPEAVVeKNWpLxABELIqsgXq7mAzYqkboeUTTLgGZH7mRUYinZBfMFQkNFIIDkuR04pQxT
	ou/fh9KWvRvVKFpm3kA+Ef7bBnoUmX+wl4/QRo+mkyoaFsxhKbLXxKdO22+cOA==
X-Google-Smtp-Source: AGHT+IHxcxUmDMY6HrZgZSsQpx9fvPtvfK/+uzfpHOMfp00cUxC0UaWFC598+1/y+YpvBHLB6GAKmA==
X-Received: by 2002:a05:6402:254b:b0:5fe:c344:5ed1 with SMTP id 4fb4d7f45d1cf-6008a3a25aemr5183705a12.1.1747721002546;
        Mon, 19 May 2025 23:03:22 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac33a88sm6698710a12.51.2025.05.19.23.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:03:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] media: qcom: camss: csiphy: Stop spamming logs with version
Date: Tue, 20 May 2025 08:03:13 +0200
Message-ID: <20250520060310.7543-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250520060310.7543-4-krzysztof.kozlowski@linaro.org>
References: <20250520060310.7543-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4539; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=s5ZFlWa2MpdvYNmAn19sW48vqvwbzszHzHufPZ8IlvE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoLBsjSlBwNYTLmWtVGQ9R3zgaEbN1PnfIYX9vt
 xKiK0S8372JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCwbIwAKCRDBN2bmhouD
 1wnSD/92zfJ7ofRfnAh3nDOWREUebPj6OL6stRO4TTMWC+ve0bwjvTL2xJclxfPP/vSNOweYBJR
 Qj4tn/LR1At9cViTF5wlCsYntFeAA0GK3CkTUDjhiR8BEgXX2W69+4kk0zyHvpaczvgfSh0+XJd
 K6s3c3e++0Lhvxl09Z/uW44CSY6i43yxsr5UKeESV99YBMR431H0ejF1C9PeVtFflUFMI7M1H09
 TJ3KvM5A58DCLAAyvVNcJDewWD8SNG1kOJYwJFJl/LfZ6O+JtYLPjZJ1qPqUm+a61XBot0YyvU1
 BpmPRdQqqZytWC8vU2aqzHApJmvgO6L8S9Ei8J84ClZiZiUF9SNW8ksCCRMGJhMrry9dmUXGU1s
 hVawP8+q6gngjmuvvSXo7kjdozH76XnDS4uiMPvmo0c6roBywe4YhGTZZgxjnEbHY6te93tyuCl
 dD3tMa/1w8V6mYlkOSjfgXgMhVlwmkkJKRH6Dc9cJGpGBpCnJ0+PRWUC+OStUN7tkE8ocHlsFmZ
 w9fN10FvAjaVLlLe8cYvJYSZ03u+knWXhZj1mVYw+0/yP5hu3hY5rdRI1DV1HmfJDaubNUtUh0P
 LLPdYFpdXCgnYdc8eJ02wZb8/mCOWHQwaRIMJAVuxqZ9Dl2pPJra3sMnjaB1jNsmSna9XM5eTHL 1xpRnqEA9GityVQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Camss drivers spam kernel dmesg with 64 useless messages during boot:

  qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
  qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0

All of these messages are the same, so it makes no sense to print same
information 32 times.

The driver does not use read version at all, so if it was needed for any
real debugging purpose it would be provided via debugfs interface.
However even then printing this is pointless, because version of
hardware block is deducible from the compatible.  Fix the code to adhere
to Linux kernel coding style: being silent on success.  For the same
reasons this should not be even dbg message (see driver development
debug guide: "In almost all cases the debug statements shouldn't be
upstreamed").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Extend commit msg, because apparently coding style and debug guide
   has to be reminded in commit msg, otherwise rules don't apply.
---
 .../qcom/camss/camss-csiphy-2ph-1-0.c         | 10 ---------
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 22 -------------------
 .../media/platform/qcom/camss/camss-csiphy.c  |  2 --
 3 files changed, 34 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
index 9d67e7fa6366..09d3b21e222f 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
@@ -40,15 +40,6 @@ static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
 	return lane_mask;
 }
 
-static void csiphy_hw_version_read(struct csiphy_device *csiphy,
-				   struct device *dev)
-{
-	u8 hw_version = readl_relaxed(csiphy->base +
-				      CAMSS_CSI_PHY_HW_VERSION);
-
-	dev_dbg(dev, "CSIPHY HW Version = 0x%02x\n", hw_version);
-}
-
 /*
  * csiphy_reset - Perform software reset on CSIPHY module
  * @csiphy: CSIPHY device
@@ -187,7 +178,6 @@ static int csiphy_init(struct csiphy_device *csiphy)
 
 const struct csiphy_hw_ops csiphy_ops_2ph_1_0 = {
 	.get_lane_mask = csiphy_get_lane_mask,
-	.hw_version_read = csiphy_hw_version_read,
 	.reset = csiphy_reset,
 	.lanes_enable = csiphy_lanes_enable,
 	.lanes_disable = csiphy_lanes_disable,
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index f732a76de93e..bc605931278b 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -541,27 +541,6 @@ csiphy_lane_regs lane_regs_x1e80100[] = {
 	{0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
 };
 
-static void csiphy_hw_version_read(struct csiphy_device *csiphy,
-				   struct device *dev)
-{
-	struct csiphy_device_regs *regs = csiphy->regs;
-	u32 hw_version;
-
-	writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID, csiphy->base +
-	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
-
-	hw_version = readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 12));
-	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 13)) << 8;
-	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 14)) << 16;
-	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 15)) << 24;
-
-	dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
-}
-
 /*
  * csiphy_reset - Perform software reset on CSIPHY module
  * @csiphy: CSIPHY device
@@ -858,7 +837,6 @@ static int csiphy_init(struct csiphy_device *csiphy)
 
 const struct csiphy_hw_ops csiphy_ops_3ph_1_0 = {
 	.get_lane_mask = csiphy_get_lane_mask,
-	.hw_version_read = csiphy_hw_version_read,
 	.reset = csiphy_reset,
 	.lanes_enable = csiphy_lanes_enable,
 	.lanes_disable = csiphy_lanes_disable,
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index c622efcc92ff..111c3a52a6d1 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -243,8 +243,6 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 		enable_irq(csiphy->irq);
 
 		csiphy->res->hw_ops->reset(csiphy);
-
-		csiphy->res->hw_ops->hw_version_read(csiphy, dev);
 	} else {
 		disable_irq(csiphy->irq);
 
-- 
2.45.2


