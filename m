Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C19E95EF7DA
	for <lists+linux-media@lfdr.de>; Thu, 29 Sep 2022 16:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235707AbiI2Ol4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Sep 2022 10:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235286AbiI2Olc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Sep 2022 10:41:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E601C45A9
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 07:41:30 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1odujB-0006Jh-41; Thu, 29 Sep 2022 16:41:29 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1odujB-003czA-Ls; Thu, 29 Sep 2022 16:41:28 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oduj9-005no9-L9; Thu, 29 Sep 2022 16:41:27 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.d
Subject: [PATCH] usb: gadget: uvc: don't put item still in use
Date:   Thu, 29 Sep 2022 16:41:24 +0200
Message-Id: <20220929144124.1365686-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the patch "15a286a0bb08 (usb: gadget: uvc: add v4l2 enumeration api
calls)" the driver is keeping a list of configfs entries currently
configured. The list is used in uvc_v4l2 on runtime.

The driver now is giving back the list item just after it was referenced
with config_item_put. It also calls config_item_put on uvc_free, which
is the only and right place to give back the reference. This patch fixes
the issue by removing the extra config_item_put in uvc_alloc.

Fixes: 15a286a0bb08 (usb: gadget: uvc: add v4l2 enumeration api calls)
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/f_uvc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index e6948cf8def30b..8bc591431d153e 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -995,7 +995,6 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
 		goto err_config;
 
 	uvc->header = to_uvcg_streaming_header(h);
-	config_item_put(h);
 	if (!uvc->header->linked) {
 		mutex_unlock(&opts->lock);
 		kfree(uvc);
-- 
2.30.2

