Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F4476A9CD
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 09:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjHAHP7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 03:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbjHAHP5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 03:15:57 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28231173F
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 00:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690874157; x=1722410157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C7RocjlOO7HRdVv15FaWLBIcdaN3iWcPJbeCLxrTYZA=;
  b=m8rzpuH7XKl6LdPxuv8SPb0RjTkUtHbnLwYzEYQmRRl7Q/H6j1rzGrK4
   3XhQsiRzr2aJXhMlY/xqM4sCDom/62/F8zznw/8l6DC5hpQ5oTLfDoaoG
   zimV8VEajIfhXfDoG5AvM7iojK0ErGfMhWtYNdENlAzPfkGlwKfp01X8x
   aGpL8TZEU+e20R5sm43Ab/klfnBmCpUbb60G3yMVuzuAcHxSuHu8RQo9d
   Zuq+PbnrE/IZGwe2kuSh1aaMUU5PD7v+9XXE6KCPkji0AOPi0QQqVlaKI
   H00ayYGR4G+3fTvfrH0JxVAAr1zsxCWeMeQsR4mmVaBASTjwF9nwNZ0/M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="354150381"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="354150381"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 00:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763647417"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="763647417"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 00:15:54 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id AD8BC11F863;
        Tue,  1 Aug 2023 10:15:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qQjaQ-00DrAX-09;
        Tue, 01 Aug 2023 10:14:30 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 1/2] media: ccs-pll: Initialise best_div to avoid a compiler warning
Date:   Tue,  1 Aug 2023 10:14:29 +0300
Message-Id: <20230801071430.3302630-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801071430.3302630-1-sakari.ailus@linux.intel.com>
References: <20230801071430.3302630-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Initialise best_div local variable to avoid a compiler warning. The
warning was harmless though.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index fcc39360cc50..cf8858cb13d4 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -296,7 +296,7 @@ __ccs_pll_calculate_vt_tree(struct device *dev,
 	struct ccs_pll_branch_fr *pll_fr = &pll->vt_fr;
 	struct ccs_pll_branch_bk *pll_bk = &pll->vt_bk;
 	u32 more_mul;
-	u16 best_pix_div = SHRT_MAX >> 1, best_div;
+	u16 best_pix_div = SHRT_MAX >> 1, best_div = lim_bk->max_sys_clk_div;
 	u16 vt_div, min_sys_div, max_sys_div, sys_div;
 
 	pll_fr->pll_ip_clk_freq_hz =
-- 
2.39.2

