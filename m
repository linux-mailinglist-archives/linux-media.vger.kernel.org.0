Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F15B06C66DD
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 12:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbjCWLlf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 07:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjCWLld (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 07:41:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA65E193F0
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 04:41:32 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pfJJy-0007OB-L7; Thu, 23 Mar 2023 12:41:30 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu, 23 Mar 2023 12:41:09 +0100
Subject: [PATCH 1/8] usb: gadget: uvc: use fourcc printk helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-uvc-gadget-cleanup-v1-1-e41f0c5d9d8e@pengutronix.de>
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
In-Reply-To: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.11.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a format helper for printing fourcc codes. Use that one instead
of manually formatting the pixelformat for printing.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/usb/gadget/function/uvc_v4l2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 3f0a9795c0d4..13c7ba06f994 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -240,16 +240,13 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	struct uvc_video *video = &uvc->video;
 	struct uvcg_format *uformat;
 	struct uvcg_frame *uframe;
-	u8 *fcc;
 
 	if (fmt->type != video->queue.queue.type)
 		return -EINVAL;
 
-	fcc = (u8 *)&fmt->fmt.pix.pixelformat;
-	uvcg_dbg(&uvc->func, "Trying format 0x%08x (%c%c%c%c): %ux%u\n",
-		fmt->fmt.pix.pixelformat,
-		fcc[0], fcc[1], fcc[2], fcc[3],
-		fmt->fmt.pix.width, fmt->fmt.pix.height);
+	uvcg_dbg(&uvc->func, "Trying format %p4cc: %ux%u\n",
+		 &fmt->fmt.pix.pixelformat,
+		 fmt->fmt.pix.width, fmt->fmt.pix.height);
 
 	uformat = find_format_by_pix(uvc, fmt->fmt.pix.pixelformat);
 	if (!uformat)

-- 
2.30.2
