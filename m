Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9571A727BEC
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 11:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234884AbjFHJxG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 05:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234155AbjFHJxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 05:53:05 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA35D269E
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 02:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686217984; x=1717753984;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a/Dhs+oBUgyjHV4hJAUNqriuC1SnYUWwcfToTBg/QiU=;
  b=nhYxZ5s47BlLF9aty6CqlpTJXnaQsl76tzdpRw6wEplPSsLRywWx/7mE
   l/uBtIgpixXZiYPpm28riNWJS/no0kyvcthJu0IBtB58q+ITbfTh8A6rv
   1pdYgE93wQ0j2mMxNNaKJISl4U2ai5748WRQEtL8mrfBBUp4xSnihrV1b
   Y9xe9nl6GA2Hx1rbYUQRnM72uxkdQJsgwzOqS2nvGOln7anuePuv3L4G4
   5TsgcQnP0qwe5xnjr0doR7eI55ri4tdLWYFu72MeD2bphPEp6umS/8ygF
   NcOHC+zzI0b0MmW6YCdIGAmtjwacTRn3KXsgMUnjNUOCeaddn5FdZvW0i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="385606065"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="385606065"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 02:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="834115346"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="834115346"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 02:52:57 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id B4705120BE1;
        Thu,  8 Jun 2023 12:52:54 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q7CJL-00H12n-TK; Thu, 08 Jun 2023 12:52:07 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Leon Luo <leonl@leopardimaging.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Michael Riesch <michael.riesch@wolfvision.net>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Jason Chen <jason.z.chen@intel.com>,
        Arec Kao <arec.kao@intel.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Nicholas Roth <nicholas@rothemail.net>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 1/1] MAINTAINERS: Add an entry for V4L2 sensor and lens drivers
Date:   Thu,  8 Jun 2023 12:51:57 +0300
Message-Id: <20230608095157.4055544-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I maintain V4L2 sensor and lens drivers but there hasn't been a specific
MAINTAINERS entry for them. Add it now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The purpose is to help people cc me when sending sensor or lens driver
patches. Of course I find the patches in Patchwork but this always
introduces a delay in reviewing them.

 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cec3c9ef43590..57aeca250bf4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22084,6 +22084,21 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/clk/ux500/
 
+V4L2 SENSOR AND LENS DRIVERS
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/i2c/ar*
+F:	drivers/media/i2c/hi*
+F:	drivers/media/i2c/imx*
+F:	drivers/media/i2c/mt*
+F:	drivers/media/i2c/og*
+F:	drivers/media/i2c/ov*
+F:	drivers/media/i2c/st-vgxy61.c
+F:	drivers/media/i2c/dw*
+F:	drivers/media/i2c/ak*
+F:	drivers/media/i2c/lm*
+
 VF610 NAND DRIVER
 M:	Stefan Agner <stefan@agner.ch>
 L:	linux-mtd@lists.infradead.org
-- 
2.30.2

