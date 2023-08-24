Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B50B37870C8
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 15:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239335AbjHXNqc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 09:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241596AbjHXNq1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 09:46:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E3A170F
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 06:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692884785; x=1724420785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CaoHY4p+qUgm3IS7tBRqBO4KNsX3ZdXL70kJayIFbdc=;
  b=JTrAco2RPuBQQYrBn8pgXVYzRj9EMY4sk1GEgc349+Q4E5Sq0J1uzo5L
   60DOGZ7VypU1BXfFCsOSibJ6k9BPtujFKMAPd2O4N/bZrIN1HfsBTy04e
   l89B8qYP3E7Bc55wmwTcafOcH8rod+hfokSEvdLrpipyAA3D1nf947nWL
   PwBOHLQ76eoF2KGEWU1jz1/MK4N7JLJ82kcfG8InRHFo8pP9TajsJ5cSh
   VkvNJj44BVmcF2+QJzGWMJEMNgcgWVccZXUCEoD6DuZWmpIUN+/PiSeZq
   WVClsqUJ9NUt6McyTvqZ+NDWBS4hWOnWxJKamCaADuAJ8xNxy/sFies4H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="354773210"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="354773210"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="983706472"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="983706472"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:46:22 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 2/6] drm/i915/display: use drm_edid_is_digital()
Date:   Thu, 24 Aug 2023 16:46:03 +0300
Message-Id: <dbc0269d34f3140aff410eefae8a2711c59299b3.1692884619.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1692884619.git.jani.nikula@intel.com>
References: <cover.1692884619.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reduce the use of struct edid and drm_edid_raw().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crt.c  | 11 ++++-------
 drivers/gpu/drm/i915/display/intel_hdmi.c |  9 ++++-----
 drivers/gpu/drm/i915/display/intel_sdvo.c |  7 ++-----
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index f66340b4caf0..310670bb6c25 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -657,21 +657,18 @@ static bool intel_crt_detect_ddc(struct drm_connector *connector)
 	drm_edid = intel_crt_get_edid(connector, i2c);
 
 	if (drm_edid) {
-		const struct edid *edid = drm_edid_raw(drm_edid);
-		bool is_digital = edid->input & DRM_EDID_INPUT_DIGITAL;
-
 		/*
 		 * This may be a DVI-I connector with a shared DDC
 		 * link between analog and digital outputs, so we
 		 * have to check the EDID input spec of the attached device.
 		 */
-		if (!is_digital) {
+		if (drm_edid_is_digital(drm_edid)) {
 			drm_dbg_kms(&dev_priv->drm,
-				    "CRT detected via DDC:0x50 [EDID]\n");
-			ret = true;
+				    "CRT not detected via DDC:0x50 [EDID reports a digital panel]\n");
 		} else {
 			drm_dbg_kms(&dev_priv->drm,
-				    "CRT not detected via DDC:0x50 [EDID reports a digital panel]\n");
+				    "CRT detected via DDC:0x50 [EDID]\n");
+			ret = true;
 		}
 	} else {
 		drm_dbg_kms(&dev_priv->drm,
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 9442bf43550e..aa9915098dda 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2452,7 +2452,6 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(to_intel_connector(connector));
 	intel_wakeref_t wakeref;
 	const struct drm_edid *drm_edid;
-	const struct edid *edid;
 	bool connected = false;
 	struct i2c_adapter *i2c;
 
@@ -2475,9 +2474,7 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 
 	to_intel_connector(connector)->detect_edid = drm_edid;
 
-	/* FIXME: Get rid of drm_edid_raw() */
-	edid = drm_edid_raw(drm_edid);
-	if (edid && edid->input & DRM_EDID_INPUT_DIGITAL) {
+	if (drm_edid_is_digital(drm_edid)) {
 		intel_hdmi_dp_dual_mode_detect(connector);
 
 		connected = true;
@@ -2485,7 +2482,9 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 
 	intel_display_power_put(dev_priv, POWER_DOMAIN_GMBUS, wakeref);
 
-	cec_notifier_set_phys_addr_from_edid(intel_hdmi->cec_notifier, edid);
+	/* FIXME: Get rid of drm_edid_raw() */
+	cec_notifier_set_phys_addr_from_edid(intel_hdmi->cec_notifier,
+					     drm_edid_raw(drm_edid));
 
 	return connected;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 7d25a64698e2..917771e19e38 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -2094,10 +2094,8 @@ intel_sdvo_tmds_sink_detect(struct drm_connector *connector)
 
 	status = connector_status_unknown;
 	if (drm_edid) {
-		const struct edid *edid = drm_edid_raw(drm_edid);
-
 		/* DDC bus is shared, match EDID to connector type */
-		if (edid && edid->input & DRM_EDID_INPUT_DIGITAL)
+		if (drm_edid_is_digital(drm_edid))
 			status = connector_status_connected;
 		else
 			status = connector_status_disconnected;
@@ -2111,8 +2109,7 @@ static bool
 intel_sdvo_connector_matches_edid(struct intel_sdvo_connector *sdvo,
 				  const struct drm_edid *drm_edid)
 {
-	const struct edid *edid = drm_edid_raw(drm_edid);
-	bool monitor_is_digital = !!(edid->input & DRM_EDID_INPUT_DIGITAL);
+	bool monitor_is_digital = drm_edid_is_digital(drm_edid);
 	bool connector_is_digital = !!IS_DIGITAL(sdvo);
 
 	DRM_DEBUG_KMS("connector_is_digital? %d, monitor_is_digital? %d\n",
-- 
2.39.2

