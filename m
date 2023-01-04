Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD86465D144
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 12:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238964AbjADLTy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Jan 2023 06:19:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238938AbjADLTw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Jan 2023 06:19:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674671A3A0
        for <linux-media@vger.kernel.org>; Wed,  4 Jan 2023 03:19:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA4126C7;
        Wed,  4 Jan 2023 12:19:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672831191;
        bh=MZuD3q43mOeCR8mqQctIeyFvhTETCF7ORVSoKDI6X3g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KDl7yHOlORluo1Q65HfiA080B8YCkgXpXmKIfvhlw9YVm9iBwTuhhuaPaVtpGorn4
         SGBCDVtvucRCj1NwLT0CYFEPAjtotk/krdIm6oIQ0vEYacHpCekjaxjUI432B5vyR6
         F5WZY2kcMpG24Qute5XTejZrPq6EphqwS82htOyk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 2/2] media: uvcvideo: Drop custom format names for DV formats
Date:   Wed,  4 Jan 2023 13:19:44 +0200
Message-Id: <20230104111944.962-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230104111944.962-1-laurent.pinchart@ideasonboard.com>
References: <20230104111944.962-1-laurent.pinchart@ideasonboard.com>
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

Unlike V4L2, UVC makes a distinction between the SD-DV, SDL-DV and HD-DV
formats. It also indicates whether the DV format uses 50Hz or 60Hz. This
information is parsed by the driver to construct a format name string
that is printed in a debug message, but serves no other purpose as V4L2
has a single V4L2_PIX_FMT_DV pixel format that covers all those cases.

As the information is available in the UVC descriptors, and thus
accessible to users with lsusb if they really care, don't log it in a
debug message and drop the format name string to simplify the code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 9852d6f63ae8..ba41f13a2491 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -228,7 +228,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 	struct uvc_format_desc *fmtdesc;
 	struct uvc_frame *frame;
 	const unsigned char *start = buffer;
-	char fmtname[12] = { 0, };
 	unsigned int width_multiplier = 1;
 	unsigned int interval;
 	unsigned int i, n;
@@ -325,14 +324,10 @@ static int uvc_parse_format(struct uvc_device *dev,
 
 		switch (buffer[8] & 0x7f) {
 		case 0:
-			strscpy(fmtname, "SD-DV", sizeof(fmtname));
-			break;
 		case 1:
-			strscpy(fmtname, "SDL-DV", sizeof(fmtname));
-			break;
 		case 2:
-			strscpy(fmtname, "HD-DV", sizeof(fmtname));
 			break;
+
 		default:
 			uvc_dbg(dev, DESCR,
 				"device %d videostreaming interface %d: unknown DV format %u\n",
@@ -341,9 +336,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		strlcat(fmtname, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",
-			sizeof(fmtname));
-
 		format->fcc = V4L2_PIX_FMT_DV;
 		format->flags = UVC_FMT_FLAG_COMPRESSED | UVC_FMT_FLAG_STREAM;
 		format->bpp = 0;
@@ -370,12 +362,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 		return -EINVAL;
 	}
 
-	if (format->fcc) {
-		if (fmtname[0])
-			uvc_dbg(dev, DESCR, "Found format %s\n", fmtname);
-		else
-			uvc_dbg(dev, DESCR, "Found format %p4cc", &format->fcc);
-	}
+	if (format->fcc)
+		uvc_dbg(dev, DESCR, "Found format %p4cc", &format->fcc);
 
 	buflen -= buffer[0];
 	buffer += buffer[0];
-- 
Regards,

Laurent Pinchart

