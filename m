Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7907F7D946E
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345673AbjJ0J65 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345663AbjJ0J6z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:58:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAAC0194
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:58:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B5B5DD9;
        Fri, 27 Oct 2023 11:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698400718;
        bh=rWymIpTLqHnLkbHd0t4YKdOskniyBVwy6JPjIpy1guo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J1IoxtIYt4H8gAbKOE7kOn7Ioj00WrNdO2sPcTIHxdK66ryKJI0pGFGoJuwXu25J9
         a523HEvtb7Noo1O/UIQpqa3/6R3FVBhwo4pPkZp6nBsBB6WS7y/amyjXViyA8pLSuH
         bf3OtjJz3eE/R5FlUFH8vRL01YrYCArm99kSUve0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v1 3/9] media: v4l2-subdev: Fix references to pad config
Date:   Fri, 27 Oct 2023 12:58:47 +0300
Message-ID: <20231027095853.29057-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027095853.29057-1-laurent.pinchart@ideasonboard.com>
References: <20231027095853.29057-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2 subdev operations have moved from operating on a
v4l2_subdev_pad_config to a v4l2_subdev_state a long time ago. Fix the
few remaining incorrect references to pad config in the documentation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/driver-api/media/v4l2-subdev.rst | 4 ++--
 include/media/v4l2-subdev.h                    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index e56b50b3f203..a62e4aff31be 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -562,8 +562,8 @@ device configuration. This is often implemented as e.g. an array of struct
 v4l2_mbus_framefmt, one entry for each pad, and similarly for crop and compose
 rectangles.
 
-In addition to the active configuration, each subdev file handle has an array of
-struct v4l2_subdev_pad_config, managed by the V4L2 core, which contains the try
+In addition to the active configuration, each subdev file handle has a struct
+v4l2_subdev_state, managed by the V4L2 core, which contains the try
 configuration.
 
 To simplify the subdev drivers the V4L2 subdev API now optionally supports a
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index b471e68aa5e7..741dc1485768 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -771,7 +771,7 @@ struct v4l2_subdev_state {
 /**
  * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
  *
- * @init_cfg: initialize the pad config to default values
+ * @init_cfg: initialize the subdev state to default values
  * @enum_mbus_code: callback for VIDIOC_SUBDEV_ENUM_MBUS_CODE() ioctl handler
  *		    code.
  * @enum_frame_size: callback for VIDIOC_SUBDEV_ENUM_FRAME_SIZE() ioctl handler
-- 
Regards,

Laurent Pinchart

