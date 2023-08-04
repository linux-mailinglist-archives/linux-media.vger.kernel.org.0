Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2819876FF08
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 12:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbjHDK4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Aug 2023 06:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbjHDKzm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Aug 2023 06:55:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E741658B
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 03:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691146397; x=1722682397;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fuP6feR5XV7OB8S5r878/E50jQsJh8P16ulU4ofsB3Y=;
  b=FXIrq5MrociR7P8YMLixZMX5P5osIwlu2q5cXoMGJmsRG1IMaEoOshZK
   IDOBdpXNCz/gOyMJj/1ydWaLaaVJb3YkwGF3WFGl9V7ezIs7zorYSi+ou
   XBtJTZXfVYSv1uMevXmsujgb943R21JXxJT3u7ebgoFCjS8lz0Kw6HzpQ
   0V12w6Bm5YUuY9xQgsz260RoFTbfiEx1zSi9n8sOpgXfboVwpO8b0gXKl
   fbmXsUlfZI9DW45WC2C0BIQVlwfeiSEr6IdyqpegCBn43IDlHeMo83+vZ
   PraGKhmXZoDiJWmIdaDsTD29lffYk/WDeUTdldARjSwmbF1MkZBjViY4L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="436447935"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="436447935"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 03:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="903865870"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="903865870"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 03:52:49 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 121A7120356;
        Fri,  4 Aug 2023 13:52:42 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qRsQ8-00CgHl-1L;
        Fri, 04 Aug 2023 13:52:36 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, wentong.wu@intel.com
Subject: [PATCH 1/1] media: ivsc: Improve Kconfig help text
Date:   Fri,  4 Aug 2023 13:52:26 +0300
Message-Id: <20230804105226.3022473-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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
 drivers/media/pci/intel/ivsc/Kconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/Kconfig b/drivers/media/pci/intel/ivsc/Kconfig
index 9535ac10f4f7..e9d94dbb4305 100644
--- a/drivers/media/pci/intel/ivsc/Kconfig
+++ b/drivers/media/pci/intel/ivsc/Kconfig
@@ -8,5 +8,9 @@ config INTEL_VSC
 	  This adds support for Intel Visual Sensing Controller (IVSC).
 
 	  Enables the IVSC firmware services required for controlling
-	  camera sensor ownership and CSI-2 link through Image Processing
-	  Unit(IPU) driver of Intel.
+	  camera sensor ownership between IVSC and host CPU (ACE) as well
+	  as configuring the CSI-2 link (CSI) towards the Image Processing
+	  Unit (IPU) driver of Intel.
+
+	  The modules will be called ivsc-csi and ivsc-ace.
+
-- 
2.39.2

