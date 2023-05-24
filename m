Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA9770F520
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 13:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232621AbjEXLZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 07:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjEXLZO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 07:25:14 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 497D5198
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 04:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684927499; x=1716463499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X//KvChi1SrXJjDtK04rNY+u264lF/yjTheDI8aq1tQ=;
  b=V9tO6s89634VvgpJnHZLvHQfoZ7lIi6Osrwh9KneuN8ER2zhGP++zyD/
   0ZZXsCrMAKLg090tCnVLgt1MRH7SiI+GzKfhntZVNMDzADR/fAJO0k1QO
   T0VLIVJVSpxJ9SQB/CL7Y/5utGNF2chQMyg+Oz2PPteQfdmidXlD1zI4M
   DtlesvBzXQS0y9ZSz3pviBhezRBCsbZwCG+D8ztWWSoBin6xiu31Cjvp3
   ZqcNaRlUm4OUFv1wPuhW+vyYUWKdmCDfI3qPYKNAN8LMDSi4SgCJn6KHP
   49YxdiKqUG4JZFdZ0AnXo6fnJZgt42KNrjWnq6rZWHZe9vnFpTmvfSU9w
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356758305"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="356758305"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816540615"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="816540615"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:33 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id A2D2D122FF3;
        Wed, 24 May 2023 14:24:21 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q1mb2-008z77-2M; Wed, 24 May 2023 14:24:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se
Subject: [PATCH v3 20/32] media: v4l: async: Try more connections
Date:   Wed, 24 May 2023 14:23:37 +0300
Message-Id: <20230524112349.2141396-21-sakari.ailus@linux.intel.com>
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

When an async sub-device is registered, it used to be that the first one
of its connections were matched when found. Continue looking for matches
until a notifier no longer has any.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index e6d9109049cc4..740f2a0de78ff 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -789,6 +789,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 		if (!v4l2_dev)
 			continue;
 
+again:
 		asc = v4l2_async_find_match(notifier, sd);
 		if (!asc)
 			continue;
@@ -801,13 +802,12 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 		if (ret)
 			goto err_unbind;
 
-		goto out_unlock;
+		goto again;
 	}
 
 	/* None matched, wait for hot-plugging */
 	list_add(&sd->async_list, &subdev_list);
 
-out_unlock:
 	mutex_unlock(&list_lock);
 
 	return 0;
-- 
2.30.2

