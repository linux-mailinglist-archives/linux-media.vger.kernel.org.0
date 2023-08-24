Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0D587865CB
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 05:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239593AbjHXDVa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 23:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239592AbjHXDVN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 23:21:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DDE10EC
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 20:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692847271; x=1724383271;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DmqBpe08Pgv7cIdaf0JBksUgQV+tGrt7pMtVz+ETBfQ=;
  b=Fj3vTjKqIK8gL9roMCSIo6mCS0z4lNoeOESwedD76S5jMdKZ/jyJ1R+C
   9vFaa4fFNcyqYIbr/fB9HIgFnThR5q9CPBy11SrJEkfbmZLhPXv+W/0s3
   oIDxkmbvfIdASHym9ah1KEkKWrtbQPL8h78pKYNKJySXmnHeVWZa/NBKT
   mrUuKrOmcqooid2QOnZBI7FSqiKfseznxKiSCUlUc6PMe3mGrkjP3SjTO
   htAfmOfRdKA0+7ii7Pubsx4QU0C1hqHS1P5QqmxNSEkNpW47ysK3r3oCv
   lm/MsUhyTuzZns6HXmHXXI6U81LaRoQ2MYsxCFBH0JSnwvqpj1Ak/ZBlI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="354665523"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="354665523"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 20:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="826972904"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="826972904"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2023 20:21:09 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Cc:     Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v2 3/3] media: ivsc: ace: probe ace device after init IPU bridge
Date:   Thu, 24 Aug 2023 11:21:02 +0800
Message-Id: <1692847262-31790-3-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1692847262-31790-1-git-send-email-wentong.wu@intel.com>
References: <1692847262-31790-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Probe ivsc ace device after IPU bridge has been initialized.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
---
v2:
 - call put_device() if IPU bridge hasn't been initialized

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

