Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3BC822E4AA
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 06:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgG0ENe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 00:13:34 -0400
Received: from mga17.intel.com ([192.55.52.151]:22485 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbgG0ENe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 00:13:34 -0400
IronPort-SDR: GuEmjDKOzFLPCNlqR6P646+EvGDMDGEML4A6GFzVFsg4lnFK0mGAXvPmOgOewpAHhcSH+TsDHb
 bW/xIgUKDy2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="131015833"
X-IronPort-AV: E=Sophos;i="5.75,401,1589266800"; 
   d="scan'208";a="131015833"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2020 21:13:33 -0700
IronPort-SDR: Uumu+xfSeD9lA1Wt99k0cIfH4aeA1mG8LBISnfGoVW5U1tOYn0QgLUpyvshwirEXtEtt043dsh
 pbM7CZV7GPXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,401,1589266800"; 
   d="scan'208";a="463925029"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by orsmga005.jf.intel.com with ESMTP; 26 Jul 2020 21:13:30 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        helgaas@kernel.org
Cc:     sakari.ailus@linux.intel.com, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com
Subject: [PATCH] MAINTAINERS: Fix email typo and correct name of Tianshu
Date:   Mon, 27 Jul 2020 12:12:17 +0800
Message-Id: <1595823137-20553-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the typo in email address of Tianshu Qiu and correct the name.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Tianshu Qiu <tian.shu.qiu@intel.com>
Reported-by: Bjorn Helgaas <helgaas@kernel.org>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5392f00cec46..638dfa99751b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8765,7 +8765,7 @@ INTEL IPU3 CSI-2 CIO2 DRIVER
 M:	Yong Zhi <yong.zhi@intel.com>
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 M:	Bingbu Cao <bingbu.cao@intel.com>
-R:	Tian Shu Qiu <tian.shu.qiu@intel.com>
+R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
@@ -8774,7 +8774,7 @@ F:	drivers/media/pci/intel/ipu3/
 INTEL IPU3 CSI-2 IMGU DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 R:	Bingbu Cao <bingbu.cao@intel.com>
-R:	Tian Shu Qiu <tian.shu.qiu@intel.com>
+R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/ipu3.rst
@@ -12609,7 +12609,7 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov2685.c
 
 OMNIVISION OV2740 SENSOR DRIVER
-M:	Tianshu Qiu <tian.shu.qiua@intel.com>
+M:	Tianshu Qiu <tian.shu.qiu@intel.com>
 R:	Shawn Tu <shawnx.tu@intel.com>
 R:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.7.4

