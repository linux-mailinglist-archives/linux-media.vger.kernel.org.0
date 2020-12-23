Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2102E1C9C
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 14:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbgLWNgQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 08:36:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728666AbgLWNgO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 08:36:14 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE21C06179C
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 05:35:33 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id c133so5386768wme.4
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 05:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u758tc6qPeylpt3SsVLMdt+s9OHLjZNVgsX5L88s2r0=;
        b=Q0erJBz9hqoU0oD9aLjCvmVU/bI2+F5SMwPkvpY74SU1tcoH70Y42Yd/eDOGArUPkJ
         Z65XOrGr/mdJja7UDE9DWusMG+ymQy7jOFXAU/8eQpS1VPf6t85xBuVOZ8aEQPEdmGf3
         JlcPpqsqvZ/BLRWiQlzvgHyyKC+X3PUQhDfRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u758tc6qPeylpt3SsVLMdt+s9OHLjZNVgsX5L88s2r0=;
        b=orxZkdUs03D6QFc03REQrPFfROQL2v1Xb5UaNVM9Y0bUE2xRmXxouIRejS8nz05cEx
         TYuOB63T1nOMm0IVrAryiNBTJfM6x9igVBhzfIuFg1VGvSRuaQDR95q0m/0NbjkFjY9Y
         qOsXXGQT8KqZGAhvzEcaq8scuRP+YGp/G32IJ3AuW0Qa3QJkR7IYHtlQULeu05G5oJRH
         ugLs3b7wvgSWX0e112o4vU5hGUy08H1Ddkkr9c67IspR3RpzrYNwJpB8zvY58/N+0nWd
         d3DxYvhq+PeKkDTl/RTD67uVjK34EGrC/raVzCZB63/gWYxIEt0qI31Quhl/75oXYKdG
         zaDg==
X-Gm-Message-State: AOAM532ZvgdBH66R6KoE/N3t4DCeKwkikoFeiPH5Osg7lVpzFCV7/w9m
        zCxNPAW/lPS1YJwqV29i9itcXw==
X-Google-Smtp-Source: ABdhPJz8winmAgCoMmDxTaaGOOK1awTyCxupK+2oMN7iwvjZPJ7/d+008qZp+DukJfSj1R8ZD/AC1Q==
X-Received: by 2002:a1c:67c5:: with SMTP id b188mr27091865wmc.147.1608730532583;
        Wed, 23 Dec 2020 05:35:32 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id q143sm31572247wme.28.2020.12.23.05.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 05:35:32 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 02/12] media: uvcvideo: Allow extra entities
Date:   Wed, 23 Dec 2020 14:35:18 +0100
Message-Id: <20201223133528.55014-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20201223133528.55014-1-ribalda@chromium.org>
References: <20201223133528.55014-1-ribalda@chromium.org>
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
index df7bf2d104a3..c50b0546901f 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -301,7 +301,12 @@ struct uvc_entity {
 					 * chain. */
 	unsigned int flags;
 
-	u8 id;
+	/*
+	 * Entities exposed by the UVC device use IDs 0-255, extra entities
+	 * implemented by the driver (such as the GPIO entity) use IDs 256 and
+	 * up.
+	 */
+	u16 id;
 	u16 type;
 	char name[64];
 	u8 guid[16];
-- 
2.29.2.729.g45daf8777d-goog

