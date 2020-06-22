Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC2F203D9D
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 19:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729929AbgFVRQ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 13:16:26 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:34089 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729924AbgFVRQZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 13:16:25 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7CA5B20003;
        Mon, 22 Jun 2020 17:16:21 +0000 (UTC)
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
Subject: [PATCH 06/25] media: ov5647: Fix format initialization
Date:   Mon, 22 Jun 2020 19:18:51 +0200
Message-Id: <20200622171910.608894-7-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622171910.608894-1-jacopo@jmondi.org>
References: <20200622171910.608894-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
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
index 43fecf0ca58f3..c92856d3aa81c 100644
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
2.27.0

