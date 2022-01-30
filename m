Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D38784A3BF7
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 00:59:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244077AbiA3X7O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jan 2022 18:59:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241651AbiA3X7N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jan 2022 18:59:13 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6956C06173B
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 15:59:12 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id u15so22090564wrt.3
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 15:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TsRQ3SVohkOtQPdF+FWJeJ2VqSG/vDGg0tiEtAOREIM=;
        b=aohO9Go1mMW0DmLUPrYqXyicUFMJyZx4iDGeZkMMH8GF1eUI891taRf+dpuYnTxhEX
         ZFRrGidCc9f73wRKfXxEhsjQS0qStKvs17lQwTHDBiEy8fI3K8PuS2qSFmgyw/sRJGdC
         Zm2rx+Kj2uhaOtV03ubWuiu3LVs2QKTchhGZ1bXO8WD+VkaEgBOCpvjdqghPrenpEysp
         KUMhdmDBMZRvjCv8bwRrf+M2A5eU0uJouxa3FlY72PHTjKKz6ElsQ5GQ9Ka6aeOuKMB5
         HUtsfgsFtsMtQfpgty6LXJLLUoOBhINN7GHBNpRAOidPljzo6NT9SknApF3l9J6wTqDn
         c+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TsRQ3SVohkOtQPdF+FWJeJ2VqSG/vDGg0tiEtAOREIM=;
        b=WAE8nGLWMJEhzhm/D27Cs5N05PzU6+iZ/upwfDr/N2Ky2CfqXBfzhe9xPKuEdK+A9/
         5X+j71UMlA8y3iCHh6NEztDdx3qTcG1czx9ngMrMMNA52tyYkHv0XvA79FusAmgZ9OWa
         D88wkR+CYH7y5eAjZBiW2D5toUEBqf4iSnsjZ/4aDUZumPH8+KFp5sMEUchLAPvJTDR2
         PSuBtmu1Sdy5G8yLBjvIiPtVQk9I1q384uQ0NydVay7GzbJg1FdPOBASlqrEsexHZcbC
         nBNFw4Ag6eTzisQBbA+cUZhoXBq/oYACjoI8NyjoMBRtOhfH72IYac4DoYbvf7+a8fOK
         Yq6Q==
X-Gm-Message-State: AOAM532VPY6htI//BOsDuPKR8uxdJcZQbhcQq5yjLO5BlvVEslinK7gS
        K0dPmhY2ItSCwfznhB9ntjNyX1ASnqM=
X-Google-Smtp-Source: ABdhPJwo/8lAg1VcbfXGIKrXktZ/0c3eyIE8YP3e9uMMRaMJeJw2RBTuNYgQGzIvJ8PpwWybXlIm4w==
X-Received: by 2002:a5d:4889:: with SMTP id g9mr14979816wrq.400.1643587151468;
        Sun, 30 Jan 2022 15:59:11 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id 11sm11993663wrb.30.2022.01.30.15.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 15:59:11 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH v2 6/6] media: v4l2-async: Create links during v4l2_async_match_notify()
Date:   Sun, 30 Jan 2022 23:58:21 +0000
Message-Id: <20220130235821.48076-7-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220130235821.48076-1-djrscally@gmail.com>
References: <20220130235821.48076-1-djrscally@gmail.com>
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
Changes since v1:

	- Added #ifdef guards for CONFIG_MEDIA_CONTROLLER
	- Some spelling and nomenclature cleanup (Laurent)

Changes since the rfc:

	- None

 drivers/media/v4l2-core/v4l2-async.c | 56 ++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 0404267f1ae4..8980534e755e 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -275,6 +275,50 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
 static int
 v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
 
+static int
+__v4l2_async_create_ancillary_link(struct v4l2_async_notifier *notifier,
+				   struct v4l2_subdev *sd)
+{
+	struct media_link *link = NULL;
+
+#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
+
+	if (sd->entity.function != MEDIA_ENT_F_LENS &&
+	    sd->entity.function != MEDIA_ENT_F_FLASH)
+		return -EINVAL;
+
+	link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity);
+
+#endif
+
+	return IS_ERR(link) ? PTR_ERR(link) : 0;
+}
+
+/*
+ * Create links on behalf of the notifier and subdev, where it's obvious what
+ * should be done. At the moment, we only support cases where the notifier
+ * is a camera sensor and the subdev is a lens controller.
+ *
+ * TODO: Create data links if the notifier's function is
+ * MEDIA_ENT_F_VID_IF_BRIDGE and the subdev's is MEDIA_ENT_F_CAM_SENSOR.
+ */
+static int v4l2_async_try_create_links(struct v4l2_async_notifier *notifier,
+				       struct v4l2_subdev *sd)
+{
+#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
+
+	if (!notifier->sd)
+		return 0;
+
+	switch (notifier->sd->entity.function) {
+	case MEDIA_ENT_F_CAM_SENSOR:
+		return __v4l2_async_create_ancillary_link(notifier, sd);
+	}
+
+#endif
+	return 0;
+}
+
 static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 				   struct v4l2_device *v4l2_dev,
 				   struct v4l2_subdev *sd,
@@ -293,6 +337,18 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 		return ret;
 	}
 
+	/*
+	 * Depending of the function of the entities involved, we may want to
+	 * create links between them (for example between a sensor and its lens
+	 * or between a sensor's source pad and the connected device's sink
+	 * pad).
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

