Return-Path: <linux-media+bounces-29531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 165C6A7E472
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 17:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 151C64258F5
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A4A1FECBF;
	Mon,  7 Apr 2025 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GXG9qmOL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26A51FC7DA
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039465; cv=none; b=FDzmAlhPSbzOwsb3Ams6HVfn8I8jyH1JWDPPKndvjSpOkn8P2bDRzs6/CFW7AGiE4RUqJCOVvr/m/E+dLz26QPUCnhpBxsIhpG4BCOh6hkJe+sgFceiFed6e2Gp24GWnezQicmpUbcOK2nEFoq2s9e+vDX8bhLvRR2kxgPohPOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039465; c=relaxed/simple;
	bh=RVAZyY5IcoBzQEHI3gKR0pYiz9xjpwuFm7lVMrzCleI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U6CnMmidtUM+0+lj9IaFCtWxxTaBDYMBjM96TooOXqsA40IMLbhIYwT/baQwtgpsRNaYPr2UomWVqBM55BYY31VO+rFajzb0+1Da7LuHdYFn+M1ekvhJLcywqCguWapesZ+PbPyQai6D8kdTy3OOUjVnigMf8NJQ9awlhWZ/1f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GXG9qmOL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2442081f8f.3
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 08:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039462; x=1744644262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFhBT6qWaqm/ORgbP/ajYYPXDSwWN3XeFcOKJs5rzCY=;
        b=GXG9qmOLC3FyKdd1A6xKb9j5z6/RzEia7hqJqVJm74J7zK4VIyWWyU6WPpwtSubzU+
         Xnihhg/E8SxILR9j1LJRUfh4uyQLuk4Zj3YZZWntwljNW8M33zofr7pJtPjqfXrdsktO
         u6CCh1QrMOzryXYh+KzKL17qyZwV1yOoSnHtyEQzawYDrJojcxztApKHDbB7O8k893Nx
         wJib7FYBV0j7vhiiRQJgFf2iWR7jbuzf2ptqtbdxF8azebjUkUqW8lWAeJlRvyVgWQSW
         wCfM7WxVsxEwJcU/e2ap2BtGESsbhTIgbgY+BHtEslG7GXDFr+ICL0ob/NONZiM6QNu+
         DtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039462; x=1744644262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFhBT6qWaqm/ORgbP/ajYYPXDSwWN3XeFcOKJs5rzCY=;
        b=ulKS50sFGO6Cla3HgGLaX1kI88EIyL+1hM2khYqEGRbJogYpLvh+cuakFqxyh7ZKf/
         y73F/9ASky9zevl/m+c2QmrzAFAsm8WciIsyyLRStMZdhYP6MvFmgk2D+dCp0yE8+W95
         f76VnEE/weiXQGTh0BLk5TT07xbW9f5EbUVs9vhWN5UPY3zwtIwNNkTiluCUP46Y7jQN
         ER31XzzE9qKNK9hw+zE4GdmpTRlMNI16GyszTDY+C3aKokwYhpUhDGDUfHV6bwo39Uxc
         O8F83idVCqAUNLj54CutJzRddZpadUIFOvzAcs61BVNOVznAcs9GtNh/BeH9dxHdELuO
         +60w==
X-Gm-Message-State: AOJu0YznWdac+iMLFMIq7Op+dQTdV7EwuQqYlMNSsPteLoBEZCS7dqHj
	z+8qE1WqVKHSCbarxEuKjt7QxcuKPOxzChcAQkocYSwB3DZbQRidcoupOvOISBw=
X-Gm-Gg: ASbGncsF5QjHVdpcA6NesBm96tAvSCOkPXF3jnZjs6rqcgAvYpms9aR1cUbWVMc1bq4
	im6n5uMpAh3IBu/I237r0uuvuWuDmtnApvpDbWGOP5WuSvl3M8tKAroMk0MsYE69mm6LBhsguAQ
	BEIDdjORtGc3J/on+GRbO8Zwfs0Pr/+FjV+8C5nY7wKT7GigFCMSNoR/NkD5isAjlgJ8m05zcLU
	is0niwB/wn1uQpLwoqvJqBBDGLznltIvPDTGnqR6kNFY1Xc45SbvCg2dclGCuqNLP8lMFK4AgSe
	k9evKJDrwN3BG2CdTpDHPTYOci+NcXyi6lTyBGykQXHtZA+jVUpY0KaFn0LFSTI9Gg==
X-Google-Smtp-Source: AGHT+IGKeErGsgt3xcPUWlAhrhw6nxkHOMynywbipAzVLMif+RkANCAk8iXT2yS7MJ0iTjz0ErJlAw==
X-Received: by 2002:a05:6000:220b:b0:39c:2692:4259 with SMTP id ffacd0b85a97d-39cb35981fdmr11848571f8f.21.1744039461842;
        Mon, 07 Apr 2025 08:24:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b42besm12212001f8f.41.2025.04.07.08.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:24:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Apr 2025 17:24:14 +0200
Subject: [PATCH v3 2/5] media: platform: qcom/iris: add
 power_off_controller to vpu_ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-topic-sm8x50-iris-v10-v3-2-63569f6d04aa@linaro.org>
References: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
In-Reply-To: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3736;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RVAZyY5IcoBzQEHI3gKR0pYiz9xjpwuFm7lVMrzCleI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn8+4hQgEq2YcIQTOlrbncUouTzB4PzdefeSFsA/tC
 k+lqsHSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/PuIQAKCRB33NvayMhJ0e9yD/
 0SWf4xKtoipk/G7pbt95vkS/sum8uS2GA0eVAILuEVoEHlWkfvTUeAy9FqDA96hN3op5Kb+dOSHqHf
 CVou7r5z8NX3LN+ZoHyYVQ8m3IPO5yTyWKu0D61IcHL/qzp+MYXiBMDycYqld6V3o9RSmSSedxQwjw
 U8Lnbng0DASYQJ0HeM8/cVtJOavX6eibot1s9WERleYwfG53a6ZdFVUO5D9vAqpGPutVWB0auYNrLd
 VGynC6TeDJ2EqPAFHC/7AjZLmRr2SJO9hKDNClw+X0ZHOmwdM3nyRI6jZYmpm98BjhtZU6lDgdNw3p
 2c2BllQ+3sAoMTk5fiFX0/em3pe5dAyP5/Y+w/uv8uIWMuy39lsevtna/jWkfVGd0UBCywWoI6LOd7
 LzWXSH7YkDDoXbtqmlLYpTkpdhm+Lomj8gh8wfYEUSz8sUu6BbVBldd3MFW0GWfpRyzS8ZpvM1i9M0
 9hjI0cV87lHr8bJ2TQV1p1/s7hCdGND7tPfSO7o7KsVS6TOaKxbsNfurxaqmwCFpNRwqDQ0DceZyb0
 GZonbkraSxGo0T90kyocm9TnFa40i7RU6wGqLwn/f1+2FNceWPhe4cYuhfk+njgJm9KTTDHweYEU1d
 AxsZ6I+44KP1IJO/t9smd3fkiMyLuXYFg27JyrMt0IHXFFiP+R7+E/3UCsSA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to support the SM8650 iris33 hardware, we need to provide a
specific constoller power off sequences via the vpu_ops callbacks.

Add the callback, and use the current helper for currently supported
platforms.

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


