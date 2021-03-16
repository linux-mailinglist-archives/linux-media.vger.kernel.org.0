Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E7B33DBD3
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 19:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239604AbhCPSAp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 14:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239558AbhCPSAL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 14:00:11 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED632C06175F
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 11:00:09 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id b16so9875384eds.7
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 11:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DgS4OPGpMnlY/AXfZW8QgtbwbGQ3UnwEJWQevK1FyQM=;
        b=cG0II0bD9BO8wTxnNskixKM4IoZR5lfxEvmdzYjzx1KMvMD9a35KYSXzWCBTmDIsjy
         7jPK/a/JoQDMjUnOBznqdt7bJq0ICL7FTNt1gJcvyMxOLasgVXyL8OhiOyU9gdlf3cU6
         j2u66UMluSlRdjFIuumABGiJ1Z9H4xq+5zIp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DgS4OPGpMnlY/AXfZW8QgtbwbGQ3UnwEJWQevK1FyQM=;
        b=uK1RMm3OZJdobIsc1cdJ0SY83Gw+e5tX/2BgWcWPiRfmg+D6frWwK4kYU5lSGhfuoD
         Ww7Ub5+2taTQ1T9H3/MfFpT12cJEi8WVoay1Ezqur6DxMdrFablAEgygwO6E/RVHq3Jd
         9gQXLGgGnjaOrVvuWLGbIkXFrNVnZx8ImT0IMZP6J6ho4+FUdsWaX68FoFlGvXPfwUtN
         m8641AhyR/0GGQ1CTLQhmCeS+hBV7mXm/Sui20G54gLcspedE6kn9KgxfPlWCG22qIq1
         drwxlumbH3TqiOprmqB9LvPngnQOBXqE4ay5WTOPRdyaI3Hgg9CCFgGFgo6C2h8SGyFy
         fhTA==
X-Gm-Message-State: AOAM530qqH8QUlO15vEzJYTR3P6K6xFl+72DRBGXij0PPTUEeTAEM+f5
        jnQsQ3kERUalJHi9QT0UKePdqg==
X-Google-Smtp-Source: ABdhPJz7YUZrzF1/c9en2cWPZuO3gyNnvUfEwjU0ztOWHESL9qcPjLopL9NVEas4O5zneC3vmtudRw==
X-Received: by 2002:a05:6402:17af:: with SMTP id j15mr37619688edy.50.1615917608430;
        Tue, 16 Mar 2021 11:00:08 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id c19sm10953182edu.20.2021.03.16.11.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 11:00:08 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
Subject: [PATCH v5 01/13] media: v4l2-ioctl: Fix check_ext_ctrls
Date:   Tue, 16 Mar 2021 18:59:51 +0100
Message-Id: <20210316180004.1605727-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210316180004.1605727-1-ribalda@chromium.org>
References: <20210316180004.1605727-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers that do not use the ctrl-framework use this function instead.

- Return error when handling of REQUEST_VAL.
- Do not check for multiple classes when getting the DEF_VAL.

Fixes v4l2-compliance:
Control ioctls (Input 0):
		fail: v4l2-test-controls.cpp(813): doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls)
	test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

Cc: stable@vger.kernel.org
Fixes: 6fa6f831f095 ("media: v4l2-ctrls: add core request support")
Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 31d1342e61e8..9406e90ff805 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -917,15 +917,24 @@ static int check_ext_ctrls(struct v4l2_ext_controls *c, int allow_priv)
 	for (i = 0; i < c->count; i++)
 		c->controls[i].reserved2[0] = 0;
 
-	/* V4L2_CID_PRIVATE_BASE cannot be used as control class
-	   when using extended controls.
-	   Only when passed in through VIDIOC_G_CTRL and VIDIOC_S_CTRL
-	   is it allowed for backwards compatibility.
-	 */
-	if (!allow_priv && c->which == V4L2_CID_PRIVATE_BASE)
-		return 0;
-	if (!c->which)
+	switch (c->which) {
+	case V4L2_CID_PRIVATE_BASE:
+		/*
+		 * V4L2_CID_PRIVATE_BASE cannot be used as control class
+		 * when using extended controls.
+		 * Only when passed in through VIDIOC_G_CTRL and VIDIOC_S_CTRL
+		 * is it allowed for backwards compatibility.
+		*/
+		if (!allow_priv)
+			return 0;
+		break;
+	case V4L2_CTRL_WHICH_DEF_VAL:
+	case V4L2_CTRL_WHICH_CUR_VAL:
 		return 1;
+	case V4L2_CTRL_WHICH_REQUEST_VAL:
+		return 0;
+	}
+
 	/* Check that all controls are from the same control class. */
 	for (i = 0; i < c->count; i++) {
 		if (V4L2_CTRL_ID2WHICH(c->controls[i].id) != c->which) {
-- 
2.31.0.rc2.261.g7f71774620-goog

