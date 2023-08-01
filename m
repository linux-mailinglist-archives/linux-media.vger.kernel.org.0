Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9223576A9CC
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 09:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbjHAHP6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 03:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjHAHP5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 03:15:57 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0E3173D
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 00:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690874156; x=1722410156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e1FsYnCQub5yUOF9m+JkrOk6M+bBYhYeUClfCR9nkDA=;
  b=XFGI9Zha6hn+WKoZOPj7kgaCofD0oQVU0KJNI9UxT0XUmb7onkrOvVex
   aKuGTIZmBfeAjQ0hGFPOulVaJKlBsnAdGmT9fH/VX7sMeA3iZL+/PlvdZ
   lPsG5aN9QG1cDR+ImfEr2qj6HcA2GWBUZyzkak1IrI1as6Azt3M6Y3N30
   /c/M48rStP+btGVECzkdYsuHpko2RpIxDMVa1sHqeKPJoYkz6pFwnYlde
   s4Fu1n+0ZaFmQAwckBangR42YyRPqMqFCHb4tXeh4OpQYNB1BlBx4dopT
   iOAByYhxhHvp9w0+VmGDl5Q6C9xh8sfpEbehQId5ZlXamKIN3pDBcOLsQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="354150379"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="354150379"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 00:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763647416"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="763647416"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 00:15:54 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id B11F211F9B6;
        Tue,  1 Aug 2023 10:15:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qQjaQ-00DrAb-0E;
        Tue, 01 Aug 2023 10:14:30 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 2/2] media: pci: ipu3-cio2: Initialise timing struct to avoid a compiler warning
Date:   Tue,  1 Aug 2023 10:14:30 +0300
Message-Id: <20230801071430.3302630-3-sakari.ailus@linux.intel.com>
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

Initialise timing struct in cio2_hw_init() to zero in order to avoid a
compiler warning. The warning was a false positive.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 4ebab0a95f35..8df0304c991e 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -355,7 +355,7 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 	void __iomem *const base = cio2->base;
 	u8 lanes, csi2bus = q->csi2.port;
 	u8 sensor_vc = SENSOR_VIR_CH_DFLT;
-	struct cio2_csi2_timing timing;
+	struct cio2_csi2_timing timing = { 0 };
 	int i, r;
 
 	fmt = cio2_find_format(NULL, &q->subdev_fmt.code);
-- 
2.39.2

