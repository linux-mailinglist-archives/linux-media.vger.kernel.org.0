Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFE407B50B5
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 12:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236577AbjJBK4Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 06:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236583AbjJBK4W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 06:56:22 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E423BD3
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 03:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696244178; x=1727780178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sxJVLbUcA2jwkvTseWVtLTW0NJcaROa2Hxc8qvRHACg=;
  b=gi+/y+VjdpjOvJxW3oUAsUWPkMhGK8wbcqNZCMtUG6SdWeztICL3m6JF
   HK0RPSfLZ2SiM/REFCekxU57rUKE2A9vWXmbZzLLBJ8I7B6QZLeAuyePc
   DRATczHZF/1BHJ4YPiXdpQx1t0CLnu3gh9qmpT3EDV6mD3ZfTSvDhHZF0
   6jd2BNhTr+GUTQhaqLnOAItLVI9TwA7SfYZtiGm+whwCB8c5MPoMH0FSn
   WBFXzEeHvQhNOTpvzb8FH7FcvmLmNMCb12kUpXNSXS3c820SkoXwyZiiV
   gLGSiBo8GWA8Ozz4f4cJJ9GSDAR6750VR2vecDo4shSKMqkrdD0rOr1/o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="379896382"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="379896382"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="816251188"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816251188"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:15 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id BAE8C11F964;
        Mon,  2 Oct 2023 13:56:12 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v7 11/19] media: ccs: Drop re-entrant s_stream support
Date:   Mon,  2 Oct 2023 13:55:49 +0300
Message-Id: <20231002105557.28972-12-sakari.ailus@linux.intel.com>
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

The s_stream is called to enable and to disable streaming on a sub-device.
The caller may only call it to change the state, enabling streaming is not
allowed when it is already disabled, and similarly for disabling
streaming. Remove the check from the CCS driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 34f4f62a9523..2abfd5932e02 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1903,9 +1903,6 @@ static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
-	if (sensor->streaming == enable)
-		return 0;
-
 	if (!enable) {
 		ccs_stop_streaming(sensor);
 		sensor->streaming = false;
-- 
2.39.2

