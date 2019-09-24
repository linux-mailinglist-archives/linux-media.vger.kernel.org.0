Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9A00BD02B
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 19:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393534AbfIXRDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 13:03:32 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:50516 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404308AbfIXQmW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 12:42:22 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8OGgJT5069298;
        Tue, 24 Sep 2019 11:42:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569343339;
        bh=StWGslFj96fAX4j18GVQxPAFREJQoWNyZ9rPMdVRPZk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=QV38DAJbtozutiARRTn8HTSs0Auq8U8XuDmVUPcpHVyKfbHxjTWU7FsQHkq2YNhts
         K9UBWCulWJoXhxQBhbHwxc1E2RTKWTzDkSs+DRRFD6LczHtBn0pK+rL1jX8qOEzAQs
         M3LcexIe56xooRkJ60Tq8+dRHbeQRcndhupl2eAU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8OGgJmI048861
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Sep 2019 11:42:19 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 24
 Sep 2019 11:42:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 24 Sep 2019 11:42:12 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8OGgCQV073229;
        Tue, 24 Sep 2019 11:42:18 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 3/8] media: i2c: ov2659: Cleanup include file list
Date:   Tue, 24 Sep 2019 11:44:09 -0500
Message-ID: <20190924164414.21897-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190924164414.21897-1-bparrot@ti.com>
References: <20190924164414.21897-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Several of include files listed are not explicitly needed.
If they are need then they are implicitly included.

Reduce the list of includes to an easier to manage list.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/i2c/ov2659.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index efbe6dc720e2..f77320e8a60d 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -22,29 +22,15 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/err.h>
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/io.h>
 #include <linux/i2c.h>
-#include <linux/kernel.h>
-#include <linux/media.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_graph.h>
-#include <linux/slab.h>
-#include <linux/uaccess.h>
-#include <linux/videodev2.h>
 
-#include <media/media-entity.h>
 #include <media/i2c/ov2659.h>
-#include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-image-sizes.h>
-#include <media/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
 
 #define DRIVER_NAME "ov2659"
-- 
2.17.1

