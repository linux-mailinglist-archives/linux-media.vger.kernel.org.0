Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBFD86ED4F4
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 21:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232245AbjDXTAF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 15:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbjDXTAC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 15:00:02 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E46E6599
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 11:59:59 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-94a342f7c4cso867224466b.0
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 11:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1682362798; x=1684954798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BkrnFvpa5z4Dpdn5vvYGKxLRAfUOmv0juyCLSOg6qs=;
        b=mRqVGIVQnycF05THgQDQoJSdhVfeSJqNV06wPuFcyCq3d3HJ6mA8PGckgVQv7dGn6w
         l6CyyH3uuIVZa9l3GyzbaryHmdMvnl0ttGVBzjXCdtkMBd5Hh2pgRHx1iJN4VPJ68IQi
         dDrhCuwUv1LA+w6C+70Q5y7JSV0KWDybIqLPgAPWHhOZSCbDEGwj6rFWAu/pc1cBQf11
         sAsOwBDRuux34pHqUDQ49RMk+rzPv51b9OIRms0tAiMPT2FNPcN133TMJivKV+2OFGrH
         ip+iw8baBO9qQKS3n1HiqpvsFgR+vk+YE3NqymFjHAFvbAKO985toP0Vg0eNptDhXawv
         2q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682362798; x=1684954798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BkrnFvpa5z4Dpdn5vvYGKxLRAfUOmv0juyCLSOg6qs=;
        b=jwf3Zg/RknpQpw40/bgNMlCHUrg7y1k/elCvJM471ZtongRhES2JyG7bOtZDFTll3r
         nmBXIurwGOytnomJ4ygrJ+9lu8oCDYXd1OrI3+gYJZBBjb3+wA8zud4cdDgT6wcK73Fk
         mpxhlYAWdezGYhU5np2lAcFBKdN2AEyyRH4F79YpArK90kpUv9dbNrzLF5tb5RgbZMmn
         QDg1jGp+bTlMSgzNB+ZmGEKOBql9PxvhiTb7SPiBWixHgzwJ0Fgk2qygs1Aur/dnTF1v
         Jfp5EArD14spdws2VKuN4YYJlGrpyUeA6KbVQDMk7gwSVkCdbaf1JzS7/pX2+Mq4JK9m
         2FUg==
X-Gm-Message-State: AAQBX9fZtE/ptTOprT4y0AUluGy16xPvG9hHtdJXyrLUR2DFqaR4hxiC
        OBKOHWF32hbwDXsJ/a1L71IZdg==
X-Google-Smtp-Source: AKy350ahJxiMKk9vG5WpUH1SraruqyFWDhiES09TMr+z9Y0DfKoXPZ5xZnaCq0aX96cI/yBJUpxUnA==
X-Received: by 2002:a17:906:f11a:b0:94e:5780:23f9 with SMTP id gv26-20020a170906f11a00b0094e578023f9mr10910161ejb.48.1682362797827;
        Mon, 24 Apr 2023 11:59:57 -0700 (PDT)
Received: from sleipner.berto.se (p54ac52fc.dip0.t-ipconnect.de. [84.172.82.252])
        by smtp.googlemail.com with ESMTPSA id ke15-20020a17090798ef00b0095328ce9c8bsm5849818ejc.67.2023.04.24.11.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 11:59:57 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 3/3] media: rcar-csi2: Add support for C-PHY on R-Car V4H
Date:   Mon, 24 Apr 2023 20:59:34 +0200
Message-Id: <20230424185934.438059-4-niklas.soderlund+renesas@ragnatech.se>
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

Add support for C-PHY on R-Car V4H. While the V4H supports both D-PHY
and C-PHY this patch only adds support for the C-PHY mode due to lack of
documentation and hardware to test on.

The V4H is the first Gen4 device that is enabled in the rcar-csi2
driver. There is much overlap with the Gen3 driver, the primary
difference is in how the receiver is started. The V4H have a much larger
register space and some addresses overlap with Gen3.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Rebased to latest media-tree.
---
 .../platform/renesas/rcar-vin/rcar-csi2.c     | 288 ++++++++++++++++++
 1 file changed, 288 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
index f200fc2bc959..02352db05299 100644
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
@@ -1495,6 +1773,12 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
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
@@ -1544,6 +1828,10 @@ static const struct of_device_id rcar_csi2_of_table[] = {
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
2.40.0

