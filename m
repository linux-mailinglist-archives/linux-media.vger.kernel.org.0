Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA3D6D1504
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 03:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjCaB2F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 21:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjCaB2D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 21:28:03 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA909EB7F
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 18:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680226082; x=1711762082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=omubxsXK/eOUZCgqLfodBjMeqUym9qI+Cu3Uf6rZ4PU=;
  b=JCXbHWMbaEsha0guwZBXXYbDt2zppRC+Hxtcll8f2lkcqEMJsTu1dGFR
   VNQfcNWC6KJbFMvt3KyzRH0gEehbv+0ZUIP+r9ONkaWanwkFoVZ6HjSZ0
   pPQsQGMSvY17mcrvG19/pd1cLoWKAffWKmzI0wwSb0n1aLUf5yfG/omGp
   XgPndtWdSI/90TQdyj5F7h1rwxa1k1Pq2UBmAIwMbipoWQU7Iz8nFioQs
   8Jt5RUD/IwaptVFQQfn7UmMmDQ4IeOYVk4DDjeUiEY1RIVGHbBMdT2O44
   7tLh3pG6axMVFQDLCOpcTZXfKhgUJwJJHwW2Vevg8RGyn1puF2Wgtboj1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427602952"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="427602952"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 18:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="662239107"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="662239107"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga006.jf.intel.com with ESMTP; 30 Mar 2023 18:27:56 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, hdegoede@redhat.com,
        djrscally@gmail.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org
Cc:     bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v4 3/3] ACPI: delay enumeration of devices with a _DEP pointing to IVSC device
Date:   Fri, 31 Mar 2023 09:27:11 +0800
Message-Id: <1680226031-23163-4-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1680226031-23163-1-git-send-email-wentong.wu@intel.com>
References: <1680226031-23163-1-git-send-email-wentong.wu@intel.com>
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

