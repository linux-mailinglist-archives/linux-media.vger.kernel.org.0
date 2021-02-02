Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E8C30CCE7
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 21:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbhBBURf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 15:17:35 -0500
Received: from retiisi.eu ([95.216.213.190]:49876 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232682AbhBBUQb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 15:16:31 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 78215634C8D;
        Tue,  2 Feb 2021 22:14:36 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Dan Scally <djrscally@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Yong Zhi <yong.zhi@intel.com>
Subject: [PATCH 1/1] ipu3-cio2: Build bridge only if ACPI is enabled
Date:   Tue,  2 Feb 2021 22:14:40 +0200
Message-Id: <20210202201440.10613-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ipu3-cio2-bridge uses several features of the ACPI framework that have no
meaningful replacement when ACPI is disabled. Instead of adding #ifdefs to
the affected places, only build the bridge code if CONFIG_ACPI is enabled.

Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi Randy,

Thanks for reporting this.

This patch should address the problem.

 drivers/media/pci/intel/ipu3/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
index 24f4e79fe0cb..dce8274c81e6 100644
--- a/drivers/media/pci/intel/ipu3/Kconfig
+++ b/drivers/media/pci/intel/ipu3/Kconfig
@@ -20,7 +20,7 @@ config VIDEO_IPU3_CIO2
 
 config CIO2_BRIDGE
 	bool "IPU3 CIO2 Sensors Bridge"
-	depends on VIDEO_IPU3_CIO2
+	depends on VIDEO_IPU3_CIO2 && ACPI
 	help
 	  This extension provides an API for the ipu3-cio2 driver to create
 	  connections to cameras that are hidden in the SSDB buffer in ACPI.
-- 
2.29.2

