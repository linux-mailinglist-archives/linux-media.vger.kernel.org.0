Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18900203DA0
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 19:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729973AbgFVRQg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 13:16:36 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:34865 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729850AbgFVRQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 13:16:36 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 00B2A20003;
        Mon, 22 Jun 2020 17:16:31 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     lolivei@synopsys.com, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mrodin@de.adit-jv.com,
        hugues.fruchet@st.com, mripard@kernel.org, aford173@gmail.com,
        sudipi@jp.adit-jv.com, andrew_gabbasov@mentor.com,
        erosca@de.adit-jv.com, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Subject: [PATCH 09/25] media: ov5647: Fix return value from read/write
Date:   Mon, 22 Jun 2020 19:18:54 +0200
Message-Id: <20200622171910.608894-10-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622171910.608894-1-jacopo@jmondi.org>
References: <20200622171910.608894-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov5647_read()/ov5647_write() return in case of success the number
of bytes read or written respectively. This requires callers to check
if the return value is less than zero to detect an error. Unfortunately,
in several places, callers directly return the result of a read/write
call, causing issues when the returned valued is checked to be different
from zero to detect an error.

Fix this by returning zero if i2c_master_send() and i2c_master_read()
return a positive value (the number of bytes written or read).

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 61aa86e507b32..0c88f682de9b9 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -204,11 +204,13 @@ static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
 	int ret;
 
 	ret = i2c_master_send(client, data, 3);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
 				__func__, reg);
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
@@ -225,11 +227,13 @@ static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
 	}
 
 	ret = i2c_master_recv(client, val, 1);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_dbg(&client->dev, "%s: i2c read error, reg: %x\n",
 				__func__, reg);
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static int ov5647_write_array(struct v4l2_subdev *sd,
-- 
2.27.0

