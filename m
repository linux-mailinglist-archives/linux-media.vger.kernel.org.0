Return-Path: <linux-media+bounces-57107-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFOoDKKMxGlr0QQAu9opvQ
	(envelope-from <linux-media+bounces-57107-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:32:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C732E32DE5D
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F9A730A02B0
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 01:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CD837E31F;
	Thu, 26 Mar 2026 01:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rjdhdUUi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1D537C0E4
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 01:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488495; cv=none; b=YFg9PYWNpeMeJKaFEU3SMOTWfnir49ao8t642P/y+Ugj3w7GdL6rRnYPMVMNhE80Okg/0XlulP0SEsVqaK32mjRgLfTlKyRaFpipij0nfNebC0c4Wd+zbDiEfsFp95EdSBm245XxUQN0zPZ4XlhxqLL7nzpHFg/Z7LGB0pcGvbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488495; c=relaxed/simple;
	bh=3ZwZ8owyJBAvwIcF7OJWNhRUWTDZsRviDUVbB4wcBEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QMhQVQiSyQ6IzAAt5xcbM/qjBWHlixC8u5uS80FSMBP8iysMghhJFg/LOBCqd61AXUaGbTTQwGz+amgl6A+RkHOgHc0b2KI4n5RmmrNBBfha69bwek6KOgfqXLuDtnfLkaVFct5dFDDYxG2ebPkgzqJ/YTLah9UQpK0Sklt1sJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rjdhdUUi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso4375325e9.3
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 18:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488492; x=1775093292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nr+ISZvMGGEZnhMH4jyQUAnGihbj3f54nBos+mgFCmY=;
        b=rjdhdUUinEKIlVdNprNfsSBLE4DHoQG8cCEmtE4YM6iuP7dajdCQLbYd1AwqQLUHDl
         YWnRQDeUuC8pAWeQXjSUZ4zVylabehwzm3r6yi9ZZIY7CMmwpa5W6EZKE5HqeWtMnX0E
         ZvXx0M6jEL2sUPt/v+SAXnzaFTjDKXVOe2OgpLk0B/Ou0aPdYS/Pbq5XgLeB+6VAlWgs
         XLSr/YwPL/VcVA2BtFoX0zPRnADIVZKAwDwakuwHjm7uFF7itYTJC+PNaNR0D+AWP7KU
         pzuwY08d7fpnLX/OFzi7XwTVT8yTfXu1f2s1mOYsXvGDKRKz1paSyZttuBwuFquPe1F8
         jD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488492; x=1775093292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nr+ISZvMGGEZnhMH4jyQUAnGihbj3f54nBos+mgFCmY=;
        b=CrJ9AW+On/Nx0jSTzGElrnKbGyIxEMpIZ6mwdWF1Y0trU773q32Jt+V1z1vDKQJrZU
         SmmHwsNNo2QC8vG7BD+LSb/aifZ1YyulH3jGGL1x6KR0SvY8FNpf1aZvawQq86CLX/MU
         paBvDI3LhL3eClGGWUxgmFoZQD/wQgKKIklpTJ75u4SGusy8MVr3DSjQbsjJQbCPy267
         3llxfFU+Xd7RB6HXyafZyhF55xonOXTbQG/CdwkzUr5dIPs2HDSLSsstjqiIlAz3DhRz
         67BxCNHVaPjidq9S7nS03qQkJCAUyl0wvwQWi706YONyEOpcHF06819adUtlBHrwk5xp
         J9Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWfbwJv/PfCf72D/kxQU3qBO7JZiV/8aSTqpa6Rge3NEJDdqk3D8WxRzr9HJT6fYQ/B9MGaqGp6ql6T+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFsaU7WGpNfG4K1p5lg7/UKe7W7omO3nqktlyghbyy3onai3xF
	0i1vvKlL92wIfjAE6QdLKpkm902wjm4jNzmJ+UBAae4jOd55XZvabTp89Un0/Ho/H3o=
X-Gm-Gg: ATEYQzw7wiyepDoj5xX9+8I6lQVEXePO7BabzCPV6vaf9BcRaJam5kjtqRpRzGdsCHq
	WSyYmYsCNAYub+8Zl+NodxatffejWHNgNaxh2k/7uTwqbl8K8kEAuzSlF7DV3B8JNqI/NTXeUtc
	ew5Qw0xW02ogkwXOxz3Nmv9q5ygRf047bWdQESO5WQ8grBLC1RUd8XtaJQyPK0JL5mNkE9xBNOS
	LFBqqrpH077htAzmSiLNj+8DOaY6vDy6NHrpMjYeXBZZKC6aROE43kAregIVMzV33kGvN+BAM1y
	pXnurBb2Srak+I3Haz60wawKTjGCDBFJJkg5AFMPPcLazFChPqXnXyXdfzDj1va41bOpZq8ocWK
	BaXjJk0JwWyqAI4xRcDa8lG+FCyVY8qO5NPECwvF6ZCfLNSV623l1XCjPsUIneJfquGsnmdeiBT
	QMbkPdGVjvGzu6R94nKUyxha5/C8EEAaeQcr8=
X-Received: by 2002:a05:600c:3d90:b0:485:2a4b:7bc3 with SMTP id 5b1f17b1804b1-48715fc38f3mr81488775e9.4.1774488491584;
        Wed, 25 Mar 2026 18:28:11 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:11 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:34 +0000
Subject: [PATCH v11 6/7] media: qcom: camss: Add support for PHY API
 devices
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-6-5b93415be6dd@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=16035;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=3ZwZ8owyJBAvwIcF7OJWNhRUWTDZsRviDUVbB4wcBEU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIvAu1f7e50hbJGwm3n9yjgqdiPE4d9Ja6XMD
 lyKps8tXGyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLwAAKCRAicTuzoY3I
 OvsgD/wK0q9j3CkWI5Y4dsuMFB2Cgb8NcVs9Yn1/R4J8uVStA1HuYr52S4p4ndxO6P58Ob2nYKf
 4ezIqzZn8l0jajW/9TQWrrTGlDgsalJPUBKZW/sYBHczkJI2hqBM4inkzDqLzm6fC4rGspdOmks
 4qvg7QFM3FPOqYmceAi2KeKpAERvmblpKOsGz1z/g4dcDIveGa/tLEJYxmPuLovmTfCYWZmhVJB
 LAX544a37aK3mMjO6XyaGnLNO7Ji3dQEVHSZjgGUbO5T96QBraSuX3vATlflYD7GjoyfnWxOPqr
 K5aoNaAkreP7JGRnI0S5/O6LGv4Is9vVfc6Ul8hfDsenhL6r9/5JQKMvaeLSMxe1+kdxU5DIr0H
 vTuslUxmARrTpIqHgqS/Wpc7LjsnCMKgOGwtD5eIZ4zI6Pwv0VajFCxW5g1xbS/fotzhUZK14CR
 iFZxxR8nMSgRKmsn2Qpg1HH8q+YnI+FyJjNPEF25TclpnQHJiyhaCePEsIqM4qGaYlsRIYY13Tz
 rh8rBHMEBRUcOO2bcUg6gM4+pTEnFqwMwKLNq+4EBsRBSuicay5RX8Ry3TT2Fghs3xEqA3GucG1
 QfXXOcJQC+tTzJbFWgMUt6WeVmhM1+3jaqXBdyzY8iXmvLqdXuZ8xo9gmescqYJ1cyxtfymYC8b
 RWmtuA0GlfhH15w==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57107-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: C732E32DE5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the ability to use a PHY pointer which interacts with the standard PHY
API.

In the first instance the code will try to use the new PHY interface. If no
PHYs are present in the DT then the legacy method will be attempted.

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Kconfig        |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c | 189 +++++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-csiphy.h |   7 +
 drivers/media/platform/qcom/camss/camss.c        |  72 +++++++--
 4 files changed, 239 insertions(+), 30 deletions(-)

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
index 62623393f4144..478938165dd7b 100644
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
@@ -306,11 +308,99 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
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
+	struct csiphy_lanes_cfg *lncfg = &csiphy->cfg.csi2->lane_cfg;
+	struct phy_configure_opts_mipi_dphy *dphy_cfg;
+	union phy_configure_opts dphy_opts = { 0 };
+	struct device *dev = csiphy->camss->dev;
+	u8 num_lanes = lncfg->num_data;
+	s64 link_freq;
+	int i;
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
+	/* Set clock lane id and polarity */
+	dphy_cfg->clock_lane_position = lncfg->clk.pos;
+	dphy_cfg->clock_lane_polarity = lncfg->clk.pol;
+
+	/* Set data lane_mask and lane_polarities */
+	for (i = 0; i < num_lanes; i++) {
+		dphy_cfg->lane_positions[i] = lncfg->data[i].pos;
+		dphy_cfg->lane_polarities[i] = lncfg->data[i].pol;
+	}
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
@@ -568,16 +658,16 @@ static bool csiphy_match_clock_name(const char *clock_name, const char *format,
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
@@ -705,6 +795,60 @@ int msm_csiphy_subdev_init(struct camss *camss,
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
+	csiphy->phy = devm_phy_get(dev, csiphy->name);
+	if (IS_ERR(csiphy->phy)) {
+		ret = PTR_ERR(csiphy->phy);
+		goto put_np;
+	}
+
+	csiphy->camss = camss;
+	csiphy->id = id;
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
@@ -739,8 +883,12 @@ static int csiphy_link_setup(struct media_entity *entity,
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
@@ -754,8 +902,13 @@ static const struct v4l2_subdev_pad_ops csiphy_pad_ops = {
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
@@ -784,7 +937,11 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
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
@@ -823,6 +980,8 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
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
index 2749895152e32..224b5472d7771 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4451,14 +4451,35 @@ static int camss_parse_endpoint_node(struct device *dev,
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
@@ -4490,15 +4511,26 @@ static int camss_init_subdevices(struct camss *camss)
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
 
@@ -4575,6 +4607,9 @@ static int camss_link_entities(struct camss *camss)
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
 		for (j = 0; j < camss->res->csid_num; j++) {
+			if (!camss->csiphy[i].phy)
+				continue;
+
 			ret = media_create_pad_link(&camss->csiphy[i].subdev.entity,
 						    MSM_CSIPHY_PAD_SRC,
 						    &camss->csid[j].subdev.entity,
@@ -4684,6 +4719,9 @@ static int camss_register_entities(struct camss *camss)
 	int ret;
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
+		if (!camss->csiphy[i].phy)
+			continue;
+
 		ret = msm_csiphy_register_entity(&camss->csiphy[i],
 						 &camss->v4l2_dev);
 		if (ret < 0) {
@@ -4739,8 +4777,10 @@ static int camss_register_entities(struct camss *camss)
 
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
@@ -4755,8 +4795,10 @@ static void camss_unregister_entities(struct camss *camss)
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


