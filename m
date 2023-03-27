Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB6416C9B58
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 08:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjC0GX3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 02:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232043AbjC0GX2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 02:23:28 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47324498
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 23:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679898207; x=1711434207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Js6jR9XRpSnDab+kxhJKTV5SNs3bQwUI7RevwDBPJlw=;
  b=n4FqRA3bO9Oluo9i97JJOdNGHFTAnX5rx5nOsDo7SuHBXY53W6uHl6Sm
   0cUG/+IdXm72rEOiO1VAqEIEg654zRldtYNDa51mHXvTRRHlguCZS+UJr
   TEIMyQdxjeWPXj3xY36DshtkGcck2djgyOuZnRddjM8qa/Dm2KMoIChUG
   JQ5iE6stqCiHm73EDhxbxQIvmci5TAjzRbeqAA5etGHhhWyiTvabo+aw3
   R0tYpKtTesLkveNkwk27y1kny1Ng7IHemSnuLKkdhDupiHx4PjyQjNSR7
   UT0wNw+FjHWnClj2oWyS7SAsaAVxjmWxklGvnWjWX2muPZ0o1Hx5MjIbI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="402785965"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="402785965"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 23:23:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="929352324"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="929352324"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga006.fm.intel.com with ESMTP; 26 Mar 2023 23:23:25 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, hdegoede@redhat.com,
        djrscally@gmail.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org
Cc:     bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v3 3/3] ACPI: delay enumeration of devices with a _DEP pointing to INTC1059 device
Date:   Mon, 27 Mar 2023 14:23:08 +0800
Message-Id: <1679898188-14426-4-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Inside IVSC, switching ownership requires an interface with two different
hardware modules, ACE and CSI. The software interface to these modules is
based on Intel MEI framework. Usually mei client devices are dynamically
created, so the info of consumers depending on mei client devices is not
present in the firmware tables.

This causes problems with the probe ordering with respect to drivers for
consumers of these mei client devices. But on these camera sensor devices,
the ACPI nodes describing the sensors all have a _DEP dependency on the
matching INTC1059 ACPI device, so adding INTC1059 to acpi_honor_dep_ids
allows solving the probe-ordering problem by delaying the enumeration of
ACPI-devices which have a _DEP dependency on an INTC1059 device.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
---
 drivers/acpi/scan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 2743444..5b48dcd 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -796,6 +796,7 @@ static const char * const acpi_ignore_dep_ids[] = {
 /* List of HIDs for which we honor deps of matching ACPI devs, when checking _DEP lists. */
 static const char * const acpi_honor_dep_ids[] = {
 	"INT3472", /* Camera sensor PMIC / clk and regulator info */
+	"INTC1059",
 	NULL
 };
 
-- 
2.7.4

