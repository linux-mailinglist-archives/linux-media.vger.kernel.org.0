Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C242C214C
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 15:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731263AbfI3NEr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 09:04:47 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46428 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731252AbfI3NEq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 09:04:46 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4eI8110329;
        Mon, 30 Sep 2019 08:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569848680;
        bh=sZBv+tpJiok+3mEdw88W8x1ocksLIC1WErMX5FXscF0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=FMxx5ZWIqjpeksE6FWlWowEjdTaibkgTHafqpOLuqJToDKlGkBlZfc1vhsSz6aVgj
         vm9t8ds7wH3xqMohCvneHu8/e6+67tFpTPBmjlP1+2rBJ/daPrm8N+Hc+7yufJDzH1
         sEDzvv1UOBEKUUKD1sEHNoPjfKwdMBDL2fgiH0ps=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UD4e8c128864
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Sep 2019 08:04:40 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 08:04:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 08:04:40 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4Zii115624;
        Mon, 30 Sep 2019 08:04:39 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v5 3/8] media: i2c: ov2659: Cleanup include file list
Date:   Mon, 30 Sep 2019 08:06:39 -0500
Message-ID: <20190930130644.8704-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190930130644.8704-1-bparrot@ti.com>
References: <20190930130644.8704-1-bparrot@ti.com>
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
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
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

