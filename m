Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12327C214F
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 15:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731301AbfI3NEt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 09:04:49 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46436 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731292AbfI3NEt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 09:04:49 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4luP110351;
        Mon, 30 Sep 2019 08:04:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569848687;
        bh=+DIhuJUBVMkB/IKbsrvnRijTwK4odP2dDYCj3Ruv0Zc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=M/QPbPU4JJm8QxYBnKMp5C6i115xpQNnyjfO7BTIdwb9Y9kkqCbu6tZEtedwMXTkX
         ObKaGwOOdeUa6f9Ac2UTukRePJtkPgNUzMpe+FHj2RPxt2Msn5UoiVqEA+vJymP4a9
         bqzoROIegLwMzuDmUAZr62s45N+ck9ub8d22gZuA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4l00057577;
        Mon, 30 Sep 2019 08:04:47 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 08:04:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 08:04:47 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UD4Zin115624;
        Mon, 30 Sep 2019 08:04:47 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v5 8/8] media: i2c: ov2659: Switch to SPDX Licensing
Date:   Mon, 30 Sep 2019 08:06:44 -0500
Message-ID: <20190930130644.8704-9-bparrot@ti.com>
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

Switch to SPDX licensing and drop the redundant GPL text.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
---
 drivers/media/i2c/ov2659.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index c1e2aa1f952d..42f64175a6df 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Omnivision OV2659 CMOS Image Sensor driver
  *
@@ -5,19 +6,6 @@
  *
  * Benoit Parrot <bparrot@ti.com>
  * Lad, Prabhakar <prabhakar.csengg@gmail.com>
- *
- * This program is free software; you may redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
- * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
- * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
  */
 
 #include <linux/clk.h>
-- 
2.17.1

