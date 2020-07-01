Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C22F12108A8
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 11:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729804AbgGAJxY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 05:53:24 -0400
Received: from ma-dnext01.denso.co.jp ([133.192.181.76]:33426 "EHLO
        adnmlgw01h.denso.co.jp" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726343AbgGAJxX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 05:53:23 -0400
Received: from grdma01h.denso.co.jp (unknown [133.192.24.24])
        by adnmlgw01h.denso.co.jp (Postfix) with ESMTP id 822EA2001015;
        Wed,  1 Jul 2020 18:53:22 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adit-jv.com;
        s=jpadit-jvmail2020; t=1593597202;
        bh=AA4N0r3nVMyfY229fipU3bpRWZ7RgWTk3Fj6MV78fTw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References:From;
        b=DDbJNvOS4/iQn3Hej09I5Jk2rTWGLl/YzzYA91CW7pQCEDJVkObN5R9K/RJMDv8vJ
         Nk4ROCLAyB4bZ775VjNpPxJ4WImTmc2IwtshUf+KD7zwhbZzVTZ8wpjIMaxfpinl+H
         IfbEdfABMkvVWytqgJf/Bk5V8PJYFx/RjJnq7riDL2S7d1TKwRqNOrNEcWfJrgPlDH
         ElidiEYhFM+QN+on8ta06tR1weYV7kOksAjqOsyqeQ79DklPFnDcQniHxti6BONWqX
         pIXUraftczACfTk4jDu5AHCXpsOSblwWpzw+92yc9KKzJTeOSLCKVLPJt7USqyG6Az
         QiztAfqCBBfTw==
Received: by grdma01h.denso.co.jp (Postfix, from userid 0)
        id 7F51CC04E0A; Wed,  1 Jul 2020 18:53:22 +0900 (JST)
Received: from smtp1.denso.co.jp [133.192.24.88] 
         by grdma01h. with ESMTP id UAA12619;
         Wed, 1 Jul 2020 18:53:22 +0900
Received: from ky0exch01.adit-jv.com ([10.71.113.8])
        by smtp01.denso.co.jp (MOS 4.4.7-GA)
        with ESMTP id GDD18934;
        Wed, 1 Jul 2020 18:53:22 +0900
Received: from jp-u0004.adit-jv.com (10.71.112.120) by ky0exch01.adit-jv.com
 (10.71.113.8) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 1 Jul 2020
 18:53:21 +0900
From:   Suresh Udipi <sudipi@jp.adit-jv.com>
To:     <niklas.soderlund@ragnatech.se>
CC:     <akiyama@nds-osk.co.jp>, <efriedrich@de.adit-jv.com>,
        <erosca@de.adit-jv.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <mchehab@kernel.org>, <michael@rodin.online>,
        <mrodin@de.adit-jv.com>, <securitycheck@denso.co.jp>,
        <sudipi@jp.adit-jv.com>
Subject: [PATCH v9 3/3] media: rcar-csi2: Optimize the selection PHTW register
Date:   Wed, 1 Jul 2020 18:53:01 +0900
Message-ID: <1593597181-8296-3-git-send-email-sudipi@jp.adit-jv.com>
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

PHTW register is selected based on default bit rate from Table[1].
for the bit rates less than or equal to 250. Currently first
value of default bit rate which is greater than or equal to
the caculated mbps is selected. This selection can be further
improved by selecting the default bit rate which is nearest to
the calculated value.

[1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.12]

Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 1184527..3efa1cb 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -917,10 +917,17 @@ static int rcsi2_phtw_write_mbps(struct rcar_csi2 *priv, unsigned int mbps,
 				 const struct rcsi2_mbps_reg *values, u16 code)
 {
 	const struct rcsi2_mbps_reg *value;
+	const struct rcsi2_mbps_reg *prev_value = NULL;
 
-	for (value = values; value->mbps; value++)
+	for (value = values; value->mbps; value++) {
 		if (value->mbps >= mbps)
 			break;
+		prev_value = value;
+	}
+
+	if (prev_value &&
+	    ((mbps - prev_value->mbps) <= (value->mbps - mbps)))
+		value = prev_value;
 
 	if (!value->mbps) {
 		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
-- 
2.7.4

