Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77F0A6ED4F6
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 21:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232348AbjDXTAE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 15:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232245AbjDXTAB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 15:00:01 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F596580
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 11:59:58 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-505035e3368so8353157a12.0
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 11:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1682362797; x=1684954797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSAEsHoeHMQpdL6ZvKRgqolxUDUSXbgcAbdiPtPGo8Q=;
        b=Is+cXx5sm+47ciRaUWgY2Pdic27EQ2jSa+3/9sZhlAD20D9majU4DQEa/YPoI0dBf4
         IkWs5ysr6bshdGgEpK/Z1w0ix8CHLB2i1sOi7dtY2h3Qd/3BnGVJ1oqeq2nnCOEiz/yJ
         1+T3MosJ67x5gq1wpkGup0oycJ7o0j1u81HHs4M9vzuAPz/RugwFpCIegmQ7+dO/i77u
         ONTuLt5K3zRxHmev4Z6+vwVrEtz+wNQfbYp2YH9sHuUV9Ctl8WLGxfwqVj9jV0YKjwPD
         nbiAqb0FfdUOL+dTK0pP3rtvLgPbIkeGytFAc0F/f+hj2CkYc7oUB/t6wMfQHxasZ8fx
         QeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682362797; x=1684954797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSAEsHoeHMQpdL6ZvKRgqolxUDUSXbgcAbdiPtPGo8Q=;
        b=l2AnDQE+IcR9PFIWIeWNDNdkMutmn6y5bGBsI9NAXhLGR0/JrYNi3WH/ZGg4h8ekl2
         fcKFe5UwApe4T+Pnm04ik+zwLcv46v3SSv+MU8d5VpZFOAShzvPE8o5Rl3/qhvMY443m
         8e4aEqBJNwNHiZJlRtgVhKO1P2oa8jVW52jvQfTZS1SFueQiFxjMBJe1kGgC3NrOMIG2
         TbtYTwWCxahRifl9ugDpaYUlIWdUmn8HQF5ulxWEZUdSkkRIXNbeReIoT6DEFwzcIN9R
         hfCRg6Vm2w5ZERa3jQK8DYdiXl6CEw7y/Re7EVfg9WOYInssTTpLXo/TAZBGizjFcN3m
         ij4Q==
X-Gm-Message-State: AAQBX9dQJSpcA2S2aF25S04QWHyTHRWX4cfJpJp2pv06srgWFWf9a6Z6
        Rx5zFI4cG7oViCceAWUEx9z8bA9L7fl0J077X60=
X-Google-Smtp-Source: AKy350bOfndYMFBEYE5c5l63k+2U1lEAh1zJkHPhQ1k/2KSyzHgRhDp8b3hh2yPsfdUFBPEugshXIQ==
X-Received: by 2002:a17:906:f6d8:b0:957:12a6:a00f with SMTP id jo24-20020a170906f6d800b0095712a6a00fmr10165051ejb.21.1682362797086;
        Mon, 24 Apr 2023 11:59:57 -0700 (PDT)
Received: from sleipner.berto.se (p54ac52fc.dip0.t-ipconnect.de. [84.172.82.252])
        by smtp.googlemail.com with ESMTPSA id ke15-20020a17090798ef00b0095328ce9c8bsm5849818ejc.67.2023.04.24.11.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 11:59:56 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/3] media: rcar-csi2: Prepare for C-PHY support
Date:   Mon, 24 Apr 2023 20:59:33 +0200
Message-Id: <20230424185934.438059-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424185934.438059-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230424185934.438059-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Gen4 will support both D-PHY and C-PHY, while Gen3 only supports D-PHY.
Add two flags to the device information structure to be able to record
what each SoC supports.

Extend the device node parsing to accept both CSI_2 D-PHY and C-PHY
buses, while at the same time taking the SoC support into account.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Rebased to latest media-tree.
---
 .../platform/renesas/rcar-vin/rcar-csi2.c     | 70 +++++++++++++++----
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
index 05ea1723f04b..f200fc2bc959 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
@@ -490,6 +490,8 @@ struct rcar_csi2_info {
 	unsigned int num_channels;
 	bool clear_ulps;
 	bool use_isp;
+	bool support_dphy;
+	bool support_cphy;
 };
 
 struct rcar_csi2 {
@@ -511,6 +513,7 @@ struct rcar_csi2 {
 	struct v4l2_mbus_framefmt mf;
 	int stream_count;
 
+	bool cphy;
 	unsigned short lanes;
 	unsigned char lane_swap[4];
 };
@@ -665,9 +668,17 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 		return ret;
 	}
 
-	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
-		dev_err(priv->dev, "Unsupported media bus type %u\n",
-			mbus_config.type);
+	switch (mbus_config.type) {
+	case V4L2_MBUS_CSI2_CPHY:
+		if (!priv->cphy)
+			return -EINVAL;
+		break;
+	case V4L2_MBUS_CSI2_DPHY:
+		if (priv->cphy)
+			return -EINVAL;
+		break;
+	default:
+		dev_err(priv->dev, "Unsupported media bus type %u\n", mbus_config.type);
 		return -EINVAL;
 	}
 
@@ -1025,15 +1036,41 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
 	if (vep->base.port || vep->base.id)
 		return -ENOTCONN;
 
-	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
-		dev_err(priv->dev, "Unsupported bus: %u\n", vep->bus_type);
-		return -EINVAL;
-	}
-
 	priv->lanes = vep->bus.mipi_csi2.num_data_lanes;
-	if (priv->lanes != 1 && priv->lanes != 2 && priv->lanes != 4) {
-		dev_err(priv->dev, "Unsupported number of data-lanes: %u\n",
-			priv->lanes);
+
+	switch (vep->bus_type) {
+	case V4L2_MBUS_CSI2_DPHY:
+		if (!priv->info->support_dphy) {
+			dev_err(priv->dev, "D-PHY not supported\n");
+			return -EINVAL;
+		}
+
+		if (priv->lanes != 1 && priv->lanes != 2 && priv->lanes != 4) {
+			dev_err(priv->dev,
+				"Unsupported number of data-lanes for D-PHY: %u\n",
+				priv->lanes);
+			return -EINVAL;
+		}
+
+		priv->cphy = false;
+		break;
+	case V4L2_MBUS_CSI2_CPHY:
+		if (!priv->info->support_cphy) {
+			dev_err(priv->dev, "C-PHY not supported\n");
+			return -EINVAL;
+		}
+
+		if (priv->lanes != 3) {
+			dev_err(priv->dev,
+				"Unsupported number of data-lanes for C-PHY: %u\n",
+				priv->lanes);
+			return -EINVAL;
+		}
+
+		priv->cphy = true;
+		break;
+	default:
+		dev_err(priv->dev, "Unsupported bus: %u\n", vep->bus_type);
 		return -EINVAL;
 	}
 
@@ -1057,7 +1094,7 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 	struct fwnode_handle *fwnode;
 	struct fwnode_handle *ep;
 	struct v4l2_fwnode_endpoint v4l2_ep = {
-		.bus_type = V4L2_MBUS_CSI2_DPHY
+		.bus_type = V4L2_MBUS_UNKNOWN,
 	};
 	int ret;
 
@@ -1378,6 +1415,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7795 = {
 	.csi0clkfreqrange = 0x20,
 	.num_channels = 4,
 	.clear_ulps = true,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7795es2 = {
@@ -1388,6 +1426,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7795es2 = {
 	.csi0clkfreqrange = 0x20,
 	.num_channels = 4,
 	.clear_ulps = true,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7796 = {
@@ -1395,6 +1434,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7796 = {
 	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_m3w,
 	.num_channels = 4,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77961 = {
@@ -1402,6 +1442,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77961 = {
 	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_m3w,
 	.num_channels = 4,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77965 = {
@@ -1412,6 +1453,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77965 = {
 	.csi0clkfreqrange = 0x20,
 	.num_channels = 4,
 	.clear_ulps = true,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77970 = {
@@ -1420,6 +1462,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77970 = {
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
 	.num_channels = 4,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
@@ -1429,6 +1472,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
 	.hsfreqrange = hsfreqrange_h3_v3h_m3n,
 	.csi0clkfreqrange = 0x20,
 	.clear_ulps = true,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
@@ -1437,6 +1481,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
 	.num_channels = 2,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
@@ -1447,6 +1492,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
 	.csi0clkfreqrange = 0x20,
 	.clear_ulps = true,
 	.use_isp = true,
+	.support_dphy = true,
 };
 
 static const struct of_device_id rcar_csi2_of_table[] = {
-- 
2.40.0

