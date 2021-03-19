Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 786843422EA
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 18:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhCSRJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 13:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhCSRJQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 13:09:16 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6ACC06175F
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:15 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id t18so10865228ejc.13
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 10:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x7BfbRkZgKvyDVm8Db9Jrgj8gcrrUGA9hBYKQf9MVsw=;
        b=CB+JuxfaRRRntr21/mb/QSSNUyrRuTUApU6xKFa+njYv6UX5Ozp6gvmjDZNtgxcyLw
         +Kx9ptUTc1zs5ZfcLj3QG29nEvh0UvugYPz2kPIZoQpgIocdJKnMsxHZkVq6EldvWeo7
         LNP2sBuRigENJ9i3y0GohzCCFlCGMoLVm1gwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x7BfbRkZgKvyDVm8Db9Jrgj8gcrrUGA9hBYKQf9MVsw=;
        b=fHIsKSXP3KNX3knnerWl5uqbJ1T1S4o6RLLiDonCT5pVFv2Y75P020EFQFJx9Qv0dQ
         iatTzCiKdn+14mem4WiVjagbkO+KdJv3/RoLlgoi0FZoXLkGWEwhu3MFxH+wb2BDI2/8
         zHBw2y04UKTM7YazCs8VibBvo9Lk8mbLonX51lYjn3YmBzCOQZuNDcL5FC1+liN96JVM
         8kf9eOHq04v0KvBpR1ViQMAB1z4eDDSfJp4GGHEiRR0mMqrT+bdYWI8MmxBmFaWH6NcQ
         wQyBE1B9c9tiKxpWMZTehZuv5pInJbte4PFaoH4ATOgMEB5as35hXb+E3vAyDcpqAhOY
         PLoQ==
X-Gm-Message-State: AOAM531YFr1jrjJfnO8Ws708Z42dS/oQhwgiKUp4r/A6h/nzEDEER9S7
        xgGjTz6oUUmxXlBaB9bKXCvBAzQ6DEdx3pXcu4c=
X-Google-Smtp-Source: ABdhPJzUKZ9CXVC1OqMiAavDsVwTkhwm/glY0g9UfYlgVbeN5FzrGZ6uMUPaPOPDE6JgYJfMldaTTw==
X-Received: by 2002:a17:906:35cf:: with SMTP id p15mr5473617ejb.379.1616173754501;
        Fri, 19 Mar 2021 10:09:14 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id be27sm4506050edb.47.2021.03.19.10.09.13
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
Subject: [PATCH v8 07/19] media: uvcvideo: Return -EIO for control errors
Date:   Fri, 19 Mar 2021 18:08:54 +0100
Message-Id: <20210319170906.278238-8-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319170906.278238-1-ribalda@chromium.org>
References: <20210319170906.278238-1-ribalda@chromium.org>
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

