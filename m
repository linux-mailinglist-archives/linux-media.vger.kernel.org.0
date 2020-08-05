Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8CEE23CC44
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 18:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgHEQfH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 12:35:07 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:41552 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgHEQdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 12:33:02 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 5B67C3B0E8F
        for <linux-media@vger.kernel.org>; Wed,  5 Aug 2020 10:55:19 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D167EC000F;
        Wed,  5 Aug 2020 10:53:55 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 4/4] media: i2c: imx219: Selection compliance fixes
Date:   Wed,  5 Aug 2020 12:57:21 +0200
Message-Id: <20200805105721.15445-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805105721.15445-1-jacopo@jmondi.org>
References: <20200805105721.15445-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil@xs4all.nl>

To comply with the intended usage of the V4L2 selection target when
used to retrieve a sensor image properties, adjust the rectangles
returned by the imx219 driver.

The top/left crop coordinates of the TGT_CROP rectangle were set to
(0, 0) instead of (8, 8) which is the offset from the larger physical
pixel array rectangle. This was also a mismatch with the default values
crop rectangle value, so this is corrected. Found with v4l2-compliance.

While at it, add V4L2_SEL_TGT_CROP_BOUNDS support: CROP_DEFAULT and
CROP_BOUNDS have the same size as the non-active pixels are not readable
using the selection API. Found with v4l2-compliance.

Fixes: e6d4ef7d58aa7 ("media: i2c: imx219: Implement get_selection")
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
[reword commit message, use macros for pixel offsets]
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/imx219.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 60b23d113fc56..ff48a95b448b1 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -473,8 +473,8 @@ static const struct imx219_mode supported_modes[] = {
 		.width = 3280,
 		.height = 2464,
 		.crop = {
-			.left = 0,
-			.top = 0,
+			.left = IMX219_PIXEL_ARRAY_LEFT,
+			.top = IMX219_PIXEL_ARRAY_TOP,
 			.width = 3280,
 			.height = 2464
 		},
@@ -489,8 +489,8 @@ static const struct imx219_mode supported_modes[] = {
 		.width = 1920,
 		.height = 1080,
 		.crop = {
-			.left = 680,
-			.top = 692,
+			.left = 688,
+			.top = 700,
 			.width = 1920,
 			.height = 1080
 		},
@@ -505,8 +505,8 @@ static const struct imx219_mode supported_modes[] = {
 		.width = 1640,
 		.height = 1232,
 		.crop = {
-			.left = 0,
-			.top = 0,
+			.left = IMX219_PIXEL_ARRAY_LEFT,
+			.top = IMX219_PIXEL_ARRAY_TOP,
 			.width = 3280,
 			.height = 2464
 		},
@@ -521,8 +521,8 @@ static const struct imx219_mode supported_modes[] = {
 		.width = 640,
 		.height = 480,
 		.crop = {
-			.left = 1000,
-			.top = 752,
+			.left = 1008,
+			.top = 760,
 			.width = 1280,
 			.height = 960
 		},
@@ -1045,6 +1045,7 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 		return 0;
 
 	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
 		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
 		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
 		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
-- 
2.27.0

