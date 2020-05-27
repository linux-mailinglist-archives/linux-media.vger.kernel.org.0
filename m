Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA0B1E3A49
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 09:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgE0HYn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 03:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbgE0HYn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 03:24:43 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D2C4C061A0F
        for <linux-media@vger.kernel.org>; Wed, 27 May 2020 00:24:43 -0700 (PDT)
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id C308D634C87
        for <linux-media@vger.kernel.org>; Wed, 27 May 2020 10:23:51 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] smiapp: Use pm_runtime_get_if_active
Date:   Wed, 27 May 2020 10:24:40 +0300
Message-Id: <20200527072440.30435-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the convenience function pm_runtime_get_if_active() instead of a
number of calls to runtime PM to figure out if the device was already
powered up.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 5e4f6a2ef78e..841b12afaea7 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -508,9 +508,7 @@ static int smiapp_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_get_noresume(&client->dev);
-	pm_status = pm_runtime_get_if_in_use(&client->dev);
-	pm_runtime_put_noidle(&client->dev);
+	pm_status = pm_runtime_get_if_active(&client->dev, true);
 	if (!pm_status)
 		return 0;
 
-- 
2.20.1

