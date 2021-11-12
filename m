Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7587544E814
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235003AbhKLOF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:05:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbhKLOF5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:05:57 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB356C061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 06:03:06 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id z10so11694345edc.11
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 06:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iTbUD2AVKKJY6TgT6F4OVEoQxuQJkFr5hOUNbosV2I4=;
        b=DPUIC/h2/v62MhG90Cj+Xrki1FbAhYIVshNp07kEXibojOHLMb3KiTm+LRBpE/JQnt
         Nvc8WFEDf2LeyYncZthQnj1GAU+EnGarKVdR2BZoFCPYW5JPeEjwuh9p4vIsedC6HDjd
         gEWXj6QuiwFhPB83+AfjUJ5IRv0Vdimoureck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iTbUD2AVKKJY6TgT6F4OVEoQxuQJkFr5hOUNbosV2I4=;
        b=x0wTAHOX9qYw5HBEbHgd7JCugCce5VPh0YIcVVYkTWrGIFlQnZGgwPNBbYnKaTl7ph
         9R6enLA81Sj6HqhUrm7Mwbd/ToJ63UrOJ9mQ/dRr57L9upxdQfnkKZm/mtlNlpZh+TIa
         IpmhT3uidi6K/FhevYXEyefSzczQYvEMFNU8X3q8eY1fHmRCbvAqcVYbk+vqfs8BsYk1
         DhgtdnuuWu2FHa8ea+2UfvgQQvJx2isrptbn712WlMAeeEzvtuywa7vSomICO5otk8S7
         ZVCEnHd671jA4Pr2m27Wa/N5zPg5k2H7mS4Af/CuTMAsyF7NJ4hha7LrEwUwLc1Hr252
         G23w==
X-Gm-Message-State: AOAM532qJBaMrZAbVfKLlRQX502eYlSSebCUKOHhQZd2xllqd2OfDGuK
        WPaX3AyYOlJDuhnaL6WhWY2eVdSA8UY3WuLu
X-Google-Smtp-Source: ABdhPJx9To/QJshMy/HMiBou60L1jx84NZZkaJy4v+asM4fckA6I32UJaY5tw3YQ0g5JCLdIqXYj5g==
X-Received: by 2002:a50:fd16:: with SMTP id i22mr14237249eds.224.1636725785357;
        Fri, 12 Nov 2021 06:03:05 -0800 (PST)
Received: from alco.corp.google.com ([2620:0:1059:10:53d2:107a:3e39:380f])
        by smtp.gmail.com with ESMTPSA id gb2sm2642238ejc.52.2021.11.12.06.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 06:03:04 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        James Hilliard <james.hilliard1@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] media: uvcvideo: Set the colorspace as sRGB if undefined
Date:   Fri, 12 Nov 2021 15:03:02 +0100
Message-Id: <20211112140302.240134-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Never return V4L2_COLORSPACE_DEFAULT. From the standard:

"""
In the absence of this descriptor, or in the case of
“Unspecified” values within the descriptor, color matching
defaults will be assumed. The color matching defaults are
compliant with sRGB since the BT.709 transfer function and
the sRGB transfer function are very similar.
"""

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Cc: James Hilliard <james.hilliard1@gmail.com>
---

James, could you test it on your device to figure out if it solves
your compliance issues. Thanks!

 drivers/media/usb/uvc/uvc_driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 29befcb229b2..4bbbdfa26459 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -256,7 +256,7 @@ static struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
 static enum v4l2_colorspace uvc_colorspace(const u8 primaries)
 {
 	static const enum v4l2_colorspace colorprimaries[] = {
-		V4L2_COLORSPACE_DEFAULT,  /* Unspecified */
+		V4L2_COLORSPACE_SRGB,  /* Unspecified */
 		V4L2_COLORSPACE_SRGB,
 		V4L2_COLORSPACE_470_SYSTEM_M,
 		V4L2_COLORSPACE_470_SYSTEM_BG,
@@ -267,7 +267,7 @@ static enum v4l2_colorspace uvc_colorspace(const u8 primaries)
 	if (primaries < ARRAY_SIZE(colorprimaries))
 		return colorprimaries[primaries];
 
-	return V4L2_COLORSPACE_DEFAULT;  /* Reserved */
+	return V4L2_COLORSPACE_SRGB;  /* Reserved */
 }
 
 static enum v4l2_xfer_func uvc_xfer_func(const u8 transfer_characteristics)
-- 
2.34.0.rc1.387.gb447b232ab-goog

