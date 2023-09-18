Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5E87A4A21
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 14:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241508AbjIRMwH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 08:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241991AbjIRMwD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 08:52:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4452C7
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695041509; x=1726577509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8cbVggliCMljz4AR3Wi4DOr+gzhqEOMJDtqBOtP9z5Y=;
  b=hcVO/w/ovanW2T7lP/1RJb/+qR0GyM3RshUPNtC5H9eAXA5Rgx934G/t
   oxdOGDzj8nCwYxtF/wSAxyWQr22SphNVjucXO5/Y62+s/YkPcu3jh4D6a
   j+7VjoEPOJP6nxDUF/m+bpjtrkeSegi+lDwMYzMK4s76Ce8dRyBYC1Pab
   iPY1q67QEG+cH3sefdKPx3rXv2+IQjFSqIvHUJXliKpdWruKEIQCI11Mp
   I6uXPbk9AvGdGBT8NALMnOEB1UBjdbwLqpTldK978KrY9IuCCEzCBShWq
   e7sUm/ZxPn5d+434OapRg8fgycVuv8ZIXCJAOHXnjh4B0PldXUxnRCV4p
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="364688938"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="364688938"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 05:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="836005437"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="836005437"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 05:51:45 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 877D711FC2C;
        Mon, 18 Sep 2023 15:51:42 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v2 03/12] media: ccs: Correctly initialise try compose rectangle
Date:   Mon, 18 Sep 2023 15:51:29 +0300
Message-Id: <20230918125138.90002-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Initialise the try sink compose rectangle size to the sink compose
rectangle for binner and scaler sub-devices. This was missed due to the
faulty condition that lead to the compose rectangles to be initialised for
the pixel array sub-device where it is not relevant.

Fixes: ccfc97bdb5ae ("[media] smiapp: Add driver")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 49e0d9a09530..6f8fbd82e21c 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3097,7 +3097,7 @@ static int ccs_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		try_fmt->code = sensor->internal_csi_format->code;
 		try_fmt->field = V4L2_FIELD_NONE;
 
-		if (ssd != sensor->pixel_array)
+		if (ssd == sensor->pixel_array)
 			continue;
 
 		try_comp = v4l2_subdev_get_try_compose(sd, fh->state, i);
-- 
2.39.2

