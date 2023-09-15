Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 958A17A1765
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 09:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbjIOH2k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 03:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232387AbjIOH2i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 03:28:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B74121BD4
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 00:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694762907; x=1726298907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bh0ZHXg+QI2zVA9gWJL6wA3NggcrdhwMGFfxUze4KFo=;
  b=fjUrzgGL/VJF1TxjzjQoqC9TenGYGz3sq8xsWdR+3QhHbSb3yTNgmYoO
   hE8aaMeQVWH1kPbS2EWSlMznfjOxD9XamQvg6S25/ZIL8oINHQvN4ReDR
   cAkV/1FNZ8jXGUrBarXe+ZhuKKtnBKOvf8wlsazt7MSx57s5W9vfvtPVu
   Q/kCMEjicBcNbfaUNU3Pd7DRb/BDYWOdeJyDAxu1ac/fRn4RCdMKhc09X
   NqIKDFymY4Qe+GyYknY7q0dPzY+ZT658MYJt7GLiiVYD2fCYejGwsUhF8
   Zpny6Uaz05ZJ3qOKarM2gcoOU804CwlNyNxQD4qMqT53YhOVsEuruWipj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465548702"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="465548702"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 00:28:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="888133098"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="888133098"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 00:27:42 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E03A71206B4;
        Fri, 15 Sep 2023 10:28:13 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 3/7] media: ccs: Correctly initialise try compose rectangle
Date:   Fri, 15 Sep 2023 10:28:05 +0300
Message-Id: <20230915072809.37886-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Initialise the try sink compose rectangle size to the sink compose
rectangle for binner and scaler sub-devices. This was missed due to the
faulty condition that lead to the compose rectangles to be initialised for
the pixel array sub-device where it is not relevant.

Fixes: ccfc97bdb5ae ("[media] smiapp: Add driver")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 49e0d9a09530..6f8fbd82e21c 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3097,7 +3097,7 @@ static int ccs_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		try_fmt->code = sensor->internal_csi_format->code;
 		try_fmt->field = V4L2_FIELD_NONE;
 
-		if (ssd != sensor->pixel_array)
+		if (ssd == sensor->pixel_array)
 			continue;
 
 		try_comp = v4l2_subdev_get_try_compose(sd, fh->state, i);
-- 
2.39.2

