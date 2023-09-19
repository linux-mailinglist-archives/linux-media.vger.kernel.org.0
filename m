Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E25B7A6107
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 13:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbjISLRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 07:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbjISLR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 07:17:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5963A9
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 04:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695122243; x=1726658243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ShLOPPVhx7ByHWiyTSHsmL5p7VKweZJSjU+TdGax5JM=;
  b=bk7pCqw8n1xbTVN2S4HRd6y+ZU+b1Zb0QPgaWcomGyzvSue6fpTm5ebY
   Z8Hj6fMLlQ+ukqu0MGWIlAOLIroaJAPoHM0MGLLhpBMtKR+lwnl1aj1HL
   OmOQai/6Sh5ukiCHL+q5+zUD4R+p9ns9UDqUR/7qCsVEmsMJ0eURWjteb
   HWq50yLq0WWUQ9YZMFMsMuojGtvityvixFClqKlJPoeiYBp06Gg/LlW+G
   ADpeDIlSHIYrjryJrv4Q/LMZEpbS6g63GkwDUBTjphJIXBTbY8ynT2Uwt
   M6pIHYCeWArOpg1ixE0p8Jpmeq6f6Dlw5hiOQwUi6JoIuFQY+h6dYzvWM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="383736951"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="383736951"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 04:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="781273103"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="781273103"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 04:17:20 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 71C0A121380;
        Tue, 19 Sep 2023 14:17:17 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qiYhq-009pzH-2B;
        Tue, 19 Sep 2023 14:15:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>,
        "Murphy, Paul J" <paul.j.murphy@intel.com>
Subject: [PATCH 4/4] media: imx335: Orphan the driver
Date:   Tue, 19 Sep 2023 14:15:40 +0300
Message-Id: <20230919111540.2344757-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919111540.2344757-1-sakari.ailus@linux.intel.com>
References: <20230919111540.2344757-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current maintainers won't be looking after this driver anymore. Mark
it orphan.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 311678b44d71..5a4b68cfad21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20000,10 +20000,8 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/imx319.c
 
 SONY IMX334 SENSOR DRIVER
-M:	Paul J. Murphy <paul.j.murphy@intel.com>
-M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
 L:	linux-media@vger.kernel.org
-S:	Maintained
+S:	Orphan
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
 F:	drivers/media/i2c/imx334.c
-- 
2.39.2

