Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 707CA2108A5
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 11:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbgGAJxR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 05:53:17 -0400
Received: from ma-dnext02.denso.co.jp ([133.192.181.77]:33408 "EHLO
        adnmlgw02h.denso.co.jp" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726343AbgGAJxR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 05:53:17 -0400
Received: from grdma01h.denso.co.jp (unknown [133.192.24.24])
        by adnmlgw02h.denso.co.jp (Postfix) with ESMTP id A1AF82003C30;
        Wed,  1 Jul 2020 18:53:14 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adit-jv.com;
        s=jpadit-jvmail2020; t=1593597194;
        bh=QpK+feyWmMCQlJ+m4C4aQ/rhiLGJd7a1sLleuAWZDT4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References:From;
        b=EntwAUkXrLsccTlGuLiiojVNtXlRpA6fKNFxBz1RSYFEaeolArF+Kq3r9478TMzRR
         2KP1T+D4to3eNjS6Aesm+X9ZKoY2J3hilIb3kH8qc1VOmfKqH5X8xR+HvGVQuaU7uc
         AXfDc4WBJbNEFMd+p70ZmCQdps641ix2jFMTwLJwITotDoyBm2yYEEWe7cZkyr7rIa
         7AyVIsTFrUBMHFNF73i+TQuu/f0AsttdBDGgvkzkTL1SAn2TBRjYpic5hz/4lW4Y1+
         BYKNydlffm6zbhk3LoBVibA+lqQNnZ4rptPhUDyrGjtAor0zC5VuNFdTvWjRxr+v7K
         6Es618WluUXVQ==
Received: by grdma01h.denso.co.jp (Postfix, from userid 0)
        id 9E299C04E0E; Wed,  1 Jul 2020 18:53:14 +0900 (JST)
Received: from smtp1.denso.co.jp [133.192.24.88] 
         by grdma01h. with ESMTP id UAA12285;
         Wed, 1 Jul 2020 18:53:14 +0900
Received: from ky0exch01.adit-jv.com ([10.71.113.8])
        by smtp01.denso.co.jp (MOS 4.4.7-GA)
        with ESMTP id GDD18852;
        Wed, 1 Jul 2020 18:53:14 +0900
Received: from jp-u0004.adit-jv.com (10.71.112.120) by ky0exch01.adit-jv.com
 (10.71.113.8) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 1 Jul 2020
 18:53:13 +0900
From:   Suresh Udipi <sudipi@jp.adit-jv.com>
To:     <niklas.soderlund@ragnatech.se>
CC:     <akiyama@nds-osk.co.jp>, <efriedrich@de.adit-jv.com>,
        <erosca@de.adit-jv.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <mchehab@kernel.org>, <michael@rodin.online>,
        <mrodin@de.adit-jv.com>, <securitycheck@denso.co.jp>,
        <sudipi@jp.adit-jv.com>
Subject: [PATCH v9 2/3] media: rcar-csi2: Add warning for PHY speed less than minimum
Date:   Wed, 1 Jul 2020 18:53:00 +0900
Message-ID: <1593597181-8296-2-git-send-email-sudipi@jp.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593597181-8296-1-git-send-email-sudipi@jp.adit-jv.com>
References: <20200630220816.GL2365286@oden.dyn.berto.se>
 <1593597181-8296-1-git-send-email-sudipi@jp.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.71.112.120]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a warning message when the selected PHY speed is less
than supported minimum PHY speed given in the hsfreq table[1].

For raspberry pi camera capture on Kingfisher board with resolution
640x480, the calculated PHY speed is 48 mbps which is less than
the minimum PHY speed 80 Mbps from the table[1]. But in this cases
capture is successful.

[1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.9]

Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index f18dedc..1184527 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -433,6 +433,10 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 	const struct rcsi2_mbps_reg *hsfreq;
 	const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
 
+	if (mbps < priv->info->hsfreqrange->mbps)
+		dev_warn(priv->dev, "%u Mbps less than min PHY speed %u Mbps",
+			 mbps, priv->info->hsfreqrange->mbps);
+
 	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
 		if (hsfreq->mbps >= mbps)
 			break;
-- 
2.7.4

