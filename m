Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62592B7CC8
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 12:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgKRLia (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 06:38:30 -0500
Received: from retiisi.eu ([95.216.213.190]:53498 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgKRLi3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 06:38:29 -0500
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 53A92634CA1;
        Wed, 18 Nov 2020 13:38:17 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 07/29] smiapp: Add macros for accessing CCS registers
Date:   Wed, 18 Nov 2020 13:30:49 +0200
Message-Id: <20201118113111.2548-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201118113111.2548-1-sakari.ailus@linux.intel.com>
References: <20201118113111.2548-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add two helper macros for reading and writing the CCS registers as defined
in ccs-regs.h.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-regs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/smiapp/smiapp-regs.h b/drivers/media/i2c/smiapp/smiapp-regs.h
index 7223f5f89109..dc946096f368 100644
--- a/drivers/media/i2c/smiapp/smiapp-regs.h
+++ b/drivers/media/i2c/smiapp/smiapp-regs.h
@@ -28,4 +28,10 @@ int smiapp_write(struct smiapp_sensor *sensor, u32 reg, u32 val);
 
 unsigned int ccs_reg_width(u32 reg);
 
+#define ccs_read(sensor, reg_name, val) \
+	smiapp_read(sensor, CCS_R_##reg_name, val)
+
+#define ccs_write(sensor, reg_name, val) \
+	smiapp_write(sensor, CCS_R_##reg_name, val)
+
 #endif
-- 
2.27.0

