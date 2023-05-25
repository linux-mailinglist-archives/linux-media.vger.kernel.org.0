Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C28DB710D8D
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 15:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241384AbjEYNri (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 09:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241388AbjEYNrg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 09:47:36 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71612191
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685022455; x=1716558455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JmlVsdU3JwPtMvchUp6p4gL42tdOeIS/+xhJUdhf9cE=;
  b=kIHU5rf+w83TWHkVAr+YYPFHMBe6SSAaaS2nBNjb2EKL/aNOiiggdGc/
   9BysO+jyc/vTi33pa22PFxwW/RrpsF/IEznO6JZI3zQU2tK8ixlxn3QZ2
   xFLpLYHc4bRk8G9k1wDQ7WFFnNNY64B14atal5uC4lbdajS9FGHrJe+GA
   TztWBcn1+qTF3clECwxak8y1DMmFVr0nDD0SzrD/aP+F6vWvX6sIlnuEh
   FDBMVNkK9sdLK0OBZUMroIQ+ej7/VhGRFQp3P0IccUNTQ8DGacYSze/Ru
   BHJfQWWFhxpMzKVWIorTMRqKnCjxSRlI+TvDJ/byCw67pE4kRqyn8YUcX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="440242927"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
   d="scan'208";a="440242927"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 06:47:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="794676393"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
   d="scan'208";a="794676393"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by FMSMGA003.fm.intel.com with ESMTP; 25 May 2023 06:47:31 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, hdegoede@redhat.com,
        djrscally@gmail.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org
Cc:     bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v7 3/3] ACPI: delay enumeration of devices with a _DEP pointing to IVSC device
Date:   Thu, 25 May 2023 21:47:14 +0800
Message-Id: <1685022434-24609-4-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1685022434-24609-1-git-send-email-wentong.wu@intel.com>
References: <1685022434-24609-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

