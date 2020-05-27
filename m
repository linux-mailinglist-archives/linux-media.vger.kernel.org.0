Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8851E49A6
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 18:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730906AbgE0QRz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 12:17:55 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:45228 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgE0QRy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 12:17:54 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 4ADCB3C057C;
        Wed, 27 May 2020 18:17:52 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RdC2p4ao6eab; Wed, 27 May 2020 18:17:47 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 5985E3C0579;
        Wed, 27 May 2020 18:17:47 +0200 (CEST)
Received: from vmlxhi-121.localdomain (10.72.94.22) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 27 May
 2020 18:17:47 +0200
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Michael Rodin <mrodin@de.adit-jv.com>, <michael@rodin.online>,
        <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>,
        Suresh Udipi <sudipi@jp.adit-jv.com>
Subject: [PATCH] rcar-vin: rcar-csi2: Select the correct PHTW register
Date:   Wed, 27 May 2020 18:17:35 +0200
Message-ID: <1590596255-17470-1-git-send-email-mrodin@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20200512213045.GC2542285@oden.dyn.berto.se>
References: <20200512213045.GC2542285@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.94.22]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Suresh Udipi <sudipi@jp.adit-jv.com>

PHTW register is selected based on default bit rate from Table[1].
for the bit rates less than or equal to 250. Currently first
value of default bit rate which is greater than or equal to
the caculated mbps is selected.This selection can be further
improved by selecting the default bit rate which is nearest to
the calculated value.

[1] specs r19uh0105ej0200-r-car-3rd-generation.pdf [Table 25.12]

Fixes: ADIT v4.14 commit 9e568b895ee0 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")

Signed-off-by: Suresh Udipi <sudipi@jp.adit-jv.com>
Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 687baee..115b0af 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -886,10 +886,18 @@ static int rcsi2_phtw_write_mbps(struct rcar_csi2 *priv, unsigned int mbps,
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

