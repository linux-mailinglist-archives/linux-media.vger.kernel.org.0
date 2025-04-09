Return-Path: <linux-media+bounces-29754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B02D8A82839
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 16:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7F3C1890C52
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 14:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6710D267733;
	Wed,  9 Apr 2025 14:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WkT/X41n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E05E266F1C
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209511; cv=none; b=fFUxP5ksI7NFZU0QzRv04jEth/k+U02ubw7SsKTsJ9j/Bdl/UIpMXmZGXVvgZ1nDDsj0IE6rLAnpQvbRT9hcaAd/uNggvcoYwhyna3/TK13QmKS+qjPs7pZk4S8GY6CNL6hJNc2PzXR9V20fS5A6W7Jo/A2ZasgZzf6+GpWHgrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209511; c=relaxed/simple;
	bh=UkC2xQ49cwtjimQJomEXRVHWedJyZAC8YoJhIXvmiUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ml1vlIsHh+MUUwbBI3WLILMeFvqNcJB490+3VxqroIIQOUJTlu71V2VCSjnFE8Zrgc+MiZt9SoIGMn1e2V/fKeHM2QFRR7vvWnHCAYdWtG1OaKrrM2kscGk7wbnzvE8w7aVwnu/etM1osNaRggD724x/FeYjr1Mg3zfcLUunU7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WkT/X41n; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so6099945e9.1
        for <linux-media@vger.kernel.org>; Wed, 09 Apr 2025 07:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744209506; x=1744814306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bo4P1zkBy5ZJ7KB9fJf8Jg+rHcpVMabyPlCyrK4lEHg=;
        b=WkT/X41n9slZelJ0f+IjYW4dktevFl1kI5tUYrvL+tBgdXywaca2arAOIjTTr5OVf4
         1wXIwWEQAjzavsv7ATR4yqQAYx6ETzjyEvSi2Z57zOArhF/1cqoBH1j4JpG10ovuyZZu
         DuN4BLj84QAMWcNJyW1oszIsM3JALKZ1Q9nTmf2CFhfksyhafgW4fMCVCFpcFClrl7W8
         u1w+pUOrVeUWugJSyJL6jug3ZOZVD1sZmBRg0iapmtDYowDGsHgavCfERrapOLH+sERA
         DqprAH+t5dx0AruHB9EFzZXtKB5X58PUyrcbO76BWNYJ0sZDgJWQd/+1bx30458Osprm
         26vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209506; x=1744814306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bo4P1zkBy5ZJ7KB9fJf8Jg+rHcpVMabyPlCyrK4lEHg=;
        b=VxwvzknqAioRJnFrjsL0tPy0l2CAjVoWgp7wEsvBLxqYTosEMkkC9/J7U995wQTVhZ
         ip4dvuvlSPuHykKK3B1f7AjrgfcnyQa53MaLpHXsEnOsMPRhZtzl5xqjDb0bhQgwf0rH
         s3cKvKjhu+iIY2CJQrfIoiP65JGAfMObKQrCyUpmfAPQhay1a7JiCLOLgTcQP+ykl1bB
         DmktCXddYZ+xb7hewTtnIiREUMmvIH6+jnU/wSmnu3K7u8HXwVQCRMJgHYU3FF1V157G
         QSTfO3oasdY5U9ueEZwacr+lOlJhJOJQoPZ/54AhjL/gXLiy/H0wecRV7giCNs9zdoHY
         n2JQ==
X-Gm-Message-State: AOJu0YzVXtji3y0EjuOng8tgkEgAYPWCV4zaznsXp8iZKib7/SCT6ke4
	vMuXvVxQNcFQy5apJfdUbi4DSwT6Q5TOI6hGa89i2BHhKBPJF1RcqnP3szNYBIU=
X-Gm-Gg: ASbGncswMm8w6rVwQ018KFVYpqBQDMDns/eO3NFAMM61WKCdVxylnVz5vOChJXtS1BF
	8uD6YcJC/lDz8VkxALbD9mwHdDkJmzGF7FYi0UjWizUBylPrWVo9+HeWgQFJkHpF6GNClCKhlf8
	MaeJ+ScDyOtp/yI05muoRKUC3mCKA9cOVvwYUg0k4LHIjzbSb9nrFckQ4906LcwR+oJtgwAAqZ5
	5OKOU61PNKQrtmKJ6dKbtj3e1s+rqsFopzxMnIRx36A9sFcYxyJMt7ugaoldjhbRaJ+6hWY829i
	8pmv/EQQjJg3IAkUu5igHmMyg/iS+2iWPnjy1c2363TPS+VgohGYCKLmissCqw==
X-Google-Smtp-Source: AGHT+IFv7vvZGkXcHBNRCdhKTeLeBp4cYIuYHhGaihx/MrjaTEN7nvEzCapEn3UnIS2n9HKlMs6wyg==
X-Received: by 2002:a05:600c:2151:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-43f0e55ecc4mr57604475e9.5.1744209505740;
        Wed, 09 Apr 2025 07:38:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20625ea4sm22222045e9.12.2025.04.09.07.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:38:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 09 Apr 2025 16:38:21 +0200
Subject: [PATCH v4 3/6] media: platform: qcom/iris: introduce optional
 controller_rst_tbl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-topic-sm8x50-iris-v10-v4-3-40e411594285@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4061;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UkC2xQ49cwtjimQJomEXRVHWedJyZAC8YoJhIXvmiUg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn9oZcV7CVwIn1ST/ZBfpW97oqY5UNsIXiraUmG0sV
 jy96y86JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/aGXAAKCRB33NvayMhJ0d6HD/
 wJFG8FstjJU+by0UVFSAK7fztkHtey1OapUAeLcrAeOp/+KCVrUjr37A2sRZskOOqe7ybZFgsBuCwB
 wsKPhl9YJqR6ej5WIYHfrsP/3/rX5OZWM5P2TnRMPv+Y8XoZXYTRn+feo/f6+PKnTo03dYSmVPkaUS
 KQcNULUdQc4fsKPKtwIcfT8+H9j9NyxzL3Ws27HNzYTKxLvtolrv2YqurKjxk6b5tNLZducEZcX73k
 DoDCl3u4DJYHcbrxpao6Exb6g+a6NyC65mwPtyjpcoNKqe6qb3iIPEAFwhkcwV3zr7+Z0QAE0EDvmn
 V3gknp7ehLJdZh8u9KhMghvuFiQsPc4QKLQwzjF44W1370CrYvYcYzw3+aaQh+Z4CYooSBu31ZeFlO
 6tKRgT7Icfl5jWcd7WMSV0OZbEWokPoFMF616TmyOdrBnAt1jER7Z2lEzaqqMNsEzhbd0EMCtoEAbR
 KT+IOrcPd/ez7rvOUAps0ADpuYl2Af71wUoGaS8TP/hrepqJyy0w++diJVIS0MTS7zym6fxk6xlecG
 NY56NuUMe8mwVNVgVYW3Abqi1rp7A/8p9ao4RpGejbUNjApUKHlgDS0L1IrL5mkGZIKoVLwq2yz63o
 SbhUPrvHiUFjLyEny6wFI2ygOXHpNFV0yj5XTcA6ubyvRWwNGrWIPIcf1ehg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Introduce an optional controller_rst_tbl use to store reset lines
used to reset part of the controller.

This is necessary for the vpu3 support, when the xo reset line
must be asserted separately from the other reset line
on power off operation.

Factor the iris_init_resets() logic to allow requesting
multiple reset tables.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_core.h       |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 drivers/media/platform/qcom/iris/iris_probe.c      | 39 +++++++++++++++-------
 3 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 37fb4919fecc62182784b4dca90fcab47dd38a80..78143855b277cd3ebdc7a1e7f35f6df284aa364c 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -82,6 +82,7 @@ struct iris_core {
 	struct clk_bulk_data			*clock_tbl;
 	u32					clk_count;
 	struct reset_control_bulk_data		*resets;
+	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f6b15d2805fb2004699709bb12cd7ce9b052180c..fdd40fd80178c4c66b37e392d07a0a62f492f108 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -156,6 +156,8 @@ struct iris_platform_data {
 	unsigned int clk_tbl_size;
 	const char * const *clk_rst_tbl;
 	unsigned int clk_rst_tbl_size;
+	const char * const *controller_rst_tbl;
+	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
 	const char *fwname;
 	u32 pas_id;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index aca442dcc153830e6252d1dca87afb38c0b9eb8f..4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -91,25 +91,40 @@ static int iris_init_clocks(struct iris_core *core)
 	return 0;
 }
 
-static int iris_init_resets(struct iris_core *core)
+static int iris_init_reset_table(struct iris_core *core,
+				 struct reset_control_bulk_data **resets,
+				 const char * const *rst_tbl, u32 rst_tbl_size)
 {
-	const char * const *rst_tbl;
-	u32 rst_tbl_size;
 	u32 i = 0;
 
-	rst_tbl = core->iris_platform_data->clk_rst_tbl;
-	rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
-
-	core->resets = devm_kzalloc(core->dev,
-				    sizeof(*core->resets) * rst_tbl_size,
-				    GFP_KERNEL);
-	if (!core->resets)
+	*resets = devm_kzalloc(core->dev,
+			       sizeof(struct reset_control_bulk_data) * rst_tbl_size,
+			       GFP_KERNEL);
+	if (!*resets)
 		return -ENOMEM;
 
 	for (i = 0; i < rst_tbl_size; i++)
-		core->resets[i].id = rst_tbl[i];
+		(*resets)[i].id = rst_tbl[i];
+
+	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, *resets);
+}
+
+static int iris_init_resets(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_init_reset_table(core, &core->resets,
+				    core->iris_platform_data->clk_rst_tbl,
+				    core->iris_platform_data->clk_rst_tbl_size);
+	if (ret)
+		return ret;
+
+	if (!core->iris_platform_data->controller_rst_tbl_size)
+		return 0;
 
-	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, core->resets);
+	return iris_init_reset_table(core, &core->controller_resets,
+				     core->iris_platform_data->controller_rst_tbl,
+				     core->iris_platform_data->controller_rst_tbl_size);
 }
 
 static int iris_init_resources(struct iris_core *core)

-- 
2.34.1


