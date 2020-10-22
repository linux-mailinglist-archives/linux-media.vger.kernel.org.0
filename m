Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8753296026
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 15:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900210AbgJVNiB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 09:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2900206AbgJVNiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 09:38:00 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC19CC0613CE
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 06:37:59 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id c194so2144020wme.2
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 06:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+mHsFLlMVlL11cWsjoM3qFi8Cc1D8z4TpYaeydwCncs=;
        b=drgjWM3OlnhGwNGhZKErQKrd6uDvrnRJ4cMfZcyLAT9fOmev8q6RXok1j63AtmDCuZ
         dwG9X71FrdzL9rU/5deqOwGr0W5HZhk6YBNPNmohYHWz/mHBSgoVy954/xCtAQW8vW29
         MmItJNGErIuT/74MhrGizN0j+db9hDONJd8/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+mHsFLlMVlL11cWsjoM3qFi8Cc1D8z4TpYaeydwCncs=;
        b=srM+TzCuzmHvsk2GGXX643+W/CZ9Qk3he8LqVnSlCtnwP1oop3NT6DtHEVxTqMIlmP
         6zJ4fOK/6tbvl28NbGWc8kBnzSramQY2Ef3VBF5EYjf5Eo9pOzFomYHeWVSVU7Pxiflp
         1ENl1i7G6G30TB9A2Fffv94IyRbGymMbjHSg/uRdDKdFmovU3M2aBwP1PQPZBgWqXVed
         GxarKNPj4+xoFQc3gLSTe3P9oWeysyFDkja2+8w5xyh1HXnFNB0eVhwJB8XsihJzyN92
         rm97tmtSBDn1oHGP28CbZSZaobhU9X1F6na9bcGHBNxIRU26Uw1jzjp5bVq6+n2LBVeI
         v+2Q==
X-Gm-Message-State: AOAM533LKRPJJOlDAxmi17JQpXVM+NuAFme3o73tJVxv1a7OB3XzUh5K
        8IEoVPm2TBbUUR0pSeD0zHrHkg==
X-Google-Smtp-Source: ABdhPJyYtzaUhtFF8vMOUrH1wSrwhFdfj98FZ0qf9pSvkbkU+R6OHX9OvtFphu32JgwpBm5eQfElpg==
X-Received: by 2002:a1c:dc8b:: with SMTP id t133mr2733099wmg.151.1603373878705;
        Thu, 22 Oct 2020 06:37:58 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id q10sm4094031wrp.83.2020.10.22.06.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 06:37:58 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     tfiga@chromium.org, Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 3/6] media: uvcvideo: Add UVC_GUID_EXT_GPIO_CONTROLLER
Date:   Thu, 22 Oct 2020 15:37:50 +0200
Message-Id: <20201022133753.310506-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
In-Reply-To: <20201022133753.310506-1-ribalda@chromium.org>
References: <20201022133753.310506-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create a new GUID for GPIO controller entities that do not belong to the
USB video device.

This GUID is selected on an address range completely different that the
UVC standard to avoid collisions.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
 drivers/media/usb/uvc/uvcvideo.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 0a8835742d49..913739915863 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -830,6 +830,7 @@ static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
 static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
 static const u8 uvc_media_transport_input_guid[16] =
 	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
+static const u8 uvc_gpio_guid[16] = UVC_GUID_EXT_GPIO_CONTROLLER;
 
 static int uvc_entity_match_guid(const struct uvc_entity *entity,
 	const u8 guid[16])
@@ -848,6 +849,9 @@ static int uvc_entity_match_guid(const struct uvc_entity *entity,
 		return memcmp(entity->extension.guidExtensionCode,
 			      guid, 16) == 0;
 
+	case UVC_GPIO_UNIT:
+		return memcmp(uvc_gpio_guid, guid, 16) == 0;
+
 	default:
 		return 0;
 	}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 08922d889bb6..8e5a9fc35820 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -56,6 +56,9 @@
 #define UVC_GUID_UVC_SELECTOR \
 	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
 	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02}
+#define UVC_GUID_EXT_GPIO_CONTROLLER \
+	{0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf, \
+	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x01}
 
 #define UVC_GUID_FORMAT_MJPEG \
 	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
-- 
2.29.0.rc1.297.gfa9743e501-goog

