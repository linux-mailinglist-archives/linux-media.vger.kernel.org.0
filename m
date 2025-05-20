Return-Path: <linux-media+bounces-32855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D28ABCEE7
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B5434A254C
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 06:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9BA1DB124;
	Tue, 20 May 2025 06:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wMvhR67+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9532D255F55
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 06:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747721003; cv=none; b=FRo00w52lFRBJHCjy+3qxDj56XGZQIA3mL+AkhGMjyIpAp1B44gh1LakLrBi2CNVdm9J6NKeKUPwBWFx2gT+Gnl/+jVenQgCtpHwGglR7oqtXx1aAsu+PfwtoTZZGMVNTCv3z3edeDGrZ0DMiLE31ABIgwop17VFSgyBKfRgRCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747721003; c=relaxed/simple;
	bh=kzHaamZZFjKOYQvT00HR9118hSlIU006QwWA7TkYXTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ljDKbFKy2J9rSjErnWBe76fPOFmlQZjTMG/Ba2LODwM2c883NRpudF+v6vKjqmJrdsx9gf+jUUHrIvXfJA/UyF+pwxI6dXiM+Ugq7ZJBNXcVVBUelDCw+6mff3tM+tDFENXHey52H0ZjJR6gz+ncQPpaRLy0yRPoFEf9LVvJhHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wMvhR67+; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f6f86580ecso1099087a12.1
        for <linux-media@vger.kernel.org>; Mon, 19 May 2025 23:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747721000; x=1748325800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h+3L+5Wk0I29VJqzwPhcySS+DGDSqL1wf3tzyzbHFwE=;
        b=wMvhR67+isk0Ux6wa9g8SDl5z0nxn/EkdQUTSVJbTe1RYgOjsNgA7OeVYGdn/oUcpG
         c4eq+WHFi5y8lpk7S/t14gAXr9SVkdm2cwFts1lhfTZWKA0gEH0epUhfvZ5q0lKOWmIp
         CKoItivgqG3wwJl6wjEUmGv+WNgQK2nulc57eDCZr2I2enpNkjNUOOJ9zSmKoL8iLwJy
         PNptv/vJXS6UIUMESSl2WcXULBTzikrvGrnuKvRFO1tctpnbAArYyJWl6RNQMavAultW
         Z/zp6IwRut04IQnWdpCafMFvpI7xKLshL9Bx5NfcUR/cBBibPhVK2hHYRgaxm04bgW22
         4fXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747721000; x=1748325800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+3L+5Wk0I29VJqzwPhcySS+DGDSqL1wf3tzyzbHFwE=;
        b=iC2fgNYxAUeCSVx+JpR1u09fNQfwQefY+1FAncbVU5mei9R13sihB4j81QKfzVJpxE
         bXzvw3wsBSkTBuAKtlys/9hO1FAynR5goEgKhsL1MAvvSd+7VeIjpOUbpzSEMN4G4/fX
         0aKyFZP62Vxr4yufEUWXX6ywZ9rZtpzpkFVKm5VhI1w9vpZlygBxNxcKig4tvPgT7Cu7
         rb3eOCZ9RFEijJRm2G5Kx8HKNXvfhsWQxpU+Nju3jTSPxi14lz8m7iuj7N9J8tAU40ZA
         U2FIIDEcSWB7kJueRx082I3mu2WKDmAbIq+U4yRjq4tLz4lvcYo1QF8Dp4ctqnTLJXBU
         8KWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZWP2xRgfbYCIxc6dcqCjwAw1yK1QnQiSIj/TYASArXu8IDTUTiobm33kPwJ1DbjmI3MJZi+2dPXo31w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUlLxEKHz+JSmZMaghehn9KEVBn0gL92J8tBezowrZ9+S+ANIw
	qHKodrJADSH4rJaPHRahcdWfx1hCZqmcpKYpjlZWPN9votqwTovuyi7Wy0iujc+IM5w=
X-Gm-Gg: ASbGnctHgsTfo6eTWdQlvbq5QVsv/bpo/yYwdO7jouo+q2RoF94WOaUbdcTkpc+b6Sp
	Ixs2xj48MC59HXb1+4FovwQIumqD8oQGCh1TfwUZPZ4HAWuhpoBblB1C5cULCjiaK74bp793PFg
	zUHAhY0iG4NGA5tEkyY8oq6n0zrxcN4CSyLciOKlJVKTMGrApRicAXyGlG3Vt1x/KRFMOsSgg8D
	7IOTbiDriNu2HYbuB+lyYB/jFD3ypx9cIFZeCBkjIYkoewStmYZZDura1Gq/XBSY9XQCMbnp0nJ
	+8WZakVKbwTfBdWkt3H5rLM2TIqW8Urk2joOggUEF53vzJz1o/RfkG4Tgcqe2g==
X-Google-Smtp-Source: AGHT+IFTQtDRhko0YqLPOd33vYaqapq33LlBdmjbtssnUwIAMa1VgmHJ3TaRN7JuOLNsHMIWUEATgA==
X-Received: by 2002:a05:6402:134b:b0:601:acee:fd7c with SMTP id 4fb4d7f45d1cf-601acef0123mr2625931a12.10.1747720999462;
        Mon, 19 May 2025 23:03:19 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac33a88sm6698710a12.51.2025.05.19.23.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:03:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] media: qcom: camss: vfe: Stop spamming logs with version
Date: Tue, 20 May 2025 08:03:11 +0200
Message-ID: <20250520060310.7543-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7752; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=kzHaamZZFjKOYQvT00HR9118hSlIU006QwWA7TkYXTE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoLBseIePo2FAZyDudhFWmnw+pWByEYl/L26o59
 FLopTYLESmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCwbHgAKCRDBN2bmhouD
 1/tnD/9k7aSGFPMl/PfpwSoAneaOE7E3061Om8hqrfT3lRkx8UA/wGi7qzgy1wRRgEGoGHJgA+/
 I+j1t/G2W9kJlIP0H9TqigzzU9bkkhj4YwrHZ0KtQT3QCFRMmhfJwGcy6Zq+Brdc1l5QazeIfG+
 eh//4cZlFHIHyHpWGlEIVoJ/pH5fYl7K+F0iZpMicFfY9apsveUe43U1cF3dn9qBwYjnnmclllE
 JOn1v7I+6BZdvTOp5kTOm6Hh0pM5T1HuUxLX1S1pyue1infu3eeoxXKgss6bUs0BOu9lEmegETB
 Ix9SZ005X4XJpLfQxsCv5n48ztKlavfIb6QnT/ebVkrYmTl4ec3OzZDxFKF+Ns5cHs+685Nles0
 bnGMEUgBGBhg9CUgRkF5eSCLFgH0b+y9nb0Twhl33k+LEiVSfnVCjAQ70lv0+ejIPq+mdlTdY8i
 joHnenKBlnXbYfXeNpWhzH13qVHRfKq/I+lELKBye4sPwy6dmXHHhqQsNM2dMVrTgRbVsGIKpTy
 MCB2R4nfWUryT1g0NwjWlLokaicqZaB0wRyQT2QrCLLiJyV81DvEMNnD1021m2igom7CfwqGIsT
 tD2Kns0g8+6Xb8uhWsk2oYHCmFEZHw906ZLwfInYtPYhhlmUINkusEY2Tr+wjZ0Xd12vtHauRoO SKsQvWst8GiOS8Q==
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
 .../media/platform/qcom/camss/camss-vfe-17x.c |  1 -
 .../media/platform/qcom/camss/camss-vfe-4-1.c |  1 -
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  1 -
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  1 -
 .../media/platform/qcom/camss/camss-vfe-480.c |  1 -
 .../media/platform/qcom/camss/camss-vfe-680.c |  1 -
 .../media/platform/qcom/camss/camss-vfe-780.c |  1 -
 drivers/media/platform/qcom/camss/camss-vfe.c | 22 -------------------
 drivers/media/platform/qcom/camss/camss-vfe.h |  8 -------
 9 files changed, 37 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index e5ee7e717b3b..e0d12c3f6015 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -577,7 +577,6 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 
 const struct vfe_hw_ops vfe_ops_170 = {
 	.global_reset = vfe_global_reset,
-	.hw_version = vfe_hw_version,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 901677293d97..7620ce42b49b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -993,7 +993,6 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 
 const struct vfe_hw_ops vfe_ops_4_1 = {
 	.global_reset = vfe_global_reset,
-	.hw_version = vfe_hw_version,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_4_1_pm_domain_off,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 76729607db02..b3b6ccb4748e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -1145,7 +1145,6 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 
 const struct vfe_hw_ops vfe_ops_4_7 = {
 	.global_reset = vfe_global_reset,
-	.hw_version = vfe_hw_version,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index b2f7d855d8dd..5a4b4f486aca 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -1135,7 +1135,6 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 
 const struct vfe_hw_ops vfe_ops_4_8 = {
 	.global_reset = vfe_global_reset,
-	.hw_version = vfe_hw_version,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 4feea590a47b..edd92308af62 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -278,7 +278,6 @@ static void vfe_buf_done_480(struct vfe_device *vfe, int port_id)
 const struct vfe_hw_ops vfe_ops_480 = {
 	.enable_irq = vfe_enable_irq,
 	.global_reset = vfe_global_reset,
-	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,
 	.isr_read = vfe_isr_read,
 	.reg_update = vfe_reg_update,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-680.c b/drivers/media/platform/qcom/camss/camss-vfe-680.c
index 99036e7c1e76..96a927acc6bb 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-680.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-680.c
@@ -227,7 +227,6 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
 
 const struct vfe_hw_ops vfe_ops_680 = {
 	.global_reset = vfe_global_reset,
-	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
 	.pm_domain_on = vfe_pm_domain_on,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index b9812d70f91b..e5023eb7ad60 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -142,7 +142,6 @@ static int vfe_halt(struct vfe_device *vfe)
 
 const struct vfe_hw_ops vfe_ops_780 = {
 	.global_reset = vfe_global_reset,
-	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
 	.pm_domain_on = vfe_pm_domain_on,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 4bca6c3abaff..1ae523219525 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -415,26 +415,6 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	return 0;
 }
 
-/*
- * vfe_hw_version - Process write master done interrupt
- * @vfe: VFE Device
- *
- * Return vfe hw version
- */
-u32 vfe_hw_version(struct vfe_device *vfe)
-{
-	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
-
-	u32 gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
-	u32 rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
-	u32 step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
-
-	dev_dbg(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
-		vfe->id, gen, rev, step);
-
-	return hw_version;
-}
-
 /*
  * vfe_buf_done - Process write master done interrupt
  * @vfe: VFE Device
@@ -1088,8 +1068,6 @@ int vfe_get(struct vfe_device *vfe)
 		vfe_reset_output_maps(vfe);
 
 		vfe_init_outputs(vfe);
-
-		vfe->res->hw_ops->hw_version(vfe);
 	} else {
 		ret = vfe_check_clock_rates(vfe);
 		if (ret < 0)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index a23f666be753..1553ca89bd86 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -101,7 +101,6 @@ struct vfe_device;
 struct vfe_hw_ops {
 	void (*enable_irq)(struct vfe_device *vfe);
 	void (*global_reset)(struct vfe_device *vfe);
-	u32 (*hw_version)(struct vfe_device *vfe);
 	irqreturn_t (*isr)(int irq, void *dev);
 	void (*isr_read)(struct vfe_device *vfe, u32 *value0, u32 *value1);
 	void (*pm_domain_off)(struct vfe_device *vfe);
@@ -259,13 +258,6 @@ void vfe_put(struct vfe_device *vfe);
  */
 bool vfe_is_lite(struct vfe_device *vfe);
 
-/*
- * vfe_hw_version - Process write master done interrupt
- * @vfe: VFE Device
- *
- * Return vfe hw version
- */
-u32 vfe_hw_version(struct vfe_device *vfe);
 /*
  * vfe_enable - Enable streaming on VFE line
  * @line: VFE line
-- 
2.45.2


