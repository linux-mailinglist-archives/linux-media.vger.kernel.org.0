Return-Path: <linux-media+bounces-31337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C56AA19D0
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 20:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66FB29C0C76
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 18:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B50254AFB;
	Tue, 29 Apr 2025 18:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iaJcwWmI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8981253952
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745950196; cv=none; b=Vle0qWANlGD6yRB+SjCyQg6zQauqgqk1cLfg3vGCdO+UAgMBv3C0cp7CRMJEg5pNsIYV0MOUXvbPgv7SCFr8gl6cOw3XeZ/3WgXd6EjEA0bokuoaAv3Vo9WpdX8lIZYkhU6q9iFFqjeSjf8kI6f7EraUvMXUI6J/yf2tE5VbuyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745950196; c=relaxed/simple;
	bh=5c/GwZGg6YfVlYGBkBCZKwX7PpiLtVcO4mQlYw0R+Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tJ4dshJgfUwdadbCAygT3v5STd8bEOr12K2WDTLQMYkpSTT4dxFULYOpPYcYOepzznqUGPebnxaOTz6OsqHrqs3DJ1bzQPff1euUWbgyVesVmbeWUntWDJyhIYZknCt6abwJ3Nn5kSkg6DyYFpRUlWrwiAeG/laPIIhcdI8BTv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iaJcwWmI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-440668acbf3so8536405e9.0
        for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 11:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745950191; x=1746554991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq/xrCbSpMl8yUGK/CtcRuYFkY28ZnkmRZXSp/OjKl8=;
        b=iaJcwWmIrWAMWNpMsq5wMcXnIBjvKe8BxMjq02BblNT+eO1Gu2w+9VqVPtA13jRF6J
         wvwgxMCJBAkguOVhyTduMmVApwik4LI7ztjk8ZFGUkwcbCVZ6oYWaelhl54oVH5fSEI/
         k4smSrh9p7UpAtakCmRxCzx2BpZOz2H6g/9X8lrDdWFjYm7cPzjrFLrPqcVMRGnheect
         EaCMQ7K5/cHhFHh/SnC+8C2FBrImDnYYGo0YA1+oYLyBy6wLHApdkX4if0dSAgP4VmAN
         JBmAae0T3jLEvSgtI+QILqCM1osAcq1lVAljGO3ZKN37dwnFMQ3T4Uq1i/S3Pbv126Z2
         y3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745950191; x=1746554991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uq/xrCbSpMl8yUGK/CtcRuYFkY28ZnkmRZXSp/OjKl8=;
        b=h64v01gaWKCC7BUs3+IHFBNRUyX1hSDMipKcGeSP//kIVOxt93Ka7vi9AUxJuuSy8x
         Rp+kdNijPwPqCETyZSKP5KQZ82GbBrGWM05+5yMZEkvh4yqlMctqRWuT+i9hFxBX6BOn
         uiN4qe9Q0to94ezbNm9q8tfDoo885NiYFY9PoLNhwJq8yBvS+BgYoBWsfKfen7vAYbQn
         Gp8itdWDv1/MR5Q2p+/1/CErRHxs24495jd70UIwXjSBoxUimToRzWjb7VByVeRopj5/
         8f3005QRPB8VN3BinnFyQU0jLhMgGK93trsJaUCflR3xJzX8lBr6dFiqaYSdoJ+U4cZj
         gS6w==
X-Forwarded-Encrypted: i=1; AJvYcCUbVJ0EkM6rkvsCfajZK+09/14lGQfT6em8ONjFhVDqK6KPIu9Yvu2XRT8z0NvYDX+1XVkkHcPXZyAbcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbtbUwMvVS6lSKgBl3ZAW0soXSQf7cgkrcWDs90gUzzvwUuHS5
	iTa9y0OUjfDEx/n5xy7MQcqGE9j7zeWCeJGfzFWzSmV0fi3s67oB5buyJuiS9LU=
X-Gm-Gg: ASbGncvAD+ZjAvfS77dKg4WMaY0TOrQAY5NaMak+s06hSiReTs3I5V7t8pVfxsJ3zPm
	aGf7LVR5WeXjFvQEFShbwNuITWz8DUyZqzDToeFgHPGIlzYZN194zqGyfO+x753yLxWSHqNcap1
	qMFpDn2b2ZnpgQXFkp5K2obKdCBDOoyekFHpCW6Xdaxe5sFwIaUxgybFyIcPXwhBhoRkiO0rl19
	v+74uQwbMGrnsbFloVlWEUStAxD4oT9qQty+OtfUEAD/h7OVfRBT5kAsC17E88aBZpXZ3YfDzSm
	AxNlbqdHN9Ri9b7U0wVwZ2RgmWvtNNMyl6HqvTOK4HdbJ5CZ6Q==
X-Google-Smtp-Source: AGHT+IF4ruiqqDP8X8kBz07PWrwGmJHtaW7Bjk2i12EiWRq+A8qrj2gI7KFa7bV/OaRdFcxu+zZ3jw==
X-Received: by 2002:a5d:59ac:0:b0:3a0:81c9:3eaf with SMTP id ffacd0b85a97d-3a08f7d186amr101070f8f.13.1745950190928;
        Tue, 29 Apr 2025 11:09:50 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5d52bsm15028818f8f.90.2025.04.29.11.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:09:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] media: qcom: camss: csiphy: Stop spamming logs with version
Date: Tue, 29 Apr 2025 20:08:31 +0200
Message-ID: <20250429180828.950219-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4129; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=5c/GwZGg6YfVlYGBkBCZKwX7PpiLtVcO4mQlYw0R+Yw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoERWhC8iFUeQq7gTWXqi7rueBD/nq8VUxg+SFS
 j6KI5AwgWCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBEVoQAKCRDBN2bmhouD
 13DmD/9Yl/jXVFoF0eFwjIpMunLzVnW4YlDFQLgzjXWIywBX8pk2aZ1ouyFIJiqPl81pvGI5WjG
 q0T9/NfNmdvYBTht280OPepdYpOrwVNZCc1/vKuiL6eI/wt3lz2PoUvJsjBqlcWwbRwxHD41KgC
 xVTc9R0EHFFJNiaTBMwFoij+EBtxsrXRIkp7rUjJgzWd4+QDWIuUrszIPI+vbf1j3vVFQ0QOdr1
 8tUgsTdaPtY8ZnyDI3S7eAr51p27M59pmOYdun6xqFgUXrhFEEWdgVUhDaBxDYMWCwN5EFR8hyx
 eG0eitZe07kA1SejXLokzVfDHtDM7hwHJlV+j7aqk0ycTpp+DJfrGUCWxOXJYDvZj6ik5BMcUX2
 BCVMDv2ABuQlrriRvtoyYRo7zT8WKis/egecVYKs60INFI2+tytk5AOmmQ1rj/5H+bqQst05VOP
 V0EcHuv0F680g7jpFD43pHatGXVDFL+Fj0eBICB5iYVylFDFau+Zgus1+Q0tMuCmmea6fGLTVEe
 s4p8SaDHdZuJJwg6+ijoOrjrKZkwdyO9VO2YXMEsGtCzqeNFfuGfLkyFQP9m1kT3ddwUQZ4n1sF
 mAtlwKfEFqee1hWqFzp7w+3qMHDjAC4la1uePxJMefJzRJC4rjzDGVINFeuQDiUi8u5hGZCYfpq rGWi02WnCeKfuFQ==
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
hardware block is deducible from the compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


