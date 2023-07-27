Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3121B764827
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 09:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbjG0HMh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 03:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232457AbjG0HMQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 03:12:16 -0400
Received: from mgamail.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA195B81
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 00:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690441615; x=1721977615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZsK0PZcsb5/Qm0U54XP5ljMSX638LtUlH/9Tshaf3TI=;
  b=kNIX+001ju87xxf2fw0pafb8WsJxN5kwB72q0qljG3iksKiWL2yesMU8
   JXbNHfdjpVPgRy9pyi6UVADD10EsXYxbmNqEQfuGsYvnIu7+6SGFJmmix
   bjaV3U6FC5lQEJ9tv7HPOeeh0o6PmOqd9a05WDKtBd2iMSTLKO46YUgID
   xwtyK0yt4NxBlLD0P3vDrkWOwGAQaxuA79jgqXMp30Xnf1K9fHJ6VM6HG
   Cuo+imOqKcDYlBxal4uvnN1xDGHxsb6LVW0amVsD8c7irQoXjL2XxAQ5X
   n2jUPBS9cDvReJNKrrkPiVkgfEpZEqmeXZk6Ad75sbejzcnjNNhb+tLSq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370901012"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="370901012"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 00:05:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="704073260"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="704073260"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga006.jf.intel.com with ESMTP; 27 Jul 2023 00:04:58 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: [PATCH 13/15] MAINTAINERS: add maintainers for Intel IPU6 input system driver
Date:   Thu, 27 Jul 2023 15:15:56 +0800
Message-Id: <20230727071558.1148653-14-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230727071558.1148653-1-bingbu.cao@intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
index d516295978a4..e09385e090f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10517,6 +10517,16 @@ F:	Documentation/admin-guide/media/ipu3_rcb.svg
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
2.40.1

