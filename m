Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 714237D7E27
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 10:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344474AbjJZIN5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 04:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344502AbjJZINz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 04:13:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D21418D
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 01:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698308033; x=1729844033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vJLY/1L5v56XUJvnaiHx6jyXcY8wRIXV+M2kIO+DwEg=;
  b=n3CDscVzh7HbNQ5933Mgg06FuJFBwVipjFblI07HKZBIzG/mphvqOtRL
   1BmXzxtI98C1EBqNbEf6H6lbPCNZ5Geps4KeZ+R9msQUsY7GMsmMl8kvu
   lQRC7Wn+D7AHhAV2BzLir8p3eNZTAjpafENX4ZC3oOeTrUqKDFYGrJlhL
   790cMDWrndcnOLEFiGrUavV0QOpKI5d/k7saa7NClHSJBH9eA/llMtRkS
   VnOGoC9sFJgcv/EpLsX7U+A4i2UOr6v4QkcVN4aLPZQNe0kIkIpyX8IUu
   23wdDBoXV3/pRl08gf5XIcJDLSTPHD9bbIxiW9pTkj1jgoloultiFJYjp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="372530599"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="372530599"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829539028"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="829539028"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:13:50 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id AA54111FB9B;
        Thu, 26 Oct 2023 11:13:47 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     wentong.wu@intel.com, bingbu.cao@intel.com
Subject: [PATCH 2/6] media: ivsc: csi: Clean up V4L2 async notifier on error
Date:   Thu, 26 Oct 2023 11:13:42 +0300
Message-Id: <20231026081346.958238-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231026081346.958238-1-sakari.ailus@linux.intel.com>
References: <20231026081346.958238-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Clean up the V4L2 async notifier in error handling path, and add label to
unify handling.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Wentong Wu <wentong.wu@intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index b04847e30213..281d7f5e18f9 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -672,16 +672,20 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
 
 	asd = v4l2_async_nf_add_fwnode(&csi->notifier, fwnode,
 				       struct v4l2_async_connection);
+	fwnode_handle_put(fwnode);
 	if (IS_ERR(asd)) {
-		fwnode_handle_put(fwnode);
-		return PTR_ERR(asd);
+		ret = PTR_ERR(asd);
+		goto out_nf_cleanup;
 	}
 
-	fwnode_handle_put(fwnode);
-
 	ret = v4l2_async_nf_register(&csi->notifier);
 	if (ret)
-		v4l2_async_nf_cleanup(&csi->notifier);
+		goto out_nf_cleanup;
+
+	return 0;
+
+out_nf_cleanup:
+	v4l2_async_nf_cleanup(&csi->notifier);
 
 	return ret;
 }
-- 
2.39.2

