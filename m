Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4367D7D934E
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345352AbjJ0JQu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234978AbjJ0JQt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:16:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA47593
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:16:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4503CBEB;
        Fri, 27 Oct 2023 11:16:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698398193;
        bh=0S23QRHl5dZOe+hhSJs11r22GkhzL/SkrzsfweJYxDE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RLIRQU5kAF6U+PtkNAnuueaLzmVMKa8D1/pv4jeDRDScslnQ2DDG4hiWP55xkWt9f
         vG5ADPhjX9GG0RuDuQQyTNR+4BTntNcgZp637NGUBVNlMMe1sfstuDpDMrWiSgW0dX
         Y+mKg+jfR4poKxZBj9RIK34LRl0zTRrP8Xc8HiYw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 2/9] media: v4l2-subdev: Drop outdated comment for v4l2_subdev_pad_config
Date:   Fri, 27 Oct 2023 12:16:42 +0300
Message-ID: <20231027091649.10553-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027091649.10553-1-laurent.pinchart@ideasonboard.com>
References: <20231027091649.10553-1-laurent.pinchart@ideasonboard.com>
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

The v4l2_subdev_pad_config structure is not passed to subdev operations
anymore. Drop an outdated comment to refers to that old mechanism.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index ae9e0f0c1b19..72131c943e06 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -692,10 +692,6 @@ struct v4l2_subdev_ir_ops {
  * @try_crop: &struct v4l2_rect to be used for crop
  * @try_compose: &struct v4l2_rect to be used for compose
  *
- * This structure only needs to be passed to the pad op if the 'which' field
- * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
- * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
- *
  * Note: This struct is also used in active state, and the 'try' prefix is
  * historical and to be removed.
  */
-- 
Regards,

Laurent Pinchart

