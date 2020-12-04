Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5DB82CED98
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 12:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730024AbgLDLyD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 06:54:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbgLDLyD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 06:54:03 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8702C0613D1
        for <linux-media@vger.kernel.org>; Fri,  4 Dec 2020 03:52:22 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id CF5ED634C24;
        Fri,  4 Dec 2020 13:51:01 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Zhang Changzhong <zhangchangzhong@huawei.com>
Subject: [PATCH 1/1] ccs: Fix return value from probe
Date:   Fri,  4 Dec 2020 13:49:50 +0200
Message-Id: <20201204114950.25676-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

rval wasn't set, resulting in probe returning zero instead of an error.

Fixes: de10c1619c48 ("[media] smiapp: Get clock rate if it's not available through DT")
Reported-by: Zhang Changzhong <zhangchangzhong@huawei.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi Zhang,

The smiapp driver has been renamed as "ccs" and the surrounding code has
changed, too. So I wrote this one. Thank you for the patch in any case.

 drivers/media/i2c/ccs/ccs-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 7a461c0a730d..5f69e4c44533 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3030,7 +3030,7 @@ static int ccs_probe(struct i2c_client *client)
 				dev_err(&client->dev,
 					"can't set clock freq, asked for %u but got %lu\n",
 					sensor->hwcfg.ext_clk, rate);
-				return rval;
+				return -EINVAL;
 			}
 		} else {
 			sensor->hwcfg.ext_clk = clk_get_rate(sensor->ext_clk);
-- 
2.27.0

