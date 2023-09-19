Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 190587A6109
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 13:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbjISLR3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 07:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbjISLR2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 07:17:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25EB8E3
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 04:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695122243; x=1726658243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G7iSqvpybzcAGcoBPBNPAuOap8TPHKXeNufPgiEim/4=;
  b=Ef6gAW//NtjITOuzlMuYn51FnZJ35PjI+Yha3WAPqUx/8jYIu4FNx8m7
   bmBnRJfCFV80/FnndzejGW6Z3/Sk/OvwWGsRDkhPpin3aa25tvymWSKpN
   m6QPVbGHUqq1zzIyPvka6639MDmzQi1lmYakVdURdpGp9fRgHn9sRxlC8
   DmHhMrlLlXhMrNHTdMFn9rEhAMdKNRhr9qrbcE5bwlo6q47E40i5kPLuf
   lOHMbS4XjxQ6+70Htlt58i+EFSAJ+jVgddeDPp+4FKx2r8lOZvN9v9Te/
   Be81uxEqZ+5L40T8S/gnjpQZnNE9YiCYxPiULD8k3b4c3T37OKleMpXWj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="383736949"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="383736949"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 04:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="781273098"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="781273098"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 04:17:20 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 6E534120EC6;
        Tue, 19 Sep 2023 14:17:17 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qiYhq-009pzC-28;
        Tue, 19 Sep 2023 14:15:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>,
        "Murphy, Paul J" <paul.j.murphy@intel.com>
Subject: [PATCH 3/4] media: imx335: Orphan the driver
Date:   Tue, 19 Sep 2023 14:15:39 +0300
Message-Id: <20230919111540.2344757-4-sakari.ailus@linux.intel.com>
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
index 74d5656d62bf..311678b44d71 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20009,10 +20009,8 @@ F:	Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
 F:	drivers/media/i2c/imx334.c
 
 SONY IMX335 SENSOR DRIVER
-M:	Paul J. Murphy <paul.j.murphy@intel.com>
-M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
 L:	linux-media@vger.kernel.org
-S:	Maintained
+S:	Orphan
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
 F:	drivers/media/i2c/imx335.c
-- 
2.39.2

