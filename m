Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEC2E70F50C
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 13:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234708AbjEXLYd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 07:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232315AbjEXLYb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 07:24:31 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C293218E
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 04:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684927469; x=1716463469;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yhpKYjGoEwHsGjTCPG/ehbdB8TieQ36KdaSQjZ4ez64=;
  b=eyAAKBwhXGc7oD7399RTggCPIWCFbZ9fVmQKuFxq2sCK7oWXN/rqENGz
   Mnjd7fM5SLLpseyXB8lP57tqufr89J1idmFkJsN5chrj/FfpJiD9nuLiV
   1cn8ef/hMdCrsDLusMUmM3bLNpqGcb8eU/M3eLm5SppBiLle/KrIhrYI/
   rbHEadzkres8Fri6A48Qc/Xg+OtU4kffLgIMHahDxNTcypcu47BmYYf+J
   ZBekHIzYiDbC/BNKz+Ci0OZZwbio9bcbM6qV8MAqT/YIm7fq+T5Xmv97G
   EU377LZfaeBkdTgd7o8hAi+a/RvdHrAvF6KbVEFRS8J4XBeZfGDJM8bMo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356758126"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="356758126"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816540542"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="816540542"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:23 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 376B8121003;
        Wed, 24 May 2023 14:24:21 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q1mb1-008z68-K2; Wed, 24 May 2023 14:23:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se
Subject: [PATCH v3 04/32] media: omap3isp: Don't check for the sub-device's notifier
Date:   Wed, 24 May 2023 14:23:21 +0300
Message-Id: <20230524112349.2141396-5-sakari.ailus@linux.intel.com>
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

There's no need to check for a sub-device's notifier as we only register
one notifier (and one V4L2 device). Remove this check and prepare for
removing this field in struct v4l2_subdev.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/ti/omap3isp/isp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index f3aaa9e76492e..c2b222f7df892 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -2039,9 +2039,6 @@ static int isp_subdev_notifier_complete(struct v4l2_async_notifier *async)
 	}
 
 	list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
-		if (sd->notifier != &isp->notifier)
-			continue;
-
 		ret = isp_link_entity(isp, &sd->entity,
 				      v4l2_subdev_to_bus_cfg(sd)->interface);
 		if (ret < 0) {
-- 
2.30.2

