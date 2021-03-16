Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA4EF33DBE7
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 19:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239657AbhCPSB1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 14:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239586AbhCPSA2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 14:00:28 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700EFC0613E4
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 11:00:17 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id x21so22613094eds.4
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 11:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ja96hdOSrt13HYSO4/ylTT3yA/PsUo6jWkcoY1ITtj0=;
        b=MoMkgRIA2mYmviw59Dzr7aLEchSK46rI2ViVo9d7MUX3gipw1B2rApSwSth9zcB8dH
         Yjtw49MeiCYMF/MpJ7+2Ma+bzDv3tbEAtM9tYwyGVu94Ziu65eTzhomKXyhl+0Vm4Vrd
         zoB/idgHbK4WQ9sUBcStSKGKcp2uaRuyDoJVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ja96hdOSrt13HYSO4/ylTT3yA/PsUo6jWkcoY1ITtj0=;
        b=GkjEiHCPge1H60W98Hf1dLl0oAG8psqYYc0lQkR64l8NjA5VjYgNdVD3AyvoM0ptIw
         dmYcJxgmn5AKu0gQWMhlejgXJtx2qo/uaMzMe/6G3qtbfKLaPPWnQ0jCAWb+mSBkkXyv
         ChQ9ZGcSziAW9glngv4WB5c4VcmeE8FkmGtZjJih73C0h5PW3V2RU+VwlEFNi7w2Cxqs
         Zpt62+uYVMwDM8PbnxCnbf8n/SwXDL1NLXiZgF2pTZ2+G++igGEQncsVQQOpWPHwJzP1
         beIegDXBySRPUiJUUUrkqltxxQBKCioXQjzBNgoTmmYXhQz3uvooR3Q6cRHgT/S/vZ3f
         KnYQ==
X-Gm-Message-State: AOAM530DL87pcSu1Iopmc1SYJ8Wcb8CFGIk/aZk3G8iymsZ/oCnsP2Uf
        ID8S2sM2R8CCK7RxbFS0zzmttg==
X-Google-Smtp-Source: ABdhPJwoUkf+us/T5WW2FCD9aAIUH8TL+oT0Nz8+UpHFq2Z4nDT6l6LVudUTIKbDauXfr9rntSt4mw==
X-Received: by 2002:a05:6402:1115:: with SMTP id u21mr37523071edv.383.1615917613366;
        Tue, 16 Mar 2021 11:00:13 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id c19sm10953182edu.20.2021.03.16.11.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 11:00:13 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v5 10/13] media: uvcvideo: Return -EACCES to inactive controls
Date:   Tue, 16 Mar 2021 19:00:00 +0100
Message-Id: <20210316180004.1605727-11-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210316180004.1605727-1-ribalda@chromium.org>
References: <20210316180004.1605727-1-ribalda@chromium.org>
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
index ba14733db757..98614e1be829 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1578,6 +1578,18 @@ int uvc_ctrl_begin(struct uvc_video_chain *chain)
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
@@ -1621,8 +1633,11 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 
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

