Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5383D2DBD
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 22:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhGVTyJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 15:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbhGVTx4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 15:53:56 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC82C061575;
        Thu, 22 Jul 2021 13:34:30 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id n4so4066665wms.1;
        Thu, 22 Jul 2021 13:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k4qNnWFiHZbuAXHFsT+bKVbo+jmeTJ2ycqVV3Ikcsts=;
        b=BSImA2lwtaRokOJRUn5SwmTIPFyLWwyhK/M/tQvrARgoEoBaLrf3tZBUD/FRtOh3tp
         eiUOsGctClX0UX33WUdnPT14ahGDVjcvcALlhxRsEUig1lOwuyvw9wqESfWkLvd/CjSM
         oo5Y//Z2DB8CGNE3pVWWaeUa142YyoAeO7dXSWIYI4TG+9lmAP6W9LzgRcrsR/20z19e
         FoTIC8vm94svw6bimIsuObgAshpX08ZAGrpQNukI9sVkcDGnAg6T+ft6zOftvsVlEswY
         u62tpQN1k5ibMfVHYJpN7w5dgbIkU3iyUH3JAJdRsOi7kikryAXdSCQTXsBXUP+MwUht
         OIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k4qNnWFiHZbuAXHFsT+bKVbo+jmeTJ2ycqVV3Ikcsts=;
        b=RRZ+29akMs9jcBlFxfxVC+VPbfj0aCj8gAASSVMEGdMBF3dOxhaVl5x3O9Gkj4fBxc
         vq38b4Ip/TEHxIHoDZ6Fxcn2diWUok+pIOk+SXaggnYW5i3+qrvUBpOy9inhjNu4RfCh
         /aRf8avk2hN3LRuFtpdG0CXI2IEV7SEHDtvYzJPRkoI86hQICaU95p9+3BVk2MTmS6+j
         jQQK0QZbFhvjOlWTXP703z3vflXBT9BogSGEte7JxEub+2YqTweikhHZMZIvFwIZcYKH
         XZ9QcfMkM9vVAdcclrChA0pkqU5KjIDuuOOykksUVGBDiR5M+5JXBDkr/55JKanf0xxk
         kaZQ==
X-Gm-Message-State: AOAM532DhnDWxTccBCU+qJ9UKIhDHkYQ9O5zDHI8kbGEVMrl7+fdXMAv
        c8/RXcRkdC/EFbFys5KVewPmW9UVK0A=
X-Google-Smtp-Source: ABdhPJxuUYOIrMjTT0PHXDGl123GNVze3cIfwmvhX3Am/8DZBNlyAGuBTELDFZaVArxEef5w3rzb7w==
X-Received: by 2002:a05:600c:4ca7:: with SMTP id g39mr1308902wmp.72.1626986068657;
        Thu, 22 Jul 2021 13:34:28 -0700 (PDT)
Received: from valhalla.home ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id b16sm31036455wrw.46.2021.07.22.13.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:34:28 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 03/13] media: i2c: Defer probe if not endpoint found
Date:   Thu, 22 Jul 2021 21:33:57 +0100
Message-Id: <20210722203407.3588046-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722203407.3588046-1-djrscally@gmail.com>
References: <20210722203407.3588046-1-djrscally@gmail.com>
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
 drivers/media/i2c/ov8865.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 2ef146e7e7ef..66182142c28b 100644
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

