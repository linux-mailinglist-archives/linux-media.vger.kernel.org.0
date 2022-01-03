Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1610F4834B9
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 17:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234448AbiACQYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 11:24:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56406 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234470AbiACQYc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 11:24:32 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B73C812BF;
        Mon,  3 Jan 2022 17:24:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641227071;
        bh=tiyXS7F5q8JIqF7g0pEKf+WO7/5f/IrRT2ubK2i9zdE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kf5w8lUEx/8CWB8S9ndf1+rlz1mG2+X2lXnk0vK11RzLuEoBVQj8KiWe8paJegcwG
         3UaWHpMiDT65ZdpngrzG/4OjTTdjo1z5Np85Im2Wcr08N1b+XFPK7xXmdqPKj5UbrV
         oU2il2M4WV51YFD5J8Ahti+3Xu9Ee4k63tsDnUuc=
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
Subject: [RFC PATCH 6/8] media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_*_LANE flags
Date:   Mon,  3 Jan 2022 18:24:12 +0200
Message-Id: <20220103162414.27723-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2_MBUS_CSI2_*_LANE flags are a legacy API and are unused. Drop
them.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/media/v4l2-mediabus.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 269aaf57ba32..44195ceeccca 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -21,8 +21,6 @@
  * clear both the V4L2_MBUS_HSYNC_ACTIVE_HIGH and the
  * V4L2_MBUS_HSYNC_ACTIVE_LOW flag at the same time. Instead either flag
  * V4L2_MBUS_HSYNC_ACTIVE_HIGH or flag V4L2_MBUS_HSYNC_ACTIVE_LOW shall be set.
- * The same is true for the V4L2_MBUS_CSI2_1/2/3/4_LANE flags group: only one
- * of these four bits shall be set.
  *
  * TODO: replace the existing V4L2_MBUS_* flags with structures of fields
  * to avoid conflicting settings.
@@ -69,11 +67,6 @@
 #define V4L2_MBUS_DATA_ENABLE_LOW		BIT(15)
 
 /* Serial flags */
-/* CSI-2 D-PHY number of data lanes. */
-#define V4L2_MBUS_CSI2_1_LANE			BIT(0)
-#define V4L2_MBUS_CSI2_2_LANE			BIT(1)
-#define V4L2_MBUS_CSI2_3_LANE			BIT(2)
-#define V4L2_MBUS_CSI2_4_LANE			BIT(3)
 /* CSI-2 Virtual Channel identifiers. */
 #define V4L2_MBUS_CSI2_CHANNEL_0		BIT(4)
 #define V4L2_MBUS_CSI2_CHANNEL_1		BIT(5)
@@ -83,10 +76,6 @@
 #define V4L2_MBUS_CSI2_CONTINUOUS_CLOCK		BIT(8)
 #define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(9)
 
-#define V4L2_MBUS_CSI2_LANES		(V4L2_MBUS_CSI2_1_LANE | \
-					 V4L2_MBUS_CSI2_2_LANE | \
-					 V4L2_MBUS_CSI2_3_LANE | \
-					 V4L2_MBUS_CSI2_4_LANE)
 #define V4L2_MBUS_CSI2_CHANNELS		(V4L2_MBUS_CSI2_CHANNEL_0 | \
 					 V4L2_MBUS_CSI2_CHANNEL_1 | \
 					 V4L2_MBUS_CSI2_CHANNEL_2 | \
-- 
Regards,

Laurent Pinchart

