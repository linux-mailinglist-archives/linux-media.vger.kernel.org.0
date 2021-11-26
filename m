Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5092945E3A6
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 01:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351768AbhKZAVj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 19:21:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351860AbhKZATj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 19:19:39 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BB1C061757
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 16:16:21 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id p27-20020a05600c1d9b00b0033bf8532855so5698087wms.3
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 16:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iFC0g7sHT2Cln7UNIyKY10hlNRb0uj3DbZGbBRfYld4=;
        b=jXflj76qY0SSY7oaxnvYd6crN/7i764AF2iW+UNOOtnxptmlLMyTIjuh6x/uFWuuPQ
         PSyX9XIf4hRPVYfrI3ZIj8/4p4fgTEFGzupRSe3V9MGsndnlkLD57/V22xon8U/WqB7u
         JteuZcO0AKuFksT6eGp8bAew7sL2CyLCTW5S7XKW9dQKjxxxt11ecivibJr0MvRyZVQk
         FYymY52eRwwvnFmqqjdDW6yncW4r4LXsuTSSdztXjdLzFVDyFFO7hRm2UlYLerEmy74u
         Ot9vZuR8UMeABevbdAPZw2jiBxcGeF+EVoqU66JGHs9EjIa9z0GMxBXNxRSH5aDn8ve0
         fmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iFC0g7sHT2Cln7UNIyKY10hlNRb0uj3DbZGbBRfYld4=;
        b=ux6d4T9jj8DaEh+vEovnLSW0Wl+UeAa66KNEqjhfQeGRsvCFh86aIlqtulvTtMv8Tr
         +FZkMu8sXMUSh+YvHTnz4nLXxUTW+RHKhkRFNJLSoRHTZdLFcjWC833e+/7IpdSEKl8O
         PlX6PY4SXFLBXeR33kIuNQFaOPQX86UKnFJt7UTnjEkVn7K/D/DrABqcsVstJxzMNdv1
         lWd7ab0xz64AVVk4NSSzM/919b4+MzmA1sMKHuHAKV01WKP0+SY0zrql6vjG58saDS/2
         t+HHq6xqHGlfoFVxMdjtZFeM4+WAdX9KGzZlQIuqUbI6TBl7ym26o6EPzIBX1pTAdKzu
         rEHw==
X-Gm-Message-State: AOAM532+O5XjdiCjGev3PxMmC7rzzLx4TIizrAkmnskIR1dNg6ZAq+IK
        iM5Bqa7HAsvALWf4SNoDyq2AzlNAOsI=
X-Google-Smtp-Source: ABdhPJxCG8FHmkAPNIEtPSViR1Py5jI8aSCEiHyqEb0euvXs1BfYKmHRjvVuEoJHLuQVv5Co8TfgIA==
X-Received: by 2002:a05:600c:214f:: with SMTP id v15mr11688716wml.194.1637885780242;
        Thu, 25 Nov 2021 16:16:20 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id p14sm8693728wms.29.2021.11.25.16.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 16:16:19 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com
Subject: [RFC PATCH 2/2] media: v4l2-async: Create links during v4l2_async_match_notify()
Date:   Fri, 26 Nov 2021 00:16:03 +0000
Message-Id: <20211126001603.41148-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126001603.41148-1-djrscally@gmail.com>
References: <20211126001603.41148-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is probably more complex than it needs to be at present, but the intent
would be to expand it with __v4l2_async_create_data_link() to be called where
the notifier entity's function was MEDIA_ENT_F_VID_IF_BRIDGE for example.

 drivers/media/v4l2-core/v4l2-async.c | 51 ++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 0404267f1ae4..6575b1cbe95f 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -275,6 +275,45 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
 static int
 v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
 
+static int
+__v4l2_async_create_ancillary_link(struct v4l2_async_notifier *notifier,
+				   struct v4l2_subdev *sd)
+{
+	struct media_link *link;
+
+	if (sd->entity.function != MEDIA_ENT_F_LENS &&
+	    sd->entity.function != MEDIA_ENT_F_FLASH)
+		return -EINVAL;
+
+	link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity,
+					   MEDIA_LNK_FL_ENABLED |
+					   MEDIA_LNK_FL_IMMUTABLE);
+
+	return IS_ERR(link) ? PTR_ERR(link) : 0;
+}
+
+/*
+ * Setup links on behalf of the notifier and subdev, where it's obvious what
+ * should be done. At the moment, we only support cases where the notifier
+ * is a sensor and the subdev is a lens.
+ *
+ * TODO: Setup pad links if the notifier's function is MEDIA_ENT_F_VID_IF_BRIDGE
+ * and the subdev's is MEDIA_ENT_F_CAM_SENSOR
+ */
+static int v4l2_async_try_create_links(struct v4l2_async_notifier *notifier,
+				       struct v4l2_subdev *sd)
+{
+	if (!notifier->sd)
+		return 0;
+
+	switch (notifier->sd->entity.function) {
+	case MEDIA_ENT_F_CAM_SENSOR:
+		return __v4l2_async_create_ancillary_link(notifier, sd);
+	default:
+		return 0;
+	}
+}
+
 static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 				   struct v4l2_device *v4l2_dev,
 				   struct v4l2_subdev *sd,
@@ -293,6 +332,18 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 		return ret;
 	}
 
+	/*
+	 * Depending of the function of the entities involved, we may want to
+	 * create links between them (for example between a sensor and its lens
+	 * or between a sensor's source pad and the connected device's sink
+	 * pad)
+	 */
+	ret = v4l2_async_try_create_links(notifier, sd);
+	if (ret) {
+		v4l2_device_unregister_subdev(sd);
+		return ret;
+	}
+
 	/* Remove from the waiting list */
 	list_del(&asd->list);
 	sd->asd = asd;
-- 
2.25.1

