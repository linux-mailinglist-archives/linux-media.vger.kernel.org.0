Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8ED71FC571
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 06:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgFQE5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 00:57:38 -0400
Received: from ma-dnext03.denso.co.jp ([133.192.181.78]:60626 "EHLO
        ma-dnext03.denso.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgFQE5h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 00:57:37 -0400
Received: from grdma01h.denso.co.jp (unknown [133.192.24.24])
        by ma-dnext03.denso.co.jp (Postfix) with ESMTP id 92F255D0384;
        Wed, 17 Jun 2020 13:57:34 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=adit-jv.com;
        s=jpadit-jvmail2011; t=1592369854;
        bh=Iyxck//Ho6B7PKy/GZI7WECnR2NGidDhDqmOCTc8aYE=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=2k51ONhiShyXidC1RrcaoG42EpCDtdKqczHsQm5LOYG4bqif+mxxPJuctCN/bqqez
         E+T75JgRMwfRELo+4hMgn/bbBULVCEZI2xTyzogn1ZZCJvT7AIY+248wrzF42BOuiI
         V+K3dHL7Zhvt9P/w8WeyOT/61RoscCkG3jQ7M5h+QmZzsl46Dvd08rAS8rNMmw3ZK8
         Q0d/b0iiBDfM4Wumcc5vNdkXJf6HFQNNmEh/FWAMXwRM8KD/GMyYyOEn+pEMZGT+1/
         0S2HhdKmqYOcoBmiL8UekSW1rA52kQ+tyjWODO0W5H/YKx7PxWfNbor0hi8jLIzqH5
         JheXg3mawPfXw==
Received: by grdma01h.denso.co.jp (Postfix, from userid 0)
        id 8EFC7C0BDAB; Wed, 17 Jun 2020 13:57:34 +0900 (JST)
Received: from smtp0.denso.co.jp [133.192.24.87] 
         by grdma01h. with ESMTP id PAA08217;
         Wed, 17 Jun 2020 13:57:34 +0900
Received: from ky0exch01.adit-jv.com ([10.71.113.8])
        by smtp00.denso.co.jp (MOS 4.4.7-GA)
        with ESMTP id GBI96704;
        Wed, 17 Jun 2020 13:57:33 +0900
Received: from jp-u0004.adit-jv.com (10.71.112.120) by ky0exch01.adit-jv.com
 (10.71.113.8) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 17 Jun
 2020 13:57:32 +0900
From:   Suresh Udipi <sudipi@jp.adit-jv.com>
To:     <niklas.soderlund@ragnatech.se>
CC:     <akiyama@nds-osk.co.jp>, <efriedrich@de.adit-jv.com>,
        <erosca@de.adit-jv.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <mchehab@kernel.org>, <michael@rodin.online>,
        <mrodin@de.adit-jv.com>, <securitycheck@denso.co.jp>,
        <sudipi@jp.adit-jv.com>
Subject: [PATCH v7 1/2] media: rcar-csi2: Correct the selection of hsfreqrange
Date:   Wed, 17 Jun 2020 13:57:22 +0900
Message-ID: <1592369843-32217-1-git-send-email-sudipi@jp.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20200615141126.GE915368@oden.dyn.berto.se>
References: <20200615141126.GE915368@oden.dyn.berto.se>
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

Please note that According to Renesas in Table 25.9 the range for
220 default value is corrected as below

 |Range (Mbps)     |  Default  Bit rate (Mbps) |
 -----------------------------------------------
 | 197.125-244.125 |     220                   |
 -----------------------------------------------

Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")

Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
Signed-off-by: Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
---
 Changes in v2:
  - Added the boundary check for the maximum bit rate.

  - Simplified the logic by remmoving range check
    as only the closest default value covers most
    of the use cases.

  - Aligning the commit message based on the above change


 Changes in v3:
    - Added max member from struct rcsi2_mbps_reg.
      mbps varialbe cannot be removed from rcsi2_mbps_reg,
      since this structure is reused for
      phtw_mbps_h3_v3h_m3n/phtw_mbps_v3m_e3 where mbps is
      used.


   -  Update the walk of the array in rcsi2_set_phypll() so that it finds
      the first entry where the calculated bit rate is less than the max.

   - Support lower bit rates less than 80Mbps like 48Mbps
     (Raspberry pi camera 640x480 connected to Kingfisher)
     can also be supported by selecting the lowest default bit rate 80Mbps
     as done before this fix

   - Alignement of the commit message based on above changes.

 Changes in v4:
  -  Remove unncessary braces.

 Changes in v5:
   - Removed mbps variable in rcsi2_mbps_reg and aligned all
     tables accordingly


 Changes in v6
   - Renesas correct the range of default value 220Mbps. Now
     if we select the nearest value to the default value all
         the values are in range. So reverting back to original patch
  
   - Added warning for values less than Minimum 80Mbps
      
Changes in v7
  - Create a seperate commit for the warning message less
    than minimum 80Mbps 
  
  - Reorder the statements to increase readability

 drivers/media/platform/rcar-vin/rcar-csi2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 151e6a9..f18dedc 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -431,16 +431,23 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
 static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 {
 	const struct rcsi2_mbps_reg *hsfreq;
+	const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
 
-	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++)
+	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
 		if (hsfreq->mbps >= mbps)
 			break;
+		hsfreq_prev = hsfreq;
+	}
 
 	if (!hsfreq->mbps) {
 		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
 		return -ERANGE;
 	}
 
+	if (hsfreq_prev &&
+	    ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
+		hsfreq = hsfreq_prev;
+
 	rcsi2_write(priv, PHYPLL_REG, PHYPLL_HSFREQRANGE(hsfreq->reg));
 
 	return 0;
-- 
2.7.4

