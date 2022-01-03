Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F464834B1
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 17:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234247AbiACQY3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 11:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbiACQY2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 11:24:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B253CC061761;
        Mon,  3 Jan 2022 08:24:28 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B58E6E53;
        Mon,  3 Jan 2022 17:24:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641227065;
        bh=k70ToIO+HJKLE1MqLOWAaWwlsInaPPVgKnXatp7dQ6M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rHmouVdNZ9AKS2BGJWCR4UhhGusFbtPAWVSLnPdKtzfLdYzsVGshUkTIntY1jm+no
         JAD+Gg3PCceStcXaQykacutX/H+I66lF6lyL7oWMalEjwapcTq2pWOWXvEcT4b27uu
         NDPBxFIvH9ggCY/eNDi5PEPsNFRBZ6IUfawO4DbY=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 1/8] media: pxa_camera: Drop usage of .set_mbus_config()
Date:   Mon,  3 Jan 2022 18:24:07 +0200
Message-Id: <20220103162414.27723-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subdev .set_mbus_config() operation is deprecated and will be
dropped. Drop its usage from the pxa_camera driver, querying the sensor
bus configuration instead of setting it. Only the ov6650 driver supports
the operation, any platform that experiences issues with this change
should update the ov6650 configuration to match what pxa_camera
supports.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/pxa_camera.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 3ba00b0f9320..b5644cf37fe9 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -1573,17 +1573,16 @@ static int pxa_camera_set_bus_param(struct pxa_camera_dev *pcdev)
 		mbus_config |= V4L2_MBUS_PCLK_SAMPLE_FALLING;
 	mbus_config |= V4L2_MBUS_DATA_ACTIVE_HIGH;
 
-	cfg.flags = mbus_config;
-	ret = sensor_call(pcdev, pad, set_mbus_config, 0, &cfg);
+	ret = sensor_call(pcdev, pad, get_mbus_config, 0, &cfg);
 	if (ret < 0 && ret != -ENOIOCTLCMD) {
 		dev_err(pcdev_to_dev(pcdev),
-			"Failed to call set_mbus_config: %d\n", ret);
+			"Failed to call get_mbus_config: %d\n", ret);
 		return ret;
 	}
 
 	/*
-	 * If the requested media bus configuration has not been fully applied
-	 * make sure it is supported by the platform.
+	 * If the media bus configuration of the sensor differs, make sure it
+	 * is supported by the platform.
 	 *
 	 * PXA does not support V4L2_MBUS_DATA_ACTIVE_LOW and the bus mastering
 	 * roles should match.
-- 
Regards,

Laurent Pinchart

