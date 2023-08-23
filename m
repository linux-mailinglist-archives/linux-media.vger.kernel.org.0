Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8A207853B5
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 11:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235436AbjHWJUG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 05:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235543AbjHWJSi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 05:18:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B72A213B
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 02:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692781659; x=1724317659;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IQubqscKGZGhoP9aCv/ml28xxUitu/S/6IxWzq5AblQ=;
  b=P+RzLm1G/suUD+ZNP1rMR8a4FwJPddMN4JRnmgg1hYJz0eWx3KmSpVQl
   TXu/MHCjJN9ao/aPu+8m4ZoByjuQj1h2kYZxiGDTtIi6ZFISr+7Pk8aaY
   0EIiAaQ4kEk0zmwz5/Jt6xhYtDbq7DpezuiOv97MVo3pun/P6j2TIm1TJ
   UwFQnKFWCN9vMOrBS2ECFD6EqsIMIFz/+4yJ/igenDaariibdolz0Y/jZ
   I32QkMw9OgibbWu9WWcbcMRZJGu8gf9h/U97W8UtJNczqtd6ymvIYp1UD
   KPfS0ulyRX/wPdci3OwozebpLPDM2tWJE7LjKqOgh6cXSf458fqje361C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="374087592"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="374087592"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 02:06:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="826649461"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="826649461"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 02:06:54 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id EAEC711FAE0;
        Wed, 23 Aug 2023 12:06:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qYjoY-00GFVn-2p;
        Wed, 23 Aug 2023 12:06:10 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] media: v4l2-mc: Make v4l2_pipeline_pm_{get,put} deprecated
Date:   Wed, 23 Aug 2023 12:06:00 +0300
Message-Id: <20230823090600.3872867-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_pipeline_pm_get() and v4l2_pipeline_pm_put() functions were
needed to control sub-devices' power states before runtime PM. These
functions should no longer be used, and instead sub-device drivers should
use runtime PM.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-mc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
index b39586dfba35..ed0a44b6eada 100644
--- a/include/media/v4l2-mc.h
+++ b/include/media/v4l2-mc.h
@@ -143,6 +143,9 @@ int v4l2_create_fwnode_links(struct v4l2_subdev *src_sd,
  * v4l2_pipeline_pm_get - Increase the use count of a pipeline
  * @entity: The root entity of a pipeline
  *
+ * THIS FUNCTION IS DEPRECATED. DO NOT USE IN NEW DRIVERS. USE RUNTIME PM
+ * ON SUB-DEVICE DRIVERS INSTEAD.
+ *
  * Update the use count of all entities in the pipeline and power entities on.
  *
  * This function is intended to be called in video node open. It uses
@@ -157,6 +160,9 @@ int v4l2_pipeline_pm_get(struct media_entity *entity);
  * v4l2_pipeline_pm_put - Decrease the use count of a pipeline
  * @entity: The root entity of a pipeline
  *
+ * THIS FUNCTION IS DEPRECATED. DO NOT USE IN NEW DRIVERS. USE RUNTIME PM
+ * ON SUB-DEVICE DRIVERS INSTEAD.
+ *
  * Update the use count of all entities in the pipeline and power entities off.
  *
  * This function is intended to be called in video node release. It uses
-- 
2.39.2

