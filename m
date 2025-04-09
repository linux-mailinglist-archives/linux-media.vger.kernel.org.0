Return-Path: <linux-media+bounces-29753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC21A82846
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 16:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3371916960E
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 14:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90048267715;
	Wed,  9 Apr 2025 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kuPBdu0a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29DD266B4C
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209509; cv=none; b=NAanF2hXNprWnt2OwRYeOtJ8aMoECl14qtTbrpI613Z515Va5sBLzGvyZC7t6uA9wS/H8iZy6RNcFAo2ZJCZ1/9htgCUs68sCCzZBY788/akbIjiLwOY2I0f+evRzN/AcBOowmuLIawCXgH03iQ4sisHPr1qU2YzLYj+bDdLnmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209509; c=relaxed/simple;
	bh=ynWcQw0Q/G8mNhYBlkWYNYw4t7oNSEG+zaX/r1AekVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z4hHZYghSGnPmXYKmWNSkejI8KJ/Tzc0TOliPqeyCQ+srQmirSVfq/5SlyQH3GKfQMsVqWUOcoC+c5j4Mwp4W+i6oUYAHcOpqoBUetgSCWCcDM+xQ6xBl6TjjHlT/TGUwWcqwhHAb7AuiVtk0DN7A7IpswpJsMpUoBe72U6xUcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kuPBdu0a; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so43338965e9.3
        for <linux-media@vger.kernel.org>; Wed, 09 Apr 2025 07:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744209505; x=1744814305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbEQGTRsZtj+cgrt9s8r7Nmi1WRj8PxAdZ+rmqSr64E=;
        b=kuPBdu0a8xy1+wDmeJQGoevLk48bPNDTXm/TwOtjYZF3jumIzMx9K2jRE+oSTvVYtz
         VvN1yGl16gEmP0tgskUURCYXva05GZue5Y5NrW4fQVNqwM9wos/tgGGh1q2Ohpy+ONrT
         nN6erjOHiLcmq1k7TcSNq0JY996GO8iNFhL9iYf5cGLTpd5eYI4gqZX86oPvnlw9QORb
         zdjLitgWTMNpxiNT1mOfaj3Grnm51BB+7Ht3+itnFomVutcVgaSgegCtoHJ9uMOEQeqR
         ykCbsW4lLy3bsDqmWJWOampC9MgxZUClVpC8b2ilYeRvfa8mODB8A8/3IOcuXb3zSlt0
         T0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209505; x=1744814305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbEQGTRsZtj+cgrt9s8r7Nmi1WRj8PxAdZ+rmqSr64E=;
        b=R4ZPPsVn4tY5B9MkChA+XTDVNbzEKkKfumd8BPw7kRhN6/tSP5cd4smqbKINQ72z+Y
         8832A6u5cUJpXYdrhs4562tJpDVuRq477jvM8I0KvMx8AzkCA/kTLahY/eeGP0YDxk+X
         5nOGkeWfmdFkqapA1wDwknuCQO8VUbUk7E6a2eYj6PxCFEa9/+73qmqexqPmt/NMvwSn
         uB+bLX61hm2tnyLr057kl/hJh2PhOLMvJ5xQrBIyMjt+f5tdmNap1Jpj+35dXl3gibGw
         AM6RAminJTzqO4CLyi4HVPecVp5uSz56kvqVo1VGBfu+ohm8a3IP11ookqyA3PSXrftO
         xDZw==
X-Gm-Message-State: AOJu0YxYBJMiOy5ArcXVJax5NnLCcCywhzDMSe+ZC2hMf7uH2JS+I4pe
	6yzFNMlXC8b2HUO/R3TYo63QMmYLKWmmVkYCp+ZozTi4c0ZQjpF8QQzxpS16nNk=
X-Gm-Gg: ASbGncsHGHQTIhu2SnpI56AFsfa1/ojLthTOfXXoBjszQotQzdMdenw+JBTbyRNIiFd
	D+axwSNYUwoDll1xAaKMhNlKB+YFTmiVkWVUt/6qAkSKA/QychV+gqlV9xThNPZnb8+XvdZleFj
	RRlzcIunczaJj7dBc2LTnRwdshPd2ZsXDp6GLxIHEtKSSsKNpulRHeUb90zHC7zDou4BmZBb4YL
	qkbGBe1xpH1fpX4S1LJ/WdBg708BRbNetvp9+664OL3xTALoKqaa9KaYQdUof9j8cN4Wf6p7YtZ
	5P5CZ5I4/Q5goaRQr0sfIrAyY4HJgVzr4p9MqRS3bbSWgYPN13lJA77vDyvpEw==
X-Google-Smtp-Source: AGHT+IFMDpE0Jb1zFAxpZjczOiEbcPC8E8M1ybhy9jl68Nr4PqP3Z7DKhUV/1ZjX1CVkneA2wf+/5A==
X-Received: by 2002:a05:600c:1c28:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43f1ec7cbfcmr20225845e9.5.1744209504764;
        Wed, 09 Apr 2025 07:38:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20625ea4sm22222045e9.12.2025.04.09.07.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:38:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 09 Apr 2025 16:38:20 +0200
Subject: [PATCH v4 2/6] media: platform: qcom/iris: add
 power_off_controller to vpu_ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-topic-sm8x50-iris-v10-v4-2-40e411594285@linaro.org>
References: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
In-Reply-To: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3924;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ynWcQw0Q/G8mNhYBlkWYNYw4t7oNSEG+zaX/r1AekVc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn9oZcEew921sqnFFz5PURZPLLPMvPpDrt1epa0lRh
 MXCUAzmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/aGXAAKCRB33NvayMhJ0c6tD/
 9jkUuxJUKjxIHBgbrrDRsLyAfcIxIz8OsruD1go/P24RWeo+u7xktLSR3LmZAvdZCsbtt5XyKrwYzy
 3EGCjiudShuGwNbXm3OuzTyO8lqYI1NtgtghcgEzOaIzJM/0SspL+MG5xiW/EY3Ml25vBCt040X4E2
 CCPOY7L/ldi6IoDa1gW8HU9H3kksbdfGxPmQyL1uiLvibJPkK9iUtjxnQH5O6nLrl5mqXHup0jBPYg
 ojWOwn/RCeHAXgwlNDZaHf8bv5qdzglk9pj6Gwv5WTirXbpkurmFrH8fMhOVlAb8vxeO4RszTS8Sze
 HNlk4J1eDN4N4DC0VTywWwd++Tr18CEbL5liZTYGT4/qT56WVu3Oju4x+powu5jeo6yNmKvrQGUHdc
 0p/4zUHXENuaRboNm7UFYFC/0AUIvLGCPibB88upPTtGgM4GO+PyyHqzhVcDeD9Gq7rPijVl5sqECs
 lBKZQFOydEA92rrWPYqREOay98Yc2M3yLKJxGVLZh6Li/TUAXgjIwdbL6FjBDq5+x8acv092kY+OeF
 DOYM9qKj6p+h3B8LVTDkFIj4fKJyxDwHQxSSf7HRKz4sX6tSurmOQi72eb8C3zghl7mE4RRR446+sa
 DZCSYEVG39aDs49r8VUqjXa28EppoBRQA0H33lR9k0IM0DrpkJB+Anblt9EA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to support the SM8650 iris33 hardware, we need to provide a
specific constoller power off sequences via the vpu_ops callbacks.

Add the callback, and use the current helper for currently supported
platforms.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
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


