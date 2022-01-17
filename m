Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9EB8491043
	for <lists+linux-media@lfdr.de>; Mon, 17 Jan 2022 19:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242594AbiAQS1J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jan 2022 13:27:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242549AbiAQS1F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jan 2022 13:27:05 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47833C061574
        for <linux-media@vger.kernel.org>; Mon, 17 Jan 2022 10:27:05 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id k15so69067768edk.13
        for <linux-media@vger.kernel.org>; Mon, 17 Jan 2022 10:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RBVuDCA6PxzAB8/6X14DD9e2DOq4VKxggXT7kBuz94I=;
        b=gXoyLaUc9QSPqYBy++Rm9nffYp7MQ+aG93TwTnQXgWNVvR5bnNpAiQ6V2eyEgsG3h8
         GzUMl1mAHixJqPxrmf6awkMrxdhbK5Ep0mluJXR12HMH5y+yC65RZgdxdeFn3fr/dPhm
         7UYdvoJLa9+bb1iAIMr6CDvwwlqZOBPPCWm8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RBVuDCA6PxzAB8/6X14DD9e2DOq4VKxggXT7kBuz94I=;
        b=T2mp0+958CwYmO4puFoR1702CXmLF1Afuo5uSJLv4QoIfzUM4K2/63SH/GJfIwuNKc
         799hlzPqpEkVTYN2xtEb1ZRRkQ8vJtyZui/x7WyfJYIPWZPK8J2hy1tL3vEoBs3Qmkfa
         hBlCLO9eDftweuJp92Xe2p7em6AAEItmIjoV6GzWjw5NxLafi8niJP1mWBd5bKysV//s
         PgaDtJIEMHEglkInMJobZJW0XEjtdQEQ8Pm8YNNV8YEP46osJUP6yRtdEiMTX/BbjCiK
         m0yxyKgQ0WnYEfsQa1D9A1i0Ao/H6YU37epibp6Bas3jlXZXrEUjWBV0D0IO2pMtu1ZG
         Y6JQ==
X-Gm-Message-State: AOAM531BpBnjWUHil/DFlXG67RBPaxlp2rcwWB08O+urOtzN+3wXqL5T
        BK1bXCxDi9pYumshh9Gouc+yDg==
X-Google-Smtp-Source: ABdhPJxeScoNGqmuzJThlqjZB8RrFK16Y1iV+pilzVolfnayqinWPv1BRPufi97+Y9EfeJ9NnE9ojQ==
X-Received: by 2002:a17:907:1007:: with SMTP id ox7mr15959810ejb.533.1642444023909;
        Mon, 17 Jan 2022 10:27:03 -0800 (PST)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id la10sm4657462ejc.22.2022.01.17.10.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 10:27:03 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 3/3] media: uvcvideo: Add a unique suffix to camera names
Date:   Mon, 17 Jan 2022 19:26:58 +0100
Message-Id: <20220117182658.468993-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220117182658.468993-1-ribalda@chromium.org>
References: <20220117182658.468993-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some cameras have multiple data inputs (i.e. IR sensor and RGB sensor),
append a unique number to the device name.

Fixes v4l2-compliance:
    Media Controller ioctls:
         fail: v4l2-test-media.cpp(205): v2_entity_names_set.find(key) != v2_entity_names_set.end()
       test MEDIA_IOC_G_TOPOLOGY: FAIL
         fail: v4l2-test-media.cpp(394): num_data_links != num_links
       test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 5f394d4efc21..b17569fc4264 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2232,7 +2232,8 @@ int uvc_register_video_device(struct uvc_device *dev,
 		break;
 	}
 
-	strscpy(vdev->name, dev->name, sizeof(vdev->name));
+	snprintf(vdev->name, sizeof(vdev->name), "%s %u", dev->name,
+		 stream->header.bTerminalLink);
 
 	/*
 	 * Set the driver data before calling video_register_device, otherwise
-- 
2.34.1.703.g22d0c6ccf7-goog

