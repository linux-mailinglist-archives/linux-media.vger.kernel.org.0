Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 545D87049C4
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232212AbjEPJ4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbjEPJ4I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:08 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1603F2D6B
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230967; x=1715766967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+dk9h//KsCkpwmgAVr/VyMNvfmCPUrjKyXECXKPbLGI=;
  b=KD6B00IGgemEBAidxfNoFNoH9Ob9dlp6T022pwu3a30pOVkneuUaTUz0
   4KLPHzNV5EvDnGW7wlbtv6zS4yp+K7MA0PZBXzf5Hqt4YmteJdY5s2qn3
   mW5ggQ5Ho3s/Ah6y+/DIgFgTspqYD5fBC5q/Z+kKicVs0sGwiFjMPQvtL
   4zYj5kVI6QSUZU6wMmzoRYuSnQke1uuV+2dWJJmHySHJql8/DWVQvr4xK
   Jkwg9hSS+iSN6u+tLhMWMdn1Oi9sJN7U1LX/my2KsXso7+fTcX+NjXVbo
   n07R4FJsyY33GxlpP2beCkNYyo1LJ8heD8h++6NbNLPjcqo+7WMVYzMGJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601392"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601392"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931801"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931801"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:43 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 00428122901;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOx-002Z9t-Vz; Tue, 16 May 2023 12:55:27 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 06/31] media: v4l: async: Drop unneeded list entry initialisation
Date:   Tue, 16 May 2023 12:54:52 +0300
Message-Id: <20230516095517.611711-7-sakari.ailus@linux.intel.com>
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

The list entry is initialised as a head in v4l2_async_register_subdev()
just before being added to the list. This isn't needed, drop the
initialisation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 22c8c8a2a69dd..c2f1ab11cbcff 100644
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

