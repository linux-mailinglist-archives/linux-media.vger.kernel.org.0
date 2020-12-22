Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4072E2E0D0F
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 17:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727767AbgLVQGe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 11:06:34 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:59787 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbgLVQGd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 11:06:33 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D46E91C000A;
        Tue, 22 Dec 2020 16:05:50 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     chiranjeevi.rapolu@intel.com, hyungwoo.yang@intel.com,
        mchehab@kernel.org, sakari.ailus@linux.intel.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH] media: i2c: ov5670: Fix PIXEL_RATE minimum value
Date:   Tue, 22 Dec 2020 17:05:55 +0100
Message-Id: <20201222160555.116570-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver currently reports a single supported value for
V4L2_CID_PIXEL_RATE and initializes the control's minimum value to 0,
which is very risky, as userspace might accidentally use it as divider
when calculating the time duration of a line.

Fix this by using as minimum the only supported value when registering
the control.

Fixes: 5de35c9b8dcd1 ("media: i2c: Add Omnivision OV5670 5M sensor support")
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---

Take #2. I sent it out yesterday but apparantly it didn't hit the list.
Some of you will receive it multiple times, sorry about this.

---
 drivers/media/i2c/ov5670.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 7f85ae1d93faf..ff46e6eefad6f 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2095,7 +2095,8 @@ static int ov5670_init_controls(struct ov5670 *ov5670)

 	/* By default, V4L2_CID_PIXEL_RATE is read only */
 	ov5670->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov5670_ctrl_ops,
-					       V4L2_CID_PIXEL_RATE, 0,
+					       V4L2_CID_PIXEL_RATE,
+					       link_freq_configs[0].pixel_rate,
 					       link_freq_configs[0].pixel_rate,
 					       1,
 					       link_freq_configs[0].pixel_rate);
--
2.29.2

