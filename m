Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACDE67D97F
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 00:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbjAZXPV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 18:15:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjAZXPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 18:15:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE3A4B8AE
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:15:15 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSY-0004J8-2u; Fri, 27 Jan 2023 00:15:10 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSX-000fEl-AL; Fri, 27 Jan 2023 00:15:08 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSV-00EH7z-Kl; Fri, 27 Jan 2023 00:15:07 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Marek Vasut <marex@denx.de>,
        Ricardo Ribalda <ricardo@ribalda.com>
Subject: [PATCH v3 1/5] media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
Date:   Fri, 27 Jan 2023 00:14:52 +0100
Message-Id: <20230126231456.3402323-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230126231456.3402323-1-m.grzeschik@pengutronix.de>
References: <20230126231456.3402323-1-m.grzeschik@pengutronix.de>
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

From: Marek Vasut <marex@denx.de>

The Cypress EZUSB FX3 UVC example can be configured to report pixel
format "e436eb7e-524f-11ce-9f53-0020af0ba770". This is its GUID for
BGRA/X 8:8:8:8.

The UVC 1.5 spec [1] only defines GUIDs for YUY2, NV12, M420 and I420.
This seems to be an extension documented in the Microsoft Windows Media
Format SDK[2]. This Media Format SDK defines this GUID as corresponding
to `MEDIASUBTYPE_RGB32`, which is confirmed by [4] as `MEDIASUBTYPE_ARGB32`
has different GUID.

Note that in my case, the FX3 UVC can output either channel order,
BGR or RGB or any other mix for that matter. Since Linux commit
1b8dc32286a1a ("[media] uvcvideo: Add GUID for BGR 8:8:8")
defined a GUID for `MEDIASUBTYPE_RGB24` channel order as BGR, keep
this change consistent and define `MEDIASUBTYPE_RGB32` as BGR as well.
Document [3] also indicates the channel order is BGR.

[1] https://www.usb.org/document-library/video-class-v15-document-set
[2] https://learn.microsoft.com/en-us/windows/win32/wmformat/media-type-identifiers
[3] https://learn.microsoft.com/en-us/windows/win32/directshow/uncompressed-rgb-video-subtypes
[4] https://gix.github.io/media-types/

Signed-off-by: Marek Vasut <marex@denx.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ricardo@ribalda.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
v1 -> v3: - added to the series

 include/media/v4l2-uvc.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/media/v4l2-uvc.h b/include/media/v4l2-uvc.h
index f83e31661333bb..b010a36fc1d951 100644
--- a/include/media/v4l2-uvc.h
+++ b/include/media/v4l2-uvc.h
@@ -99,6 +99,9 @@
 #define UVC_GUID_FORMAT_BGR3 \
 	{ 0x7d, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
 	 0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
+#define UVC_GUID_FORMAT_BGR4 \
+	{ 0x7e, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
+	 0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
 #define UVC_GUID_FORMAT_M420 \
 	{ 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
@@ -266,6 +269,11 @@ static struct uvc_format_desc uvc_fmts[] = {
 		.guid		= UVC_GUID_FORMAT_BGR3,
 		.fcc		= V4L2_PIX_FMT_BGR24,
 	},
+	{
+		.name		= "BGRA/X 8:8:8:8 (BGR4)",
+		.guid		= UVC_GUID_FORMAT_BGR4,
+		.fcc		= V4L2_PIX_FMT_XBGR32,
+	},
 	{
 		.name		= "H.264",
 		.guid		= UVC_GUID_FORMAT_H264,
-- 
2.30.2

