Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252EC36DB7E
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237268AbhD1P0D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 11:26:03 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:56546 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230527AbhD1P0D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 11:26:03 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4063B405C3;
        Wed, 28 Apr 2021 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619623518; bh=EIYG6JjhDPjkluDzN5n/M9ZenHvTzZ4e//kR0u2y2CE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=PW7xuBIsmUZGwjkrAHFwXmBBQImaC1i1oKPSZqRxECT1C9V1ui7wqUcjte6P+RRJA
         cQ0gcXVXgXfk3cXIdl/u/Fiy9brA1LelY9sHCqlGqo0icx7bTi+4cZjUtbhoi3b3Pc
         YP+orlIsqAse2NUzZU/jzN11wUX1IUDUJL8BoWCHH7rENV//bV42VEMHMRnwRmPank
         I2EVbHYS964OuNb9CY3u8/g+pnFcsOl/f2dH6x2OVaAf23A+XqJT9wAjZF/vV9XThu
         5znUqY/qduvUen5HxHxgaI45dqBAFUosq0PTQ2ppNCuFq+NdfQWbmnmOref5V3miBA
         BnQU8g7FYKQ7w==
Received: from de02dwvm009.internal.synopsys.com (de02dwvm009.internal.synopsys.com [10.225.17.73])
        by mailhost.synopsys.com (Postfix) with ESMTP id AFFC3A0099;
        Wed, 28 Apr 2021 15:25:16 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From:   Nelson Costa <Nelson.Costa@synopsys.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Nelson Costa <Nelson.Costa@synopsys.com>
Subject: [RFC 7/8] media: dwc: dw-hdmi-rx: Add support for Aspect Ratio
Date:   Wed, 28 Apr 2021 17:25:10 +0200
Message-Id: <0acdcfbe29d2cbb2974377d79391e55f5b489851.1618937288.git.nelson.costa@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1618937288.git.nelson.costa@synopsys.com>
References: <cover.1618937288.git.nelson.costa@synopsys.com>
In-Reply-To: <cover.1618937288.git.nelson.costa@synopsys.com>
References: <cover.1618937288.git.nelson.costa@synopsys.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds support to get aspect ratio for the current
video being received and provide the info through v4l2
API query_dv_timings.

Signed-off-by: Nelson Costa <nelson.costa@synopsys.com>
---
 drivers/media/platform/dwc/dw-hdmi-rx.c | 54 +++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/dwc/dw-hdmi-rx.c b/drivers/media/platform/dwc/dw-hdmi-rx.c
index 07ac62f..78d9ef3 100644
--- a/drivers/media/platform/dwc/dw-hdmi-rx.c
+++ b/drivers/media/platform/dwc/dw-hdmi-rx.c
@@ -2252,13 +2252,31 @@ static u32 dw_hdmi_get_width(struct dw_hdmi_dev *dw_dev)
 	return width;
 }
 
+static int dw_hdmi_vic_to_cea861(u8 hdmi_vic)
+{
+	switch (hdmi_vic) {
+	case 1:
+		return 95;
+	case 2:
+		return 94;
+	case 3:
+		return 93;
+	case 4:
+		return 98;
+	default:
+		return 0;
+	}
+}
+
 static int dw_hdmi_query_dv_timings(struct v4l2_subdev *sd,
 				    struct v4l2_dv_timings *timings)
 {
 	struct dw_hdmi_dev *dw_dev = to_dw_dev(sd);
 	struct v4l2_bt_timings *bt = &timings->bt;
+	struct v4l2_dv_timings t = {0};
 	bool is_hdmi_vic;
 	u32 htot, hofs;
+	u8 cea861_vic;
 	u32 vtot;
 	u8 vic;
 
@@ -2353,8 +2371,40 @@ static int dw_hdmi_query_dv_timings(struct v4l2_subdev *sd,
 		}
 	}
 
-	dev_dbg(dw_dev->dev, "%s: width=%u, height=%u, mbuscode=%u\n", __func__,
-		bt->width, bt->height, dw_hdmi_get_mbus_code(dw_dev));
+	if (is_hdmi_vic)
+		cea861_vic = dw_hdmi_vic_to_cea861(bt->hdmi_vic);
+	else
+		cea861_vic = vic;
+
+	/* picture aspect ratio based on v4l2 dv timings array */
+	if (v4l2_find_dv_timings_cea861_vic(&t, cea861_vic)) {
+		/* when the numerator/denominator are zero means that the
+		 * picture aspect ratio is the same of the active measures ratio
+		 */
+		if (!t.bt.picture_aspect.numerator) {
+			unsigned long n, d;
+
+			rational_best_approximation(t.bt.width, t.bt.height,
+						    t.bt.width, t.bt.height,
+						    &n, &d);
+			t.bt.picture_aspect.numerator = n;
+			t.bt.picture_aspect.denominator = d;
+		}
+
+		bt->picture_aspect = t.bt.picture_aspect;
+	} else {
+		bt->picture_aspect.numerator = 0;
+		bt->picture_aspect.denominator = 0;
+		dev_dbg(dw_dev->dev,
+			"%s: cea861_vic=%d was not found in v4l2 dv timings",
+			__func__, cea861_vic);
+	}
+
+	dev_dbg(dw_dev->dev,
+		"%s: width=%u, height=%u, mbuscode=%u, cea861_vic=%d, ar={%d,%d}\n",
+		__func__, bt->width, bt->height, dw_hdmi_get_mbus_code(dw_dev),
+		cea861_vic, bt->picture_aspect.numerator,
+		bt->picture_aspect.denominator);
 
 	return 0;
 }
-- 
2.7.4

