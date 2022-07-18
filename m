Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8954D5781D4
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 14:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234888AbiGRMND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 08:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234853AbiGRMM6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 08:12:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC49824BE0
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 05:12:57 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCA106DC;
        Mon, 18 Jul 2022 14:12:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658146376;
        bh=RfenEmd9M9GCmVMjbvXGdx3Cl0CLNBlhMLojz+MhsYs=;
        h=From:To:Cc:Subject:Date:From;
        b=qeT2KfzoRo20xuSkbsWxCE3CcOjzbVjn8PEGToQnbZThRaAvtsAR8DXpCZVIFfIyG
         E/I9o+I4u8dRagjbq7aE8X2yaXty5ZAfIr0ZANhA97jZLul7rdcnqCNZLM+a1urxgv
         +/tDHaFjxIm3B0Mp8ZwBMVnhkpR3AlKtcqI14Aao=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] media: uvcvideo: Fix invalid pointer in uvc_ctrl_init_ctrl()
Date:   Mon, 18 Jul 2022 15:12:19 +0300
Message-Id: <20220718121219.16079-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
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

The handling of per-device mappings introduced in commit 86f7ef773156
("media: uvcvideo: Add support for per-device control mapping
overrides") overwrote the mapping variable after it was initialized and
before it was used, leading to usage of an invalid pointer for devices
with per-device mappings. Fix it.

Fixes: 86f7ef773156 ("media: uvcvideo: Add support for per-device control mapping overrides")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e4826a846861..8c208db9600b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2413,9 +2413,8 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 {
 	const struct uvc_control_info *info = uvc_ctrls;
 	const struct uvc_control_info *iend = info + ARRAY_SIZE(uvc_ctrls);
-	const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
-	const struct uvc_control_mapping *mend =
-		mapping + ARRAY_SIZE(uvc_ctrl_mappings);
+	const struct uvc_control_mapping *mapping;
+	const struct uvc_control_mapping *mend;
 
 	/*
 	 * XU controls initialization requires querying the device for control
@@ -2468,6 +2467,9 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	}
 
 	/* Process common mappings next. */
+	mapping = uvc_ctrl_mappings;
+	mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings);
+
 	for (; mapping < mend; ++mapping) {
 		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
 		    ctrl->info.selector == mapping->selector)

base-commit: 8bd1dbf8d580c425605fb8936309a4e9745a7a95
prerequisite-patch-id: 89d2dc61eb83afb89fb075a63e161ea0b87fdcc7
prerequisite-patch-id: 01354ee4b874fea1acc040a23badff034588362f
prerequisite-patch-id: 7ae47f109892b89675acbdc0c6bcc1487436ec78
-- 
Regards,

Laurent Pinchart

