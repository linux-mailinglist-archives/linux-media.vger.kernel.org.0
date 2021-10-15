Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B0E42E8B4
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 08:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbhJOGOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 02:14:43 -0400
Received: from mga12.intel.com ([192.55.52.136]:64319 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231445AbhJOGOl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 02:14:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="207971933"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="207971933"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2021 23:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="443101839"
Received: from ipu5-build.bj.intel.com ([10.238.232.188])
  by orsmga003.jf.intel.com with ESMTP; 14 Oct 2021 23:12:33 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        dongchun.zhu@mediatek.com, tfiga@chromium.org
Cc:     tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH] media: dw9768: activate runtime PM and turn off device
Date:   Fri, 15 Oct 2021 14:08:39 +0800
Message-Id: <1634278119-32158-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When dw9768 working with ACPI systems, the dw9768 was turned
by i2c-core during probe, driver need activate the PM runtime
and ask runtime PM to turn off the device.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/dw9768.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index c086580efac7..65c6acf3ced9 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -469,6 +469,11 @@ static int dw9768_probe(struct i2c_client *client)
 
 	dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
 
+	/*
+	 * Device is already turned on by i2c-core with ACPI domain PM.
+	 * Attempt to turn off the device to satisfy the privacy LED concerns.
+	 */
+	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 	if (!pm_runtime_enabled(dev)) {
 		ret = dw9768_runtime_resume(dev);
@@ -483,6 +488,7 @@ static int dw9768_probe(struct i2c_client *client)
 		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
 		goto err_power_off;
 	}
+	pm_runtime_idle(dev);
 
 	return 0;
 
-- 
2.7.4

