Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25378340F18
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 21:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233117AbhCRU3i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 16:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbhCRU3e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 16:29:34 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485A8C06175F
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:34 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id o19so8301547edc.3
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 13:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x7BfbRkZgKvyDVm8Db9Jrgj8gcrrUGA9hBYKQf9MVsw=;
        b=c01hLReSIVeW3bW2pF0twdV7uKbkO9yIoSZykeotv9IbArd6qTSby2bTYfOBc7iw7d
         lc/z1fr7wX738SAntgN3VJNziPeDMuHNM7NAFFBwhboXu0oX0JUVPy7hvTSjt9UBHfW7
         HDwcwiPXunhLox+f9xWH2gNYGj8EOShADx3EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x7BfbRkZgKvyDVm8Db9Jrgj8gcrrUGA9hBYKQf9MVsw=;
        b=lQNc0FDrkOrbQ3FYxnWQMbuvLHKHneOOvVpwephJSbR+mCH4cnUypfj0qn1expH6Mw
         YWfD7gvLg0mK1/AZUmd/6DhLVu5KEPnqM//Ko9E+TJ9Z4NJLBm/4lpGxIWni4wa4hUlm
         eb+RtC9ugkufuS7aAtC3oueedBdudtcJDCcrLaZdV+LkcuFRFmeEdbl8yT7PH17k+Eq6
         r0PCxfzrkOdAtDVF7EDCAo/Vh9Q3zsgoDbjIeXoEvEq8R1CQLiyJsj8nDJtpWW0Oqt+7
         baOR3L1cw0eCQERjnQyeHoFC5KotI4uUzRgpbuk4bqoLmMsT+1aRMGfdPr18SZzxId/C
         qjDw==
X-Gm-Message-State: AOAM533/l6FuXoAo+tGNrKPbNVF2+v506lmwJ3ER2sXBK8qXPZxXlvjo
        1m8GNIU/rwErHiHz8H4EXk9AOg==
X-Google-Smtp-Source: ABdhPJzKx14rWBhWrORQ0Lhu6+qmghidXJd+62nZWtnwEE6MSpVZxen1M7LCSO1xtpQ1vR1xSKE9BA==
X-Received: by 2002:a05:6402:408:: with SMTP id q8mr5732911edv.201.1616099373045;
        Thu, 18 Mar 2021 13:29:33 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id a22sm2533767ejr.89.2021.03.18.13.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 13:29:32 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 05/17] media: uvcvideo: Return -EIO for control errors
Date:   Thu, 18 Mar 2021 21:29:16 +0100
Message-Id: <20210318202928.166955-6-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210318202928.166955-1-ribalda@chromium.org>
References: <20210318202928.166955-1-ribalda@chromium.org>
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
2.31.0.rc2.261.g7f71774620-goog

