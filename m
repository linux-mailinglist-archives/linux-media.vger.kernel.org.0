Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 754F11B6AD5
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 03:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgDXBew (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 21:34:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56640 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgDXBew (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 21:34:52 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E19B528;
        Fri, 24 Apr 2020 03:34:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587692090;
        bh=kpMzRlNYHmFNrI0qa2iGgS11CSFwXHF5EpH4SwtFMfc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V/tWtr/QwvgSJPRkx/QEOJuDsE4J+ErViZE1CR6nQpFwgykGyslLtL2aMNcPZVl3t
         5Ca2cP9yCJDJz3pjHS/khFe4c/GeegZbTN2gPFv/uZJHAVHfWQTN5qAJUYjKWav1Iu
         Xbmn7e31UuZQYlRzPRoJCPaRmGbGwkRCuSMuUVms=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH 1/5] media: i2c: imx219: Set V4L2_SUBDEV_FL_HAS_EVENTS flag
Date:   Fri, 24 Apr 2020 04:34:15 +0300
Message-Id: <20200424013419.12954-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200424013419.12954-1-laurent.pinchart@ideasonboard.com>
References: <20200424013419.12954-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx219 subdev can generate control events, set the
V4L2_SUBDEV_FL_HAS_EVENTS flag.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index cb03bdec1f9c..6e585c39a46a 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1396,7 +1396,8 @@ static int imx219_probe(struct i2c_client *client)
 
 	/* Initialize subdev */
 	imx219->sd.internal_ops = &imx219_internal_ops;
-	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE
+			 |  V4L2_SUBDEV_FL_HAS_EVENTS;
 	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	/* Initialize source pad */
-- 
Regards,

Laurent Pinchart

