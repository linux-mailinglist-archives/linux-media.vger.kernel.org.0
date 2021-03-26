Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA4134A512
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 10:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhCZJ66 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbhCZJ6v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:58:51 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C6AC0613B3
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:50 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id l4so7466160ejc.10
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eGEbDdnxvr1xLVANMZdtzFwCYrSlkB/OUQV9O+h/O7Y=;
        b=WoGkUMRB+hZG5srLy5V1gTYT/x61xXlx/NBXfD/s9wOaoxjeD2Pe0PAuAqdL0gM5Rt
         rNja5S0G0sNG/8laO/dBbneKzk5vMMld6oocd+sT3sc0LVa8w7dQkio3bUL8B50vjewJ
         7RcEVUg50rTqKnokvW2InkdJ8ze2zpv1lzgT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eGEbDdnxvr1xLVANMZdtzFwCYrSlkB/OUQV9O+h/O7Y=;
        b=rwH4qaeK5a3a4q2CKF9Zjn4BZwq2OF/tH89Z4fJgXZDqx86lB2sEThmugjOJc0TOsp
         sVH9hgKQEPD62PO6qs7W/UaUSCvZQNCtv+D22XwRZD6ajzwjBk5I9XFjL1CGBt03VxI6
         ZlLGjBUNptClVD2elIkR5bc7kDnkNl4cVNUjWaVMIeY7djQdeIRVR35wgyz49juudHss
         zM+bpk/ztjuBG+C+Q2WgUCNDs094I8SVwdpeVtH5KIyPJogLaWyjXvkT8wunMkedb2U6
         y+sw6lXtAGVWuo1RT2PEmJqcnWgfiqUc+CH//4WBa6KOz2sCO06++2RyRha8eNf60iNi
         QlKw==
X-Gm-Message-State: AOAM532cmN/P9sIjKqg2aTTZFEGNOa3/wU6qBz2UQx++vezYge+v9jfP
        ToDaiK2ZmEwdK3M/Oz+5pNFQnzm21ggA2l9j
X-Google-Smtp-Source: ABdhPJzrYuEt7Xf+jITuCY5D2PraUBAdDMsrNkQ/v19ECHnYWGoQgGJPu1Fw7t1rzLRatuaoKRQCVQ==
X-Received: by 2002:a17:906:3751:: with SMTP id e17mr14457691ejc.553.1616752729365;
        Fri, 26 Mar 2021 02:58:49 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h13sm4036658edz.71.2021.03.26.02.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:58:49 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v9 07/22] media: uvcvideo: Return -EIO for control errors
Date:   Fri, 26 Mar 2021 10:58:25 +0100
Message-Id: <20210326095840.364424-8-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210326095840.364424-1-ribalda@chromium.org>
References: <20210326095840.364424-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The device is doing something unspected with the control. Either because
the protocol is not properly implemented or there has been a HW error.

Fixes v4l2-compliance:

Control ioctls (Input 0):
                fail: v4l2-test-controls.cpp(448): s_ctrl returned an error (22)
        test VIDIOC_G/S_CTRL: FAIL
                fail: v4l2-test-controls.cpp(698): s_ext_ctrls returned an error (22)
        test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index f2f565281e63..25fd8aa23529 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -112,6 +112,11 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	case 5: /* Invalid unit */
 	case 6: /* Invalid control */
 	case 7: /* Invalid Request */
+		/*
+		 * The firmware has not properly implemented
+		 * the control or there has been a HW error.
+		 */
+		return -EIO;
 	case 8: /* Invalid value within range */
 		return -EINVAL;
 	default: /* reserved or unknown */
-- 
2.31.0.291.g576ba9dcdaf-goog

