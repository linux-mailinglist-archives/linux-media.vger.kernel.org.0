Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 380981FEFB2
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 12:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbgFRKev (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 06:34:51 -0400
Received: from ma-dnext02.denso.co.jp ([133.192.181.77]:54011 "EHLO
        ma-dnext02.denso.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgFRKer (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 06:34:47 -0400
Received: from grdma01h.denso.co.jp (unknown [133.192.24.24])
        by ma-dnext02.denso.co.jp (Postfix) with ESMTP id 5BC9B31C2EF;
        Thu, 18 Jun 2020 19:34:44 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=adit-jv.com;
        s=jpadit-jvmail2011; t=1592476484;
        bh=+trNuZ/6D8LtwN5zjuN0TnCITVnaRRbPnaBDq3L5rDU=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=JBVcMSOk3ZkEux7hEIxld9hXmGk3+lCmCdOw2cFU9ZJg7m5cdsNGH4jiOgSYsuOjI
         7iIRnvcMgaV4WA4baryWCIGXhoHLGcBSAQTNwHGPBXqHssyfUe7DvV/lH0Q+zRTyQ+
         3ul1p2b+28D/VqNa6X29eeSH0zdujrNFlYZtM27L4iCsLgyQbU3MMOSWytfprXMENu
         EkKcGjRBYrYy+qkq+0uTrehNjnZcXySQhOEfyWp7+HXCkkPeteppHDYpjmnmbgZDfQ
         81k1xJ0YaauaxwsBg4eaj9OsaoflddtZLv3Qzbe2RKaivJo/FphFKokEpSO03DNPz1
         vETyPD5OrX1pg==
Received: by grdma01h.denso.co.jp (Postfix, from userid 0)
        id 52B09C0BDA9; Thu, 18 Jun 2020 19:34:44 +0900 (JST)
Received: from smtp0.denso.co.jp [133.192.24.87] 
         by grdma01h. with ESMTP id VAA11555;
         Thu, 18 Jun 2020 19:34:44 +0900
Received: from ky0exch01.adit-jv.com ([10.71.113.8])
        by smtp00.denso.co.jp (MOS 4.4.7-GA)
        with ESMTP id GBQ29320;
        Thu, 18 Jun 2020 19:34:43 +0900
Received: from jp-u0004.adit-jv.com (10.71.112.120) by ky0exch01.adit-jv.com
 (10.71.113.8) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 18 Jun
 2020 19:34:43 +0900
From:   Suresh Udipi <sudipi@jp.adit-jv.com>
To:     <mrodin@de.adit-jv.com>
CC:     <akiyama@nds-osk.co.jp>, <efriedrich@de.adit-jv.com>,
        <erosca@de.adit-jv.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <mchehab@kernel.org>, <michael@rodin.online>,
        <niklas.soderlund@ragnatech.se>, <securitycheck@denso.co.jp>,
        <sudipi@jp.adit-jv.com>
Subject: [PATCH v8 2/3] media: rcar-csi2: Add warning for PHY speed less than minimum
Date:   Thu, 18 Jun 2020 19:34:31 +0900
Message-ID: <1592476472-26235-2-git-send-email-sudipi@jp.adit-jv.com>
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

Add a warning message when the selected PHY speed is less
than supported minimum PHY speed given in the hsfreq table[1].

For raspberry pi camera capture on Kingfisher board with resolution
640x480, the calculated PHY speed is 48 mbps which is less than
the minimum PHY speed 80 Mbps from the table[1]. But in this cases
capture is successful.

[1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.9]

Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
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

