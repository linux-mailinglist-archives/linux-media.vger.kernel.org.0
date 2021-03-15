Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9CB33C469
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 18:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236416AbhCORgp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 13:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236318AbhCORgS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 13:36:18 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639F6C06174A
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:18 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id mj10so67678464ejb.5
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 10:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gu1wcX48JlWZ2XlvoaI7f2bN46PWKUfPqpf8jSMDkdo=;
        b=nHNLDKWRORkq3k0tierRfwmLevAt3HWL/9TfLhhjs3xnMTspkMjFmqODWROATtVFp9
         fkopzFEy/SO9q270XgObukLBPiL6I6p8PBEx0XErIAk4u05k7vpyL0DARhU4M+wmYXgo
         IzK3VDOMamTu3DMvOdR5cb0cYfim1V9lYVHRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gu1wcX48JlWZ2XlvoaI7f2bN46PWKUfPqpf8jSMDkdo=;
        b=q2t2ZHwy7G1owycXH8bUMLPlnMsYsytYa2+Ep+AX5qq3MMw1vBjIbBVbqZyNrmajr2
         YTZ9+z7fx1vT6WFBb0gurCBbP9IRMqW38VdAnIzeQKgmuJ9qkUl62P1ysukeqWnEjltX
         0u+l6gzrWC/ZNQEYiUnx2rkr769pAopw9BAcPQFS/RzpGsetMJ256MA+v1JgYI7EBLwL
         NUcmbePr3SODqW/Lqfki/R1Z4jfJ6kkb7LoBP60KdbhrsCrdWNq8Js27npCA/D/ONM80
         utE1mgnCiPVdPjLFGGYFew8QfGHxPz9urMW2YPSg6ZQs+kGpUe/4JvQ2NC9zRcqqXLEX
         HBuA==
X-Gm-Message-State: AOAM532HJ6MIxVEUGnZL9A1YngnTWoe8Tb8sIPxmSkySBXf1GaP3/uD6
        FfmCL2sh7a20HLlw20Tf9CP+tw==
X-Google-Smtp-Source: ABdhPJxQm6bapTBDZZar4MkfnY9xHaa7QDt+S/GbHMGwB4CLe7f6XFkVd7ng90xntXFwPT8IQQoSpQ==
X-Received: by 2002:a17:907:d09:: with SMTP id gn9mr24166311ejc.538.1615829777126;
        Mon, 15 Mar 2021 10:36:17 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a3sm8109239ejv.40.2021.03.15.10.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 10:36:16 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v4 10/11] media: uvcvideo: Return -EACCES to inactive controls
Date:   Mon, 15 Mar 2021 18:36:08 +0100
Message-Id: <20210315173609.1547857-11-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210315173609.1547857-1-ribalda@chromium.org>
References: <20210315173609.1547857-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If a control is inactive return -EACCES to let the userspace know that
the value will not be applied automatically when the control is active
again.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index be0fadaf414c..f1593dc2f1ef 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1580,6 +1580,18 @@ int uvc_ctrl_begin(struct uvc_video_chain *chain)
 	return mutex_lock_interruptible(&chain->ctrl_mutex) ? -ERESTARTSYS : 0;
 }
 
+static bool uvc_ctrl_is_inactive(struct uvc_control *ctrl)
+{
+	struct uvc_control_mapping *map;
+
+	list_for_each_entry(map, &ctrl->info.mappings, list) {
+		if (map->master_id)
+			return true;
+	}
+
+	return false;
+}
+
 static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 	struct uvc_entity *entity, int rollback)
 {
@@ -1623,8 +1635,11 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 
 		ctrl->dirty = 0;
 
-		if (ret < 0)
+		if (ret < 0) {
+			if (uvc_ctrl_is_inactive(ctrl))
+				return -EACCES;
 			return ret;
+		}
 	}
 
 	return 0;
-- 
2.31.0.rc2.261.g7f71774620-goog

