Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEA1248CFA4
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 01:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiAMAYm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jan 2022 19:24:42 -0500
Received: from mga01.intel.com ([192.55.52.88]:27718 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229625AbiAMAYj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jan 2022 19:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642033479; x=1673569479;
  h=from:to:cc:subject:date:message-id;
  bh=0R/Eo+Y51ftfIWcRrhJb2RxgrshbEi5g0IBulYC5pxg=;
  b=Jat6Bz8P9Ma2qyvNPFzxBUaUk/Xqbws4Fm7j0459f+czU5/7hSdUkSn6
   VmHpIvfNV3V/faUpROp2CEjDI6E/OozoBXFUlCCJ6AdHtNxhCYBq0bP99
   hzJkiMucuSmMzNfgJLdPRZLj0DfFkDnOybnx/XC8H/b7LJTI+Ka9uX0sX
   MAM0m8xW7o+mAjijQFTJVNu/akNLGix1gS2BbbcaAMFyTd+PfNYTYTEme
   SVBWRWcvQTJBXWHbKIarIadt0RsDAL+FgVaCyJpQ0Ne7NhQjiI1MVJfBl
   ASE42SNxE4EVPhExM1DaGcfSR7Aw+ahYZCWdealysFhDXHkUL2ViuCXgO
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="268235501"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="268235501"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 16:24:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="691589652"
Received: from ipu5-build.bj.intel.com ([10.238.232.188])
  by orsmga005.jf.intel.com with ESMTP; 12 Jan 2022 16:24:36 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     senozhatsky@chromium.org, mchehab+huawei@kernel.org,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com
Subject: [PATCH] media: ov2740: identify module after subdev initialisation
Date:   Thu, 13 Jan 2022 08:18:48 +0800
Message-Id: <1642033128-4635-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The module identifying will try to get the sub device data which
will be ready after sub device initialisation, so if try to use the
subdev data to deference the client will cause NULL pointer
dereference, this patch move the module identification after
v4l2_i2c_subdev_init() to fix this issue, it also fixes duplicate
module idendification.

Fixes: ada2c4f54d0a ("media: ov2740: support device probe in non-zero ACPI D state")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov2740.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index bab720c7c1de..d5f0eabf20c6 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1162,6 +1162,7 @@ static int ov2740_probe(struct i2c_client *client)
 	if (!ov2740)
 		return -ENOMEM;
 
+	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
 		ret = ov2740_identify_module(ov2740);
@@ -1171,13 +1172,6 @@ static int ov2740_probe(struct i2c_client *client)
 		}
 	}
 
-	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
-	ret = ov2740_identify_module(ov2740);
-	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d", ret);
-		return ret;
-	}
-
 	mutex_init(&ov2740->mutex);
 	ov2740->cur_mode = &supported_modes[0];
 	ret = ov2740_init_controls(ov2740);
-- 
2.7.4

