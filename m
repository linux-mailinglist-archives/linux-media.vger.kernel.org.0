Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4A7C71FB14
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 09:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234398AbjFBHgI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 03:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234395AbjFBHfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 03:35:34 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF4610C6
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 00:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685691318; x=1717227318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JmlVsdU3JwPtMvchUp6p4gL42tdOeIS/+xhJUdhf9cE=;
  b=CxaZuSJpBPjz0p5/59tlOZ1UvERkt+9y6mN2TKaWp1prGWFUaozQyeLv
   6MJOxtnLk1Oo0UO7k/MCmgqYhz/YpxFy4+mpMUNHzI5JPJzm9YELwpHw9
   ecJZC2MsBI3kmJ8gufHlRJ2g7yLgn0SZNQWuT35CfEmuTpPAsrXelWN/8
   d0Ls63l/xoeZWTn8TbJSreKHQXUzwqTinAbLmGDBifX0NFiyUNPFhfIaT
   cz535ejnxMdaxYJZ3//yFjkgM0miGjp69vAZD+FEsn4etB2g34e1Smqis
   R/cqDj18PFv2IZWcdgEPrfOCMDC6UN21d+A1sIMDOxbkfx0w5JYOiceMe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="359102610"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="359102610"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 00:35:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="954366613"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="954366613"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga006.fm.intel.com with ESMTP; 02 Jun 2023 00:35:04 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, hdegoede@redhat.com,
        djrscally@gmail.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org
Cc:     bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v8 3/3] ACPI: delay enumeration of devices with a _DEP pointing to IVSC device
Date:   Fri,  2 Jun 2023 15:34:49 +0800
Message-Id: <1685691289-422-4-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1685691289-422-1-git-send-email-wentong.wu@intel.com>
References: <1685691289-422-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Inside IVSC, switching ownership requires an interface with two
different hardware modules, ACE and CSI. The software interface
to these modules is based on Intel MEI framework. Usually mei
client devices are dynamically created, so the info of consumers
depending on mei client devices is not present in the firmware
tables.

This causes problems with the probe ordering with respect to
drivers for consumers of these mei client devices. But on these
camera sensor devices, the ACPI nodes describing the sensors all
have a _DEP dependency on the matching mei bus ACPI device, so
adding IVSC mei bus ACPI device to acpi_honor_dep_ids allows
solving the probe-ordering problem by delaying the enumeration of
ACPI-devices which have a _DEP dependency on an IVSC mei bus ACPI
device.

On TGL platform, the HID of IVSC mei bus ACPI device is INTC1059,
and on ADL platform, the HID is INTC1095. So add both of them to
acpi_honor_dep_ids.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
---
 drivers/acpi/scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 2743444..04560e8 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -796,6 +796,8 @@ static const char * const acpi_ignore_dep_ids[] = {
 /* List of HIDs for which we honor deps of matching ACPI devs, when checking _DEP lists. */
 static const char * const acpi_honor_dep_ids[] = {
 	"INT3472", /* Camera sensor PMIC / clk and regulator info */
+	"INTC1059", /* IVSC (TGL) driver must be loaded to allow i2c access to camera sensors */
+	"INTC1095", /* IVSC (ADL) driver must be loaded to allow i2c access to camera sensors */
 	NULL
 };
 
-- 
2.7.4

