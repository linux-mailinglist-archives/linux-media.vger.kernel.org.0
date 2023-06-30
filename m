Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E750F743A93
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 13:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232888AbjF3LOG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 07:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232890AbjF3LNx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 07:13:53 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490143A87
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 04:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688123624; x=1719659624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6AtkEPwXbgzAaCEeWI5gU/0zv1sOEaVcDNiL7dKrtAg=;
  b=ervIoOwGJDEjoxoJ3JcEMk+U+701HAsVKL7Ghz6bNEeNWAPSWqXr2bgW
   sCiTdnuHX/JWo/RKxx08oU80fXjT+6gkWxaOWPCYv9AcAZk+QvhowM+mD
   xLofCEIlxqdqxB3eDWPhEkzqUHb0hsqjlG5Juklfnv/k/yHul318rOAZV
   AGbIx4jMXQOcUe1gQOhy3jygLprFA0MF0FCBuy3B5WppFmnbMm8EtifCn
   ldbVtC+TtG8jrthzeuOCyCIeZbqfqrtj8CPmgJVK683LdT69VwWGxLPke
   NEYvq3UzQKv1pgWjdz274mWqRdNiImwBSoHsKL2XzKOYVDmQL6KvFg18C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="448748057"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="448748057"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 04:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="891727908"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="891727908"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 04:13:25 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1121811FBBC;
        Fri, 30 Jun 2023 14:03:05 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 1/2] media: MAINTAINERS: Add entry for V4L2 async and fwnode frameworks
Date:   Fri, 30 Jun 2023 14:03:03 +0300
Message-Id: <20230630110304.98942-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630110304.98942-1-sakari.ailus@linux.intel.com>
References: <20230630110304.98942-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an entry for V4L2 async and fwnode frameworks, with myself as the
maintainer.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d9cf5b13c58e..1fc59cd2fc0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22107,6 +22107,16 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/clk/ux500/
 
+V4L2 ASYNC AND FWNODE FRAMEWORKS
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	drivers/media/v4l2-core/v4l2-async.c
+F:	drivers/media/v4l2-core/v4l2-fwnode.c
+F:	include/media/v4l2-async.h
+F:	include/media/v4l2-fwnode.h
+
 V4L2 SENSOR AND LENS DRIVERS
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.39.2

