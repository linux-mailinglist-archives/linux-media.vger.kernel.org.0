Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDCB2E0073
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 19:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbgLUSu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 13:50:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727454AbgLUSu1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 13:50:27 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974B0C061793
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:49:46 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 190so10843449wmz.0
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C/fCz+ZBoSHS5SlHs6JCakf/TmcPwilk8kMtlWo97qo=;
        b=Yx/8lnR3YJEPedRdD4WXM1N4zDjp7wCJXAncjrg5mCb+/lgXSpzGIK6Vs001/yYtyS
         Z9VPPh9Lrof/xY+p5Yq92by9DtsDnj3mITJSnP54geGELxtA8mSVjreFMLvZbgRqOT7Q
         YdaHGXGbQxlXlP2ZV22NDmM4d9zRYH+olA55E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C/fCz+ZBoSHS5SlHs6JCakf/TmcPwilk8kMtlWo97qo=;
        b=nH2zA6PaK+EQ+QEFt4Gq4eJFT6fk3G47/K0WqEO1UTQe9PuRItL8pg3r9G+ZN+Sgsb
         XLBRFSOfGE9p/sNIgY9TMG9XzAQ51zuH38iQ50BkceLWLe389WEWE+0q4AYGPIy7RCT8
         lrcp1T2IGE5RBium8RXFCORTvGjWUTgl9TGD/zmdFnUI220rw714TXDEIvOAVSnJ+TSa
         leBzNWq8StBS28vJ3Jil+Paf9oSZ6cTlnHhaAYxHVxWWiqM+vfSbyIYMewEyUfoVi8jz
         fxxCAsv/qV74CJ3b9GuMQ6nirT8HWfD0CkwLr3Gt6HFMsqoJ2oxUt1RX7N8rIeN1ql+v
         2tFg==
X-Gm-Message-State: AOAM531d0SkrU0+3u9Lpzkth3QPJc5OSPQ3h3XWlFTybkJN0jJTUg4n2
        Ipcj3sDVQbfOJ+3jo57fVbbxnIspDBmGUK+9szQ=
X-Google-Smtp-Source: ABdhPJwXa9XbLaOrRa6Tqd+Zxgqg4IJ134jEXJs5XnKRWVszI8I1lh+68ZJw2lzxCA9TfAnFpmk+hw==
X-Received: by 2002:a1c:186:: with SMTP id 128mr17543418wmb.176.1608569305103;
        Mon, 21 Dec 2020 08:48:25 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o125sm24581109wmo.30.2020.12.21.08.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 08:48:24 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 04/12] media: uvcvideo: Allow extra entities
Date:   Mon, 21 Dec 2020 17:48:11 +0100
Message-Id: <20201221164819.792019-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201221164819.792019-1-ribalda@chromium.org>
References: <20201221164819.792019-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Increase the size of the id, to avoid collisions with entities
implemented by the driver that are not part of the UVC device.

Entities exposed by the UVC device use IDs 0-255, extra entities
implemented by the driver (such as the GPIO entity) use IDs 256 and
up.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 drivers/media/usb/uvc/uvcvideo.h   | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index bfbc5a4d4ca6..82cdd1bb28dc 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1024,7 +1024,7 @@ static const u8 uvc_media_transport_input_guid[16] =
 	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
 static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
 
-static struct uvc_entity *uvc_alloc_entity(u16 type, u8 id,
+static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
 		unsigned int num_pads, unsigned int extra_size)
 {
 	struct uvc_entity *entity;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 0a3404091665..5d4da54dfd13 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -301,7 +301,12 @@ struct uvc_entity {
 					 * chain. */
 	unsigned int flags;
 
-	u8 id;
+	/*
+         * Entities exposed by the UVC device use IDs 0-255, extra entities
+         * implemented by the driver (such as the GPIO entity) use IDs 256 and
+         * up.
+        */
+	u16 id;
 	u16 type;
 	char name[64];
 	u8 guid[16];
-- 
2.29.2.684.gfbc64c5ab5-goog

