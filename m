Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7869E3ACADB
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 14:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234354AbhFRMbu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 08:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234310AbhFRMbm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 08:31:42 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22DCC0617AF
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:31 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id he7so15590128ejc.13
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 05:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVN2GH1uJUt11BT86iOdoVap8FgpXufLIoLmMZsImGM=;
        b=OlFvdWVZy9J++4Uv/66i9nGMZ+mlU4jMEiKNofDnE11qudCf00XuTLntMLxna1pP9w
         lYiZfEJYjNEvmsOOz+x647B/szA84R+8GEphng3SIUC0Ok0bWKaH4TvldyrLYf5CeQYh
         PylNbeJIOPaXG7cyQ69P7zhjb0vuyQC5Hfif8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVN2GH1uJUt11BT86iOdoVap8FgpXufLIoLmMZsImGM=;
        b=hoIlbCYykL+iAM1yqbWtv35WMObl/86XZRdwWI+Mc327b0Sm3rFValrgKnyn6ikh7u
         m9vQmFNCoG8ljYUzsuUyTJWiAmQP64WWoAtgx1uLqdRHxKY2Kdg5mO6uqGi+1GJx/5Kd
         z4o2qxpB+vHmIE+YEjwK/iQK3x64Z1etK7+m6eITRHh6ScAakvpJyUassgjmcNVpcidx
         aa+05VClWeBdE3EosOBC4VIbmxEaa40486W8ekfuP78d55kMsAQ4B+XwoI1CFh5uzoU9
         aso2RGHQJ2jf2cAfUxYWosffqoUZPMYLKhKUnNx5SkK9m6scWl7CHZ4MTVKPOfJJZfiI
         ztnA==
X-Gm-Message-State: AOAM530iky8gRU17BS2aWoVNICdapd188YR52xavb4VIX7HTXTars5KF
        7wNBRjOlxufk4ytwIViwT1pI1A==
X-Google-Smtp-Source: ABdhPJxP/vpTcS5nNlKGwpaEELS0h6vxsERbQ7/UT7a9M1SOPqOGOYL5EQ9J0EDNM7nFzi8gCss3vg==
X-Received: by 2002:a17:906:1848:: with SMTP id w8mr10701160eje.277.1624019370427;
        Fri, 18 Jun 2021 05:29:30 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o26sm4336403edt.62.2021.06.18.05.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 05:29:30 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v10 07/21] media: uvcvideo: Return -EIO for control errors
Date:   Fri, 18 Jun 2021 14:29:09 +0200
Message-Id: <20210618122923.385938-8-ribalda@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618122923.385938-1-ribalda@chromium.org>
References: <20210618122923.385938-1-ribalda@chromium.org>
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
index a777b389a66e..daba5fe352ea 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -115,6 +115,11 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
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
2.32.0.288.g62a8d224e6-goog

