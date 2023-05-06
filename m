Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1656F8FC3
	for <lists+linux-media@lfdr.de>; Sat,  6 May 2023 09:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbjEFHO5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 May 2023 03:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbjEFHO4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 May 2023 03:14:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699319EEA
        for <linux-media@vger.kernel.org>; Sat,  6 May 2023 00:14:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F6002D8;
        Sat,  6 May 2023 09:14:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683357289;
        bh=Pbm3XLiAsWT8yt39A8L73V5yZG2BwUW2qOhy7kCBajs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wfANaOkdMcWHB0qD+7xMpaV/o6yZqmHZQiDcdA+ViJ/w/9IQDeVYwTIFWSFDubaC9
         FAY5mEz8Cun+AgvTrmhhFRdluNzU36FlIOfNx+iZbORQ4xe4mVKOJ+0uhizJ+nSkx/
         cbwIdZbFFWDdSLGJisRXoVEWHPLK6kZbYRNkiGZo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 7/7] media: uvcvideo: Constify descriptor buffers
Date:   Sat,  6 May 2023 10:14:27 +0300
Message-Id: <20230506071427.28108-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230506071427.28108-1-laurent.pinchart@ideasonboard.com>
References: <20230506071427.28108-1-laurent.pinchart@ideasonboard.com>
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

There is no need to modify the content of UVC descriptor buffers during
parsing. Make all the corresponding pointers const to avoid unintended
modifications.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index b68fa7d17e41..c8071c0c9bde 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -221,7 +221,7 @@ static struct uvc_streaming *uvc_stream_new(struct uvc_device *dev,
 
 static int uvc_parse_format(struct uvc_device *dev,
 	struct uvc_streaming *streaming, struct uvc_format *format,
-	struct uvc_frame *frames, u32 **intervals, unsigned char *buffer,
+	struct uvc_frame *frames, u32 **intervals, const unsigned char *buffer,
 	int buflen)
 {
 	struct usb_interface *intf = streaming->intf;
@@ -508,7 +508,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	struct uvc_format *format;
 	struct uvc_frame *frame;
 	struct usb_host_interface *alts = &intf->altsetting[0];
-	unsigned char *_buffer, *buffer = alts->extra;
+	const unsigned char *_buffer, *buffer = alts->extra;
 	int _buflen, buflen = alts->extralen;
 	unsigned int nformats = 0, nframes = 0, nintervals = 0;
 	unsigned int size, i, n, p;
@@ -1161,7 +1161,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 static int uvc_parse_control(struct uvc_device *dev)
 {
 	struct usb_host_interface *alts = dev->intf->cur_altsetting;
-	unsigned char *buffer = alts->extra;
+	const unsigned char *buffer = alts->extra;
 	int buflen = alts->extralen;
 	int ret;
 
-- 
Regards,

Laurent Pinchart

