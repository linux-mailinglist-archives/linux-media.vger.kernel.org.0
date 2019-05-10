Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49F111A01F
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 17:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727643AbfEJP1O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 11:27:14 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:54393 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727194AbfEJP1O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 11:27:14 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id D892D3C00C6;
        Fri, 10 May 2019 17:27:10 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7FaUUjeoJ1rm; Fri, 10 May 2019 17:27:02 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id C1CA83C004C;
        Fri, 10 May 2019 17:27:02 +0200 (CEST)
Received: from vmlxhi-121.adit-jv.com (10.72.93.65) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 10 May
 2019 17:27:02 +0200
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     <kieran.bingham@ideasonboard.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <michael@rodin.online>
Subject: [PATCH] media: i2c: adv748x: initialize bit 7 of csi_tx_top_reg_1f
Date:   Fri, 10 May 2019 17:26:53 +0200
Message-ID: <1557502013-16158-1-git-send-email-mrodin@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.93.65]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to pages 188 and 193 of the "UG-747: ADV7481 Reference Manual"
[1], the bit 7 (FRAMENUMBER_INTERLACED) of the register csi_tx_top_reg_1f
"sets association of frame number in the FS and FE packets with the F bit
in the EAV/SAV codes". EAV/SAV codes are defined in [2].
According to [2]:
F=0 for field 1
F=1 for field 2
The bit FRAMENUMBER_INTERLACED is not initialized anywhere in the current
version of the adv748x driver and therefore it is always 0, which is the
default value according to [1]. Therefore the current association of field
number from EAV/SAV code with the frame number in CSI FS and FE packets is:
field 1 (top field for PAL, bottom field for NTSC) -> CSI frame number 2
field 2 (bottom field for PAL, top field for NTSC) -> CSI frame number 1
But this breaks frame number based field detection of top/bottom fields
in CSI receivers. Therefore it makes sense to initialize the
FRAMENUMBER_INTERLACED bit to 1 so the association is as expected:
field 1 -> frame number 1
field 2 -> frame number 2

[1] https://www.analog.com/en/products/adv7481.html
[2] https://www.itu.int/rec/R-REC-BT.656-5-200712-I/en

Suggested-by: Steve Longerbeam <steve_longerbeam@mentor.com>
Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
---
 drivers/media/i2c/adv748x/adv748x-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index f57cd77..4dd1a13 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -278,6 +278,9 @@ static int adv748x_power_up_tx(struct adv748x_csi2 *tx)
 	usleep_range(1000, 1500);
 	adv748x_write_check(state, page, 0x31, 0x80, &ret);
 
+	/* set bit 7 (FRAMENUMBER_INTERLACED) in csi_tx_top_reg_1f */
+	adv748x_write_check(state, page, 0x1f, 0x80, &ret);
+
 	return ret;
 }
 
-- 
2.7.4

