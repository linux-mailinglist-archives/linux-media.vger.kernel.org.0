Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8C7A27ECD8
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731146AbgI3PaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730982AbgI3P3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:08 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8980FC061755
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 08:29:08 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 81A32634CD0
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:49 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 035/100] ccs: Stop reading arrays after the first zero
Date:   Wed, 30 Sep 2020 18:27:53 +0300
Message-Id: <20200930152858.8471-36-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The register arrays have a certain size but not all the entries will be
relevant. In practice reading can be stopped after encountering a zero
value in the array. Do that to avoid extra reads.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 58b4e9051184..4c08e2d1d94c 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -193,6 +193,9 @@ static int ccs_read_all_limits(struct ccs_sensor *sensor)
 				goto out_err;
 			}
 
+			if (!val && j)
+				break;
+
 			ccs_assign_limit(ptr, width, val);
 
 			dev_dbg(&client->dev, "0x%8.8x \"%s\" = %u, 0x%x\n",
-- 
2.27.0

