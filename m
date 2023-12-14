Return-Path: <linux-media+bounces-2387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACB0812886
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 07:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FC451F21E10
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 06:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5A810940;
	Thu, 14 Dec 2023 06:50:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EEAFE8;
	Wed, 13 Dec 2023 22:50:46 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B2D1024E2FB;
	Thu, 14 Dec 2023 14:50:44 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 14:50:44 +0800
Received: from ubuntu.mshome.net (113.72.145.168) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 14:50:40 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	"Marvin Lin" <milkfafa@gmail.com>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, "Ming Qian" <ming.qian@nxp.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang
	<mingjia.zhang@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, Dan Carpenter
	<dan.carpenter@linaro.org>
CC: Jack Zhu <jack.zhu@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>
Subject: [PATCH v1 6/9] staging: media: starfive: camss: Update ISP initialise config for 3A
Date: Wed, 13 Dec 2023 22:50:24 -0800
Message-ID: <20231214065027.28564-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214065027.28564-1-changhuang.liang@starfivetech.com>
References: <20231214065027.28564-1-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Upadte ISP initialise for 3A statistics collection data.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../media/starfive/camss/stf-isp-hw-ops.c     | 23 +++++++++++++++++++
 .../staging/media/starfive/camss/stf-isp.h    | 11 +++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c b/driv=
ers/staging/media/starfive/camss/stf-isp-hw-ops.c
index c6295a14d509..a1ab4f11718e 100644
--- a/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
+++ b/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
@@ -319,6 +319,25 @@ static void stf_isp_config_sat(struct stfcamss *stfc=
amss)
 	stf_isp_reg_write(stfcamss, ISP_REG_YADJ1, YOMAX(0x3ff) | YOMIN(0x1));
 }
=20
+static void stf_isp_config_sc(struct stfcamss *stfcamss)
+{
+	stf_isp_reg_write(stfcamss, ISP_REG_SCD_CFG_1, AXI_ID(0));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_CFG_0, HSTART(0) | VSTART(0xc));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_CFG_1,
+			  SC_WIDTH(0x1d) | SC_HEIGHT(0x15) |
+			  AWB_PS_GRB_BA(0x10) | SEL_TYPE(0x3));
+}
+
+static void stf_isp_config_yhist(struct stfcamss *stfcamss)
+{
+	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_0, 0);
+	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_1,
+			  YH_WIDTH(0x77f) | YH_HEIGHT(0x437));
+	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_2,
+			  YH_DEC_ETW(2) | YH_DEC_ETH(1));
+	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_3, 0);
+}
+
 int stf_isp_reset(struct stf_isp_dev *isp_dev)
 {
 	stf_isp_reg_set_bit(isp_dev->stfcamss, ISP_REG_ISP_CTRL_0,
@@ -351,7 +370,11 @@ void stf_isp_init_cfg(struct stf_isp_dev *isp_dev)
 	stf_isp_config_sharpen(isp_dev->stfcamss);
 	stf_isp_config_dnyuv(isp_dev->stfcamss);
 	stf_isp_config_sat(isp_dev->stfcamss);
+	stf_isp_config_sc(isp_dev->stfcamss);
+	stf_isp_config_yhist(isp_dev->stfcamss);
=20
+	stf_isp_reg_write(isp_dev->stfcamss, ISP_REG_DUMP_CFG_1,
+			  DUMP_BURST_LEN(3) | DUMP_SD(0xb80));
 	stf_isp_reg_write(isp_dev->stfcamss, ISP_REG_CSI_MODULE_CFG,
 			  CSI_DUMP_EN | CSI_SC_EN | CSI_AWB_EN |
 			  CSI_LCCF_EN | CSI_OECF_EN | CSI_OBC_EN | CSI_DEC_EN);
diff --git a/drivers/staging/media/starfive/camss/stf-isp.h b/drivers/sta=
ging/media/starfive/camss/stf-isp.h
index bfb7196cefff..149f06b25416 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.h
+++ b/drivers/staging/media/starfive/camss/stf-isp.h
@@ -417,6 +417,17 @@
 #define DNRM_F(n)				((n) << 16)
 #define CCM_M_DAT(n)				((n) << 0)
=20
+#define ISP_REG_YHIST_CFG_0			0xcc8
+
+#define ISP_REG_YHIST_CFG_1			0xccc
+#define YH_HEIGHT(n)				((n) << 16)
+#define YH_WIDTH(n)				((n) << 0)
+
+#define ISP_REG_YHIST_CFG_2			0xcd0
+#define YH_DEC_ETH(n)				((n) << 16)
+#define YH_DEC_ETW(n)				((n) << 0)
+
+#define ISP_REG_YHIST_CFG_3			0xcd4
 #define ISP_REG_YHIST_CFG_4			0xcd8
=20
 #define ISP_REG_YHIST_ACC_0			0xd00
--=20
2.25.1


