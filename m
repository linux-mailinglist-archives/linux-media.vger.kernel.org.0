Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE85C2D74D8
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 12:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730413AbgLKLm1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 06:42:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390637AbgLKLlv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 06:41:51 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF26C0613D3
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 03:40:06 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 4A2D4634C87
        for <linux-media@vger.kernel.org>; Fri, 11 Dec 2020 13:39:44 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] ccs: Small definition cleanup
Date:   Fri, 11 Dec 2020 13:32:14 +0200
Message-Id: <20201211113214.7695-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

struct device is used in ccs-data.h but no definition is included. Add a
forward definition.

Also ccs-data.c includes linux/types.h but this is already included in
ccs-data.h which ccs-data.c includes. Do don't include linux/types.h in
ccs-data.c.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-data.c | 1 -
 drivers/media/i2c/ccs/ccs-data.h | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
index 9a6097b088bd..59338a6704af 100644
--- a/drivers/media/i2c/ccs/ccs-data.c
+++ b/drivers/media/i2c/ccs/ccs-data.c
@@ -10,7 +10,6 @@
 #include <linux/limits.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
-#include <linux/types.h>
 
 #include "ccs-data-defs.h"
 
diff --git a/drivers/media/i2c/ccs/ccs-data.h b/drivers/media/i2c/ccs/ccs-data.h
index 50d6508b24f3..c75d480c8792 100644
--- a/drivers/media/i2c/ccs/ccs-data.h
+++ b/drivers/media/i2c/ccs/ccs-data.h
@@ -10,6 +10,8 @@
 
 #include <linux/types.h>
 
+struct device;
+
 /**
  * struct ccs_data_block_version - CCS static data version
  * @version_major: Major version number
-- 
2.29.2

