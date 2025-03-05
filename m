Return-Path: <linux-media+bounces-27655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF168A50AE3
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 20:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33F7E7A5670
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 19:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFF62566DA;
	Wed,  5 Mar 2025 19:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v94w2NeB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77A8254871
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 19:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201533; cv=none; b=b9kVbznypWpRPkxPARa6fd69E8oLtoVTAU71xb0WrqoVNrDMetDM0KQP0a3BNaOgejbs9oyDCyWjBWpgzD5vBsLqlaOUKIVOcvyvR4z76uTSDAVM36v/gKjOameZ1ZZPzBBdCZedHYVKXtWeZIOmIO5SyBFTaddUA0TqymXSH2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201533; c=relaxed/simple;
	bh=7F/lb3BQ+xLsa7QmxRPtTN99nPEu5DGTE3fdAaA9TPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XMg44/wc++BTxYOknD9DIeaR9Wp14mKBzoWJ8tY01WoBgI2Fnm0zX0lBX7AHugIWAoVp9ozuK2sOGx9hcITJ9bPePDxQJdyGBba0XzjmdK1YC3O8PTbdYCcQ83sSmkRz9A3Im1hbRTwmg0JGkl/TClFVy7NHP94VtASL8iQ3WgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v94w2NeB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43bd45e4d91so6522085e9.1
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 11:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741201529; x=1741806329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xLGSJADXNR/hr66tyqCVZu5qyHAPdvLKX+cD2MnHAo=;
        b=v94w2NeByaEeRLYWeCG3Bp+IvrOwUctH4B3MePEMIJqLxKrkNT+JjIKUwfuMeCRw/9
         9GfUwdjphrJgsd4fm3YMfeWOonOvG5Y2oqCVxLvgtqTxMnUvDnLB7CBZzLlY/sFjUGNo
         dR2oZ2Vwc+0Rqqxlz+sPo6YyMzHSxm4zV9StVCVABKlwV/YvcEvBD7O3xzCGD3zJsQWd
         56cOUWiBXiuguSnsRaWjVarwXCwlkuCbAWTQySRgJKTJYn7pwd9PARDR8QIlLtu/aFzS
         1OAR7tL+PdoZDdpyfcbbQB2mby+zx8V8gp9i8H1oP4hvDVXVm4gvrMM1mgliFZa5Z89N
         +jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201529; x=1741806329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xLGSJADXNR/hr66tyqCVZu5qyHAPdvLKX+cD2MnHAo=;
        b=du2OoTzbBjA/IodTEdHYO8pCYHWunWVtHKP8+WiaSgurQKwRynUiuH0YvI2EWpMb3N
         oOZC7+42DSK/sSOtA5PChU90SDwuVLQDjuLeryZheEm41YKKaU3czXUtwbOOKh2xeyi7
         QSn0V5p02k2fgL9xTzWD1UJcf8UJJsJXHcPorp/TjYQ7qksYBTD87lRJObwb//LXMVxb
         ccySZZUOLQCH78gnp47ol+dG38nsngzbgVOOQLM8GsjY/nwGiLkAIRw5MQ8YWO7PaJdX
         PDQn5AlneSgmNVqDSjUYGRLKEwkzEnc70QfoP3wcRugP0Kteb7nMfRUeSQZAHsmdPIKE
         W3YQ==
X-Gm-Message-State: AOJu0YynsijKgQksIZv/yeb3CokrGRgizozNlFBt/siB59iMcqohbj4B
	AebGPp35N9L+ObeJVkcjbs8XGVm4OgBIUuQnYgd/h+ZMJV/aY/pHgoZc3LiHa5o=
X-Gm-Gg: ASbGnctilXlGNNTo672WczacA0bF0X84gNh7/SnGC6El05Ris0BV7T3sJoJ8YRFE3I9
	PiKUDVVRU37UOwW8TdSnQr//i8N+3rOHM1BRhTRrJ/L/neOiXw/4gEk2pBIgKRHOk37ZnszZLZy
	m/jUV7yjrPZ6NdI/+pNxuXoT9pTlEVdbG+e3Y+vTvUkRxyyYJq3d110wDS3KoP+I06OdKgtnqVg
	IeASwXOgUsdoKjBzgVcxnhjwN1Le3zFRYbXsTPNfRkjK8XahLaF+s9WYOHgs9EMoTD5L18ZLzpM
	4AOl5oWOdYjRlmM5ofgotgrwGuGPNWN6iWT/0g3Mahm9L+vlbLDogY8/oFUEUdj2PA==
X-Google-Smtp-Source: AGHT+IEganXlxH2+lP5ulNTLUOZSaTwD7x12KEFoCNpyrwi9IRfkdbIGT+3gRGv8DcNHkPZn8e/2Qg==
X-Received: by 2002:a05:600c:1d19:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-43bdb38dbedmr3651495e9.5.1741201529035;
        Wed, 05 Mar 2025 11:05:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-391241bd151sm2045218f8f.21.2025.03.05.11.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:05:28 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Mar 2025 20:05:20 +0100
Subject: [PATCH v2 2/7] media: platform: qcom/iris: split
 iris_vpu_power_off_controller in multiple steps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-topic-sm8x50-iris-v10-v2-2-bd65a3fc099e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3391;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7F/lb3BQ+xLsa7QmxRPtTN99nPEu5DGTE3fdAaA9TPs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnyKBz3rxLuaIEhEfq2rgeTP6X2+5DC3zVrY/XRhQl
 IrG7rg+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8igcwAKCRB33NvayMhJ0R/lD/
 0VxNIG+yrJFnR2xQm2zZnFm+7bUGOT9bNf7wLyZciiolSlurtyVL+/8+WiPnskNpXaAM0B9m9SHc89
 76Eg2cWy0hbwp0KNUnIfB74B3bzpuddWB1KDx+w3TjMbIJbjoYpnyzNeDLKvpGvf8bWA/L/Eqg2ZxN
 fALR2F79Em1nDtZfz0poEX848fVpMQq5mFrYjMx7TeS4jrYb+uPpukcjn6NUkP9orh1obD54s0/gcE
 GLGPTTbzfRdDjlPFT4A/391j7vCIR5RW1wshNwtQrgnwl9TKGDn7k1A5dphYhOyV5gyMy3Y/TpmHIK
 OYCXs8oYcXj3WumQsIHJsISqV2gC2ACof4yUQpOAcGTP0BzathGGjfpO519rQlt6EvAvLtA6YV5jYM
 szqJ9FVZyPx6Bx7VyPaZbJXXzsyzYkxrNpMqoodknCD4+OLUz1R4UrRle5KqP9apAGRA2TGMLWDDak
 /hR9ujSYtvDN8J+O2x6DBMvw0pacQuuxKE3Ws8DemAuO9G5sV1MQoSsHYl7LR754jdc/eQI5r+0Jb5
 Nbs6MtNFA68bY3FgsypjSqMZRwB/huDLNxjWPG0Q6sFW79zqEBP5T/xgEgjnslzDr/Ke+5X7x6PTKD
 5vUrCr8pkFO7zNzsdVTkBh8tLAqn2zoYT1QRwoKQDsHYw1s2xhYpIO1fWzFA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to support vpu33, the iris_vpu_power_off_controller needs to be
reused and extended, but the AON_WRAPPER_MVP_NOC_LPI_CONTROL cannot be
set from the power_off_controller sequence like vpu2 and vpu3 so
split the power_off_controller into 3 steps:
- iris_vpu_power_off_controller_begin
- iris_vpu_power_off_controller_end
- iris_vpu_power_off_controller_disable

And use them in a common iris_vpu_power_off_controller() for
vpu2 and vpu3 based platforms.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 46 ++++++++++++++++------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index fe9896d66848cdcd8c67bd45bbf3b6ce4a01ab10..d6ce92f3c7544e44dccca26bf6a4c95a720f9229 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -211,33 +211,29 @@ int iris_vpu_prepare_pc(struct iris_core *core)
 	return -EAGAIN;
 }
 
-static int iris_vpu_power_off_controller(struct iris_core *core)
+static void iris_vpu_power_off_controller_begin(struct iris_core *core)
 {
-	u32 val = 0;
-	int ret;
-
 	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
+}
 
-	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
-
-	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
-				 val, val & BIT(0), 200, 2000);
-	if (ret)
-		goto disable_power;
+static int iris_vpu_power_off_controller_end(struct iris_core *core)
+{
+	u32 val = 0;
+	int ret;
 
 	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
 
 	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
 				 val, val & BIT(0), 200, 2000);
 	if (ret)
-		goto disable_power;
+		return ret;
 
 	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
 
 	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
 				 val, val == 0, 200, 2000);
 	if (ret)
-		goto disable_power;
+		return ret;
 
 	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
 	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
@@ -245,10 +241,34 @@ static int iris_vpu_power_off_controller(struct iris_core *core)
 	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
 	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
 
-disable_power:
+	return 0;
+}
+
+static void iris_vpu_power_off_controller_disable(struct iris_core *core)
+{
 	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
 	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+}
+
+static int iris_vpu_power_off_controller(struct iris_core *core)
+{
+	u32 val = 0;
+	int ret;
+
+	iris_vpu_power_off_controller_begin(core);
+
+	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
+				 val, val & BIT(0), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	iris_vpu_power_off_controller_end(core);
+
+disable_power:
+	iris_vpu_power_off_controller_disable(core);
 
 	return 0;
 }

-- 
2.34.1


