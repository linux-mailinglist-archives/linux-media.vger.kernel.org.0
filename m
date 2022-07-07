Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60CF856AE5C
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 00:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236996AbiGGWZ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 18:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236883AbiGGWZ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 18:25:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF8161D78
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 15:25:26 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E891756D;
        Fri,  8 Jul 2022 00:25:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657232725;
        bh=xv3Ul7xTtFbu0UXz9tmvD/jNWhFvIkTIYq9eLoYUl7M=;
        h=From:To:Cc:Subject:Date:From;
        b=wc69P+u8HGUCG3LdvWl5jh0jLQ1AII8t0BT6aKfB6DLabq7Rn7HrgiE3ehhavvnmw
         qKlZ9cmWmMC3hrrRaUZLEjvIA38CxU95h/43oYAMQJRUP6trAJut0oxo59temZZxV9
         G8UFv9w136q7XYA8nH5axCPe5ZNH3nfwDo3IKDak=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Yunke Cao <yunkec@google.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4] media: uvcvideo: Use entity get_cur in uvc_ctrl_set
Date:   Fri,  8 Jul 2022 01:24:55 +0300
Message-Id: <20220707222455.21149-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunke Cao <yunkec@google.com>

Entity controls should get_cur using an entity-defined function
instead of via a query. Fix this in uvc_ctrl_set.

Fixes: 65900c581d01 ("media: uvcvideo: Allow entity-defined get_info and get_cur")
Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v3:

- Reflow code in __uvc_ctrl_load_cur()

Changelog since v2:

- Move the logic of setting ctrl_data to 0 into load_cur.
- Do not initialize ret=0.
- Fix __uvc_ctrl_get() spacing.
- Fix typo in the title.
---
 drivers/media/usb/uvc/uvc_ctrl.c | 83 ++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 37 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 0e78233fc8a0..44071040d764 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -963,35 +963,55 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
 	return value;
 }
 
+static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
+			       struct uvc_control *ctrl)
+{
+	u8 *data;
+	int ret;
+
+	if (ctrl->loaded)
+		return 0;
+
+	data = uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT);
+
+	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0) {
+		memset(data, 0, ctrl->info.size);
+		ctrl->loaded = 1;
+
+		return 0;
+	}
+
+	if (ctrl->entity->get_cur)
+		ret = ctrl->entity->get_cur(chain->dev, ctrl->entity,
+					    ctrl->info.selector, data,
+					    ctrl->info.size);
+	else
+		ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
+				     ctrl->entity->id, chain->dev->intfnum,
+				     ctrl->info.selector, data,
+				     ctrl->info.size);
+
+	if (ret < 0)
+		return ret;
+
+	ctrl->loaded = 1;
+
+	return ret;
+}
+
 static int __uvc_ctrl_get(struct uvc_video_chain *chain,
-	struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
-	s32 *value)
+			  struct uvc_control *ctrl,
+			  struct uvc_control_mapping *mapping,
+			  s32 *value)
 {
 	int ret;
 
 	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
 		return -EACCES;
 
-	if (!ctrl->loaded) {
-		if (ctrl->entity->get_cur) {
-			ret = ctrl->entity->get_cur(chain->dev,
-				ctrl->entity,
-				ctrl->info.selector,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
-				ctrl->info.size);
-		} else {
-			ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
-				ctrl->entity->id,
-				chain->dev->intfnum,
-				ctrl->info.selector,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
-				ctrl->info.size);
-		}
-		if (ret < 0)
-			return ret;
-
-		ctrl->loaded = 1;
-	}
+	ret = __uvc_ctrl_load_cur(chain, ctrl);
+	if (ret < 0)
+		return ret;
 
 	*value = __uvc_ctrl_get_value(mapping,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
@@ -1783,21 +1803,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	 * needs to be loaded from the device to perform the read-modify-write
 	 * operation.
 	 */
-	if (!ctrl->loaded && (ctrl->info.size * 8) != mapping->size) {
-		if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0) {
-			memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
-				0, ctrl->info.size);
-		} else {
-			ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
-				ctrl->entity->id, chain->dev->intfnum,
-				ctrl->info.selector,
-				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
-				ctrl->info.size);
-			if (ret < 0)
-				return ret;
-		}
-
-		ctrl->loaded = 1;
+	if ((ctrl->info.size * 8) != mapping->size) {
+		ret = __uvc_ctrl_load_cur(chain, ctrl);
+		if (ret < 0)
+			return ret;
 	}
 
 	/* Backup the current value in case we need to rollback later. */
-- 
Regards,

Laurent Pinchart

