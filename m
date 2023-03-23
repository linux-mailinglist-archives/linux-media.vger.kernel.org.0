Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAB1B6C66E1
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 12:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbjCWLlk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 07:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbjCWLlf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 07:41:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02A01E1CB
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 04:41:34 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pfJK0-0007OB-Fn; Thu, 23 Mar 2023 12:41:32 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu, 23 Mar 2023 12:41:14 +0100
Subject: [PATCH 6/8] usb: gadget: uvc: try harder to find a valid format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-uvc-gadget-cleanup-v1-6-e41f0c5d9d8e@pengutronix.de>
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

The TRY_FMT call should try to avoid returning EINVAL. If the requested
pixelformat is not supported by the driver, the driver should fall back
to it's own default and only then fail the request.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/usb/gadget/function/uvc_v4l2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 3f728f451ed5..c5983bb0a8d1 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -317,11 +317,15 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
 		 fmt->fmt.pix.width, fmt->fmt.pix.height);
 
 	uformat = find_format_by_pix(uvc, fmt->fmt.pix.pixelformat);
+	if (!uformat)
+		uformat = get_default_format(uvc);
 	if (!uformat)
 		return -EINVAL;
 
 	uframe = find_closest_frame_by_size(uvc, uformat,
 				fmt->fmt.pix.width, fmt->fmt.pix.height);
+	if (!uframe)
+		uframe = get_default_frame(uvc, uformat);
 	if (!uframe)
 		return -EINVAL;
 

-- 
2.30.2
