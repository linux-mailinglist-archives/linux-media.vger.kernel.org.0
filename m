Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF13B7A6106
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 13:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbjISLRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 07:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbjISLR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 07:17:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A95B8
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 04:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695122243; x=1726658243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fNdI/YoALkBJJRW8kjLvxbOS6A0J7uDXxbEHUzzEKCk=;
  b=QvKCNB3fbM3FI9Hv6ZhrcTzHjSLqN9W5gipozxpD8+ZxFCVDZPeCyqbd
   jisD9k5iuNA55z8xrSIXEj01VntAnOdKDQnsUNEyHDPG9tKVzhrQfozX4
   o331AR903J1s50Cgn9iPsFzZ+jDH9HDtyi9bqnLpnkn5I+N7WDeOpxcHo
   WOKTdEvawUPQ5JFCln/J38Q+5TXzR0jlYhdo5zrGQyjvsvnE35LM93vFQ
   5wR0/A2VxFaZcmCP3QAA5AQLSAjHrfXpPEpeF35jzvKpyl5vnuUnCRtGR
   7fWYnYUkdcyBgP1RAGkwQn7aGVy1DcGyS9ziek+DAymOWzGTS4Bv+XZWe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="383736950"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="383736950"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 04:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="781273100"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="781273100"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 04:17:20 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 68F04120C1C;
        Tue, 19 Sep 2023 14:17:17 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qiYhq-009pz2-23;
        Tue, 19 Sep 2023 14:15:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>,
        "Murphy, Paul J" <paul.j.murphy@intel.com>
Subject: [PATCH 1/4] media: ov9282: Orphan the driver
Date:   Tue, 19 Sep 2023 14:15:37 +0300
Message-Id: <20230919111540.2344757-2-sakari.ailus@linux.intel.com>
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
index 980b141856e1..9705557b39d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15862,10 +15862,8 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
 F:	drivers/media/i2c/ov8858.c
 
 OMNIVISION OV9282 SENSOR DRIVER
-M:	Paul J. Murphy <paul.j.murphy@intel.com>
-M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
 L:	linux-media@vger.kernel.org
-S:	Maintained
+S:	Orphan
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
 F:	drivers/media/i2c/ov9282.c
-- 
2.39.2

