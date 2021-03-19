Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E4A3422EB
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 18:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhCSRJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 13:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbhCSRJP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 13:09:15 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5463C06174A
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:14 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id h10so11588574edt.13
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u3RrB5yMnIIEoq7jfEuwhsCMgc7+RIV/M4RImdGKBho=;
        b=AWRzBKY/3/+eP8Kjx6xHDUHbGFRl3vOeS1RngRF1sONcUk0MLKC+thk84sGxkP9tV4
         u2KB/wYgLo01ATifLj4Kpl+zaCjIkjBYLk6AdesyD3Uf1DAhpb28841Sfe4wVHYx/qcJ
         yCrcdh+5WRg2tp4F9vH2P8PJAHpORtVBkorc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u3RrB5yMnIIEoq7jfEuwhsCMgc7+RIV/M4RImdGKBho=;
        b=WE4K9+BdQI3h8ZF/YdA4rpjwv5yEwcoW+9FGM09YRK+tssm1vjlyFQVwNS3oURyO3+
         z6KLE507BGFrpJoWeVsMS6lSMYGIQ7wl5wHW0hcDArkPOogPPxTTMDVHXwQIjLOerX/g
         tIXfj0k9lmjIla/NQaZFa0ZgGsetBZnnkPZ3q0GwvGQEWwl7LqUiWTLvteVpZGVH+S7v
         72sY4lEQmWwCDE1oLB+CEBgsoooK8+43MLY0cRiyWw+5zsNzSpmXPRyp/lTrBzR1aFp+
         zYgx7a03Z/oAX3miieJ0bRcAM436XJPKlhyRjXM9j/6s4KGcLP4j/Yy/GCRyNMWEW+jU
         WrgA==
X-Gm-Message-State: AOAM533XMkvVeAzaNkzrghAEjwsVFpj7zJ1GBMqJ9nHWuJG0AG4yfBrf
        M1ezUcmMOqIdYV9oAG5G3BWCrw==
X-Google-Smtp-Source: ABdhPJxJODHkZIzQSUXeS0OOccgP1VAclAEXc/COEDFN5ZyF+a+4FTTRqe9iXcEUubKCZZfjO603pA==
X-Received: by 2002:a05:6402:22f6:: with SMTP id dn22mr10544010edb.214.1616173753540;
        Fri, 19 Mar 2021 10:09:13 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id be27sm4506050edb.47.2021.03.19.10.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:09:13 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v8 06/19] media: uvcvideo: Set capability in s_param
Date:   Fri, 19 Mar 2021 18:08:53 +0100
Message-Id: <20210319170906.278238-7-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319170906.278238-1-ribalda@chromium.org>
References: <20210319170906.278238-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes v4l2-compliance:

Format ioctls (Input 0):
                warn: v4l2-test-formats.cpp(1339): S_PARM is supported but doesn't report V4L2_CAP_TIMEPERFRAME
                fail: v4l2-test-formats.cpp(1241): node->has_frmintervals && !cap->capability

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index ac98869d5a05..1eeeb00280e4 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -472,10 +472,13 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
 	uvc_simplify_fraction(&timeperframe.numerator,
 		&timeperframe.denominator, 8, 333);
 
-	if (parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+	if (parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 		parm->parm.capture.timeperframe = timeperframe;
-	else
+		parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+	} else {
 		parm->parm.output.timeperframe = timeperframe;
+		parm->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	}
 
 	return 0;
 }
-- 
2.31.0.rc2.261.g7f71774620-goog

