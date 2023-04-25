Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 635AA6ED9FD
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 03:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbjDYBos (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 21:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233147AbjDYBoa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 21:44:30 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A4833591
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 18:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682387069; x=1713923069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=omubxsXK/eOUZCgqLfodBjMeqUym9qI+Cu3Uf6rZ4PU=;
  b=bgLgyr1O9Ro4LUhGvt5ZN5IMt2rEv+WtVOB/u+bJuELWBwjrIGjYaKUY
   rgzPsPERs5ZDJ4B0OFJHeJ2e53qLjynFCZaVaiSw1hiWIJs0X5HsLtiHu
   1+xJwQ3P6UbJyPcKBcsLcQMATuAnL7WZkyXx3fpIkC1KT+R8ZxdrotugP
   9QipqwyachSaxxU+XWnZkFl9UPEuyQxNfl4q2TQqxewoO4Gxf1vKc+I6g
   4cV2e8XT4gMCXAMIVxZx8EMv4M9I1ivdOAg5QmaYJZFBeA+YcZzz/w/5A
   luPY+H7Y0rY5bQW05Pq16jjJBsDVxa/H7N3jELq+c5w3h2RKpOcjonHpi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="345375435"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="345375435"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 18:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="687152241"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="687152241"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga007.jf.intel.com with ESMTP; 24 Apr 2023 18:44:26 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, hdegoede@redhat.com,
        djrscally@gmail.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org
Cc:     bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v6 3/3] ACPI: delay enumeration of devices with a _DEP pointing to IVSC device
Date:   Tue, 25 Apr 2023 09:43:59 +0800
Message-Id: <1682387039-16674-4-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1682387039-16674-1-git-send-email-wentong.wu@intel.com>
References: <1682387039-16674-1-git-send-email-wentong.wu@intel.com>
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

