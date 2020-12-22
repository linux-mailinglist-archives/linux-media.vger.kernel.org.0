Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF2A2E1077
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 00:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728100AbgLVXFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 18:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbgLVXFc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 18:05:32 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E52C0617A6
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:51 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id d26so16616897wrb.12
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u758tc6qPeylpt3SsVLMdt+s9OHLjZNVgsX5L88s2r0=;
        b=M6n3HcsJCAVTWSvt8LGd7qaUYqcGFGwmQZcqPyvvJ1xSDIk2mt7js9+kSK1RlICzTM
         X2qdhkkQ52UcgThRsZxwNEngfFoZZzzI16Z8TkSqs4Sb5GckthvDdE9G6uwxdCQ1FaAD
         l8mFMo2JAN5EogfCQ0jbswhr8CSYkgo6BT9Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u758tc6qPeylpt3SsVLMdt+s9OHLjZNVgsX5L88s2r0=;
        b=Cq04f3yHIBKDU1SbLzz5nKDoeIEwBlg9UTIE/fYB+dXsKDoPW9VWMJqkbuDVCgjcbF
         Ltmvy+KSM07SPxtvTtocVd8ExizcwrDsyhQlnwAvWq6eyWdBUZOHhcfSEpnw6ew2i+sD
         Nmz0VpUr2ZGaaBTFceeDWiaWamOp1VScCSv1QxesFslXVy1H4nrh04fWOSda1Y+zMADa
         RFrxiAMgHbhk9SUz7I1XNkkZWtBre3H+MrTkzg1nd/XEJkJnJtIxmvseutBM0+VkDwaI
         FqUJE2Sg1IhKpADk2f1HdbLjjC6Fw4+SMCmtAGjJqxAlq0Q8RJOj0rDPVJIMvwoRVlGN
         TNCA==
X-Gm-Message-State: AOAM530lBV+wvZVXcmlcZD7nrrYVzBzonsEpTLi0gJj3Uw11Xf/3qoyu
        HCUFtsyCxUGUNpm3m7RkW5Xoug==
X-Google-Smtp-Source: ABdhPJwY3a/xYqjmSgVd/fYTGpi5kefNN9vsZ9MqsE3xi+ijcXStQuvIwKubOl1P1qbXRVH3DqBtVg==
X-Received: by 2002:a05:6000:ce:: with SMTP id q14mr25978852wrx.277.1608678290287;
        Tue, 22 Dec 2020 15:04:50 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id r16sm34463401wrx.36.2020.12.22.15.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 15:04:49 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 02/11] media: uvcvideo: Allow extra entities
Date:   Wed, 23 Dec 2020 00:04:37 +0100
Message-Id: <20201222230446.1027916-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20201222230446.1027916-1-ribalda@chromium.org>
References: <20201222230446.1027916-1-ribalda@chromium.org>
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

