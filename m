Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F384743A92
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 13:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbjF3LOI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 07:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232916AbjF3LNy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 07:13:54 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F6443C34
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 04:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688123624; x=1719659624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cEy6/SAvUVm0NMOWUFBFc3aWA48lpAETSD1n0tuDBGs=;
  b=HSH1exEN0xADj16SS1lTpU32waLZLk8dfNFAl9V4Tm9Dd9/EUsv/3TWB
   VwuxyiNFnnG2iZDTCFyb84IA8TaD4xJsTM4qBQINiWAyorrSi/dk1mvkw
   oGWReLVTXHuWxTFL5elRYJg2nCBE4VtSAUA+U7mDkc8c0Fj+7wdHk65Iz
   Q5tbhEAdd9/bgQyIabBnAHVBKyUhwyQ6/hMtZPaJzTY19xAbARVUQ1qfZ
   IW+CYxXUE6QHKs5sQC3CNQ6pqDi0NblzojA1wywb52zIgJs6GNF+btg9N
   65V/y+wj1nf4Drs46qjBwoG5x2BBPNjsO1YDX/PyLs+p5yDk6RKumaBXT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="448748059"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="448748059"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 04:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="891727910"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="891727910"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 04:13:25 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1A16D12022F;
        Fri, 30 Jun 2023 14:03:06 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 2/2] media: MAINTAINERS: Add documentation under V4L2 camera sensors
Date:   Fri, 30 Jun 2023 14:03:04 +0300
Message-Id: <20230630110304.98942-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630110304.98942-1-sakari.ailus@linux.intel.com>
References: <20230630110304.98942-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation related files under the camera sensor entry. Add the
word "CAMERA" to the subject as well since there are many other kinds of
sensors.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1fc59cd2fc0d..2d3f3c8f7689 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22117,7 +22117,7 @@ F:	drivers/media/v4l2-core/v4l2-fwnode.c
 F:	include/media/v4l2-async.h
 F:	include/media/v4l2-fwnode.h
 
-V4L2 SENSOR AND LENS DRIVERS
+V4L2 CAMERA SENSOR AND LENS DRIVERS
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -22132,6 +22132,8 @@ F:	drivers/media/i2c/st-vgxy61.c
 F:	drivers/media/i2c/dw*
 F:	drivers/media/i2c/ak*
 F:	drivers/media/i2c/lm*
+F:	Documentation/driver-api/media/camera-sensor.rst
+F:	Documentation/driver-api/media/tx-rx.rst
 
 VF610 NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
-- 
2.39.2

