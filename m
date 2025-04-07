Return-Path: <linux-media+bounces-29533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 315E4A7E469
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 17:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D5471899910
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B110D1FF613;
	Mon,  7 Apr 2025 15:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zFXNDVs3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFABB1FDE03
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 15:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039467; cv=none; b=rkNia2kxDQiCsY20MCV2Aly9ZK8ZdYWhfSZ1YclbYJDM/rnFfJBnNvzIQzEvU6Go2q73OiS6pocRDoApLECwJK8OL79FPouFLVjjD1fig4aHYpOivHwVdcNG9HUlwCLmGGlx5Aqv4aMcW0gueTdhLJ+9x0VCM35VPjBdGvTwUqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039467; c=relaxed/simple;
	bh=yF/nZpFIBaoPgtK083tpBRuL0o6ITykxH9hfKXrn2O0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SIAyHYvq5jGzitypqdy+oiOEUaeuteGVPNd+U7IjPUtd1U/uSVbYuyktqI3KmeDjY+RKtTl9IuFt4A3ni+9K3j5xg7YpWL1xBG3gGDi2a0RHodMTRJoya4ZK4J7TBfxE1ieNDALfw2znIob5QuZwwmaHDOQ+9QJymjX31B3tBh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zFXNDVs3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-391342fc0b5so3558956f8f.3
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 08:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039463; x=1744644263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcSjwmZr8ORweNU9kIIwQdANNDnxoTJTNwIPGaZvALc=;
        b=zFXNDVs3VzihPdvE7Bja5ASLiF7MlJDgxaxC210zD32Z52Ik/Ca0aA6LbGRb5BnQur
         eWpt9vVZCsKHnLBkcC/VfirNgE8JE16GH1MFWNryj1tl3mZKP2qo4UGRlkpOQ3aiKsPv
         o5hLpnbge1+alRru5/I9kV0pQgbEXna6VWnpGpM2zkNObhhGl4Qq26elZbdRwba/VDjP
         3hpgIJF98WfB3TjpZmQLT7j5nUYvkf5bR0LwwbvYmgTp//Bz+Fzpc+bu8oJvlxiCe0O9
         9I2ktBMq3ahiZEH/xLn9w+QNkkTvNxQVjW2a9vrcMrjfFQCjUekIF6vq8lwVn+vnL2AV
         OBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039463; x=1744644263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcSjwmZr8ORweNU9kIIwQdANNDnxoTJTNwIPGaZvALc=;
        b=PpdrOaWeZTuIefT2pZoSsG8yGxdXiwi4MYdPFU4QIKUDqJXR82DlJHpOWU5MRDrWIL
         MRsrRSTruwHdtkeavufFLYzlKNUD7aJocT+mzeV++/PQezqliYgczy7YAOk8abt0pH1+
         nP3TqO1663I3CIdETmGcWrqwN8krPaWE5aE+Orpg9eB8C1Dj4ne/fNyPtEATupoAA9rI
         PpB+uabSIS+cMNn231UT3yUa3yccQXQL6IsxlBRk87svXCN3JmDo5zCLfJmXP8Ye1M/O
         jBbgEMqauzrkcuwarUf7sZUdgb0U1RSIQ6uFEdqtdv3cCoX1oshLrgmQ5chAGbNAQb3j
         8Rxg==
X-Gm-Message-State: AOJu0YwrLLZJNy31U/MIl+p7HYPvcS/eoQ1+GUIcJ5P9yaqaEXfUmy69
	NXaX9A/3Rz3ebyVtI99JqV+06yi+hNG/kL1gZ8q3mPMl/uj6KClRQBb1Y/p7lyE=
X-Gm-Gg: ASbGncsxDa/qzJmQHox3r5qwziQ+Ivm/834GA2YzNWCm1syH/BV8dknwqQByMqr08Yt
	nxL/VuJw0UaHWT59tvS8EvOGpnsDCgi4sSdjzpHgPqcOJY1pTjQB/8bttXj+QDqUMjwhQnHpk7o
	mSOncLa7/amm5nOp+j3BzPHr8drYJGPQ8RPSrGAjyOjSFYlnrt81bB6kydGrhn91Z2QbOXUSVRW
	dTu+IFFN4eMft0On/61AVDRq3UNhM6Vf7pZEYbArU9defHpX5WESHmOeF6xcXa6FNjStxGXFNWC
	78iSkpvvtlHRNfkvhSYsJJLBM+LU1vZSMNMrNckNG1jEh57ws/t5R1jeQTxo5nlYnQ==
X-Google-Smtp-Source: AGHT+IEiztIgBCTamZNWx7wXWdVS9Mdv/TxnRw3HiOV9XILWkE1LHblkaE4EeM/P1T2cQOYdvHuaPA==
X-Received: by 2002:a05:6000:4312:b0:390:e9e0:5cb3 with SMTP id ffacd0b85a97d-39cb36b2a91mr10562781f8f.12.1744039462633;
        Mon, 07 Apr 2025 08:24:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b42besm12212001f8f.41.2025.04.07.08.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:24:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Apr 2025 17:24:15 +0200
Subject: [PATCH v3 3/5] media: platform: qcom/iris: introduce optional
 controller_rst_tbl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-topic-sm8x50-iris-v10-v3-3-63569f6d04aa@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3992;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=yF/nZpFIBaoPgtK083tpBRuL0o6ITykxH9hfKXrn2O0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn8+4ipaaLhBnlbScsYbBzP5yhs0djrxvD3iyc0RFs
 V5IeTC6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/PuIgAKCRB33NvayMhJ0VIREA
 CJei6IXdQrW7QLe/TcP/GwmC3F+un8EItAZKWCQAeJD6KaR/kab+E2OhirbnLJOQG/BSPFB77n6z3x
 mI2ZZqkYYH+0gA2HTu+i1JzhWUxeYC2Dcga5WZupLkTs0hLrgoZnzsiC1h0GvNtlcwQiyGr65pJm3q
 /UcSj7QdL2Zo8vR3PNlZq0cAT2w/V5U6XjRm3/G9VTR5z/YUx6sykWIsWL4GaM/EK2TsU8J9BeJiuq
 2JTote7vWKuZ2elPL5AzWDl2VKG8+gVMtItQr90kHv04j40HuBNvx2+BNZzdPld5Qa3m6KXT69AOR6
 Q21OHGRif1Dxt9kfEFZb0m849oJyDz78xPptarZr0qrPeuDI5KmwX1o37vfHzFJm6QLxdry971Gjgx
 3mWBU660QE/DEBtGYsYuDPZOiQoW57zcHHIbpMDTRlZHWzF6ENyAJFyL2e5kQDs6vUVU+S0COKRJTs
 6W9KaBHxsNRSBSW86jHQ61hDD9quViZKWyvi27iRfhWo/vbKkOPD4ZB6pm75ih5NakrhngMhNghKdc
 dQxYGwKSUfK7vyAvYHDd6Qb+eA+nQLn+XYG0nqPtIA1q5/1oqNqjRWqC1/+NTBjeuhzaHbHqws0skY
 erL5ZWLM+8ciDgkBD9Bmem1ClaDc1AgPYjafMzLx/FJWeQ0x6RnKYW7+2Mgg==
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


