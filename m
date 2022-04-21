Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBC050AA8D
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 23:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441871AbiDUVRh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 17:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1441843AbiDUVRe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 17:17:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B144BB9B
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 14:14:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nhe8O-0006Xb-L1; Thu, 21 Apr 2022 23:14:40 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nhe8P-004R13-A5; Thu, 21 Apr 2022 23:14:39 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nhe8M-00EGou-4S; Thu, 21 Apr 2022 23:14:38 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: [RESEND v7 3/7] usb: gadget: uvc: prevent index variables to start from 0
Date:   Thu, 21 Apr 2022 23:14:23 +0200
Message-Id: <20220421211427.3400834-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421211427.3400834-1-m.grzeschik@pengutronix.de>
References: <20220421211427.3400834-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some configfs variables like bDefaultFrameIndex are always starting by
1. This patch adds a check to prevent setting those variables to 0.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v7: -

 drivers/usb/gadget/function/uvc_configfs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 63b8d3758b38cb..cffa615b6db750 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1565,6 +1565,12 @@ uvcg_uncompressed_##cname##_store(struct config_item *item,		\
 	if (ret)							\
 		goto end;						\
 									\
+	/* index values in uvc are never 0 */				\
+	if (!num) {							\
+		ret = -EINVAL;						\
+		goto end;						\
+	}								\
+									\
 	u->desc.aname = num;						\
 	ret = len;							\
 end:									\
@@ -1758,6 +1764,12 @@ uvcg_mjpeg_##cname##_store(struct config_item *item,			\
 	if (ret)							\
 		goto end;						\
 									\
+	/* index values in uvc are never 0 */				\
+	if (!num) {							\
+		ret = -EINVAL;						\
+		goto end;						\
+	}								\
+									\
 	u->desc.aname = num;						\
 	ret = len;							\
 end:									\
-- 
2.30.2

