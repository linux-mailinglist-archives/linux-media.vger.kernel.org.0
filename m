Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE9978711A
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 16:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241441AbjHXOHs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 10:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241507AbjHXOHb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 10:07:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E80819BC
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 07:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692886049; x=1724422049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MglY81mYDGaMoyIFxCair+EvjWxNiFw45aMMSA3BClI=;
  b=e54DlYM1g4VV+2QC/LT7Fkqqhgjrh4kx30Dl44uUFptENXhFNN3XVmok
   a/MBsv+hTbXnL8SsfJdzpgabGKEg3hUzCubPw7coQef98byMc8XqLjIXN
   VzvfJYItQt9RehHNqyPDDKx//ttoKv8ZoPOIKtWmANpw/m6719e2BKaUe
   BvtWCKMVehMihslRUVI4vpSfmpC63pGM6iS0+CgbVLGmxu9f7vlns9eE/
   mHMM7TA85y2rPLmf3eP3YcEaQtnQg/1cfey4W/JiI00nX5gsb2cDQM089
   x95XEw/jd8EclfA9ZgiuZE25y4GPDUiE3sPxMovTLjjWFxM6fbcYXJVvg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364633855"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="364633855"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="766545246"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="766545246"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:46:39 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 5/6] drm/i915/cec: switch to setting physical address directly
Date:   Thu, 24 Aug 2023 16:46:06 +0300
Message-Id: <01a90c82c8a4f2fd945e0181ffeaca595928d19e.1692884619.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1692884619.git.jani.nikula@intel.com>
References: <cover.1692884619.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Avoid parsing the EDID again for source physical address. Also gets rids
of a few remaining raw EDID usages.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c   | 7 ++-----
 drivers/gpu/drm/i915/display/intel_hdmi.c | 5 ++---
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7067ee3a4bd3..c4b8e0e74c15 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5198,7 +5198,6 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_connector *connector = intel_dp->attached_connector;
 	const struct drm_edid *drm_edid;
-	const struct edid *edid;
 	bool vrr_capable;
 
 	intel_dp_unset_edid(intel_dp);
@@ -5216,10 +5215,8 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
 	intel_dp_update_dfp(intel_dp, drm_edid);
 	intel_dp_update_420(intel_dp);
 
-	/* FIXME: Get rid of drm_edid_raw() */
-	edid = drm_edid_raw(drm_edid);
-
-	drm_dp_cec_set_edid(&intel_dp->aux, edid);
+	drm_dp_cec_attach(&intel_dp->aux,
+			  connector->base.display_info.source_physical_address);
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index aa9915098dda..5d6255ee8b54 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2482,9 +2482,8 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 
 	intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);
 
-	/* FIXME: Get rid of drm_edid_raw() */
-	cec_notifier_set_phys_addr_from_edid(intel_hdmi->cec_notifier,
-					     drm_edid_raw(drm_edid));
+	cec_notifier_set_phys_addr(intel_hdmi->cec_notifier,
+				   connector->display_info.source_physical_address);
 
 	return connected;
 }
-- 
2.39.2

