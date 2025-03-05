Return-Path: <linux-media+bounces-27659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD35A50B0D
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 20:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA4DA3AABE8
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 19:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD77C2580C8;
	Wed,  5 Mar 2025 19:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WT+mj5TC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FE62561DE
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 19:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201538; cv=none; b=kc0HURh7Ue4USK+pj3EK3MO1Wjh7cv3qmaYipXQS4prgFG9ToCxGw70hZyy7UbmxwScYaAVJYWt7Gc78j8gBIoZwlIUDvQ7nzWx1PF7oa33y2Tb9AaPwJi0aFpBWRjbt6CY+VbpXVFdv1w67wMj1Gud/rVfEwnsVK7BearT0rKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201538; c=relaxed/simple;
	bh=osmHa0U8qJR0SUJVlvd2QBRzZ2ejiQTx8cmQSpLjVkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gJYRdD6X+JqtI6FRjBBNQtvM9z/vF28cWezJsJhyjyKiiiJVt2Dc2YCs4bW/g99Z+a8fohdIIXfgDAeqh9Ex5Do82cC+ZtUknVmyO+u43VQt2YALAz/QdZe1hYtF4/rRTRMaxoZWS08gV2gWVcx1kCaDC72h4A+MtH0yoyjb9+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WT+mj5TC; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390eebcc371so3447142f8f.0
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 11:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741201532; x=1741806332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVIZMJHYSN6AUW9boWlMKVGyFBqi/YaM1bOAURkXiWA=;
        b=WT+mj5TCUEhA4/30KZgMBoFwyyyvKdWErrbTAtV8yhbGUGjQgbTXlVCZjQZQa3ciwy
         GCmTKBKpgHuuauQcSoiDIw5AB7EStzY77avLCztsepU47R8k9ab2qF9nluWQF98zVeYx
         +GA/PyDQbq4lLiUn7TIe8U2FRIEjlo0djFdsebo8Ivvu9u5KmmABOj9HZNOWYBir8jT+
         ehJ3OJCAvm9Wr/4iFPhoPKOllKI5cTgWHynFq0e4Av1gcwZ235N5beZ5YuvSLbXOuA5S
         qROKnr4pFFEsU1xZYn6YNgWSbjRtPpQzSW14V2yhLYlQDK0dEsQOIkt1hKwqUX24eUtW
         b2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201532; x=1741806332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVIZMJHYSN6AUW9boWlMKVGyFBqi/YaM1bOAURkXiWA=;
        b=HhoyYuOp05TiKzlOg0dnRNXW0BjMQNpVxkGI7gT0tpe3LdYmGKwjIEIZrVuJNbp5BM
         L3jLQSIudnY0MqW+hDmO022Va8tSIBvQ0Nv+AEW1oFx/6QygGMzmr3XshWQRBrN99eo6
         5dZ5rR47SfhQGSGU4xe+cnvDD7zkgFF/F2pBjcDamCXQyH6v4/AO/cP1J6Yln1PPqqGz
         x2DTE6AaivoMa5MeMnNQOGV4fdr4evJ//qBU76yll870t7AQojI8RKagIK6CXoJxQAHW
         WSXZFSAxl5tc+Ae5vK0y1pAE0Z2lELN4CeYGQKFTL8aO3EAVQ7hT8XTVIuziwBYsCBRe
         eHSw==
X-Gm-Message-State: AOJu0YwnUHxxRH8lM7+uJXzMccvKMW3y1joeJdpy5Kz7XcMk86eXnjxi
	XQgp+u61v8nOzfElA2pGA+imnJLSwzUEXQJ2O5wn8tMBjwtk4AfGuV3wcRuUUPo=
X-Gm-Gg: ASbGncsmHKqWo8c0Q9+bbzRNqIPVms2VgHNfMX5B/SCqEN2JIrJEDi1xn+KGwT5vTmz
	U2iz3xU77hjV2CU/9R+zabD6LntfwLlCPxxi5jbys3S0UecUUKLYiRnuFW/LgPtpwt8xuiCgESK
	kznPdsRVaSzyoCyfYKTKSblHT+6DMCHZ096VmvE5yO8mh3/nU6M1Hh8rWcJQW9eqoSCMcD8HmvJ
	+hCsTOYcK0tV46V7SBXi7lOPArcZUKWbY5BUJrEyPM75ofQzwIptBH+m+qm6ttwCiRsiJV20D8f
	EYez9T/SS8/byHMrX2OwUn9yF6egwt6bSzhP1DfuPF76L8ifGHwY4OHWH3KVZN3rkA==
X-Google-Smtp-Source: AGHT+IELPSrbgMh2UU+Qp8RbEVE/itcXNeZyQs0vgLia7pKY35/7EgOZThZMmHNZAm4T9RlwrmEvKg==
X-Received: by 2002:a5d:5850:0:b0:391:4f9:a039 with SMTP id ffacd0b85a97d-3911f7400aamr4618282f8f.16.1741201532253;
        Wed, 05 Mar 2025 11:05:32 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-391241bd151sm2045218f8f.21.2025.03.05.11.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:05:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Mar 2025 20:05:24 +0100
Subject: [PATCH v2 6/7] media: platform: qcom/iris: add support for vpu33
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-topic-sm8x50-iris-v10-v2-6-bd65a3fc099e@linaro.org>
References: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
In-Reply-To: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9418;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=osmHa0U8qJR0SUJVlvd2QBRzZ2ejiQTx8cmQSpLjVkA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnyKB1bagc7WUxbvm5SLikOidB1dxAnMzp85NZkbmU
 QGJ8XTGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8igdQAKCRB33NvayMhJ0Rz8D/
 0cK0cr/La3kg97nFK7TDuRkul6qCceATHRenZ4elhv/d3UIq3GrvFLgiP0WuiQ6URQcOAAU/zaC99o
 g490ZSJEypb8/CvmkkOe7LebD/sIPzQaHlKfRL55Y5b6R4zQXHL5XcGXycQzZVkeYBsDNXYvsB3ILI
 NfnwODlxs5BibdVClDDO9NIhR1i40PM2+MQRZ0OwQlhh8CqbWFVCuq4L8Ajqd0bRn3UeFhC0g214iV
 PyPbWQiDzhDSGtNxCSWvbUOJSdWYtrp9shzcyPRssTQruMxHH7JYi++QDD3OpS/KnszavdJZnPEpvW
 3jxL9AoGfPMUEEL4vEopjHZRCqtdEJ8sOryIcWVQRLDULhmLMoMENKqrqQDBuR83/xIg3ES40pHUoQ
 NUP1eX3pFA21iUtANWklglYGgNO5CtVU+BtkhydEI6hLn/YI6JXpnJ+kCdEtnFQnk+u8SQX+RRY/WA
 +z5txsxwsBK16CdrPS9RDyI7jaE82LX2GKvgHHtodMeLnl2zVAD7hDHVj4VPgQ8HfBpTps/rDluZAt
 lLSsXNCPA3DwBYb32sQEHyL/swHbLgAtiVLnNrmK4wcas1pPgmBiNAd0O8hj+rfK/PNd9Pj0WHc7g6
 YHvEL6Zpr1urfNTlmlpklYVp4iz8HH17lkB+ts2LzvZJYJU4qgU0qYFJw26g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The IRIS acceleration found in the SM8650 platforms uses the vpu33
hardware version, and requires a slighly different reset and power off
sequences in order to properly get out of runtime suspend.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 144 +++++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
 3 files changed, 137 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 95f362633c95b101ecfda6480c4c0b73416bd00c..109f663d031ab5f5ee8b58eb2a781eb27d2675aa 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -4,11 +4,13 @@
  */
 
 #include <linux/iopoll.h>
+#include <linux/reset.h>
 
 #include "iris_instance.h"
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
+#define AON_BASE_OFFS				0x000E0000
 #define AON_MVP_NOC_RESET			0x0001F000
 
 #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
@@ -25,7 +27,16 @@
 
 #define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
 
-static bool iris_vpu3_hw_power_collapsed(struct iris_core *core)
+#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
+#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
+
+#define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
+#define SW_RESET				BIT(0)
+#define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
+#define NOC_HALT				BIT(0)
+#define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
+
+static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
 {
 	u32 value, pwr_status;
 
@@ -35,13 +46,13 @@ static bool iris_vpu3_hw_power_collapsed(struct iris_core *core)
 	return pwr_status ? false : true;
 }
 
-static void iris_vpu3_power_off_hardware(struct iris_core *core)
+static int iris_vpu3x_power_off_hardware_begin(struct iris_core *core)
 {
 	u32 reg_val = 0, value, i;
 	int ret;
 
-	if (iris_vpu3_hw_power_collapsed(core))
-		goto disable_power;
+	if (iris_vpu3x_hw_power_collapsed(core))
+		return 1;
 
 	dev_err(core->dev, "video hw is power on\n");
 
@@ -53,9 +64,29 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
 					 reg_val, reg_val & 0x400000, 2000, 20000);
 		if (ret)
-			goto disable_power;
+			return ret;
 	}
 
+	return 0;
+}
+
+static void iris_vpu3x_power_off_hardware_end(struct iris_core *core)
+{
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
+	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+}
+
+static void iris_vpu3_power_off_hardware(struct iris_core *core)
+{
+	u32 reg_val = 0;
+	int ret;
+
+	ret = iris_vpu3x_power_off_hardware_begin(core);
+	if (ret)
+		goto disable_power;
+
 	writel(VIDEO_NOC_RESET_REQ, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
 
 	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
@@ -70,16 +101,100 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
 	if (ret)
 		goto disable_power;
 
-	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
-	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
-	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
-	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	iris_vpu3x_power_off_hardware_end(core);
+
+disable_power:
+	iris_vpu_power_off_hw(core);
+}
+
+static void iris_vpu33_power_off_hardware(struct iris_core *core)
+{
+	u32 reg_val = 0;
+	int ret;
+
+	ret = iris_vpu3x_power_off_hardware_begin(core);
+	if (ret)
+		goto disable_power;
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
+			reg_val, reg_val & BIT(0), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
+	writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	iris_vpu3x_power_off_hardware_end(core);
 
 disable_power:
 	iris_vpu_power_off_hw(core);
 }
 
-static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_size)
+static int iris_vpu33_power_off_controller(struct iris_core *core)
+{
+	u32 xo_rst_tbl_size = core->iris_platform_data->controller_rst_tbl_size;
+	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
+	u32 val = 0;
+	int ret;
+
+	iris_vpu_power_off_controller_begin(core);
+
+	ret = iris_vpu_power_off_controller_end(core);
+	if (ret)
+		goto disable_power;
+
+	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
+
+	/* Disable MVP NoC clock */
+	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
+	val |= NOC_HALT;
+	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
+
+	/* enable MVP NoC reset */
+	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
+	val |= SW_RESET;
+	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
+
+	/* poll AON spare register bit0 to become zero with 50ms timeout */
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_SPARE,
+				 val, (val & BIT(0)) == 0, 1000, 50000);
+	if (ret)
+		goto disable_power;
+
+	/* enable bit(1) to avoid cvp noc xo reset */
+	val = readl(core->reg_base + AON_WRAPPER_SPARE);
+	val |= BIT(1);
+	writel(val, core->reg_base + AON_WRAPPER_SPARE);
+
+	reset_control_bulk_assert(xo_rst_tbl_size, core->controller_resets);
+
+	/* De-assert MVP NoC reset */
+	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
+	val &= ~SW_RESET;
+	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
+
+	usleep_range(80, 100);
+
+	reset_control_bulk_deassert(xo_rst_tbl_size, core->controller_resets);
+
+	/* reset AON spare register */
+	writel(0, core->reg_base + AON_WRAPPER_SPARE);
+
+	/* Enable MVP NoC clock */
+	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
+	val &= ~NOC_HALT;
+	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
+
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+
+disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+
+	return 0;
+}
+
+static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_size)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
 	struct v4l2_format *inp_f = inst->fmt_src;
@@ -117,8 +232,13 @@ static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_siz
 }
 
 const struct vpu_ops iris_vpu3_ops = {
-	.reset_controller = iris_vpu_reset_controller,
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_off_controller = iris_vpu_power_off_controller,
-	.calc_freq = iris_vpu3_calculate_frequency,
+	.calc_freq = iris_vpu3x_calculate_frequency,
+};
+
+const struct vpu_ops iris_vpu33_ops = {
+	.power_off_hw = iris_vpu33_power_off_hardware,
+	.power_off_controller = iris_vpu33_power_off_controller,
+	.calc_freq = iris_vpu3x_calculate_frequency,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 3b3e1ca1e42183561ee78c89f50946fd0cc3c3ab..43c62e2ee593146b8e3448e8c7cab44ef1a15bf2 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -211,12 +211,12 @@ int iris_vpu_prepare_pc(struct iris_core *core)
 	return -EAGAIN;
 }
 
-static void iris_vpu_power_off_controller_begin(struct iris_core *core)
+void iris_vpu_power_off_controller_begin(struct iris_core *core)
 {
 	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
 }
 
-static int iris_vpu_power_off_controller_end(struct iris_core *core)
+int iris_vpu_power_off_controller_end(struct iris_core *core)
 {
 	u32 val = 0;
 	int ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f8965661c602f990d5a7057565f79df4112d097e..4af3cb0d44e00be498fc7ba648c68f1ef2cb0f20 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -10,6 +10,7 @@ struct iris_core;
 
 extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
+extern const struct vpu_ops iris_vpu33_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
@@ -23,6 +24,8 @@ void iris_vpu_clear_interrupt(struct iris_core *core);
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
 int iris_vpu_prepare_pc(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
+void iris_vpu_power_off_controller_begin(struct iris_core *core);
+int iris_vpu_power_off_controller_end(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);
 void iris_vpu_power_off(struct iris_core *core);

-- 
2.34.1


