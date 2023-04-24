Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C336E6ED4F7
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 21:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbjDXTAC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 15:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbjDXTAA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 15:00:00 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB7D5FE8
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 11:59:58 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9536df4b907so881022366b.0
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 11:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1682362796; x=1684954796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3HMfUX0hKXutl63WtepWnzJmhRd3jEgXA+lFtA0IvU=;
        b=gp29EeTnq5CaZDUwi9OLi8eI0JUOTlUZLKDFDogBlVTHyj5RwqoY338RcHbreOIVEJ
         xd2NOpnOs393RWr/Vvo5o+Kvri1yriujUkAL98x5V9RDjeXEbJseOuTX7Tjz+YU/WfTO
         2AQ347VvAekRqXt9CB2c3i6D9eZbn0Lu1SGelWW9X5GZkSlpSKuwOdzPv0M3U2kEeMMW
         RX32roVfaQgHtoQkrdeuc1ySINpxdAxPR8WXmmWB6PDMtSt4RTCgVZA0YOP0hrXfVzXR
         9IN0qA1lN+jawdaKKR09a3hAUP5wTmrJwNK2UlAtQiCeNA4ohup5egQL8v/sgqUIui7h
         X2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682362796; x=1684954796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3HMfUX0hKXutl63WtepWnzJmhRd3jEgXA+lFtA0IvU=;
        b=MTXhhd+O6Rkv1ovwRiEPCktGrXGurxoj4ynQ4IjR7gclJFBFIC2UVGSAxohXAWtS9f
         749NDr1LDPetGkEZnrTUvFvh6eZ4JWx6FfjwIq5TD9ddCuJhIGfkDJsoHpuFbvIa25vH
         hqChAWIo09kxokDK4WnrgYtMVOPtuvwYXEDdDNlT+lciaCPNTsA3xBPs5cnBq5wB/LFL
         yOYQ86P3KP+7DcpK+mh9lsGsgFlL0z+nIZwBQ3cp7OZWce2pWw5gBCndxevr5YaX9Wzl
         VhoT998RN0UxTlQp9KokziENv5/9cvASy3P1mi+dJErpDUIbr4DdMsMgVnI4yM0qU0yH
         lOwQ==
X-Gm-Message-State: AAQBX9eNb45UtCKBfNLJypeZjlE9ESeni0L0ft368GhAT42VaBsUuo8b
        pJTVKqGN6lWt32f4uoyLYj5/Wg==
X-Google-Smtp-Source: AKy350YfkJ4UQM4b06vOXsE7iG32E4owcaqbAWAal5HJzx9Pclg2L7cx2yLWViuQxgS2ffMaL3jFJQ==
X-Received: by 2002:a17:907:674a:b0:953:64f4:e42e with SMTP id qm10-20020a170907674a00b0095364f4e42emr10618935ejc.5.1682362796432;
        Mon, 24 Apr 2023 11:59:56 -0700 (PDT)
Received: from sleipner.berto.se (p54ac52fc.dip0.t-ipconnect.de. [84.172.82.252])
        by smtp.googlemail.com with ESMTPSA id ke15-20020a17090798ef00b0095328ce9c8bsm5849818ejc.67.2023.04.24.11.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 11:59:55 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/3] media: rcar-csi2: Prepare for Gen4 support
Date:   Mon, 24 Apr 2023 20:59:32 +0200
Message-Id: <20230424185934.438059-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424185934.438059-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230424185934.438059-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Prepare the driver for supporting R-Car Gen4. The starting of the
receiver and how to enter standby differs between Gen3 and Gen4,
create function pointers in the device info structure to control the
different behavior.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Rebased to latest media-tree.
---
 .../platform/renesas/rcar-vin/rcar-csi2.c     | 33 +++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
index 5dbd0daa8735..05ea1723f04b 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
@@ -483,6 +483,8 @@ enum rcar_csi2_pads {
 struct rcar_csi2_info {
 	int (*init_phtw)(struct rcar_csi2 *priv, unsigned int mbps);
 	int (*phy_post_init)(struct rcar_csi2 *priv);
+	int (*start_receiver)(struct rcar_csi2 *priv);
+	void (*enter_standby)(struct rcar_csi2 *priv);
 	const struct rcsi2_mbps_reg *hsfreqrange;
 	unsigned int csi0clkfreqrange;
 	unsigned int num_channels;
@@ -533,10 +535,17 @@ static void rcsi2_write(struct rcar_csi2 *priv, unsigned int reg, u32 data)
 	iowrite32(data, priv->base + reg);
 }
 
-static void rcsi2_enter_standby(struct rcar_csi2 *priv)
+static void rcsi2_enter_standby_gen3(struct rcar_csi2 *priv)
 {
 	rcsi2_write(priv, PHYCNT_REG, 0);
 	rcsi2_write(priv, PHTC_REG, PHTC_TESTCLR);
+}
+
+static void rcsi2_enter_standby(struct rcar_csi2 *priv)
+{
+	if (priv->info->enter_standby)
+		priv->info->enter_standby(priv);
+
 	reset_control_assert(priv->rstc);
 	usleep_range(100, 150);
 	pm_runtime_put(priv->dev);
@@ -674,7 +683,7 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 	return 0;
 }
 
-static int rcsi2_start_receiver(struct rcar_csi2 *priv)
+static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
 {
 	const struct rcar_csi2_format *format;
 	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
@@ -821,7 +830,7 @@ static int rcsi2_start(struct rcar_csi2 *priv)
 	if (ret < 0)
 		return ret;
 
-	ret = rcsi2_start_receiver(priv);
+	ret = priv->info->start_receiver(priv);
 	if (ret) {
 		rcsi2_enter_standby(priv);
 		return ret;
@@ -1363,6 +1372,8 @@ static int rcsi2_probe_resources(struct rcar_csi2 *priv,
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7795 = {
 	.init_phtw = rcsi2_init_phtw_h3_v3h_m3n,
+	.start_receiver = rcsi2_start_receiver_gen3,
+	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_h3_v3h_m3n,
 	.csi0clkfreqrange = 0x20,
 	.num_channels = 4,
@@ -1371,6 +1382,8 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7795 = {
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7795es2 = {
 	.init_phtw = rcsi2_init_phtw_h3es2,
+	.start_receiver = rcsi2_start_receiver_gen3,
+	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_h3_v3h_m3n,
 	.csi0clkfreqrange = 0x20,
 	.num_channels = 4,
@@ -1378,17 +1391,23 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7795es2 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7796 = {
+	.start_receiver = rcsi2_start_receiver_gen3,
+	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_m3w,
 	.num_channels = 4,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77961 = {
+	.start_receiver = rcsi2_start_receiver_gen3,
+	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_m3w,
 	.num_channels = 4,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77965 = {
 	.init_phtw = rcsi2_init_phtw_h3_v3h_m3n,
+	.start_receiver = rcsi2_start_receiver_gen3,
+	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_h3_v3h_m3n,
 	.csi0clkfreqrange = 0x20,
 	.num_channels = 4,
@@ -1398,11 +1417,15 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77965 = {
 static const struct rcar_csi2_info rcar_csi2_info_r8a77970 = {
 	.init_phtw = rcsi2_init_phtw_v3m_e3,
 	.phy_post_init = rcsi2_phy_post_init_v3m_e3,
+	.start_receiver = rcsi2_start_receiver_gen3,
+	.enter_standby = rcsi2_enter_standby_gen3,
 	.num_channels = 4,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
 	.init_phtw = rcsi2_init_phtw_h3_v3h_m3n,
+	.start_receiver = rcsi2_start_receiver_gen3,
+	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_h3_v3h_m3n,
 	.csi0clkfreqrange = 0x20,
 	.clear_ulps = true,
@@ -1411,11 +1434,15 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
 static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
 	.init_phtw = rcsi2_init_phtw_v3m_e3,
 	.phy_post_init = rcsi2_phy_post_init_v3m_e3,
+	.start_receiver = rcsi2_start_receiver_gen3,
+	.enter_standby = rcsi2_enter_standby_gen3,
 	.num_channels = 2,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
 	.init_phtw = rcsi2_init_phtw_v3u,
+	.start_receiver = rcsi2_start_receiver_gen3,
+	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_v3u,
 	.csi0clkfreqrange = 0x20,
 	.clear_ulps = true,
-- 
2.40.0

