Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63B0F7049CA
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbjEPJ4P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbjEPJ4L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:11 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215B330C1
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230969; x=1715766969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ayiafxamIEw1H2j9dw1nj59ntxEEvt38MnHVAZ1WLhQ=;
  b=ezx7Drm3vAGSXf5iEVFXyXXLCnfZpuGwDycA2PpiVWwvBMxsgIWhbyhk
   AZLsVvtALH0Leo+8akXOM07ndgMRNU0v5X+nBvIFLw7THTeQgVrbu4PTP
   3QhLCwxUWUWVKjq4Uf4WD5t01j4pBlc7pQDhBMB2485VisfWKws/zxd7h
   dXeQg+Z5OZLlkX9qGPO4JMX/aqOj2Ij+NtKMEchKL5ctB5aAabYPdy1fI
   VlsakKLlQEAt4J1hHGLewd3WDz9lcTKkNwh2qraRnARDLkLyfjrvaq9Zw
   eoJF11LDQt9hyE27LE7H2o7Cg/dxB5tdJumYUiPiSBnK4AfsACL6ZLPdE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601410"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601410"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931805"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931805"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:43 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 05967122C11;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOy-002Z9w-0W; Tue, 16 May 2023 12:55:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 07/31] media: v4l: async: Don't check whether asd is NULL in validity check
Date:   Tue, 16 May 2023 12:54:53 +0300
Message-Id: <20230516095517.611711-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
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

The callers do pass a non-NULL asd to v4l2_async_nf_asd_valid() already.
There's no need for the NULL check here.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index c2f1ab11cbcff..90df68ea65df6 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -552,9 +552,6 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 {
 	struct device *dev = notifier_dev(notifier);
 
-	if (!asd)
-		return -EINVAL;
-
 	switch (asd->match_type) {
 	case V4L2_ASYNC_MATCH_I2C:
 	case V4L2_ASYNC_MATCH_FWNODE:
-- 
2.30.2

