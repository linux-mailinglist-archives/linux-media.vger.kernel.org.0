Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E41B871088D
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 11:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240487AbjEYJRY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 05:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240330AbjEYJRT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 05:17:19 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4367195
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 02:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685006238; x=1716542238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X//KvChi1SrXJjDtK04rNY+u264lF/yjTheDI8aq1tQ=;
  b=Ahqsca74GzafwkYd2TwQ6hCIYsMGmN+jkpxJufQtvGgGJqgjwq4vc+tS
   mvMzd34aRn52bax+as1nJjzNM1Qbt7a3eypYlCZ/0lMgkVrEGErMYVfcF
   iMMsl5SlKTuDkraOMshJPPm6SXdYje9llv0BYSjGjjHQj8xMCy5mm4H7z
   m1+ghPld3C6jjli92/M0FZPsme/kavJ5dAFhfe6tvDX9KMM3hOxD+fgZy
   za6KzUJnntFrItO2m3C5LCTH4zQOX1cuDcR1PObvnqKV5SK2hYXQ0E68u
   eZPQ2RH5nn2jSXDZzqm0ofJ5VpW01GCoEpmumzKZczHo728ED+oTwgh/T
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333455851"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="333455851"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="879029128"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="879029128"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:10 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 89C95122FF6;
        Thu, 25 May 2023 12:16:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q2758-009kpc-DT; Thu, 25 May 2023 12:16:26 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: [RESEND PATCH v3 20/32] media: v4l: async: Try more connections
Date:   Thu, 25 May 2023 12:16:03 +0300
Message-Id: <20230525091615.2324824-21-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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

