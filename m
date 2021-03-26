Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA2134A510
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 10:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhCZJ6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhCZJ6t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:58:49 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF73C0613B1
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:48 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id kt15so7467449ejb.12
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kC71O7mgFntuzJoDSI8vq4wass7q97TNbxvCpydYjHA=;
        b=lnIbbFaFA1NeWxJwk96P8UeCjY14eS1euXdCbkNiVhfhjgQcwfWujSlmA4xPfft9YZ
         Gl0eOxR+d0lRqngQMghci8XytRROb3DZ9NU5AUzdMq7c15xefM502DxPuJ6fqrYkTD0Z
         11TCLaFxNFjxWwysuGOQ2+EPgMPAK5iryvXGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kC71O7mgFntuzJoDSI8vq4wass7q97TNbxvCpydYjHA=;
        b=QUoxOZhTWAcjUDFKOjJE7LKZiZGX6deyI9B+Yc8PGZY8mmytx7HHa9t9wIfB10yDAV
         OcfpxI4lqMJPAOFVgIQCiSOqB1p+4jflVfuf8gKbzmnoPkPCTkT02RqfhC6ZnGNwmIb7
         zN4BxFftQj0iB86EQcl5ZrrOKk1Ocglipxnn4JYRb1PyFPbMDAwWqY6yu1EccU2nlDx0
         CGFYNcLiSBRqOfhjtKwQZ6DeWfFUqmi9rBsRa/l0AfA2NfWK2SskM5xa3ItZAM/tfB+2
         3q6M52wKLu8wjbzd63USOJmo1aRqETwHn6TDMTPhAp5Om9EdVKVOy5GasM/ZZAGQYR0I
         TgKw==
X-Gm-Message-State: AOAM530f+WzZ5cjFJO7shlojW1BcS4tek8nZLm09ifQIVXjwB02XqZQy
        irCHNASNvkja+25CJ0G0t/di+A==
X-Google-Smtp-Source: ABdhPJycuvhnOM0hm++0vYD9gRyRidcx/FE2H1tfgUcXuuaXDHrFSGrOfpQegT1wmxAFxSZoau98Mg==
X-Received: by 2002:a17:907:1614:: with SMTP id hb20mr14324510ejc.77.1616752727627;
        Fri, 26 Mar 2021 02:58:47 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h13sm4036658edz.71.2021.03.26.02.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:58:47 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v9 04/22] media: v4l2-ioctl: S_CTRL output the right value
Date:   Fri, 26 Mar 2021 10:58:22 +0100
Message-Id: <20210326095840.364424-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210326095840.364424-1-ribalda@chromium.org>
References: <20210326095840.364424-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the driver does not implement s_ctrl, but it does implement
s_ext_ctrls, we convert the call.

When that happens we have also to convert back the response from
s_ext_ctrls.

Fixes v4l2_compliance:
Control ioctls (Input 0):
		fail: v4l2-test-controls.cpp(411): returned control value out of range
		fail: v4l2-test-controls.cpp(507): invalid control 00980900
	test VIDIOC_G/S_CTRL: FAIL

Fixes: 35ea11ff8471 ("V4L/DVB (8430): videodev: move some functions from v4l2-dev.h to v4l2-common.h or v4l2-ioctl.h")
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 7b5ebdd329e8..b8f73a48872b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2266,6 +2266,7 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
 		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
 	struct v4l2_ext_controls ctrls;
 	struct v4l2_ext_control ctrl;
+	int ret;
 
 	if (vfh && vfh->ctrl_handler)
 		return v4l2_s_ctrl(vfh, vfh->ctrl_handler, p);
@@ -2281,9 +2282,11 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
 	ctrls.controls = &ctrl;
 	ctrl.id = p->id;
 	ctrl.value = p->value;
-	if (check_ext_ctrls(&ctrls, VIDIOC_S_CTRL))
-		return ops->vidioc_s_ext_ctrls(file, fh, &ctrls);
-	return -EINVAL;
+	if (!check_ext_ctrls(&ctrls, VIDIOC_S_CTRL))
+		return -EINVAL;
+	ret = ops->vidioc_s_ext_ctrls(file, fh, &ctrls);
+	p->value = ctrl.value;
+	return ret;
 }
 
 static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
-- 
2.31.0.291.g576ba9dcdaf-goog

