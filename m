Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA471C1B5E
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729182AbgEARQM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728970AbgEARQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:11 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F30C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:11 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y25so1837140pfn.5
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pw/KWtB3cpNCCKjjUKy2o/QpPcKDD4Imxdz62soASJ8=;
        b=eQgYazT0syAKPkzd3IwUdSu6HnNkPO+JEmCibV8D6LfY3aBs+JLljAxz7HsKGRAPUh
         EpLZrphVns1wfoMaRIsuG+B9wTwiwfRiPTqL+Lf8ho7ZSKtTurTY5u9toFh1MgWk1OzR
         KhTbySO2jk5KqIny0tUgGHdJy+31PlEG8IJq/3+yfTQ8H29ADMMZwosm6ZXslw3GjSIx
         FDrukisVCUXLql1lTqcVcoj6stScWIBtdTLOYvSx5/0bw2shH++wpjt/SN+YEc0yz+Yq
         6ajaAuINery7B/u6ZXVGMypJKO2eZN0vLjGqfrCQ6+wL9yvDaTPS7M+PRas6rzo5zzt3
         zmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pw/KWtB3cpNCCKjjUKy2o/QpPcKDD4Imxdz62soASJ8=;
        b=dlRzFazDaKSHiNp8MzMP/sdLaxQfkF/0mSqKA5pyeDboo8i3sq7hnc3OdAMheHI1Dz
         WDByEHwpzjwLucPsYfTk9DZUX5rEUkinF1CORxCa4vSGhYFD3JxYLzbINcjvQ7oZtkrE
         sLw9nazQ+iF6uW+ow0IPEVuTYdF2Hx0ZDLdqzh6YmTkcgv78QrtpJntpt1sqlkJV3aaE
         sgis19hwZQ8hxa2srqIOiSnHjO/x9kFlpnUJZP21MdZMkbfSzaFfKC6UK773zsjfdtN1
         /MOZvSTXV1d0L6w1UzEwMqBm+7l+QjzznYZY2r3xBweX70lbIBi1kSuyf0YJNQTPxrSX
         pMpQ==
X-Gm-Message-State: AGi0PuYgfDo1GOdOy+Srf7RoyJ4K1J/ipqfz4nmNN9e6Dyyz+dN4tMmG
        U4F5z6sw1LnzqmEIu1I9TbokV1Yh
X-Google-Smtp-Source: APiQypJ7AX0j0MUPsyJlh5TTDApKzh3UZIOL8CHcnPY9JYTZAdfVjyZUGvYz2vM49x9AoNBwxKxhRg==
X-Received: by 2002:a62:144c:: with SMTP id 73mr5147723pfu.37.1588353370344;
        Fri, 01 May 2020 10:16:10 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:09 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 06/22] Revert "media: v4l2-fwnode: Add a convenience function for registering subdevs with notifiers"
Date:   Fri,  1 May 2020 10:15:40 -0700
Message-Id: <20200501171556.14731-7-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
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

