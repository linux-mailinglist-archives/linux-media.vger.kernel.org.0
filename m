Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB507267F74
	for <lists+linux-media@lfdr.de>; Sun, 13 Sep 2020 14:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbgIMMSJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Sep 2020 08:18:09 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:42555 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725928AbgIMMSF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Sep 2020 08:18:05 -0400
X-Halon-ID: 295e9f0e-f5bb-11ea-a39b-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 295e9f0e-f5bb-11ea-a39b-005056917f90;
        Sun, 13 Sep 2020 14:18:02 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] rcar-vin: Remove redundant compatible values
Date:   Sun, 13 Sep 2020 14:17:56 +0200
Message-Id: <20200913121757.1790644-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mandatory compatible value 'renesas,rcar-gen2-vin' was added to all
Gen2 DTS files in 2017, remove the redundant device specific values from
the driver.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 7440c8965d27e64f..aad8eef2ac9f641b 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -1228,22 +1228,6 @@ static const struct of_device_id rvin_of_id_table[] = {
 		.compatible = "renesas,vin-r8a7779",
 		.data = &rcar_info_h1,
 	},
-	{
-		.compatible = "renesas,vin-r8a7790",
-		.data = &rcar_info_gen2,
-	},
-	{
-		.compatible = "renesas,vin-r8a7791",
-		.data = &rcar_info_gen2,
-	},
-	{
-		.compatible = "renesas,vin-r8a7793",
-		.data = &rcar_info_gen2,
-	},
-	{
-		.compatible = "renesas,vin-r8a7794",
-		.data = &rcar_info_gen2,
-	},
 	{
 		.compatible = "renesas,rcar-gen2-vin",
 		.data = &rcar_info_gen2,
-- 
2.28.0

