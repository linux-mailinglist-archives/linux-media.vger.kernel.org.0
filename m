Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136302B97B2
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 17:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728252AbgKSQUZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 11:20:25 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:35449 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbgKSQUZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 11:20:25 -0500
X-Originating-IP: 93.34.118.233
Received: from localhost.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id AE1211C0016;
        Thu, 19 Nov 2020 16:20:21 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v4 08/30] media: ov5647: Fix return value from read/write
Date:   Thu, 19 Nov 2020 17:19:34 +0100
Message-Id: <20201119161956.756455-9-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119161956.756455-1-jacopo@jmondi.org>
References: <20201119161956.756455-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 5c5449c42edf6..79ac8c76baeac 100644
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
2.29.1

