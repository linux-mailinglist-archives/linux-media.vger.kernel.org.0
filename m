Return-Path: <linux-media+bounces-66934-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4DsdEpSVTWoh2gEAu9opvQ
	(envelope-from <linux-media+bounces-66934-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:11:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B833720918
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:10:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=MVsAzs25;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66934-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66934-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A45E303F656
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 00:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418241632DD;
	Wed,  8 Jul 2026 00:07:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CFB16DEB1
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 00:07:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469240; cv=none; b=hvlOXUWPA/f5pv39USWqXBYAKnBkFxwv7scJRRs+EjnzB/CuUeTbAlVaOkfF8aJ/7KJtGah4LNSRkxH1LwDJdVwgt5CSJ5aljakbxnUbyb7rAUiqBnycTKSXE3JI2Zu7AweuUB/25WwynEZnJUATPdG1+QBr62wqe183nsBIKzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469240; c=relaxed/simple;
	bh=ozm44EA5lyIkl4H6yxKurwNdSWXSjZMGiFt/s/LRIS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eLSVUoGFypb7d2ok43q5DbdojZNkVzyasGabUsSLrVGeQ0+smJqHE0eiV0L+Oi22xKGukWo4KAupJFs3Vv/5oxR9I9WtB29yyZcwzHDJifQNszHWYLKc7HutOkG1UMI5Sn6LciE3FJybuWOOqO+l3jMbkJlq5Ndeir2u3TYy+kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MVsAzs25; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-470174001a0so57147f8f.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 17:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469234; x=1784074034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fo5exYZFvMkHbYwDB7dWcT7VDSSMbbNAE28Fh8pwG0c=;
        b=MVsAzs25zuUYoRklxEbz8IrS5pL4/PfN/fmy0FpOCrJbhtWvI4Mbf8OTx4iPLwJI4f
         PqBD56ggviQ5OQSkbogmMjhSCmeFq9jV0HSNn5mmzMUCTN2jxFU1HAc1TSn0Bb8fgDZi
         Lfnv596/gtYPIzjJO216Jl0rkOAvI8myO7ymNssytcgY1gkD3TAYNXln41EfXZ6jHW51
         IQH2lsaqza6FUDbS3FCm0mROIVA+1tVGOgk6/julbuiIG7nELTvkEmBDPhJupCpRJQM2
         80BdOr3i7Z726quEWj49iJ5uX8XOmlrmyV3HIv7gGz0a+tv8evtvLsCDnDQ2HvEUePN/
         t0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469234; x=1784074034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fo5exYZFvMkHbYwDB7dWcT7VDSSMbbNAE28Fh8pwG0c=;
        b=grpaYe9nOr1UUzDjIWBCaVAXe9OiFX8eo9X1vxqjM9hJwzg87E51/DvTw4ZTC+JUFh
         /fofdhncpMSRsN4EE+jqoxFUbEdCpXXUc6PyM72P3elxq3FYuIAZpZWd76vMz7fdLFiS
         y/BChvK8Ewm42OInMKdYUEsG48ZUywrrU9aJrzzodQIP+ZMc6aYR2cIFUKxrTm3CzIJM
         bPLUsB2wk8GVUFqeeMOzuTx/n1GINM47HZ3L/Gm56WNlG/mIhHMMDAxaALXiG0WQZbDJ
         1ED+1ez76jA2FjWzUGlHsewCzQuoPb3eFgATiteSJIz0GWj1Bk/yIDP2UzS2DACP/hwS
         +O4g==
X-Forwarded-Encrypted: i=1; AHgh+RrUtF15DOfLnetSjiBfvHX7oXJu1crfiBRVZceEA8byTH5QRzQ9oLVbhOoZ/cSCl1FMNwkVmDCsr12Oig==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl5vgJBt1lURORFsGgmr50W1AuXX0GNPNE+6O5H8dz9x/lEpMb
	J4O+a4kTwM2TGn+wp+m++n9PLKseoLSwvKUED5qqT2mlbyFWGq32oIr0d7nkxf4WZJ0=
X-Gm-Gg: AfdE7cmwWJNR3kFS+aE6NUw0PDirXO7c+bPnzc5PfecAc06SKX5kC8bfukLofhp/8pU
	VewSVUyj5bzaWFbV9ERFQLjfjeTxiuGoOapSeqrO5T4IdPvBEKXhergcSU57pL7Wx/f3cK61n6V
	t4YYoV68k5JIWSVrsrh6L62JSd5DarT0keh15RuOSNbf4VY+RpXiIyi5pbcn5a+eeSyAAjrTfKP
	D0SP3Cd3LeJPTqGJ1DU+2HwK91rfMizgBEuB5DNxgAaJceBvTaPSRbZlylyDxI0njRUwsNquW83
	lJ1FQt6rcHG3JM+3Nr/ASr4ql1FBNJf5kH0e3Bj8AJ6RdSxsLTNVtBn6p6n4dS2NZqWZ8tcc8oE
	UD81NwnqyfR49VbxopZwNW/SSmcBkS8G3V1F6i39VodDemIJln8neNPZ4rEbeJZTU2RkEx4ZL7I
	BXjba+pxJi/Qx8nhNP6wBKFg5lbn40YDlkOg==
X-Received: by 2002:a05:6000:4206:b0:47d:ec60:6578 with SMTP id ffacd0b85a97d-47dec606781mr5119496f8f.50.1783469233693;
        Tue, 07 Jul 2026 17:07:13 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:13 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:06:59 +0100
Subject: [PATCH v12 5/6] media: qcom: camss: Add support for PHY API
 devices
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-5-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15883;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=ozm44EA5lyIkl4H6yxKurwNdSWXSjZMGiFt/s/LRIS8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSohpg2ujG0awfP1Ut3RNfHKrnCAJPZOxZ7/
 ZYwSlemfF2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UqAAKCRAicTuzoY3I
 Ol3qEACOzSocy3lOVO8J8HOQB6DSTRqBQbafgtSktF2e/NvgEOKWao0pPVeWwnxRanS0MJauMj8
 o+TUzc1u5DnV5CjHyPKcLdlIe55/goQgEnyt4sT4Xl/CAv4q4jFroEv2OtejCic9pDl+ysXBWXp
 qU2jmx5RAp7Gt2BMB58cHAQGvQ/xR8lHNTTDEkPN4R7fxEc0NCTqtdMFN6OkSkEQjlbfcWBBlir
 6IE0EamMYV59y1isQxArTgKSs812uhDScQpz+KFSle1J6m5fuy/iQdrGzTWfg1TAk9uI1TWfNP9
 +mHlxIKzQUlEieszwJ92xwVa2cXniipNBj1TS8B/A5+m/bbUGRG1wtWL4dLapLHaH0BSHfzCumY
 P4OpQ77qMlehnRCl/EOf+w9+wpH8MjaTRTHen9bWb8TaihH1uRzRxtpHx1QFINM4lk5ZgZ4fAlO
 4UqU1z3R1ypBd2rvI+bAJplFeK7K/oNNWBE7ORY24+vC4q1Vk0oTXdbP/pI+nhkuOusM4D3b7gu
 oEW385CYMSeZfVxsRk4pxaL903qQ5y7hZIKJxBVR9Wpl5eYQb+Eforr7YLd8torhlbNmb2LoJVX
 TNuI9LBwZu71N5/6DDVAPvQ3zeIn+rxlgKLA1U3xIj4AcOQH/LT08GO9xh+6365jM5+7LQt3aPt
 6T6yFMPvNGX1ImA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66934-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,args.np:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B833720918

Add the ability to use a PHY pointer which interacts with the standard PHY
API.

In the first instance the code will try to use the new PHY interface. If no
PHYs are present in the DT then the legacy method will be attempted.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Kconfig        |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c | 179 +++++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-csiphy.h |   7 +
 drivers/media/platform/qcom/camss/camss.c        |  88 +++++++++--
 4 files changed, 245 insertions(+), 30 deletions(-)

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
index 539ac4888b608..b740edd0c67e6 100644
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
@@ -306,11 +308,89 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
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
@@ -572,16 +652,16 @@ csiphy_match_clock_name(const char *clock_name, const char *format, ...)
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
@@ -709,6 +789,60 @@ int msm_csiphy_subdev_init(struct camss *camss,
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
@@ -743,8 +877,12 @@ static int csiphy_link_setup(struct media_entity *entity,
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
@@ -758,8 +896,13 @@ static const struct v4l2_subdev_pad_ops csiphy_pad_ops = {
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
@@ -788,7 +931,11 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
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
@@ -828,6 +975,8 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
  */
 void msm_csiphy_unregister_entity(struct csiphy_device *csiphy)
 {
+	if (!IS_ERR(csiphy->phy))
+		phy_exit(csiphy->phy);
 	v4l2_device_unregister_subdev(&csiphy->subdev);
 	media_entity_cleanup(&csiphy->subdev.entity);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 9d9657b82f748..1879826034aac 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -12,6 +12,7 @@
 
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/phy/phy.h>
 #include <media/media-entity.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-mediabus.h>
@@ -97,6 +98,7 @@ struct csiphy_device_regs {
 
 struct csiphy_device {
 	struct camss *camss;
+	struct phy *phy;
 	u8 id;
 	struct v4l2_subdev subdev;
 	struct media_pad pads[MSM_CSIPHY_PADS_NUM];
@@ -104,6 +106,7 @@ struct csiphy_device {
 	void __iomem *base_clk_mux;
 	u32 irq;
 	char irq_name[30];
+	char name[16];
 	struct camss_clock *clock;
 	bool *rate_set;
 	int nclocks;
@@ -118,6 +121,10 @@ struct csiphy_device {
 
 struct camss_subdev_resources;
 
+int msm_csiphy_subdev_init_legacy(struct camss *camss,
+				  struct csiphy_device *csiphy,
+				  const struct camss_subdev_resources *res, u8 id);
+
 int msm_csiphy_subdev_init(struct camss *camss,
 			   struct csiphy_device *csiphy,
 			   const struct camss_subdev_resources *res, u8 id);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e814a96953b1b..146fea438486f 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4794,14 +4794,51 @@ static int camss_parse_endpoint_node(struct device *dev,
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
+			struct fwnode_handle *phy_out, *phy_node, *phy_in, *sensor_ep;
+
+			phy_out = fwnode_graph_get_remote_endpoint(ep);
+			if (!phy_out)
+				continue;
+
+			phy_node = fwnode_graph_get_port_parent(phy_out);
+			fwnode_handle_put(phy_out);
+			if (!phy_node)
+				continue;
+
+			phy_in = fwnode_graph_get_endpoint_by_id(phy_node, 0, 0, 0);
+			fwnode_handle_put(phy_node);
+			if (!phy_in)
+				continue;
+
+			sensor_ep = fwnode_graph_get_remote_endpoint(phy_in);
+			fwnode_handle_put(phy_in);
+			if (!sensor_ep)
+				continue;
+
+			csd = v4l2_async_nf_add_fwnode(&camss->notifier, sensor_ep,
+						struct camss_async_subdev);
+			fwnode_handle_put(sensor_ep);
+			if (IS_ERR(csd)) {
+				ret = PTR_ERR(csd);
+				goto err_cleanup;
+			}
+		}
 
-		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
-						      typeof(*csd));
 		if (IS_ERR(csd)) {
 			ret = PTR_ERR(csd);
 			goto err_cleanup;
@@ -4833,15 +4870,26 @@ static int camss_init_subdevices(struct camss *camss)
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
 
@@ -4931,6 +4979,9 @@ static int camss_link_entities(struct camss *camss)
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
 		for (j = 0; j < camss->res->csid_num; j++) {
+			if (!camss->csiphy[i].phy)
+				continue;
+
 			ret = media_create_pad_link(&camss->csiphy[i].subdev.entity,
 						    MSM_CSIPHY_PAD_SRC,
 						    &camss->csid[j].subdev.entity,
@@ -5057,6 +5108,9 @@ static int camss_register_entities(struct camss *camss)
 	int ret;
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
+		if (!camss->csiphy[i].phy)
+			continue;
+
 		ret = msm_csiphy_register_entity(&camss->csiphy[i],
 						 &camss->v4l2_dev);
 		if (ret < 0) {
@@ -5132,8 +5186,10 @@ static int camss_register_entities(struct camss *camss)
 
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
@@ -5148,8 +5204,10 @@ static void camss_unregister_entities(struct camss *camss)
 {
 	unsigned int i;
 
-	for (i = 0; i < camss->res->csiphy_num; i++)
-		msm_csiphy_unregister_entity(&camss->csiphy[i]);
+	for (i = 0; i < camss->res->csiphy_num; i++) {
+		if (camss->csiphy[i].phy)
+			msm_csiphy_unregister_entity(&camss->csiphy[i]);
+	}
 
 	if (camss->tpg) {
 		for (i = 0; i < camss->res->tpg_num; i++)

-- 
2.54.0


