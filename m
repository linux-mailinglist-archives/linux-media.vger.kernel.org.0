Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C18533725E
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 13:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233121AbhCKMVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 07:21:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233142AbhCKMUu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 07:20:50 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F5EC061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:50 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id p8so45765442ejb.10
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1yf2YrB+9ePey+5ffjDKSSNQEXh9aYpFqNXLN5g6o8k=;
        b=UWpxUfn40yEHnuDQeuL6xpp7zb4c5UdQlXpjfennxRmlvoD9KFBqCyGOtuHUtDXzDZ
         WIGCvr7nRFITDbvX8ybOr2U6Jy+AfEtadT356ynOU716OOinJL6L4Ci8zDIg05EwwkOK
         2BMM8A59L2mNymMp7KslGnQmV66UDvY/UfrOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1yf2YrB+9ePey+5ffjDKSSNQEXh9aYpFqNXLN5g6o8k=;
        b=llgfodHJJmmGwJu0kxJV7MnRAGQM6bQ/FWSGWGm3C7DqKNqpBPPe/DW5/tMb69nNZ9
         WtkOGesIUJGSdCrzP3aLK1PxI7MqpTudiPlC+MoHqsME4oEuEuDoB0yC0dZciuDI3zgk
         21duzZoJJzy8Uv3CuNAjiR0lNei6K2oIckHXH7/7JynPSuhxAyQLhj/4sZ3LKmO9ys7k
         hbmfDbV2qyAPbP1+QuaUOuvpdL1C0jgueTW/MxS2zlwA5ewi3Gn5xbhHg4/pS4r5ZmXH
         Fq+XtHI7cLGdgffR09D6bTabEw27WKqNI1t3eOC1+VrcezMVUEw78A/xvMZ0ojB41/bL
         gnuw==
X-Gm-Message-State: AOAM530kONLlBBWTtCu2xXoUB8qrgr/aVCo2toD24w0yEu8g4lLvFfYd
        LuS/Yvtbq8jWRa6tnnbYid5/Vw==
X-Google-Smtp-Source: ABdhPJzKlYGFtnYmTjpMvBpjDQayUIgsCQZli3jY3pInTSxH8Hr1RTHo5tjAEWcKw48ge7wMxHR33g==
X-Received: by 2002:a17:906:cd05:: with SMTP id oz5mr2864966ejb.345.1615465248945;
        Thu, 11 Mar 2021 04:20:48 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id u13sm1264126ejy.31.2021.03.11.04.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 04:20:48 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 10/10] media: uvcvideo: Populate only active control classes
Date:   Thu, 11 Mar 2021 13:20:40 +0100
Message-Id: <20210311122040.1264410-12-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210311122040.1264410-1-ribalda@chromium.org>
References: <20210311122040.1264410-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Do not create Control Classes for empty classes.

Fixes v4l2-compliance:

Control ioctls (Input 0):
	                fail: v4l2-test-controls.cpp(255): no controls in class 009d0000
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 11 +++++++++++
 drivers/media/usb/uvc/uvc_driver.c |  1 -
 drivers/media/usb/uvc/uvcvideo.h   |  1 -
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 433342efc63f..5efbb3b5aa5b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2128,6 +2128,17 @@ static int __uvc_ctrl_add_mapping(struct uvc_device *dev,
 	if (map->set == NULL)
 		map->set = uvc_set_le_value;
 
+	switch (V4L2_CTRL_ID2WHICH(map->id)) {
+	case V4L2_CTRL_ID2WHICH(V4L2_CID_CAMERA_CLASS):
+		dev->ctrl_class_unit->ctrl_class.bmControls[0] |=
+						BIT(UVC_CC_CAMERA_CLASS);
+		break;
+	case V4L2_CTRL_ID2WHICH(V4L2_CID_USER_CLASS):
+		dev->ctrl_class_unit->ctrl_class.bmControls[0] |=
+						BIT(UVC_CC_USER_CLASS);
+		break;
+	}
+
 	list_add_tail(&map->list, &ctrl->info.mappings);
 	uvc_dbg(dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
 		map->name, ctrl->info.entity, ctrl->info.selector);
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 996e8bd06ac5..4f368ab3a1f1 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1501,7 +1501,6 @@ static int uvc_ctrl_class_parse(struct uvc_device *dev)
 
 	unit->ctrl_class.bControlSize = 1;
 	unit->ctrl_class.bmControls = (u8 *)unit + sizeof(*unit);
-	unit->ctrl_class.bmControls[0] = (1 << (UVC_CC_LAST_CLASS + 1)) - 1;
 	unit->get_info = uvc_ctrl_class_get_info;
 	strncpy(unit->name, "Control Class", sizeof(unit->name) - 1);
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 1d59ac10c2eb..cc573d63e459 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -186,7 +186,6 @@
  */
 #define UVC_CC_CAMERA_CLASS	0
 #define UVC_CC_USER_CLASS	1
-#define UVC_CC_LAST_CLASS	UVC_CC_USER_CLASS
 
 /* ------------------------------------------------------------------------
  * Driver specific constants.
-- 
2.31.0.rc2.261.g7f71774620-goog

