Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3094787438
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 17:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242094AbjHXPaZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 11:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242223AbjHXPaN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 11:30:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F6219BF
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 08:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692891010; x=1724427010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ezlFxE9HhmpFlSbpYo4MIz3IoIPSkWsZ3vj6z3UQC9E=;
  b=iSI5Y2TaM8TFOoUU7a5f23JKBFZzDqZHkdw/ZfSumqsC0f52xEJF/Dpw
   2IJApY5wKyY/Jq3iORYLEApTRpYKLsgQgRdJlhhBqEo3S/Wg2j7NiwdwM
   q4kgQvyBQLmkFSwz6YHwCpB2Nm9npC8Lmo6ki+yNlvkyUXzic5gcBTqFQ
   PAbUlF66+FLPGCbTSFYQJ61hAYkpjBUaoVpnmI8JWIOq0R2QUgds9rwWG
   hZ5g7EWw0MmpWGDJDg1yzxQdcXCJeKA82GYaNiySdHend4XDMV7wsqyIk
   AxuI/HSRLcMbmp0g5dAo1gFmIXQfuBciNj+qsD67GDhSijPvtzjwaWcqz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="374440797"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="374440797"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 08:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="851552172"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="851552172"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2023 08:13:53 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Cc:     zhifeng.wang@intel.com, Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v3 3/3] media: ivsc: ace: probe ace device after IPU bridge is initialized.
Date:   Thu, 24 Aug 2023 23:13:37 +0800
Message-Id: <1692890017-15858-3-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1692890017-15858-1-git-send-email-wentong.wu@intel.com>
References: <1692890017-15858-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
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
v3:
 - make commit message more clear

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

