Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA243E4F9E
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 00:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236940AbhHIW7Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 18:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbhHIW7X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 18:59:23 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FC2C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 15:59:02 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id f5so7709541wrm.13
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 15:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KHFbtNkz90a+ly2u+ADdo6w6sm7cKULDRnnThID+zhc=;
        b=CjiSMJMmSHxGmgyj1ig1jtpYktq5bUjp6CBXvuIMFi1WHG6t0JFAKjY6zFPPSSTpBb
         SYXzJTiIK5VHRRB6KWDIoj7Oz/mZaUe8NcwvZv7wcZ0KzK8BjNnvWnWpRr2+gGDo8qNJ
         ql/Hop4mvzMwX+GHQ8HyW3AHJL+/ezqQMPYayF49VdewANuUgOyOUurAfmfZjh2othep
         e7etM67pumAgJFkbwfQU4bBkveERBREfQpMn3cgjOUss7qeI8cbh9Yp8Rw2QCJo/SIzo
         jYg9jr9ROkWZkbq2ModcLrrZKQSeEiBUxyQ4l+gKnL5qpG7qTayjlJT6FKymuwS821jQ
         XB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KHFbtNkz90a+ly2u+ADdo6w6sm7cKULDRnnThID+zhc=;
        b=gGvDnmAMHTVOPzQ/8YEkmdpiIrAqo1ezI2/xV+aeuqnbF6PszFsVdrSWF7q6vUpgHn
         wOa4EfY7RIcI4g6eE4fjjpfHOYGaWVZgioyDi8h/2Hw40XMVjOhnyXtaccppHzreG12F
         Slb+H2Ba24EJpVH2r/E9663r7JaEPwsyMpuLxny/BMcL5S9Z0o3Hfxvv8hux8CsygQuS
         JFgWBEixdqK19bwutKZWEg4W2WY+paftl5lI8NC/qUpP/liG/bnIQPO+2FUwJfkcIoqD
         +kR75fvBq5F3S5yuSRv4W8OuRDVUYD0uANTP63OeVv3jZOTnZRRwjiGSkGQ+sxny3qI5
         eCVQ==
X-Gm-Message-State: AOAM5326zWiVg4/W2Ty/PNZNVRv8sxEhV5v4IrhVt8IytLr73gs5q3l/
        gmvENatk1kdDIBdU0VrGrgM=
X-Google-Smtp-Source: ABdhPJwPol+nSY0bp9PtUpjUzKAKjOmiokZV1sV1T5nCdTL/BlP0H0+DQb1QpC/M/s290OQgayrMlw==
X-Received: by 2002:adf:b357:: with SMTP id k23mr10382348wrd.94.1628549941080;
        Mon, 09 Aug 2021 15:59:01 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v12sm20437957wrq.59.2021.08.09.15.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 15:59:00 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     djrscally@gmail.com, sakari.ailus@linux.intel.com,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v2 03/12] media: i2c: Defer probe if not endpoint found
Date:   Mon,  9 Aug 2021 23:58:36 +0100
Message-Id: <20210809225845.916430-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809225845.916430-1-djrscally@gmail.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
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
Changes in v2:

	- None

 drivers/media/i2c/ov8865.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 8d973117f611..fe700787bfb9 100644
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

