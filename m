Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5192C7B50B3
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 12:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236578AbjJBK4V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 06:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236573AbjJBK4U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 06:56:20 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC60B4
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 03:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696244178; x=1727780178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7aSg3i5ZT/aTQHp/wUVYiLZFTim+j7k3m9FRGnaOX4k=;
  b=Sq4FcdGtVVfw5TkiV1MJGNdagtuZmNLfSvpYMWlGncfavPY+LOS1qYB2
   XR/RjqxnMiljM07VyCj4jb1at5z5zDLeSDHI2S0qnYhmbUAHjFhnlJ+5S
   GldvR9iDoxuWbaevGL6P2IDitnYSe7iVQYXnr8dpJccDJQvmiHkpacJjQ
   YvVYn5aODHqiXiwbkTc6fmIeDfgdcxViPxlhEAOLLCB6MskPozjDZ8vDm
   jwHLvfULRDE1jm+85p7hff4q9uNVIHcX+sfdj4zZNdYtGhhe3CRehof6Z
   ZZ/EKFf6J9efuha16ktjXKISk5TjgwyD+b/n37RjAuJVeiCkIOVRKH/vp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="379896373"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="379896373"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="816251183"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816251183"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:14 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 9C4BB11F94F;
        Mon,  2 Oct 2023 13:56:11 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v7 10/19] media: ccs: Partially revert "media: i2c: Use pm_runtime_resume_and_get()"
Date:   Mon,  2 Oct 2023 13:55:48 +0300
Message-Id: <20231002105557.28972-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
References: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ccs_pm_get_init() depends on the return values > 0 of
pm_runtime_get_sync(), thus it can't use pm_runtime_resume_and_get().
There's even a comment in the driver on this, a few lines above the code.

Fixes: aa0adb399d09 ("media: i2c: Use pm_runtime_resume_and_get()")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index c6853622946b..34f4f62a9523 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1873,9 +1873,9 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
 	 * relies at the returned value to detect if the device was already
 	 * active or not.
 	 */
-	rval = pm_runtime_resume_and_get(&client->dev);
-	if (rval)
-		return rval;
+	rval = pm_runtime_get_sync(&client->dev);
+	if (rval < 0)
+		goto error;
 
 	/* Device was already active, so don't set controls */
 	if (rval == 1)
-- 
2.39.2

