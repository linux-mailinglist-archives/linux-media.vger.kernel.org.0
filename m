Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4177D7E2B
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 10:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344513AbjJZIOA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 04:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344543AbjJZIN4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 04:13:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150BAB8
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 01:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698308035; x=1729844035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZiAxTeInixzod+aYp0uEmRKocOFn93NEgCj62HEtyPU=;
  b=GsRVNtgttmkpARB6NUMyzdECWVkOJknDbsb4n8mWKpo/q+LTMyce/EGz
   Y2I7lbprFI909jsNeezJ9XI9AvdWv07Yy9B6yY8u9K/wRwSNJucEIm3YT
   aN7qnimesmLLimM3Yo8st8M/e/lu1qGBsJWi7ypLR2Q394yoXjgQrYKsD
   MkmLABg9spVNzphwVRWk4dnPauoUNzra4nW1nB7UbdUloOkxcWACs+RwD
   Qsft5c9b0YWDzGgCW4W0c+7fuyb9Fo6lAo1DU63TbjfArFhZjra/PyLiY
   hnGGIhHpbkuCpp98hivjkc7BUR7CKs0GexeEhXe2hx5wYwyC7qP/7oY8M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="372530619"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="372530619"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829539092"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="829539092"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:13:53 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id BE8D9120EC5;
        Thu, 26 Oct 2023 11:13:49 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     wentong.wu@intel.com, bingbu.cao@intel.com
Subject: [PATCH 5/6] media: ivsc: csi: Don't mask v4l2_fwnode_endpoint_parse return value
Date:   Thu, 26 Oct 2023 11:13:45 +0300
Message-Id: <20231026081346.958238-6-sakari.ailus@linux.intel.com>
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

v4l2_fwnode_endpoint_parse already returns an error value, don't set
return value to -EINVAL.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Wentong Wu <wentong.wu@intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index c19c944f613b..07d8c7f82306 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -660,7 +660,6 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
 	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
 	if (ret) {
 		dev_err(dev, "could not parse v4l2 endpoint\n");
-		ret = -EINVAL;
 		goto out_nf_cleanup;
 	}
 
-- 
2.39.2

