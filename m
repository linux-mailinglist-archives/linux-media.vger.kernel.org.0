Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88EB92DFF88
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 19:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgLUSSm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 13:18:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgLUSSl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 13:18:41 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3DCC061285
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:18:00 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id e25so11868698wme.0
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nrR9WDuqpZ4La0kb0TH5GDl9XnLQA1hKY10137zFkno=;
        b=LDOBybMZF3sIbVRykwkewM3vK28vBCZgO4ssvTMLn7WaQ/7EoJhG7LoraIa6BrXVX+
         TD6VOKiY9f3+eXENNuaRwO2m6Z8GnVMJCLZQb5Nk5KDofjsfKmJ2Cb1zqUPYdMFe4RFM
         Zqeg5N2GAnoAsZ4KNn+f8K8WIzsyVoZPotykc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nrR9WDuqpZ4La0kb0TH5GDl9XnLQA1hKY10137zFkno=;
        b=hX0iY3ctNaS7R/IiWHYNdD3eSAT1gLiKrXOPdFftJNyuOgUquAzHUzaKJLiEp+2UC+
         lXkZcBjZaK/Sul+PMTi/JgWgThrdJ1L/MvWNuyB2uct/a24NVxAuwFTAiE/S3zRqSk3r
         Bo8iCtDCQ1dbrG+vvkfR9vIEhADjIYPF7T3rPZSR4LeHFekYExxoZmg9jRjNL+guDDMI
         T8ErYTrjmSiastXjxxByQOtgbVgLvxL11/XOvybts7eY390JHTEx5JmjNMh/yupPM0cG
         I4uG70p92euDlKyCub13lcBO6KXzDoWUP21FzmrfEvejECk+TjAYvS3/NWYrdyYBPIDW
         qf7g==
X-Gm-Message-State: AOAM533jxnqTeczLy4UN/YIO7CIT/qulRuHKFSDfgPkKX9JXyY1mtyxb
        Zg/vIaqvuORMr9TGC70Hj/iDEw==
X-Google-Smtp-Source: ABdhPJzppDtHHWrSNToUgdtCSdftcvo3RHHcW+vUbYsJiyNo4fnI7+Jw4GXQ+zlOxqzWhRtB+UT6pw==
X-Received: by 2002:a1c:23d5:: with SMTP id j204mr18052023wmj.130.1608574679359;
        Mon, 21 Dec 2020 10:17:59 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id n17sm23559282wmc.33.2020.12.21.10.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 10:17:58 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 04/12] media: uvcvideo: Allow extra entities
Date:   Mon, 21 Dec 2020 19:17:57 +0100
Message-Id: <20201221181757.814417-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201221164819.792019-5-ribalda@chromium.org>
References: <20201221164819.792019-5-ribalda@chromium.org>
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
Sorry for a duplicated patch, the previous one the spacing was wrong :(

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
index 0a3404091665..aa96e54b8896 100644
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
2.29.2.684.gfbc64c5ab5-goog

