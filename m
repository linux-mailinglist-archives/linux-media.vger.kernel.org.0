Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84767788805
	for <lists+linux-media@lfdr.de>; Fri, 25 Aug 2023 15:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244773AbjHYNBc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Aug 2023 09:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244800AbjHYNB3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Aug 2023 09:01:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1FB1BE2
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 06:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692968487; x=1724504487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8cmqtqG/EG6R4dOaX1svLnRD0AON8tt76w3UGGR8r9Q=;
  b=diYg147X0lVLgU06Pz86VgJxIvI8mDkunJqPF3HyAKm6TQpk8m4kdqh6
   XBGFV1TT44SPKKX548hhMkpgkh/qMbWlvgzXErIz1h+tvq80ljF0FXwXa
   oPkVW8NB8fSRTqnCeHic6/v2uLWrYFvk9+Obr6IW3xv2B0a/d4G0Z13sG
   RrZcXwMqK5Y7XgySftqls4Kr2uHPg0ADYNgbe45UMF5Y5E5BOpOhOHn8i
   k1MRX35klYIXbGrSpLkIGYJelEe4yDtDTZzdndBScawd8/hmE3S+RQvts
   81fqfq7rcN7ZvosTPSssIfvFdHdX0Zfw27xibMOjWgAOOWYWnB05Zjvxn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="354236668"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="354236668"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 06:01:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="740602738"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="740602738"
Received: from ogbrugge-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.56.56])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 06:01:25 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2] drm/cec: add drm_dp_cec_attach() as the non-edid version of set edid
Date:   Fri, 25 Aug 2023 16:01:20 +0300
Message-Id: <20230825130120.1250089-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <f8ed9b38fd2ebcd8344a1889a6c0f288969454ea.1692884619.git.jani.nikula@intel.com>
References: <f8ed9b38fd2ebcd8344a1889a6c0f288969454ea.1692884619.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Connectors have source physical address available in display
info. There's no need to parse the EDID again for this. Add
drm_dp_cec_attach() to do this.

Seems like the set_edid/unset_edid naming is a bit specific now that
there's no need to pass the EDID at all, so aim for attach/detach going
forward.

v2: Fix the embarrashing build failures

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_cec.c | 23 ++++++++++++++++++++---
 include/drm/display/drm_dp_helper.h  |  6 ++++++
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_cec.c b/drivers/gpu/drm/display/drm_dp_cec.c
index ae39dc794190..007ceb281d00 100644
--- a/drivers/gpu/drm/display/drm_dp_cec.c
+++ b/drivers/gpu/drm/display/drm_dp_cec.c
@@ -14,6 +14,7 @@
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
+#include <drm/drm_edid.h>
 
 /*
  * Unfortunately it turns out that we have a chicken-and-egg situation
@@ -297,7 +298,7 @@ static void drm_dp_cec_unregister_work(struct work_struct *work)
  * were unchanged and just update the CEC physical address. Otherwise
  * unregister the old CEC adapter and create a new one.
  */
-void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
+void drm_dp_cec_attach(struct drm_dp_aux *aux, u16 source_physical_address)
 {
 	struct drm_connector *connector = aux->cec.connector;
 	u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
@@ -339,7 +340,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 		if (aux->cec.adap->capabilities == cec_caps &&
 		    aux->cec.adap->available_log_addrs == num_las) {
 			/* Unchanged, so just set the phys addr */
-			cec_s_phys_addr_from_edid(aux->cec.adap, edid);
+			cec_s_phys_addr(aux->cec.adap, source_physical_address, false);
 			goto unlock;
 		}
 		/*
@@ -370,11 +371,27 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 		 * from drm_dp_cec_register_connector() edid == NULL, so in
 		 * that case the phys addr is just invalidated.
 		 */
-		cec_s_phys_addr_from_edid(aux->cec.adap, edid);
+		cec_s_phys_addr(aux->cec.adap, source_physical_address, false);
 	}
 unlock:
 	mutex_unlock(&aux->cec.lock);
 }
+EXPORT_SYMBOL(drm_dp_cec_attach);
+
+/*
+ * Note: Prefer calling drm_dp_cec_attach() with
+ * connector->display_info.source_physical_address if possible.
+ */
+void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
+{
+	u16 pa = CEC_PHYS_ADDR_INVALID;
+
+	if (edid && edid->extensions)
+		pa = cec_get_edid_phys_addr((const u8 *)edid,
+					    EDID_LENGTH * (edid->extensions + 1), NULL);
+
+	drm_dp_cec_attach(aux, pa);
+}
 EXPORT_SYMBOL(drm_dp_cec_set_edid);
 
 /*
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 86f24a759268..3369104e2d25 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -699,6 +699,7 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux);
 void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
 				   struct drm_connector *connector);
 void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux);
+void drm_dp_cec_attach(struct drm_dp_aux *aux, u16 source_physical_address);
 void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid);
 void drm_dp_cec_unset_edid(struct drm_dp_aux *aux);
 #else
@@ -716,6 +717,11 @@ static inline void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux)
 {
 }
 
+static inline void drm_dp_cec_attach(struct drm_dp_aux *aux,
+				     u16 source_physical_address)
+{
+}
+
 static inline void drm_dp_cec_set_edid(struct drm_dp_aux *aux,
 				       const struct edid *edid)
 {
-- 
2.39.2

