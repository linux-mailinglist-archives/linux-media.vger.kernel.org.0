Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 964E7337255
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 13:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233148AbhCKMVA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 07:21:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233119AbhCKMUq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 07:20:46 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C275C061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:45 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id mm21so45721744ejb.12
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5NeM7Soa1KpDS0TograRre+Oj0MkKDYHA02GekTX+K8=;
        b=OtwZAJvoTG9SwWEwdqkr7b2wVuiQlAaV2T+6d6Wfy5YRuG2HsVfTnYTzFDyZFPAUQX
         a8VAZqgFH2DGuEifrLURo4a0HzwY4fvLLErBhqPuljh0zxE1XM/n1XUZKtxxAgecMdu+
         tim/MixlxQ6NZv2ufjCz1qUOWrU0uRChF+vm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5NeM7Soa1KpDS0TograRre+Oj0MkKDYHA02GekTX+K8=;
        b=VWNV6DyYGAdXO0n1zNTar6S/0t+rLt2nVoxzgBcDDU7CtDT9mEUecgHYbbGN+dl+91
         dabcDlNpbuPJ5TwBj6fwKddIb+/8WkQmbmtPIEKY8hiY+oSZe7tdnI3N1mBAUq0MdmeY
         9w6BGbMAKTuTwa+v8Lfxci4rBOF/PNP+9JKLw/Avoxgyco3iU9RkK6o3pJDm+0oSbS7+
         dHGbAf/rwDN7iZeyOZ1HEOZvxvH9LEkNB/xBioK8mJcFziS0UWPMVrYBvoqodfv/q8ij
         2bhmsXSaIuXgngl+M629N56GU3muUkWstM64GPuK1Mj8FONz3NO50HiMVvQNso/qVewv
         JXOQ==
X-Gm-Message-State: AOAM530+coTN0657S7OAQuY2fwm/guzqoQnCOg9TXlDT6TK/pv6Rc/xj
        8nyJtcox5Cf0W8inGEX1v3ZM7g==
X-Google-Smtp-Source: ABdhPJxMkGsld8bPDh1woow4boX8GSdu5EUrHojZV+uXD6RqFOwBbS027oD6S6w+tTZQ0EmR6pgMww==
X-Received: by 2002:a17:906:565a:: with SMTP id v26mr2870780ejr.516.1615465244394;
        Thu, 11 Mar 2021 04:20:44 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id u13sm1264126ejy.31.2021.03.11.04.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 04:20:44 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 02/10] media: uvcvideo: Set capability in s_param
Date:   Thu, 11 Mar 2021 13:20:32 +0100
Message-Id: <20210311122040.1264410-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210311122040.1264410-1-ribalda@chromium.org>
References: <20210311122040.1264410-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes v4l2-compliance:

Format ioctls (Input 0):
                warn: v4l2-test-formats.cpp(1339): S_PARM is supported but doesn't report V4L2_CAP_TIMEPERFRAME
                fail: v4l2-test-formats.cpp(1241): node->has_frmintervals && !cap->capability

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 5e3ec4a376e4..625c216c46b5 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -472,10 +472,13 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
 	uvc_simplify_fraction(&timeperframe.numerator,
 		&timeperframe.denominator, 8, 333);
 
-	if (parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+	if (parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 		parm->parm.capture.timeperframe = timeperframe;
-	else
+		parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+	} else {
 		parm->parm.output.timeperframe = timeperframe;
+		parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	}
 
 	return 0;
 }
-- 
2.31.0.rc2.261.g7f71774620-goog

