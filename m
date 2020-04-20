Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB611AFF42
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgDTAjs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726054AbgDTAjr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:47 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53BCC061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:47 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id np9so3794112pjb.4
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pw/KWtB3cpNCCKjjUKy2o/QpPcKDD4Imxdz62soASJ8=;
        b=UA+kx+GB6fIdUk8Myuuf8gC374VPw+DMgduhOrJr+/bUq1fa+TnFhvjz7wmU2Z6tpH
         BZ1juovMtf33IqDPJY1ZZ8XviC8gu1S180EfjlyW89yOGKFb91NSPJu20zvgPsWQq0tH
         5Cp2zkZM7oMZvk1F2tZP76DRAKMZqYlKubdTXPOL0g/EAgaLsbekUOw41I2yoLpgHZek
         2YRPAmlkftfZlYQFqDJcv6LPHwdv1/eWqmTlWfYstEfnlgbKZQixyM44pDCpAwu34MXR
         vbU8dwOFey3d2/IGB5IiPd8ZMobcwpLoDQTxWyldrQipwydMbZV/wcGeyFueKFVS0KtE
         Wjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pw/KWtB3cpNCCKjjUKy2o/QpPcKDD4Imxdz62soASJ8=;
        b=VVo0rISqlZwdlOzfqrPpLMhVOe1/yTJ1/NXH7qPsqHZRK/dRJgnSKStLunqyzxqDHV
         8BU0OdEkCEinObocNErWmSARTkCz59K4GKpQ2ESz4wrZqV+PB4KjPiX6Q/Tr/UXcuDrK
         IWqwp/2uF1oA3GnLWxWk1kDWOhzgLvpqngrdmYG/RGyPE4UMl5aJk0mH45ZumTA7BqeB
         spQTQ41mPa+YMI9SLXpKEajkMpwSE7ERYf4mn8z0+ZiqgPY6ytXkfqAubTa8On2mug4F
         lKpEYh9PWcUma2RugB9Hepn25BEB5P6DvuI53/f0Jop5d89jxjnsuzz3E1BHS32ezEqT
         BZmA==
X-Gm-Message-State: AGi0PuYH+/8UkedDmrGwzOyiYqiWSiJF5aGVgUdeHf5HPd+6mY6jBp97
        8ljpniPNynAxv5PLrxt6o5k7AFfEt3U=
X-Google-Smtp-Source: APiQypJfH3SiTGPiTaso4QHooZwZynmm/XAgFnDFebVXtE+qJQ1kYZMBmIOLJzy8v1lGw16B19b2qw==
X-Received: by 2002:a17:90b:4c10:: with SMTP id na16mr1357192pjb.30.1587343186739;
        Sun, 19 Apr 2020 17:39:46 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:46 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 07/23] Revert "media: v4l2-fwnode: Add a convenience function for registering subdevs with notifiers"
Date:   Sun, 19 Apr 2020 17:39:14 -0700
Message-Id: <20200420003930.11463-8-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The users of v4l2_async_register_fwnode_subdev() have switched to
parsing their endpoints and setting up async sub-device lists in their
notifiers locally, without using the endpoint parsing callbacks. There
are no more users of v4l2_async_register_fwnode_subdev() so this
convenience function can be removed.

This reverts commit 1634f0eded87d1f150e823fa56cd782ea0775eb2.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 62 ---------------------------
 include/media/v4l2-fwnode.h           | 38 ----------------
 2 files changed, 100 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 97f0f8b23b5d..e1f273ae8522 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -1323,68 +1323,6 @@ int v4l2_async_register_subdev_sensor_common(struct v4l2_subdev *sd)
 }
 EXPORT_SYMBOL_GPL(v4l2_async_register_subdev_sensor_common);
 
-int v4l2_async_register_fwnode_subdev(struct v4l2_subdev *sd,
-				      size_t asd_struct_size,
-				      unsigned int *ports,
-				      unsigned int num_ports,
-				      parse_endpoint_func parse_endpoint)
-{
-	struct v4l2_async_notifier *notifier;
-	struct device *dev = sd->dev;
-	struct fwnode_handle *fwnode;
-	int ret;
-
-	if (WARN_ON(!dev))
-		return -ENODEV;
-
-	fwnode = dev_fwnode(dev);
-	if (!fwnode_device_is_available(fwnode))
-		return -ENODEV;
-
-	notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
-	if (!notifier)
-		return -ENOMEM;
-
-	v4l2_async_notifier_init(notifier);
-
-	if (!ports) {
-		ret = v4l2_async_notifier_parse_fwnode_endpoints(dev, notifier,
-								 asd_struct_size,
-								 parse_endpoint);
-		if (ret < 0)
-			goto out_cleanup;
-	} else {
-		unsigned int i;
-
-		for (i = 0; i < num_ports; i++) {
-			ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(dev, notifier, asd_struct_size, ports[i], parse_endpoint);
-			if (ret < 0)
-				goto out_cleanup;
-		}
-	}
-
-	ret = v4l2_async_subdev_notifier_register(sd, notifier);
-	if (ret < 0)
-		goto out_cleanup;
-
-	ret = v4l2_async_register_subdev(sd);
-	if (ret < 0)
-		goto out_unregister;
-
-	sd->subdev_notifier = notifier;
-
-	return 0;
-
-out_unregister:
-	v4l2_async_notifier_unregister(notifier);
-out_cleanup:
-	v4l2_async_notifier_cleanup(notifier);
-	kfree(notifier);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(v4l2_async_register_fwnode_subdev);
-
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
 MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki@samsung.com>");
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index dd82d6d9764e..fad7a6480bf9 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -20,7 +20,6 @@
 #include <linux/types.h>
 
 #include <media/v4l2-mediabus.h>
-#include <media/v4l2-subdev.h>
 
 struct fwnode_handle;
 struct v4l2_async_notifier;
@@ -490,43 +489,6 @@ v4l2_async_notifier_parse_fwnode_endpoints_by_port(struct device *dev,
 int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
 						   struct v4l2_async_notifier *notifier);
 
-/**
- * v4l2_async_register_fwnode_subdev - registers a sub-device to the
- *					asynchronous sub-device framework
- *					and parses fwnode endpoints
- *
- * @sd: pointer to struct &v4l2_subdev
- * @asd_struct_size: size of the driver's async sub-device struct, including
- *		     sizeof(struct v4l2_async_subdev). The &struct
- *		     v4l2_async_subdev shall be the first member of
- *		     the driver's async sub-device struct, i.e. both
- *		     begin at the same memory address.
- * @ports: array of port id's to parse for fwnode endpoints. If NULL, will
- *	   parse all ports owned by the sub-device.
- * @num_ports: number of ports in @ports array. Ignored if @ports is NULL.
- * @parse_endpoint: Driver's callback function called on each V4L2 fwnode
- *		    endpoint. Optional.
- *
- * This function is just like v4l2_async_register_subdev() with the
- * exception that calling it will also allocate a notifier for the
- * sub-device, parse the sub-device's firmware node endpoints using
- * v4l2_async_notifier_parse_fwnode_endpoints() or
- * v4l2_async_notifier_parse_fwnode_endpoints_by_port(), and
- * registers the sub-device notifier. The sub-device is similarly
- * unregistered by calling v4l2_async_unregister_subdev().
- *
- * While registered, the subdev module is marked as in-use.
- *
- * An error is returned if the module is no longer loaded on any attempts
- * to register it.
- */
-int
-v4l2_async_register_fwnode_subdev(struct v4l2_subdev *sd,
-				  size_t asd_struct_size,
-				  unsigned int *ports,
-				  unsigned int num_ports,
-				  parse_endpoint_func parse_endpoint);
-
 /* Helper macros to access the connector links. */
 
 /** v4l2_connector_last_link - Helper macro to get the first
-- 
2.17.1

