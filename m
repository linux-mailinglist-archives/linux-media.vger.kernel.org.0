Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7F33ACAD5
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 14:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234319AbhFRMbp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 08:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234177AbhFRMbk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 08:31:40 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71DDEC061574
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:29 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id ji1so9528515ejc.4
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CKHvbeccdIgpTJN874Zu3qrMK8h3ELkx1EvQFSAq92c=;
        b=hbPMdBb0Q6VZnDWOi94RSh94QNJ7hnriNFwJ42gOSwilyaQCnDciWyladtWg8r8vjT
         WhA8B6Qb48T4J1Z1z49L9LlLBJ6k9jNa244VPvOM3ky6qU6DZ7nQPpdP7i/4tOahWXnp
         eN4J9GQI/3fu0SXtM/yV9RjL9RVVoL8mxbuXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CKHvbeccdIgpTJN874Zu3qrMK8h3ELkx1EvQFSAq92c=;
        b=aQcc5LRl8Ba+8VG+73cytlxjGI260G8JxVfTnjxZIqRZBy+P7bp1F63yY/UwicLnXM
         PPIgb3whvn++He4F1cnbyFp2iN7zGk38fKMgmF7ZYqr8DB+clo0q8wHiTKZJevNFg9NU
         tzVge1cYGjgzaZViFjXPOeuwCcOAHtFWjksqmAMWncDEARXPdSY/vLkPVZUHtIYj91U+
         YGPwK4Aag2x7CDO9pBZzTD527G5Xdf2q4UTY9uUq4dGGrgEotQHHnE6yEBiIt0s3AVE6
         ITK5b10TOPNosR6P35X85ls5D0VrSoHWPdppAEso1mZkIma55SyZFYAEAMB+bvAUQSmk
         olnA==
X-Gm-Message-State: AOAM530zxvPzq9Xl46gGfhvZ4nzpKpmHrQnNiMjovonab807EW0n8bOx
        J8QCjRCmLrqa35WSuTru+9P3SA==
X-Google-Smtp-Source: ABdhPJwc0A+bqSL+oqUVbT27nJXt6cK8uSpQ1BE8TJT6mkCP6zwwS+WBcprrjLiMdGEGOi4DB47uRQ==
X-Received: by 2002:a17:906:dbc4:: with SMTP id yc4mr10973530ejb.119.1624019368119;
        Fri, 18 Jun 2021 05:29:28 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o26sm4336403edt.62.2021.06.18.05.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 05:29:27 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v10 03/21] media: uvcvideo: Do not check for V4L2_CTRL_WHICH_DEF_VAL
Date:   Fri, 18 Jun 2021 14:29:05 +0200
Message-Id: <20210618122923.385938-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618122923.385938-1-ribalda@chromium.org>
References: <20210618122923.385938-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The framework already checks for us if V4L2_CTRL_WHICH_DEF_VAL is
written.

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
2.32.0.288.g62a8d224e6-goog

