Return-Path: <linux-media+bounces-36593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AB5AF59FD
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 15:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A90B7BF8D4
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD18F2857C7;
	Wed,  2 Jul 2025 13:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iaNmmlFL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6298727E1DC
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 13:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463755; cv=none; b=iyilcByc67MUHR/wjZPRoy5Hr1n7m+PJycOl610sGqROwXVnQMYCvod8fVHIR0f7ybWK66WKc7eaUd9vK3jUaAF7ApF8bXeAJmiF/Ziv7eFkW0CRsJlBRlZEMqpU6BVCjfy4eTslwIRImWBysZyMeRiRwe7I/cvj+TfkS5JkObk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463755; c=relaxed/simple;
	bh=HynuDTxmOu2ewRdSrqrDudGKu95lIFkIcCV6e+uJxOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3pRriicM+yB+pKch6GY0BicQgiMWeQscmeL/27BS914JgW5NH8MHqMYkZFlTkpy7kKpTzz74/Fc8gZVhXI6SI/quD74kdiI2fAnKhJX822q8P7Tp9lnXCt/0avoevgK6U/QmoCHmdVFfK+eaRenPobjNmwmEUBJmfSMSPpmzvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iaNmmlFL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45362642f3bso9141145e9.2
        for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751463752; x=1752068552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DQrF8Tet5NgeUi0faj8isle/+o+jIcZn4CPSUqfPZ5E=;
        b=iaNmmlFLUC5OU20agq11qIkoSGPxsDBa8pK0OjqUhvfDrAqzeseLFsyDsx7FmXFlqH
         GdozkVF5Ps3jx0E9B9Sp1xVvRCnPx4KPc3HutkeDU6Xc2nyBk1Crw7nVh1qGyVP3YgJl
         ivPE/0ItlseROgmZSy/SNxM2MFevaz8++XooxxXQ88FhMlls1zl+qbwtmyyTPRvq2mRE
         c3MYnYrv2xIibUgHVpqucbbkrPU3rXeT8NIjCnOcKqLBWA3HOcHXxGqT3RSaJ6eptE1e
         xfZ4vkz3CtX3ZLZL5QHGNKCLFMBXQ9iiPk52e2wkJBkmqEL0Cl2kRqGjUpvB3xAEX6Dp
         y9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751463752; x=1752068552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQrF8Tet5NgeUi0faj8isle/+o+jIcZn4CPSUqfPZ5E=;
        b=p7NTb+65l+a0DrpJQCWNujFIBoowY/ZkBSQ79VtO5opaW3fZB/ThuDkMkEf7+bqbSm
         dqvhaa+JYVwGOEl4RagtOSWZgfcXMZhOC8awnDPcpstVvxl/Ecbuur6ryiQxs9AYbTFh
         Gl+L20MoNzyJs01d6wkrN9lKfaz9wigojRf3KrjzqipM410TJVAx7vPtpl+20ItkCc4e
         G+oZtfmDPKDT0Nk7S9dxirWzcNMObYygOIpSV3/yuAOi1kVaYrrPrEQLC/nhBm8fICZc
         Q+qF7bVfFBVLACzGMrfWCOdu8B/lqEE8kDl4QYRVVn4afALHuq4eKPrGkKAggVEVrQH0
         sHZg==
X-Forwarded-Encrypted: i=1; AJvYcCU5lkXYLk5kFFP/cL+PKCspKCAAS73CnpAsYmqXNsb+XAwYma7yVqZv7p2tLY4Yx9ZWgbFMagY45GcXTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuI3AvKHrk16UeCfhzg4gsXgW7R8BTG+UOZaTDCsh4dy6g6rST
	5i7bEeX9YPhzwCDPq4U9ase1b1S76lCkLZnh1X328Q7yFvgUUvej5lys4I4GfHwJL0A=
X-Gm-Gg: ASbGncsKGvJMffwSkqqoqPOC+nrlE3bnnnd1yaVshLukZPmDdiIiQLph4UpP6u2nNwW
	JLTEcU7GYU0jDOdvZScq3yK2JiMkVHdpbS3nNC0UXe1rDndqCZQLQfhbye7oxK9AtiZ8e1z/ryx
	TpnfeqJz+x2rbI7kzgqkeeF8W6+SL1nbs/hYFH00TvVUMTwJn0Gog/74levG4g3Qit1GuDt+Vgx
	UfMddpAjosJxbRiHUANi7gEXJLj4kryu1l7O2cP36ygb8dWHUCfwu21TQ0mixVPQsUMJYsStvuy
	K6nXYYp/deapslL+kRjfdj/SUo/12k4iX6MTbbqOmAIj5yJMR6mxGMTKIq/ywpZ57BOkoSWL1gU
	=
X-Google-Smtp-Source: AGHT+IHXJVYG7CGJmIlVVF+7xhnyzo6/jgx9msjPE65f/XwuKhcb83fUFenpGNeqel9qtSLRlO7a1Q==
X-Received: by 2002:a05:600c:46d1:b0:439:88bb:d00b with SMTP id 5b1f17b1804b1-454a3706e3amr11800745e9.5.1751463751635;
        Wed, 02 Jul 2025 06:42:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453883d81besm213483145e9.38.2025.07.02.06.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:42:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: iris: Be explicit in naming of VPU2 power off handlers
Date: Wed,  2 Jul 2025 15:42:28 +0200
Message-ID: <20250702134227.211104-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4835; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=HynuDTxmOu2ewRdSrqrDudGKu95lIFkIcCV6e+uJxOc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoZTdDDFdqzRjoEwS2qyMfMPJpXavpBI9k9iB4m
 IUWqkTolfCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaGU3QwAKCRDBN2bmhouD
 16vYEACXxoAS+JyVn6Sd2ITk/USxrgfO9EohNmNqZSEKZ+fzXEHuaADmhVULaWAYtMph1L3bDRq
 /uJQtrcS26iFIdxfdaIqjXbX20OjZH86SXwxOQvr+fLxbgaSHuI6/EpM59g/9HIoUK6q9UkKpY1
 pNndA9RSPIO+5PAYtHzB0hKGi5JdRqIGNs446OvGPfpGb0vmtuO2xd195ZbwoBblohxq3flg20f
 uKnTFZk8sT963SWBxZjYqEjtsjBu1AuqEi0JvnCeHqmdlz1juIH+tGon2g44lPPMLdgyEzAwM1K
 e7RpAnrRrCI7MvLRcj7LsQ7j3aj56UnlH7F0fVRfDDp4Dodb8RObuN2RQmvA/8jF4ZJUkEfwygL
 PR4/LnDxH31Uezo+F/ND/1bOP5lDIkGkcrgARy8eyA7gcjveb4NOfOWpsGk1/6XCSkHb4FxOAtx
 pMFBbjWg+4xIKg+2M7b1oPi6qX6wJqkxa12joibEotRpVDWFpPSgPMOjSdDIZdnXc5XnLYDOnRP
 PaXq7OVHaGkXi2WXzNZ95MHusB3LyORYjaHZAYfg0QRHhtUygWxPzk+q8sELZNB+PY4lRV6ZRfz
 o6aiTflz+4J/gE/M97RFi2Hj5TaRNShn1jYsYDoUZqUq8D9JwhzxlNgmJXtcKCsdQOYPPfP1KNZ cpwYxvWlCSiNZiw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Driver implements different callbacks for power off hardware
(.power_off_hw) and power off controller (.power_off_controller):

 - iris_vpu_power_off_hw + iris_vpu_power_off_controller,
 - iris_vpu3_power_off_hardware,
 - iris_vpu33_power_off_hardware + iris_vpu33_power_off_controller,

The first group (iris_vpu_power_off_hw() and
iris_vpu_power_off_controller()) is used on older VPU2 designs but also
called from newer ones: iris_vpu3_power_off_hardware() calls
iris_vpu_power_off_controller().

In the same time there is wrapper iris_vpu_power_off() which calls
respective callbacks (the VPU2, VPU3 etc).

Let's make it more obvious which function is a generic wrapper over
specific VPU/platform callbacks (iris_vpu_power_off()) and which one is
the callback by adding "2" to callbacks used on VPU2.  No functional
changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 6 +++---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 7cf1bfc352d3..2570e65816f6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -33,7 +33,7 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
 }
 
 const struct vpu_ops iris_vpu2_ops = {
-	.power_off_hw = iris_vpu_power_off_hw,
-	.power_off_controller = iris_vpu_power_off_controller,
+	.power_off_hw = iris_vpu2_power_off_hw,
+	.power_off_controller = iris_vpu2_power_off_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 9b7c9a1495ee..a2c8a1650153 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -104,7 +104,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
 
 disable_power:
-	iris_vpu_power_off_hw(core);
+	iris_vpu2_power_off_hw(core);
 }
 
 static void iris_vpu33_power_off_hardware(struct iris_core *core)
@@ -142,7 +142,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
 	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
 
 disable_power:
-	iris_vpu_power_off_hw(core);
+	iris_vpu2_power_off_hw(core);
 }
 
 static int iris_vpu33_power_off_controller(struct iris_core *core)
@@ -264,7 +264,7 @@ static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_si
 
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
-	.power_off_controller = iris_vpu_power_off_controller,
+	.power_off_controller = iris_vpu2_power_off_controller,
 	.calc_freq = iris_vpu3x_calculate_frequency,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 42a7c53ce48e..22f190e0c7c6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -211,7 +211,7 @@ int iris_vpu_prepare_pc(struct iris_core *core)
 	return -EAGAIN;
 }
 
-int iris_vpu_power_off_controller(struct iris_core *core)
+int iris_vpu2_power_off_controller(struct iris_core *core)
 {
 	u32 val = 0;
 	int ret;
@@ -253,7 +253,7 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 	return 0;
 }
 
-void iris_vpu_power_off_hw(struct iris_core *core)
+void iris_vpu2_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 93b7fa27be3b..8f63f243dd0d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -24,8 +24,8 @@ void iris_vpu_clear_interrupt(struct iris_core *core);
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
 int iris_vpu_prepare_pc(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
-int iris_vpu_power_off_controller(struct iris_core *core);
-void iris_vpu_power_off_hw(struct iris_core *core);
+int iris_vpu2_power_off_controller(struct iris_core *core);
+void iris_vpu2_power_off_hw(struct iris_core *core);
 void iris_vpu_power_off(struct iris_core *core);
 
 #endif
-- 
2.43.0


