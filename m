Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD1AF33DBEA
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 19:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239668AbhCPSBm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 14:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239596AbhCPSAe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 14:00:34 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5951C061765
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 11:00:20 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id x21so22613287eds.4
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 11:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ikrP8+2EH8+4zeKNCsi72tajctnnBDOuxjNj5BGVjiU=;
        b=FTII/Dd3zS7fyN4i9qthBGepAIzAa9Mg3ZAz2GSO29ysh0vjkwy8GsqgJc74kp1LAs
         LqEu5C0Q0+PxAg5exIEn6bIMo1ov3y+ZtFB3yIG6t5oK2Y0befYGqDHVxSyAz/oDVTMr
         N1RDeXQUm/bbhOf/vJCEw7kHqCzEwLjgRWflE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ikrP8+2EH8+4zeKNCsi72tajctnnBDOuxjNj5BGVjiU=;
        b=ggj4crmQzQ0FejVigH3gm0wJwxGbC/U8lqDnSg2ecF66eCyY1EDqttT1oV/mOVS92T
         w+6s2V2uVkd+YraeN6IdJWOCDJMjy9fz28pmYbtIXyt9w/odfg5cpS3xBbgkgVsM1ubC
         ttRaY8ccb1VTXLV+1BClsRc/8ELq5yMAeb1XQMSoH4rkLw75q5/l8jhikZzNzdH14+EA
         6Evqj521lmZMluDeUWeBwLpRkoz9wOPQUYS65Yg1naBvnbs1HSv2iI5St+1PW29V3V25
         H8+8CiZJ/qSweICFv2j3U4kyI9xmvQ3yxnKImOApC9kEIBNVMwVKPzaUTu0VcPplsdny
         uSsQ==
X-Gm-Message-State: AOAM530HMsUkpI224pXyWN1gp12C+quD0L/wEEmgYP2QX8M7iRCBqMnY
        ZQgzrLRquJOJW9U7+sySEG4S1Q==
X-Google-Smtp-Source: ABdhPJxM6Zt4Fe9QA/vTSqVS8cCaBIb2Bk0gPuwCI9YpdfkHV6aaWNaK6cc93N5by1WivHXadtiXMg==
X-Received: by 2002:aa7:c98f:: with SMTP id c15mr38184735edt.231.1615917615490;
        Tue, 16 Mar 2021 11:00:15 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id c19sm10953182edu.20.2021.03.16.11.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 11:00:14 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 12/13] media: v4l2-ioctl: Set error_idx to the right value
Date:   Tue, 16 Mar 2021 19:00:02 +0100
Message-Id: <20210316180004.1605727-13-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210316180004.1605727-1-ribalda@chromium.org>
References: <20210316180004.1605727-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If an error is found when validating the list of controls passed with
VIDIOC_G_EXT_CTRLS, then error_idx shall be set to ctrls->count to
indicate to userspace that no actual hardware was touched.

It would have been much nicer of course if error_idx could point to the
control index that failed the validation, but sadly that's not how the
API was designed.

Fixes v4l2-compliance:
Control ioctls (Input 0):
	warn: v4l2-test-controls.cpp(834): error_idx should be equal to count
	warn: v4l2-test-controls.cpp(855): error_idx should be equal to count
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK

Fixes: 6fa6f831f095 ("media: v4l2-ctrls: add core request support")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 9406e90ff805..936ae21a0e0e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2294,8 +2294,12 @@ static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 					vfd, vfd->v4l2_dev->mdev, p);
 	if (ops->vidioc_g_ext_ctrls == NULL)
 		return -ENOTTY;
-	return check_ext_ctrls(p, 0) ? ops->vidioc_g_ext_ctrls(file, fh, p) :
-					-EINVAL;
+
+	if (check_ext_ctrls(p, 0))
+		return ops->vidioc_g_ext_ctrls(file, fh, p);
+
+	p->error_idx = p->count;
+	return -EINVAL;
 }
 
 static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
@@ -2315,8 +2319,11 @@ static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 					vfd, vfd->v4l2_dev->mdev, p);
 	if (ops->vidioc_s_ext_ctrls == NULL)
 		return -ENOTTY;
-	return check_ext_ctrls(p, 0) ? ops->vidioc_s_ext_ctrls(file, fh, p) :
-					-EINVAL;
+	if (check_ext_ctrls(p, 0))
+		return ops->vidioc_s_ext_ctrls(file, fh, p);
+
+	p->error_idx = p->count;
+	return -EINVAL;
 }
 
 static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
-- 
2.31.0.rc2.261.g7f71774620-goog

