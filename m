Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4544CB1AE
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 23:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242341AbiCBWEH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 17:04:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242067AbiCBWEE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 17:04:04 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C38C9920
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 14:03:20 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id p9so4870881wra.12
        for <linux-media@vger.kernel.org>; Wed, 02 Mar 2022 14:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7+FTeVrGz7SDdPY4UPOaMR4mAYUB8c53cmn+nXuAyMQ=;
        b=XUyuvemJYa0uAPOj7k1G9IzitT9VXfDcKWXDcEhdYDSJCfn/HU7OkbxGM5iO6MemUb
         lV3mCqItMcPQB0EK6wYMqh7ToMdUlCmyNIhbOWG1fJ/aru63wO0k/xKZwjJS2/QDq4dk
         RopjcHiTUEMSXcJhj/x9l16gFI7wpJ7hI/zdL++voTzJR3Gy18mSFaXypTqxOcByPaao
         XzD4+mib6HCoy6psPvbeTt4gr8KJ6sMpsmMSN8i5ccTPLm3R6h6K/iHrT3v03XaaSJKo
         e20Gjg7+bHyOjUWXiSB0dF5XWNH0ftXbJ1PdvkypVpJCMhg5aAM6efH1HSus13BfdXOV
         PuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7+FTeVrGz7SDdPY4UPOaMR4mAYUB8c53cmn+nXuAyMQ=;
        b=ohqqvJ+E84j/6dmN+lZyPhXMETRetmYiV6UW8LO/Z/yLRttV8ESYaAMGlN8KCGgKBf
         HKWtNp/lVlfgMkFG6V8uYbhI5SBeX55uK2QO9+lGl4y6GSIx8LnqwkgTBaL4uZicj4YR
         7FEs8hHRcDE2KCokuK5XpflWS/fgYPpUxOzjMvrogOm8UcY9K+ygeJqU3cGOFqocBPpS
         fxMlZrdz1gXuF8jvcvX1WRxNenJ63gfZfY3x5v5C4MOMRx72u1MWuhNsUJ19+89UM2LB
         x51QZ4wX6skLRMYu3zACXeYCFy6N/hswCdYt9Ks/WBRh9YVn0cYfo1vNqiXHZZA7XYvZ
         kKCg==
X-Gm-Message-State: AOAM530e7dsDk6RVpgbtZA4nEHULaOHg+eJXTIbyARUbLfazBEUUejjV
        aqX9ChS43ZaAu+Xd1UO4VHxYhqkGi1/mWw==
X-Google-Smtp-Source: ABdhPJz1z6DPBD7bhcCCeO9fFebsmUH9yJLSFoHKDSYe79QR+HkAQD7iFfp63LfGerWLD27PjJv+Hg==
X-Received: by 2002:a5d:4310:0:b0:1ef:fb60:e1d8 with SMTP id h16-20020a5d4310000000b001effb60e1d8mr9095465wrq.92.1646258598715;
        Wed, 02 Mar 2022 14:03:18 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c4f1000b0033383cdeea1sm229258wmq.10.2022.03.02.14.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 14:03:18 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH v3 5/5] media: v4l2-async: Create links during v4l2_async_match_notify()
Date:   Wed,  2 Mar 2022 22:03:04 +0000
Message-Id: <20220302220304.1327896-6-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302220304.1327896-1-djrscally@gmail.com>
References: <20220302220304.1327896-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Upon an async fwnode match, there's some typical behaviour that the
notifier and matching subdev will want to do. For example, a notifier
representing a sensor matching to an async subdev representing its
VCM will want to create an ancillary link to expose that relationship
to userspace.

To avoid lots of code in individual drivers, try to build these links
within v4l2 core.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---

Changes since v2:

	- Stopped checking the notifier entity's function when creating the new
	links, and just create them whenever the subdev entity's function is either
	a lens controller or a flash. (Sakari)

Changes since v1:

	- Added #ifdef guards for CONFIG_MEDIA_CONTROLLER
	- Some spelling and nomenclature cleanup (Laurent)

Changes since the rfc:

	- None

 drivers/media/v4l2-core/v4l2-async.c | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 0404267f1ae4..436bd6900fd8 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -275,6 +275,24 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
 static int
 v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
 
+static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
+					     struct v4l2_subdev *sd)
+{
+	struct media_link *link = NULL;
+
+#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
+
+	if (sd->entity.function != MEDIA_ENT_F_LENS &&
+	    sd->entity.function != MEDIA_ENT_F_FLASH)
+		return 0;
+
+	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
+
+#endif
+
+	return IS_ERR(link) ? PTR_ERR(link) : 0;
+}
+
 static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 				   struct v4l2_device *v4l2_dev,
 				   struct v4l2_subdev *sd,
@@ -293,6 +311,19 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 		return ret;
 	}
 
+	/*
+	 * Depending of the function of the entities involved, we may want to
+	 * create links between them (for example between a sensor and its lens
+	 * or between a sensor's source pad and the connected device's sink
+	 * pad).
+	 */
+	ret = v4l2_async_create_ancillary_links(notifier, sd);
+	if (ret) {
+		v4l2_async_nf_call_unbind(notifier, sd, asd);
+		v4l2_device_unregister_subdev(sd);
+		return ret;
+	}
+
 	/* Remove from the waiting list */
 	list_del(&asd->list);
 	sd->asd = asd;
-- 
2.25.1

