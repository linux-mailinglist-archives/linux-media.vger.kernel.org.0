Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622271FEFB5
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 12:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbgFRKfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 06:35:11 -0400
Received: from ma-dnext03.denso.co.jp ([133.192.181.78]:44693 "EHLO
        ma-dnext03.denso.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728769AbgFRKfH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 06:35:07 -0400
Received: from grdma01h.denso.co.jp (unknown [133.192.24.24])
        by ma-dnext03.denso.co.jp (Postfix) with ESMTP id 7533F5D0473;
        Thu, 18 Jun 2020 19:35:01 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=adit-jv.com;
        s=jpadit-jvmail2011; t=1592476501;
        bh=K0tPOIUp2y9bg5a2AL1dvczXgteN9sm026xR1Mrju64=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=xrDC8ULPYfHPn3ma4NzxmDfVEw0MXzCxCfrAhJZ1AgU0t3rALzNcSlW22WYw1m/HY
         qc3ywq+q3UcqZRLI3dhBP30oCzXcq5CDX/YByP9GqU3zNH86e7Aij6zwIpxlnWk9EX
         xFsUzZbvTPc48+gvRzy1WtiGf1HmT+CCYFa4p7iLrQsJohFZvxy+nAdoGouGSz8g54
         xqf2fSgJ/RQJzFaeqyv5LgEkZTlBRfS0ErK1l62V/Nzc834LgvER2LtiE8wpWyHsiZ
         STJAnzoQcxC6VNZA9fLSZYDR8EVso7FiDOoZzgbgu4Kpz6HVr2NHPkF/tyqtCvnkZi
         9XSBse7Z5ESMA==
Received: by grdma01h.denso.co.jp (Postfix, from userid 0)
        id 7274CC0BDAB; Thu, 18 Jun 2020 19:35:01 +0900 (JST)
Received: from smtp1.denso.co.jp [133.192.24.88] 
         by grdma01h. with ESMTP id VAA11611;
         Thu, 18 Jun 2020 19:35:01 +0900
Received: from ky0exch01.adit-jv.com ([10.71.113.8])
        by smtp01.denso.co.jp (MOS 4.4.7-GA)
        with ESMTP id GAZ77809;
        Thu, 18 Jun 2020 19:35:00 +0900
Received: from jp-u0004.adit-jv.com (10.71.112.120) by ky0exch01.adit-jv.com
 (10.71.113.8) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 18 Jun
 2020 19:35:00 +0900
From:   Suresh Udipi <sudipi@jp.adit-jv.com>
To:     <mrodin@de.adit-jv.com>
CC:     <akiyama@nds-osk.co.jp>, <efriedrich@de.adit-jv.com>,
        <erosca@de.adit-jv.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <mchehab@kernel.org>, <michael@rodin.online>,
        <niklas.soderlund@ragnatech.se>, <securitycheck@denso.co.jp>,
        <sudipi@jp.adit-jv.com>
Subject: [PATCH v8 3/3] media: rcar-csi2: Optimize the selection PHTW register
Date:   Thu, 18 Jun 2020 19:34:32 +0900
Message-ID: <1592476472-26235-3-git-send-email-sudipi@jp.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592476472-26235-1-git-send-email-sudipi@jp.adit-jv.com>
References: <20200617133705.GA88066@vmlxhi-121.adit-jv.com>
 <1592476472-26235-1-git-send-email-sudipi@jp.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.71.112.120]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PHTW register is selected based on default bit rate from Table[1].
for the bit rates less than or equal to 250. Currently first
value of default bit rate which is greater than or equal to
the caculated mbps is selected.This selection can be further
improved by selecting the default bit rate which is nearest to
the calculated value.

[1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.12]

Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")

Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 1184527..d7bf59f 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -917,10 +917,18 @@ static int rcsi2_phtw_write_mbps(struct rcar_csi2 *priv, unsigned int mbps,
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
+
 
 	if (!value->mbps) {
 		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
-- 
2.7.4

