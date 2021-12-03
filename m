Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44654675CC
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 11:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380239AbhLCLB0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 06:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380234AbhLCLBY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 06:01:24 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD418C06174A
        for <linux-media@vger.kernel.org>; Fri,  3 Dec 2021 02:58:00 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id e3so9923947edu.4
        for <linux-media@vger.kernel.org>; Fri, 03 Dec 2021 02:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dL9Doftx7SsrphxuZsOqQd7wOm1YbbJk8+5XQsZLlm0=;
        b=eN8F4WnbbKtSgAFI7LGmb78vOkq7F4X85cb6co9pialUAR0d6/bogCs6k9V1C00cCb
         VcjZ+BMUBwZuy8ga0DF0XShJKY60R6h5kMhE/yokynDDT2vYa+xs1DjOit10zciPrGsB
         ZslnfT/WjLXG04OJ4jdMbSS3l6OyhXLIhaGDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dL9Doftx7SsrphxuZsOqQd7wOm1YbbJk8+5XQsZLlm0=;
        b=LQQdarpYE79Ofz6GC6i2FOI1w2CXahBMHK2bqlAse6WRg6I3l8qXCQvV9G8P1uERkI
         9EpojcuGFuWQSO2HFOR5rGtJiHJVpCyQCuFQzxFM/JGNc1nhxiM5tmfMZ+IMjsxTfiqS
         eFBSlVuALy7AdUEs843o0Dq8wH65Q3JO+6CzeEu/nB3wDUZj4fYsq2t0mx2FD87CCmFA
         GTIgMySxAfPoWldB/OCCOAn20ifR67zm3meQJtni/71TGbvcpBAmiYefwxOulfx4P90w
         qV0a+gxcRcVHRtHdx+eeqZ9uk6L76NcGT4UyWF5o6GhNtekIFz9Pq7htEhbJGx0458Gq
         XO5g==
X-Gm-Message-State: AOAM532o42P5WWf2XEL1nk897mD9CaUoNB1bk8QpO424RXMqc6ipNAKe
        0n0PTGxkQufysz3L0arJc10nJQ==
X-Google-Smtp-Source: ABdhPJyqC23S2y/KFhAVAGoa8zFNPaGUHEiQ0LFXx450o6VcXoNIld07YR+hpDXDIig7z/GjDAcg2Q==
X-Received: by 2002:a17:907:86a6:: with SMTP id qa38mr21673773ejc.286.1638529079375;
        Fri, 03 Dec 2021 02:57:59 -0800 (PST)
Received: from alco.corp.google.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id ar2sm1699775ejc.20.2021.12.03.02.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 02:57:59 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] media: uvcvideo: Fix handling on Bitmask controls
Date:   Fri,  3 Dec 2021 11:57:40 +0100
Message-Id: <20211203105740.1084689-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Minimum and step values for V4L2_CTRL_TYPE_BITMASK controls should be 0.
There is no need to query the camera firmware about this and maybe get
invalid results.

Fixes v4l2-compliane:
Control ioctls (Input 0):
                fail: v4l2-test-controls.cpp(97): minimum must be 0 for a bitmask control
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b4f6edf968bc..d478cfbad5bb 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1156,7 +1156,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		break;
 	}
 
-	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
+	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN &&
+	    mapping->v4l2_type != V4L2_CTRL_TYPE_BITMASK)
 		v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
 				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
 
@@ -1164,7 +1165,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		v4l2_ctrl->maximum = mapping->get(mapping, UVC_GET_MAX,
 				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
 
-	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
+	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES &&
+	    mapping->v4l2_type != V4L2_CTRL_TYPE_BITMASK)
 		v4l2_ctrl->step = mapping->get(mapping, UVC_GET_RES,
 				  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
 
-- 
2.34.1.400.ga245620fadb-goog

