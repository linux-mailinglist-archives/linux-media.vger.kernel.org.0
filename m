Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1FC147387C
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 00:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244202AbhLMX3O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 18:29:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244195AbhLMX3L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 18:29:11 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DD1C06173F
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:29:10 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id u1so29550126wru.13
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zPcgwKf+mxuvjKfph3hk9rnBdcEBzs1sgAB4FsNazWI=;
        b=aOtZvsZuASZ8nN15qXvrkYoGXMz++nvFlabc3Tqvs1q/Qe00IAACWvhcef4XiKdZ4x
         MMgyPxuyiB0bhlIGGFx12I3CjVJMzDOc1VFOtfm0xiHBF7h3xhU8zt5rlBDhOxdYM+QM
         6d0aU/DDa97+9TY9yLQCqBm8cVc/Xxu5+Q8aH1VFU+LwIMPULOyPhw/y1URN6jQMc5p+
         Bxxx2VV/Fe0rRfSuIRO5iqv8uq5J082aU5RbK1USCXe86qsWWA1kLU9fymvG/enIoOZe
         ojk13skpn/WGCVs1wi5dTbRbVQv+mQIRjf4skzJe9CXBa5yKAeXXPbjcRzhweePZ2g8x
         FRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zPcgwKf+mxuvjKfph3hk9rnBdcEBzs1sgAB4FsNazWI=;
        b=qVjny94FHEZsthm40AHRO7R2q5K/I0zzQhoCa5FJh2mLBYF6TvBItkpcJT9RdiSswm
         lakAa8ziRutiZya6OF3H2liseUy+UjKdIxH4CDxrqRirNDA+qD7bh8fn2VguankLHGzV
         Ohe/umRn3UFri1oUvzSp6QTWwjpLvNxRLoIucByLR8G55++ad5wQiq/dWCmutLD8qkrU
         uWX/OMvHgFqH0lSoM65EQDOXRLANh2LgkVyCSJSVqeTDP2386hoGzwTNcH+OsAVkDAuo
         z2jPTeNMPr4g5hJ8X3wZCQdqEj5mxk7Dz3FyRYX2OLzQqlONbHdDfkfLUw8fJiEUJ2ic
         4Cew==
X-Gm-Message-State: AOAM533w606JhRq3rOnEjqVpP35beGRM83uQVB+H9zVZWYRUZXsKm4Ij
        ZC/+ejBlnVIYsfS1j1LmTKdqaBKI84E=
X-Google-Smtp-Source: ABdhPJwhIpe9gU+vpL+2cw8coxTBn7ak04EInINQaeKsxpW+bKWAFZN3VmhUaRERQaTFEgRJxoXUGg==
X-Received: by 2002:adf:fb09:: with SMTP id c9mr1678813wrr.223.1639438149280;
        Mon, 13 Dec 2021 15:29:09 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id 38sm12551643wrc.1.2021.12.13.15.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 15:29:08 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH 5/5] media: v4l2-async: Create links during v4l2_async_match_notify()
Date:   Mon, 13 Dec 2021 23:28:49 +0000
Message-Id: <20211213232849.40071-6-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213232849.40071-1-djrscally@gmail.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
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
Changes since the rfc:

	- None

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

