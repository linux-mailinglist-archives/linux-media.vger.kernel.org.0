Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0A551F7C3
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 17:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbfEOPjX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 11:39:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58890 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfEOPjW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 11:39:22 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CBA7E2;
        Wed, 15 May 2019 17:39:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557934756;
        bh=Zp3Lv0m3vU2zgVNKM1Te70YRMcJpModOGtoRmmKUba0=;
        h=From:To:Cc:Subject:Date:From;
        b=wQYBRfJtBiUF2ywgRp+5niIx2ZxsnoI4EbZo/UyY7oECUNXQr/9KG6swcv1bv6HEn
         14W/u1rxlta1Cg5/qXtZe2Wohdu/0De8Dztlassi9RfiuGCut1Pu7hgepgBnx/zVSy
         YHz1ryhBdLIkWt4zn5TrNWz6s40hKiMWE6O9hakY=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] media: fdp1: Support M3N and E3 platforms
Date:   Wed, 15 May 2019 16:39:12 +0100
Message-Id: <20190515153912.5182-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

New Gen3 R-Car platforms incorporate the FDP1 with an updated version
register. No code change is required to support these targets, but they
will currently report an error stating that the device can not be
identified.

Update the driver to match against the new device types.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar_fdp1.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
index 6bda1eee9170..4f103be215d3 100644
--- a/drivers/media/platform/rcar_fdp1.c
+++ b/drivers/media/platform/rcar_fdp1.c
@@ -257,6 +257,8 @@ MODULE_PARM_DESC(debug, "activate debug info");
 #define FD1_IP_H3_ES1			0x02010101
 #define FD1_IP_M3W			0x02010202
 #define FD1_IP_H3			0x02010203
+#define FD1_IP_M3N			0x02010204
+#define FD1_IP_E3			0x02010205
 
 /* LUTs */
 #define FD1_LUT_DIF_ADJ			0x1000
@@ -2365,6 +2367,12 @@ static int fdp1_probe(struct platform_device *pdev)
 	case FD1_IP_H3:
 		dprintk(fdp1, "FDP1 Version R-Car H3\n");
 		break;
+	case FD1_IP_M3N:
+		dprintk(fdp1, "FDP1 Version R-Car M3N\n");
+		break;
+	case FD1_IP_E3:
+		dprintk(fdp1, "FDP1 Version R-Car E3\n");
+		break;
 	default:
 		dev_err(fdp1->dev, "FDP1 Unidentifiable (0x%08x)\n",
 				hw_version);
-- 
2.20.1

