Return-Path: <linux-media+bounces-19372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3485999A98
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 04:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4BAD1C24521
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 02:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F571F4FC5;
	Fri, 11 Oct 2024 02:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQ2FuDv3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F041F4705;
	Fri, 11 Oct 2024 02:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728614265; cv=none; b=gs6tajRpcclrsZJRmIvcDV11ogUUWBymc3ZAKfVx3ZYS4A+P2xQX1kFfrzGvm6vOsNmN+4DZP5apXlRqtVow1Uj3a6+5LAwCDyrSsLZ20Av1OCEDRDU2cf5aM1Fi+jSPdS5mLtAw94UknzjW8gmHJRJZq+2AK/pJJuQKIvXV6uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728614265; c=relaxed/simple;
	bh=QN4MBFEZOLzvPC2Qyq1NvXhktKWw+B7Ivl/4rFoVMh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lbwVPY5pzpEyDzVDtbsXQ/9YF/vr1FwF+76vG/nAl3/Ztf7fZX6nzprVR4w7097HBR7pAspGNgXn5a54l/CYR5OZAXf7tUWcs6+dd7VKQ7ZCQaoYQpMjmU3I7MwcScp8RgXT8VjyFvoUndCT/tyKOwVouCHxohR8ImFicJl5KBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQ2FuDv3; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6cbceb48613so10259476d6.2;
        Thu, 10 Oct 2024 19:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728614263; x=1729219063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXMm/arYkHMi5r3l8Xx2ZjY/5qj1z8qRgxCdBYIJydI=;
        b=UQ2FuDv3m/tx5y+j+D//vuLn55KBvq7Wh5iXjpFbn2DZcbDiaM6Nq62segxmBFZkt1
         SS62kr2zdfYkTNdDpXyLrI+kLO30daiAWl1X2WdEWwpVjxTcmgfUySnDD2J60jwyoWy+
         2L3WLOCPwd4tDDmR5tAwO/VTZ0HyVl1DY0kb1roVrDxoP0RJfC06/eb62J0m+Lj/XmxR
         DHIYKUINDboqv5AJhtDkB2n9UIQC2VJjV2PqFU7RVqBfeGJftvk28nzIoyvPwgjBbLZh
         DRtgzih1oRXNJxNU7OGzSOTLZPrZaNCN/d1D0dKUnX3wCFgKiT2LV6/PJeZFTjfnajkl
         ARQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728614263; x=1729219063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXMm/arYkHMi5r3l8Xx2ZjY/5qj1z8qRgxCdBYIJydI=;
        b=gJZN27sJnsE7DSK9gCQOmSqo5CD0MGvn8IhsPPA55RKwnU0bTXMYuy5DVQEiw7gsQW
         JAkJ62nymoqCIFlBkgq3s8qJN7YUwL/Y7f1y9oP+HqufnjDTXAFHVk7IO2htE9qAiUBq
         N4rKuwjMAnRuRj0X3abZgsVmYz38CKLMUvhw+8LGkSWI/bKe+avpJst0pBbjnb+k3CKc
         IxfvLD6+6b7e5M4ex5RextuQcYSCrL9LXjDPQ+8Jla7dlXGtRo3qQNt2EoByDxHhe32H
         SYgAIM5MD98KuxQB9GzsjPHyfz1iHYtAUm5YjNRk4gUTperKAQF2RGomD+zFl+7TV0vm
         djBg==
X-Forwarded-Encrypted: i=1; AJvYcCUKcExFJNxlb60/C48GDRe0yqJO9CI1tV8rDJrVl7sG8IDnGWlW8X99kpruR/lrp4+zgG2mK3TFA01fkR0=@vger.kernel.org, AJvYcCUzkN3YRAzk2PMJDBHG3mNfDUydPt7vlewdFNK0ZV76osCeolQaF+kWBmcgPjbMRbPh/vt/p+VyglnKMmzxoA==@vger.kernel.org, AJvYcCVk8OX1+g77QPA7ncwYXu/3umeEO/vykgG8OBjVgStpVuOEzFOInkIGuAFfRAkfApukmapCjE/17pd6@vger.kernel.org, AJvYcCVwkEvhQqj4QedIjkFotROkOmpLX2k7+4/7t6Am8/wZtjFzQ7XC1EZX+jXmVr1x1aYTJL9XIfVOoNK6@vger.kernel.org
X-Gm-Message-State: AOJu0YysyrvBh6Ls9GUv9dJ759TDrrlownoReAp9LQQ38PqE7LKo+zir
	UBIk+K/yyoK4a0V2x56oL2eHpFL5EJtD7JgRKdZFydkVa3xVzL1j
X-Google-Smtp-Source: AGHT+IFrNIErB5b1t6Av6dnkmWH+LuSQTiSFLZtp26/V8QdRh2AbmVwG+KQIonx/PPYaAj4gJnqynw==
X-Received: by 2002:a05:6214:3a05:b0:6cb:c83e:3f98 with SMTP id 6a1803df08f44-6cbf0100329mr14263896d6.43.1728614263109;
        Thu, 10 Oct 2024 19:37:43 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::786d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe85a5b8asm11572486d6.14.2024.10.10.19.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 19:37:41 -0700 (PDT)
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
Subject: [PATCH v6 3/5] media: qcom: camss: add support for SDM670 camss
Date: Thu, 10 Oct 2024 22:37:28 -0400
Message-ID: <20241011023724.614584-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241011023724.614584-7-mailingradian@gmail.com>
References: <20241011023724.614584-7-mailingradian@gmail.com>
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 191 ++++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d64985ca6e88..4694f5219654 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -584,6 +584,185 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 	}
 };
 
+static const struct camss_subdev_resources csiphy_res_670[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {},
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
+		.regulators = {},
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
+		.regulators = {},
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
+		.regulators = { "vdda-phy", "vdda-pll" },
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
+		.regulators = { "vdda-phy", "vdda-pll" },
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
+		.regulators = { "vdda-phy", "vdda-pll" },
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
@@ -2404,6 +2583,17 @@ static const struct camss_resources sdm660_resources = {
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
@@ -2448,6 +2638,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
+	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
-- 
2.47.0


