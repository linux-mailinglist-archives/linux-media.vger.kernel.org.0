Return-Path: <linux-media+bounces-37490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B5AB01C8B
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 14:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E31A3AFF94
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 12:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF412D29B1;
	Fri, 11 Jul 2025 12:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iQYQg+wI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397D12D3A9B
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 12:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238688; cv=none; b=HscatiK74wMrmtzdWdQ7O9DcKW7eXr8440hh8Fq344IJ1T6u6hCBhZZAYBzy8QLakSzyiSA52fkOtimKfKdfhkoC/+R3yV+47DANe+Ld6EOmtA1h5jFPKVWVe8KNOiuwv7zmooPve0qRcDSS/bcjHg+WlfjCMNzvHjmq4Dh2doI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238688; c=relaxed/simple;
	bh=To9B79pjzTs97+rwcXFy/RcluLp9uY/YJ8eCnN9bojk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLiYNMn+WM0ketJOnYOs5a9R5T/+6Kt8KYgmWQluBlHNuuj5VJHY9TKlWD0DJ7mqh6UGj4LL3h7nzH4H2D2bfwuAoCnLiB7MIDCxpDIfRUBgaGJ+8D7G866wi5l/GCLiltLlIUCkfVsdrQwChTV56FIdiKwmgmcq5nSTTNTf4y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iQYQg+wI; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso1242362f8f.2
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 05:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238685; x=1752843485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxOV0p0KBFjfV7FvPLfaV0BWlnIbJTZsmWur+IdWrfU=;
        b=iQYQg+wIJAjC0Nc9h2G2dbg5JXg5J2kJv5TmeEEu4xjVwbOmG26i07ah7jU4sr1dN0
         N+xndZ4hbXlXFWOt+/E0gYBCFNkhW9a/OiGNu1rwM+oXbCAcR/hu+gnEFqaiecDpHr0T
         Fk04CBXVpKLVbqpQBNxID4/COX7vuQ43PCFeb8qy4qQcobW6Wle5Mgsfo3Zn5cqn6J6d
         BoWb3aE/7tEKrEUQOUypgRzPMhf0vhaxI3iqysWcLrT28taM4Wvc+wXFIzV9etOUgaKc
         AQsh2x6hjpfcRuq89p9L/ryljKBGQkzPNntpQkOpG2CQV5vC2+hNCWKWr2pI8i+0VSCC
         0GQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238685; x=1752843485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxOV0p0KBFjfV7FvPLfaV0BWlnIbJTZsmWur+IdWrfU=;
        b=siRlDJXRf3UycK3O34xTIKLPUxJVOwts4HO/sY/DuFWev+otemSLJ0sggHDTcUNUlT
         3VVF2bSlkJuSNO7eclvmkK4c8inTP9yEB3x+1HzzdPHxmShsisUOxKPRi/iq7ZWYG3w5
         JU1PkwNb+mdkVz3aMiECTOR4ZX3kMbkH6xUkyTdr745MzCDE9fm4P8kYxh0/7rTpftC/
         ig1BLn/rb/I4N5cZMLRRbn0sgvBwMQ7n9mIbgjFtyngBVhpvi1gdtKw/mFHGyduv9ekm
         EHQj19owDBgVRssqUaMouDajuiuajJ2zWE4g4l7k/PGjVH+TeVAbSaRx0DG7pEsmvgid
         q8Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWYhXdoB4eVfJyPt3fse8TKAOvJ4oGA9c3wljhC3DVBTjHBkFA3LRZt5cpWQc9GQwJepIE59GOYIu7nlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz191oemlx8XgcLMnVFs04H9rt36LFJdjtsyr3jLwPvmyePyiuN
	Hwe1VDGsolXVcHMKIymvrPQ7+oiAtRlmGBjNYaPDJpx+wK88iGVPivgdNC8Ho1axO1E=
X-Gm-Gg: ASbGncsJu4u0eqyLB8pqTXQq6Q956sb+2QYXx1jwVdErki1xksOwhOM9GKWda3/QPvN
	GliUPfXZgMnidgwg0NVaqGMLiU94YwJUh/NfhzqztIDUycVWkt+XAAfeUPrLr3wP/gDr7sANhMn
	x9buHvT4JX86ipGBvJrpCNK3r+c5nBwQtBOmT7X9771hrxvI8Cvz/FqMQ//HtTrYgaERdXycMet
	Cbw3qWYGCsjPOZCI+QacgDk4x2I50C+uskJaMi/ISin842vtXrloEpbMnFFFo7FVkviWVdINqyx
	KdXRnPhVtB8nwGP1lmeo3P2kS4jv4z9wb0WXY/dJ9NCSrrvpVjWzSBCB6urPxoVouFV85NNSaGl
	2d0At9CLOsb4jv9rBLi28Kniq1MIG6tfvJJVl+YxlVzjMzrV1/ejfrdhgsU3jc4BigppmCeQU8B
	A=
X-Google-Smtp-Source: AGHT+IHPs5XgXVmwdYoggiTA87bB+BBoPr06nFNeitT493zwuTyRqw4TpBu6ZSlMPQzZN3G0gatZWg==
X-Received: by 2002:a05:6000:26ce:b0:3a5:1410:71c0 with SMTP id ffacd0b85a97d-3b5f35783a0mr2076333f8f.38.1752238684539;
        Fri, 11 Jul 2025 05:58:04 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:04 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:57:56 +0100
Subject: [PATCH v7 04/15] media: qcom: camss: Add support for PHY API
 devices
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-4-0bc5da82f526@linaro.org>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14021;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=To9B79pjzTs97+rwcXFy/RcluLp9uY/YJ8eCnN9bojk=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpTuQdzeSX492loN7vBsSIGRl2bfnqreLHNi
 D/ytAF5KqyJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKUwAKCRAicTuzoY3I
 OnpSD/9NrnHXBgB9/zf6EuCVaYdmT2pChkIy1kya3VNMrgH/7roF9v+7/oWbWzYc+sx42DMy3tO
 bSGdmIYvv23HT5JQwD8oS8fqM5DAGv8gQsASpbTqwLIMKQ0eTuNHEy2Ube95U3LUkU4JKnDImC5
 6B8P8NJ3I6tzdYWlLH/+ocr0HJEJG0kyVtMJip2NQnWRsttC13uGpVqIJSmoc4fk/Pmqs8hHppK
 Vxup5uczZBcagMrsWjUpsclt80mGCFsMiC+FcARVag1zIJo8u3gssuRZMIDIPkrCsaPPg+5n9Do
 ViymBauE+uPJX/GO/ntWl0Ec64ztpsTWxUUQAtr+3uHFKDLAa3pY7VAwMS1kWkIAFB1DIlkQ5S2
 cYM/L3EsH75uTTrwinKqp8p4+ndp4Eh+pcMjKaZzcfDOA0Zvw5u669GBLlYv0vIrpyJCsLPa43g
 tLGbpDguTAy70xRwV4haErGysoVcU6KR6rxFSAe4agKCZPQRdj98PO+6pahh6AumYzGzML8vsDu
 WFvjdkpMBVbB+B8mhHYnpJNIQKmUjN9lQgaJM3j8py1dnFBkipa//y8MmBd385x9MO/oxyfBIvv
 LPvFFUpp5GfukWo3cJ9gpn+I6VqB8dfP4bmFZ0V5KlrYapAP5r3aWxHtPFfW0P4M42Bz5KYp0Qc
 AE1DT09VcAumTrQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the ability to use a PHY pointer which interacts with the standard PHY
API.

In the first instance the code will try to use the new PHY interface. If no
PHYs are present in the DT then the legacy method will be attempted.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Kconfig        |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c | 157 ++++++++++++++++++++---
 drivers/media/platform/qcom/camss/camss-csiphy.h |   7 +
 drivers/media/platform/qcom/camss/camss.c        |  56 ++++++--
 4 files changed, 194 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index 4eda48cb1adf049a7fb6cb59b9da3c0870fe57f4..1edc5e5a1829e033812bbadfa0de00625fd0c93a 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
+	select PHY_QCOM_MIPI_CSI2
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 2de97f58f9ae4f91e8bba39dcadf92bea8cf6f73..185a51aa73d102b9555e550d8041c25c8adf9af8 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <media/media-entity.h>
@@ -131,10 +132,10 @@ static u8 csiphy_get_bpp(const struct csiphy_format_info *formats,
 }
 
 /*
- * csiphy_set_clock_rates - Calculate and set clock rates on CSIPHY module
+ * csiphy_set_clock_rates_legacy - Calculate and set clock rates on CSIPHY module
  * @csiphy: CSIPHY device
  */
-static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
+static int csiphy_set_clock_rates_legacy(struct csiphy_device *csiphy)
 {
 	struct device *dev = csiphy->camss->dev;
 	s64 link_freq;
@@ -200,7 +201,7 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
  *
  * Return 0 on success or a negative error code otherwise
  */
-static int csiphy_set_power(struct v4l2_subdev *sd, int on)
+static int csiphy_set_power_legacy(struct v4l2_subdev *sd, int on)
 {
 	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
 	struct device *dev = csiphy->camss->dev;
@@ -219,7 +220,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 			return ret;
 		}
 
-		ret = csiphy_set_clock_rates(csiphy);
+		ret = csiphy_set_clock_rates_legacy(csiphy);
 		if (ret < 0) {
 			regulator_bulk_disable(csiphy->num_supplies,
 					       csiphy->supplies);
@@ -254,7 +255,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 }
 
 /*
- * csiphy_stream_on - Enable streaming on CSIPHY module
+ * csiphy_stream_on_legacy - Enable streaming on CSIPHY module
  * @csiphy: CSIPHY device
  *
  * Helper function to enable streaming on CSIPHY module.
@@ -262,7 +263,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
  *
  * Return 0 on success or a negative error code otherwise
  */
-static int csiphy_stream_on(struct csiphy_device *csiphy)
+static int csiphy_stream_on_legacy(struct csiphy_device *csiphy)
 {
 	struct csiphy_config *cfg = &csiphy->cfg;
 	s64 link_freq;
@@ -300,6 +301,63 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 	return 0;
 }
 
+/*
+ * eam_off - Disable streaming on CSIPHY module
+ * @csiphy: CSIPHY device
+ *
+ * Helper function to disable streaming on CSIPHY module
+ */
+static void csiphy_stream_off_legacy(struct csiphy_device *csiphy)
+{
+	csiphy->res->hw_ops->lanes_disable(csiphy, &csiphy->cfg);
+}
+
+/*
+ * csiphy_stream_on - Enable streaming on CSIPHY module
+ * @csiphy: CSIPHY device
+ *
+ * Helper function to enable streaming on CSIPHY module.
+ * Main configuration of CSIPHY module is also done here.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_stream_on(struct csiphy_device *csiphy)
+{
+	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
+				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
+	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
+	struct phy_configure_opts_mipi_dphy *dphy_cfg;
+	union phy_configure_opts dphy_opts = { 0 };
+	struct device *dev = csiphy->camss->dev;
+	s64 link_freq;
+	int ret;
+
+	dphy_cfg = &dphy_opts.mipi_dphy;
+
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+
+	if (link_freq < 0) {
+		dev_err(dev,
+			"Cannot get CSI2 transmitter's link frequency\n");
+		return -EINVAL;
+	}
+
+	phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes, dphy_cfg);
+
+	phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
+
+	ret = phy_configure(csiphy->phy, &dphy_opts);
+	if (ret) {
+		dev_err(dev, "failed to configure MIPI D-PHY\n");
+		goto error;
+	}
+
+	return phy_power_on(csiphy->phy);
+
+error:
+	return ret;
+}
+
 /*
  * csiphy_stream_off - Disable streaming on CSIPHY module
  * @csiphy: CSIPHY device
@@ -308,9 +366,28 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
  */
 static void csiphy_stream_off(struct csiphy_device *csiphy)
 {
-	csiphy->res->hw_ops->lanes_disable(csiphy, &csiphy->cfg);
+	phy_power_off(csiphy->phy);
 }
 
+/*
+ * csiphy_set_stream - Enable/disable streaming on CSIPHY module
+ * @sd: CSIPHY V4L2 subdevice
+ * @enable: Requested streaming state
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_set_stream_legacy(struct v4l2_subdev *sd, int enable)
+{
+	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
+	int ret = 0;
+
+	if (enable)
+		ret = csiphy_stream_on_legacy(csiphy);
+	else
+		csiphy_stream_off_legacy(csiphy);
+
+	return ret;
+}
 
 /*
  * csiphy_set_stream - Enable/disable streaming on CSIPHY module
@@ -568,16 +645,16 @@ static bool csiphy_match_clock_name(const char *clock_name, const char *format,
 }
 
 /*
- * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
+ * msm_csiphy_subdev_init_legacy - Initialize CSIPHY device structure and resources
  * @csiphy: CSIPHY device
  * @res: CSIPHY module resources table
  * @id: CSIPHY module id
  *
  * Return 0 on success or a negative error code otherwise
  */
-int msm_csiphy_subdev_init(struct camss *camss,
-			   struct csiphy_device *csiphy,
-			   const struct camss_subdev_resources *res, u8 id)
+int msm_csiphy_subdev_init_legacy(struct camss *camss,
+				  struct csiphy_device *csiphy,
+				  const struct camss_subdev_resources *res, u8 id)
 {
 	struct device *dev = camss->dev;
 	struct platform_device *pdev = to_platform_device(dev);
@@ -715,6 +792,43 @@ int msm_csiphy_subdev_init(struct camss *camss,
 	return ret;
 }
 
+/*
+ * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
+ * @csiphy: CSIPHY device
+ * @res: CSIPHY module resources table
+ * @id: CSIPHY module id
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int msm_csiphy_subdev_init(struct camss *camss,
+			   struct csiphy_device *csiphy,
+			   const struct camss_subdev_resources *res, u8 id)
+{
+	struct device *dev = camss->dev;
+	int ret;
+
+	csiphy->camss = camss;
+	csiphy->id = id;
+	csiphy->cfg.combo_mode = 0;
+	csiphy->res = &res->csiphy;
+
+	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d",
+		 csiphy->id);
+
+	csiphy->phy = devm_phy_get(dev, csiphy->name);
+
+	if (IS_ERR(csiphy->phy)) {
+		dev_err(dev, "failed to get phy %s %d\n", csiphy->name, ret);
+		return PTR_ERR(csiphy->phy);
+	}
+
+	ret = phy_init(csiphy->phy);
+	if (ret)
+		dev_err(dev, "phy %s init fail %d\n", csiphy->name, ret);
+
+	return ret;
+}
+
 /*
  * csiphy_link_setup - Setup CSIPHY connections
  * @entity: Pointer to media entity structure
@@ -749,8 +863,12 @@ static int csiphy_link_setup(struct media_entity *entity,
 	return 0;
 }
 
-static const struct v4l2_subdev_core_ops csiphy_core_ops = {
-	.s_power = csiphy_set_power,
+static const struct v4l2_subdev_core_ops csiphy_core_ops_legacy = {
+	.s_power = csiphy_set_power_legacy,
+};
+
+static const struct v4l2_subdev_video_ops csiphy_video_ops_legacy = {
+	.s_stream = csiphy_set_stream_legacy,
 };
 
 static const struct v4l2_subdev_video_ops csiphy_video_ops = {
@@ -764,8 +882,13 @@ static const struct v4l2_subdev_pad_ops csiphy_pad_ops = {
 	.set_fmt = csiphy_set_format,
 };
 
+static const struct v4l2_subdev_ops csiphy_v4l2_ops_legacy = {
+	.core = &csiphy_core_ops_legacy,
+	.video = &csiphy_video_ops_legacy,
+	.pad = &csiphy_pad_ops,
+};
+
 static const struct v4l2_subdev_ops csiphy_v4l2_ops = {
-	.core = &csiphy_core_ops,
 	.video = &csiphy_video_ops,
 	.pad = &csiphy_pad_ops,
 };
@@ -794,7 +917,11 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 	struct device *dev = csiphy->camss->dev;
 	int ret;
 
-	v4l2_subdev_init(sd, &csiphy_v4l2_ops);
+	if (IS_ERR(csiphy->phy))
+		v4l2_subdev_init(sd, &csiphy_v4l2_ops_legacy);
+	else
+		v4l2_subdev_init(sd, &csiphy_v4l2_ops);
+
 	sd->internal_ops = &csiphy_v4l2_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 895f80003c441dcacf98435f91567f90afa29279..48398c331fe1481d32bd29d03410e85b03f0f7aa 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -12,6 +12,7 @@
 
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/phy.h>
 #include <media/media-entity.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-mediabus.h>
@@ -94,6 +95,7 @@ struct csiphy_device_regs {
 
 struct csiphy_device {
 	struct camss *camss;
+	struct phy *phy;
 	u8 id;
 	struct v4l2_subdev subdev;
 	struct media_pad pads[MSM_CSIPHY_PADS_NUM];
@@ -101,6 +103,7 @@ struct csiphy_device {
 	void __iomem *base_clk_mux;
 	u32 irq;
 	char irq_name[30];
+	char name[16];
 	struct camss_clock *clock;
 	bool *rate_set;
 	int nclocks;
@@ -115,6 +118,10 @@ struct csiphy_device {
 
 struct camss_subdev_resources;
 
+int msm_csiphy_subdev_init_legacy(struct camss *camss,
+				  struct csiphy_device *csiphy,
+				  const struct camss_subdev_resources *res, u8 id);
+
 int msm_csiphy_subdev_init(struct camss *camss,
 			   struct csiphy_device *csiphy,
 			   const struct camss_subdev_resources *res, u8 id);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c8103f8b754a29a63e32bb7bc213bfe14b4e0748..1817fa7f922b3b30168655bffbcd629feeec167a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3092,18 +3092,40 @@ static int camss_init_subdevices(struct camss *camss)
 {
 	struct platform_device *pdev = to_platform_device(camss->dev);
 	const struct camss_resources *res = camss->res;
+	struct device_node *phy_np;
 	unsigned int i;
 	int ret;
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
-		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
-					     &res->csiphy_res[i],
-					     res->csiphy_res[i].csiphy.id);
-		if (ret < 0) {
-			dev_err(camss->dev,
-				"Failed to init csiphy%d sub-device: %d\n",
-				i, ret);
-			return ret;
+		phy_np = of_parse_phandle(pdev->dev.of_node, "phys", i);
+		if (phy_np && of_device_is_available(phy_np)) {
+			ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
+						     &res->csiphy_res[i],
+						     res->csiphy_res[i].csiphy.id);
+			if (ret < 0) {
+				dev_err(camss->dev,
+					"Failed to init csiphy%d sub-device: %d\n",
+					i, ret);
+				return ret;
+			}
+		}
+	}
+
+	if (!phy_np) {
+		if (!res->legacy_phy)
+			return -ENODEV;
+
+		for (i = 0; i < camss->res->csiphy_num; i++) {
+			ret = msm_csiphy_subdev_init_legacy(camss, &camss->csiphy[i],
+							    &res->csiphy_res[i],
+							    res->csiphy_res[i].csiphy.id);
+			if (ret < 0) {
+				dev_err(camss->dev,
+					"Failed to init csiphy%d sub-device: %d\n",
+					i, ret);
+				return ret;
+			}
+			camss->csiphy[i].phy = ERR_PTR(-ENODEV);
 		}
 	}
 
@@ -3181,6 +3203,9 @@ static int camss_link_entities(struct camss *camss)
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
 		for (j = 0; j < camss->res->csid_num; j++) {
+			if (!camss->csiphy[i].phy)
+				continue;
+
 			ret = media_create_pad_link(&camss->csiphy[i].subdev.entity,
 						    MSM_CSIPHY_PAD_SRC,
 						    &camss->csid[j].subdev.entity,
@@ -3290,6 +3315,9 @@ static int camss_register_entities(struct camss *camss)
 	int ret;
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
+		if (!camss->csiphy[i].phy)
+			continue;
+
 		ret = msm_csiphy_register_entity(&camss->csiphy[i],
 						 &camss->v4l2_dev);
 		if (ret < 0) {
@@ -3345,8 +3373,10 @@ static int camss_register_entities(struct camss *camss)
 
 	i = camss->res->csiphy_num;
 err_reg_csiphy:
-	for (i--; i >= 0; i--)
-		msm_csiphy_unregister_entity(&camss->csiphy[i]);
+	for (i--; i >= 0; i--) {
+		if (camss->csiphy[i].phy)
+			msm_csiphy_unregister_entity(&camss->csiphy[i]);
+	}
 
 	return ret;
 }
@@ -3361,8 +3391,10 @@ static void camss_unregister_entities(struct camss *camss)
 {
 	unsigned int i;
 
-	for (i = 0; i < camss->res->csiphy_num; i++)
-		msm_csiphy_unregister_entity(&camss->csiphy[i]);
+	for (i = 0; i < camss->res->csiphy_num; i++) {
+		if (camss->csiphy[i].phy)
+			msm_csiphy_unregister_entity(&camss->csiphy[i]);
+	}
 
 	for (i = 0; i < camss->res->csid_num; i++)
 		msm_csid_unregister_entity(&camss->csid[i]);

-- 
2.49.0


