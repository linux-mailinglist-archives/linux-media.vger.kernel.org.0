Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150FC3422DD
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 18:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhCSRJm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 13:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhCSRJM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 13:09:12 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EA5C061761
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:12 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id h13so11629742eds.5
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AikJF0GK0ZzYGbwbgBUzJRLCgyMvlKF2iA5mDBYu/f0=;
        b=atYHlbtsaqi04LfSg5Eox0I8qpNOjB6GEdi0psVT9m5ldSjyzg1eh67CmEdPjM6f2Q
         p7AMVV4XhWzFgVxvstDqqYgicBPRljDxT+CFM0XG48Ck4uEAE1JXuRpZJ2h5YhVRLwj5
         5QyesM2zRMk8xFbagNwTwnbdJLsikJ99YGPnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AikJF0GK0ZzYGbwbgBUzJRLCgyMvlKF2iA5mDBYu/f0=;
        b=EhsSkvcTJHPn01oE90YEOPMY1kD42ruceyfqcAPhpcTTB4RyF2Es5ycOeGse3MR2a6
         pR2X9pHpomizP7ROVWRwOwGt1/q6sC8iSz55wwwD4woF5n3IfkIukRrVvxAPbcLDiDtM
         UjV+Malg40/fJ/+Qb1OPpE+BSSQXcKFnMVpxud17x30VFZFPOKMNObhoK1t0lbjFujOy
         ZufwlFGLcFVCAct4qAAvyz/qUNamKYw+S1jQhbJtZLNqGzk3T6SxYk2oB5wE2FdPuiai
         MGRwU8tJOuC8tu2yVo7F6DYWCyaU2nlhzL2hIT/dtkTFp1VjwXeIREG1MEel9c3ExsDF
         o7eg==
X-Gm-Message-State: AOAM533GxkHnNFA9Aii+HiTT1MmqSTI/JOnyW3hGyIAIXVq5e5TAUiHK
        TLwQj/9XT2DZxUfO8sg8RjlICP1i4AUQ0hecfm8=
X-Google-Smtp-Source: ABdhPJxI99fkvrgLJHO5qGgSJ9AaOaaS/tK5beBYqpWjyq91Jv+kmUyBEqUN0D/QActs2iQvgwxihw==
X-Received: by 2002:aa7:c447:: with SMTP id n7mr10623091edr.171.1616173750816;
        Fri, 19 Mar 2021 10:09:10 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id be27sm4506050edb.47.2021.03.19.10.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:09:10 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mike Isely <isely@pobox.com>
Subject: [PATCH v8 02/19] media: pvrusb2: Do not check for V4L2_CTRL_WHICH_DEF_VAL
Date:   Fri, 19 Mar 2021 18:08:49 +0100
Message-Id: <20210319170906.278238-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319170906.278238-1-ribalda@chromium.org>
References: <20210319170906.278238-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The framework already checks for us if V4L2_CTRL_WHICH_DEF_VAL is
written.

Cc: Mike Isely <isely@pobox.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index 9657c1883311..c04ab7258d64 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -640,10 +640,6 @@ static int pvr2_s_ext_ctrls(struct file *file, void *priv,
 	unsigned int idx;
 	int ret;
 
-	/* Default value cannot be changed */
-	if (ctls->which == V4L2_CTRL_WHICH_DEF_VAL)
-		return -EINVAL;
-
 	ret = 0;
 	for (idx = 0; idx < ctls->count; idx++) {
 		ctrl = ctls->controls + idx;
-- 
2.31.0.rc2.261.g7f71774620-goog

