Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E14BF338E4A
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 14:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhCLNGS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 08:06:18 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:61666 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230383AbhCLNGC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 08:06:02 -0500
X-Halon-ID: a7c5fd4d-8333-11eb-a542-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id a7c5fd4d-8333-11eb-a542-005056917a89;
        Fri, 12 Mar 2021 14:06:01 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-vin: Enable support for r8a77961
Date:   Fri, 12 Mar 2021 14:05:43 +0100
Message-Id: <20210312130543.1744180-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable support for M3-W+ (r8a77961).

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index cb3025992817d625..33957cc9118ca79e 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -1362,6 +1362,10 @@ static const struct of_device_id rvin_of_id_table[] = {
 		.compatible = "renesas,vin-r8a7796",
 		.data = &rcar_info_r8a7796,
 	},
+	{
+		.compatible = "renesas,vin-r8a77961",
+		.data = &rcar_info_r8a7796,
+	},
 	{
 		.compatible = "renesas,vin-r8a77965",
 		.data = &rcar_info_r8a77965,
-- 
2.30.1

