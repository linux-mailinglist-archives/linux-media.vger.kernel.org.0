Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A21D285B01
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbgJGIqh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:46:37 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57052 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbgJGIqQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:16 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 711D3634D0E
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:22 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 091/106] ccs: Print written register values
Date:   Wed,  7 Oct 2020 11:45:42 +0300
Message-Id: <20201007084557.25843-82-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This helps debugging register writes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-reg-access.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
index 02af2b0abdaf..2025e9ab6e91 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.c
+++ b/drivers/media/i2c/ccs/ccs-reg-access.c
@@ -338,6 +338,10 @@ int ccs_write_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 val)
 	put_unaligned_be16(CCS_REG_ADDR(reg), data);
 	put_unaligned_be32(val << (8 * (sizeof(val) - len)), data + 2);
 
+	dev_dbg(&client->dev, "writing reg 0x%4.4x value 0x%*.*x (%u)\n",
+		CCS_REG_ADDR(reg), ccs_reg_width(reg) << 1,
+		ccs_reg_width(reg) << 1, val, val);
+
 	r = ccs_write_retry(client, &msg);
 	if (r)
 		dev_err(&client->dev,
-- 
2.27.0

