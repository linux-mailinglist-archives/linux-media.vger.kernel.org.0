Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC7D66B3F2
	for <lists+linux-media@lfdr.de>; Sun, 15 Jan 2023 21:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbjAOUwP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Jan 2023 15:52:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbjAOUwN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Jan 2023 15:52:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0222613512
        for <linux-media@vger.kernel.org>; Sun, 15 Jan 2023 12:52:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC6E7308;
        Sun, 15 Jan 2023 21:52:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673815931;
        bh=7JzGAJg+dCmukEwA1B86ELkQPjdR8PVKZ+2VY7Xqxmc=;
        h=From:To:Cc:Subject:Date:From;
        b=kisDv5h6sC/1joFLr1lq+nK3q5Ea3mQW9rVWuQGCizx3PLEk7p0JDFRcuSg/lkptn
         wUz+xNmeTuCoxFQGJ5auHZ2naWeLtvZDZgTzD4Okot8lcQdxtm/IpkS38P2lwG9lq1
         pTZL4+kI1U7f7LZSsiQYnfw9hx3WCaDURfTusSag=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Giuliano Lotta <giuliano.lotta@gmail.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] media: uvcvideo: Force UVC version to 1.0a for 0408:4035
Date:   Sun, 15 Jan 2023 22:52:10 +0200
Message-Id: <20230115205210.20077-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
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

The Quanta ACER HD User Facing camera reports a UVC 1.50 version, but
implements UVC 1.0a as shown by the UVC probe control being 26 bytes
long. Force the UVC version for that device.

Reported-by: Giuliano Lotta <giuliano.lotta@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Giuliano, I believe you've successfully tested this patch. If so, could
you reply with a Tested-by tag ? Just copying the following in your
reply will do:

Tested-by: Giuliano Lotta <giuliano.lotta@gmail.com>

 drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 1a186abeb4fa..742eeaff333e 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2429,6 +2429,17 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
 	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
+	/* Quanta ACER HD User Facing */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x0408,
+	  .idProduct		= 0x4035,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
+	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
+		.uvc_version = 0x010a,
+	  } },
 	/* LogiLink Wireless Webcam */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,

base-commit: fd957081cff04668f390c6f290bdcc7fc009a0f1
-- 
Regards,

Laurent Pinchart

