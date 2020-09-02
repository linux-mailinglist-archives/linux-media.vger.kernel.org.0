Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B3825B105
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbgIBQNy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:13:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:54040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728328AbgIBQK4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:56 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7352A21D93;
        Wed,  2 Sep 2020 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=QRcYkbu7JvtjVp54e+chCMVF4TavZnBWpxUSfCm0mkI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z5UQUpl/qc1DM1RcLM0MuJiiLxCHWujkZzq6lqMLt3BtfVDuZrQGWuqCiJZwH1/TY
         Dle5y4L+H+sWF+JhO49ZQnXBzDy1UI0n8r1PIyfcXaVywKsUR+p7JZF6pBkaJjjB57
         /Ln8X10C8Q4dXSKQPyNe9IlYUaQrLPm41QOj0uj4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tB7-L4; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 30/38] media: atomisp: don't check for ISP version for includes
Date:   Wed,  2 Sep 2020 18:10:33 +0200
Message-Id: <7f589c4f14c767228278e0dd029faa037ce00bcf.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As there aren't duplicated names anymore, and the end goal
is to do runtime checks between ISP2400 and ISP2401,
remove the part of the Makefile which changes the include
places based on the compile-time version.

This shouldn't cause any effect, but it will make easier
for further patches meant to remove conditional compiler
decisions between ISP versions to be replaced by
runtime ones.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/Makefile | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 205d0f8cc2e1..1dfad0dd02d0 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -307,18 +307,12 @@ INCLUDES += \
 	-I$(atomisp)/pci/runtime/queue/src/ \
 	-I$(atomisp)/pci/runtime/rmgr/interface/ \
 	-I$(atomisp)/pci/runtime/spctrl/interface/ \
-	-I$(atomisp)/pci/runtime/tagger/interface/
-
-INCLUDES_byt += \
+	-I$(atomisp)/pci/runtime/tagger/interface/ \
 	-I$(atomisp)/pci/css_2400_system/hive/ \
-
-INCLUDES_cht += \
 	-I$(atomisp)/pci/css_2401_system/ \
 	-I$(atomisp)/pci/css_2401_system/host/ \
 	-I$(atomisp)/pci/css_2401_system/hive/ \
-	-I$(atomisp)/pci/css_2401_system/hrt/ \
-
-#	-I$(atomisp)/pci/css_2401_system/hive_isp_css_2401_system_generated/ \
+	-I$(atomisp)/pci/css_2401_system/hrt/
 
 DEFINES := -DHRT_HW -DHRT_ISP_CSS_CUSTOM_HOST -DHRT_USE_VIR_ADDRS -D__HOST__
 #DEFINES += -DUSE_DYNAMIC_BIN
@@ -330,11 +324,9 @@ DEFINES := -DHRT_HW -DHRT_ISP_CSS_CUSTOM_HOST -DHRT_USE_VIR_ADDRS -D__HOST__
 
 ifeq ($(CONFIG_VIDEO_ATOMISP_ISP2401),y)
 atomisp-objs += $(obj-cht)
-INCLUDES += $(INCLUDES_cht)
 DEFINES += -DISP2401 -DISP2401_NEW_INPUT_SYSTEM -DSYSTEM_hive_isp_css_2401_system
 else
 atomisp-objs += $(obj-byt)
-INCLUDES += $(INCLUDES_byt)
 DEFINES += -DISP2400 -DSYSTEM_hive_isp_css_2400_system
 endif
 
-- 
2.26.2

