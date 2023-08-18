Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7A11780FA5
	for <lists+linux-media@lfdr.de>; Fri, 18 Aug 2023 17:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378347AbjHRPzX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Aug 2023 11:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378385AbjHRPzO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Aug 2023 11:55:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5D32D4A
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 08:55:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6383AC85;
        Fri, 18 Aug 2023 17:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692374036;
        bh=qFrB9K1b/R39tIb4jURymY8WERNmcqNGoHm1Ip39HFU=;
        h=From:To:Cc:Subject:Date:From;
        b=C73lZSdLneAIEMkZ7TBaq//Y7fOHetkVxkIXtdMihGfD1XnLQNXPS2Bwr/PISUbBA
         X0qmC1kxswByxk9dtNlqimElpgms5dVSwKF46RkSZ1913IDStd/fRHM2jqr+U3tGcX
         k+IweYwtlu8RN//TeND5ZiPyyy9YrZNmACmmj/ro=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: v4l2-subdev: Document that routing support depends on streams
Date:   Fri, 18 Aug 2023 18:55:18 +0300
Message-ID: <20230818155518.440-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Routing support, through the subdev .set_routing() operation, requires
the subdev to support streams. This is however not clearly documented
anywhere. Fix it by expanding the operation's documentation to indicate
that subdevs must set the V4L2_SUBDEV_FL_STREAMS flag.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index b325df0d54d6..0b04ed1994b6 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -822,8 +822,9 @@ struct v4l2_subdev_state {
  *		     operation shall fail if the pad index it has been called on
  *		     is not valid or in case of unrecoverable failures.
  *
- * @set_routing: enable or disable data connection routes described in the
- *		 subdevice routing table.
+ * @set_routing: Enable or disable data connection routes described in the
+ *		 subdevice routing table. Subdevs that implement this operation
+ *		 must set the V4L2_SUBDEV_FL_STREAMS flag.
  *
  * @enable_streams: Enable the streams defined in streams_mask on the given
  *	source pad. Subdevs that implement this operation must use the active
-- 
Regards,

Laurent Pinchart

