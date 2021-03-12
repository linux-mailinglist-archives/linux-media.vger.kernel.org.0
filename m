Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1E7A338EB9
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 14:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhCLNZq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 08:25:46 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:54043 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229728AbhCLNZY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 08:25:24 -0500
X-Halon-ID: 6365b194-8336-11eb-a076-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 6365b194-8336-11eb-a076-005056917f90;
        Fri, 12 Mar 2021 14:25:23 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-csi2: Enable support for r8a77961
Date:   Fri, 12 Mar 2021 14:24:59 +0100
Message-Id: <20210312132459.1754782-1-niklas.soderlund+renesas@ragnatech.se>
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
 drivers/media/platform/rcar-vin/rcar-csi2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e06cd512aba207a4..71ff20a165d66547 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -1164,6 +1164,10 @@ static const struct of_device_id rcar_csi2_of_table[] = {
 		.compatible = "renesas,r8a7796-csi2",
 		.data = &rcar_csi2_info_r8a7796,
 	},
+	{
+		.compatible = "renesas,r8a77961-csi2",
+		.data = &rcar_csi2_info_r8a7796,
+	},
 	{
 		.compatible = "renesas,r8a77965-csi2",
 		.data = &rcar_csi2_info_r8a77965,
-- 
2.30.1

