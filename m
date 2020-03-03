Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C08D4178697
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728390AbgCCXnP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:15 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40408 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbgCCXnP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:15 -0500
Received: by mail-pf1-f195.google.com with SMTP id l184so2315602pfl.7
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pThP6NC8TXqIZgF+q2FNoYaQrWxsRa/xWyaf2zAr4/Y=;
        b=DM7/C7NHAwc0ymSi77dnPLbuef6d4Q9Mfx2OidTlosfRkhBjAvAHo0oCkLrkwf8Be5
         FpCXPpVfFQPxuWLblpKUwNhWYwkUxSVYvL0rk9tnvfgCZcrdLuPrcMMGu6ViTeZyuPUv
         taExSTu8dWOJaPWK3apKJq/FfRbB/zkDKlqbKgnTvTAEAeIKwtMuEP/EoljPsvNA2nPR
         YpGlt1AP3LuIWKLVS/eo64PYtMj8qd4XAJU9pYN3nJy6Wrl8KnGFnk16tuSpSPljDY0G
         tyNK1nm3Y9zBMMMkFtjYh/w5AHfTXEF6r5Y3crlEkMjOtdARGqBe0QP3tsbnWjhxEgs2
         XOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pThP6NC8TXqIZgF+q2FNoYaQrWxsRa/xWyaf2zAr4/Y=;
        b=rPDtxHtvt+DZT4KG9kXUUy5ApGOhpFWLIyL5nJkYrdr3ILrQIeW4qQBJaDiZEly4Vp
         Lq66OpKIWtByvL3JTtSKfl6uBy/7hwHwGe51adm8rd0kaSW44pUoQymR0zAwJ/t+ICU7
         //UmJ/EyVhV3kF8NX4puMsq/M6sFvMovlXqcjHBSs/5i+WDk2cFH0k+LYGE05pkIPRhg
         vMPni3Ffb8qdkdIwHua/RXPhpahFyaYRoHITuVaxVu2i2Q83+qF6+7UHq5lFnAQiDw6n
         ytV/hs3UPhT1+l+T9aHWekY1dRgeRfJLpvBLOxmsWzCcimF3VIXTBFebht2CwADTBwPS
         dJGA==
X-Gm-Message-State: ANhLgQ1rvHdmY6DJaukJ+bHRuE+EKOO9lO5tewRx84doxEooTmH8FSmS
        7nZ+vVKRNnnNPs9j6/9pshZ3dlBIlHQ=
X-Google-Smtp-Source: ADFU+vvsNtuGZEfb5Uonpd9epsW6LzcgfBAaHj1Kusm7rsG6WGqSKkw1Jlr9wxtqqrOJvx8NqQTf1g==
X-Received: by 2002:aa7:934a:: with SMTP id 10mr168281pfn.233.1583278993653;
        Tue, 03 Mar 2020 15:43:13 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:13 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 04/17] Revert "media: v4l2-fwnode: Add a convenience function for registering subdevs with notifiers"
Date:   Tue,  3 Mar 2020 15:42:43 -0800
Message-Id: <20200303234256.8928-5-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
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
index 6ece4320e1d2..1dc18940ac0e 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -1163,68 +1163,6 @@ int v4l2_async_register_subdev_sensor_common(struct v4l2_subdev *sd)
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
index f6a7bcd13197..caa854d2a867 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -20,7 +20,6 @@
 #include <linux/types.h>
 
 #include <media/v4l2-mediabus.h>
-#include <media/v4l2-subdev.h>
 
 struct fwnode_handle;
 struct v4l2_async_notifier;
@@ -369,41 +368,4 @@ v4l2_async_notifier_parse_fwnode_endpoints_by_port(struct device *dev,
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
 #endif /* _V4L2_FWNODE_H */
-- 
2.17.1

