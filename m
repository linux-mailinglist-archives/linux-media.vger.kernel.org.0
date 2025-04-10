Return-Path: <linux-media+bounces-29962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EBDA849B9
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 18:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFA227B6263
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 16:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCFC28C5CE;
	Thu, 10 Apr 2025 16:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SkidFJrO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE841EFF9F
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 16:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302616; cv=none; b=rDTmbS1Qrw7L0eGPVMqpZTQt1DycYkA8mrA15vdzPK0kEtFkI35E+kdqWGlxmrdnUVySPhiNlxHFhW0eQxcfyGqToz05B+A7vj4PHe3Hmw/QvzhX9/iJhb0F4obrS5iTezxPDfXuQpIGrGdEIJJ9CF9RioHZK+bRF4OLYb9V+aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302616; c=relaxed/simple;
	bh=9hnSK/z/at7Q/XPaFDHxC32ZrhxYmQz5KS3r7i8xong=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lSXS3HDGdU0M64zFL4667uQXuKDyU5IA5Ezm7weW+AbCxGOxzmQIA7Yam4G5/hql2AkR3G+BkgaVCpJStCTtgy1Ph7O9/gNhrv8F+a4qpRl5XGLUfWlwWM+S6ts2mBMi4VvceMvwYR1bLl0ZPMJbWPRbWi3PnUiKziw34h5fJdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SkidFJrO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so5941375e9.2
        for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 09:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302612; x=1744907412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUkiFVraV2V5GiQVRCmgiYRRVnT/EoG7D4jFzUZHq4g=;
        b=SkidFJrOGFs0LDSdMC7Mvnlt7Vi5/0XEdnJ/yYLMYaxDLUgD4FAbkzY70aqzo6WLZw
         MABvUTb/2a55YQBh9fL6/PNwwRXSckY3SG8vg5sdNcp4uW0omaWUVXbYat70thgFPpIn
         cNeRwZdxBtxOrWKJfIpC33QvB4Jb/0ucz39tQvaes8/AuFrxdFeib2evBQC6rp5WIdCj
         eVbjI8BjroGPjXihmNe1RQ9Gp5OOo88mQjWMo323m55BV5FutE3MnkQeUvJhSZYpXKr8
         6wtSYMpmChU9ld2fQ7FI4XB1m99jxlmkvWgQSi7D80wrLhJZIfWWh8NOMZOOkyTplbGE
         R18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302612; x=1744907412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUkiFVraV2V5GiQVRCmgiYRRVnT/EoG7D4jFzUZHq4g=;
        b=R4d5o1CfH+sohF/GqCeOTQtGyRQqY3Kpfn8eirKiIHulPgsZkVEmnMZ8KTWGLahDwe
         O0W1vANym1P3rRPCVp/bC4kxlkw+zrjn2jHMmxeSdLnJ9grZSoIfIpViTX3WXDVnrEjZ
         qOagEQSIhvTP637wZtzpw8PLyGdTwMVbHLfdg+iuCIvqVFqjxlAMNfXFuCETv/z7MQmb
         FAER6Lca6mNWuVtSVJDyr6vB6yj2rAX/uyFDWT3MA6Fxe+tYjsz5jBxKmRsPEnA/u2Nz
         tIKKM66PfKcpPw7/k3Z4spdmkYaTaEbnoyg4e+pbDK7gvKqShF8hcqP0w2GK3nc6A7Do
         pweA==
X-Forwarded-Encrypted: i=1; AJvYcCWhvqUVfvLOpLT/sBMHCpU50XjFLGrqfLEvpfN6dnoHRX7Urybl82r6N+gqZiqideogj9EsbCem5QdhqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0nzOapDksNEWh7KyzQOZzGQMk8wizmeIC/y+wbNece2Rsrxut
	btH313Hd++jmhHUswS/epW4CgzSlZIsnFsF4Kb2Go5qhs1miFdNuYqNsa2GT1P8=
X-Gm-Gg: ASbGnctWmLrfZw7ldDozI37+bm/MK4GbPclDv8BaYlORfV8FA9usXBo1GAjF1BH1Bn7
	ERJVN0xArKaDZa35bV4JiWWxpBZmaz+/kq2SO1b4EWZ5+eOt6rWcHTv3OfDz5KZn26o7ZgipuQO
	MeJQ1aOiJKtVadYvwppiI+Nz6wHPxRzgf8cTS63NwTahbLABb1YFB51NUymI58S42zu3VQdytse
	PkBbGE21iTjizGzksDauyQUPT51hd/DzQBaOvYCNet2iOwWL7KBPv2hEs4F1+JTjed11Cj/VPio
	5ipQD6ggK58UVMu/yzn/3GzYszYPbAEz3WkVX2kZ0RPn3Mq2mq2QTTwuCQAwkw==
X-Google-Smtp-Source: AGHT+IFxjF2gHLiKfg5QgRRMqEL6azQIXI7YefMvmf03mZOpilzBQB8kYkVimEZ402PU9nPvEnk/nQ==
X-Received: by 2002:a5d:598b:0:b0:39c:1258:2dc9 with SMTP id ffacd0b85a97d-39d8f4fabf8mr2980744f8f.58.1744302611961;
        Thu, 10 Apr 2025 09:30:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8936129dsm5350663f8f.18.2025.04.10.09.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:30:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 10 Apr 2025 18:30:03 +0200
Subject: [PATCH RFC v5 4/8] media: platform: qcom/iris: add
 power_off_controller to vpu_ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-topic-sm8x50-upstream-iris-catalog-v5-4-44a431574c25@linaro.org>
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
In-Reply-To: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3981;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9hnSK/z/at7Q/XPaFDHxC32ZrhxYmQz5KS3r7i8xong=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn9/IO7fY/TiYLmUCrygDjWc4Pe2AD87n+YDOZ7KCT
 UwU8KPqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/fyDgAKCRB33NvayMhJ0dLUD/
 9A1TPXjDCxWywg98LnlS1ERRlAGO3nuT4o1cQJHKoOihdlkkS4nzqip4yr92WqARIt+mEH5gCYxgWw
 AZF7rbYuyDnZICt5fuMWHZoEm2Qcs7KXFhG/peS+dzH5qH8ByrEOnP5omnmQg6FAcKFek6GHZG/tO8
 lh+y8PXEnQhwlXejW0CSS1Wz6K9HOgRwHvkrN8t/PGez7T8YmdklBboXJOxz50pOaGbpuFEb/PPnln
 xCXmpwXGpsSIgE0GPdn2TQcq2knEwfXiqOXSmwwV6wvk9IHX92Vt1E9ZPepKHNQ0qNaURIhKYxmjE8
 a/xakMKb/O/7OzMcT8UEfsk1APHpK+XIv+RmW77lM8DlJmdDAOhFz91FmBFBCU+IIbO/WuS4BuXDt6
 awHGcNj5I7ulxY5IFIn9nkIYK019/DujZO6JHFXrnvf6lu88IVYoAt4wM8rvXubxb2ooaykqBXBLv5
 LtSk+FBQF/eP2XKa0eGghzp9D6XlGE0it2Mpo+VsKozE7cX6LRZYT5xY3otoj6JW+iHMAqLw6eIqki
 IluZJzB8Rf4sx2YxFhWpNX0IEO66/TM7Kv7i+HJVBf219pLKbcwxEYiyQ5gWkZNjTzKAkXRljsD7DZ
 SxkHLI88FydvWuqh0qeFIRhf1q0xoc8jyNKttNQgg3zoXFCemXp+2cZJ/MSQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to support the SM8650 iris33 hardware, we need to provide a
specific constoller power off sequences via the vpu_ops callbacks.

Add the callback, and use the current helper for currently supported
platforms.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 8f502aed43ce2fa6a272a2ce14ff1ca54d3e63a2..7cf1bfc352d34b897451061b5c14fbe90276433d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -34,5 +34,6 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
 
 const struct vpu_ops iris_vpu2_ops = {
 	.power_off_hw = iris_vpu_power_off_hw,
+	.power_off_controller = iris_vpu_power_off_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3.c
index b484638e6105a69319232f667ee7ae95e3853698..13dab61427b8bd0491b69a9bc5f5144d27d17362 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3.c
@@ -118,5 +118,6 @@ static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_siz
 
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
+	.power_off_controller = iris_vpu_power_off_controller,
 	.calc_freq = iris_vpu3_calculate_frequency,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index fe9896d66848cdcd8c67bd45bbf3b6ce4a01ab10..268e45acaa7c0e3fe237123c62f0133d9dface14 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -211,7 +211,7 @@ int iris_vpu_prepare_pc(struct iris_core *core)
 	return -EAGAIN;
 }
 
-static int iris_vpu_power_off_controller(struct iris_core *core)
+int iris_vpu_power_off_controller(struct iris_core *core)
 {
 	u32 val = 0;
 	int ret;
@@ -264,7 +264,7 @@ void iris_vpu_power_off(struct iris_core *core)
 {
 	dev_pm_opp_set_rate(core->dev, 0);
 	core->iris_platform_data->vpu_ops->power_off_hw(core);
-	iris_vpu_power_off_controller(core);
+	core->iris_platform_data->vpu_ops->power_off_controller(core);
 	iris_unset_icc_bw(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 63fa1fa5a4989e48aebdb6c7619c140000c0b44c..f8965661c602f990d5a7057565f79df4112d097e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
+	int (*power_off_controller)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 };
 
@@ -22,6 +23,7 @@ void iris_vpu_clear_interrupt(struct iris_core *core);
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
 int iris_vpu_prepare_pc(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
+int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);
 void iris_vpu_power_off(struct iris_core *core);
 

-- 
2.34.1


