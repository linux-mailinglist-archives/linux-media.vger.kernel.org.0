Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC6E12CBF8C
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 15:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgLBO1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 09:27:00 -0500
Received: from retiisi.eu ([95.216.213.190]:59406 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727245AbgLBO1A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 09:27:00 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 5387F634C89;
        Wed,  2 Dec 2020 16:24:08 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 2/2] Documentation: ccs: Reorder SPDX and copyright notice lines
Date:   Wed,  2 Dec 2020 16:22:11 +0200
Message-Id: <20201202142211.10305-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202142211.10305-1-sakari.ailus@linux.intel.com>
References: <20201202142211.10305-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the SPDX tag to the top, placing the copyright notice after that.
This aligns the file with existing practices.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/drivers/ccs/ccs-regs.asc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/drivers/ccs/ccs-regs.asc b/Documentation/driver-api/media/drivers/ccs/ccs-regs.asc
index 93f0131aa304..f2042acc8a45 100644
--- a/Documentation/driver-api/media/drivers/ccs/ccs-regs.asc
+++ b/Documentation/driver-api/media/drivers/ccs/ccs-regs.asc
@@ -1,5 +1,5 @@
-# Copyright (C) 2019--2020 Intel Corporation
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
+# Copyright (C) 2019--2020 Intel Corporation
 
 # register				rflags
 # - f	field	LSB	MSB		rflags
-- 
2.27.0

