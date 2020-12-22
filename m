Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5D82E107E
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 00:13:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbgLVXGM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 18:06:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbgLVXGL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 18:06:11 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8CE3C0611CB
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:53 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id 91so16664967wrj.7
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=06MDz+xB7KNYGGW1OIf0dRikIOLIKAmW3UNXPIs7AXg=;
        b=QmtaeuPPMC0PXX9txoGp+OXSv8kwMX+dNhPKNdYqpFV7FxbPoVV5QSzEp8zfMjigRd
         P5Q0AVOXNjor9XoLQZF9E9re3+DrZ8/HcaqENbfRrDaxm3bFw/ik2w9PT2XuNRqAC+UP
         agXz2fp6vHK1W4jHCSmvzm9Rki9RC1UX4Aews=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=06MDz+xB7KNYGGW1OIf0dRikIOLIKAmW3UNXPIs7AXg=;
        b=XYov3oQlpv3KpbZiMJ4QbmKUdWXhKQlirnmInPuMTglLv1/ewO0NSAQqZqeG1hOhal
         v32zxIl85xBAhV8IFicpJlmuGjaGw4o2E5YVvzDZj5FBW0xpHfxS7ZDXMIfr23GBcNxr
         v+L4j7fHjYILljKJI6DQ/VNPOwOLZzsSXgtky+sEQ8XlTxusWCsazVv+UbJRMwFvWt8k
         02vi/FnXgJRhbzlwbLwelEVteN85a+T9hqh8DbpDiXOAZOS7sU5grtQICiUO9nW613+/
         b0aamfmtLAUC3lKeJP02dISO+1ovcWEgwRKCL/r/xRAS4s41tSZz/68A2SY4UtifgBaw
         1zpA==
X-Gm-Message-State: AOAM532dvjyaR84KDPXNR5Pe8OhDGn5/MPsMARhyyqlOYbLl05/8y1CW
        5QsNXTbg24zfSBFyUDSK/AZv3A==
X-Google-Smtp-Source: ABdhPJzkQ4XJIW9XHEY9OOjyJgSaYjZiKltQ9esyYUckW6XMaKKZVZ1z4kYSERYIGS7wCkSG9j1FMw==
X-Received: by 2002:a5d:4987:: with SMTP id r7mr27069125wrq.352.1608678292437;
        Tue, 22 Dec 2020 15:04:52 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id r16sm34463401wrx.36.2020.12.22.15.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 15:04:51 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 05/11] media: uvcvideo: Allow entity-defined get_info and get_cur
Date:   Wed, 23 Dec 2020 00:04:40 +0100
Message-Id: <20201222230446.1027916-6-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20201222230446.1027916-1-ribalda@chromium.org>
References: <20201222230446.1027916-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allows controls to get their properties and current value
from an entity-defined function instead of via a query to the USB
device.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 22 ++++++++++++++++++----
 drivers/media/usb/uvc/uvcvideo.h |  5 +++++
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 5fe228a3213b..acdc9b032306 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -980,10 +980,20 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
 		return -EACCES;
 
 	if (!ctrl->loaded) {
-		ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
-				chain->dev->intfnum, ctrl->info.selector,
+		if (ctrl->entity->get_cur) {
+			ret = ctrl->entity->get_cur(chain->dev,
+				ctrl->entity,
+				ctrl->info.selector,
 				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
 				ctrl->info.size);
+		} else {
+			ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
+				ctrl->entity->id,
+				chain->dev->intfnum,
+				ctrl->info.selector,
+				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
+				ctrl->info.size);
+		}
 		if (ret < 0)
 			return ret;
 
@@ -1712,8 +1722,12 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
 	if (data == NULL)
 		return -ENOMEM;
 
-	ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id, dev->intfnum,
-			     info->selector, data, 1);
+	if (ctrl->entity->get_info)
+		ret = ctrl->entity->get_info(dev, ctrl->entity,
+					     ctrl->info.selector, data);
+	else
+		ret = uvc_query_ctrl(dev, UVC_GET_INFO, ctrl->entity->id,
+				     dev->intfnum, info->selector, data, 1);
 	if (!ret)
 		info->flags |= (data[0] & UVC_CONTROL_CAP_GET ?
 				UVC_CTRL_FLAG_GET_CUR : 0)
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index d7954dcc2b60..64a3d901db19 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -358,6 +358,11 @@ struct uvc_entity {
 	u8 bNrInPins;
 	u8 *baSourceID;
 
+	int (*get_info)(struct uvc_device *dev, struct uvc_entity *entity,
+			u8 cs, u8 *caps);
+	int (*get_cur)(struct uvc_device *dev, struct uvc_entity *entity,
+		       u8 cs, void *data, u16 size);
+
 	unsigned int ncontrols;
 	struct uvc_control *controls;
 };
-- 
2.29.2.729.g45daf8777d-goog

