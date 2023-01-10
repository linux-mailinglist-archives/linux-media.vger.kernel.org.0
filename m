Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A32A664CCD
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 20:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232960AbjAJTxt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 14:53:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbjAJTxp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 14:53:45 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B2912D06
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 11:53:44 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 4D62C80CB0;
        Tue, 10 Jan 2023 20:53:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1673380422;
        bh=pkq8RXXUt0BEPtVpd5dHqZrWJ4rusDYCUuhOl8p0wvc=;
        h=From:To:Cc:Subject:Date:From;
        b=rdFv+WoZvUYmvAZcFDbawGZGLE2CleVhNrsSc3ihfbeb8XOI+pdjFfJTMFAnJXPeQ
         7KII+CPnvFlc4efhF0LgEiORpXew8LUU2eK3Seb7kpRHT9/i+hB/W+bk9Ac67cDPCe
         snFnL1hEl04Hhhfuv3lWO1hiH/DMIim+nO+COgtls4fgvIrKtTAqg7tavQOZPR8M2c
         UxucGmOxA1++ZUw7aAE0SkROghYz0l1STB/fVX9/izAMqZ+kvBru3bNPLmgF/MMgvg
         AXCI1tkggMz3FUJsbFRfMg6YRaw3kA21u96tFmAFU5X9MyKcSw5rze/+wN08gl3YoG
         EAD8iOIKGDCVg==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        William Manley <will@williammanley.net>
Subject: [PATCH] media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
Date:   Tue, 10 Jan 2023 20:53:31 +0100
Message-Id: <20230110195331.175103-1-marex@denx.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,URI_TRY_3LD autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Cypress EZUSB FX3 UVC example can be configured to report pixel
format "e436eb7e-524f-11ce-9f53-0020af0ba770". This is its GUID for
BGRA/X 8:8:8:8.

The UVC 1.5 spec [1] only defines GUIDs for YUY2, NV12, M420 and I420.
This seems to be an extension documented in the Microsoft Windows Media
Format SDK[2]. This Media Format SDK defines this GUID as corresponding
to `MEDIASUBTYPE_RGB32`.

Note that in my case, the FX3 UVC can output either channel order,
BGR or RGB or any other mix for that matter. Since Linux commit
1b8dc32286a1a ("[media] uvcvideo: Add GUID for BGR 8:8:8")
defined a GUID for `MEDIASUBTYPE_RGB24` channel order as BGR, keep
this change consistent and define `MEDIASUBTYPE_RGB32` as BGR as well.

[1]: https://www.usb.org/document-library/video-class-v15-document-set
[2]: https://learn.microsoft.com/en-us/windows/win32/wmformat/media-type-identifiers

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: William Manley <will@williammanley.net>
---
 include/media/v4l2-uvc.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/media/v4l2-uvc.h b/include/media/v4l2-uvc.h
index f83e31661333b..c10e9086338be 100644
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
+		.fcc		= V4L2_PIX_FMT_BGR32,
+	},
 	{
 		.name		= "H.264",
 		.guid		= UVC_GUID_FORMAT_H264,
-- 
2.39.0

