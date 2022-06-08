Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80A40542EA9
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 13:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237633AbiFHLED (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 07:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237630AbiFHLEB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 07:04:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4366B1F5C69
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 04:03:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nytTc-0003yq-FF; Wed, 08 Jun 2022 13:03:52 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nytTd-007ApT-10; Wed, 08 Jun 2022 13:03:51 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nytTb-000ai9-21; Wed, 08 Jun 2022 13:03:51 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: [RESEND v2 3/3] usb: gadget: uvc: call uvc uvcg_warn on completed status instead of uvcg_info
Date:   Wed,  8 Jun 2022 13:03:39 +0200
Message-Id: <20220608110339.141036-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220608110339.141036-1-m.grzeschik@pengutronix.de>
References: <20220608110339.141036-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Likewise to the uvcvideo hostside driver, this patch is changing the
usb_request message of an non zero completion handler call from dev_info
to dev_warn.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
v1 -> v2: - no changes

 drivers/usb/gadget/function/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 9a9101851bc1e8..1a3d39fd140f15 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -261,7 +261,7 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 		break;
 
 	default:
-		uvcg_info(&video->uvc->func,
+		uvcg_warn(&video->uvc->func,
 			  "VS request completed with status %d.\n",
 			  req->status);
 		uvcg_queue_cancel(queue, 0);
-- 
2.30.2

