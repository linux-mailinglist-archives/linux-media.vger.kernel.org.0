Return-Path: <linux-media+bounces-23122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2609EBF68
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 00:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8175E167485
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E700B21129D;
	Tue, 10 Dec 2024 23:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQvPY8LF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928041F1932;
	Tue, 10 Dec 2024 23:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733873757; cv=none; b=JpnQePd22O8092BAUb2h6G07lOa7nWuee+rIdE8WxkuQia6Zf2rJZRwqnmS1eSgIV/Ae5rrkNgpUYic72vs8pfJokOULmVZJ5ZfoDbYmsZVfoacRsYEIe6baqD6ezRJnTUL6YbXcrwClgEsFZN0oZjICEgzRPor8Es3OyoZxOvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733873757; c=relaxed/simple;
	bh=zpb1PukpUEAT2rRoF32/BvqI9/iIDz2atx+JmRnxKk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9HVS1gEcpm/0a25dkcbcix0aBKEijQLvgCeRpTs1DbtlixHxtSJm4HUkfBUjtEHEVXvYPjKXEC3ubmX/czzrT0w7b3N3QUf8btKiQO15yIbqVubNAF8U4gacEmqbKlBEIkgTW6GRM7ZEUuxEKV0mUT5bNizr/oaAsYy4yQESFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQvPY8LF; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4678afeb133so329101cf.0;
        Tue, 10 Dec 2024 15:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733873754; x=1734478554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBXhqjzZSTDhZeWofLNy730iza/n5rBi0iwRihxEpGg=;
        b=NQvPY8LFwyDZ6W5iAIx3spcRqrhluG/F2VLoo7wt9DVFp/2OyIhsikCOiX42WneZBY
         r8qGsfY0IpjACM9XXtGiulKO8DMcdCTCBIa365B/P0vkqg8rUvIPGXTDJgpvo/UPz0BF
         dWYJFcGGetjMNMBhgGim5hBUT/B1J2mGTnPPnM+eXW7LKU8+ZUPVfevk2Ts2sSXr/UH5
         W+yirnkmpjUpOjkRX6JdS4ZzQEgmZHHCHTaHDLestAd0ctBJnPsUrEHFIE8eiJAOGEZN
         71cRzwhQYdIPTwTkrPJH6X5Vw7P1xsBa3QiOSfCG5Gs0L/jpPl9T3DP8M4+WgW1tenNn
         8QuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733873754; x=1734478554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBXhqjzZSTDhZeWofLNy730iza/n5rBi0iwRihxEpGg=;
        b=DTPzuFUAAAGauo1vcsjjWkvsjoXpZ5CquzMzN9EUD0iM+ilYFA6yEK7h5p1hVoc4c1
         5ICVqwpsvT3bJ4kBjwzNhQMRpBrn3vs1fl4MpTiBuqr7/k7j8Xw3XSdtPDWy//B0/aM0
         /9Ilo/+DBbQa7GwkUpeOqUtuu2ChvACpSWLuLmh6KiAhgrgzy4bK3Oir1uJ5jGzIY2ya
         tv7bHup8kWu7HCrAN7NttRvfgVfHHjU+uPVGn1rQFwtb1MOpueFaIsQ+E63B2q55aPY4
         lJj9+sowzaySSCP/tMksaDJ00aElYqgIJlzRwpGtov468UUba8cx8em3KDMXABMRcxXp
         T6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUzMBJblqaZg0f8GvTQqkBtw63eJIT948mtTOUqyx8gcSB4zEuAxpbRYtsTyQmf2V2qF4jmC1FhR7iV@vger.kernel.org, AJvYcCUzYAgj1MGXyskNLAKsC4dEK7Y3uck8HHSQcC18BeWgYN43dcsPDkuk4DPquKNGnq5s7PRD7ZHAyXS1MG0=@vger.kernel.org, AJvYcCXBeXMSytymulAU6F8PsI9YajMLqo0NuDzqK3Gtjd8RGNT4amyyf+jMJFFIjDqnF2DPEuRFFkY1MfRg@vger.kernel.org, AJvYcCXWdaRisFUaeTco0bZ8UPmt6JhmAf44N5Z+yeUiFz9YhNjPITSmPwq2hV5/C6lIPPj5kSDaSRfKri2VkOtMeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP3XXgydqWKZSrBCcwed84JaI0005t72/HHjCktGZspZ2IM3Tl
	TcSKN+XzmIUPsAwQPbV8U1VVKWUXKTwzL+YOMRqp1xx0PPG1sKHM
X-Gm-Gg: ASbGncvV3h0duM1YEPLYY1H0ud7NOsmXvRRgAP1ttlYflVpqlyVWTxfaQinEjdNIi2i
	swH/Wa6QiU3wnMPNCb5hxIM4XamoG7LzPLYsFhb+8WDp87TU79/tmri+VfHuD95ydrQNd30AlST
	0qTH90YfdPQKQVerdVxXoNtPl0fgcHyF7fhcwBbVYUtkAyKb6hEeg+SDm0L0dk6tyRJWRDv/vuo
	iVYolEvcifotJyMUcTtG0pWComeVdivqC2tc2fvGw==
X-Google-Smtp-Source: AGHT+IEFZ2nvfhqQGxGE7Tq7fp1+cOhQ836nNcKT+3A0E3FqoIMS2YKWHfeUBaWjUFLwUt0kUAbUiQ==
X-Received: by 2002:a05:6214:528e:b0:6d8:b733:47c with SMTP id 6a1803df08f44-6d93531a29cmr10433446d6.22.1733873754540;
        Tue, 10 Dec 2024 15:35:54 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::6d3f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8edb76ce7sm51717786d6.90.2024.12.10.15.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 15:35:54 -0800 (PST)
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
Subject: [PATCH v7 3/5] media: qcom: camss: add support for SDM670 camss
Date: Tue, 10 Dec 2024 18:35:38 -0500
Message-ID: <20241210233534.614520-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210233534.614520-7-mailingradian@gmail.com>
References: <20241210233534.614520-7-mailingradian@gmail.com>
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
index 9fb31f4c18ad..389b49606be0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -738,6 +738,185 @@ static const struct camss_subdev_resources vfe_res_660[] = {
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


