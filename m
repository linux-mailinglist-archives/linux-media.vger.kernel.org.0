Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C25A1340F17
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 21:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233101AbhCRU3h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 16:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233060AbhCRU3d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 16:29:33 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6009C061762
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:32 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id j3so8257931edp.11
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AikJF0GK0ZzYGbwbgBUzJRLCgyMvlKF2iA5mDBYu/f0=;
        b=XcVCC0TXAxCkk11KeRyOn0JTuZrkWx3saposQBwFuI37IjreBjO0c3c0XAd+CTjPZy
         rrdDXGmLXEJ9jI4nnRnZyV2hIBJuo6OnA9DJUFAbJ0nEKUiVDYAi/edLa4sDxhYq3m84
         31D5LSS7JQJCVxUj4ZdQmGmV/0w4uIg6hU8kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AikJF0GK0ZzYGbwbgBUzJRLCgyMvlKF2iA5mDBYu/f0=;
        b=FeQ/czAi6T3QGGh74oxSWMtfpUdRLZEcZGb36pFTL7vtOF69daJeU+k1EcufHMkl23
         ukxHZwyoTkUbD2/aktFfVOieNW0JxhcoYvPsdUbgckaMSvgZDjwyW6HQIkmlwiAI3ojq
         dNDfIfY3Cy+y6KqYMF14CSavkbzL9rYIhBdjoEIaht6DZIduKP5g489oXHHJ+0B10tRu
         BB1B2rVz+AAJS62Q5ES2RYBgHz4Tk/qui9Cmzbg9z2S5rfqIusQHfncNsFvyyX4MyfNK
         9njPe8GK09ZyglBn+yy8gfItUpPYbQzU7gS1Ds+o8YqNUOJxZNwlxcuh7Dc67Qn8wmBB
         hjqw==
X-Gm-Message-State: AOAM533EQmtCiJ/RQ9SoBWCehCe27bxdVpseAEr5ulaTGnHC5j9B1xNB
        AStVHd+qLZ3aKbwFwwV89Bb22X93iK6ZgIqHnOw=
X-Google-Smtp-Source: ABdhPJxSIKO79tNgAyT2wCTOgsn0sojgboyhcLTbGU7vAu3hYR4pDYNo1ABRvmqHBhwiD/mWxs1Nlg==
X-Received: by 2002:a05:6402:3096:: with SMTP id de22mr5882368edb.141.1616099371445;
        Thu, 18 Mar 2021 13:29:31 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a22sm2533767ejr.89.2021.03.18.13.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 13:29:31 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mike Isely <isely@pobox.com>
Subject: [PATCH v7 02/17] media: pvrusb2: Do not check for V4L2_CTRL_WHICH_DEF_VAL
Date:   Thu, 18 Mar 2021 21:29:13 +0100
Message-Id: <20210318202928.166955-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210318202928.166955-1-ribalda@chromium.org>
References: <20210318202928.166955-1-ribalda@chromium.org>
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

