Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC87D2DB088
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 16:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730575AbgLOPv7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 10:51:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730389AbgLOPqT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 10:46:19 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0748EC061257
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 07:44:58 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id 3so18937328wmg.4
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 07:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3wV/AOSne7E+EfoqlU+H9fm9rlpHS9aoMV+ZOvP11RE=;
        b=QOodsj7wDj2i2sEc/4m3+mGF17ZpPgace3a4L7qt807wBqL9JhUhEsmjn14B48uRB/
         y/DGhCbc9YrB2W+6DQFTMIvLiMhNHXxoOQwCg/fSfdwnr88IMrEVW1ln2uD83vpS5Z3V
         NOBbIVQhvHnsCamVeufwNVXgLx9NLayQlTUwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3wV/AOSne7E+EfoqlU+H9fm9rlpHS9aoMV+ZOvP11RE=;
        b=I4OgzXa3TO8ykIr6ccl/QbRS5trkKUPSR4FRQQAE5yt3USvIQvHFGWw/Dg6OTDtixN
         NtkqUiamBiskacapU13/Cotgu+eVbQFbzXl8e47Va/3HzoON8/PPNuHeqyQKXscUC6k/
         HOKSxMNvAr4y6dlerlLV09203v3gIzCnujiw3ipMsXH/btZ+nPqWd1b/xsHPbMlrnN1l
         7Uj24aus8ALg5Qhjygz7MXFwnOgQEOQj3csGLFPWyouZFqQ+/nzT3bjBIRWhJxhFUKCW
         btcOEmBc9vB4aGHmiXMgo++AWPLm6KgYMZXaHMZWJhAphubE59BTSMZ/btNjEwGaQ0of
         5tFg==
X-Gm-Message-State: AOAM5324A2Pl2+RwHpdNqYyeQMTL4m5RjJtWRK+RWsb4gn73b/YkRM2H
        NOqnsfdTjknha1+CwXuT8XtPNw==
X-Google-Smtp-Source: ABdhPJxtsNoSao2QbsBOASqeZxT9UZX3NjTA/x584Cqpddb8w0glp3zv1FDnMv9uZnrZq218e0sdlQ==
X-Received: by 2002:a1c:2586:: with SMTP id l128mr5497423wml.78.1608047096750;
        Tue, 15 Dec 2020 07:44:56 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id 125sm38204141wmc.27.2020.12.15.07.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 07:44:56 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 4/9] media: uvcvideo: Entity defined get_info and get_cur
Date:   Tue, 15 Dec 2020 16:44:34 +0100
Message-Id: <20201215154439.69062-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201215154439.69062-1-ribalda@chromium.org>
References: <20201215154439.69062-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allows controls to get their properties and current value
from an entity-defined function instead of via a query to the USB
device.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 22 ++++++++++++++++++----
 drivers/media/usb/uvc/uvcvideo.h |  5 +++++
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 9f6174a10e73..531816762892 100644
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
 
@@ -1687,8 +1697,12 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
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
index 00f985001c1d..ae464ba83f4f 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -353,6 +353,11 @@ struct uvc_entity {
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
2.29.2.684.gfbc64c5ab5-goog

