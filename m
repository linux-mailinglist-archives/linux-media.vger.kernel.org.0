Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2442787115
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 16:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241391AbjHXOHp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 10:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241497AbjHXOHa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 10:07:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E981BC5
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 07:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692886046; x=1724422046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WYkKliAIpnhRBVXSb8JWcRGsrs+g6bzM7M2ZTfuxNpA=;
  b=Kc7mw/y8tUQM5C5Hk/OE7XbBnvkyP09IZGTHpXvYDguU98aNftNyRlUB
   eGmAwzU+Yhfb+YGELFri/I5P6MxT9Iu88+84VeZuLIHu4m4LMVjP4DUyt
   k1IIsl+C8yUS4aR/Ylbq0M5kx6XKQRHGgwF7iJnPuNsKoq99wmwl5lzeV
   2ICcVVL5qOp8uXQ79xIutrJYmjLMmfdsnV1EG06T96HGThumoKhUJAxpm
   KVAc6F0FoAu2nr/+ePbkUgBT+1lz3FhpdtlQ8BJ88pVWRlXKCftttf78M
   7QLnlK7BvnGXLtLy7BJ5zEw6h0WUMBxCCA+qOOpbsshqYrTCP2xsJx3oI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364633800"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="364633800"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="766545232"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="766545232"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:46:27 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 3/6] drm/edid: parse source physical address
Date:   Thu, 24 Aug 2023 16:46:04 +0300
Message-Id: <8c6b6403932536b6849e0b44e1ee6e7ebdbe4a69.1692884619.git.jani.nikula@intel.com>
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

CEC needs the source physical address. Parsing it is trivial with the
existing EDID CEA DB infrastructure.

Default to CEC_PHYS_ADDR_INVALID (0xffff) instead of 0 to cater for
easier CEC usage.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 5 +++++
 include/drm/drm_connector.h | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1dbb15439468..39dd3f694544 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -29,6 +29,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cec.h>
 #include <linux/hdmi.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
@@ -6192,6 +6193,8 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
 
 	info->is_hdmi = true;
 
+	info->source_physical_address = (db[4] << 8) | db[5];
+
 	if (len >= 6)
 		info->dvi_dual = db[6] & 1;
 	if (len >= 7)
@@ -6470,6 +6473,8 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	info->vics_len = 0;
 
 	info->quirks = 0;
+
+	info->source_physical_address = CEC_PHYS_ADDR_INVALID;
 }
 
 static void update_displayid_info(struct drm_connector *connector,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index d300fde6c1a4..40a5e7acf2fa 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -816,6 +816,14 @@ struct drm_display_info {
 	 * @quirks: EDID based quirks. Internal to EDID parsing.
 	 */
 	u32 quirks;
+
+	/**
+	 * @source_physical_address: Source Physical Address from HDMI
+	 * Vendor-Specific Data Block, for CEC usage.
+	 *
+	 * Defaults to CEC_PHYS_ADDR_INVALID (0xffff).
+	 */
+	u16 source_physical_address;
 };
 
 int drm_display_info_set_bus_formats(struct drm_display_info *info,
-- 
2.39.2

