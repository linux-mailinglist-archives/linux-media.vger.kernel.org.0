Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C378A70F50F
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 13:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234755AbjEXLYf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 07:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbjEXLYd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 07:24:33 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C099B
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 04:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684927472; x=1716463472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T37zhJKB4e66LpPhkTxLwBGgm7jXid3yGd7uYsZk+5c=;
  b=NyW6RIoBhXgaQdRE2UJSLBM2O9tXyKJCZWopZlxUY1OpgaiZx4MlT2Bh
   mi1E8TcL6C6h5BfBid0tiGG5AGs7muyedx21bOBPrvnr0tG9GH1xFLT0B
   F0pbIMvzBX8FOf2sid0Ed4PMiD8G2JOQZ02Erb6meanswZs4nFvrdkKtY
   6HAqm93XRkzZZCDj3WTIf4UuoquQU+f40TVADgHP6V5ol5ynEZD7KqwTX
   ogBQs+WXwOhBODVEPUXM9fxW42xAjeNeMiwTRARuvSajiT5K6HSjmMgrD
   YCv7onbTuccJgFUSfnODkrLCQwm3JdI1wVeMBoaSd7rX58KHewO+uo+Y1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356758165"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="356758165"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816540566"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="816540566"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:28 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 4AFE1121481;
        Wed, 24 May 2023 14:24:21 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q1mb1-008z6H-Mj; Wed, 24 May 2023 14:23:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se
Subject: [PATCH v3 07/32] media: v4l: async: Drop unneeded list entry initialisation
Date:   Wed, 24 May 2023 14:23:24 +0300
Message-Id: <20230524112349.2141396-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
References: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The list entry is initialised as a head in v4l2_async_register_subdev()
just before being added to the list. This isn't needed, drop the
initialisation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 320fe5cbaaf41..aef9a16e892ef 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -823,8 +823,6 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 
 	mutex_lock(&list_lock);
 
-	INIT_LIST_HEAD(&sd->async_list);
-
 	list_for_each_entry(notifier, &notifier_list, list) {
 		struct v4l2_device *v4l2_dev =
 			v4l2_async_nf_find_v4l2_dev(notifier);
-- 
2.30.2

