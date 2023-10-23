Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6A477D429F
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 00:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbjJWWRK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 18:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbjJWWRJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 18:17:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABC3FF
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 15:17:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D59BAE;
        Tue, 24 Oct 2023 00:16:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698099414;
        bh=KFWRqQ8Nn0nNQd1NyURsNl1ysF5+ghwjNVNKnq3BzVs=;
        h=From:To:Cc:Subject:Date:From;
        b=nUrJ+qekwnFStrlCAEs5Ucjim6DOCVnO4kks/VnmxH7FhbTSV6FotXtPV1Iq01u/Z
         u8qWXkvLN+lDs2Aac7mIHaxdQVE5MOcXA3cZXvevgQRne3h8M8ZfBlpcFd668c5EgI
         u2UWCywh5D2redsFhU07ppPJ3w0l4WBWSIsB+kHw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] media: v4l2-subdev: Drop outdated comment for v4l2_subdev_pad_config
Date:   Tue, 24 Oct 2023 01:17:12 +0300
Message-ID: <20231023221712.20352-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
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

The v4l2_subdev_pad_config structure is not passed to subdev operations
anymore. Drop an outdated comment to refers to that old mechanism.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index bb1aad264756..bbcee4f3da1e 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -691,10 +691,6 @@ struct v4l2_subdev_ir_ops {
  * @format: &struct v4l2_mbus_framefmt
  * @crop: &struct v4l2_rect to be used for crop
  * @compose: &struct v4l2_rect to be used for compose
- *
- * This structure only needs to be passed to the pad op if the 'which' field
- * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
- * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
  */
 struct v4l2_subdev_pad_config {
 	struct v4l2_mbus_framefmt format;
-- 
Regards,

Laurent Pinchart

