Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E984C6931CB
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 15:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjBKOxe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 09:53:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBKOxd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 09:53:33 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C836716AFE
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 06:53:30 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id o15so4647804wrc.9
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 06:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WzWTC1OK35L2q0XDnXs0HDojEmEaCiJGgCGOwDmN3U=;
        b=wZNt/oNrLBahouAww37hHpKvLzpIuCDPaSG7recdkDzART+GzA2h2k6AEuqqT/eNqy
         7rErJuqg3Gco7ZDixt83bxZTi5fgrx1KVWOqxLTdpwtR3kM3kfsurFOWQMBJ2/ebDopr
         2zUaO/DMvbF1Qq4IQ0ogrz/kMjw+QpWxyY8+8Yt2jKgNIZLUk+H/B6biINymwF+Igyqe
         O6SxaP3541edpMpjO26+VklxpYfulX39s2SIFXvpvK3pySlGWn/l2tOEjtwTdFKFDHGA
         SQEK3ouwFZ7oXgGuLeD39p7QOjl3FdXZBu8+PaWdl5plPzhAo+irU02a580/rG49DC9r
         Kh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WzWTC1OK35L2q0XDnXs0HDojEmEaCiJGgCGOwDmN3U=;
        b=NnJjTG5qwaAo5JrlQze3rwZ3LKIBj6mIKRYEPnRIFubTsNrNgP8u3ILq7D9XfSEfKg
         MIBgWZXaKiL25jNjkW1w8mHNBQwhJB981IXnwb4/RH1v+vWKwdEM1sneplhi+s3TDLCw
         Uit8qxRUXCws/EC0+OWNWsTD1F7IDG/FRXASQIv3DPQ8pXdq023U+T3WSvsZnBXzJgWi
         LCySQw9WJzHWWGaiPAkMYu0zlQdlE2BfFz2IyccfrKJ0qN7x+lGm0rADfeQCISvYhMyg
         Lplq7FmnOp1/+2aGaE7ChXp/nLaEu3nvKaiTQptK/eWBr9zR9gDTAfadVYSUaU59kZlo
         uLMA==
X-Gm-Message-State: AO0yUKVAuY14s1yLNsPKAdsn69ubdZkydmw0uun5PuTBqsVVCQhvO+wc
        +ZFhCCJW8z5TN2STmCvDn/sj3YtWUvqm8pFZAY0=
X-Google-Smtp-Source: AK7set/j9tiTODU2NMQBZSIt9Ir1cbHo5Pdbutb6N2rCQTU26fFo2HsCYb2xDYtOGdCeaYiYMPR/nA==
X-Received: by 2002:adf:b19b:0:b0:2c5:4f45:90b0 with SMTP id q27-20020adfb19b000000b002c54f4590b0mr1082009wra.3.1676127210223;
        Sat, 11 Feb 2023 06:53:30 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id u10-20020a5d514a000000b002c3e28d0343sm6091344wrt.85.2023.02.11.06.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:53:29 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] media: rcar-csi2: Add support for C-PHY on R-Car V4H
Date:   Sat, 11 Feb 2023 15:53:10 +0100
Message-Id: <20230211145310.3819989-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211145310.3819989-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230211145310.3819989-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for C-PHY on R-Car V4H. While the V4H supports both D-PHY
and C-PHY this patch only adds support for the C-PHY mode due to lack of
documentation and hardware to test on.

The V4H is the first Gen4 device that is enabled in the rcar-csi2
driver. There is much overlap with the Gen3 driver, the primary
difference is in how the receiver is started. The V4H have a much larger
register space and some addresses overlap with Gen3.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-csi2.c     | 288 ++++++++++++++++++
 1 file changed, 288 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
index 5fa4a29064fd..667e24a78087 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
@@ -133,6 +133,111 @@ struct rcar_csi2;
 #define PHYFRX_FORCERX_MODE_1		BIT(1)
 #define PHYFRX_FORCERX_MODE_0		BIT(0)
 
+/* V4H BASE registers */
+#define V4H_N_LANES_REG					0x0004
+#define V4H_CSI2_RESETN_REG				0x0008
+#define V4H_PHY_MODE_REG				0x001c
+#define V4H_PHY_SHUTDOWNZ_REG				0x0040
+#define V4H_DPHY_RSTZ_REG				0x0044
+#define V4H_FLDC_REG					0x0804
+#define V4H_FLDD_REG					0x0808
+#define V4H_IDIC_REG					0x0810
+#define V4H_PHY_EN_REG					0x2000
+
+#define V4H_ST_PHYST_REG				0x2814
+#define V4H_ST_PHYST_ST_PHY_READY			BIT(31)
+#define V4H_ST_PHYST_ST_STOPSTATE_3			BIT(3)
+#define V4H_ST_PHYST_ST_STOPSTATE_2			BIT(2)
+#define V4H_ST_PHYST_ST_STOPSTATE_1			BIT(1)
+#define V4H_ST_PHYST_ST_STOPSTATE_0			BIT(0)
+
+/* V4H PPI registers */
+#define V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(n)		(0x21800 + ((n) * 2)) /* n = 0 - 9 */
+#define V4H_PPI_STARTUP_RW_COMMON_STARTUP_1_1_REG	0x21822
+#define V4H_PPI_CALIBCTRL_RW_COMMON_BG_0_REG		0x2184c
+#define V4H_PPI_RW_LPDCOCAL_TIMEBASE_REG		0x21c02
+#define V4H_PPI_RW_LPDCOCAL_NREF_REG			0x21c04
+#define V4H_PPI_RW_LPDCOCAL_NREF_RANGE_REG		0x21c06
+#define V4H_PPI_RW_LPDCOCAL_TWAIT_CONFIG_REG		0x21c0a
+#define V4H_PPI_RW_LPDCOCAL_VT_CONFIG_REG		0x21c0c
+#define V4H_PPI_RW_LPDCOCAL_COARSE_CFG_REG		0x21c10
+#define V4H_PPI_RW_COMMON_CFG_REG			0x21c6c
+#define V4H_PPI_RW_TERMCAL_CFG_0_REG			0x21c80
+#define V4H_PPI_RW_OFFSETCAL_CFG_0_REG			0x21ca0
+
+/* V4H CORE registers */
+#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(n)	(0x22040 + ((n) * 2)) /* n = 0 - 15 */
+#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_REG(n)	(0x22440 + ((n) * 2)) /* n = 0 - 15 */
+#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_REG(n)	(0x22840 + ((n) * 2)) /* n = 0 - 15 */
+#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_REG(n)	(0x22c40 + ((n) * 2)) /* n = 0 - 15 */
+#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_REG(n)	(0x23040 + ((n) * 2)) /* n = 0 - 15 */
+#define V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(n)	(0x23840 + ((n) * 2)) /* n = 0 - 11 */
+#define V4H_CORE_DIG_RW_COMMON_REG(n)			(0x23880 + ((n) * 2)) /* n = 0 - 15 */
+#define V4H_CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_REG(n)	(0x239e0 + ((n) * 2)) /* n = 0 - 3 */
+#define V4H_CORE_DIG_CLANE_1_RW_CFG_0_REG		0x2a400
+#define V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG		0x2a60c
+
+/* V4H C-PHY */
+#define V4H_CORE_DIG_RW_TRIO0_REG(n)			(0x22100 + ((n) * 2)) /* n = 0 - 3 */
+#define V4H_CORE_DIG_RW_TRIO1_REG(n)			(0x22500 + ((n) * 2)) /* n = 0 - 3 */
+#define V4H_CORE_DIG_RW_TRIO2_REG(n)			(0x22900 + ((n) * 2)) /* n = 0 - 3 */
+#define V4H_CORE_DIG_CLANE_0_RW_LP_0_REG		0x2a080
+#define V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(n)		(0x2a100 + ((n) * 2)) /* n = 0 - 6 */
+#define V4H_CORE_DIG_CLANE_1_RW_LP_0_REG		0x2a480
+#define V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(n)		(0x2a500 + ((n) * 2)) /* n = 0 - 6 */
+#define V4H_CORE_DIG_CLANE_2_RW_LP_0_REG		0x2a880
+#define V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(n)		(0x2a900 + ((n) * 2)) /* n = 0 - 6 */
+
+struct rcsi2_cphy_setting {
+	u16 msps;
+	u16 rx2;
+	u16 trio0;
+	u16 trio1;
+	u16 trio2;
+	u16 lane27;
+	u16 lane29;
+};
+
+static const struct rcsi2_cphy_setting cphy_setting_table_r8a779g0[] = {
+	{ .msps =   80, .rx2 = 0x38, .trio0 = 0x024a, .trio1 = 0x0134, .trio2 = 0x6a, .lane27 = 0x0000, .lane29 = 0x0a24 },
+	{ .msps =  100, .rx2 = 0x38, .trio0 = 0x024a, .trio1 = 0x00f5, .trio2 = 0x55, .lane27 = 0x0000, .lane29 = 0x0a24 },
+	{ .msps =  200, .rx2 = 0x38, .trio0 = 0x024a, .trio1 = 0x0077, .trio2 = 0x2b, .lane27 = 0x0000, .lane29 = 0x0a44 },
+	{ .msps =  300, .rx2 = 0x38, .trio0 = 0x024a, .trio1 = 0x004d, .trio2 = 0x1d, .lane27 = 0x0000, .lane29 = 0x0a44 },
+	{ .msps =  400, .rx2 = 0x38, .trio0 = 0x024a, .trio1 = 0x0038, .trio2 = 0x16, .lane27 = 0x0000, .lane29 = 0x0a64 },
+	{ .msps =  500, .rx2 = 0x38, .trio0 = 0x024a, .trio1 = 0x002b, .trio2 = 0x12, .lane27 = 0x0000, .lane29 = 0x0a64 },
+	{ .msps =  600, .rx2 = 0x38, .trio0 = 0x024a, .trio1 = 0x0023, .trio2 = 0x0f, .lane27 = 0x0000, .lane29 = 0x0a64 },
+	{ .msps =  700, .rx2 = 0x38, .trio0 = 0x024a, .trio1 = 0x001d, .trio2 = 0x0d, .lane27 = 0x0000, .lane29 = 0x0a84 },
+	{ .msps =  800, .rx2 = 0x38, .trio0 = 0x024a, .trio1 = 0x0018, .trio2 = 0x0c, .lane27 = 0x0000, .lane29 = 0x0a84 },
+	{ .msps =  900, .rx2 = 0x38, .trio0 = 0x024a, .trio1 = 0x0015, .trio2 = 0x0b, .lane27 = 0x0000, .lane29 = 0x0a84 },
+	{ .msps = 1000, .rx2 = 0x3e, .trio0 = 0x024a, .trio1 = 0x0012, .trio2 = 0x0a, .lane27 = 0x0400, .lane29 = 0x0a84 },
+	{ .msps = 1100, .rx2 = 0x44, .trio0 = 0x024a, .trio1 = 0x000f, .trio2 = 0x09, .lane27 = 0x0800, .lane29 = 0x0a84 },
+	{ .msps = 1200, .rx2 = 0x4a, .trio0 = 0x024a, .trio1 = 0x000e, .trio2 = 0x08, .lane27 = 0x0c00, .lane29 = 0x0a84 },
+	{ .msps = 1300, .rx2 = 0x51, .trio0 = 0x024a, .trio1 = 0x000c, .trio2 = 0x08, .lane27 = 0x0c00, .lane29 = 0x0aa4 },
+	{ .msps = 1400, .rx2 = 0x57, .trio0 = 0x024a, .trio1 = 0x000b, .trio2 = 0x07, .lane27 = 0x1000, .lane29 = 0x0aa4 },
+	{ .msps = 1500, .rx2 = 0x5d, .trio0 = 0x044a, .trio1 = 0x0009, .trio2 = 0x07, .lane27 = 0x1000, .lane29 = 0x0aa4 },
+	{ .msps = 1600, .rx2 = 0x63, .trio0 = 0x044a, .trio1 = 0x0008, .trio2 = 0x07, .lane27 = 0x1400, .lane29 = 0x0aa4 },
+	{ .msps = 1700, .rx2 = 0x6a, .trio0 = 0x044a, .trio1 = 0x0007, .trio2 = 0x06, .lane27 = 0x1400, .lane29 = 0x0aa4 },
+	{ .msps = 1800, .rx2 = 0x70, .trio0 = 0x044a, .trio1 = 0x0007, .trio2 = 0x06, .lane27 = 0x1400, .lane29 = 0x0aa4 },
+	{ .msps = 1900, .rx2 = 0x76, .trio0 = 0x044a, .trio1 = 0x0006, .trio2 = 0x06, .lane27 = 0x1400, .lane29 = 0x0aa4 },
+	{ .msps = 2000, .rx2 = 0x7c, .trio0 = 0x044a, .trio1 = 0x0005, .trio2 = 0x06, .lane27 = 0x1800, .lane29 = 0x0aa4 },
+	{ .msps = 2100, .rx2 = 0x83, .trio0 = 0x044a, .trio1 = 0x0005, .trio2 = 0x05, .lane27 = 0x1800, .lane29 = 0x0aa4 },
+	{ .msps = 2200, .rx2 = 0x89, .trio0 = 0x064a, .trio1 = 0x0004, .trio2 = 0x05, .lane27 = 0x1800, .lane29 = 0x0aa4 },
+	{ .msps = 2300, .rx2 = 0x8f, .trio0 = 0x064a, .trio1 = 0x0003, .trio2 = 0x05, .lane27 = 0x1800, .lane29 = 0x0aa4 },
+	{ .msps = 2400, .rx2 = 0x95, .trio0 = 0x064a, .trio1 = 0x0003, .trio2 = 0x05, .lane27 = 0x1800, .lane29 = 0x0aa4 },
+	{ .msps = 2500, .rx2 = 0x9c, .trio0 = 0x064a, .trio1 = 0x0003, .trio2 = 0x05, .lane27 = 0x1c00, .lane29 = 0x0aa4 },
+	{ .msps = 2600, .rx2 = 0xa2, .trio0 = 0x064a, .trio1 = 0x0002, .trio2 = 0x05, .lane27 = 0x1c00, .lane29 = 0x0ad4 },
+	{ .msps = 2700, .rx2 = 0xa8, .trio0 = 0x064a, .trio1 = 0x0002, .trio2 = 0x05, .lane27 = 0x1c00, .lane29 = 0x0ad4 },
+	{ .msps = 2800, .rx2 = 0xae, .trio0 = 0x064a, .trio1 = 0x0002, .trio2 = 0x04, .lane27 = 0x1c00, .lane29 = 0x0ad4 },
+	{ .msps = 2900, .rx2 = 0xb5, .trio0 = 0x084a, .trio1 = 0x0001, .trio2 = 0x04, .lane27 = 0x1c00, .lane29 = 0x0ad4 },
+	{ .msps = 3000, .rx2 = 0xbb, .trio0 = 0x084a, .trio1 = 0x0001, .trio2 = 0x04, .lane27 = 0x1c00, .lane29 = 0x0ad4 },
+	{ .msps = 3100, .rx2 = 0xc1, .trio0 = 0x084a, .trio1 = 0x0001, .trio2 = 0x04, .lane27 = 0x1c00, .lane29 = 0x0ad4 },
+	{ .msps = 3200, .rx2 = 0xc7, .trio0 = 0x084a, .trio1 = 0x0001, .trio2 = 0x04, .lane27 = 0x1c00, .lane29 = 0x0ad4 },
+	{ .msps = 3300, .rx2 = 0xce, .trio0 = 0x084a, .trio1 = 0x0001, .trio2 = 0x04, .lane27 = 0x1c00, .lane29 = 0x0ad4 },
+	{ .msps = 3400, .rx2 = 0xd4, .trio0 = 0x084a, .trio1 = 0x0001, .trio2 = 0x04, .lane27 = 0x1c00, .lane29 = 0x0ad4 },
+	{ .msps = 3500, .rx2 = 0xda, .trio0 = 0x084a, .trio1 = 0x0001, .trio2 = 0x04, .lane27 = 0x1c00, .lane29 = 0x0ad4 },
+	{ /* sentinel */ },
+};
+
 struct phtw_value {
 	u16 data;
 	u16 code;
@@ -538,6 +643,11 @@ static void rcsi2_write(struct rcar_csi2 *priv, unsigned int reg, u32 data)
 	iowrite32(data, priv->base + reg);
 }
 
+static void rcsi2_write16(struct rcar_csi2 *priv, unsigned int reg, u16 data)
+{
+	iowrite16(data, priv->base + reg);
+}
+
 static void rcsi2_enter_standby_gen3(struct rcar_csi2 *priv)
 {
 	rcsi2_write(priv, PHYCNT_REG, 0);
@@ -645,6 +755,10 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
 	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
 	do_div(mbps, lanes * 1000000);
 
+	/* Adjust for C-PHY */
+	if (priv->cphy)
+		do_div(mbps, 2.8);
+
 	return mbps;
 }
 
@@ -833,6 +947,170 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
 	return 0;
 }
 
+static int rcsi2_wait_phy_start_v4h(struct rcar_csi2 *priv, u32 match)
+{
+	unsigned int timeout;
+	u32 status;
+
+	for (timeout = 0; timeout <= 10; timeout++) {
+		status = rcsi2_read(priv, V4H_ST_PHYST_REG);
+		if ((status & match) == match)
+			return 0;
+
+		usleep_range(1000, 2000);
+	}
+
+	return -ETIMEDOUT;
+}
+
+static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
+{
+	const struct rcsi2_cphy_setting *conf;
+
+	for (conf = cphy_setting_table_r8a779g0; conf->msps != 0; conf++) {
+		if (conf->msps > msps)
+			break;
+	}
+
+	if (!conf->msps) {
+		dev_err(priv->dev, "Unsupported PHY speed for msps setting (%u Msps)", msps);
+		return -ERANGE;
+	}
+
+	/* C-PHY specific */
+	rcsi2_write16(priv, V4H_CORE_DIG_RW_COMMON_REG(7), 0x0155);
+	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(7), 0x0068);
+	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(8), 0x0010);
+
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_LP_0_REG, 0x463c);
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_LP_0_REG, 0x463c);
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_LP_0_REG, 0x463c);
+
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(0), 0x00d5);
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(0), 0x00d5);
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(0), 0x00d5);
+
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(1), 0x0013);
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(1), 0x0013);
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(1), 0x0013);
+
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(5), 0x0013);
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(5), 0x0013);
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(5), 0x0013);
+
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(6), 0x000a);
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(6), 0x000a);
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(6), 0x000a);
+
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(2), conf->rx2);
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(2), conf->rx2);
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(2), conf->rx2);
+
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(2), 0x0001);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_REG(2), 0);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_REG(2), 0x0001);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_REG(2), 0x0001);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_REG(2), 0);
+
+	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO0_REG(0), conf->trio0);
+	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO1_REG(0), conf->trio0);
+	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO2_REG(0), conf->trio0);
+
+	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO0_REG(2), conf->trio2);
+	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO1_REG(2), conf->trio2);
+	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO2_REG(2), conf->trio2);
+
+	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO0_REG(1), conf->trio1);
+	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO1_REG(1), conf->trio1);
+	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO2_REG(1), conf->trio1);
+
+	/*
+	 * Configure pin-swap.
+	 * TODO: This registers is not documented yet, the values should depend
+	 * on the 'clock-lanes' and 'data-lanes' devicetree properties.
+	 */
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_CFG_0_REG, 0xf5);
+	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG, 0x5000);
+
+	/* Leave Shutdown mode */
+	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, BIT(0));
+	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, BIT(0));
+
+	/* Wait for calibration */
+	if (rcsi2_wait_phy_start_v4h(priv, V4H_ST_PHYST_ST_PHY_READY)) {
+		dev_err(priv->dev, "PHY calibration failed\n");
+		return -ETIMEDOUT;
+	}
+
+	/* C-PHY setting - analog programing*/
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(9), conf->lane29);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(7), conf->lane27);
+
+	return 0;
+}
+
+static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
+{
+	const struct rcar_csi2_format *format;
+	unsigned int msps, lanes;
+	int ret;
+
+	/* Calculate parameters */
+	format = rcsi2_code_to_fmt(priv->mf.code);
+
+	ret = rcsi2_get_active_lanes(priv, &lanes);
+	if (ret)
+		return ret;
+
+	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	if (msps < 0)
+		return msps;
+
+	/* Reset LINK and PHY*/
+	rcsi2_write(priv, V4H_CSI2_RESETN_REG, 0);
+	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, 0);
+	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, 0);
+
+	/* PHY static setting */
+	rcsi2_write(priv, V4H_PHY_EN_REG, BIT(0));
+	rcsi2_write(priv, V4H_FLDC_REG, 0);
+	rcsi2_write(priv, V4H_FLDD_REG, 0);
+	rcsi2_write(priv, V4H_IDIC_REG, 0);
+	rcsi2_write(priv, V4H_PHY_MODE_REG, BIT(0));
+	rcsi2_write(priv, V4H_N_LANES_REG, lanes - 1);
+
+	/* Reset CSI2 */
+	rcsi2_write(priv, V4H_CSI2_RESETN_REG, BIT(0));
+
+	/* Registers static setting through APB */
+	/* Common setting */
+	rcsi2_write16(priv, V4H_CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_REG(0), 0x1bfd);
+	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_STARTUP_1_1_REG, 0x0233);
+	rcsi2_write16(priv, V4H_PPI_STARTUP_RW_COMMON_DPHY_REG(6), 0x0027);
+	rcsi2_write16(priv, V4H_PPI_CALIBCTRL_RW_COMMON_BG_0_REG, 0x01f4);
+	rcsi2_write16(priv, V4H_PPI_RW_TERMCAL_CFG_0_REG, 0x0013);
+	rcsi2_write16(priv, V4H_PPI_RW_OFFSETCAL_CFG_0_REG, 0x0003);
+	rcsi2_write16(priv, V4H_PPI_RW_LPDCOCAL_TIMEBASE_REG, 0x004f);
+	rcsi2_write16(priv, V4H_PPI_RW_LPDCOCAL_NREF_REG, 0x0320);
+	rcsi2_write16(priv, V4H_PPI_RW_LPDCOCAL_NREF_RANGE_REG, 0x000f);
+	rcsi2_write16(priv, V4H_PPI_RW_LPDCOCAL_TWAIT_CONFIG_REG, 0xfe18);
+	rcsi2_write16(priv, V4H_PPI_RW_LPDCOCAL_VT_CONFIG_REG, 0x0c3c);
+	rcsi2_write16(priv, V4H_PPI_RW_LPDCOCAL_COARSE_CFG_REG, 0x0105);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(6), 0x1000);
+	rcsi2_write16(priv, V4H_PPI_RW_COMMON_CFG_REG, 0x0003);
+
+	/* C-PHY settings */
+	ret = rcsi2_c_phy_setting_v4h(priv, msps);
+	if (ret)
+		return ret;
+
+	rcsi2_wait_phy_start_v4h(priv, V4H_ST_PHYST_ST_STOPSTATE_0 |
+				 V4H_ST_PHYST_ST_STOPSTATE_1 |
+				 V4H_ST_PHYST_ST_STOPSTATE_2);
+
+	return 0;
+}
+
 static int rcsi2_start(struct rcar_csi2 *priv)
 {
 	int ret;
@@ -1503,6 +1781,12 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
 	.support_dphy = true,
 };
 
+static const struct rcar_csi2_info rcar_csi2_info_r8a779g0 = {
+	.start_receiver = rcsi2_start_receiver_v4h,
+	.use_isp = true,
+	.support_cphy = true,
+};
+
 static const struct of_device_id rcar_csi2_of_table[] = {
 	{
 		.compatible = "renesas,r8a774a1-csi2",
@@ -1552,6 +1836,10 @@ static const struct of_device_id rcar_csi2_of_table[] = {
 		.compatible = "renesas,r8a779a0-csi2",
 		.data = &rcar_csi2_info_r8a779a0,
 	},
+	{
+		.compatible = "renesas,r8a779g0-csi2",
+		.data = &rcar_csi2_info_r8a779g0,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, rcar_csi2_of_table);
-- 
2.39.1

