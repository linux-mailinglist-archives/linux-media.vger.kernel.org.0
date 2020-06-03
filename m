Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C361EC9FA
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgFCHBJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:01:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:43400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbgFCHBH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:07 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 87764207F7;
        Wed,  3 Jun 2020 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167665;
        bh=KH29YEuParkhVcZgvESxlf+E49kxxHP8MfihF720ksc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B53c8WC0mGUV8/+NKV0FjhKwUDPnGIHSTz5k8h3nYUoRhpAdqXIlFiAZ7Os5s0D6q
         GciT4og6cmQKbvr50HqGnzYPhfGfBEd4462TalK86QAJLIiUF2yjQTUAkAT052O7jr
         BJ7ilqZP7od+b7m+dJYtFkPxTViR19+fv8kJXN8Y=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j8G-8F; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/15] media: atomisp: get rid of ifdef nonsense
Date:   Wed,  3 Jun 2020 09:00:50 +0200
Message-Id: <82d6e2b75e5dba3c44ee379f62f299a617a02f4e.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591167358.git.mchehab+huawei@kernel.org>
References: <cover.1591167358.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are some ifdefs there that end doing the same thing.
Get rid of them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../atomisp/pci/isp2400_input_system_local.h      | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index 58ea58ba56e4..4b7034e4adb4 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -21,15 +21,14 @@
 #include "input_system_global.h"
 
 #include "input_system_defs.h"		/* HIVE_ISYS_GPREG_MULTICAST_A_IDX,... */
-#include "css_receiver_2400_defs.h"	/* _HRT_CSS_RECEIVER_2400_TWO_PIXEL_EN_REG_IDX, _HRT_CSS_RECEIVER_2400_CSI2_FUNC_PROG_REG_IDX,... */
-#if defined(IS_ISP_2400_MAMOIADA_SYSTEM)
+
+/*
+ * _HRT_CSS_RECEIVER_2400_TWO_PIXEL_EN_REG_IDX, 											* _HRT_CSS_RECEIVER_2400_CSI2_FUNC_PROG_REG_IDX,...
+ */
+#include "css_receiver_2400_defs.h"
+
 #include "isp_capture_defs.h"
-#elif defined(IS_ISP_2401_MAMOIADA_SYSTEM)
-/* Same name, but keep the distinction,it is a different device */
-#include "isp_capture_defs.h"
-#else
-#error "input_system_local.h: 2400_SYSTEM must be one of {2400, 2401 }"
-#endif
+
 #include "isp_acquisition_defs.h"
 #include "input_system_ctrl_defs.h"
 
-- 
2.26.2

