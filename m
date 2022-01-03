Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276534834BD
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 17:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234468AbiACQYf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 11:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234279AbiACQYe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 11:24:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3FB9C061761;
        Mon,  3 Jan 2022 08:24:33 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEA711287;
        Mon,  3 Jan 2022 17:24:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641227072;
        bh=rgU4KvNzIOH4iGJrLepNX2zeQPSrY53Nbi500KHrgLM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=igWUcSnZqocRJs+n5ildNi+eE9SgF11JconpyyvWwHdpL8xueQP43BW48dBAEBlzn
         c/nA3dmsyUbS0lHeKkrYRGNb6bMfFhxEMFG/B9CISDsKW3k/2HgRg+1ERhuvYX952q
         2wDOyvCHDJgYGktz7QuhNXdfHg2H8igFgUmMma8A=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [RFC PATCH 7/8] media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_CHANNEL_* flags
Date:   Mon,  3 Jan 2022 18:24:13 +0200
Message-Id: <20220103162414.27723-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2_MBUS_CSI2_CHANNEL_* flags are a legacy API. Only
V4L2_MBUS_CSI2_CHANNEL_0 is used, set in a single driver, and never
read. Drop those flags. Virtual channel information should be conveyed
through frame descriptors instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/adv7180.c   |  1 -
 include/media/v4l2-mediabus.h | 10 ----------
 2 files changed, 11 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 286f5017d9c3..3ff37a550810 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -786,7 +786,6 @@ static int adv7180_get_mbus_config(struct v4l2_subdev *sd,
 		cfg->type = V4L2_MBUS_CSI2_DPHY;
 		cfg->bus.mipi_csi2.num_data_lanes = 1;
 		cfg->bus.mipi_csi2.flags =
-				V4L2_MBUS_CSI2_CHANNEL_0 |
 				V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
 	} else {
 		/*
diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 44195ceeccca..c6626a22b394 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -67,20 +67,10 @@
 #define V4L2_MBUS_DATA_ENABLE_LOW		BIT(15)
 
 /* Serial flags */
-/* CSI-2 Virtual Channel identifiers. */
-#define V4L2_MBUS_CSI2_CHANNEL_0		BIT(4)
-#define V4L2_MBUS_CSI2_CHANNEL_1		BIT(5)
-#define V4L2_MBUS_CSI2_CHANNEL_2		BIT(6)
-#define V4L2_MBUS_CSI2_CHANNEL_3		BIT(7)
 /* Clock non-continuous mode support. */
 #define V4L2_MBUS_CSI2_CONTINUOUS_CLOCK		BIT(8)
 #define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(9)
 
-#define V4L2_MBUS_CSI2_CHANNELS		(V4L2_MBUS_CSI2_CHANNEL_0 | \
-					 V4L2_MBUS_CSI2_CHANNEL_1 | \
-					 V4L2_MBUS_CSI2_CHANNEL_2 | \
-					 V4L2_MBUS_CSI2_CHANNEL_3)
-
 #define V4L2_MBUS_CSI2_MAX_DATA_LANES		8
 
 /**
-- 
Regards,

Laurent Pinchart

