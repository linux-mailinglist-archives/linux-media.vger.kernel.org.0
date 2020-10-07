Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD79A285EE4
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 14:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgJGMQc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 08:16:32 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48128 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgJGMQb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 08:16:31 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kQ8Mu-0004w5-Ev; Wed, 07 Oct 2020 12:16:28 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "nibble . max" <nibble.max@gmail.com>, linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: m88rs6000t: avoid potential out-of-bounds reads on arrays
Date:   Wed,  7 Oct 2020 13:16:28 +0100
Message-Id: <20201007121628.20676-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There a 3 array for-loops that don't check the upper bounds of the
index into arrays and this may lead to potential out-of-bounds
reads.  Fix this by adding array size upper bounds checks to be
full safe.

Addresses-Coverity: ("Out-of-bounds read")
Fixes: 333829110f1d ("[media] m88rs6000t: add new dvb-s/s2 tuner for integrated chip M88RS6000")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/tuners/m88rs6000t.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/tuners/m88rs6000t.c b/drivers/media/tuners/m88rs6000t.c
index b3505f402476..8647c50b66e5 100644
--- a/drivers/media/tuners/m88rs6000t.c
+++ b/drivers/media/tuners/m88rs6000t.c
@@ -525,7 +525,7 @@ static int m88rs6000t_get_rf_strength(struct dvb_frontend *fe, u16 *strength)
 	PGA2_cri = PGA2_GC >> 2;
 	PGA2_crf = PGA2_GC & 0x03;
 
-	for (i = 0; i <= RF_GC; i++)
+	for (i = 0; i <= RF_GC && i < ARRAY_SIZE(RFGS); i++)
 		RFG += RFGS[i];
 
 	if (RF_GC == 0)
@@ -537,12 +537,12 @@ static int m88rs6000t_get_rf_strength(struct dvb_frontend *fe, u16 *strength)
 	if (RF_GC == 3)
 		RFG += 100;
 
-	for (i = 0; i <= IF_GC; i++)
+	for (i = 0; i <= IF_GC && i < ARRAY_SIZE(IFGS); i++)
 		IFG += IFGS[i];
 
 	TIAG = TIA_GC * TIA_GS;
 
-	for (i = 0; i <= BB_GC; i++)
+	for (i = 0; i <= BB_GC && i < ARRAY_SIZE(BBGS); i++)
 		BBG += BBGS[i];
 
 	PGA2G = PGA2_cri * PGA2_cri_GS + PGA2_crf * PGA2_crf_GS;
-- 
2.27.0

