Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24AAD187A30
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 08:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbgCQHJJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 03:09:09 -0400
Received: from ma-dnext03.denso.co.jp ([133.192.181.78]:57688 "EHLO
        ma-dnext03.denso.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbgCQHJI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 03:09:08 -0400
Received: from grdma01h.denso.co.jp (unknown [133.192.24.24])
        by ma-dnext03.denso.co.jp (Postfix) with ESMTP id A34455D0221;
        Tue, 17 Mar 2020 16:09:06 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=adit-jv.com;
        s=jpadit-jvmail2011; t=1584428946;
        bh=fbV8PnCNUOl3ThU4RMmM5jY8kW9AbSxPVD8Ots0XE4g=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=fwtdJ1kPnegt/LOczzaYIfxQLf0rIEi+eCufbknIReUIw2afdlSYSlt7M5H75flaO
         hqUyspkbAQDE96ioD+/7lEh0YOnFrydS24RP8W5BQ9l2+1Ix2OGUlM5lJEV55J65/I
         aeRYIwJ6hF91cNI/PSDNF9Kkao4ijRCJoVYJQUx5Cp37egQeOyat5TexoJAFuhWpyO
         q85MO3HJaTUhGCmG9doqtxfKoo6wUZbcjwZjeFTWqX7RdveqXXVyojLD2PBOE2PwLG
         xpRmWIJbwDcmHL2rKcxEhMdLF7QPCLPpp5U02l+TyrGX499emn7fC1EKC05yVbc5av
         2RU+WmbKTIn4A==
Received: by grdma01h.denso.co.jp (Postfix, from userid 0)
        id A06C7C05D64; Tue, 17 Mar 2020 16:09:06 +0900 (JST)
Received: from smtp1.denso.co.jp [133.192.24.88] 
         by grdma01h. with ESMTP id SAA22465;
         Tue, 17 Mar 2020 16:09:06 +0900
Received: from ky0exch01.adit-jv.com ([10.71.113.8])
        by smtp01.denso.co.jp (MOS 4.4.7-GA)
        with ESMTP id FLB29427;
        Tue, 17 Mar 2020 16:09:05 +0900
Received: from jp-u0004.adit-jv.com (10.71.112.120) by ky0exch01.adit-jv.com
 (10.71.113.8) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 17 Mar
 2020 16:09:05 +0900
From:   Suresh Udipi <sudipi@jp.adit-jv.com>
To:     <niklas.soderlund@ragnatech.se>
CC:     <akiyama@nds-osk.co.jp>, <efriedrich@de.adit-jv.com>,
        <erosca@de.adit-jv.com>, <hverkuil-cisco@xs4all.nl>,
        <jacopo+renesas@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <mrodin@de.adit-jv.com>,
        <securitycheck@denso.co.jp>, <sudipi@jp.adit-jv.com>
Subject: [PATCH v2] [RFC] rcar-vin: rcar-csi2: Correct the selection of hsfreqrange
Date:   Tue, 17 Mar 2020 16:08:25 +0900
Message-ID: <1584428905-21560-1-git-send-email-sudipi@jp.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20200316130247.GA2258968@oden.dyn.berto.se>
References: <20200316130247.GA2258968@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.71.112.120]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hsfreqrange should be chosen based on the calculated mbps which
is closer to the default bit rate  and within the range as per
table[1]. But current calculation always selects first value which
is greater than or equal to the calculated mbps which may lead
to chosing a wrong range in some cases.

For example for 360 mbps for H3/M3N
Existing logic selects
Calculated value 360Mbps : Default 400Mbps Range [368.125 -433.125 mbps]

This hsfreqrange is out of range.

The logic is changed to get the default value which is closest to the
calculated value [1]

Calculated value 360Mbps : Default 350Mbps  Range [320.625 -380.625 mpbs]

[1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.9]

There is one exectpion value 227Mbps, which may cause out of
range.

Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")

Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
Signed-off-by: Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
---
Changes in v2:
  - Added the boundary check for the maximum bit rate.
  
  - Simplified the logic by remmoving range check 
    as only the closest default value covers most 
    of the use cases.

  - Aligning the commit message based on the above change

 drivers/media/platform/rcar-vin/rcar-csi2.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index faa9fb2..6573625 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -199,6 +199,7 @@ static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
 /* PHY Frequency Control */
 #define PHYPLL_REG			0x68
 #define PHYPLL_HSFREQRANGE(n)		((n) << 16)
+#define PHYPLL_HSFREQRANGE_MAX		1500
 
 static const struct rcsi2_mbps_reg hsfreqrange_h3_v3h_m3n[] = {
 	{ .mbps =   80, .reg = 0x00 },
@@ -431,16 +432,23 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
 static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 {
 	const struct rcsi2_mbps_reg *hsfreq;
+	const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
 
-	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++)
-		if (hsfreq->mbps >= mbps)
-			break;
-
-	if (!hsfreq->mbps) {
+	if (mbps > PHYPLL_HSFREQRANGE_MAX) {
 		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
 		return -ERANGE;
 	}
 
+	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
+		if (hsfreq->mbps >= mbps)
+			break;
+		hsfreq_prev = hsfreq;
+	}
+
+	if (hsfreq_prev &&
+	    ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
+		hsfreq = hsfreq_prev;
+
 	rcsi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));
 
 	return 0;
-- 
2.7.4

