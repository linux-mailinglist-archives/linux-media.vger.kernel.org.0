Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6902B9D2C
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 22:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgKSVur (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 16:50:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgKSVu3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 16:50:29 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279EBC0613D4
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 13:50:29 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id c9so8553613wml.5
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 13:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TPp4mJYO1kRVwM4cVLVhTWtINbENEVLRY1VDoDX//0A=;
        b=mRN0EXG1cJP0u+Jt0DuiLA/RHAG9imIKCxnsO8RFQc5z02hGT4WbSGHjyNnQ3z9K00
         O1l6Y3rWqUAd1W/DVpzC8URypkWfcQ20Y4wS1/7LYn7DD9mS/f8Vmk35EyFxcrbOuFjt
         LOzrGiK2WBOQfUOP44NmWXUDhAKKh1lfg1NGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TPp4mJYO1kRVwM4cVLVhTWtINbENEVLRY1VDoDX//0A=;
        b=fZDwlUklQ+0aXwOiW88oMm7IG5m0XY3V+LUzZEPF3Gl8Qc8wbPfFGAj6CRge6qE8DL
         XiTzQrosdlKqMdtZRFwbTipifnh+pDuutOEtOPw3rKvgt/fGJGobpOeM5mk5G6pTPQBG
         lKm5z48k5IqylVL1Gs2AbtnFffv9C7QW6eYqcIpminwsgy3fjoObEQ2k7txmBGYJHfVw
         sBhq5ulMJ3wznFGInK4/Y6Iv8F1Ukfcib8OGiM65fpLTKoMj6g5VzjvlyuIZH3V7vvty
         r2BHWJfXgMROhugUEKZyqMxK5rxMjq6mDMb6trcwBrc0fLvZxXzamH32c6o3ziVGe/bO
         RucQ==
X-Gm-Message-State: AOAM533WrCtSBvdjqId6iN+qdcZLxHbt31stfLxcr3a5Q4SeAr8QJKIT
        1u+VtOBry4mmM1VmKVbzhm8bgJerFfOMLwTu
X-Google-Smtp-Source: ABdhPJyXOpwuf077Fs5OE6+Q3PaHQ+ZWc5B1DP22XXM9Ryi3lq4QaqnsXYK0XMSsdYbz40dl2ybjUQ==
X-Received: by 2002:a1c:1d09:: with SMTP id d9mr6609419wmd.93.1605822627839;
        Thu, 19 Nov 2020 13:50:27 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t136sm1818859wmt.18.2020.11.19.13.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 13:50:27 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 2/8] media: uvcvideo: Allow external entities
Date:   Thu, 19 Nov 2020 22:50:14 +0100
Message-Id: <20201119215020.508487-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
In-Reply-To: <20201119215020.508487-1-ribalda@chromium.org>
References: <20201119215020.508487-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Increase the size of the id, to avoid collisions with external entities.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 drivers/media/usb/uvc/uvcvideo.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 4cdd65d252d9..9f4451a2e0a6 100644
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
index df7bf2d104a3..00f985001c1d 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -301,7 +301,7 @@ struct uvc_entity {
 					 * chain. */
 	unsigned int flags;
 
-	u8 id;
+	u16 id; /* 0-255: usb entity. 256-65535: external entities */
 	u16 type;
 	char name[64];
 	u8 guid[16];
-- 
2.29.2.299.gdc1121823c-goog

