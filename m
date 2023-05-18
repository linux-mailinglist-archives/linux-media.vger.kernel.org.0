Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38683707D57
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 11:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbjERJyo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 05:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbjERJyl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 05:54:41 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672EE1A4
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 02:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684403679; x=1715939679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fMBv2kzV6d+mkNiEC0PyALCwZooKrkYbyU5t+4oaYuY=;
  b=Gvtz5+wdnKs033Kk8sSVEsWgyBSYGYuA6S3BHn2d9/LvEmAdLIaTpIx9
   Y6yCFfaer7bzJH2H9tZkXHClD81lzk7MhfCZAzgVyj+fvHznwp3pJ4cxD
   g8oqfGEId8/NPdRWhWNnP+S5nm9GBzEkbOoa+8D+7Y1h8AbOhRe43DgeC
   EdAeqzYpcliWZ0pByzt44oR6VNHISX9H6nrggU3neleC2RPsKQpsgCiZ5
   yNj4rc1i1t3XyCHNzx+ERLyDxTMPOloI/JD2aLS74b2BcQtNyZ8/x+u7u
   ohE229o1cXl6y9NR4aNrRF3PXbeuIje3stAksNEtzBq0KDQf15MoK4D1N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="438366471"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; 
   d="scan'208";a="438366471"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 02:54:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="791897256"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; 
   d="scan'208";a="791897256"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by FMSMGA003.fm.intel.com with ESMTP; 18 May 2023 02:54:37 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        dan.scally@ideasonboard.com
Cc:     wentong.wu@intel.com, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH 3/3] media: ipu3-cio2: rename ipu3-cio2-main.c back to ipu3-cio2.c
Date:   Thu, 18 May 2023 18:05:23 +0800
Message-Id: <20230518100523.1578703-3-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518100523.1578703-1-bingbu.cao@intel.com>
References: <20230518100523.1578703-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

cio2 bridge driver is moved out of ipu3, current ipu3 cio2 driver only has
1 source file, then we can rename the source file back to ipu3-cio2.c.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu3/Makefile                          | 2 --
 drivers/media/pci/intel/ipu3/{ipu3-cio2-main.c => ipu3-cio2.c} | 0
 2 files changed, 2 deletions(-)
 rename drivers/media/pci/intel/ipu3/{ipu3-cio2-main.c => ipu3-cio2.c} (100%)

diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
index 429d516452e4..98ddd5beafe0 100644
--- a/drivers/media/pci/intel/ipu3/Makefile
+++ b/drivers/media/pci/intel/ipu3/Makefile
@@ -1,4 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
-
-ipu3-cio2-y += ipu3-cio2-main.o
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
similarity index 100%
rename from drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
rename to drivers/media/pci/intel/ipu3/ipu3-cio2.c
-- 
2.40.1

