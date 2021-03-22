Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7FFC344999
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 16:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhCVPrf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 11:47:35 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:47445 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230064AbhCVPrF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 11:47:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OMlelxHbZ4XAGOMlilYPSg; Mon, 22 Mar 2021 16:47:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616428022; bh=COG8Xhq17cgDUjJsX3aFQTpkFW0BX45uWQoxhlv8Pp4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=nkWsyOdSYvq4Qq8tsjDl97bKpppCMoLGOmsQyds3pWkzKsMqocEXwgUfF8Hk95wd2
         B0fA6IZPG1s1JeoGiuhjp+39dfgslIE3C7xRYJJT3J+IMjfmP9uuD2a3Mmfz9HM2cU
         VofXBoAomKBjZ+PGO47R2SetusW2h4Wqw+4I22GutXppFifmE8HIhHOroLrsbELjtN
         YlnAn+Y1UOxHAHVy6n8U4tEdUvox+x58WHDpK2Mhmb9AZPe7pOtCFg1VfT/Av+RZ4E
         m8m+MadqHeIUOD2sWAcqJHGf4E4X2GkzP1sYdM8ti8ZL51/8DfysyB+hAPz/1Jdlk0
         frhuhq0xGBHOQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Edgar Thier <info@edgarthier.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv2 2/3] uvc: Add 12-bit raw bayer linear packed formats
Date:   Mon, 22 Mar 2021 16:46:57 +0100
Message-Id: <20210322154658.1409391-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210322154658.1409391-1-hverkuil-cisco@xs4all.nl>
References: <20210322154658.1409391-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfKxNnVhm/ns9fQZY7nTtooHC/ljqR/ZbmX/1gBYkibWDC5s7UBNZ5LE+bC3WKMcOfiZlA6JvgrHssojvcEMJOplESQIw7uOn9mazApB5CuWKZWdVzQiL
 yKmAIpR9G0bBBrcVeSJkubM8+nZ8fjV90Hj2WG8JtQ5QRwZOOugTXvOSs5AZntJhIviEdIp7desQe5bgjVZ3MyGDs7i1gKEjgY/kOsRIi3hL24jZc2Bvz0tz
 IU/B8r20i79dvAJGBVu9wFaoIDGSdzmtGNxBCHKSbjjHOiFoeVrnYRL4W4D9txmw
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Edgar Thier <info@edgarthier.net>

These formats are compressed 12-bit raw bayer formats with four different
pixel orders. The pixel follow one another without any padding,
thus are packed in a 'linear' fashion.

Signed-off-by: Edgar Thier <info@edgarthier.net>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 21 ++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h   | 12 ++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 30ef2a3110f7..7ecd26be6353 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -175,6 +175,26 @@ static struct uvc_format_desc uvc_fmts[] = {
 		.guid		= UVC_GUID_FORMAT_RW10,
 		.fcc		= V4L2_PIX_FMT_SRGGB10P,
 	},
+	{
+		.name		= "Bayer 12-bit linear packed (SBGGR12LP)",
+		.guid		= UVC_GUID_FORMAT_BGCP,
+		.fcc		= V4L2_PIX_FMT_SBGGR12LP,
+	},
+	{
+		.name		= "Bayer 12-bit linear packed (SGBRG12LP)",
+		.guid		= UVC_GUID_FORMAT_GBCP,
+		.fcc		= V4L2_PIX_FMT_SGBRG12LP,
+	},
+	{
+		.name		= "Bayer 12-bit linear packed (SRGGB12LP)",
+		.guid		= UVC_GUID_FORMAT_RGCP,
+		.fcc		= V4L2_PIX_FMT_SRGGB12LP,
+	},
+	{
+		.name		= "Bayer 12-bit linear packed (SGRBG12LP)",
+		.guid		= UVC_GUID_FORMAT_GRCP,
+		.fcc		= V4L2_PIX_FMT_SGRBG12LP,
+	},
 	{
 		.name		= "Bayer 16-bit (SBGGR16)",
 		.guid		= UVC_GUID_FORMAT_BG16,
@@ -3181,4 +3201,3 @@ MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL");
 MODULE_VERSION(DRIVER_VERSION);
-
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 97df5ecd66c9..51cda67946d5 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -114,6 +114,18 @@
 #define UVC_GUID_FORMAT_RGGB \
 	{ 'R',  'G',  'G',  'B', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_BGCP \
+	{ 'B',  'G',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_GBCP \
+	{ 'G',  'B',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_RGCP \
+	{ 'R',  'G',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_GRCP \
+	{ 'G',  'R',  'C',  'p', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
 #define UVC_GUID_FORMAT_BG16 \
 	{ 'B',  'G',  '1',  '6', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
-- 
2.30.1

