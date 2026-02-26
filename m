Return-Path: <linux-media+bounces-53522-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O4rMu5aoGlPigQAu9opvQ
	(envelope-from <linux-media+bounces-53522-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 15:38:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E17F1A7B87
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 15:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8E77304B399
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5163E95BD;
	Thu, 26 Feb 2026 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CCiOm2O2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B646B3D6494
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116140; cv=none; b=ctJyuLFQ0syiS+44xxbWsZj6TU6o2hHfsJ+LflxQ3UqoHGKT4FJ6N0X9N0ap+96f72wUAsdLBPs3WDFcDHkcBnzlJbggONV/PmWdrqu8PLxeChS0BW/6t4u31BEXV0IkSuuSemcfV70KL8D2hEjJO5QKW5bXK4Kg6EeER2ysaSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116140; c=relaxed/simple;
	bh=tbtehKEreKASco/1IMHRTZnZxOQyhVsppf5Y02ot/qU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ndmRzNsvqnmT2EmC6V3e5CiVWeDNeiambTaRbX7551wTtHxRNdx/+UEgQinE41C+JTzs+7gFN+DrP3Wkhwqx5wWSTqX+lT8Z0LAq4ukNnT4c/UlbTV98rEtAtnFOUF629EBMbGBLdFusR/69G1fNGAdfFcxd3JYL2l0PKNaHrT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CCiOm2O2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48378136adcso5673045e9.1
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 06:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772116132; x=1772720932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sd+vX+/I71k3DZM/mohq2ah4AX5XhZGwQbe1seESShQ=;
        b=CCiOm2O2TxbDS6KNHKN8cNLA8cN/hIwmZLs4OQu+XZAFpp7q7R51PL1fFPErkZgdPW
         11Loq37+LjlsutL4pSzptv6zaIqRgfjxLtUW+1ZgSbQkCniA1sLnD3ex5QKhARh7YAyD
         PXbx+RSOKuhkVI1MavvsT3/7lbOx7Xc0kcojFMyLzvf8u1h5fB8nwIuGC+cqRo8PpMao
         KYer1lOzA2JQ95ZGUm/MHXVJfI3KCsG7/Rt1WOTj5eeAdEysS6QbGULCo3+q+fnMaY9V
         bI7R5Ng4hRp0dLoWAcTruvMIgb3bRFVyp09tgAm14AxJtsfZo12QTyVV6u+sys2bdrB5
         uOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116132; x=1772720932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sd+vX+/I71k3DZM/mohq2ah4AX5XhZGwQbe1seESShQ=;
        b=eZQSAM+b8WUdiKnKk4cd1rXX/mr4qjKtKJmSfWSAWW2Q6xHhuih7qWRWGbKkftaWbO
         BppXeol4pHeuN7cHA1z3DgmsKhX3fCGUTfcInbDhXd8eEEE0+RuHxsKn9faxg5v3YJl9
         jTJ7ut5VIo9QjKHIsUF/7Da+rz2IBRgjlzzUbUHUgA4AjMDO0iLPxD9bpyFaAbaioLWi
         MksR15tZKP69mVRxDu3PcmMDYkR/G9lOPYwtOIoA7+VYp+BL/VG3+nyDNESSL1RKh5V8
         q00YrloVP5AqGBpUwhU0GaLCKQao02ks5Ns4ocvi8xS5oHcy58LpkjI/DmMKKUdzwM8L
         AKrw==
X-Forwarded-Encrypted: i=1; AJvYcCU0QI5ibWi1j2HfBfoBKPAVA5JBVBydqcm0mo+/De356uwsXUcM6q1Y6BpDhpDu7SPSNwR4mUJXuJKGew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHpjVeLWMz1fSCxZZHSPKbsAyv0Pev9IGFMhsS5RMrJ8fozcGI
	2ALM7F0xDwzY1IoDj4Wu3UjDCecnu2HfUwOd8G92+IORKSpfbI1pet1BNoZjE3jWxTU=
X-Gm-Gg: ATEYQzwmltUtLSx6SmBixuxK3jTvyvnoI0O1Cub9SOGMRwRRPuS4APaR96cNx3gl47F
	gB2KbBfjZr+tGPRpyGhJOqnDDee4d0EfNc1Wyg5D5fMk07Ol8S7pX9OtVEmLGINbRf1MrcT2bOV
	0wVYOp0k1Fc902fni3vcVuSW0Y2XWSch2j0xve48FrNa8TmGt18qulvqlcgQ6njwXPUQwfAWowK
	ZkdGOFbZdVQcOiuv4iUaA6BzzC+53MZrNyBQ0Z9uSHbHrxwxQkJAcDjJ9XcY+ApF1eAtnwEseAv
	qTLGMDRi2FKjLTGScGAxZrVonfOsGCxUyyO+jYrPX+8B4je6LJ6lTUE5BmzoJCavC8BTiwxMvM5
	txYCO81CsHtW6qAuL6xEvx1QMJzx40Uny2dUTV+CkxEiu7JJrPwd0mywasCCuRszgV9syz4Rlsh
	snfNpJrZFXdWLBRzLZovP8dBUpM6OctdvbeRelbVf8ooPCSpfUEMrPqhHY0jyy94A1
X-Received: by 2002:a05:600c:a085:b0:47e:e20e:bbb0 with SMTP id 5b1f17b1804b1-483c216bdfamr72425185e9.6.1772116131682;
        Thu, 26 Feb 2026 06:28:51 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm39219897f8f.29.2026.02.26.06.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:28:51 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:28:47 +0000
Subject: [PATCH v9 6/7] media: qcom: camss: Add support for PHY API devices
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-6-a59c3f037d0b@linaro.org>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
In-Reply-To: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15750;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=tbtehKEreKASco/1IMHRTZnZxOQyhVsppf5Y02ot/qU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoFic6ldfzI9vDof3S9JuchagTS4PzcI+UrN51
 BxgdagSZk2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBYnAAKCRAicTuzoY3I
 OlMfEAC5tVBCyCal6NTOpr5lRZf9WHKvJgY06KEMVEuBzofdHkQEABtdpUvYDN5uLvTWk4Lwez4
 u+mhC+lStfwEI/XIO7Y3/OPFPmn8y1TnC0Qjs8atm7JvP5cdABPZHej7rfvxYm1W2b30tiWXVTe
 vbO7GyF4CDdHn1jOgk0wxNF2OfIyHXJ/sdh/wPZme/a9TSLoxS/Rb9LfwKAlpF8WgmiYu/RSmYf
 jo0lG0/1ptW+S0DoMerJUhWYHlKuQCkuESPzq/F5k7TaMv95dSARPCXyYKWBdLUR21PhWyxWwf/
 COlqO6/3GlYtqQlN8nDbqRC03mPotdVkAUIP4oz5F/F9LiJMOU5KjKaTb8hW9XMMWFb7VeP6GvG
 +v172jxCZc3ZxygV8SaANA5jDxa+Zrfpc7sD6eB63sSfI21QK2bRPAzY++tkZ9OJtGnYdQWQbEw
 nguVbMNNz6QUZNDiwhAJ0g4qSZKoiLb8mbbswVtj8IqRsQsrWezdkTjY0VtLKw1trp++HpkgV+E
 yTXZ/r9iRbcg/yt75pMYn9RbwfTIt4SHQFDdfZ+p6iBXjhqTdo9Gy0U4A7lM8+MjCi4w01DLGvc
 5FkVkh/xcH85sLGqX8ZKnbgP337oVKS684fvO1WB0WBia8rsS4QH+hsPs5nmHPFhvlBdFd7oa2x
 /yR1bDYUXUP8ooA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53522-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,args.np:url,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 3E17F1A7B87
X-Rspamd-Action: no action

Add the ability to use a PHY pointer which interacts with the standard PHY
API.

In the first instance the code will try to use the new PHY interface. If no
PHYs are present in the DT then the legacy method will be attempted.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Kconfig        |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c | 185 +++++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-csiphy.h |   7 +
 drivers/media/platform/qcom/camss/camss.c        |  72 +++++++--
 4 files changed, 235 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index 4eda48cb1adf0..1edc5e5a1829e 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
+	select PHY_QCOM_MIPI_CSI2
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 62623393f4144..b8bfbf2fef8fa 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -7,12 +7,14 @@
  * Copyright (c) 2011-2015, The Linux Foundation. All rights reserved.
  * Copyright (C) 2016-2018 Linaro Ltd.
  */
+#include <dt-bindings/phy/phy.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <media/media-entity.h>
@@ -131,10 +133,10 @@ static u8 csiphy_get_bpp(const struct csiphy_format_info *formats,
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
@@ -200,7 +202,7 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
  *
  * Return 0 on success or a negative error code otherwise
  */
-static int csiphy_set_power(struct v4l2_subdev *sd, int on)
+static int csiphy_set_power_legacy(struct v4l2_subdev *sd, int on)
 {
 	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
 	struct device *dev = csiphy->camss->dev;
@@ -219,7 +221,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 			return ret;
 		}
 
-		ret = csiphy_set_clock_rates(csiphy);
+		ret = csiphy_set_clock_rates_legacy(csiphy);
 		if (ret < 0) {
 			regulator_bulk_disable(csiphy->num_supplies,
 					       csiphy->supplies);
@@ -254,7 +256,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 }
 
 /*
- * csiphy_stream_on - Enable streaming on CSIPHY module
+ * csiphy_stream_on_legacy - Enable streaming on CSIPHY module
  * @csiphy: CSIPHY device
  *
  * Helper function to enable streaming on CSIPHY module.
@@ -262,7 +264,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
  *
  * Return 0 on success or a negative error code otherwise
  */
-static int csiphy_stream_on(struct csiphy_device *csiphy)
+static int csiphy_stream_on_legacy(struct csiphy_device *csiphy)
 {
 	struct csiphy_config *cfg = &csiphy->cfg;
 	s64 link_freq;
@@ -306,11 +308,86 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
  *
  * Helper function to disable streaming on CSIPHY module
  */
-static void csiphy_stream_off(struct csiphy_device *csiphy)
+static void csiphy_stream_off_legacy(struct csiphy_device *csiphy)
 {
 	csiphy->res->hw_ops->lanes_disable(csiphy, &csiphy->cfg);
 }
 
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
+/*
+ * csiphy_stream_off - Disable streaming on CSIPHY module
+ * @csiphy: CSIPHY device
+ *
+ * Helper function to disable streaming on CSIPHY module
+ */
+static void csiphy_stream_off(struct csiphy_device *csiphy)
+{
+	phy_power_off(csiphy->phy);
+}
+
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
@@ -705,6 +782,69 @@ int msm_csiphy_subdev_init(struct camss *camss,
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
+	struct of_phandle_args args;
+	u8 combo_mode;
+	int idx;
+	int ret;
+
+	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", id);
+
+	idx = of_property_match_string(dev->of_node, "phy-names", csiphy->name);
+	if (idx < 0) {
+		dev_err(dev, "%s not found\n", csiphy->name);
+		return idx;
+	}
+
+	ret = of_parse_phandle_with_args(dev->of_node, "phys", "#phy-cells", idx, &args);
+	if (ret < 0) {
+		dev_err(dev, "unable to parse phys args %s\n", csiphy->name);
+		return ret;
+	}
+
+	if (!of_device_is_available(args.np))
+		goto put_np;
+
+	combo_mode = args.args[0];
+	if (combo_mode != PHY_TYPE_DPHY) {
+		dev_err(dev, "%s mode %d not supported\n", csiphy->name, combo_mode);
+		ret = -EOPNOTSUPP;
+		goto put_np;
+	}
+
+	csiphy->phy = devm_phy_get(dev, csiphy->name);
+	if (IS_ERR(csiphy->phy)) {
+		ret = PTR_ERR(csiphy->phy);
+		goto put_np;
+	}
+
+	csiphy->camss = camss;
+	csiphy->id = id;
+	csiphy->cfg.combo_mode = combo_mode;
+	csiphy->res = &res->csiphy;
+
+	ret = phy_init(csiphy->phy);
+	if (ret)
+		dev_err(dev, "phy %s init fail %d\n", csiphy->name, ret);
+
+put_np:
+	of_node_put(args.np);
+
+	return ret;
+}
+
 /*
  * csiphy_link_setup - Setup CSIPHY connections
  * @entity: Pointer to media entity structure
@@ -739,8 +879,12 @@ static int csiphy_link_setup(struct media_entity *entity,
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
@@ -754,8 +898,13 @@ static const struct v4l2_subdev_pad_ops csiphy_pad_ops = {
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
@@ -784,7 +933,11 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
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
@@ -823,6 +976,8 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
  */
 void msm_csiphy_unregister_entity(struct csiphy_device *csiphy)
 {
+	if (!IS_ERR(csiphy->phy))
+		phy_exit(csiphy->phy);
 	v4l2_device_unregister_subdev(&csiphy->subdev);
 	media_entity_cleanup(&csiphy->subdev.entity);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 2d5054819df7f..25b803c06e8bf 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -12,6 +12,7 @@
 
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/phy/phy.h>
 #include <media/media-entity.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-mediabus.h>
@@ -95,6 +96,7 @@ struct csiphy_device_regs {
 
 struct csiphy_device {
 	struct camss *camss;
+	struct phy *phy;
 	u8 id;
 	struct v4l2_subdev subdev;
 	struct media_pad pads[MSM_CSIPHY_PADS_NUM];
@@ -102,6 +104,7 @@ struct csiphy_device {
 	void __iomem *base_clk_mux;
 	u32 irq;
 	char irq_name[30];
+	char name[16];
 	struct camss_clock *clock;
 	bool *rate_set;
 	int nclocks;
@@ -116,6 +119,10 @@ struct csiphy_device {
 
 struct camss_subdev_resources;
 
+int msm_csiphy_subdev_init_legacy(struct camss *camss,
+				  struct csiphy_device *csiphy,
+				  const struct camss_subdev_resources *res, u8 id);
+
 int msm_csiphy_subdev_init(struct camss *camss,
 			   struct csiphy_device *csiphy,
 			   const struct camss_subdev_resources *res, u8 id);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5fb5ad87e1671..b1737b5d52160 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4450,14 +4450,35 @@ static int camss_parse_endpoint_node(struct device *dev,
 static int camss_parse_ports(struct camss *camss)
 {
 	struct device *dev = camss->dev;
+	const struct camss_resources *res = camss->res;
 	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
 	int ret;
 
 	fwnode_graph_for_each_endpoint(fwnode, ep) {
 		struct camss_async_subdev *csd;
+		struct fwnode_handle *remote;
+
+		if (!fwnode_device_is_available(ep))
+			continue;
+
+		if (res->legacy_phy) {
+			csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
+							      typeof(*csd));
+		} else {
+			/*
+			 * For non-legacy PHY, the CSIPHY is a separate device.
+			 * Register the remote endpoint (CSIPHY's endpoint) as
+			 * the async subdev, not the remote port parent.
+			 */
+			remote = fwnode_graph_get_remote_endpoint(ep);
+			if (!remote)
+				continue;
+
+			csd = v4l2_async_nf_add_fwnode(&camss->notifier, remote,
+						       struct camss_async_subdev);
+			fwnode_handle_put(remote);
+		}
 
-		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
-						      typeof(*csd));
 		if (IS_ERR(csd)) {
 			ret = PTR_ERR(csd);
 			goto err_cleanup;
@@ -4489,15 +4510,26 @@ static int camss_init_subdevices(struct camss *camss)
 	unsigned int i;
 	int ret;
 
-	for (i = 0; i < camss->res->csiphy_num; i++) {
-		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
-					     &res->csiphy_res[i],
-					     res->csiphy_res[i].csiphy.id);
-		if (ret < 0) {
-			dev_err(camss->dev,
-				"Failed to init csiphy%d sub-device: %d\n",
-				i, ret);
-			return ret;
+	if (!res->legacy_phy) {
+		for (i = 0; i < camss->res->csiphy_num; i++) {
+			ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
+						     &res->csiphy_res[i],
+						     res->csiphy_res[i].csiphy.id);
+			if (ret < 0)
+				return ret;
+		}
+	} else {
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
 
@@ -4574,6 +4606,9 @@ static int camss_link_entities(struct camss *camss)
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
 		for (j = 0; j < camss->res->csid_num; j++) {
+			if (!camss->csiphy[i].phy)
+				continue;
+
 			ret = media_create_pad_link(&camss->csiphy[i].subdev.entity,
 						    MSM_CSIPHY_PAD_SRC,
 						    &camss->csid[j].subdev.entity,
@@ -4683,6 +4718,9 @@ static int camss_register_entities(struct camss *camss)
 	int ret;
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
+		if (!camss->csiphy[i].phy)
+			continue;
+
 		ret = msm_csiphy_register_entity(&camss->csiphy[i],
 						 &camss->v4l2_dev);
 		if (ret < 0) {
@@ -4738,8 +4776,10 @@ static int camss_register_entities(struct camss *camss)
 
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
@@ -4754,8 +4794,10 @@ static void camss_unregister_entities(struct camss *camss)
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
2.52.0


