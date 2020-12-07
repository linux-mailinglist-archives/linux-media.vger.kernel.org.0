Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05DA2D1C11
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgLGV0w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:26:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbgLGV0v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 16:26:51 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B62C0611CF
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 13:23:26 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id CDF32634CAA;
        Mon,  7 Dec 2020 23:23:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 21/24] Documentation: Include CCS PLL calculator to CCS driver documentation
Date:   Mon,  7 Dec 2020 23:15:27 +0200
Message-Id: <20201207211530.21180-22-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Include existing CCS PLL calculator kerneldoc documentation to the
documentation build.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/drivers/ccs/ccs.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/driver-api/media/drivers/ccs/ccs.rst b/Documentation/driver-api/media/drivers/ccs/ccs.rst
index f49e971f2d92..b461c8aa2a16 100644
--- a/Documentation/driver-api/media/drivers/ccs/ccs.rst
+++ b/Documentation/driver-api/media/drivers/ccs/ccs.rst
@@ -79,4 +79,17 @@ definitions:
 		-l drivers/media/i2c/ccs/ccs-limits.c \
 		-c Documentation/driver-api/media/drivers/ccs/ccs-regs.asc
 
+CCS PLL calculator
+==================
+
+The CCS PLL calculator is used to compute the PLL configuration, given sensor's
+capabilities as well as board configuration and user specified configuration. As
+the configuration space that encompasses all these configurations is vast, the
+PLL calculator isn't entirely trivial. Yet it is relatively simple to use for a
+driver.
+
+The PLL model implemented by the PLL calculator corresponds to MIPI CCS 1.1.
+
+.. kernel-doc:: drivers/media/i2c/ccs-pll.h
+
 **Copyright** |copy| 2020 Intel Corporation
-- 
2.29.2

