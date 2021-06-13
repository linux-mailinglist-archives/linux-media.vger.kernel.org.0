Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACFC3A593F
	for <lists+linux-media@lfdr.de>; Sun, 13 Jun 2021 17:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbhFMPLP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Jun 2021 11:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbhFMPLP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Jun 2021 11:11:15 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C87E7C061574
        for <linux-media@vger.kernel.org>; Sun, 13 Jun 2021 08:09:13 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id g20so12282507ejt.0
        for <linux-media@vger.kernel.org>; Sun, 13 Jun 2021 08:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IsFPGPRtyZEIQpz+krVUmYKB4TQmq9ynXdMydNWeOZQ=;
        b=vXHFjnlEk1iBCVrvvKiNv7dfwQLL7WFAV7vEVWbfatw6BeYeEyI8tvU26HCrln5BE5
         1YHvAW78Wfh8RWJigjn37KvZuKgvVmRWAtMz6AzjF7gCSE1Bd2BsW52kjMflNZ5pIcQr
         XGTztyQKgz3nrOLDK1hAMiLebyujgYH7owjMdPIwLwcVIkkXm3FH0VAXvfWxqPu/Gwta
         9bIYjmpuwOk/KhkdsZyZBNmJSFN/BmklhRGz+SsGWyUaD+7iOmEhsnliKEA/2gn98zXB
         HhTkyX06YlWjqc3oC3kpUKSDx42l/WKEftTBNbujpo6/GWfgHzlyGHHaa75HUDIo12Ne
         c+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IsFPGPRtyZEIQpz+krVUmYKB4TQmq9ynXdMydNWeOZQ=;
        b=AKaVnnKWwRXOvFzZax01aw6YK9EXoIqXtVySH9a+FcxQ2jd4wdDPaqjQDz/nGIGh9j
         MCriTypLRN9v/QxJtiARu+sbaV2TO4W+iYEAh5IVkaUBzZFx7cqf+Hs+wBJ3+yK42W0W
         L1QRHZQXFuLeWTS4DssYkj7gMbEgRseDYHicggSHSnfNCtAfsX5CtjUgHjZ18wmMEbVT
         Pl/zFXE35EuqYrER0Fb8Eh6uBrZjFyxR6AMclG8Yx6qckyPsX0SUcWv5lq0D5K0llx0J
         WjapFky8FuZcGfmLC2caKlqVAugrWhtHXrZvObelIAzpvxHXHFnp1B92k4zEye91IRBK
         KpTQ==
X-Gm-Message-State: AOAM533GmFQJEXtzwDixK6dc8V5DJLn9wUIIOAT60Y/tDVXEDVARdlkx
        iKnWaC57YC9hE90BzxIDvj+IWA==
X-Google-Smtp-Source: ABdhPJyPrEsu73jUXa3yP/ywswb98s4qPb0GygrMIFlz6zLrjD/WP0aRE0w9SwpmJSwPD8UAY8VLvQ==
X-Received: by 2002:a17:906:fa13:: with SMTP id lo19mr11962105ejb.468.1623596948266;
        Sun, 13 Jun 2021 08:09:08 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id h26sm5014367ejx.25.2021.06.13.08.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 08:09:07 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3] media: v4l2-fwnode: Simplify v4l2_async_nf_parse_fwnode_endpoints()
Date:   Sun, 13 Jun 2021 17:08:47 +0200
Message-Id: <20210613150847.774978-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are only one user left of __v4l2_async_notifier_parse_fwnode_ep()
since [1], v4l2_async_notifier_parse_fwnode_endpoints(). The two
functions can be merged.

The merge of the two highlights a dead code block conditioned by the
argument 'has_port' that always is false and can therefor be removed.

1. commit 0ae426ebd0dcef81 ("media: v4l2-fwnode: Remove v4l2_async_notifier_parse_fwnode_endpoints_by_port()")

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v2
- Extend commit message to describe that the dead code removed is created
  by the merge of the two functions.
- The rename of the effected function never made it upstream, rebase
  this patch to latest media-tree so it can be picked-up without the
  rename.

* Changes since v1
- Rebased on Sakari's branch which renames
  v4l2_async_notifier_parse_fwnode_endpoints() to
  v4l2_async_nf_parse_fwnode_endpoints).
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 33 ++++-----------------------
 1 file changed, 5 insertions(+), 28 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 843259c304bb5857..60ef0e11af51850c 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -839,13 +839,11 @@ v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
 	return ret == -ENOTCONN ? 0 : ret;
 }
 
-static int
-__v4l2_async_notifier_parse_fwnode_ep(struct device *dev,
-				      struct v4l2_async_notifier *notifier,
-				      size_t asd_struct_size,
-				      unsigned int port,
-				      bool has_port,
-				      parse_endpoint_func parse_endpoint)
+int
+v4l2_async_notifier_parse_fwnode_endpoints(struct device *dev,
+					   struct v4l2_async_notifier *notifier,
+					   size_t asd_struct_size,
+					   parse_endpoint_func parse_endpoint)
 {
 	struct fwnode_handle *fwnode;
 	int ret = 0;
@@ -863,16 +861,6 @@ __v4l2_async_notifier_parse_fwnode_ep(struct device *dev,
 		if (!is_available)
 			continue;
 
-		if (has_port) {
-			struct fwnode_endpoint ep;
-
-			ret = fwnode_graph_parse_endpoint(fwnode, &ep);
-			if (ret)
-				break;
-
-			if (ep.port != port)
-				continue;
-		}
 
 		ret = v4l2_async_notifier_fwnode_parse_endpoint(dev,
 								notifier,
@@ -887,17 +875,6 @@ __v4l2_async_notifier_parse_fwnode_ep(struct device *dev,
 
 	return ret;
 }
-
-int
-v4l2_async_notifier_parse_fwnode_endpoints(struct device *dev,
-					   struct v4l2_async_notifier *notifier,
-					   size_t asd_struct_size,
-					   parse_endpoint_func parse_endpoint)
-{
-	return __v4l2_async_notifier_parse_fwnode_ep(dev, notifier,
-						     asd_struct_size, 0,
-						     false, parse_endpoint);
-}
 EXPORT_SYMBOL_GPL(v4l2_async_notifier_parse_fwnode_endpoints);
 
 /*
-- 
2.32.0

