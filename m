Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40B8F6931CC
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 15:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjBKOxf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 09:53:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjBKOxd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 09:53:33 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E735A24487
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 06:53:30 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id y1so7967417wru.2
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 06:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2DssklKEH3ZguQjL4NDllo4Z1dy35eEP2bGhtEhl6s=;
        b=FZI+OfgR7SJGOMNw/UbKzhBFgEVU6gBpUQG5HA0dLmpOFB5eZf4iBUKMvyeZHz/sla
         3PvgA+27V6C7+rklffJ3l5nKZerI9ae8+FQov0H+hEOtjLojcq5KxT1Np+weNYMOPIUJ
         U6A6BgzDN7kj4MnFcyhr6TRDGJ7Z1kh55E4mwy65DrsRROiX8K5KUjWf48QKQ0U3aVST
         YwMOUmTr5DuIcbUv8dnLQqT91dDuXX1m+Wv1i8rxbIebyQglMzZopagqFMovx8N5ctIj
         scHwHClWsoEnkJIZ5MirqdIixVkZUR/K9K28P+ojsYhWotzM5RIthab9u0tDQcebXkYQ
         s91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2DssklKEH3ZguQjL4NDllo4Z1dy35eEP2bGhtEhl6s=;
        b=JC++MpYM2JlVYipai9Q2GA4NN+WObBYgcUTRnHBUSVfXsRhsiI3eRVqnxBa3yocDKh
         i5eAGQjnS4VihEFh8jx1AqPzOuBSMfcaRbNPV+JjtthaO4aNakt5k81kFq74gpiXbfof
         1k1wUSYCD2TA2HeTOOGRterLZgHvqRO30mHLwLToPskWyrzRwPG4iVyXVRirl9xQGx7C
         GX4QT2rAI4nHtvmlpVR5SkHo8EBOyxJCwyP1CCCJ33AkbTfp/PA7gPnBFMs8BObDEMfs
         MF9SWu0lKcv7jTkiAD4q/lHfDZ1lsE9HKMEPdo77YD8t/zala0v86FCzxn+SsuuOEXA6
         R6Sw==
X-Gm-Message-State: AO0yUKWcxsKi+hKs6e3gHKq8xKZHcEhRy9+E3qgUSyC7FvgdwHiQOA9p
        OS1P9caoMfcrLMrwlSGr12d0Sw==
X-Google-Smtp-Source: AK7set8GHnUlrRqf0bg0vD1Mqg7SqB7HOHPxNL6wrvcTzU1e9hyIF2bCYZDTWhDWeUuwd/y4tibsRQ==
X-Received: by 2002:adf:f34d:0:b0:2c5:3fce:423b with SMTP id e13-20020adff34d000000b002c53fce423bmr5990452wrp.4.1676127209326;
        Sat, 11 Feb 2023 06:53:29 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id u10-20020a5d514a000000b002c3e28d0343sm6091344wrt.85.2023.02.11.06.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:53:28 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] media: rcar-csi2: Prepare for C-PHY support
Date:   Sat, 11 Feb 2023 15:53:09 +0100
Message-Id: <20230211145310.3819989-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211145310.3819989-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230211145310.3819989-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 .../platform/renesas/rcar-vin/rcar-csi2.c     | 71 +++++++++++++++----
 1 file changed, 59 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
index 180926a2722d..5fa4a29064fd 100644
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
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7795es1 = {
@@ -1385,6 +1423,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7795es1 = {
 	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_m3w_h3es1,
 	.num_channels = 4,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7795es2 = {
@@ -1395,6 +1434,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7795es2 = {
 	.csi0clkfreqrange = 0x20,
 	.num_channels = 4,
 	.clear_ulps = true,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7796 = {
@@ -1402,6 +1442,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7796 = {
 	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_m3w_h3es1,
 	.num_channels = 4,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77961 = {
@@ -1409,6 +1450,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77961 = {
 	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_m3w_h3es1,
 	.num_channels = 4,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77965 = {
@@ -1419,6 +1461,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77965 = {
 	.csi0clkfreqrange = 0x20,
 	.num_channels = 4,
 	.clear_ulps = true,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77970 = {
@@ -1427,6 +1470,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77970 = {
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
 	.num_channels = 4,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
@@ -1436,6 +1480,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
 	.hsfreqrange = hsfreqrange_h3_v3h_m3n,
 	.csi0clkfreqrange = 0x20,
 	.clear_ulps = true,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
@@ -1444,6 +1489,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
 	.start_receiver = rcsi2_start_receiver_gen3,
 	.enter_standby = rcsi2_enter_standby_gen3,
 	.num_channels = 2,
+	.support_dphy = true,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
@@ -1454,6 +1500,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
 	.csi0clkfreqrange = 0x20,
 	.clear_ulps = true,
 	.use_isp = true,
+	.support_dphy = true,
 };
 
 static const struct of_device_id rcar_csi2_of_table[] = {
-- 
2.39.1

