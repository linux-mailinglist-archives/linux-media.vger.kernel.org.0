Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9662F33F5DD
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 17:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbhCQQpe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 12:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbhCQQpT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 12:45:19 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0256FC06174A
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 09:45:19 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id p7so3699451eju.6
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 09:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rJ5EJL/W7wsb3M0P1LQ5UiKCaTfkRQ52nO+/XL2VvZw=;
        b=X0W44EYgx8AezDHtB76FgGrfbV62VvK7RauGP6H+Sbzm83YV/cdCEigYPuWiaE/gDs
         bO4dmle5eFCLGlE9uOm3afo5vGgg2uPnKV4D4Jl6BXcgiIqwtlP7gvPq3BrH9nOD4DXS
         FtkmBbPuXmyQi+h5KhJRxr1/oKZE9QvvEPfEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rJ5EJL/W7wsb3M0P1LQ5UiKCaTfkRQ52nO+/XL2VvZw=;
        b=JdNwfAq05nqIrYnVT6vQcZ1fF+LQWjFjm7TH6Q8LrqmELJAF8OczF4jp7E2ffsK5bp
         /gQAxqddFdo17V26mnZjS4Bkrj/cE77teh/SKoCe/SlQoCpO+2wAxomP/e1DN/9b+F4O
         3RLngV0VGP6P6JUykE+Wvq5WjV3cYphMSD1RBcYwruXU8c+17zl1bxYwYk9KAj8oInt9
         QiKYLFv8MlRFdWlIxiI6tWabU7y5ukIOt4fqW1zPzm/PL2m8BtfbL+n+I0nY9A0bSI1y
         5GK1dwSgRnDcVIDEUznpMyJP/ZBtRAEkFPPJdbpY0+Y0opJWqFTxqq27du8RdHSUCpHg
         ZCwQ==
X-Gm-Message-State: AOAM5308s6Z+SNPORa2ZmyTV4dMCMq4aWutB48YL+Yv5v/mR06AjP6Yu
        5NRsnTaelcemcFMteYDkAd5JoA==
X-Google-Smtp-Source: ABdhPJyZ+tTNXA/xjloRyMYiCx7/4ZA3QpEWeFqogKQep3jqdhmADWE4KsJf3ldZ06hT+7u2VB0Zig==
X-Received: by 2002:a17:906:f0c8:: with SMTP id dk8mr36730843ejb.300.1615999517821;
        Wed, 17 Mar 2021 09:45:17 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id hy25sm12088128ejc.119.2021.03.17.09.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 09:45:17 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 06/17] media: uvcvideo: Do not check for V4L2_CTRL_WHICH_DEF_VAL
Date:   Wed, 17 Mar 2021 17:45:00 +0100
Message-Id: <20210317164511.39967-7-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210317164511.39967-1-ribalda@chromium.org>
References: <20210317164511.39967-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The framework already checks for us if V4L2_CTRL_WHICH_DEF_VAL is
written.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 252136cc885c..47b0e3224205 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1089,10 +1089,6 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 	unsigned int i;
 	int ret;
 
-	/* Default value cannot be changed */
-	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL)
-		return -EINVAL;
-
 	ret = uvc_ctrl_begin(chain);
 	if (ret < 0)
 		return ret;
-- 
2.31.0.rc2.261.g7f71774620-goog

