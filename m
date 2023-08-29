Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEF278BDD7
	for <lists+linux-media@lfdr.de>; Tue, 29 Aug 2023 07:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235781AbjH2FZA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Aug 2023 01:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235750AbjH2FYo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Aug 2023 01:24:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE05198
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 22:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693286681; x=1724822681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1f0RgzpA0h99w+S9RZCzdmHxXCKbrvYqy6tXUg+zwPg=;
  b=VoP7mkesHqmbr3Wd55NAg6DcjJNBV5UoK1ajqqj6JlZUWQ1sgn/pFJ8I
   9YFVOwoHGTmQtFj2q3P5mgIjm9OW/3CxoLWyWM/NtRxXSP1hOkT6sY6ZZ
   mVp+7h6fF+jo/TNJ2fBOy/6ArMfA8YslAEGb/cL0qtZxRfCFVl4yse4bD
   6p4JBT1do5SYWKffR6L8ErXumXN8Pijvtp45L7n8N2XlRuW3XuRn1S576
   6pfdymmaNRz3G2fr68qBPr+g/pTvmewWIvBQn1C0G0EoVXgva27NkWspN
   Z7PiEd9tPd3e4uyDx4Hur2JZIItGGc/0U8DkOasaGkciWjCsP9e1dzcdG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="354792623"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="354792623"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 22:24:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="688370918"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="688370918"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga003.jf.intel.com with ESMTP; 28 Aug 2023 22:24:39 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Cc:     zhifeng.wang@intel.com, Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v4 3/3] media: ivsc: ace: probe ace device after IPU bridge is initialized.
Date:   Tue, 29 Aug 2023 13:24:28 +0800
Message-Id: <1693286668-13055-4-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1693286668-13055-1-git-send-email-wentong.wu@intel.com>
References: <1693286668-13055-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

During probe ivsc ace device, acpi_dev_clear_dependencies() will be
called to clear the consumer and supplier relationship between camera
sensor device and ivsc device. But IPU bridge will setup the connection
swnodes for ivsc device and camera sensor device based on this consumer
and supplier relationship. This patch defers ivsc ace's probe to make
sure IPU bridge is initialized before this consumer and supplier
relationship between camera sensor device and IVSC device is cleared.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
---
 drivers/media/pci/intel/ivsc/mei_ace.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
index 7879f1f..627ec40 100644
--- a/drivers/media/pci/intel/ivsc/mei_ace.c
+++ b/drivers/media/pci/intel/ivsc/mei_ace.c
@@ -406,6 +406,9 @@ static int mei_ace_setup_dev_link(struct mei_ace *ace)
 	if (!csi_dev) {
 		ret = -EPROBE_DEFER;
 		goto err;
+	} else if (!dev_fwnode(csi_dev)) {
+		ret = -EPROBE_DEFER;
+		goto err_put;
 	}
 
 	/* setup link between mei_ace and mei_csi */
-- 
2.7.4

