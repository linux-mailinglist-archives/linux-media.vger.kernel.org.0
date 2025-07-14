Return-Path: <linux-media+bounces-37627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5489B04069
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AE273B63F2
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7403254845;
	Mon, 14 Jul 2025 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ULpqETA3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE70A24EF88
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 13:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500493; cv=none; b=gZlgNBTO/NvkdsmlDOYf+J/WJL+vPGeNCPymvfgKIe6SHt9OnNRY6LJcWbMGcyTX6CJm5Z03+dymE3Kl4JDYsdeXkf63sFQqzO/mNfxvx5kqGaET2Nj+uPSqm/SEsD99EhFHaQHjdzyoUtHFoWPWDzNKsCMO3VQUz8gJU8WFXo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500493; c=relaxed/simple;
	bh=D+caATHxNjJcUa+12DDZ6SBVbOWstyQMR56LoQYn7/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M5ns/Xm6VmK3tQyD4vvFt0WBsgq+/BUpOLXURwIfitkuQoiWyUglk5ArcP6zhio81ADvgwfpHdPqlHwPnngc8O1801rvsOboZyPXcGqpK+NAyMjjrs4y1NOCABWHvpVjWHv/480QHDACJiTgg0QQFx9PHjjfExqlYxZLj4rF5rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ULpqETA3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a52878d37aso501880f8f.2
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752500489; x=1753105289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvX5sGYsStJ99mq9tR3+dv+q6L2ZISBDS5U+4tgjRDY=;
        b=ULpqETA3JFOrjiHGbrm4FRszs2XDAtQdn7ZubcVIZx0K0IMxQHS55/p5YNrxaJtenC
         PD4wfoBSEvuBAqMDluqTMegB+ZKCtJLEGv+N4jtwiiZvG9JJE2ZkGUXTURXYl/myfUFr
         Doy6qR8cHfWqESnLjYWq8hvn0bf1djEs/wvFIUDsJy8jO4OgnGkSO5Ka1LS8J8E0ibVU
         A6moJZ5FsPxtxba3DP39eZICeOe3D5YdQUOvKJasUxDOvheQCvzKQzQIPcg28c75BgWA
         uTGPH2gEuaKk/Ge74D6OL67oBZv0A3XLh2TKRNNqImsiUjFcqfssf23jZtHZBTlE6Vv1
         7XHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752500489; x=1753105289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvX5sGYsStJ99mq9tR3+dv+q6L2ZISBDS5U+4tgjRDY=;
        b=UV86WA9eb5XyJEsiOjGYGbuhf3QmEMutNGP2afrlaGiO0o/Vgd1j1tWzEtQB5qVNjS
         R3m7H2kRzsGBlFqv8XGDD2vTKr80fVWWuZPPC1sQ7sBcCscwodzyVR6JJpE0mEIJP7o/
         MUlnJ+iRT8xATy7/3SmwwPY7yb+KKSaZJcuVhs0HUK7EAl9otqOn5z3wndm1xRGT1hWR
         22cbP4lJA/Qn/uCQzd6uvUDGwJff3KtpyuvXHR61NV9OFkG/GyaqtffJsrxvR014oRz+
         EL8yZwtbmV4FOS9fLPtO5YOB5mT0Ok6tfJuyJABAGNTCuvLf52UkA3khWfSLclk2ksP6
         dxFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8LMr6u0/XFAUbhiWkQzdnHrKm5C7XCzAaZnGR/b3538t4WqLsZmNQGz2YMhi9BErpLCy2zSAAkGn6fA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE4wfteIdSqNXu9fYOVyKsEtwxEsFodo3QyiHCL7DwxqQjGenW
	/uvGHEO61/yuD8xdTv2p7kbVPGtlMJ6JSiWGFSuDLuxAvMHVh22TEPQSvA6Bu8g1WtU=
X-Gm-Gg: ASbGncvrYYAzlo6eUs6DdDFxQMw4nJyVtHcHravRquIXsuxKo0DDtD3cK9fCFmStePK
	/i7ypUQCg0fHiUXjHE9Gx6J4G3TWGEp9LZukPzdDvP8nGizqs/DLE2n07ENyewn5UnS7p7VWk19
	OnwifUjPmfyTT8Qfnk/BPprUyD8X/KcPvjM7hodY5nih6bsY7eBUv0Z8yIqMbDhUhH0eFWqEpDO
	3xvoabYHbPgH/oe7pblvS3THcNcKS+HZTeiPzQSY9G6os+sMHtKtB3YSoo9yvpIx1fiWN6Xwvd1
	otNGEdnbbzBnmkcSrqmaDliUFSnp1GzlIvtrPABEU1/LJvZxs3DzkFYknb1NXFnvg2mCOYBon63
	/YhKCMW350iNvKarMVn6KStGmYJojRwa32vK0
X-Google-Smtp-Source: AGHT+IG5JDLxGs3FpRf3HHwsbPTFhUcTCqNBn2LwOBaTUG80TxVUkYfL+vh/J96rPU06tkWbOX5kcg==
X-Received: by 2002:a05:6000:24c6:b0:3a4:f744:e019 with SMTP id ffacd0b85a97d-3b5f19000a5mr3630396f8f.16.1752500489048;
        Mon, 14 Jul 2025 06:41:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b176f87sm31371375e9.35.2025.07.14.06.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:41:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 14 Jul 2025 15:41:17 +0200
Subject: [PATCH 2/3] media: iris: Split power on per variants
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-sm8750-iris-v1-2-3006293a5bc7@linaro.org>
References: <20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org>
In-Reply-To: <20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4799;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=D+caATHxNjJcUa+12DDZ6SBVbOWstyQMR56LoQYn7/I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBodQkDqcOz40GQwIgJHl/yf6q4gnbJ5utEXxbX8
 I8uNKbyqjSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHUJAwAKCRDBN2bmhouD
 170MD/9bz/lYcDDzBlpE5wgMlIuFUNsDZV2kgkLlRTS/QE4T78RjD1kS88K2cKr1CL7MQ9PC8ux
 mMK6WwVyA7wXLL097Us2tjRDh3vDfeAC57fwAgFQZLn+NzHwbqarm8R2aR6VYvK91IofmYnFfWb
 FuukM/lB56tQDiS6E+L4mE+VouAl3gApvq18WRo01hTI7v6/iuhAPUVftEFdQfqePBus/HgKXhd
 qOmhgfX6JIGeDHut6gHwzmAEQWkJ3rr6+ix9qQ728qnY/XFRVEWylq5G0jewgj+ujRMkkr8PeiF
 kf/Gj7TaSEpikHg837V499GXcEGrAd7pTryqFs8Bh/dU78pQG2VD5zVHuGoO8pHcxTsNqJmdjsG
 Dg1ZJHvK9gXR8sn3IHfm8U/u0nPkHhkDsePEI3jRMroUPdTpsZWn7gWeHgTDjjz6JT9AlclwSyQ
 WZk+pCy2r63aetkT4dnHn1nKx9lZrKTB6TLAKh5bmwuFrQpdnVl+wddvO/R6NpvE15FJON/7Bx4
 QU6e37rtK230O3Kq9WLo4Xdf79SbyZFDe19k71ejpPtGNr3tcQqm74k0rjx4v1f96t5DCQoMfEm
 WCs694vwKHWZZImFnnESiBb5TrgmgovCmAzN6gZCrakIR12FL2HNvRQ9NbVRToUReg/uSLwHfCH
 JyFuFivRr6Kpa7Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Current devices use same power up sequence, but starting with Qualcomm
SM8750 (VPU v3.5) the sequence will grow quite a bit, so allow
customizing it.  No functional change so far for existing devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 2 ++
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 8 ++++----
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 4 ++++
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 7cf1bfc352d34b897451061b5c14fbe90276433d..de7d142316d2dc9ab0c4ad9cc8161c87ac949b4c 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -34,6 +34,8 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
 
 const struct vpu_ops iris_vpu2_ops = {
 	.power_off_hw = iris_vpu_power_off_hw,
+	.power_on_hw = iris_vpu_power_on_hw,
 	.power_off_controller = iris_vpu_power_off_controller,
+	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 9b7c9a1495ee2f51c60b1142b2ed4680ff798f0a..c235112057aa7b7eab1995737541b7a8276ff18b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -264,12 +264,16 @@ static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_si
 
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
+	.power_on_hw = iris_vpu_power_on_hw,
 	.power_off_controller = iris_vpu_power_off_controller,
+	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_calculate_frequency,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
 	.power_off_hw = iris_vpu33_power_off_hardware,
+	.power_on_hw = iris_vpu_power_on_hw,
 	.power_off_controller = iris_vpu33_power_off_controller,
+	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_calculate_frequency,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 42a7c53ce48eb56a4210c7e25c707a1b0881a8ce..6c51002f72ab3d9e16d5a2a50ac712fac91ae25c 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -271,7 +271,7 @@ void iris_vpu_power_off(struct iris_core *core)
 		disable_irq_nosync(core->irq);
 }
 
-static int iris_vpu_power_on_controller(struct iris_core *core)
+int iris_vpu_power_on_controller(struct iris_core *core)
 {
 	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
 	int ret;
@@ -302,7 +302,7 @@ static int iris_vpu_power_on_controller(struct iris_core *core)
 	return ret;
 }
 
-static int iris_vpu_power_on_hw(struct iris_core *core)
+int iris_vpu_power_on_hw(struct iris_core *core)
 {
 	int ret;
 
@@ -337,11 +337,11 @@ int iris_vpu_power_on(struct iris_core *core)
 	if (ret)
 		goto err;
 
-	ret = iris_vpu_power_on_controller(core);
+	ret = core->iris_platform_data->vpu_ops->power_on_controller(core);
 	if (ret)
 		goto err_unvote_icc;
 
-	ret = iris_vpu_power_on_hw(core);
+	ret = core->iris_platform_data->vpu_ops->power_on_hw(core);
 	if (ret)
 		goto err_power_off_ctrl;
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 93b7fa27be3bfa1cf6a3e83cc192cdb89d63575f..d95b305ca5a89ba8f08aefb6e6acd9ea4a721a8b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -14,7 +14,9 @@ extern const struct vpu_ops iris_vpu33_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
+	int (*power_on_hw)(struct iris_core *core);
 	int (*power_off_controller)(struct iris_core *core);
+	int (*power_on_controller)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 };
 
@@ -23,6 +25,8 @@ void iris_vpu_raise_interrupt(struct iris_core *core);
 void iris_vpu_clear_interrupt(struct iris_core *core);
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
 int iris_vpu_prepare_pc(struct iris_core *core);
+int iris_vpu_power_on_controller(struct iris_core *core);
+int iris_vpu_power_on_hw(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);

-- 
2.43.0


