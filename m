Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3D4378EB19
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 12:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344808AbjHaKw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Aug 2023 06:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239807AbjHaKwX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Aug 2023 06:52:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4193B10DE
        for <linux-media@vger.kernel.org>; Thu, 31 Aug 2023 03:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693479114; x=1725015114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bK0hR2Wo68cckQ3fMMpTh2HEN/1JnSMIe4uhIwiTfAI=;
  b=R8RUIa7u/GEvmyuBcbCsfX9QRf0+dBLkXnurMCwVQJVgWcqQlAIkDlbG
   zWVK7hPFngTzLzZJE0kSYg2cHsbUZYLWRK9ZIdzCdjmg7cz1LF9rtt6BR
   35QTg/47EEtv+kMB0itabHf2P1A8Sxth3zxnNeGlo6vjCS7hw5IZWo61w
   uNobvTZf0AkvaTs2629rzWMlY881AA5ABX5UFnS2QUBc+i9gEMHFDjot4
   /4E6zySEE8QSAq0s4Xjfb5pq+CrPc4DvqVkTwAxxngSVR9kxaAeb0wRsR
   nKwfDoa7jrwikfUSGBVgumv2rovBnlWjr71qFqKV4iprBjJEM4QK+FLnR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442262233"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="442262233"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 03:51:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774497149"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="774497149"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 03:51:50 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: [PATCH v2] media: cec: core: add note about *_from_edid() function usage in drm
Date:   Thu, 31 Aug 2023 13:51:44 +0300
Message-Id: <20230831105144.25923-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <7cebfea8f999d2d0d49533f9849d109830c5d1b6.1692884619.git.jani.nikula@intel.com>
References: <7cebfea8f999d2d0d49533f9849d109830c5d1b6.1692884619.git.jani.nikula@intel.com>
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

In the drm subsystem, the source physical address is, in most cases,
available without having to parse the EDID again. Add notes about
preferring to use the pre-parsed address instead.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

v2: rephrase comments, in particular indicate cec_s_phys_addr() should
be false (Hans)
---
 drivers/media/cec/core/cec-adap.c     | 5 +++++
 drivers/media/cec/core/cec-notifier.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 241b1621b197..1109af525c35 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1688,6 +1688,11 @@ void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
 }
 EXPORT_SYMBOL_GPL(cec_s_phys_addr);
 
+/*
+ * Note: In the drm subsystem, prefer calling (if possible):
+ *
+ * cec_s_phys_addr(adap, connector->display_info.source_physical_address, false);
+ */
 void cec_s_phys_addr_from_edid(struct cec_adapter *adap,
 			       const struct edid *edid)
 {
diff --git a/drivers/media/cec/core/cec-notifier.c b/drivers/media/cec/core/cec-notifier.c
index 389dc664b211..d600be0f7b67 100644
--- a/drivers/media/cec/core/cec-notifier.c
+++ b/drivers/media/cec/core/cec-notifier.c
@@ -195,6 +195,11 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
 }
 EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr);
 
+/*
+ * Note: In the drm subsystem, prefer calling (if possible):
+ *
+ * cec_notifier_set_phys_addr(n, connector->display_info.source_physical_address);
+ */
 void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
 					  const struct edid *edid)
 {
-- 
2.39.2

