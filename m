Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11F041D8D0D
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 03:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbgESBRC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 21:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728139AbgESBRB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 21:17:01 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF5D0C05BD09
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 18:16:59 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id h26so9775645lfg.6
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 18:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=43OydlKMeB2soLpqk183X/YWIZp+nTEpweso2ysEnH8=;
        b=VTogGKZn+8HP6GLONdbHWU4k1rjj64jS78ZiVB++LI5W7p7SrXGVUzIPFmY50BLNIk
         Cax85IyQomdbhLSFvPdkDaka+MFsdCLDe9scDrLEAwpbPc07vgtEuTxVH1M9ttxOa2sf
         RQI5dBeIl71cBJvEEgkz7FaK5TYvsMyVWi8vJTVO4hRKmog7A/BuDSDU5aMRA0pKGOdK
         HBAAckL80AmiKDHQw2joI2h5SJISobfBWyd2C8m8ecD+PVLwdMTDQJuB4U8NXwoHYAiQ
         1cL6iVEOIjfrQMibRTL1y7T0MkfnacAQ4TcIZ/HXOtBuAkRPxRL23E6rs05GvC0E3rNT
         kU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=43OydlKMeB2soLpqk183X/YWIZp+nTEpweso2ysEnH8=;
        b=kcmnii0guIXEIBXffIuhlKbIIlNK8z7imNARoNIKZrrODYMYbxNrFUrqaxT3PBGOAf
         myFg2T8iJP8Sbki/C4MvAiyPNy/UD98HJfQLF/5ImBbJJMWRZYpHbF+LYD1yKagcC2lr
         li+kUV5PDB8qfPebz3i4oC5dCrKnw3QkGIq/IoWJLdzRtvTlTnRNYdu6Fn3aKNGFYlV6
         NPRYBSxLQSfmuGVUUqPjf3A7Piy3B74mMH5+sGFeGSezHxFGr9iAk2RAcMtVl5qkycBn
         /7O6G+A9W8pzN9cq//HjSLeLeZ8toOmBwJgGw+3Qtl90kP/tK7Txhr3BVA5kagAilY70
         wMpQ==
X-Gm-Message-State: AOAM5313zdOJhwB4gHYBGGNeyoCYXLQ9KHw9H+WRpwDK1YVVst1F2iee
        e2/+8hTL0swAzlJgTbHsrUIuEw==
X-Google-Smtp-Source: ABdhPJxcnMOesb+fL00R07l3WHxAvKG8zfvphHel04zHEX97w5/GIihgHhN0s7YHytf2m6QMXp6I/A==
X-Received: by 2002:a05:6512:3082:: with SMTP id z2mr13587206lfd.32.1589851018350;
        Mon, 18 May 2020 18:16:58 -0700 (PDT)
Received: from localhost.localdomain ([159.224.5.60])
        by smtp.googlemail.com with ESMTPSA id i8sm4764244lfl.72.2020.05.18.18.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 18:16:57 -0700 (PDT)
From:   Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Luis Oliveira <lolivei@synopsys.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Suresh Udipi <sudipi@jp.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Subject: [PATCH v2 3/6] media: ov5647: Add support for non-continuous clock mode
Date:   Tue, 19 May 2020 04:16:18 +0300
Message-Id: <cd04fe908fc1a747949ee83044f4d2abc1885cee.1589850165.git.roman.kovalivskyi@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589847910.git.roman.kovalivskyi@globallogic.com>
References: <cover.1589847910.git.roman.kovalivskyi@globallogic.com>
In-Reply-To: <cover.1589850165.git.roman.kovalivskyi@globallogic.com>
References: <cover.1589850165.git.roman.kovalivskyi@globallogic.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

The driver was only supporting continuous clock mode
although this was not stated anywhere.
Non-continuous clock saves a small amount of power and
on some SoCs is easier to interface with.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
---
 drivers/media/i2c/ov5647.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 796cc80f8ee1..10f35c637f91 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -44,6 +44,7 @@
 #define PWDN_ACTIVE_DELAY_MS	20
 
 #define MIPI_CTRL00_CLOCK_LANE_GATE		BIT(5)
+#define MIPI_CTRL00_LINE_SYNC_ENABLE		BIT(4)
 #define MIPI_CTRL00_BUS_IDLE			BIT(2)
 #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
 
@@ -95,6 +96,7 @@ struct ov5647 {
 	int				power_count;
 	struct clk			*xclk;
 	struct gpio_desc		*pwdn;
+	bool				is_clock_contiguous;
 };
 
 static inline struct ov5647 *to_state(struct v4l2_subdev *sd)
@@ -274,9 +276,15 @@ static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
 
 static int ov5647_stream_on(struct v4l2_subdev *sd)
 {
+	struct ov5647 *ov5647 = to_state(sd);
+	u8 val = MIPI_CTRL00_BUS_IDLE;
 	int ret;
 
-	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_BUS_IDLE);
+	if (ov5647->is_clock_contiguous)
+		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
+		       MIPI_CTRL00_LINE_SYNC_ENABLE;
+
+	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, val);
 	if (ret < 0)
 		return ret;
 
@@ -573,7 +581,7 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
 	.open = ov5647_open,
 };
 
-static int ov5647_parse_dt(struct device_node *np)
+static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
 {
 	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
 	struct device_node *ep;
@@ -586,6 +594,17 @@ static int ov5647_parse_dt(struct device_node *np)
 
 	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
 
+	if (!ret) {
+		of_node_put(ep);
+		of_node_put(np);
+		return ret;
+	}
+
+	if (bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
+		|| bus_cfg.bus_type == V4L2_MBUS_CSI2_CPHY)
+		sensor->is_clock_contiguous = bus_cfg.bus.mipi_csi2.flags
+			& V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
+
 	of_node_put(ep);
 	return ret;
 }
@@ -604,7 +623,7 @@ static int ov5647_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	if (IS_ENABLED(CONFIG_OF) && np) {
-		ret = ov5647_parse_dt(np);
+		ret = ov5647_parse_dt(sensor, np);
 		if (ret) {
 			dev_err(dev, "DT parsing error: %d\n", ret);
 			return ret;
-- 
2.17.1

