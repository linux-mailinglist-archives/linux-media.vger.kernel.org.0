Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB77A7D4EBF
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 13:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbjJXLVQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 07:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbjJXLVP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 07:21:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02182D7A
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 04:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698146473; x=1729682473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h/qN5ewvL24oaMpWLZF0PZxsA8uF091V9uG4gu10by8=;
  b=C9wN1tXfZlgLQWv1HxxeWZEOCaK+BEFtnZQdsRT3bI7mZEjN1ozndWhc
   FKIAi+wiXG0VLFMEJhUZW4eNlW1sFmhj9j6SGg1nzVr00G/1MvACFo1hO
   ZR643ymbtjObrsPAhLBdzOnvO1YkEO8p3MHy+uP3na3sIuihwJQNgiR+h
   xbt+TLBact/brZHda/63tq1jYzy70ldt/fSzuAUIs+XyWMpNVy5Nh0ZtF
   GjI7zU+t4FTjKlh3129TgXI7NqpefY8LWoYfihWPd4aKULZiC1mLVs2R5
   HhArInjRv31IMOS41rMafm7kYMLJo9AUjJ82Nc1CCIEl4y/JNlgAWn0HG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="473258814"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="473258814"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 04:21:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="762069948"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="762069948"
Received: from icg-kernel3.bj.intel.com ([172.16.126.174])
  by fmsmga007.fm.intel.com with ESMTP; 24 Oct 2023 04:20:57 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: [PATCH v2 13/15] MAINTAINERS: add maintainers for Intel IPU6 input system driver
Date:   Tue, 24 Oct 2023 19:29:22 +0800
Message-ID: <20231024112924.3934228-14-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024112924.3934228-1-bingbu.cao@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

Update MAINTAINERS file for Intel IPU6 input system driver.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2894f0777537..b4b0626d43d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10626,6 +10626,16 @@ F:	Documentation/admin-guide/media/ipu3_rcb.svg
 F:	Documentation/userspace-api/media/v4l/metafmt-intel-ipu3.rst
 F:	drivers/staging/media/ipu3/
 
+INTEL IPU6 INPUT SYSTEM DRIVER
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+M:	Bingbu Cao <bingbu.cao@intel.com>
+R:	Tianshu Qiu <tian.shu.qiu@intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/admin-guide/media/ipu6-isys.rst
+F:	drivers/media/pci/intel/ipu6/
+
 INTEL ISHTP ECLITE DRIVER
 M:	Sumesh K Naduvalath <sumesh.k.naduvalath@intel.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.42.0

