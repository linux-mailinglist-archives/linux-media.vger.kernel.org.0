Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 799737B688C
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 14:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbjJCMIh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 08:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232141AbjJCMIh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 08:08:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF84A6
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 05:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696334913; x=1727870913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=arXNYG/ECUwMl5Pg60n2hCKRDtenMSoSi8QL+LfWOmg=;
  b=kVe9hV17hEIOVSnWFVLtd8dGklPAi2/MedwVNcYf8axn+Wlo5YTTSdgr
   5XKfrnFYm4ou+pMcx9sir4bKnEk1Zl4VScqpQrdWJo3Ymq/2AEfkw+ROh
   qXLcy641rqVGY/qW/lynGDPX8hofnvIg60St0YfMsbd337Ux5+UU98Fqm
   jeSiC9yuQpyCcYA1RJv+q09z195+r8chzFgyO/zRWyeLEnSPUoIdN52/5
   l6At6I/i/eaRrTCtlammPCM6wLyK1eDmCEAN6FRdpcMaz89bL1awLt0F/
   YMUt1xhUcAOI/zRM58nyIL9K1TsQdx1Z1KHvIjCdqyNJyPpOPe7L+SdQi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="385681541"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="385681541"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="780285928"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="780285928"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:30 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 70EE0120A58;
        Tue,  3 Oct 2023 15:08:27 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v6 19/28] media: v4l: subdev: Add trivial set_routing support
Date:   Tue,  3 Oct 2023 15:08:04 +0300
Message-Id: <20231003120813.77726-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add trivial S_ROUTING IOCTL support for drivers where routing is static.
Essentially this means returning the same information G_ROUTING call would
have done.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index dd48e7e549fb..7d7028de581a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -894,6 +894,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		struct v4l2_subdev_krouting krouting = {};
 		unsigned int i;
 
+		if (!v4l2_subdev_has_op(sd, pad, set_routing))
+			goto do_vidioc_subdev_g_routing;
+
 		if (!v4l2_subdev_enable_streams_api)
 			return -ENOIOCTLCMD;
 
@@ -939,6 +942,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 					routing->which, &krouting);
 		if (rval < 0)
 			return rval;
+do_vidioc_subdev_g_routing:
+		;
 	}
 		fallthrough;
 
-- 
2.39.2

