Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFC944ED9F
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 20:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbhKLUAG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 15:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232474AbhKLUAF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 15:00:05 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB0BC061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 11:57:14 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id z21so42069712edb.5
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 11:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X3f6TTWGzFiveRQwVVf2YyRGKNPkeJCZPsk1rJVAxKQ=;
        b=eOspbq1AeeiPkdK9BsMT9et9k7GWakZinEA1307VOrKd1KKg8NASXKWz6Nznvkjjbf
         x9D/xBfPeKy6Ldxr/gmBwcK4ggw6hq7zF5WaAV9QBo8Hc4LOjtybhHm8AV+xqvTh+YMC
         y9NRxPAEgAguXj2opG8GcxPimvsCXz/la3C3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X3f6TTWGzFiveRQwVVf2YyRGKNPkeJCZPsk1rJVAxKQ=;
        b=Y8FoY+5JqHgSDEDGQEHgQRVR1Cs+u7gxN7qL7F3bmgL9PJlX9LzYdfR+hnSRRCS9Sr
         yunNjJh+l9McCXUT4R50WKRhZtd1RzbdQ9k107wmSTD3f06DhMQXANRPGMqi7pgOqhyz
         RJWsxMTMG9uVm04QnALv9JHvDWiwU3B8PenwtmuB2e7gJMhtFEbTFFbLappshK0L6NeL
         DZi0x0DIjymJhgcNzXP5Wvjdt9lo74FVmgqxzEQknOtOUwOf5+LyUkdcRCkY8gZlJ+lY
         uYLDPnNC5iRNSx5LjBvXnkUIKnBn80bHManiR6rJmOkxFrRq88bIDrDLCo7xCLZjpoP4
         Ycog==
X-Gm-Message-State: AOAM532ie7t0mXnST0ThPJKS8jEQoSNJUw2Ar4N5dxwVHYLbC02d7hdq
        E540ExH5X/RO5qZTGvaWsbUI7Q==
X-Google-Smtp-Source: ABdhPJwGf2MUOsqcYzWmLXjpVX3lIkMc6TkQbW0ZHCXMSMP6u5ENQOjwA3PFfRNNjH0ZQriwMpPbNw==
X-Received: by 2002:a17:906:b00c:: with SMTP id v12mr21841845ejy.523.1636747032707;
        Fri, 12 Nov 2021 11:57:12 -0800 (PST)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id m14sm3730919edc.36.2021.11.12.11.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 11:57:12 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        James Hilliard <james.hilliard1@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2] media: uvcvideo: Set the colorspace as sRGB if undefined
Date:   Fri, 12 Nov 2021 20:57:10 +0100
Message-Id: <20211112195710.286151-1-ribalda@chromium.org>
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
---
@James: Can you try this version? Thanks!

 drivers/media/usb/uvc/uvc_driver.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 29befcb229b2..27234fe60a48 100644
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
@@ -769,6 +769,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 
 		buflen -= buffer[0];
 		buffer += buffer[0];
+	} else {
+		format->colorspace = V4L2_COLORSPACE_SRGB;
 	}
 
 	return buffer - start;
-- 
2.34.0.rc1.387.gb447b232ab-goog

