Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 320CA2B9D27
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 22:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbgKSVul (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 16:50:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgKSVua (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 16:50:30 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725D9C0613CF
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 13:50:30 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id p22so8555949wmg.3
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 13:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=55kTCi5y+XICNGDL7/0eGjMXC1xD8wNQoc79/T3mLfc=;
        b=JjYyZQ4S7vK8vC8Y7IimnwmKCaXDRkK6YetwVCQyP+Kp1TP3VmRgkRoVh2+1T3ZuPZ
         spU2DMO4uYH+89dwK76VqHR0Lh/gweJX8DhzxTm28C2NGdO0+S/hI2NbGKKo6NMwLrc2
         oeRifcizLjIdoFIcH3u+DnFE/uaPZMoSW83gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=55kTCi5y+XICNGDL7/0eGjMXC1xD8wNQoc79/T3mLfc=;
        b=KP0mfn2VaGRdIc8vfGxTawgjeitlUl9WjohzUsGMSHgWAe4IzqM+yHjtlh5IARHGyA
         FepayKLoH0EekdpUA2ir2GtbxksQQ6PBCQ8UmRDS+RNZ2fM08ZChjQ3uQVt/gz6c1gOo
         paz4JR3K7cgQbIKbwIOQ2sr5K8xD/lQHPgdrDI3AbE0/AjCvyP2MIMJp1dRZltygMCaJ
         lZ/zmHXoQC9q64Gcvs8aAddIEvqV6Wykr9E5FO4xXZDWuqkAytmZZ5jWyo67R+ZxXWFo
         Hfh7NlcW7gFz9SoEvJD68C8hsNY3BMOYblKzJPwM27UHdCk/N7Wzd8h3UlUvdBxNNXha
         Cy5g==
X-Gm-Message-State: AOAM531iHT2mPiOKvaWb+WVkSFwAyUTN78tFXi6oWGbev1oyQLau48Kp
        SH02B8svjGADAlAkHdJb3qcCqFRj4BJFZ0P8
X-Google-Smtp-Source: ABdhPJwGQXcAztFA2b5IjTVFDNRZaQUoXGZkkBNAAEzQVQrwKt6Xuian7/zxpYixdFsBSdopVXiAhg==
X-Received: by 2002:a1c:1fcc:: with SMTP id f195mr6560456wmf.121.1605822629231;
        Thu, 19 Nov 2020 13:50:29 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t136sm1818859wmt.18.2020.11.19.13.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 13:50:28 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 4/8] media: uvcvideo: Entity defined get_info and get_cur
Date:   Thu, 19 Nov 2020 22:50:16 +0100
Message-Id: <20201119215020.508487-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
In-Reply-To: <20201119215020.508487-1-ribalda@chromium.org>
References: <20201119215020.508487-1-ribalda@chromium.org>
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
index 0e480b75e724..492328cb470e 100644
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
2.29.2.299.gdc1121823c-goog

