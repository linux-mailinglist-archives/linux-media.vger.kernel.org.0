Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4AB4293197
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 00:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388798AbgJSW7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 18:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388780AbgJSW7f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 18:59:35 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7635C0613CE;
        Mon, 19 Oct 2020 15:59:32 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 13so61492wmf.0;
        Mon, 19 Oct 2020 15:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=264ki9XaB3uYmeAhBNda9dKPTPSzjGJQUr/EgBXT3jM=;
        b=SntlFeLGE+RSEyn8vutTPnn6PAwmWywHWIvSix2KEc+DZGtYV1KzOhI+7pqR4mm4yG
         pqQvpsJgmBtthnJwwkFX1tcGyULyNlPuFvXrAS2mT4K19lhx5ob4VKkuAQPqGLJYA3Vj
         hBbsBd6UEKtvwIysMDp6j0b3pxtS66RLn8QfLCKi6uRCNQKEAr/p8QvuQdyeviiBNYlO
         1jpqWlBpV+QUz3Isjr2M2t7AZKD8z6FWKVepo2WqAH3RF9YyG95tFoCc7lS0rLNsXPRp
         YrVxvdDaFX5hoga1MM7nFZ/ajB8NipJ22oCLz4PLWESY/UGx4kwyzRYZjMnjszU39ozY
         9WAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=264ki9XaB3uYmeAhBNda9dKPTPSzjGJQUr/EgBXT3jM=;
        b=MUUjxksYrnmipsVLLK2yojJVMU/wlfEVm8V5pnwV6ptcsB4kQyfC91NNNq97Y9bwBh
         TGWTzmZUQl5wRu3mN7n/2re6UNU0mXrKRcNG5F4kGSy5gU5xEx/bvxDZRoOF6WwCB0yP
         eoguzQbmY9jZHAYZlUSfvyU+S409eLJkW5BtvKYjMDH+2w5ym6/uKF+3omtfqWlH88WR
         Lk2Pz+xZ/6q4Ykfg0in4/w6DP64io99rpD4ylj8z3+kYioSPgkn+lT+uylSrHqetw9s6
         IEz9wQ3/01o5vYK22fg8fURto+5e2s5ViWVE65M8fdJT1dPEVeScA3qqu0NUMeczDNIA
         YNmQ==
X-Gm-Message-State: AOAM530JJuz9MoDqeCjVqdt2PP1qkJORhfRJUWPtDekWPBqRxIQTglM/
        ijuG1CJ/VYWGFDGWuFRfnif1t1iJmnR+6fEF
X-Google-Smtp-Source: ABdhPJwmq6B5RmC4EXjx9uIukFeWgqU3CnngIdU/IqgjmihYTkB+igUIZnhonwhXPtIAVDOfwXx2uQ==
X-Received: by 2002:a7b:c453:: with SMTP id l19mr127894wmi.50.1603148371196;
        Mon, 19 Oct 2020 15:59:31 -0700 (PDT)
Received: from djrscally-MIIX-510-12ISK.home ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id u20sm76505wmm.29.2020.10.19.15.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:59:30 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        sakari.ailus@linux.intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
Subject: [RFC PATCH v3 7/9] ipu3-cio2: Check if pci_dev->dev's fwnode is a software_node in cio2_parse_firmware() and set FWNODE_GRAPH_DEVICE_DISABLED if so
Date:   Mon, 19 Oct 2020 23:59:01 +0100
Message-Id: <20201019225903.14276-8-djrscally@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019225903.14276-1-djrscally@gmail.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

fwnode_graph_get_endpoint_by_id() will optionally parse enabled devices
only; that status being determined through the .device_is_available() op
of the device's fwnode. As software_nodes don't have that operation and
adding it is meaningless, we instead need to check if the device's fwnode
is a software_node and if so pass the appropriate flag to disable that
check

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:
	- patch introduced

 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 4e598e937..f68ef0f6b 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1466,6 +1466,7 @@ static const struct v4l2_async_notifier_operations cio2_async_ops = {
 
 static int cio2_parse_firmware(struct cio2_device *cio2)
 {
+	unsigned long allow_disabled;
 	unsigned int i;
 	int ret;
 
@@ -1474,11 +1475,15 @@ static int cio2_parse_firmware(struct cio2_device *cio2)
 			.bus_type = V4L2_MBUS_CSI2_DPHY
 		};
 		struct sensor_async_subdev *s_asd = NULL;
+		struct fwnode_handle *fwnode;
 		struct fwnode_handle *ep;
 
+		fwnode = dev_fwnode(&cio2->pci_dev->dev);
+		allow_disabled = is_software_node(fwnode) ? FWNODE_GRAPH_DEVICE_DISABLED : 0;
+
 		ep = fwnode_graph_get_endpoint_by_id(
-			dev_fwnode(&cio2->pci_dev->dev), i, 0,
-			FWNODE_GRAPH_ENDPOINT_NEXT);
+			fwnode, i, 0,
+			FWNODE_GRAPH_ENDPOINT_NEXT | allow_disabled);
 
 		if (!ep)
 			continue;
-- 
2.17.1

