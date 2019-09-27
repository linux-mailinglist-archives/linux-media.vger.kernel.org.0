Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41B9BC0BAD
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 20:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbfI0SpU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 14:45:20 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46744 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbfI0SpU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 14:45:20 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RIjIwm094634;
        Fri, 27 Sep 2019 13:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569609918;
        bh=StWGslFj96fAX4j18GVQxPAFREJQoWNyZ9rPMdVRPZk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Q9HR9owGsqKl7VJRk5YEgGPGVKOUcN6EmcSeH9DszpnGwDCJiqOd+b7yPuiz+tyYz
         f34URJvwlswDP7Jjyd0PFmk5TapKird6KTHLAMg2pXvx+Si86jRCP0tROdxLW9DBeA
         OuYGo5zkgaAj5gL0J32P+b1ipv58opBZ6Cxv5YvM=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RIjIUR074972
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 13:45:18 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 13:45:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 13:45:17 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RIjEVY122194;
        Fri, 27 Sep 2019 13:45:17 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 3/8] media: i2c: ov2659: Cleanup include file list
Date:   Fri, 27 Sep 2019 13:47:17 -0500
Message-ID: <20190927184722.31989-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927184722.31989-1-bparrot@ti.com>
References: <20190927184722.31989-1-bparrot@ti.com>
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

