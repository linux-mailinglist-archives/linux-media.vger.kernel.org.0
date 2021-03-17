Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9447B33F5E2
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 17:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232729AbhCQQph (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 12:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232649AbhCQQpU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 12:45:20 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCEEC06174A
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 09:45:19 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id y6so3112768eds.1
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 09:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FSJfEMpG3gmvu/1zHkC5YrHmNIBqGbW9b1IfyrEOzZs=;
        b=Ppr6uEH3M4iQ4x7EubfspiKI+zLTbyizYo+Epvky40rVJrS4Szp/1hNl4CfDrg+jCq
         sAxLqZKllXqphItrwf8+QyMUDuFtD3ZYHxzGs53mDs+2FArS1ReQ+Jjg49v9ScDpbYJ5
         bcPdvAHtD6W8hkzEvOF08TBShmmIHAiqooENM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FSJfEMpG3gmvu/1zHkC5YrHmNIBqGbW9b1IfyrEOzZs=;
        b=G0rLUvVu8gzWZInC/gaxA432JS4al0nmE6v0FDOJ34DCKrd3IFOvWsUs50M7K5efTl
         NhCJaHntCJiPZlVN5VnIYjV/ta2EObLxrufdPDE68XlVi6cp9QBpLkiUzrrhVtuBw3CA
         ZHXWtTue/64mAlengFh+KH+YiqQqW7ys06XS0UXCwfX5aFoKpa0FkpjjCapVidzijJZr
         mAMzFw8xpF76Bg2BMcaQrujHssQvOVTEaGSxqY5VP88sxuCVkVF0yLaIJJu+Gv8ue1lQ
         IZE2jncOxzUJYRXE5GBfLQqqoeO2X/vPWXhiYu5q0cstgBM1gg9a7YoRYP7KgQc9t/g7
         aYwQ==
X-Gm-Message-State: AOAM533SaeImbwi1vR/aXM6BLbpKkRlovtLrcc5MDGI8DbSW9GwV0KGM
        mQg9rr3rUG+ygBZXcd4jBXpMew==
X-Google-Smtp-Source: ABdhPJx8K40+dd/2Szp+kWXiObOZ/fNH8X8zj6Z3cgVhmkw2M7JuMlASxf5QLiSiMRUZ15adjgUdpA==
X-Received: by 2002:a05:6402:4241:: with SMTP id g1mr33792443edb.331.1615999518419;
        Wed, 17 Mar 2021 09:45:18 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id hy25sm12088128ejc.119.2021.03.17.09.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 09:45:18 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 07/17] media: uvcvideo: Set capability in s_param
Date:   Wed, 17 Mar 2021 17:45:01 +0100
Message-Id: <20210317164511.39967-8-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210317164511.39967-1-ribalda@chromium.org>
References: <20210317164511.39967-1-ribalda@chromium.org>
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
index 47b0e3224205..397217171bbb 100644
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

