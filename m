Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0172466BAB3
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 10:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232164AbjAPJmd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 04:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbjAPJmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 04:42:01 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96741901B
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 01:41:01 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2CF2684F3E;
        Mon, 16 Jan 2023 10:40:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1673862059;
        bh=2Z2kMCsq5i+J8ewEsI4JA5Hw0b0vs3rbQ3+drUOHW34=;
        h=From:To:Cc:Subject:Date:From;
        b=rdasGdp035y/gSP1ySs1RG9IFV0nxUyuvyHS5OTLdQdrlKuvzd5jVA0uBbb26xqTI
         Y9JU01d7y+qoYZvkBjMyLgdwJrxOacUmdl4gOuiY3aEd+kQxvfICRJJBjidmZT4HS+
         1pqibbjOzHkGmaWrr5yD9zvSY0wQb/n5cdUJCSJF7McWBjTTkKuU9DcaFOlYseVF5W
         hdFHQdo1F3mneGknELPpTawvn33Vas2qBlGZKlwHIBScZPnXNMLrf9p/O8PJo7D8bq
         eAvTfQe8AC1I14KvRQtpwuDqIxUXj6MBqBi7LWrDohEcy2APTvPtJKVSxCf5usAq62
         H1TNDRlzOaXEw==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        William Manley <will@williammanley.net>
Subject: [PATCH v2] media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
Date:   Mon, 16 Jan 2023 10:40:32 +0100
Message-Id: <20230116094032.4389-1-marex@denx.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
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
---
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: William Manley <will@williammanley.net>
---
V2: - Reference document [3] confirming BGR channel order
    - Reference document [4] describing MEDIASUBTYPE_ARGB32 with different GUID
    - Use V4L2_PIX_FMT_XBGR32 instead of V4L2_PIX_FMT_BGR32 which is deprecated
---
 include/media/v4l2-uvc.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/media/v4l2-uvc.h b/include/media/v4l2-uvc.h
index f83e31661333b..b010a36fc1d95 100644
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
2.39.0

