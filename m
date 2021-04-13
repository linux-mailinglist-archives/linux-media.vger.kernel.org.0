Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F36B35E5DC
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 20:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347504AbhDMSEZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 14:04:25 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:27654 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237671AbhDMSEW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 14:04:22 -0400
X-Halon-ID: a026fc46-9c82-11eb-aed0-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id a026fc46-9c82-11eb-aed0-005056917f90;
        Tue, 13 Apr 2021 20:04:01 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 02/11] rcar-vin: Fix error paths for rvin_mc_init()
Date:   Tue, 13 Apr 2021 20:02:44 +0200
Message-Id: <20210413180253.2575451-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The error paths of rvin_mc_init() do not clean up properly, fix this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index c798dc9409e4cdcd..d4932f7b42647ee1 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -946,17 +946,23 @@ static int rvin_mc_init(struct rvin_dev *vin)
 	if (ret)
 		return ret;
 
+	ret = rvin_create_controls(vin, NULL);
+	if (ret < 0)
+		return ret;
+
 	ret = rvin_group_get(vin);
 	if (ret)
-		return ret;
+		goto err_controls;
 
 	ret = rvin_mc_parse_of_graph(vin);
 	if (ret)
-		rvin_group_put(vin);
+		goto err_group;
 
-	ret = rvin_create_controls(vin, NULL);
-	if (ret < 0)
-		return ret;
+	return 0;
+err_group:
+	rvin_group_put(vin);
+err_controls:
+	rvin_free_controls(vin);
 
 	return ret;
 }
-- 
2.31.1

