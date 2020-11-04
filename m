Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74CA12A6C6C
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 19:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732246AbgKDSHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 13:07:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732228AbgKDSHv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 13:07:51 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1A2C061A4D
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 10:07:49 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id w1so23110491wrm.4
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 10:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d3yal1NPjyXYa+Lww+W7he31FAQCpjt9AFpTy83XXP4=;
        b=ACgVABxVnSQoCwu/ik/Mj1Ugn0BE388tkndbp6DYWRoaN+I2DhX72YaXkq76rUxAYN
         OMF2vNJX67B+O8JZ0EaYk7Qhyml/0drDeaL3g4Njnmta6C6cPkVFiR3jTm4Ns6yJ2L5C
         oA+upDgPWipTUA4HfLrdY7JeG753mRtFUoPYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d3yal1NPjyXYa+Lww+W7he31FAQCpjt9AFpTy83XXP4=;
        b=oKIjRndyXM556Z2h6wF+YKpBuv+NbYkQd4HyAIZzwx53u+SLDik06x7mnWmr7vgW89
         F8CnrduJs4zdV854HduwptTG65LJ+b1VGkx1tcRmhd2LImr/rG37Nx2I7ZkVywOYDmgS
         kwj7dw7b398lU+TvdEkCf9tD6GUus/wexZ6hhX6Qwbi/8lgZwQZ5K2RIgxnc9vCgCW8i
         wAqYHGyHZfkyMU73dCZIifmdU4SXf/pUIMQ3wuZ1ruqlUBm2wJ+OWRc9sKX7rDONpKPz
         svjtgWdnxEOHlxgPmp3Q0HmKjnfYHMFN91j+mnmYO2Yr4k2+GyzmGzUY1rU7mC8ouGyQ
         85Xw==
X-Gm-Message-State: AOAM531LsRq2jo1y2K/cUMv18wz1JCgF3D3xdCQN2UQMwflTqt5edUoH
        rT5Li8LqsYbPNsx5Bkfpb2kTLA==
X-Google-Smtp-Source: ABdhPJwPT8KhxLmALamllLMYJJmBdpDMzjsFUeGmAeQ7Fqt++EYBbuSBNXrWY+Opc7oiAfqQuu3AjQ==
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr35571120wrm.53.1604513268606;
        Wed, 04 Nov 2020 10:07:48 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id y10sm3801841wru.94.2020.11.04.10.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 10:07:48 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 3/7] media: uvcvideo: Allow external entities
Date:   Wed,  4 Nov 2020 19:07:30 +0100
Message-Id: <20201104180734.286789-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201104180734.286789-1-ribalda@chromium.org>
References: <20201104180734.286789-1-ribalda@chromium.org>
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
index 77fea26faa9a..7a1b2decccc8 100644
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
2.29.1.341.ge80a0c044ae-goog

