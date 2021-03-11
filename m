Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93A1338028
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 23:21:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbhCKWUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 17:20:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbhCKWT7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 17:19:59 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CB9C061763
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 14:19:58 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id e19so49548161ejt.3
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 14:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NbPbhT2DvRa0HxCcGP6PoWLah825bR8ZY4RDvgqg8WA=;
        b=lJicX7FJ5deqI7OwxIw6ZUlwlyGn5VV8CT6UaWcZwBl33WV1vrOfptR4vh95JdLrsE
         GLZW800IXBu8UpyX5AyG8y6tKd3OZz0fCwsZi+QIOJsLnN93K6hHPSisF3+WwDv60Qk8
         YgE3w0emYzudMUqDIn+LluAyEMQGrM5AjE6sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NbPbhT2DvRa0HxCcGP6PoWLah825bR8ZY4RDvgqg8WA=;
        b=PzHpu1/bUyXiNxj6FCgC/MHxL+Vbc8/K2V8gbTzxbp8iyiPJY6sUyl0sHVtlAIzoZl
         wRlxKU9Qg5QiVRKB5vj7QPlS/FDKQ2fBKjFavGOBkY/Z0M8hzX3KMgTKh3RIT9qF/ySk
         FJxWf6j9HYQxamD3FxyxwS8eVEROGuL1+YVYuEARNH8egOK+CYImtZb/7OZa1RuN9+mU
         l5KQFrWRiqV2bOd37FS4rpDBfe0ps9oBvBZ2TRJr0padfwBJxFCHLN67mBuPwYPxmULF
         waFIinSnzdJmp5J5OZSAbKpLBVuNaw6Dplm/mm6477wMVqEPKaHyKadxLwTOgFS0ndJQ
         HIfQ==
X-Gm-Message-State: AOAM533irGMpK+Hmqd0b08Y+0heFFzGxy8zn14mbEnPjNoyLIiJkRDM9
        jibWZyJB1rWfcXFpJwHNCBgo6Q==
X-Google-Smtp-Source: ABdhPJz5b66NydyOmLZdqz5yFVMU3yKizx+Q6wzTzO5kpoK22o9BnowMprQf8ne1d2TEexE8uudKGg==
X-Received: by 2002:a17:906:18aa:: with SMTP id c10mr5261577ejf.248.1615501197417;
        Thu, 11 Mar 2021 14:19:57 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id b18sm1942174ejb.77.2021.03.11.14.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 14:19:57 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 6/6] media: uvcvideo: Set a different name for the metadata entity
Date:   Thu, 11 Mar 2021 23:19:46 +0100
Message-Id: <20210311221946.1319924-7-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210311221946.1319924-1-ribalda@chromium.org>
References: <20210311221946.1319924-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All the entities must have a unique name.

Fixes v4l2-compliance:
Media Controller ioctls:
                fail: v4l2-test-media.cpp(205): v2_entity_names_set.find(key) != v2_entity_names_set.end()
        test MEDIA_IOC_G_TOPOLOGY: FAIL
                fail: v4l2-test-media.cpp(394): num_data_links != num_links
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 30ef2a3110f7..47efa9a9be99 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2199,7 +2199,10 @@ int uvc_register_video_device(struct uvc_device *dev,
 		break;
 	}
 
-	strscpy(vdev->name, dev->name, sizeof(vdev->name));
+	if (type == V4L2_BUF_TYPE_META_CAPTURE)
+		strscpy(vdev->name, "Metadata Videodev", sizeof(vdev->name));
+	else
+		strscpy(vdev->name, dev->name, sizeof(vdev->name));
 
 	/*
 	 * Set the driver data before calling video_register_device, otherwise
-- 
2.31.0.rc2.261.g7f71774620-goog

