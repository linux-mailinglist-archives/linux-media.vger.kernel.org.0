Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C54816E8FA9
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 12:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234314AbjDTKNs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Apr 2023 06:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234436AbjDTKNP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Apr 2023 06:13:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6374C658C
        for <linux-media@vger.kernel.org>; Thu, 20 Apr 2023 03:10:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1011E5AA;
        Thu, 20 Apr 2023 12:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681985399;
        bh=ZADGvYl3EF4YFlc0fbC4zQ0bvNNMw/e8HdV3Iacgwkk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PtbS8rpl1kbECYYin9m8Na4zFxEG62iAMgdKViu3mg3Pp0uklfigIuj0fsxrTFSU7
         BWlnM0ijtRy+fzgpzNLl0Tp/XHz9CizgtmzjxoFfNnconTXlk15la9SvndfnvSRdZi
         XGp5tM4ES0J4gRqHg5uVkYpNoUnqCd/FGl67c8kg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 4/4] media: uvcvideo: Constify descriptor buffers
Date:   Thu, 20 Apr 2023 13:09:58 +0300
Message-Id: <20230420100958.10631-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420100958.10631-1-laurent.pinchart@ideasonboard.com>
References: <20230420100958.10631-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no need to modify the content of UVC descriptor buffers during
parsing. Make all the corresponding pointers const to avoid unintended
modifications.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index efc7a36a892e..ab7f2a0112d3 100644
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
@@ -494,7 +494,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	struct uvc_format *format;
 	struct uvc_frame *frame;
 	struct usb_host_interface *alts = &intf->altsetting[0];
-	unsigned char *_buffer, *buffer = alts->extra;
+	const unsigned char *_buffer, *buffer = alts->extra;
 	int _buflen, buflen = alts->extralen;
 	unsigned int nformats = 0, nframes = 0, nintervals = 0;
 	unsigned int size, i, n, p;
@@ -1146,7 +1146,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
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

