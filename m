Return-Path: <linux-media+bounces-23739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEA29F70AE
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F329416C4A9
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 23:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780A71FD7B4;
	Wed, 18 Dec 2024 23:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbRPYoQ2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3968D1FD79F;
	Wed, 18 Dec 2024 23:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734563958; cv=none; b=cdXnct1oQgcyPF6ropLhgMTDrag9wvHQvWm9tbFCy2aRiYXKaMZAgFpSnz2q4qyMCwTqriGg/ym9bE8YDkruAThFoo+2CZP5V9IiTuI5odsOQ60tb+LPvFJkCZqrlfTZE3ahFqkSnN6qcrTpA+KI7qZ6CR6LrsFwKoTD2OWXpfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734563958; c=relaxed/simple;
	bh=WEMpS7S8YLtV8CuVrqXEyBFUeVtpaM6wzmJAaXyx4jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r/5hcBiMDTGFTTvOzIHQ/7ZicL06xR7g+eD9cmCv7hSZgNCB85bWFTS2ImIjvVbMYeLemT7hY/acCLqHcv7jnoBvDyzPPEXf+4m/SVk6vKAn/SLdc8BEmFu3EwcaQUfl3rI/zIji8AA6+loBdHvEsfA9HySUXSKOiTjJQEdIdrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbRPYoQ2; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-844bff5ba1dso16792139f.1;
        Wed, 18 Dec 2024 15:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734563956; x=1735168756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/yUNvBrFyhglt7yI6PncD6xcXtPXIh892mCL9SYeg4=;
        b=hbRPYoQ28VIZXxswHfklINpRnLnO3wLUlVyUkKPkoQq1JSvKGCvxR381sA28MFInD+
         3UsQOMoLKGtN0q/HMxHRxCE0nQhbfpKxsS1XrzN380zWM0+8Li5JWWwEYMeNRcEjhGmI
         Y7Yhq/1TEmjZI6TX5lV8CWlg4RQ3BXUuXHdJR3AIpKwRl8Ym8Bjqxw3wHSZrwZ4AiLEL
         aPkUF9XLwLFrDn7dDmcalcGV5F7KvVerEnn8LpHz7yUUk7IQ4Aht3oFBsYssxD//geFF
         mjgGoEGMalJ2ncyX2WSfbg9yjniZ9K8/prAZ3yE3wtfxv5wUyNzptfHCNMPuDzU3e3Yc
         l91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734563956; x=1735168756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/yUNvBrFyhglt7yI6PncD6xcXtPXIh892mCL9SYeg4=;
        b=R2di5OHqMdoM32WDHM5SYp/LBzIiw84HU87soXJIpcnDjFpNxLfzTATrN4TTIidiIb
         eOVf2V8+n2CE0wtpHWlqz2WunsyNm/UXgmeua2+LhokuPnJvNxXFaaN8KkLvcYlITy/R
         h1JUaOvtqhwd6PboivI66s1CV3y064DXIWmOEJBH92k+U6bGPjNDHL6OL/oZ7xtUNe5y
         H8hx1ZLrgqTWv6UKy5Bvjeqr1LN6vAXawCRaJKynulrokvsRkZLY08pqDYxFM5JuzGkB
         b8GQkGFvVzIYqQ9FJkvLxUo+4Qk0XfJstywrehtgQMJs0YB6/98mXoadKN50r6yiIikH
         kFVw==
X-Forwarded-Encrypted: i=1; AJvYcCVRBrJRQ5fjNYWBoEbewnE8DzmxNfHRwV5F8d3toV8WiMeG940/LUYshcs1IC2e275mP9sUs4MUNa/AmlA22g==@vger.kernel.org, AJvYcCVyl3Ebuvr3JcDIDMKkDHNUiADaAQRLrW93ozaSG9PtuAXgr6kyKvvQ3SlJwcPyc88lV8LTNPqT4xnsmlQ=@vger.kernel.org, AJvYcCX359v3pwQg1U6HU3Q+AwEcfA6XOj0HtIG9Srovfs+mLGVMjODJwt6hVG/61H4ei4+Kp96x5xFpvT3G@vger.kernel.org, AJvYcCXMFoc3bP5lKjYiLwLp+r8kFS07D2GyJL59EHbH8W7PR/Cdl4JLGnDYD2DJVpCorw5Rv2KniQfmBswD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3FFw/9VqnLVeQ6wZNIsHp8fz076wf2B8GqVQPjQFU/XdtmKNr
	o2cOozOHqeQ5HdJVkQSRzoqokrFwMlHRgbC+O3FPim5gFjFg+hR1
X-Gm-Gg: ASbGnctByJ8LCsa2vrfZCtCTPdT6+KCqMqnRZbEhPRDSdyO4GVXRbaWc16jPhGlKMqJ
	coQXCq1ebLTimJAYSIy1hOx0hBmTVKYy5y0twltQiffj3EO9YMzRj6F/8bAV42reTNQ0NmB/NIR
	1OoRF3OQwo5KzaCBOGtDHfN0pX74cACN9DPcV+TCDeSHDCdik7zaQyHHwYP+NWt8Vzpf5iqbVG0
	B3fSGNDrHypemlZLsGgr9Cw21tTOA4C+v4Wg1iMop8=
X-Google-Smtp-Source: AGHT+IEx3kHJ8q/BChF479JkIOL0lzv42miin7scM2wSAnVcH35C87RMcHhTGAMECdrL49pMd2ar7w==
X-Received: by 2002:a05:6602:1555:b0:82c:ed57:ebd9 with SMTP id ca18e2360f4ac-847585f2c23mr467500539f.10.1734563956200;
        Wed, 18 Dec 2024 15:19:16 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::eca])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e5e378cce6sm2394614173.115.2024.12.18.15.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:19:15 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v9 3/5] media: qcom: camss: add support for SDM670 camss
Date: Wed, 18 Dec 2024 18:17:33 -0500
Message-ID: <20241218231729.270137-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218231729.270137-7-mailingradian@gmail.com>
References: <20241218231729.270137-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera subsystem for the SDM670 the same as on SDM845 except with
3 CSIPHY ports instead of 4. Add support for the SDM670 camera
subsystem.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/platform/qcom/camss/camss.c | 191 ++++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9fb31f4c18ad..aba2dbc00e82 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -738,6 +738,185 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 	}
 };
 
+static const struct camss_subdev_resources csiphy_res_670[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "soc_ahb", "cpas_ahb",
+				"csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 240000000, 269333333 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "soc_ahb", "cpas_ahb",
+				"csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 240000000, 269333333 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+
+	/* CSIPHY2 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "soc_ahb", "cpas_ahb",
+				"csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 240000000, 269333333 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	}
+};
+
+static const struct camss_subdev_resources csid_res_670[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "soc_ahb", "vfe0",
+				"vfe0_cphy_rx", "csi0" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 384000000 },
+				{ 19200000, 75000000, 384000000, 538666667 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "soc_ahb", "vfe1",
+				"vfe1_cphy_rx", "csi1" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 384000000 },
+				{ 19200000, 75000000, 384000000, 538666667 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "soc_ahb", "vfe_lite",
+				"vfe_lite_cphy_rx", "csi2" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 384000000 },
+				{ 19200000, 75000000, 384000000, 538666667 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
+static const struct camss_subdev_resources vfe_res_670[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi", "cpas_ahb", "soc_ahb",
+				"vfe0", "vfe0_axi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 4,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi", "cpas_ahb", "soc_ahb",
+				"vfe1", "vfe1_axi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 4,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+
+	/* VFE-lite */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi", "cpas_ahb", "soc_ahb",
+				"vfe_lite" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 } },
+		.reg = { "vfe_lite" },
+		.interrupt = { "vfe_lite" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_845[] = {
 	/* CSIPHY0 */
 	{
@@ -2582,6 +2761,17 @@ static const struct camss_resources sdm660_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources sdm670_resources = {
+	.version = CAMSS_845,
+	.csiphy_res = csiphy_res_670,
+	.csid_res = csid_res_670,
+	.vfe_res = vfe_res_670,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_670),
+	.csid_num = ARRAY_SIZE(csid_res_670),
+	.vfe_num = ARRAY_SIZE(vfe_res_670),
+	.link_entities = camss_link_entities
+};
+
 static const struct camss_resources sdm845_resources = {
 	.version = CAMSS_845,
 	.csiphy_res = csiphy_res_845,
@@ -2627,6 +2817,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
+	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
-- 
2.47.1


