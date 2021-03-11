Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B67C337259
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 13:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233113AbhCKMVA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 07:21:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233122AbhCKMUq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 07:20:46 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E158C061762
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:46 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id z1so2431727edb.8
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Adt3VWd7Tr97xOkIDn3xdQPcPlfaPE3dZS8MA+RZVj8=;
        b=WHeLI+EZeWdnBLfu9US6qMqfpgSdFYoKlGy7DNd/hBlMkazrM0ZkVkMJhtB+Y9wBYy
         Cqx71vWATisDUPo/reydXXFvZv+wNnevjhLUNtQg/IIamfzNes1MWNg2+3cszxTOsvkC
         GyFIt+FhwbJdSYNve/ANvnB9WkuUwSysPVZso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Adt3VWd7Tr97xOkIDn3xdQPcPlfaPE3dZS8MA+RZVj8=;
        b=O7cC4VU7mjjyX7umz9sB+qKFgHidhlTNxgAxL+7D5o9ESWyTiXKnVvZmrrQ3QjvFFw
         BgJ/JmrJLtqsLc5ijTxa78fa0ycuvnHp8zAnXARhGXu+w80NRuIjukCqC4Rr0EDZvD6R
         AU5jUDNFeb1wckaRXBM8VyK0+s0oz6RyQ+Al+xWJD5UQjZnIJ3NAHNOqxxVBzhbgE8iH
         irmSiuiaUNrFoab8PxOEb8ja2QvKbuTpgaCpoJAoLa+kNrFtrJDi3haRPJZ6nT9pGDrI
         mrSZ0AjRgZH0a0LjtGgJJ5Pu1iqIjihbkrgSOBqs64ja7bLm2KznXF0JMK3GEfXHSGXq
         cRMg==
X-Gm-Message-State: AOAM530LsnpQZ8L8VjOUefmHZ2PVwPEfQ7C3YGbZUhZuJi+GHYMDujIZ
        GMJd1yoU8D/ESetZZTGakgi3YA==
X-Google-Smtp-Source: ABdhPJwVmOkiZxLlFupp7sYHhXVU2F6SyyyL32qCCJVGSA2zlgH1LGnqJkv7e63m6qGH3s0tbxeYjQ==
X-Received: by 2002:aa7:c0c7:: with SMTP id j7mr8195805edp.298.1615465244891;
        Thu, 11 Mar 2021 04:20:44 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id u13sm1264126ejy.31.2021.03.11.04.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 04:20:44 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 03/10] media: uvcvideo: Return -EIO for control errors
Date:   Thu, 11 Mar 2021 13:20:33 +0100
Message-Id: <20210311122040.1264410-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210311122040.1264410-1-ribalda@chromium.org>
References: <20210311122040.1264410-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes v4l2-compliance:

Control ioctls (Input 0):
                fail: v4l2-test-controls.cpp(448): s_ctrl returned an error (22)
        test VIDIOC_G/S_CTRL: FAIL
                fail: v4l2-test-controls.cpp(698): s_ext_ctrls returned an error (22)
        test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index f2f565281e63..5442e9be1c55 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -113,7 +113,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	case 6: /* Invalid control */
 	case 7: /* Invalid Request */
 	case 8: /* Invalid value within range */
-		return -EINVAL;
+		return -EIO;
 	default: /* reserved or unknown */
 		break;
 	}
-- 
2.31.0.rc2.261.g7f71774620-goog

