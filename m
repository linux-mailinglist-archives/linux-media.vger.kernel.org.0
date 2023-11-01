Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 354567DDED3
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 10:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232529AbjKAJ5l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 05:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjKAJ5k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 05:57:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3F6F3
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 02:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698832654; x=1730368654;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oPnhfWFVIE26OZVtCEmKbmJ6bKgGjUESNXp9jE6PoT8=;
  b=JvNCbRSCTGpRxhOeKEFAEZy/4sYbGGURnS2wZnvhNVjpSKqpHNJXb3lz
   lIoQDhKZu3LzhACT9y6loCyli8rKboxgY5KRoz4ltIPyjvCJae2NFIHNx
   mMLNolw4ahrie+6aaTHmuWXOOIcdcQPIoLqNJKUme4/e8gs7SdgGeYMql
   AIeXIzBlQ72s3aI7bI/z4it7iDcYRg7jYrrlzJrIdLTFIpyh2kID8O3EH
   nyzYzb+mgRkZkWv0+c1Ly8Z2nGapdFxNs7PEUCZXZ3EsvI57CdOip0/Q1
   tJ2AxCXv3VYMh8VOGPURe+u5rBPg1vOU4e5wFxHTtEFxTBmHRtEg//DRa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="454943980"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="454943980"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 02:57:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="8614759"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 02:57:33 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id F077B1207A3
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 11:51:24 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qy7ra-005uma-2y
        for linux-media@vger.kernel.org;
        Wed, 01 Nov 2023 11:50:14 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: v4l: fwnode: Parse MIPI DisCo for Imaging properties
Date:   Wed,  1 Nov 2023 11:50:04 +0200
Message-Id: <20231101095004.1409904-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Parse MIPI DisCo for Imaging properties "mipi-img-lens-focus" and
"mipi-img-flash-leds" for VCMs and flash LEDs.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com> --- This patch
is related to the MIPI DisCo for Imaging support patchset here:
<URL:https://lore.kernel.org/linux-acpi/CAJZ5v0jteOR-tY91qUsXUmWvxWYCavUBBxa=zc_a2hN+Udn7pQ@mail.gmail.com/T/#t>
but does not depend on it.

 drivers/media/v4l2-core/v4l2-fwnode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 7f181fbbb140..89c7192148df 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -1179,7 +1179,9 @@ v4l2_async_nf_parse_fwnode_sensor(struct device *dev,
 	static const char * const led_props[] = { "led" };
 	static const struct v4l2_fwnode_int_props props[] = {
 		{ "flash-leds", led_props, ARRAY_SIZE(led_props) },
-		{ "lens-focus", NULL, 0 },
+		{ "mipi-img-flash-leds", },
+		{ "lens-focus", },
+		{ "mipi-img-lens-focus", },
 	};
 	unsigned int i;
 
-- 
2.39.2

