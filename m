Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5BB91F6E00
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 21:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgFKTdF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 15:33:05 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:16129 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725799AbgFKTdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 15:33:05 -0400
X-Halon-ID: 4cab2a92-ac1a-11ea-8fb8-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 4cab2a92-ac1a-11ea-8fb8-005056917f90;
        Thu, 11 Jun 2020 21:33:03 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] rcar-csi2: Rename confirm_start() to phy_post_init() to match its usage
Date:   Thu, 11 Jun 2020 21:32:32 +0200
Message-Id: <20200611193232.128721-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the driver was picked-up the starting of the PHY have changed
quiet a bit. An artifact of these changes is the now poorly named
callback confirm_start(). It used to confirm start of the PHY but now
performs post PHY start initialization, rename it to phy_post_init() to
reflect this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 151e6a90c5fbc70e..6dbfac9dcf775f84 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -344,7 +344,7 @@ enum rcar_csi2_pads {
 
 struct rcar_csi2_info {
 	int (*init_phtw)(struct rcar_csi2 *priv, unsigned int mbps);
-	int (*confirm_start)(struct rcar_csi2 *priv);
+	int (*phy_post_init)(struct rcar_csi2 *priv);
 	const struct rcsi2_mbps_reg *hsfreqrange;
 	unsigned int csi0clkfreqrange;
 	unsigned int num_channels;
@@ -575,9 +575,9 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 	if (ret)
 		return ret;
 
-	/* Confirm start */
-	if (priv->info->confirm_start) {
-		ret = priv->info->confirm_start(priv);
+	/* Run post PHY start initialization, if needed. */
+	if (priv->info->phy_post_init) {
+		ret = priv->info->phy_post_init(priv);
 		if (ret)
 			return ret;
 	}
@@ -975,7 +975,7 @@ static int rcsi2_init_phtw_v3m_e3(struct rcar_csi2 *priv, unsigned int mbps)
 	return rcsi2_phtw_write_mbps(priv, mbps, phtw_mbps_v3m_e3, 0x44);
 }
 
-static int rcsi2_confirm_start_v3m_e3(struct rcar_csi2 *priv)
+static int rcsi2_phy_post_init_v3m_e3(struct rcar_csi2 *priv)
 {
 	static const struct phtw_value step1[] = {
 		{ .data = 0xee, .code = 0x34 },
@@ -1059,7 +1059,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77965 = {
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77970 = {
 	.init_phtw = rcsi2_init_phtw_v3m_e3,
-	.confirm_start = rcsi2_confirm_start_v3m_e3,
+	.phy_post_init = rcsi2_phy_post_init_v3m_e3,
 	.num_channels = 4,
 };
 
@@ -1072,7 +1072,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
 	.init_phtw = rcsi2_init_phtw_v3m_e3,
-	.confirm_start = rcsi2_confirm_start_v3m_e3,
+	.phy_post_init = rcsi2_phy_post_init_v3m_e3,
 	.num_channels = 2,
 };
 
-- 
2.27.0

