Return-Path: <linux-media+bounces-27656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6302DA50AE6
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 20:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA9AB188674A
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 19:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C9D257425;
	Wed,  5 Mar 2025 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bu6Vzyqg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D787D254B10
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 19:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201534; cv=none; b=ZpscnNFFiJfHDfb7KxJyplbiyyaKnzptRSJBucKKwvR+p3MUld3Ph/coR4u5x/5DmF0iqgVssdQCBIIWemNinVJh7SQugxJYAxIFYwHdAl/aMbHxv+D3N/URrkWF8p9mBAiIDDC1yojn1uUGgvaT7v1dh7qCKimARog2hAo+40w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201534; c=relaxed/simple;
	bh=0NeaNRcSK7UDoUfhdeNVtRUD9cUv0qEzjzihXO0mJMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KGbC3fzYo9ECJKVYPbD2Gjjy7TIS2TzBcECPzpIKm4yKbcisg3ffhjWu0S+c/PbMYC1AkSBUhejcYQlWhSqWsX4ymjYNg1KffefqFxtpGdPkAsfT8Er3Hr34f7fHzPvlnKQ403FO6+Q+Fj6Q5R35ycJTFa3Nw4pGbQJJTLv+kC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bu6Vzyqg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so47392215e9.3
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 11:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741201530; x=1741806330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVZEqtiI2RLBc3sKmrfhb+KtkmKXF4cx5FQMA7ydIuM=;
        b=Bu6Vzyqg55sJKz20yNv0GBu4CC2e4SJQuDG3aYr563J5OoVWRoOgaUgi0FPXGgFsBR
         Dug5Pn7BxWM8Ga+V5fJZcv9iy1a2werdQMvRXoi/sh6DGr7YbsEmGkRI2eh8EXc+OBEw
         H2CVRKsI/yaXXMXshZspycvdkNd9DfBA33MVGEsoiOLfwBuPnBHhWehsC/Ennh9WoqKY
         8JcZt1fRgEDwAc52BMi2yDvOYQJf7ta2IlFWppnyo0CYlYR/WoI0nR/XY+IVLkykZJiN
         upDtFchep79A8QhF1Uhiz2baox3t8/VwrJs2/kKn6tzUj84HT5n5RQTUAEn+vTsmIOpv
         uVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201530; x=1741806330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVZEqtiI2RLBc3sKmrfhb+KtkmKXF4cx5FQMA7ydIuM=;
        b=P//d2jE010JUOT7kpPKbvlrKDOax/u0qbbPErwzQPF1omAA3xq+Ev2WYEADYXwz2Fa
         5hyLlFF9lKV68gi2k8n+WMdHg8Dsty7vPi9zCFtyxLn/pxmNWTBjCTU5ZvfpFcOp0eQ0
         c0i+ZzekPhYe4MoGcgVM/8ESauyc0LooKeO4pl5Or05peCqMN4zehYF60KpCe1yyLAts
         J8EHzdOQ4V7a+vbmRAfoQMsEazLFdmT+Yl5QSHaLH8Ur4dvU1OvGhXwberUUcK1rM0hO
         us9BEXthJC3X9t5JtPbv95EHNQDj4s9zSiiJ8CuhZj5p+eYGqvKYFVcEbfRlJx86A/+Z
         ACkQ==
X-Gm-Message-State: AOJu0Yz2CRSXDiFk9RafCfj82ZfFwOWsnDj8peRa3hzBZtS4ttCHl5Cx
	ZKWqani1TBJx8iWAXzBweTXsf5I7o17sd637y6Tz6PU2mCyx+LoCVkQYEMRbuZQ=
X-Gm-Gg: ASbGncsq/L3f2gLNcFjhhmhw07AhV4eYg09cR6+keh3SNTZEsULIu4ckiMZNHg8Pf9j
	AzEPnV+ONRwby3CRLyzqUmNm6OhQ4LXzJYXoXo1FKT1Sy6rLDXfTjzO8IbA6mPp/2VnxVSc7mL8
	mDZ6at4trdMhoIlEkVUl6b/0wOfbIdJ2ibBT5BD7YQbVZqnZTvSCC4u5l3QCI2Vzf4QIpiVoRId
	mJUZxnJAyBdo1JokICBuxyzwOjJgzLstoy1JTEKUM9n3fQ/RRwofkXKPMDMHARXH2B5YUgftX4B
	DJaf9u9pvjbdt6wnOUy1qgSovOyBo5H4e0YNLqfotHgcUhLJsMW0/DEQmcrFOrOd3A==
X-Google-Smtp-Source: AGHT+IFzRIskFsKc+hza8dNCDs6WL2V0amuCJwB6HmCuXQQQjxKyv0wR37y6HmCD3BopW0zqWdYIgw==
X-Received: by 2002:a05:600c:4f87:b0:439:9d75:9e7d with SMTP id 5b1f17b1804b1-43bd29c4593mr28407075e9.22.1741201530057;
        Wed, 05 Mar 2025 11:05:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-391241bd151sm2045218f8f.21.2025.03.05.11.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:05:29 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Mar 2025 20:05:21 +0100
Subject: [PATCH v2 3/7] media: platform: qcom/iris: add
 power_off_controller to vpu_ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-topic-sm8x50-iris-v10-v2-3-bd65a3fc099e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4579;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0NeaNRcSK7UDoUfhdeNVtRUD9cUv0qEzjzihXO0mJMs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnyKB0ioFERG5p8hkTpF4LR4U4q4zIzMg4nHr0lS+m
 qlav25eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8igdAAKCRB33NvayMhJ0Xf2D/
 4stwZ91WXybax6cmCvoEr1csv9LMhjo+wdMjJ430DaUkhkufJGnUiLqKEu2iQ8NV7Pn+4V1Lu8KoXo
 KrOi3Zq95vpojWYRv655+uhyc9OnSHj3tSzJv/w+TWDsbq/gPKXBJFFkrB69pzEho/9IODcyb2pDFs
 r5tQs0h+rjS/nqSw1tcgSw84S/GCdgg7rNXxFUI/Oiw31JzhVE7oQCRGryP2DK9uVsyJq/Q68ZLDcD
 WeC5iGrVeCJFzOliwSZL4YXLxslaS9J8Uc1KtMZMq4wbNsRrp3ESjKjrF9WL8HN8KU6fGfELjLVsrR
 RNoiMIkF2wWTjHCU9ULx16mg113l+yh5mZfZbiF8RlcsKrs76dMU6ibSpUuPk42ybTjyBVMKwMzy/x
 CKnd58DOw+x8DDGg/zoQ8Vv+232VYO7B/0da6J7ybxyRH+zhv7Sj8fuSEN2qAknJrUsuqJ6UnTvfDv
 qtVyg5nXx3jDL1GGFVayW2r1An4iN1r9cYxNPjcTDyFSDreMg7GajLwns/ntYcq3Idht2Q+O7IZlk1
 vRiMqwsnDKGAcwItUOPoJHH4aJB58qINjAFx0p/2jpB0QT53+bk3NfTB2iq7/briSV0Pmv5lj3qpxb
 dcjheQlzRA94NYHokLrnQ8jPZS31zELUJyenra6bBDUPkWYQ6RRWPRbnc+Bg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to support the SM8650 iris33 hardware, we need to provide a
specific constoller power off sequences via the vpu_ops callbacks.

Add the callback, and use the current helper for currently supported
platforms.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       |  2 ++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 14 ++++++++++----
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  2 ++
 4 files changed, 15 insertions(+), 4 deletions(-)

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
index b484638e6105a69319232f667ee7ae95e3853698..95f362633c95b101ecfda6480c4c0b73416bd00c 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3.c
@@ -117,6 +117,8 @@ static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_siz
 }
 
 const struct vpu_ops iris_vpu3_ops = {
+	.reset_controller = iris_vpu_reset_controller,
 	.power_off_hw = iris_vpu3_power_off_hardware,
+	.power_off_controller = iris_vpu_power_off_controller,
 	.calc_freq = iris_vpu3_calculate_frequency,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index d6ce92f3c7544e44dccca26bf6a4c95a720f9229..3b3e1ca1e42183561ee78c89f50946fd0cc3c3ab 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -251,7 +251,7 @@ static void iris_vpu_power_off_controller_disable(struct iris_core *core)
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
 }
 
-static int iris_vpu_power_off_controller(struct iris_core *core)
+int iris_vpu_power_off_controller(struct iris_core *core)
 {
 	u32 val = 0;
 	int ret;
@@ -284,23 +284,29 @@ void iris_vpu_power_off(struct iris_core *core)
 {
 	dev_pm_opp_set_rate(core->dev, 0);
 	core->iris_platform_data->vpu_ops->power_off_hw(core);
-	iris_vpu_power_off_controller(core);
+	core->iris_platform_data->vpu_ops->power_off_controller(core);
 	iris_unset_icc_bw(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
 		disable_irq_nosync(core->irq);
 }
 
-static int iris_vpu_power_on_controller(struct iris_core *core)
+static int iris_vpu_reset_controller(struct iris_core *core)
 {
 	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
+
+	return reset_control_bulk_reset(rst_tbl_size, core->resets);
+}
+
+static int iris_vpu_power_on_controller(struct iris_core *core)
+{
 	int ret;
 
 	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
 	if (ret)
 		return ret;
 
-	ret = reset_control_bulk_reset(rst_tbl_size, core->resets);
+	ret = iris_vpu_reset_controller(core);
 	if (ret)
 		goto err_disable_power;
 
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


