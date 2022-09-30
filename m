Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66D775F0BBE
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 14:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbiI3M2q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 08:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbiI3M2p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 08:28:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0420817C232
        for <linux-media@vger.kernel.org>; Fri, 30 Sep 2022 05:28:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oeF8E-0005Kn-9m; Fri, 30 Sep 2022 14:28:42 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oeF8F-003nW5-3J; Fri, 30 Sep 2022 14:28:41 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oeF8D-007KZP-0A; Fri, 30 Sep 2022 14:28:41 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de
Subject: [PATCH v2] usb: gadget: uvc: don't put item still in use
Date:   Fri, 30 Sep 2022 14:28:39 +0200
Message-Id: <20220930122839.1747279-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YzbZ62gq3i4n7Vhx@kroah.com>
References: <YzbZ62gq3i4n7Vhx@kroah.com>
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

With the patch "588b9e85609b (usb: gadget: uvc: add v4l2 enumeration api
calls)" the driver is keeping a list of configfs entries currently
configured. The list is used in uvc_v4l2 on runtime.

The driver now is giving back the list item just after it was referenced
with config_item_put. It also calls config_item_put on uvc_free, which
is the only and right place to give back the reference. This patch fixes
the issue by removing the extra config_item_put in uvc_alloc.

Fixes: 588b9e85609b (usb: gadget: uvc: add v4l2 enumeration api calls)
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - fixed commitish to valid one from usb-next tree

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

