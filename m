Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFEF6931C9
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 15:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjBKOxc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 09:53:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjBKOxb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 09:53:31 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA7623C67
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 06:53:29 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id o18so7971489wrj.3
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 06:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C3E7DdRqImDuF4mDF2gXlbpZic0I+kEp75WAj97lWc=;
        b=OYAB5fzraUmCXDOqHjJz4ESUiQlYlvz4lfP9RxfO8X8wOIa3bCSb6Saaaq8ijT1Qlc
         ET6vXdLZKVg2RL5yUpMc3QjCwnD3IwJ4zcMYHc50KoWNjgSNZT2bz1BenArJtoo4uUmC
         g+rozFQ1s/qSNYhnznU3YjZ9FTA+Kzfd7PGtN+KQEjBE06zNZawtzFHaj1zFlj8e11Tt
         vHdBO9SwcyGwscqVj6wRE7p3ugZkmwzCdZYjAU/MB0mdp2pKcqtEFPlTpq+1KODQKYt7
         XH/pYe/Xj2ivuX94hfCqrqWNpX/jnVcTXXESxPM9uNwEE2NH8kzmv75YVsRZEN1p5Ff2
         QL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0C3E7DdRqImDuF4mDF2gXlbpZic0I+kEp75WAj97lWc=;
        b=WbX1ANofyjQ+ABxaAQzvKJGWH4mSx84EgYq/M+Eu8phewmnzpSocUP2n1tHFY3JlOC
         c0v6TbHYp8BRjcBvKKELCXaNYjNeEX7Uj1cTOJv/3j4e6PQEyJoFBSH8XvDIwn3GWrhv
         TtyA3QChghCjy58njy13iL9gWBcV2wZE4nbrSU1TWybs4OTm/ozn8pNcqZQLTQJwjhGR
         aTMgXXVbJrgWGdlgCefYzO6y2tEFGZjAnLBqgDOv1ylpsypNdiohMIs7GuLP1cFTBqfl
         SfSl0m9DZOXO6HVRiP1stUA6hP9hvIlvzi/ODqH9OXDDgQYCjGDLEVjJboB4Ye0omlSX
         7GBw==
X-Gm-Message-State: AO0yUKUiqxjGSl803xQwUSus/gRagVltU2AwZphyi1xkJBjecfe/96o3
        nxna/TPQ1hsxtH5bDpU7p76reQ==
X-Google-Smtp-Source: AK7set90AG/oxLMdr6MMeBqPL0McJZPF1QkOaJ8dv+3idXgz8s9i9poCIKi+BXzid5Ni4SzDWUl+QA==
X-Received: by 2002:a5d:6902:0:b0:2c5:4bcf:c62a with SMTP id t2-20020a5d6902000000b002c54bcfc62amr4176166wru.29.1676127208422;
        Sat, 11 Feb 2023 06:53:28 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id u10-20020a5d514a000000b002c3e28d0343sm6091344wrt.85.2023.02.11.06.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:53:27 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] media: rcar-csi2: Prepare for Gen4 support
Date:   Sat, 11 Feb 2023 15:53:08 +0100
Message-Id: <20230211145310.3819989-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211145310.3819989-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230211145310.3819989-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 .../platform/renesas/rcar-vin/rcar-csi2.c     | 35 +++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
index 174aa6176f54..180926a2722d 100644
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
@@ -1370,12 +1381,16 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7795 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7795es1 = {
+	.start_receiver = rcsi2_start_receiver_gen3,
+	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_m3w_h3es1,
 	.num_channels = 4,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7795es2 = {
 	.init_phtw = rcsi2_init_phtw_h3es2,
+	.start_receiver = rcsi2_start_receiver_gen3,
+	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_h3_v3h_m3n,
 	.csi0clkfreqrange = 0x20,
 	.num_channels = 4,
@@ -1383,17 +1398,23 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a7795es2 = {
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7796 = {
+	.start_receiver = rcsi2_start_receiver_gen3,
+	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_m3w_h3es1,
 	.num_channels = 4,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77961 = {
+	.start_receiver = rcsi2_start_receiver_gen3,
+	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_m3w_h3es1,
 	.num_channels = 4,
 };
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a77965 = {
 	.init_phtw = rcsi2_init_phtw_h3_v3h_m3n,
+	.start_receiver = rcsi2_start_receiver_gen3,
+	.enter_standby = rcsi2_enter_standby_gen3,
 	.hsfreqrange = hsfreqrange_h3_v3h_m3n,
 	.csi0clkfreqrange = 0x20,
 	.num_channels = 4,
@@ -1403,11 +1424,15 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77965 = {
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
@@ -1416,11 +1441,15 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
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
2.39.1

