Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 965B95446ED
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 11:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239498AbiFIJJE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 05:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239170AbiFIJJD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 05:09:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C9D15A34
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 02:09:02 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57293BB8;
        Thu,  9 Jun 2022 11:08:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654765737;
        bh=ruMQtoBs4nh0MILXXro9Kb8vpLsILCGuHnge7VL95R0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dN+imfyPb3c3Qi2VzA1Owh43lyQXsQLN9WRWOI7lcvDqFOxWCNtyUmNOg6qZARRBW
         UmPRw9P+ZpI1NoZ+E6sQ+9MjUbKmcjymVEqK10+Gsd0W4z5qtqKlRj2n5pRPnV6YKD
         Dd3mdjYbFE3PNlhntThE4iWgAz7NihSjfhykdOGM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@google.com>
Subject: [PATCH v5 7/7] media: uvcvideo: Limit power line control for Acer EasyCamera
Date:   Thu,  9 Jun 2022 12:08:43 +0300
Message-Id: <20220609090843.16423-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609090843.16423-1-laurent.pinchart@ideasonboard.com>
References: <20220609090843.16423-1-laurent.pinchart@ideasonboard.com>
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

From: Ricardo Ribalda <ribalda@chromium.org>

The device does not implement the power line control correctly. Add a
corresponding control mapping override.

Bus 001 Device 003: ID 5986:1172 Acer, Inc EasyCamera
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x5986 Acer, Inc
  idProduct          0x1172
  bcdDevice           56.04
  iManufacturer           3 Bison
  iProduct                1 EasyCamera
  iSerial                 2
  bNumConfigurations      1

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v3:

- Turn the power line quirk into a control mapping overrides array
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 0080a462d62a..9c05776f11d1 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3264,6 +3264,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_FORCE_BPP) },
+	/* Acer EasyCamera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x5986,
+	  .idProduct		= 0x1172,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
 	/* Intel RealSense D4M */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
Regards,

Laurent Pinchart

