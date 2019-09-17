Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E822B4835
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 09:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbfIQHXv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 03:23:51 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:37996 "EHLO protonic.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725985AbfIQHXv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 03:23:51 -0400
X-Greylist: delayed 564 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Sep 2019 03:23:50 EDT
Received: from erd987.prtnl (erd987.prtnl [192.168.237.3])
        by sparta (Postfix) with ESMTP id 63AC744A009E;
        Tue, 17 Sep 2019 09:16:27 +0200 (CEST)
From:   Robin van der Gracht <robin@protonic.nl>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marco Felsch <m.felsch@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andreas Pretzsch <apr@cn-eng.de>,
        Robin van der Gracht <robin@protonic.nl>
Subject: [PATCH] media: i2c: tvp5150: Fix horizontal crop stop boundry
Date:   Tue, 17 Sep 2019 09:14:42 +0200
Message-Id: <20190917071442.24986-1-robin@protonic.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The value for AVID stop is relative to the width of the active video area,
not the maximum register value. Zero means equal and a negative value means
we're cropping on the right side.

Signed-off-by: Robin van der Gracht <robin@protonic.nl>
---
 drivers/media/i2c/tvp5150.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index f47cb9a023fb..6bc65ab5e8ab 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1231,10 +1231,10 @@ __tvp5150_set_selection(struct v4l2_subdev *sd, struct v4l2_rect rect)
 	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_ST_LSB,
 		     rect.left | (1 << TVP5150_CROP_SHIFT));
 	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_MSB,
-		     (rect.left + rect.width - TVP5150_MAX_CROP_LEFT) >>
+		     (rect.left + rect.width - TVP5150_H_MAX) >>
 		     TVP5150_CROP_SHIFT);
 	regmap_write(decoder->regmap, TVP5150_ACT_VD_CROP_STP_LSB,
-		     rect.left + rect.width - TVP5150_MAX_CROP_LEFT);
+		     rect.left + rect.width - TVP5150_H_MAX);
 }
 
 static int tvp5150_set_selection(struct v4l2_subdev *sd,
-- 
2.20.1

