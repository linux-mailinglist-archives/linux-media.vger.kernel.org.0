Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20B811F11C3
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 05:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728965AbgFHDeb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jun 2020 23:34:31 -0400
Received: from ma-dnext03.denso.co.jp ([133.192.181.78]:54988 "EHLO
        ma-dnext03.denso.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbgFHDea (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Jun 2020 23:34:30 -0400
X-Greylist: delayed 555 seconds by postgrey-1.27 at vger.kernel.org; Sun, 07 Jun 2020 23:34:29 EDT
Received: from grdma01h.denso.co.jp (unknown [133.192.24.24])
        by ma-dnext03.denso.co.jp (Postfix) with ESMTP id D5B7E5D011C;
        Mon,  8 Jun 2020 12:25:12 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=adit-jv.com;
        s=jpadit-jvmail2011; t=1591586712;
        bh=holotR25MoQcrX0pBCrpZj4TxKa2LtqzjI7kvv+9c3A=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=4Luth47sSIPifry+JR5PvbuLwOPeDbnJIupuG0UKhqGOi7og2FsQG6DVbrYyxyMY3
         KHz5SR3swOo06IuYLb5YDm7qv8ikaINN4poiD0Zz7Gn0EbfBZ+wC95tq1XtE65ZNBe
         wId2eDwv2MWI9SOM/NUSKAvZ9oA9mc7MWysVNkC8TjQ+mRHuIYeNnIzejhpY8VE01A
         lMZ8SnoCEEwmqyFs+ZSole+Fs5drbUh7TE2pL9gfBUOYuh4N9flTKpl2/jGbSrRryo
         xDN76+ZQn3KWGShatk12K4Ke5Y8ei0NzO0TnN60mCs35dG3AibDTp6t+rrWdqwap9L
         iT2aQPqkSv57Q==
Received: by grdma01h.denso.co.jp (Postfix, from userid 0)
        id CC4D6C04E02; Mon,  8 Jun 2020 12:25:12 +0900 (JST)
Received: from smtp0.denso.co.jp [133.192.24.87] 
         by grdma01h. with ESMTP id NAA09474;
         Mon, 8 Jun 2020 12:25:12 +0900
Received: from ky0exch01.adit-jv.com ([10.71.113.8])
        by smtp00.denso.co.jp (MOS 4.4.7-GA)
        with ESMTP id FZQ69071;
        Mon, 8 Jun 2020 12:25:12 +0900
Received: from jp-u0004.adit-jv.com (10.71.112.120) by ky0exch01.adit-jv.com
 (10.71.113.8) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 8 Jun 2020
 12:25:11 +0900
From:   Suresh Udipi <sudipi@jp.adit-jv.com>
To:     <mrodin@de.adit-jv.com>
CC:     <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <mchehab@kernel.org>,
        <michael@rodin.online>, <niklas.soderlund@ragnatech.se>,
        <sudipi@jp.adit-jv.com>, <securitycheck@denso.co.jp>,
        Kazuyoshi Akiyama <akiyama@nds-osk.co.jp>
Subject: [PATCH v6] media: rcar-csi2: Correct the selection of hsfreqrange
Date:   Mon, 8 Jun 2020 12:25:03 +0900
Message-ID: <1591586703-32246-1-git-send-email-sudipi@jp.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20200605184426.GA5206@vmlxhi-121.adit-jv.com>
References: <20200605184426.GA5206@vmlxhi-121.adit-jv.com>
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


 drivers/media/platform/rcar-vin/rcar-csi2.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 151e6a9..8c502b7 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -199,6 +199,8 @@ static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
 /* PHY Frequency Control */
 #define PHYPLL_REG			0x68
 #define PHYPLL_HSFREQRANGE(n)		((n) << 16)
+#define PHYPLL_HSFREQRANGE_MAX		1500
+#define PHYPLL_HSFREQRANGE_MIN		  80
 
 static const struct rcsi2_mbps_reg hsfreqrange_h3_v3h_m3n[] = {
 	{ .mbps =   80, .reg = 0x00 },
@@ -431,16 +433,27 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
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
 
+	if (mbps < PHYPLL_HSFREQRANGE_MIN)
+		dev_warn(priv->dev, "PHY speed (%u Mbps) less \
+			 than Min 80Mbps\n", mbps);
+
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

