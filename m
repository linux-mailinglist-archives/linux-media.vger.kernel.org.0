Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C458338D6E
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 13:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbhCLMtH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 07:49:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhCLMsf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 07:48:35 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97321C061574
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 04:48:35 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id o19so7793588edc.3
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 04:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kGLUxRHfm3EIlGd4N+uEn8OSkXWMynAv8QMKM8OCTEg=;
        b=OcfitQkDEmqz6i/LUhUwRQWnWYbqwZy/yg5MRCGWtQiuumoGvIreNPZ6Gk60JH7lRD
         V3CDe66SN30j0ZnhLEbMKSneoBPL9kdszHSLIt9vaDQ8zeEXOef44zDux8pLSHBlX/48
         /EVuzT2uy7CuWecj6qW5q97QpoOKx3i486aiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kGLUxRHfm3EIlGd4N+uEn8OSkXWMynAv8QMKM8OCTEg=;
        b=fHt6Gd/R+7UTusO3QbZsxhXPr8B1LewedKFMlaqg+Yps7eU4TvAe7kPKoD7F4I54C1
         V8WBjpTjNwRaqrxlZAnl3Eio6bC/cLhJ5LDYC+0z4aRqcVVYzfdlIwum9avA41mdjtAP
         LC/AlkzGBcN1KiG+MVu4sGMnsN+CJqq/slrY4avPyT4VDJiZCiAR+4sNdf7d5x/RwBsF
         oIKyVieUcc5g9Ae256p7My4wd38aCdcbYBGLTHQ20ow6tuYAkH0QlIe+j+X2iGwVXQnL
         tKrIkzsaYENUbdqODGVhJsrXaQmrConXG8sdmMw88eG9GD6gKEwol/XMe0Pxi7jLdTH6
         w3uw==
X-Gm-Message-State: AOAM531CKM8LqL7RF/e4tajZdHOfHlcKs1uzGMH+Rq+SYHh/YG3tJ5ve
        QY4Ye5VLPlJQBiZ1xdAV25EzjA==
X-Google-Smtp-Source: ABdhPJyjNw+4IgWaJAkEbljWm+a5gGp+jMcnn58yEvs+I9aH1hVZMFXaGikL5FstRrfk3tMsMG3LBQ==
X-Received: by 2002:a05:6402:5255:: with SMTP id t21mr14035348edd.91.1615553314340;
        Fri, 12 Mar 2021 04:48:34 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t6sm2924402edq.48.2021.03.12.04.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 04:48:34 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v3 2/8] media: uvcvideo: Set capability in s_param
Date:   Fri, 12 Mar 2021 13:48:24 +0100
Message-Id: <20210312124830.1344255-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210312124830.1344255-1-ribalda@chromium.org>
References: <20210312124830.1344255-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes v4l2-compliance:

Format ioctls (Input 0):
                warn: v4l2-test-formats.cpp(1339): S_PARM is supported but doesn't report V4L2_CAP_TIMEPERFRAME
                fail: v4l2-test-formats.cpp(1241): node->has_frmintervals && !cap->capability

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 252136cc885c..157310c0ca87 100644
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

