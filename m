Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE1F26DC2E4
	for <lists+linux-media@lfdr.de>; Mon, 10 Apr 2023 05:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjDJDOx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Apr 2023 23:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbjDJDOv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Apr 2023 23:14:51 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E047A3ABE
        for <linux-media@vger.kernel.org>; Sun,  9 Apr 2023 20:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681096490; x=1712632490;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=omubxsXK/eOUZCgqLfodBjMeqUym9qI+Cu3Uf6rZ4PU=;
  b=ZEbXvzr2mojBksJomZtxtlUQB0DuP7C49j6197ukpzJ0SQHa4FWErO5j
   5ge68DO3sJiPgqqdwQGIq8mTyOAgULNHc/Z9xsnFgzY1OYRFkLKNXlD1w
   wQmPHO8aGh0xiiMdrpWJMwI1k99blvoifOv/3HwOmaRBlGuTZuLBZotNo
   6+TP4cfj/5uHxc3WC8AxqVhwIy0hAlcPA2Cd0TJ61035N7fP5Ld9gB5UY
   TXJL5IoTeLtVJ+XZMy+xZlSaw3+4NyRC/A/AUISedCAxJYwmcnRK2YCI7
   0UZCKfS1GRQNXDHa1eLW2tB76+v80gyYENCh5l96HDM2yxtq4QOyYhibB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="406104135"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="406104135"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 20:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="1017854034"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="1017854034"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga005.fm.intel.com with ESMTP; 09 Apr 2023 20:14:47 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, hdegoede@redhat.com,
        djrscally@gmail.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org
Cc:     bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v5 3/3] ACPI: delay enumeration of devices with a _DEP pointing to IVSC device
Date:   Mon, 10 Apr 2023 11:14:25 +0800
Message-Id: <1681096465-17287-4-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1681096465-17287-1-git-send-email-wentong.wu@intel.com>
References: <1681096465-17287-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
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
index 2743444..89368d7 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -796,6 +796,8 @@ static const char * const acpi_ignore_dep_ids[] = {
 /* List of HIDs for which we honor deps of matching ACPI devs, when checking _DEP lists. */
 static const char * const acpi_honor_dep_ids[] = {
 	"INT3472", /* Camera sensor PMIC / clk and regulator info */
+	"INTC1059",
+	"INTC1095",
 	NULL
 };
 
-- 
2.7.4

