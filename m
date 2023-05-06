Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B217F6F8FBF
	for <lists+linux-media@lfdr.de>; Sat,  6 May 2023 09:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbjEFHOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 May 2023 03:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbjEFHOe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 May 2023 03:14:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACA511601
        for <linux-media@vger.kernel.org>; Sat,  6 May 2023 00:14:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19CC72D8;
        Sat,  6 May 2023 09:14:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683357268;
        bh=NmcFDOPXBhR4UaWRJQVj7riQqYz++2QgtwNLz3ZeosA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=baMwQzS3DOFWf7ahE66AfjSwj2VaSQmpxq848voOSSuw4PlJJGh6XxHstz7Axkhqe
         TGD62KUq/Yxu/lWINjTUkmGp9YNOCM20Bx2/ol9H18yO91m1IWQfq9XjSS9EGHwRSv
         JUHB/mEX4FxBcEXBhHurmjI2+JZz0Q6Z6PLqKBus=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 3/7] media: uvcvideo: Use clamp() to replace manual implementation
Date:   Sat,  6 May 2023 10:14:23 +0300
Message-Id: <20230506071427.28108-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230506071427.28108-1-laurent.pinchart@ideasonboard.com>
References: <20230506071427.28108-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The kernel has a nice clamp() macro, use it to replace a manual
implementation based on min() and max(). No functional change is
intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 1539eaf8f7d8..9e597bbbfe07 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -437,9 +437,9 @@ static int uvc_parse_format(struct uvc_device *dev,
 		 */
 		n -= frame->bFrameIntervalType ? 1 : 2;
 		frame->dwDefaultFrameInterval =
-			min(frame->dwFrameInterval[n],
-			    max(frame->dwFrameInterval[0],
-				frame->dwDefaultFrameInterval));
+			clamp(frame->dwDefaultFrameInterval,
+			      frame->dwFrameInterval[0],
+			      frame->dwFrameInterval[n]);
 
 		if (dev->quirks & UVC_QUIRK_RESTRICT_FRAME_RATE) {
 			frame->bFrameIntervalType = 1;
-- 
Regards,

Laurent Pinchart

