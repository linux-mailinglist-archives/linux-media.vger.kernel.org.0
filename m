Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBE72DFFBF
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 19:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgLUS3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 13:29:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbgLUS3B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 13:29:01 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5822C0613D3
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:28:20 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id y23so11881935wmi.1
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4kcgi01wgItQpOubw2spttIDcP8vTsmoc49nzk/8qIw=;
        b=KZzkZ/gSDYYvjeSZ/JCelI18eU6zzJY3dZqIlxQ5JpDcCA4sfRdV7vaFIyDoNmTxrw
         xlBVxAvq9XxYTDO60TXU+oUJ45QbAWCGX3CRiODJMWt/sEXR63VeaAnWGO+G4Su7jgQU
         mKbUKa7Tda+ydjgHi4M6mOP2YX7Jrrd5dEcz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4kcgi01wgItQpOubw2spttIDcP8vTsmoc49nzk/8qIw=;
        b=XZLRrCmYD7NvnRc8bs7Pfjg7VPyCgIiOnQok8tikSudGUbR5rXWKSJdmPL5Q9q8Kmc
         PtpaEEUtEfTA78zyc/Fs6SCMQg3jUEZtF6GMfn1wClBjGQHT5bXJ4ZzT5VJVZ+UvYKPc
         9Jj0ygjpiz6k/WEAA0NIEO6KQeOKJMkMSyBstzTnL/JIg8RrcONoQd1F8ehBNoAwQZiA
         J6NHAqcma6yHu0swgXngUtCQmNd2OfwUkvxjRsZqL7Zia2/67Gsmqd8r3OHcjbuo6Qzg
         +2JOmVM7+E+I5B7daW6anLd3a7r0WpZHGCbcJYsXvlYVlTmspEImb/+kM05jf+T2leVf
         s/ng==
X-Gm-Message-State: AOAM533hHEpJx06DBtCbEnv18eb3oBHAoeiqew+b2j3txNn5mlwffPWV
        ku7sw4DFpSnG7w0BVKVtIAfPr6KtxrftDnlXPv8=
X-Google-Smtp-Source: ABdhPJy+SvXsvllykpmarIUJ6j7nFLIP4ZJYvTdam3Fhnv5/RGxuN5yLbb/mGzynU+kUI+jLdwrwJg==
X-Received: by 2002:a1c:8115:: with SMTP id c21mr17439949wmd.1.1608569306568;
        Mon, 21 Dec 2020 08:48:26 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o125sm24581109wmo.30.2020.12.21.08.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 08:48:26 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 06/12] media: uvcvideo: Allow entity-defined get_info and get_cur
Date:   Mon, 21 Dec 2020 17:48:13 +0100
Message-Id: <20201221164819.792019-7-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201221164819.792019-1-ribalda@chromium.org>
References: <20201221164819.792019-1-ribalda@chromium.org>
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
index d7ccd0fcd88d..528254230535 100644
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
 
@@ -1716,8 +1726,12 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
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
index 5d4da54dfd13..6edbf79b2ff1 100644
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
2.29.2.684.gfbc64c5ab5-goog

