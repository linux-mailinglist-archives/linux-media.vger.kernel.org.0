Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04AAA766BFF
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 13:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235725AbjG1Lq4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 07:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233624AbjG1Lqy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 07:46:54 -0400
Received: from mgamail.intel.com (unknown [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A9D35B5
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 04:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690544813; x=1722080813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=no0qfSnFs5J+km6a2zXXcDmvNaUqOl9++yqW5wnR8lE=;
  b=m5Hn2cCm8s2f5Y8E4IxxMDRkBVUjm+suk8GfOq5/urPZzmWkjF5ixZXX
   IRwrOKjde6Uxvmr9thn77atV283unOLMn9g4vaeDANswhHoUUU68HNhgN
   DRd/rfgriAP0urBv7hJKKavAxxfJ779RAsdaV6wnLwqioCaIhYD3MOZg9
   sys8TzV+NkDlYfjhF6y9vtrD69Mb1dTXAC7u3FVh7mPptH3i6yYe4gUjv
   dDDw1S+3rl6wdg7jHQ5BRUYFLybzSPNYzPDqio4U1QwfsQ2Nod7KOprF0
   eNco/1pYZbaUXlRNMUUoZEhvbFj13j/cQEjcbZ3yNV76wlzoj+aNABxsf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434858357"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="434858357"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 04:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730713006"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="730713006"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 04:46:51 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 9DFF8120279;
        Fri, 28 Jul 2023 14:46:48 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qPLuX-004yNx-24;
        Fri, 28 Jul 2023 14:45:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH v3 2/2] media: MAINTAINERS: Split sensors and lens drivers, add documentation
Date:   Fri, 28 Jul 2023 14:45:23 +0300
Message-Id: <20230728114523.1185414-3-sakari.ailus@linux.intel.com>
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

Split lens drivers from camera sensor into a new section. This makes it
easier to maintain the list.

Also add documentation related files under the camera sensor entry. Add
the word "CAMERA" to the subject as well since there are many other kinds
of sensors.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d197ff52a653..08c06516b328 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22292,10 +22292,20 @@ F:	drivers/media/v4l2-core/v4l2-fwnode.c
 F:	include/media/v4l2-async.h
 F:	include/media/v4l2-fwnode.h
 
-V4L2 SENSOR AND LENS DRIVERS
+V4L2 LENS DRIVERS
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	drivers/media/i2c/ak*
+F:	drivers/media/i2c/dw*
+F:	drivers/media/i2c/lm*
+
+V4L2 CAMERA SENSOR DRIVERS
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/driver-api/media/camera-sensor.rst
+F:	Documentation/driver-api/media/tx-rx.rst
 F:	drivers/media/i2c/ar*
 F:	drivers/media/i2c/hi*
 F:	drivers/media/i2c/imx*
@@ -22304,9 +22314,6 @@ F:	drivers/media/i2c/og*
 F:	drivers/media/i2c/ov*
 F:	drivers/media/i2c/s5*
 F:	drivers/media/i2c/st-vgxy61.c
-F:	drivers/media/i2c/dw*
-F:	drivers/media/i2c/ak*
-F:	drivers/media/i2c/lm*
 
 VF610 NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
-- 
2.39.2

