Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82BCF4598CB
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232939AbhKWADv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:03:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbhKWADh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:37 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3EAC06173E
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:30 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so586594wmj.5
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZHk04WIzJnhBqPJPdsES5xLMWYgCbqGKTYJP80oXQ0w=;
        b=VrUpJj+RRy2rWWjQqnXAuFD+Vdm+r3MlBOXsNpWofSgiMfKVbUyoOr28HtV2ybOiR+
         bMNVn+i11zsJGfimI4g/68Ezcxk2wdwumWVFnnikyDneRmfWz604o31klHI3A58DR1sy
         m5I/IuiU+EatJfRSRZNQFk/6dGg0BbeBB+8WzR9GtPou1vOjkxpmNbuGmcGa9V+CYKd5
         EIv/ALLTQ7QOb2713a5s5bqdCDLFfT/NyxpYjSuG9eptFy79MCCyfhm0p4E6y7o7wzLu
         QokOKRA3d0QbwisGcZsIZvvn6U3yEOwJq2l4850paCd4GUoZSsAQyFPAZ0Di265hKT3W
         11yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZHk04WIzJnhBqPJPdsES5xLMWYgCbqGKTYJP80oXQ0w=;
        b=7vx99pIoMwMMlA7Da8dMKPeOgjQuju04awhcdn0pW5V3KQe+3jEWKeF4el+JXrHhSR
         nvBdsrroJbP/1QwqQzrxapUbt5cvGOmmKQsDRcbJkNn4b7qfJ5GsFjqQWbl2ii6aFcY3
         tJnSgScsHKrbmvzsDUdRN5PnUFtGkYmBDjEZLQRHRoJWilZo15SX2xswdFtRPoCYPsHJ
         jSjjMdSqN/eUTn/1WXFRiin/ZpNuFyg+mmMIdD6DVhaB1czj7mt9FJ3U9tQQ2qfcMch3
         K9IA7CN8odGuzbaYOYKUj7U+XhmO8X3wh+GrZjP928yYjUBJRQ7cjJ0nzxZGuwvbjaBa
         xqZQ==
X-Gm-Message-State: AOAM530vwHiP3Y6cWNGL3fogkAPkkEuYZ+mrfHBqmRVB7/7OEkmFBHr5
        KyEayiBUPm1i1CH3NiJ4GJJaJte4O1M=
X-Google-Smtp-Source: ABdhPJxWXnwT1ztQu9dMT+BCNJSFeIfrNSDwjHjfoCxHBahlcbbKXtXz3afoK03frEvb5ZNordulCA==
X-Received: by 2002:a1c:488:: with SMTP id 130mr1412090wme.157.1637625629203;
        Mon, 22 Nov 2021 16:00:29 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:28 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 05/17] media: i2c: Defer probe if not endpoint found
Date:   Tue, 23 Nov 2021 00:00:05 +0000
Message-Id: <20211123000017.43187-6-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865 driver is one of those that can be connected to a CIO2
device by the cio2-bridge code. This means that the absence of an
endpoint for this device is not necessarily fatal, as one might be
built by the cio2-bridge when it probes. Return -EPROBE_DEFER if no
endpoint is found rather than a fatal error.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v5: 

	- None

 drivers/media/i2c/ov8865.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index a6372a0989e1..68fdb1ce1e94 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2796,10 +2796,8 @@ static int ov8865_probe(struct i2c_client *client)
 	/* Graph Endpoint */
 
 	handle = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
-	if (!handle) {
-		dev_err(dev, "unable to find endpoint node\n");
-		return -EINVAL;
-	}
+	if (!handle)
+		return -EPROBE_DEFER;
 
 	sensor->endpoint.bus_type = V4L2_MBUS_CSI2_DPHY;
 
-- 
2.25.1

