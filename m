Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C56A87D41CB
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 23:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbjJWVkN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 17:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbjJWVkM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 17:40:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A24CADE
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 14:40:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB093EEE;
        Mon, 23 Oct 2023 23:39:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698097196;
        bh=nSNZHPn2nBXSvsMqBefH+9xDOuFvUy21+C2bwlYHLFw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XYQKq0CMjE1/LRiKVS3ttD/5ZqES9YwQd3ONoQSqp/hqxLFRNCeMH9LprIJUWV6Tn
         T78lYHjjBK7SDGNCQB8zIFmk0ydZXSCnz9E/FRVIT3TGHKU40+HdS6UGU0rXvdbydB
         lRASSZzth4GrgQgnMgteI73KCpErXIAQybqyfIqY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH 2/7] media: microchip-isc: Use accessors for pad config 'try_*' fields
Date:   Tue, 24 Oct 2023 00:40:06 +0300
Message-ID: <20231023214011.17730-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023214011.17730-1-laurent.pinchart@ideasonboard.com>
References: <20231023214011.17730-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The 'try_*' fields of the v4l2_subdev_pad_config structure are meant to
be accessed through helper functions. Replace direct access with usage
of the v4l2_subdev_get_pad_format(), v4l2_subdev_get_pad_crop() and
v4l2_subdev_get_pad_compose() helpers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 1f8528844497..a901be02e2f6 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -854,6 +854,8 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 static void isc_try_fse(struct isc_device *isc,
 			struct v4l2_subdev_state *sd_state)
 {
+	struct v4l2_rect *try_crop =
+		v4l2_subdev_get_pad_crop(isc->current_subdev->sd, sd_state, 0);
 	struct v4l2_subdev_frame_size_enum fse = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
@@ -875,11 +877,11 @@ static void isc_try_fse(struct isc_device *isc,
 	 * just use the maximum ISC can receive.
 	 */
 	if (ret) {
-		sd_state->pads->try_crop.width = isc->max_width;
-		sd_state->pads->try_crop.height = isc->max_height;
+		try_crop->width = isc->max_width;
+		try_crop->height = isc->max_height;
 	} else {
-		sd_state->pads->try_crop.width = fse.max_width;
-		sd_state->pads->try_crop.height = fse.max_height;
+		try_crop->width = fse.max_width;
+		try_crop->height = fse.max_height;
 	}
 }
 
-- 
Regards,

Laurent Pinchart

