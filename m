Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 780157A7FC6
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 14:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235943AbjITMaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 08:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235947AbjITMaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 08:30:20 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D4E99
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 05:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695213014; x=1726749014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dZtPLs+7QP8uZkACpZEDrJodFfGF4YJDRhkYruC/fU0=;
  b=Z7uNyv8RDm0Jye/0uUd7hD0rVqkle3onQzkeD15V0xOiK2/0MJW8G2XQ
   Y5djl6d4bzOaxao1Ea21nDt/vYHnzOqOL5YzdqQUTozHaxHyskDd6dtjT
   HNXNxYG3RS18cZppSY6NbjTwOnnxok3sapFAEXPtvGKiGrUjCipPDH79a
   OpnE7ejQU38VIS+8EORKzHsYlj5/VdscO/oVBzPHQKihaBLvDHniP4KbX
   MZ7Z21ikqqWueDJsh587gD5pdZhnzJW3bVoFbTy1zwsEcr8UeMLpTeSez
   HqHbbu4bcEGvG6w5jly+HcoX5owNcqC9DWrElVy0ZYMGI6s1VW6HAwpIB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="446677913"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="446677913"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 05:30:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="740192132"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="740192132"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 05:30:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id C5EAD120B86;
        Wed, 20 Sep 2023 15:30:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qiwJt-00A0vJ-0X;
        Wed, 20 Sep 2023 15:28:41 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>,
        "Murphy, Paul J" <paul.j.murphy@intel.com>
Subject: [PATCH v2 1/1] media: ov9282: Assign maintenance to Dave
Date:   Wed, 20 Sep 2023 15:28:31 +0300
Message-Id: <20230920122831.2386821-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919111540.2344757-2-sakari.ailus@linux.intel.com>
References: <20230919111540.2344757-2-sakari.ailus@linux.intel.com>
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

The current maintainers won't be looking after this driver anymore. Dave
offered to take over the driver, assign maintenance to him.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 980b141856e1..d03a1428080f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15862,8 +15862,7 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
 F:	drivers/media/i2c/ov8858.c
 
 OMNIVISION OV9282 SENSOR DRIVER
-M:	Paul J. Murphy <paul.j.murphy@intel.com>
-M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
+M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-- 
2.39.2

