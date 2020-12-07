Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7DAC2D1C0D
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbgLGV0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:26:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgLGV0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 16:26:49 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E53C0611C5
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 13:23:22 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 15C59634C95;
        Mon,  7 Dec 2020 23:23:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 11/24] ccs: Add debug prints for MSR registers
Date:   Mon,  7 Dec 2020 23:15:17 +0200
Message-Id: <20201207211530.21180-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Also print out MSR registers written to the sensor. This isn't entirely
optimal as the debug strings are produced even if they're not used but
that isn't really a grave issue --- the I²C bus is very slow anyway.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-reg-access.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
index b776af2a3c33..5f0705952198 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.c
+++ b/drivers/media/i2c/ccs/ccs-reg-access.c
@@ -387,12 +387,20 @@ int ccs_write_data_regs(struct ccs_sensor *sensor, struct ccs_reg *regs,
 
 		for (j = 0; j < regs->len;
 		     j += msg.len - 2, regdata += msg.len - 2) {
+			char printbuf[(MAX_WRITE_LEN << 1) +
+				      1 /* \0 */] = { 0 };
 			int rval;
 
 			msg.len = min(regs->len - j, MAX_WRITE_LEN);
 
+			bin2hex(printbuf, regdata, msg.len);
+			dev_dbg(&client->dev,
+				"writing msr reg 0x%4.4x value 0x%s\n",
+				regs->addr + j, printbuf);
+
 			put_unaligned_be16(regs->addr + j, buf);
 			memcpy(buf + 2, regdata, msg.len);
+
 			msg.len += 2;
 
 			rval = ccs_write_retry(client, &msg);
-- 
2.29.2

