Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC9D92A61C0
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729307AbgKDKgx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:36:53 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:34865 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728287AbgKDKgx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:36:53 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id ACFF420011;
        Wed,  4 Nov 2020 10:36:49 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v2 05/30] media: ov5647: Fix format initialization
Date:   Wed,  4 Nov 2020 11:35:57 +0100
Message-Id: <20201104103622.595908-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201104103622.595908-1-jacopo@jmondi.org>
References: <20201104103622.595908-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver currently support a single format. Fix its initialization to
use the only supported resolution.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 9093a1ca7bce2..04551ed683df3 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -560,9 +560,8 @@ static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	crop->height = OV5647_WINDOW_HEIGHT_DEF;
 
 	format->code = MEDIA_BUS_FMT_SBGGR8_1X8;
-
-	format->width = OV5647_WINDOW_WIDTH_DEF;
-	format->height = OV5647_WINDOW_HEIGHT_DEF;
+	format->width = 640;
+	format->height = 480;
 	format->field = V4L2_FIELD_NONE;
 	format->colorspace = V4L2_COLORSPACE_SRGB;
 
-- 
2.29.1

