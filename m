Return-Path: <linux-media+bounces-25664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56332A2830D
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 04:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9D0A3A5E89
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 03:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C78214A7C;
	Wed,  5 Feb 2025 03:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HICBXn1D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5972135A5;
	Wed,  5 Feb 2025 03:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738727434; cv=none; b=Lrq5MyMZILu9sS2otwbaYaoQFlJtTw1nmJCmKE73J8CXnH9pgAhwLhVkb5rTZPnDWA7tqd0z6gthMfsuaEpQNJ34SYztJ9AG+cirBIIqti/MOgJmKC+ncDpe/wqSSs7ZddYVYR0mevV70PfvuqX1ob6sEtRVhQwAaLehYiZOTwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738727434; c=relaxed/simple;
	bh=0Om2YIQFs581wA1HsyRpOsUzhXyO0IR32976rjuEwTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m4jkSzqqE2sgVnN0Dpt1Ch4oq4Rl17/tzXMDgCoEKbi0ASC6QPvgEFQ/a+VX3/JsTzNoz/fUaYatIWxEQVuAysc2qNNo7Y/rA4U4SQU8Ek3bnprC31ItaHMkuzEuSLFZVk3aYNNh6ahWVYD+Btfuqlkkkw/JDxXtsvYoRRgiius=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HICBXn1D; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6df83fd01cbso27255996d6.2;
        Tue, 04 Feb 2025 19:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738727431; x=1739332231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmsbCOGbqCAY2eAJZpArPXdp6JVhZT+KU7O6htYHkxM=;
        b=HICBXn1D1hWlmcyKsPmt4V/l9QSx7Iipl3L3zMlxShmWDrDDqm+cH4cuLGezr+bAj2
         Do6I78/WJQbMhX+SASFOo813rsIGE+0YtJA0Ehj5u5aSCH9dHOYv1eVqsdrs6C4KNCVI
         V41tSgKyYP5YiJPfyfFo20f7VPrKLakuXGg7jhmc1deGAfDHvG5BlI7L4ft2fMv/R/dz
         QQQweuLAG76vrmGMM026t5kqQLm1N15kuHbVfB40w+4qi1VcNKCmo9CgN1lZRe7zsopN
         k0E0/yQkiRlxRMpGmuoURTnLOoZ/SxVbLCrisrEyz79bOwyk6ZDXEM5KY8oA7gv+JeDs
         f0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738727431; x=1739332231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmsbCOGbqCAY2eAJZpArPXdp6JVhZT+KU7O6htYHkxM=;
        b=s3hwEGq8ZDfVWknITdZ8k5ZhOQ4SSdOz/p5WU/GDSqu7HFoqDtGzXOQ4CiXfkgx5Ha
         jcK2zbUZgHkfWBEERXUxYZg+0c3qy6dEEkfKo+eyQf0LjmATkNzT/dzWprHZBW9DqWMY
         ukKysgFhh1Vga5syrMjdNvR/wDtpK1e9NlfCEsewwFLyGv0lULlcK0jQSFPkrifp9rUV
         xoD6999vkYUBJip40JA+dqCw6W+ZYqFxeaZqxRpqtaiZFALIMJsh0bQEO+l6Pa2YXTGU
         Q5m+ggz9y/5P56sHe++dka1AgWXP1q7TWyDRWxBEgrkCkoHA6jvoknKDVJTXRTRvc85/
         vYkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk/qWPUrNSz+JJC0uT19ZnCndenT96hzrZEInMb4Q80ZfTElz7H37ExeW60JLfDgXLNhqFANgDqrdk@vger.kernel.org, AJvYcCW+4gOpLL8ujDRodJX362yCB+qc9sRhM710Q82eQSCGjZV5uOTaWpPelk3YBu6t+qFl4JiD7uJJ8YqF@vger.kernel.org, AJvYcCWPHa0zSNajDWnfIvMtoyOunY05SNVRSDPjfzDTLv5VyvSbFsdcnZVPDbJ2kHZi/dSsCbOWvnx/y85Za1qzwg==@vger.kernel.org, AJvYcCX3sxGIR9/FIIKefFliqS27J0wtBDcvmseuiMAZwyaH6qSnZ2A/T66fX6Juuzychyi01BUZ7pYkDDVlugY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxis/Z+xhX/OCKnPtZ11AqgMP2tiZQ8qoI+XzPNj+I2hIiVL0xN
	zvWABdxyFT0+65VAPI5vUEef+NR6bODnMCYp+4QvSinaHuL/5T8D
X-Gm-Gg: ASbGnct3xpIvsfqGo0fxl5CvZG6laAFWyiJFGH7X260s1McDMPFdblxQx3JAidF6o6M
	J/PxGjX+ApMd3kSt8LRez2im2rPtZ4nytZkyw2KXKRF46st8BNnnH1W9fatSsb08IUfCn14RrGs
	UYS9mZ+FF1AkFkO+AVjor0szOLw0iIM32mlWcNHmTQqaBZpjHqoJyTufKrzWy6gseK3l2EZezff
	ZoB/DA4L2t4Y9eJ0e70WXMi8bMacvL8R8MIz44QSrCJJ3Lsnpi9kiylhGy7AI+SL15EbIfvVLez
	F7I=
X-Google-Smtp-Source: AGHT+IEGifj8z5h2nRCd/tX6KsYw+a0NSaMXKqv9BA2N03w2LNYJq6+NBdOShIdbwZSWqQM2TllG8w==
X-Received: by 2002:a05:6214:458a:b0:6d8:b2f2:bccf with SMTP id 6a1803df08f44-6e42fb6b57emr23415796d6.1.1738727431250;
        Tue, 04 Feb 2025 19:50:31 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::2692])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e254941fbfsm69435776d6.108.2025.02.04.19.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 19:50:30 -0800 (PST)
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
Subject: [PATCH v10 2/3] media: qcom: camss: add support for SDM670 camss
Date: Tue,  4 Feb 2025 22:50:16 -0500
Message-ID: <20250205035013.206890-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250205035013.206890-5-mailingradian@gmail.com>
References: <20250205035013.206890-5-mailingradian@gmail.com>
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
---
 drivers/media/platform/qcom/camss/camss.c | 191 ++++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index a85e9df0f301..a4616ca32076 100644
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
+			   "csiphy0", "csiphy0_timer" },
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
+			   "csiphy1", "csiphy1_timer" },
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
+			   "csiphy2", "csiphy2_timer" },
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
+			   "vfe0_cphy_rx", "csi0" },
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
+			   "vfe1_cphy_rx", "csi1" },
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
+			   "vfe_lite_cphy_rx", "csi2" },
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
+			   "vfe0", "vfe0_axi" },
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
+			   "vfe1", "vfe1_axi" },
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
+			   "vfe_lite" },
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
@@ -2898,6 +3077,17 @@ static const struct camss_resources sdm660_resources = {
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
@@ -2959,6 +3149,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
+	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ }
-- 
2.48.1


