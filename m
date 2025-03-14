Return-Path: <linux-media+bounces-28275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE12CA621EC
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 00:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10594421653
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 23:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3942C1FC7C2;
	Fri, 14 Mar 2025 23:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k1K8eDAN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73051F8EEC
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 23:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995371; cv=none; b=enpArAMvUlhOirKm47X6hwehJm1zE4geF0mbL/mNwfJhtjaRi4D3ot3c0E+onsN2ssx47IJoWhtRDiQs5YwMyQ8YKJAJILHciFHEkI2j/GwK0mTxz1RvZfnGfk7SVf09V6kqnLZ3quvoR1X5eqg+3U1uKQhCR1T4IyZ0ci0NRc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995371; c=relaxed/simple;
	bh=yjrH4jBh4ajz1wdyB7Gtn6YC10udzCJcBXOAi0gTSb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uq8mTSRuibs2e6z3iSZ8um0ljbkOQE0QF+21XlqK3DGusF34CEEs1Wu9AR4l2bTrQQXdPilEWtkih5XhseSFnac6OIF/h5B/QJ9YsawGGi2H9SIOkzURtbXXVL3eJHBS6TJY0bItnYvQe6l9ZvaZT/zPnslrXXPAI6WB6n6khJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k1K8eDAN; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab7430e27b2so487474566b.3
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 16:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741995366; x=1742600166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wCNZEmVTo279fNDGNObkwysv19trySmF6d8VmDkTHqg=;
        b=k1K8eDAN5Cn9TAgRgl97teQKxYcHLve4qIvOOwxmJ2JWU/QaUbshwBgiWIz4GryV+O
         ZEXYSCTzubUgfrYSYkaFy4crqSgHtYYbLA9eJPbuBQvJ3RaoVx3Ns8zhWP69T+pupdFk
         k8YZQfDDNTtMK3EEHz50ffApIanXNZ2WerWTssfsnYa9AH5D4Bskz4xk1jZUK9mdW675
         yx55BbXbdPPZ4W6dLXmDMLMU9xIcVbMzSE3W68YPoNtG2cYf1xHiSlBjkK8P7OJXb+91
         yoT0MCSL7l88mWOpHx+cyj/GVZa+v6jgnmBeztGFVyQV0VNP8BTjK0EsAXCUPWE1eGCM
         HwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995366; x=1742600166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCNZEmVTo279fNDGNObkwysv19trySmF6d8VmDkTHqg=;
        b=wbcfJyhAHq7xH7nn+hyimWQSyTQ0E+JMmHTpEsM0BVGn+ZdbgYi0/cZa5JpeCpvfKi
         NBpYYiEug3UlCJ8l60ts5XwJpuvyNGu5auEzs2Lf74rkyuXTlCfM/jm789rlBf1dMRBx
         +UBzeV6PcyvE6j2WlcT7RMxrwN44WkWgptK6lIZusprk39MRPx9xyccL3/j9eevG8hbi
         CTmQvRxjwOmTXgYsqMlktvhNjv6H/7bU4BQw0uo3Pk0iYwd9f5NkRjxsbyBkL/npyTEH
         6oaGeprmNmSWYho17cvEbeZGY3TYGCjsXaZy5SKRWS3dO+b58HYr5aqm3JZ7nRiYLq+A
         iIBQ==
X-Gm-Message-State: AOJu0YyLOEHPXHzt1mNFGMBsuinCeOb7v+HhrnyyYHpRweaq6LMQ2GDq
	SNaXtY5MBJey7fl7h/rREgWAnww34hY+eaXu0u2oI/yyWI6sRO/oQo4b1ZSg2Os=
X-Gm-Gg: ASbGnctRJzNv6JKW8oMEBW+iqH7A/UPo857HqktpK6tLgl0jp7EePAP8SF5j3mzD9+F
	bfBdEFG58Awqza3ijWGOyy/WdLHfiXJYcUsRrpgP0fTMLstjmBgz+ulmnZT7djUyt2brcXGJ/k4
	l2N2T1nAzV9n5KAehK9z26vn3D8dELiMMBlBsxN9rfmwAMw2bC8CYjQ+dbrRIRhPo+xzIE2lXpv
	1UDbEvF5jQu0ja3y6IFAYhbhv+I6kLGfqneTrMuh63lcq4EG+s1y2WtVfcQAVInolrin8fDyyP8
	ip9n95gGQpCiGlQsLYxxG4xJ5DzJtBV4r+Ngx4Yh6VCiCk9U7JdOcbIcejLTys1UVXQqs2oNcag
	Ook4ZHi4oay3LGEm0PtcabdKeBpfxZXgH3ZnNhxSYBx9LFwJMO29cGCgJ9nzyZOfADJ5i
X-Google-Smtp-Source: AGHT+IF4CdIPtvfCg2tkoBvxP9H4XdVVs0KtMKLsJfJm3Bfx7K6E/235iVersooxQs8BAL2Ed5hOyA==
X-Received: by 2002:a17:907:3e06:b0:ac1:f003:be08 with SMTP id a640c23a62f3a-ac330129030mr565756166b.12.1741995365904;
        Fri, 14 Mar 2025 16:36:05 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeadbsm284246966b.29.2025.03.14.16.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:36:04 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 14 Mar 2025 23:36:00 +0000
Subject: [PATCH v2 7/7] media: qcom: camss: Add x1e80100 specific support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-7-d163d66fcc0d@linaro.org>
References: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-0-d163d66fcc0d@linaro.org>
In-Reply-To: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-0-d163d66fcc0d@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

Populate CAMSS with x1e80100 specific hooks.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   6 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 309 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 318 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index d5f717f6215c45908c4fc5a8650d68c00d544db7..f732a76de93e3e7b787d9553bf7f31e6c0596c58 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -749,6 +749,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_8280XP:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_X1E80100:
 		ret = true;
 		break;
 	}
@@ -837,6 +838,11 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sc8280xp[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
 		break;
+	case CAMSS_X1E80100:
+		regs->lane_regs = &lane_regs_x1e80100[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
+		regs->offset = 0x1000;
+		break;
 	case CAMSS_8550:
 		regs->lane_regs = &lane_regs_sm8550[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index cf0e8f5c004a20381e05fc8b67e068282fa08c41..33824d66dba6b887228805b2796dcdc9825af094 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -346,6 +346,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8280XP:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_X1E80100:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -1973,6 +1974,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_8280XP:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_X1E80100:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9da74da679a28070b101df06a8412e85efdcffcc..cbe9c660095da0100b36d4937bee9e13d937a70d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2483,6 +2483,299 @@ static const struct resources_icc icc_res_sm8550[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdd-csiphy-0p8-supply",
+				"vdd-csiphy-1p2-supply" },
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdd-csiphy-0p8-supply",
+				"vdd-csiphy-1p2-supply" },
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = { "vdd-csiphy-0p8-supply",
+				"vdd-csiphy-1p2-supply" },
+		.clock = { "csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = { "vdd-csiphy-0p8-supply",
+				"vdd-csiphy-1p2-supply" },
+		.clock = { "csiphy4", "csiphy4_timer" },
+		.clock_rate = { { 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
+static const struct camss_subdev_resources csid_res_x1e80100[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
+			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
+			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
+			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
+			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
+			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 64000000, 80000000 },
+				{ 80000000,  100000000, 200000000,
+				  300000000, 400000000 },
+				{ 300000000, 400000000, 480000000 },
+				{ 300000000, 400000000, 480000000 }, },
+
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_x1e80100[] = {
+	/* IFE0 */
+	{
+		.regulators = {},
+		.clock = {"camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
+			  "cpas_fast_ahb", "cpas_vfe0", "vfe0_fast_ahb",
+			  "vfe0" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 345600000, 432000000, 594000000, 675000000,
+				  727000000 }, },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 4,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
+			   "cpas_fast_ahb", "cpas_vfe1", "vfe1_fast_ahb",
+			   "vfe1"  },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 345600000, 432000000, 594000000, 675000000,
+				  727000000 }, },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 4,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
+			   "vfe_lite_ahb", "cpas_vfe_lite", "vfe_lite",
+			   "vfe_lite_csid" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 }, },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "camnoc_nrt_axi", "cpas_ahb",
+			   "vfe_lite_ahb", "cpas_vfe_lite", "vfe_lite",
+			   "vfe_lite_csid" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 }, },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+};
+
+static const struct resources_icc icc_res_x1e80100[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "sf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "sf_icp_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
+static const struct resources_wrapper csid_wrapper_res_x1e80100 = {
+	.reg = "csid_wrapper",
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -3544,6 +3837,21 @@ static const struct camss_resources sm8550_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources x1e80100_resources = {
+	.version = CAMSS_X1E80100,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_x1e80100,
+	.csid_res = csid_res_x1e80100,
+	.vfe_res = vfe_res_x1e80100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1e80100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
+	.link_entities = camss_link_entities
+};
+
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
@@ -3555,6 +3863,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
+	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index b284b910ce421c98df5e77f942f82486342bfcec..63c0afee154a02194820016ccf554620d6521c8b 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -86,6 +86,7 @@ enum camss_version {
 	CAMSS_8280XP,
 	CAMSS_845,
 	CAMSS_8550,
+	CAMSS_X1E80100,
 };
 
 enum icc_count {

-- 
2.48.1


