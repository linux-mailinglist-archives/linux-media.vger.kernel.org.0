Return-Path: <linux-media+bounces-27657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E5CA50AE7
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 20:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F87E1886D32
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 19:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86732257435;
	Wed,  5 Mar 2025 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XY6CwFrF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27E725524A
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 19:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201535; cv=none; b=cw2Fs7VUACVUvBUDiUAJ6nFM8DalIZ/drYapVBEGgXBpvnOGzcHekeqGSpyLeD8P6eMz2qx1QNqLkhK1zF8ALgfneYMJ5Jmiw+UwpIAVFuuNO4x7Pot4TdsLOk//CX5KbhYWXTHkSZ+OBr+mKBnDrCO287B8Bp7xAZxXdz3ApOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201535; c=relaxed/simple;
	bh=4xWvpAYXHrZie7L5gQZo6NAa+M3VJwRo6H+qV6FZMQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GB8gOxkj19qb88OY7G0umBgrZEyUaugEspWuEJY77fCOQ6yLZQagY5IWCLTWGqT4H3pv8jztleKrI4PRDLcEU8v4i8LnhPmfZE2U/DdK4o4uYMk0BcRjJe/BAJ+d3cGO56wsiOBxL34NKq/MEwgFe4sL8/JMVGAnQBfZyuPIIqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XY6CwFrF; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-390ec7c2cd8so3972183f8f.1
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 11:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741201531; x=1741806331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDhNJvj51yq2wkwFl3xSWV0D5qLVQYcb+snJSu2m7UQ=;
        b=XY6CwFrFRIFAleQsQ/iPQ5Im/y6iGx71MRARJoUXucmH6ELNyCG6fNkU7d8JwtIe2a
         YQhcZU1sx+gFaGgEyLkkwfZ/56y9gVCxfPZH1B6zZg83eAhLirPXOltGXFJJKeDs34UB
         xCJxHm/B7W7BtjT5m1dOSt2GsshgQPMRZYCN21MfooFz/6Qp0tk6u/7gMHfrGeXfz08h
         45rUr7bjDJG/kdCSY0pbcOZoVBLcj3Okm9890dK1Q1a36y57FzZ+Y1KVbs8dpL4iMN4V
         dsW+dWV1UkiiBkkU4tDElNk2xx+PT8XLfigknPLd0Inc6L+YScWIX3tvqAeUw9SRdWXT
         Xo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201531; x=1741806331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDhNJvj51yq2wkwFl3xSWV0D5qLVQYcb+snJSu2m7UQ=;
        b=s3WM4RkmyTxhBchI9Mxa04z9Itzf1rWtC+tnMWEDvg3PdOhUJ3+7IQ4Kx+I6hhA3Ud
         cPDzOyOrfDuDDHA6HKXDlGxzE7DKI81hlXtY8YJ/ZN4Y+e970K4FcW4hs+9mZ/xT1Xz/
         RtZo61IabWH/GfIqro5jw6SgpGbwISm+w/7dVWUH+dUz2qwce3M/26egf7BtbGb5rE+6
         P80R3w2mGsRC3MEuj+/Bidzv4yBEHrHnJ4GLCwit5J7mSNlSgQqo0cSNvENJuEqHNhUr
         nGmMy1wJX5ZvHEW0yb98kzqDzETzEsx4cUBfcqi0ZZohWH1lUfda0rfSV2aPEw1tsrpA
         Cl+g==
X-Gm-Message-State: AOJu0YzHVe5rIHsdOyJCLWxxlwa6xX4D88B1b/99BRo3s5Hj7WQ/uIzj
	jtqT1yWe+um1Vk9RGT1cEjGiJyivCc+aS1McL4n48fkgKZMl4/OcDsToYmw1DSQ=
X-Gm-Gg: ASbGncstOYpdEneaxJDAF7GfL4GbCcGquZpBNnU2pPSvc6caM34x7X1Naesh/fWFsZw
	zToxQiF2gDJpVhDYHWEa15HhrHCAOTVFBqWXHAurQsKhEO59hgtHTXvy78zWWllCRdWvbv6KAA9
	uChvEBPLafOKv09J+gfyMnra8p8pHHiIbgK+TJzX327TmbEled5v1t3GDeoZ+/zJNGg7PzHMhjx
	Ow3lPLsBfk/h8YaKDNEvcC4IJGpj783vfWhvv1dQkCy0j6yMBCm8ptnulWDgZtdtkSE0Tdex3ug
	7XFvjwLNzM0nG4UHWL6E4032BeZm7ZOFiqwt8QZXdfDLnxEtXJL2up4Ix6YBYIrztw==
X-Google-Smtp-Source: AGHT+IGUjPRq97ZEQw0P71WjSTjxhDc1f6XEctcdOEfq5TgTNg740OiVfh8udZC30JYLEybJGm2hMw==
X-Received: by 2002:a5d:6c62:0:b0:38f:503a:d93f with SMTP id ffacd0b85a97d-3911f7b349cmr3595082f8f.40.1741201530786;
        Wed, 05 Mar 2025 11:05:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-391241bd151sm2045218f8f.21.2025.03.05.11.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:05:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Mar 2025 20:05:22 +0100
Subject: [PATCH v2 4/7] media: platform: qcom/iris: introduce optional
 controller_rst_tbl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-topic-sm8x50-iris-v10-v2-4-bd65a3fc099e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3932;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=4xWvpAYXHrZie7L5gQZo6NAa+M3VJwRo6H+qV6FZMQY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnyKB0m/WE6TYaeFRoljQU8b2IKjy2fW5a9kc1f1ka
 v4wnS1yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8igdAAKCRB33NvayMhJ0VXDEA
 CDcLgAdkWsboNxrgj2j41rVTAtkMKvrZLXL1ZcbByAkpsLMoVt61VV5/wvllnTPAVveSDoGkiLLJZz
 0DvSQGDJzwO9B0mr+2V88ibUWUt4cWsMlMtEsTzT+A3vCUGR3cj4gmfItY63rXawDHdOiwHfuzv34Y
 IZK+NJKUdNdszDG/lO6lZTYD3WpcJOXzX3o1sTHCo6sankyjnm2kAwp12ou/UM7mTSLYZPj4NLaBx8
 wj+UQ92A4MDMZWgDGsTfbVGZSgHAZMGaISC5SLWjrdCoiXVY0jnM1Qlylvbr96o4vpKoiFUAMl2vhv
 RB5ZtpXQzXBX7dzK/bijVQGiKnKpDQn3ur89n/5cgAHh2volpPyeVopgoG3kpPE1qF57jm7lzNhJD2
 5Wu72MbLuQTuRb5JAnkQbho2mBSddUvh5plXSMQ9xkcwxkKb0Ok8YqqblYieTNGRass0F246Cf2/PM
 koX9XvKKTO3lZwxFE2Z17SNbTJkZ+sd5WtIVpAsP57xJINzm2fOHZe34wARN1RXmPaFid9X00/xXGl
 bBSD768gWPv4U5ATbQG3FPcG7uHD3zZgy5zTY3x7tXAsw0VFYQpQyNwlCCXPSB178jPb6Qq5dt2IKh
 tm83SfgOA3iwXOvdPfyGIZWZpyyGxwojo8Xs7Xnzu40jC9aOSmJfeGADC28g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Introduce an optional controller_rst_tbl use to store reset lines
used to reset part of the controller.

This is necessary for the vpu3 support, when the xo reset line
must be asserted separately from the other reset line
on power off operation.

Factor the iris_init_resets() logic to allow requesting
multiple reset tables.

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


