Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B20B2771BAD
	for <lists+linux-media@lfdr.de>; Mon,  7 Aug 2023 09:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjHGHlq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Aug 2023 03:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230324AbjHGHlm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Aug 2023 03:41:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED0D19AF
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 00:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691394085; x=1722930085;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KzzQjvhl3Smag4YaAUdL/EltcwtcMeuOnrrwke4Md1o=;
  b=MrdKUfhD+SHmcZH+JujMyWCNAF9VlHE6Z+nso4m8TLFXwQ1NfEAjWQzR
   qyr+wolZJgFrflQ6sV2XJI2IgWexyKJm5hrKkm3uOIF80VMH0laNY+fn6
   KL4i9zVe390HBcPU6o6a1rsMrtkGJ03KTkyANZeSSHu/mHNkiQb40wo7e
   sPvHAm3X6LcHXl5uei98Et6JlI6Li+edgu3I/5PFtEt/lRa41lEfTiTQy
   ZPROrRrlWnQBLgy/EfVicGATxKcIvUiy2trRs4dvdGONDBEz1jWNNeYx0
   wAbdWusH3SnY+O+dcJDb2ESLRHXPbK0PwDsOCMeJpJB76XQcfYzPjjk6J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="370476307"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="370476307"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 00:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="707755974"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="707755974"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 00:41:23 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 6C24C11FBE7;
        Mon,  7 Aug 2023 10:41:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qSurV-00ChlE-2a;
        Mon, 07 Aug 2023 10:41:09 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, wentong.wu@intel.com
Subject: [PATCH v2 1/1] media: ivsc: Improve Kconfig help text
Date:   Mon,  7 Aug 2023 10:40:59 +0300
Message-Id: <20230807074059.3028144-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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

Improve the Kconfig help text to convey the ACE is for changing camera
sensor ownership and CSI for configuring the CSI-2 rx and tx.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Reworded most of the help text.

 drivers/media/pci/intel/ivsc/Kconfig | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/Kconfig b/drivers/media/pci/intel/ivsc/Kconfig
index 9535ac10f4f7..ec4ade92f583 100644
--- a/drivers/media/pci/intel/ivsc/Kconfig
+++ b/drivers/media/pci/intel/ivsc/Kconfig
@@ -7,6 +7,12 @@ config INTEL_VSC
 	help
 	  This adds support for Intel Visual Sensing Controller (IVSC).
 
-	  Enables the IVSC firmware services required for controlling
-	  camera sensor ownership and CSI-2 link through Image Processing
-	  Unit(IPU) driver of Intel.
+	  The IVSC support is split into two devices, ACE (Algorithm
+	  Context Engine) and CSI (Camera Serial Interface), each of which
+	  have their own drivers. The ACE is used to select the ownership
+	  of the sensor between the IVSC and the host CPU while the CSI is
+	  used to both select the routing destination for the data the
+	  sensor transmits over the CSI-2 bus between the IVSC and the
+	  host CPU and to configure the CSI-2 bus itself.
+
+	  The modules will be called ivsc-ace and ivsc-csi.
-- 
2.39.2

