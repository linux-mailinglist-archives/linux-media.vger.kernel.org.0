Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7DA2108A1
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 11:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729775AbgGAJxM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 05:53:12 -0400
Received: from ma-dnext02.denso.co.jp ([133.192.181.77]:33306 "EHLO
        adnmlgw02h.denso.co.jp" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729125AbgGAJxM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 05:53:12 -0400
Received: from grdma02h.denso.co.jp (unknown [133.192.24.24])
        by adnmlgw02h.denso.co.jp (Postfix) with ESMTP id 0A75D2003C32;
        Wed,  1 Jul 2020 18:53:10 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adit-jv.com;
        s=jpadit-jvmail2020; t=1593597190;
        bh=7vMnJFc58ZUxgfOr5zdrARnb6OS0Vcw9IaskaHz/0Sc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References:From;
        b=gzV88vIeTaGB1+7N4bQZj18bmbwzwyUKP2ppcWUBfNwqy0r0cRpbNk9O60J//AOO1
         B2i29zcTPn0VKDhcBkVFWbCfHBW0ERd7rQTpCXXCuXLdNrMv3MFZezfCEMj+LNRNGQ
         Zxx8WUX0kzMn6kUQyTwwal/x6ZmkkG8FeAicXs0OOXaTJLyh5DCm07EB0elcnXbtMg
         bSfIQNzpkWjkJfkcDpGaph7pCsjKM/vxjIB68Ygf8/FPnj6xyU927GrNSwfe5jyIz1
         hM7NU27cLmuNZ1p3awx8hMLYK2jIVIJMG+alrnIrr4wnYJL0X4tICsydHfMQgubSyR
         a3mqZcJEL7Rdw==
Received: by grdma02h.denso.co.jp (Postfix, from userid 0)
        id 079A3C04E01; Wed,  1 Jul 2020 18:53:10 +0900 (JST)
Received: from smtp1.denso.co.jp [133.192.24.88] 
         by grdma02h. with ESMTP id UAA29947;
         Wed, 1 Jul 2020 18:53:09 +0900
Received: from ky0exch01.adit-jv.com ([10.71.113.8])
        by smtp01.denso.co.jp (MOS 4.4.7-GA)
        with ESMTP id GDD18802;
        Wed, 1 Jul 2020 18:53:08 +0900
Received: from jp-u0004.adit-jv.com (10.71.112.120) by ky0exch01.adit-jv.com
 (10.71.113.8) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 1 Jul 2020
 18:53:07 +0900
From:   Suresh Udipi <sudipi@jp.adit-jv.com>
To:     <niklas.soderlund@ragnatech.se>
CC:     <akiyama@nds-osk.co.jp>, <efriedrich@de.adit-jv.com>,
        <erosca@de.adit-jv.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <mchehab@kernel.org>, <michael@rodin.online>,
        <mrodin@de.adit-jv.com>, <securitycheck@denso.co.jp>,
        <sudipi@jp.adit-jv.com>
Subject: [PATCH v9 1/3] media: rcar-csi2: Correct the selection of hsfreqrange
Date:   Wed, 1 Jul 2020 18:52:59 +0900
Message-ID: <1593597181-8296-1-git-send-email-sudipi@jp.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20200630220816.GL2365286@oden.dyn.berto.se>
References: <20200630220816.GL2365286@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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

  - Update the walk of the array in rcsi2_set_phypll() so that it finds
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
   
Changes in v8
   - Extended the logic of selection of nearest mbps to
     PHTW registers value less than 250Mbps. A new commit
     is added
 	
Changes in v9
  - Added Reviewed-by.
  - Removed  unncessary space in commit msg and commits

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

