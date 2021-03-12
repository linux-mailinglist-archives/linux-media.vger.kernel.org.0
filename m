Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2885A338D72
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 13:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbhCLMtJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 07:49:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhCLMsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 07:48:37 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA794C061765
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 04:48:36 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id u4so7759413edv.9
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 04:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DupZZazo2oB31Bj6cdgdAjve4Ho7Bea77n2qJ3mo1HU=;
        b=CBDdZqGhvL2Psmx/JTwi+0boQw0Ze4mdaqUOGjBFHDXdMfIqs39Slrd1TZTKuGcvdY
         /CcUNH2ufHxLNCRmkLQkr8ry4ePlwpfRY5fRKXblonJpOPK/PvqxNMJGCueBKogcY5bM
         3lvQXLbXjmTR8TI2nBwoUh9btc1IIlVix/sZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DupZZazo2oB31Bj6cdgdAjve4Ho7Bea77n2qJ3mo1HU=;
        b=aS6oDUOiL3xT7aPcYuq9ooy1fTQdoaN/cjwzo9y4MLeRbiSzaUsfIdg40O0SXqT3WP
         0HhLaCZoBB4i6SETInELnSHJRUBRzgDVRORN8CqtycB2mF6fhlb+FKP4/BNaisOwywVa
         BaU9E4FnlCortkgIyM51CEadIEQDIr5Hr3DnhaIS1rK1wkqQ9/01oU4CN4BeetIiKRLO
         0mQhWdiEQ6X6vjZHmkcWHxRd/QLB2n0qv6TnYJZg4cQ77Crc/Df9qn4JyRBVaUcYmuJu
         quwv8BUFArEOfQ3I9Q72xRUHCxQa6dUs1RUluSjwOuqQoubog0S92cCu4glI4qEjUCnz
         TiXw==
X-Gm-Message-State: AOAM532RCFrNiuXp1CDqvvzjXAuTiiCX593YpUcx3kS0ewDLNaTLwx6v
        6p8E9VXhz+LGHuv/hWOZ8zRobA==
X-Google-Smtp-Source: ABdhPJwkzb8T75wSqUMjmn6mEDO1PyKol0KC6+ushEUrkG2ztGJRyTvU+hZ5Elp73u2cGBkHgImd4Q==
X-Received: by 2002:a05:6402:3096:: with SMTP id de22mr13891541edb.141.1615553315449;
        Fri, 12 Mar 2021 04:48:35 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t6sm2924402edq.48.2021.03.12.04.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 04:48:35 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v3 4/8] media: uvcvideo: set error_idx to count on EACCESS
Date:   Fri, 12 Mar 2021 13:48:26 +0100
Message-Id: <20210312124830.1344255-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210312124830.1344255-1-ribalda@chromium.org>
References: <20210312124830.1344255-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If an error is found when validating the list of controls passed with
VIDIOC_G_EXT_CTRLS, then error_idx shall be set to ctrls->count to
indicate
to userspace that no actual hardware was touched.

It would have been much nicer of course if error_idx could point to the
control index that failed the validation, but sadly that's not how the
API was designed.

Fixes v4l2-compliance:
Control ioctls (Input 0):
                fail: v4l2-test-controls.cpp(645): invalid error index write only control
        test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 157310c0ca87..36eb48622d48 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1073,7 +1073,8 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 		ret = uvc_ctrl_get(chain, ctrl);
 		if (ret < 0) {
 			uvc_ctrl_rollback(handle);
-			ctrls->error_idx = i;
+			ctrls->error_idx = (ret == -EACCES) ?
+						ctrls->count : i;
 			return ret;
 		}
 	}
-- 
2.31.0.rc2.261.g7f71774620-goog

