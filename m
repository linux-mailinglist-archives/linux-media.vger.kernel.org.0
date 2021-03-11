Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE118338021
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 23:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbhCKWUA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 17:20:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhCKWT4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 17:19:56 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A916C061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 14:19:56 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id p8so49444557ejb.10
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 14:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=10MlvnXrSl2evQH/VtUcd9w3QNfmLZ9OCqGKMYnt5M4=;
        b=RJDNlG3GzE2aljBqBJeS+Z1Lrs8Jcw72AMQ9eXgOBpQo677bmIpOi8n9IJBLxdtTDo
         IQn5U8a+dzFSVqhYc9t0jtlSlMe/J7wOTFsuGoMUPQoYtgdP3jR3UaqGe4BRredSeo/o
         T9OacY5nQN9+5HFaV9Jp7Nen5lLCY7V6k5yGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=10MlvnXrSl2evQH/VtUcd9w3QNfmLZ9OCqGKMYnt5M4=;
        b=Oe2GsrQXSIewfHl9ZEWo+Xjxj+bccT3o+FI/WhxEIbaJ87mK3qdI4L4YCQi5C/r1bH
         HI4zRIjMTyIomxFxpvLD8jyEeXnIvrlxfl25/ihGkmjdChFgPXdVhxsvrwSUNr67PiY/
         CsaTTH5ik5baJ4mlu0+aEWApmk84sEX0ZtfJ014l0SjCwB9BT1+4HXIm1DN1gk7yxLv+
         JjSEFhNrl9vbsEKnJgtklyvRd4LrglkvbC4n7X1XMKr1vAbeIYFpfwJI9tFQjme8lsR3
         DR737EKmx/72+FrP2+WBxy8pAEGlAS/Fuj2PRzUQ77zbxs26pbRfmOT/36A/l0ifXSOM
         e+HA==
X-Gm-Message-State: AOAM532f5K0+CG8AUTp42CZddwLXdOm8syqyvwR8KaSHQwZZgunjLnqe
        1igu4zNW67VSTQWXSWb1B+tyvA==
X-Google-Smtp-Source: ABdhPJzlO3cv/CgU9XyWHNrGFN0G1RTDoTlqyzZAepHdlQQG/vSs+D7JrLmuSczOTfr/dWe8GyOopA==
X-Received: by 2002:a17:906:f88a:: with SMTP id lg10mr5341798ejb.39.1615501195274;
        Thu, 11 Mar 2021 14:19:55 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id b18sm1942174ejb.77.2021.03.11.14.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 14:19:55 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 2/6] media: uvcvideo: Set capability in s_param
Date:   Thu, 11 Mar 2021 23:19:42 +0100
Message-Id: <20210311221946.1319924-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210311221946.1319924-1-ribalda@chromium.org>
References: <20210311221946.1319924-1-ribalda@chromium.org>
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
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 252136cc885c..157310c0ca87 100644
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

