Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1BF8766BFE
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 13:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234888AbjG1Lqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 07:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233259AbjG1Lqx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 07:46:53 -0400
Received: from mgamail.intel.com (unknown [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8522530FC
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 04:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690544812; x=1722080812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YZy8rHIWbY5mzOYUfJ50DROnXceYPF7DIc56Dd2QG7A=;
  b=CIjv6oSAMYw9muiVKesJd7V5hdFWvnHTvlRDob48cZo/gEZgOmgMavzs
   pyH3pS62VUJUQgU1ZCHFQDSL8Q75Y2ohNrdAh+xmvHY95GyDIFB4az5TA
   mz18H+yH53y0UVCyMD9HX7hJA8RQG/6QClYHK0O7/4TyUfT4apbOMCg4y
   s0Q1V2D17uVmw2A656eDz4xH/ApgCxe7K5NmIiRHg3/KuoNlA4HmEK95x
   9BBltmvpa+CEEaE+z98x/klpt4uNRWvKJr247AKPX41A2mIg+6Lb3DISZ
   A5xytyQRb6aSarZPD8VqFhsmh3+1SlSouDcEbjV+v8aCZEqSm1t7Dd+vC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434858354"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="434858354"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 04:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730713005"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="730713005"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 04:46:51 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 9BB0712023A;
        Fri, 28 Jul 2023 14:46:48 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qPLuX-004yNt-20;
        Fri, 28 Jul 2023 14:45:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH v3 1/2] media: MAINTAINERS: Add entry for V4L2 async and fwnode frameworks
Date:   Fri, 28 Jul 2023 14:45:22 +0300
Message-Id: <20230728114523.1185414-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728114523.1185414-1-sakari.ailus@linux.intel.com>
References: <20230728114523.1185414-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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
index 9bfd74da5335..d197ff52a653 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22282,6 +22282,16 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
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

