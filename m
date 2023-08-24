Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4BE7870CE
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 15:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240665AbjHXNrE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 09:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239667AbjHXNqd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 09:46:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2548DA8
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 06:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692884791; x=1724420791;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0FHIscgRXePmKPmD1dsB7+E3vvTEootsCqgP1lp9Lrk=;
  b=Hi6qzFVk8mB2yY+j54U+ltuCxkAQU4g5i+XC0mvhqKZLAEwr7MfgEytF
   4wXkr6564/3YQ9jxqXWp+QBf8L2stKc9lrF9MupqF7N4fyf++j8yO6ZbZ
   6c2jMYoqGqB+I4jvMXIIFnCIOXuLiH5/mPEf9h2O7TyGkkjar6crMS3DG
   Zt2VNwxKJEbJUcj319zdFGwoogqQ14RVfhEVr6AIqbDaqA43F0YOOl4j9
   0flfN2w3VTaVMtrnAXyUQ1KbN+ZLUfpI5jWawYjBi2Y2BiXZsTmlaOBhA
   xearHZeFX3q1Y5OkC4BbaDux/wqhwSsO6JAH9I1Z8MBoh8mWegbNExkqp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="405447533"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="405447533"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:46:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="802550948"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="802550948"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:46:17 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 1/6] drm/edid: add drm_edid_is_digital()
Date:   Thu, 24 Aug 2023 16:46:02 +0300
Message-Id: <4bdb407bf189fd922be022eb2f9564692377c81d.1692884619.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1692884619.git.jani.nikula@intel.com>
References: <cover.1692884619.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Checking edid->input & DRM_EDID_INPUT_DIGITAL is common enough to
deserve a helper that also lets us abstract the raw EDID a bit better.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 17 +++++++++++++++--
 include/drm/drm_edid.h     |  1 +
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 340da8257b51..1dbb15439468 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3110,7 +3110,7 @@ drm_monitor_supports_rb(const struct drm_edid *drm_edid)
 		return ret;
 	}
 
-	return ((drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL) != 0);
+	return drm_edid_is_digital(drm_edid);
 }
 
 static void
@@ -6519,7 +6519,7 @@ static void update_display_info(struct drm_connector *connector,
 	if (edid->revision < 3)
 		goto out;
 
-	if (!(edid->input & DRM_EDID_INPUT_DIGITAL))
+	if (!drm_edid_is_digital(drm_edid))
 		goto out;
 
 	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
@@ -7335,3 +7335,16 @@ static void _drm_update_tile_info(struct drm_connector *connector,
 		connector->tile_group = NULL;
 	}
 }
+
+/**
+ * drm_edid_is_digital - is digital?
+ * @drm_edid: The EDID
+ *
+ * Return true if input is digital.
+ */
+bool drm_edid_is_digital(const struct drm_edid *drm_edid)
+{
+	return drm_edid && drm_edid->edid &&
+		drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL;
+}
+EXPORT_SYMBOL(drm_edid_is_digital);
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 48e93f909ef6..882d2638708e 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -612,6 +612,7 @@ const struct drm_edid *drm_edid_read_switcheroo(struct drm_connector *connector,
 int drm_edid_connector_update(struct drm_connector *connector,
 			      const struct drm_edid *edid);
 int drm_edid_connector_add_modes(struct drm_connector *connector);
+bool drm_edid_is_digital(const struct drm_edid *drm_edid);
 
 const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
 				  int ext_id, int *ext_index);
-- 
2.39.2

