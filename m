Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD77434A508
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 10:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhCZJ6y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhCZJ6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:58:47 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1322C0613B1
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:46 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id kt15so7467328ejb.12
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+8ftwX2VrGSkfTVVNvT7pPS6qh2Bu/od5mahErd+MM4=;
        b=kzTUDDX8a25F/i/c+v4G5fzlR44A/rmT2kECv9pBhJHo+lau9PUuofsQ+YlK4ppSnD
         O7kf1K88iSJYxmLPQACECAOQWQRGy5DKOZpShKgscx+Q1JM1Tn26K6mGR83xM9azjk7x
         +M8Ua7lcupbG0pFsxDfaby/8GVBJJmVkJHd3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+8ftwX2VrGSkfTVVNvT7pPS6qh2Bu/od5mahErd+MM4=;
        b=RifQh1rHRzRYHoGycSZQsCWNY5evLT4U8ZBxGAMqrQdJzumsdaoqrZZVo61hCAgEZQ
         iH8DYn7f2vCPJtbm4LHdxZ7kqkxH06Srxy0Yh2HFea0tVgq46Vak79CxNPfoO7kYeGIj
         x9wZAXWWKBjpgJUR3Gm9S37Y3OlHIvcVR3v9BgnXOLfdgVMtC6c+iBWVfS4lriz9dYK1
         4RKYN12EpQPdkZNn4gUDqMo7XtQ9Ip8heWwIVHiSi2CXFc4MoZQwpj/RHZJKAr4VL7Mo
         F2I0ESjt063Q4tMqRSjqbY8DdLgt+CvjzWO+ZnR2kPaAsMrjrTLG1d11vZn3YXPrf8Bk
         RLow==
X-Gm-Message-State: AOAM533CeIidvquXnutrH+47Ap9uuG/jKFMvx69PEiIgYxJzhLmkzJol
        YE1SDB1nrFSu0vP3tv6q/4LZJA==
X-Google-Smtp-Source: ABdhPJxGoKWw7ZjVZ6bZ6RrZ67SACtFy4QrZjH8SN9zyyybEjjVoNoGBNm2hmhTO8wgoPoLa61gvaw==
X-Received: by 2002:a17:907:7699:: with SMTP id jv25mr13834135ejc.363.1616752725723;
        Fri, 26 Mar 2021 02:58:45 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h13sm4036658edz.71.2021.03.26.02.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:58:45 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mike Isely <isely@pobox.com>
Subject: [PATCH v9 02/22] media: pvrusb2: Do not check for V4L2_CTRL_WHICH_DEF_VAL
Date:   Fri, 26 Mar 2021 10:58:20 +0100
Message-Id: <20210326095840.364424-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210326095840.364424-1-ribalda@chromium.org>
References: <20210326095840.364424-1-ribalda@chromium.org>
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
2.31.0.291.g576ba9dcdaf-goog

