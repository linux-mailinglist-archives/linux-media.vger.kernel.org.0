Return-Path: <linux-media+bounces-14736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA5E92B25A
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 10:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0F4DB216F1
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 08:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92324156236;
	Tue,  9 Jul 2024 08:40:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2104.outbound.protection.partner.outlook.cn [139.219.146.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428DD1553AA;
	Tue,  9 Jul 2024 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514410; cv=fail; b=ZaInfZ2Jw6my3PbM6Mczeg/YOHaiPmil7ZBlUF9w86SZxYByCuj42NGtp6moedCVGGyYmpIGRrH/4i7G4fYwEZVqiYvKmJSQkcf9OX2c15t9gzWf+Ad0EgMduM6XeVPvc5wnNj/3+jCTtxGU/nAwAsmUpVMR+HlFK5GK159kS10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514410; c=relaxed/simple;
	bh=IZR271Z9L/LCP8WXziUR04qxg9o8HMj5O53fstadKIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XIzNVaZQifft34B9WJkuKbrWXrQq57LB7e+PNzfXhPS35FBuPmfDeYOX82B4zy0o69fbJn5bI/g0I7P4dJpDY9iddQXxcLwxIV7ZF1rs97L6SbZVaHucq1wqHKqbyPC5Z/S1ZuUN6lHGQNtvEcq2eZseNqOb6iOm2ytz2dtUaS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhCOn3SD6Akhm/Z7USToGbe0DjQlAPmnXikDuswuz8FP6PvSjsFesZ3Ei1LMnmKSQsCzo8rDu1lhij90gFray92yPAizH9ySvRGEWDfjjBK9V05RTYaXVA3gd0q/OB4GZSmUcrQb3hT37CbfcT97tPhqvUzcYZyG3wmfbjAf5hV8oeUR29zZt/M44cEN1aNX/maNuQaOjpuvUpn47yr2LBEfWEK0XlpTLLX+GIo20crpWHqJKZGhil63wXig3+Ym+9BKIdr5LneCY/lxLvzN3FPeps2YcxY1rU5oDvpP5uKIpjMWJoDekhVtRUHaZu4g8EnxcXr4l0gui5I1bG8zeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSU67noKEm/zCC2luXSFb1H/bnIrgY+i6RMPDptYL6E=;
 b=jak9B11oIiamqpSW2SWcK5cWuOOKPNL7hIgGMnomPFpWtWEmHsFMKBGEarMqykTzecDbDzRuMTZPaO2axi1BXmLrvfe38mIi28HWORPJxkrAVaW2dImfEbjtIkVDMEpsKCzxFu9nudfY3MBvHvPevTHGYT5mnF95T0VeKYAz6qy+Oyha4dczOlNMVC5lTIUIS5WvAqqahzm5ptq8+wZIM9Cp/UECpf4G8glsIIYcksR9pS5a7gIdLUxvcaEgH2f4gG8VvraXNMUN5uqYy57ZwcoHSRycfHzSn2poYzqfRRS8J67Dck64If1JmNt8xQE3QS/2obn/DNhwYDyVJ+HaCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1271.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.37; Tue, 9 Jul
 2024 08:38:46 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Tue, 9 Jul 2024 08:38:46 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 12/14] staging: media: starfive: Add ISP parameters hardware configure
Date: Tue,  9 Jul 2024 01:38:22 -0700
Message-Id: <20240709083824.430473-13-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::16) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1271:EE_
X-MS-Office365-Filtering-Correlation-Id: b7dcbebd-7420-43d9-366d-08dc9ff28c0b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|41320700013|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	VyImPnE9MhHCtAIWW3xowbDe7NBIeYParcM4neCtb7x6lV3wPj+npBguD8Td4ixFuHT2ijKqOOULZUVQVpdnbj7F+yddnpfggTNt/LiX9wCm7BVcnTdiBUKJkd6szrkbha6pbhEEL+G+saDy9vsoPcaW4uq0jnswoPDArc1QHAvvKK8FwoFf0Szo+NA2I1hOhPCea1+xwTKQ4j1KUryNw0fvqfRs6rRlgVIJ0QqP30Bd7oYZq7TZ95lLXFA5yCFzN/RlUHCOIoEhgMLWyR/iVhnwyLnuYtihTMxgRHcIjadPNrwvDmKHtR/+10mMUxPfuTSbBtokV9Mn7Nbv/9XEw6IUW0Rt5kYYAP8RDHecAWSD6C6F9uz59t3dwA6tM9+ZKSougI46rkMK8WL3oHRZhB3vNPVL0k00YuQGyfqtP9vLv16wXEQD/N97syctOzo4bPnVkRIvNWwJ+nlecFb10efftHqBaNuxKrLkMuqHW34FIKwKJVXXJfUfwFLREuEA02unTQcjav6D1LyYBx1GrwfJ8ryYRX6CzYPtuEDQ+v4sN5ZBq/FT3HZ2sB/bhVy7/N5QvCMm6WXAc8b8gDaniddk5QPgCJrs6v4e+TxCYW3CVkSy+Bx67k/wmgrNryWs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NnEgVmjnhF0jjiE3DCUTuqrp1yHqqiDSvBr4COoBU87PhZKfJnYsF21m9mUK?=
 =?us-ascii?Q?soFmdsrTMWsK5AfQ7C0qUBhI7YPm0HJIAbTpc8Xz1WK5c7Pp92AZCoPWBktc?=
 =?us-ascii?Q?boL+ityOHvnC+V5jruT5D8goxssG7Wd0l04DWnKLv4Vf2rWnVjWKZGDCJamo?=
 =?us-ascii?Q?EzpxRgDTV0wDlKf4hcgGBKnubaV1DwED0/os8SeF2UlRUViqNqjqKocTxC6Q?=
 =?us-ascii?Q?N764VV8MzG354qqZLlfTDtDIzoRwF83mNHHZ9jCI4+BwkKiqBqUGNMAhYDCd?=
 =?us-ascii?Q?V7WIeXlh0Sv8EyE3JeChl6ymSjIXmKaVcWpbl380VCxXa+wrdMN2KLJIMcgq?=
 =?us-ascii?Q?oJcgnCyDb0Tyz6l6PeMu/2A0DAScekBEfH64h7Cvvwdf0NYgf4HeUOrA/bu8?=
 =?us-ascii?Q?180A3fxBM1nsUnfv1VKnoCX8nfWBm98oXiIVZNXWG0x2oY5L/GXtni9f7qGc?=
 =?us-ascii?Q?e7irelj4XIj6nvI1CgnIBZaPXcmd7aeU30F1DbvA8jxjEb8hNqEpFbVszrp5?=
 =?us-ascii?Q?rFI+zx6yizUBYkQV7/J9ZjACGs1a3inI99KGwmaQKEc+R0Po32KcNLNiI4ho?=
 =?us-ascii?Q?+1ODJbje9sGL1jDrsoKY0xY0uor+EWiQVfLBhQ5P5USIBRzTAOtwWbWsbXmT?=
 =?us-ascii?Q?1IpUO2TXphjdbhwBaT2ISFbQ3HpfkwvSS80OQlZMNfsWa7VU73MlCNX044ch?=
 =?us-ascii?Q?RA35CsVMRT8nk6rPlOSp+3sb2hAgGPsNjiEGT5+GTxh06Nha7meChShlw4RM?=
 =?us-ascii?Q?1MeD+v4R31UmvOjb+4YaTep2MaG+N9tVRnWDUGH579hZBimn9aKTmEJqKqov?=
 =?us-ascii?Q?NMbdr4QiUwBQGZxOyOS24zWOU8xYUpM4DexXDmic1NUXeotx3zdmzc9n6jks?=
 =?us-ascii?Q?XsexX2h/QIV0TtXgrCfajI7rpOujU3nKGr6OjMY8BNl78EaeRnOWU4+iLwvt?=
 =?us-ascii?Q?pgSaTRgA3x9pr2HXYvCqhtJLN3gGBCs78TGbDS8XUKzZ7UYOBfKGUOiB1wt9?=
 =?us-ascii?Q?kzTBvSb8Chc+SDXBwH43TCiDZDH6ZKreXjrc/SiHPCZTXlSJRtkutd5Op84W?=
 =?us-ascii?Q?ZPigAFqr6GA2Z8nKIbQ/L3bUXnsub4Sb7l1biTW5FyJtXMa7uTAQ+tIdV3cC?=
 =?us-ascii?Q?O7Yh9NMwP4HAQoLNPHmdRx1blgR9uJm/cuT2hfR6flHJ92xpOWGMd4qoM4i1?=
 =?us-ascii?Q?MM+B7A1ADAlHufDfjLi4DBK/2bU/Rek4CtOBOzU0wDjemNA51xXoVxOmotoJ?=
 =?us-ascii?Q?nQhCrovlMyUxS/xj1L82y8OWO1TenUWhswGM3nZPrnGlinoB8irPeUo192tv?=
 =?us-ascii?Q?kGwxP2RCx5ufD8otdWsMimSP94CTdEOq5hhj/C1nFOA+LiWGe3sg6LnJQxt6?=
 =?us-ascii?Q?2KGBdPo0H5+Ctjth5/UMH4PDLmqg+PTyLFjuQE/vWDrHoZUQSko1xwUYSB/R?=
 =?us-ascii?Q?zqFde+2huVhcbFqR0Dhad2E9sLvRBYAgCpI6VxUIKkdageYN3GijsodMdppX?=
 =?us-ascii?Q?bEFOulpeqPFVmMQ9QlY5+NdVYs6ag1YMMcR7vFFtyRh6zbj3QaWhGeecq+SG?=
 =?us-ascii?Q?7jJGHGUKECOVuwZJOv8BLNQhEjvIrWvSVYl+vHs4KBBnMdYZL3wPuezQtJnP?=
 =?us-ascii?Q?Ubl9n7rSIoJcF7cCPYr7wwI=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7dcbebd-7420-43d9-366d-08dc9ff28c0b
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:38:46.1800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFx2+IBw/8VA+bcRk+GWdNbR5ImtvcyiJIBtEprWxfiiKe6Oqkrj1k7f+waMPdmEERClBaPj2CD7OOzvmWbU/L9Dj5lVi9B69XZrDYd+5nDb8kn1MoMltmE5rUq+9u+W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1271

Add ISP parameters hardware configure.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../staging/media/starfive/camss/stf-camss.h  |   8 +
 .../media/starfive/camss/stf-isp-hw-ops.c     | 573 ++++++++++++++++++
 .../staging/media/starfive/camss/stf-isp.h    | 135 +++++
 3 files changed, 716 insertions(+)

diff --git a/drivers/staging/media/starfive/camss/stf-camss.h b/drivers/staging/media/starfive/camss/stf-camss.h
index 3f84f1a1e997..328318d61c6b 100644
--- a/drivers/staging/media/starfive/camss/stf-camss.h
+++ b/drivers/staging/media/starfive/camss/stf-camss.h
@@ -106,6 +106,14 @@ static inline void stf_isp_reg_set(struct stfcamss *stfcamss, u32 reg, u32 mask)
 		  stfcamss->isp_base + reg);
 }
 
+static inline void stf_isp_reg_fill_zero(struct stfcamss *stfcamss, u32 reg, u32 size)
+{
+	u32 i;
+
+	for (i = 0; i < size; i++, reg += 4)
+		iowrite32(0, stfcamss->isp_base + reg);
+}
+
 static inline u32 stf_syscon_reg_read(struct stfcamss *stfcamss, u32 reg)
 {
 	return ioread32(stfcamss->syscon_base + reg);
diff --git a/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c b/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
index 0bc5e36f952e..e54368910906 100644
--- a/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
+++ b/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
@@ -10,6 +10,25 @@
 
 #include "stf-camss.h"
 
+static const struct stf_isp_module_info mod_info[] = {
+	{ ISP_REG_CSI_MODULE_CFG, 2 },
+	{ ISP_REG_CSI_MODULE_CFG, 4 },
+	{ ISP_REG_CSI_MODULE_CFG, 6 },
+	{ ISP_REG_CSI_MODULE_CFG, 7 },
+	{ ISP_REG_CSI_MODULE_CFG, 17 },
+	{ ISP_REG_ISP_CTRL_1, 1 },
+	{ ISP_REG_ISP_CTRL_1, 2 },
+	{ ISP_REG_ISP_CTRL_1, 3 },
+	{ ISP_REG_ISP_CTRL_1, 4 },
+	{ ISP_REG_ISP_CTRL_1, 5 },
+	{ ISP_REG_ISP_CTRL_1, 7 },
+	{ ISP_REG_ISP_CTRL_1, 8 },
+	{ ISP_REG_ISP_CTRL_1, 17 },
+	{ ISP_REG_ISP_CTRL_1, 19 },
+	{ ISP_REG_ISP_CTRL_1, 21 },
+	{ ISP_REG_ISP_CTRL_1, 22 },
+};
+
 static void stf_isp_config_obc(struct stfcamss *stfcamss)
 {
 	u32 reg_val, reg_add;
@@ -517,6 +536,59 @@ static void stf_isp_fill_flag(struct stfcamss *stfcamss, void *vaddr,
 	}
 }
 
+static void stf_isp_set_params(struct stfcamss *stfcamss, void *vaddr)
+{
+	struct jh7110_isp_params_buffer *params = (struct jh7110_isp_params_buffer *)vaddr;
+
+	if (params->enable_setting & JH7110_ISP_MODULE_WB_SETTING)
+		isp_set_ctrl_wb(stfcamss, &params->wb_setting);
+
+	if (params->enable_setting & JH7110_ISP_MODULE_CAR_SETTING)
+		isp_set_ctrl_car(stfcamss, &params->car_setting);
+
+	if (params->enable_setting & JH7110_ISP_MODULE_CCM_SETTING)
+		isp_set_ctrl_ccm(stfcamss, &params->ccm_setting);
+
+	if (params->enable_setting & JH7110_ISP_MODULE_CFA_SETTING)
+		isp_set_ctrl_cfa(stfcamss, &params->cfa_setting);
+
+	if (params->enable_setting & JH7110_ISP_MODULE_CTC_SETTING)
+		isp_set_ctrl_ctc(stfcamss, &params->ctc_setting);
+
+	if (params->enable_setting & JH7110_ISP_MODULE_DBC_SETTING)
+		isp_set_ctrl_dbc(stfcamss, &params->dbc_setting);
+
+	if (params->enable_setting & JH7110_ISP_MODULE_DNYUV_SETTING)
+		isp_set_ctrl_dnyuv(stfcamss, &params->dnyuv_setting);
+
+	if (params->enable_setting & JH7110_ISP_MODULE_GMARGB_SETTING)
+		isp_set_ctrl_gmargb(stfcamss, &params->gmargb_setting);
+
+	if (params->enable_setting & JH7110_ISP_MODULE_LCCF_SETTING)
+		isp_set_ctrl_lccf(stfcamss, &params->lccf_setting);
+
+	if (params->enable_setting & JH7110_ISP_MODULE_OBC_SETTING)
+		isp_set_ctrl_obc(stfcamss, &params->obc_setting);
+
+	if (params->enable_setting & JH7110_ISP_MODULE_OECF_SETTING)
+		isp_set_ctrl_oecf(stfcamss, &params->oecf_setting);
+
+	if (params->enable_setting & JH7110_ISP_MODULE_R2Y_SETTING)
+		isp_set_ctrl_r2y(stfcamss, &params->r2y_setting);
+
+	if (params->enable_setting & JH7110_ISP_MODULE_SAT_SETTING)
+		isp_set_ctrl_sat(stfcamss, &params->sat_setting);
+
+	if (params->enable_setting & JH7110_ISP_MODULE_SHARP_SETTING)
+		isp_set_ctrl_sharp(stfcamss, &params->sharp_setting);
+
+	if (params->enable_setting & JH7110_ISP_MODULE_YCRV_SETTING)
+		isp_set_ctrl_ycrv(stfcamss, &params->ycrv_setting);
+
+	if (params->enable_setting & JH7110_ISP_MODULE_SC_SETTING)
+		isp_set_ctrl_sc(stfcamss, &params->sc_setting);
+}
+
 irqreturn_t stf_line_irq_handler(int irq, void *priv)
 {
 	struct stfcamss *stfcamss = priv;
@@ -566,11 +638,20 @@ irqreturn_t stf_isp_irq_handler(int irq, void *priv)
 	struct stfcamss *stfcamss = priv;
 	struct stf_capture *cap = &stfcamss->captures[STF_CAPTURE_YUV];
 	struct stf_capture *cap_scd = &stfcamss->captures[STF_CAPTURE_SCD];
+	struct stf_output *output = &stfcamss->output;
 	struct stfcamss_buffer *ready_buf;
 	u32 status;
 
 	status = stf_isp_reg_read(stfcamss, ISP_REG_ISP_CTRL_0);
 	if (status & ISPC_ISP) {
+		ready_buf = stf_buf_get_ready(&output->buffers);
+		if (ready_buf) {
+			stf_isp_set_params(stfcamss, ready_buf->vaddr);
+			ready_buf->vb.vb2_buf.timestamp = ktime_get_ns();
+			ready_buf->vb.sequence = output->buffers.sequence++;
+			vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+		}
+
 		if (status & ISPC_ENUO) {
 			ready_buf = stf_buf_done(&cap->buffers);
 			if (ready_buf)
@@ -591,4 +672,496 @@ irqreturn_t stf_isp_irq_handler(int irq, void *priv)
 	}
 
 	return IRQ_HANDLED;
+};
+
+int isp_set_ctrl_wb(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_awb];
+	const struct jh7110_isp_wb_setting *setting =
+		(const struct jh7110_isp_wb_setting *)value;
+	const struct jh7110_isp_wb_gain *gains = &setting->gains;
+
+	stf_isp_reg_fill_zero(stfcamss, ISP_REG_AWB_X0_CFG_0, 16);
+
+	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S0_CFG_0,
+			  AWB_S_SYMBOL_H(gains->gain_r) | AWB_S_SYMBOL_L(gains->gain_r));
+	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S0_CFG_1,
+			  AWB_S_SYMBOL_H(gains->gain_r) | AWB_S_SYMBOL_L(gains->gain_r));
+	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S1_CFG_0,
+			  AWB_S_SYMBOL_H(gains->gain_g) | AWB_S_SYMBOL_L(gains->gain_g));
+	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S1_CFG_1,
+			  AWB_S_SYMBOL_H(gains->gain_g) | AWB_S_SYMBOL_L(gains->gain_g));
+	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S2_CFG_0,
+			  AWB_S_SYMBOL_H(gains->gain_g) | AWB_S_SYMBOL_L(gains->gain_g));
+	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S2_CFG_1,
+			  AWB_S_SYMBOL_H(gains->gain_g) | AWB_S_SYMBOL_L(gains->gain_g));
+	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S3_CFG_0,
+			  AWB_S_SYMBOL_H(gains->gain_b) | AWB_S_SYMBOL_L(gains->gain_b));
+	stf_isp_reg_write(stfcamss, ISP_REG_AWB_S3_CFG_1,
+			  AWB_S_SYMBOL_H(gains->gain_b) | AWB_S_SYMBOL_L(gains->gain_b));
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
+}
+
+int isp_set_ctrl_car(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_car];
+	const struct jh7110_isp_car_setting *setting =
+		(const struct jh7110_isp_car_setting *)value;
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
+}
+
+int isp_set_ctrl_ccm(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_ccm];
+	const struct jh7110_isp_ccm_setting *setting =
+		(const struct jh7110_isp_ccm_setting *)value;
+	const struct jh7110_isp_ccm_smlow *ccm = &setting->ccm_smlow;
+
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_0, DNRM_F(6));
+	stf_isp_reg_fill_zero(stfcamss, ISP_REG_ICAMD_1, 11);
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_12, ccm->ccm[0][0]);
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_13, ccm->ccm[0][1]);
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_14, ccm->ccm[0][2]);
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_15, ccm->ccm[1][0]);
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_16, ccm->ccm[1][1]);
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_17, ccm->ccm[1][2]);
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_18, ccm->ccm[2][0]);
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_19, ccm->ccm[2][1]);
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_20, ccm->ccm[2][2]);
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_21, ccm->offsets[0]);
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_22, ccm->offsets[1]);
+	stf_isp_reg_write(stfcamss, ISP_REG_ICAMD_23, ccm->offsets[2]);
+	stf_isp_reg_fill_zero(stfcamss, ISP_REG_ICAMD_24, 2);
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
+}
+
+int isp_set_ctrl_cfa(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_cfa];
+	const struct jh7110_isp_cfa_setting *setting =
+		(const struct jh7110_isp_cfa_setting *)value;
+	const struct jh7110_isp_cfa_params *cfa = &setting->settings;
+
+	stf_isp_reg_write(stfcamss, ISP_REG_ICFAM,
+			  HV_W(cfa->hv_width) | CROSS_COV(cfa->cross_cov));
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
+}
+
+int isp_set_ctrl_ctc(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_ctc];
+	const struct jh7110_isp_ctc_setting *setting =
+		(const struct jh7110_isp_ctc_setting *)value;
+	const struct jh7110_isp_ctc_params *ctc = &setting->settings;
+
+	stf_isp_reg_write(stfcamss, ISP_REG_ICTC,
+			  MINGT(ctc->min_gt) | MAXGT(ctc->max_gt) |
+			  GF_MODE(ctc->saf_mode | ctc->daf_mode));
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
+}
+
+int isp_set_ctrl_dbc(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_dbc];
+	const struct jh7110_isp_dbc_setting *setting =
+		(const struct jh7110_isp_dbc_setting *)value;
+	const struct jh7110_isp_dbc_params *dbc = &setting->settings;
+
+	stf_isp_reg_write(stfcamss, ISP_REG_IDBC,
+			  BADXT(dbc->bad_xt) | BADGT(dbc->bad_gt));
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
+}
+
+int isp_set_ctrl_dnyuv(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_dnyuv];
+	const struct jh7110_isp_dnyuv_setting *setting =
+		(const struct jh7110_isp_dnyuv_setting *)value;
+	const struct jh7110_isp_dnyuv_params *cfg = &setting->settings;
+
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_YSWR0,
+			  YUVSW0(cfg->y_sweight[0]) | YUVSW1(cfg->y_sweight[1]) |
+			  YUVSW2(cfg->y_sweight[2]) | YUVSW3(cfg->y_sweight[3]) |
+			  YUVSW4(cfg->y_sweight[4]) | YUVSW5(cfg->y_sweight[5]));
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_YSWR1,
+			  YUVSW0(cfg->y_sweight[6]) | YUVSW1(cfg->y_sweight[7]) |
+			  YUVSW2(cfg->y_sweight[8]) | YUVSW3(cfg->y_sweight[9]));
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_CSWR0,
+			  YUVSW0(cfg->uv_sweight[0]) | YUVSW1(cfg->uv_sweight[1]) |
+			  YUVSW2(cfg->uv_sweight[2]) | YUVSW3(cfg->uv_sweight[3]) |
+			  YUVSW4(cfg->uv_sweight[4]) | YUVSW5(cfg->uv_sweight[5]));
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_CSWR1,
+			  YUVSW0(cfg->uv_sweight[6]) | YUVSW1(cfg->uv_sweight[7]) |
+			  YUVSW2(cfg->uv_sweight[8]) | YUVSW3(cfg->uv_sweight[9]));
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_YDR0,
+			  CURVE_D_L(cfg->y_curve[0]) | CURVE_D_H(cfg->y_curve[1]));
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_YDR1,
+			  CURVE_D_L(cfg->y_curve[2]) | CURVE_D_H(cfg->y_curve[3]));
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_YDR2,
+			  CURVE_D_L(cfg->y_curve[4]) | CURVE_D_H(cfg->y_curve[5]));
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_CDR0,
+			  CURVE_D_L(cfg->uv_curve[0]) | CURVE_D_H(cfg->uv_curve[1]));
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_CDR1,
+			  CURVE_D_L(cfg->uv_curve[2]) | CURVE_D_H(cfg->uv_curve[3]));
+	stf_isp_reg_write(stfcamss, ISP_REG_DNYUV_CDR2,
+			  CURVE_D_L(cfg->uv_curve[4]) | CURVE_D_H(cfg->uv_curve[5]));
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
+}
+
+int isp_set_ctrl_gmargb(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_gmargb];
+	const struct jh7110_isp_gmargb_setting *setting =
+		(const struct jh7110_isp_gmargb_setting *)value;
+	const struct jh7110_isp_gmargb_point *curve = setting->curve;
+	u32 reg_addr = ISP_REG_GAMMA_VAL0;
+	u32 i;
+
+	for (i = 0; i < 15; i++, reg_addr += 4)
+		stf_isp_reg_write(stfcamss, reg_addr,
+				  GAMMA_S_VAL(curve[i].sg_val) | GAMMA_VAL(curve[i].g_val));
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
+}
+
+int isp_set_ctrl_lccf(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_lccf];
+	const struct jh7110_isp_lccf_setting *setting =
+		(const struct jh7110_isp_lccf_setting *)value;
+	const struct jh7110_isp_lccf_circle *circle = &setting->circle;
+	const struct jh7110_isp_lccf_curve_param *r_param = &setting->r_param;
+	const struct jh7110_isp_lccf_curve_param *gr_param = &setting->gr_param;
+	const struct jh7110_isp_lccf_curve_param *gb_param = &setting->gb_param;
+	const struct jh7110_isp_lccf_curve_param *b_param = &setting->b_param;
+
+	stf_isp_reg_write(stfcamss, ISP_REG_LCCF_CFG_0,
+			  Y_DISTANCE(circle->center_y) | X_DISTANCE(circle->center_x));
+	stf_isp_reg_write(stfcamss, ISP_REG_LCCF_CFG_1,
+			  LCCF_MAX_DIS(circle->radius));
+	stf_isp_reg_write(stfcamss, ISP_REG_LCCF_CFG_2,
+			  LCCF_F1_PAR(r_param->f1) | LCCF_F2_PAR(r_param->f2));
+	stf_isp_reg_write(stfcamss, ISP_REG_LCCF_CFG_3,
+			  LCCF_F1_PAR(gr_param->f1) | LCCF_F2_PAR(gr_param->f2));
+	stf_isp_reg_write(stfcamss, ISP_REG_LCCF_CFG_4,
+			  LCCF_F1_PAR(gb_param->f1) | LCCF_F2_PAR(gb_param->f2));
+	stf_isp_reg_write(stfcamss, ISP_REG_LCCF_CFG_5,
+			  LCCF_F1_PAR(b_param->f1) | LCCF_F2_PAR(b_param->f2));
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
+}
+
+int isp_set_ctrl_obc(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_obc];
+	const struct jh7110_isp_obc_setting *setting =
+		(const struct jh7110_isp_obc_setting *)value;
+	const struct jh7110_isp_obc_win_size *win_size = &setting->win_size;
+	const struct jh7110_isp_obc_gain *gain = setting->gain;
+	const struct jh7110_isp_obc_offset *offset = setting->offset;
+
+	stf_isp_reg_write(stfcamss, ISP_REG_OBC_CFG,
+			  OBC_W_W(win_size->width) | OBC_W_H(win_size->height));
+	stf_isp_reg_write(stfcamss, ISP_REG_OBCG_CFG_0,
+			  GAIN_A_POINT(gain[0].tl_gain) | GAIN_B_POINT(gain[0].tr_gain) |
+			  GAIN_C_POINT(gain[0].bl_gain) | GAIN_D_POINT(gain[0].br_gain));
+	stf_isp_reg_write(stfcamss, ISP_REG_OBCG_CFG_1,
+			  GAIN_A_POINT(gain[1].tl_gain) | GAIN_B_POINT(gain[1].tr_gain) |
+			  GAIN_C_POINT(gain[1].bl_gain) | GAIN_D_POINT(gain[1].br_gain));
+	stf_isp_reg_write(stfcamss, ISP_REG_OBCG_CFG_2,
+			  GAIN_A_POINT(gain[2].tl_gain) | GAIN_B_POINT(gain[2].tr_gain) |
+			  GAIN_C_POINT(gain[2].bl_gain) | GAIN_D_POINT(gain[2].br_gain));
+	stf_isp_reg_write(stfcamss, ISP_REG_OBCG_CFG_3,
+			  GAIN_A_POINT(gain[3].tl_gain) | GAIN_B_POINT(gain[3].tr_gain) |
+			  GAIN_C_POINT(gain[3].bl_gain) | GAIN_D_POINT(gain[3].br_gain));
+	stf_isp_reg_write(stfcamss, ISP_REG_OBCO_CFG_0,
+			  OFFSET_A_POINT(offset[0].tl_offset) |
+			  OFFSET_B_POINT(offset[0].tr_offset) |
+			  OFFSET_C_POINT(offset[0].bl_offset) |
+			  OFFSET_D_POINT(offset[0].br_offset));
+	stf_isp_reg_write(stfcamss, ISP_REG_OBCO_CFG_1,
+			  OFFSET_A_POINT(offset[1].tl_offset) |
+			  OFFSET_B_POINT(offset[1].tr_offset) |
+			  OFFSET_C_POINT(offset[1].bl_offset) |
+			  OFFSET_D_POINT(offset[1].br_offset));
+	stf_isp_reg_write(stfcamss, ISP_REG_OBCO_CFG_2,
+			  OFFSET_A_POINT(offset[2].tl_offset) |
+			  OFFSET_B_POINT(offset[2].tr_offset) |
+			  OFFSET_C_POINT(offset[2].bl_offset) |
+			  OFFSET_D_POINT(offset[2].br_offset));
+	stf_isp_reg_write(stfcamss, ISP_REG_OBCO_CFG_3,
+			  OFFSET_A_POINT(offset[3].tl_offset) |
+			  OFFSET_B_POINT(offset[3].tr_offset) |
+			  OFFSET_C_POINT(offset[3].bl_offset) |
+			  OFFSET_D_POINT(offset[3].br_offset));
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
+}
+
+int isp_set_ctrl_oecf(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_oecf];
+	const struct jh7110_isp_oecf_setting *setting =
+		(const struct jh7110_isp_oecf_setting *)value;
+	const struct jh7110_isp_oecf_point *oecf = setting->r_curve;
+	u32 reg_x_addr = ISP_REG_OECF_X0_CFG0;
+	u32 reg_y_addr = ISP_REG_OECF_Y0_CFG0;
+	u32 reg_s_addr = ISP_REG_OECF_S0_CFG0;
+	u32 i;
+
+	for (i = 0; i < 64; i += 2, reg_x_addr += 4, reg_y_addr += 4, reg_s_addr += 4) {
+		stf_isp_reg_write(stfcamss, reg_x_addr,
+				  OCEF_PAR_L(oecf[i].x) | OCEF_PAR_H(oecf[i + 1].x));
+		stf_isp_reg_write(stfcamss, reg_y_addr,
+				  OCEF_PAR_L(oecf[i].y) | OCEF_PAR_H(oecf[i + 1].y));
+		stf_isp_reg_write(stfcamss, reg_s_addr,
+				  OCEF_PAR_L(oecf[i].slope) | OCEF_PAR_H(oecf[i + 1].slope));
+	}
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
+}
+
+int isp_set_ctrl_r2y(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_r2y];
+	const struct jh7110_isp_r2y_setting *setting =
+		(const struct jh7110_isp_r2y_setting *)value;
+	const struct jh7110_isp_r2y_matrix *matrix = &setting->matrix;
+	u32 reg_addr = ISP_REG_R2Y_0;
+	u32 i;
+
+	for (i = 0; i < 9; i++, reg_addr += 4)
+		stf_isp_reg_write(stfcamss, reg_addr, matrix->m[i]);
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
+}
+
+int isp_set_ctrl_sat(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_sat];
+	const struct jh7110_isp_sat_setting *setting =
+		(const struct jh7110_isp_sat_setting *)value;
+	const struct jh7110_isp_sat_info *sat = &setting->sat_info;
+	const struct jh7110_isp_sat_hue_info *hue = &setting->hue_info;
+	const struct jh7110_isp_sat_curve *curve = &setting->curve;
+
+	stf_isp_reg_write(stfcamss, ISP_REG_CS_GAIN,
+			  CMAB(sat->gain_cmab) | CMAD(sat->gain_cmmd));
+	stf_isp_reg_write(stfcamss, ISP_REG_CS_THRESHOLD,
+			  CMB(sat->threshold_cmb) | CMD(sat->threshold_cmd));
+	stf_isp_reg_write(stfcamss, ISP_REG_CS_OFFSET,
+			  UOFF(sat->offset_u) | VOFF(sat->offset_v));
+	stf_isp_reg_write(stfcamss, ISP_REG_CS_SCALE, sat->cmsf);
+	stf_isp_reg_write(stfcamss, ISP_REG_CS_HUE_F,
+			  COS(hue->cos) | SIN(hue->sin));
+	stf_isp_reg_write(stfcamss, ISP_REG_YADJ0,
+			  YIMIN(curve->yi_min) | YOIR(curve->yo_ir));
+	stf_isp_reg_write(stfcamss, ISP_REG_YADJ1,
+			  YOMIN(curve->yo_min) | YOMAX(curve->yo_max));
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
+}
+
+int isp_set_ctrl_sharp(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_shrp];
+	const struct jh7110_isp_sharp_setting *setting =
+		(const struct jh7110_isp_sharp_setting *)value;
+	const struct jh7110_isp_sharp_weight *weight = &setting->weight;
+	const struct jh7110_isp_sharp_strength *strength = &setting->strength;
+	u32 reg_addr = ISP_REG_SHARPEN0;
+	u32 i;
+
+	for (i = 0; i < 4; i++, reg_addr += 4)
+		stf_isp_reg_write(stfcamss, reg_addr,
+				  S_WEIGHT(weight->weight[i]) | S_DELTA(strength->diff[i]));
+
+	for (; i < 15; i++, reg_addr += 4)
+		stf_isp_reg_write(stfcamss, reg_addr, S_WEIGHT(weight->weight[i]));
+
+	reg_addr = ISP_REG_SHARPEN_FS0;
+
+	for (i = 0; i < 3; i++, reg_addr += 4)
+		stf_isp_reg_write(stfcamss, reg_addr,
+				  S_SLOPE(strength->s[i]) | S_FACTOR(strength->f[i]));
+
+	stf_isp_reg_write(stfcamss, ISP_REG_SHARPEN_WN,
+			  WSUM(weight->recip_wei_sum) | NDIRF(setting->ndirf) |
+			  PDIRF(setting->pdirf));
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
+}
+
+int isp_set_ctrl_ycrv(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_ycrv];
+	const struct jh7110_isp_ycrv_setting *setting =
+		(const struct jh7110_isp_ycrv_setting *)value;
+	const struct jh7110_isp_ycrv_curve *curve = &setting->curve;
+	u32 reg_addr = ISP_REG_YCURVE_0;
+	u32 i;
+
+	for (i = 0; i < 64; i++, reg_addr += 4)
+		stf_isp_reg_write(stfcamss, reg_addr, curve->y[i]);
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
+}
+
+int isp_set_ctrl_sc(struct stfcamss *stfcamss, const void *value)
+{
+	const struct stf_isp_module_info *reg_info = &mod_info[imi_sc];
+	const struct jh7110_isp_sc_setting *setting =
+		(const struct jh7110_isp_sc_setting *)value;
+	const struct jh7110_isp_sc_config *crop = &setting->crop_config;
+	const struct jh7110_isp_sc_af_config *af = &setting->af_config;
+	const struct jh7110_isp_sc_awb_config *awb = &setting->awb_config;
+	const struct jh7110_isp_sc_awb_ps *awb_ps = &awb->ps_config;
+	const struct jh7110_isp_sc_awb_ws *awb_ws = &awb->ws_config;
+	const struct jh7110_isp_sc_awb_point *pts = awb->pts;
+	u32 reg_addr0, reg_addr1;
+	u32 i;
+
+	stf_isp_reg_write(stfcamss, ISP_REG_SCD_CFG_1, AXI_ID(1));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_CFG_0,
+			  HSTART(crop->h_start) | VSTART(crop->v_start));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_CFG_1,
+			  SC_WIDTH(crop->sw_width) | SC_HEIGHT(crop->sw_height) |
+			  AWB_PS_GRB_BA(awb->awb_ps_grb_ba) | SEL_TYPE(awb->sel));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_DEC,
+			  SC_DEC_H_PERIOD(crop->hperiod) | SC_DEC_H_KEEP(crop->hkeep) |
+			  SC_DEC_V_PERIOD(crop->vperiod) | SC_DEC_V_KEEP(crop->vkeep));
+
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_PS_CFG_0,
+			  AWB_PS_RL(awb_ps->awb_ps_rl) | AWB_PS_RU(awb_ps->awb_ps_ru) |
+			  AWB_PS_GL(awb_ps->awb_ps_gl) | AWB_PS_GU(awb_ps->awb_ps_gu));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_PS_CFG_1,
+			  AWB_PS_BL(awb_ps->awb_ps_bl) | AWB_PS_BU(awb_ps->awb_ps_bu) |
+			  AWB_PS_YL(awb_ps->awb_ps_yl) | AWB_PS_YU(awb_ps->awb_ps_yu));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_PS_CFG_2,
+			  AWB_PS_GRL(awb_ps->awb_ps_grl) | AWB_PS_GRU(awb_ps->awb_ps_gru));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_PS_CFG_3,
+			  AWB_PS_GBL(awb_ps->awb_ps_gbl) | AWB_PS_GBU(awb_ps->awb_ps_gbu));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_PS_CFG_4,
+			  AWB_PS_GRBL(awb_ps->awb_ps_grbl) | AWB_PS_GRBU(awb_ps->awb_ps_grbu));
+
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_AF,
+			  AF_ES_HM(af->es_hor_mode) | AF_ES_SM(af->es_sum_mode) |
+			  AF_ES_HE(af->hor_en) | AF_ES_VE(af->ver_en) |
+			  AF_ES_VTHR(af->es_ver_thr) | AF_ES_HTHR(af->es_hor_thr));
+
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_CFG_0,
+			  AWB_WS_RL(awb_ws->awb_ws_rl) | AWB_WS_RU(awb_ws->awb_ws_ru) |
+			  AWB_WS_GRL(awb_ws->awb_ws_grl) | AWB_WS_GRU(awb_ws->awb_ws_gru));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_CFG_1,
+			  AWB_WS_GBL(awb_ws->awb_ws_gbl) | AWB_WS_GBU(awb_ws->awb_ws_gbu) |
+			  AWB_WS_BL(awb_ws->awb_ws_bl) | AWB_WS_BU(awb_ws->awb_ws_bu));
+
+	reg_addr0 = ISP_REG_SC_AWB_WS_CW0_CFG_0;
+	reg_addr1 = ISP_REG_SC_AWB_WS_CW0_CFG_1;
+
+	for (i = 0; i < 13; i++, reg_addr0 += 8, reg_addr1 += 8) {
+		stf_isp_reg_write(stfcamss, reg_addr0,
+				  AWB_WS_CW_W_0(awb->awb_cw[13 * i]) |
+				  AWB_WS_CW_W_1(awb->awb_cw[13 * i + 1]) |
+				  AWB_WS_CW_W_2(awb->awb_cw[13 * i + 2]) |
+				  AWB_WS_CW_W_3(awb->awb_cw[13 * i + 3]) |
+				  AWB_WS_CW_W_4(awb->awb_cw[13 * i + 4]) |
+				  AWB_WS_CW_W_5(awb->awb_cw[13 * i + 5]) |
+				  AWB_WS_CW_W_6(awb->awb_cw[13 * i + 6]) |
+				  AWB_WS_CW_W_7(awb->awb_cw[13 * i + 7]));
+		stf_isp_reg_write(stfcamss, reg_addr1,
+				  AWB_WS_CW_W_0(awb->awb_cw[13 * i + 8]) |
+				  AWB_WS_CW_W_1(awb->awb_cw[13 * i + 9]) |
+				  AWB_WS_CW_W_2(awb->awb_cw[13 * i + 10]) |
+				  AWB_WS_CW_W_3(awb->awb_cw[13 * i + 11]) |
+				  AWB_WS_CW_W_4(awb->awb_cw[13 * i + 12]));
+	}
+
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_IWV_CFG_0,
+			  AWB_WS_IW_V_0(pts[0].weight) | AWB_WS_IW_V_1(pts[1].weight) |
+			  AWB_WS_IW_V_2(pts[2].weight) | AWB_WS_IW_V_3(pts[3].weight) |
+			  AWB_WS_IW_V_4(pts[4].weight) | AWB_WS_IW_V_5(pts[5].weight) |
+			  AWB_WS_IW_V_6(pts[6].weight) | AWB_WS_IW_V_7(pts[7].weight));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_IWV_CFG_1,
+			  AWB_WS_IW_V_0(pts[8].weight) | AWB_WS_IW_V_1(pts[9].weight) |
+			  AWB_WS_IW_V_2(pts[10].weight) | AWB_WS_IW_V_3(pts[11].weight) |
+			  AWB_WS_IW_V_4(pts[12].weight) | AWB_WS_IW_V_5(pts[13].weight) |
+			  AWB_WS_IW_V_6(pts[14].weight) | AWB_WS_IW_V_7(pts[15].weight));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_IWS_CFG_0,
+			  AWB_WS_IW_S_0(2 * (pts[1].weight - pts[0].weight)) |
+			  AWB_WS_IW_S_1(2 * (pts[2].weight - pts[1].weight)) |
+			  AWB_WS_IW_S_2(2 * (pts[3].weight - pts[2].weight)) |
+			  AWB_WS_IW_S_3(2 * (pts[4].weight - pts[3].weight)));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_IWS_CFG_1,
+			  AWB_WS_IW_S_0(2 * (pts[5].weight - pts[4].weight)) |
+			  AWB_WS_IW_S_1(2 * (pts[6].weight - pts[5].weight)) |
+			  AWB_WS_IW_S_2(2 * (pts[7].weight - pts[6].weight)) |
+			  AWB_WS_IW_S_3(2 * (pts[8].weight - pts[7].weight)));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_IWS_CFG_2,
+			  AWB_WS_IW_S_0(2 * (pts[9].weight - pts[8].weight)) |
+			  AWB_WS_IW_S_1(2 * (pts[10].weight - pts[9].weight)) |
+			  AWB_WS_IW_S_2(2 * (pts[11].weight - pts[10].weight)) |
+			  AWB_WS_IW_S_3(2 * (pts[12].weight - pts[11].weight)));
+	stf_isp_reg_write(stfcamss, ISP_REG_SC_AWB_WS_IWS_CFG_3,
+			  AWB_WS_IW_S_0(2 * (pts[13].weight - pts[12].weight)) |
+			  AWB_WS_IW_S_1(2 * (pts[14].weight - pts[13].weight)) |
+			  AWB_WS_IW_S_2(2 * (pts[15].weight - pts[14].weight)) |
+			  AWB_WS_IW_S_3(2 * (pts[16].weight - pts[15].weight)));
+
+	stf_isp_reg_set_bit(stfcamss, reg_info->en_reg, 1 << reg_info->en_nbit,
+			    setting->enabled ? 1 << reg_info->en_nbit : 0);
+
+	return 0;
 }
diff --git a/drivers/staging/media/starfive/camss/stf-isp.h b/drivers/staging/media/starfive/camss/stf-isp.h
index 76ea943bfe98..80c4571dc522 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.h
+++ b/drivers/staging/media/starfive/camss/stf-isp.h
@@ -124,6 +124,44 @@
 #define SC_HEIGHT(n)				((n) << 8)
 #define SC_WIDTH(n)				((n) << 0)
 
+#define ISP_REG_SC_AF				0x0c0
+#define AF_ES_HTHR(n)				((n) << 16)
+#define AF_ES_VTHR(n)				((n) << 8)
+#define AF_ES_VE(n)				((n) << 3)
+#define AF_ES_HE(n)				((n) << 2)
+#define AF_ES_SM(n)				((n) << 1)
+#define AF_ES_HM(n)				((n) << 0)
+
+#define ISP_REG_SC_AWB_PS_CFG_0			0x0c4
+#define AWB_PS_GU(n)				((n) << 24)
+#define AWB_PS_GL(n)				((n) << 16)
+#define AWB_PS_RU(n)				((n) << 8)
+#define AWB_PS_RL(n)				((n) << 0)
+
+#define ISP_REG_SC_AWB_PS_CFG_1			0x0c8
+#define AWB_PS_YU(n)				((n) << 24)
+#define AWB_PS_YL(n)				((n) << 16)
+#define AWB_PS_BU(n)				((n) << 8)
+#define AWB_PS_BL(n)				((n) << 0)
+
+#define ISP_REG_SC_AWB_PS_CFG_2			0x0cc
+#define AWB_PS_GRU(n)				((n) << 16)
+#define AWB_PS_GRL(n)				((n) << 0)
+
+#define ISP_REG_SC_AWB_PS_CFG_3			0x0d0
+#define AWB_PS_GBU(n)				((n) << 16)
+#define AWB_PS_GBL(n)				((n) << 0)
+
+#define ISP_REG_SC_AWB_PS_CFG_4			0x0d4
+#define AWB_PS_GRBU(n)				((n) << 16)
+#define AWB_PS_GRBL(n)				((n) << 0)
+
+#define ISP_REG_SC_DEC				0x0d8
+#define SC_DEC_V_KEEP(n)			((n) << 24)
+#define SC_DEC_V_PERIOD(n)			((n) << 16)
+#define SC_DEC_H_KEEP(n)			((n) << 8)
+#define SC_DEC_H_PERIOD(n)			((n) << 0)
+
 #define ISP_REG_LCCF_CFG_2			0x0e0
 #define ISP_REG_LCCF_CFG_3			0x0e4
 #define ISP_REG_LCCF_CFG_4			0x0e8
@@ -140,6 +178,8 @@
 #define ISP_REG_OECF_X0_CFG6			0x118
 #define ISP_REG_OECF_X0_CFG7			0x11c
 
+#define ISP_REG_OECF_Y0_CFG0			0x180
+
 #define ISP_REG_OECF_Y3_CFG0			0x1e0
 #define ISP_REG_OECF_Y3_CFG1			0x1e4
 #define ISP_REG_OECF_Y3_CFG2			0x1e8
@@ -204,6 +244,49 @@
 #define OFFSET_B_POINT(x)			((x) << 8)
 #define OFFSET_A_POINT(x)			((x) << 0)
 
+#define ISP_REG_SC_AWB_WS_CW0_CFG_0		0x4d0
+#define ISP_REG_SC_AWB_WS_CW0_CFG_1		0x4d4
+#define AWB_WS_CW_W_7(x)			((x) << 28)
+#define AWB_WS_CW_W_6(x)			((x) << 24)
+#define AWB_WS_CW_W_5(x)			((x) << 20)
+#define AWB_WS_CW_W_4(x)			((x) << 16)
+#define AWB_WS_CW_W_3(x)			((x) << 12)
+#define AWB_WS_CW_W_2(x)			((x) << 8)
+#define AWB_WS_CW_W_1(x)			((x) << 4)
+#define AWB_WS_CW_W_0(x)			((x) << 0)
+
+#define ISP_REG_SC_AWB_WS_IWV_CFG_0		0x538
+#define ISP_REG_SC_AWB_WS_IWV_CFG_1		0x53c
+#define AWB_WS_IW_V_7(x)			((x) << 28)
+#define AWB_WS_IW_V_6(x)			((x) << 24)
+#define AWB_WS_IW_V_5(x)			((x) << 20)
+#define AWB_WS_IW_V_4(x)			((x) << 16)
+#define AWB_WS_IW_V_3(x)			((x) << 12)
+#define AWB_WS_IW_V_2(x)			((x) << 8)
+#define AWB_WS_IW_V_1(x)			((x) << 4)
+#define AWB_WS_IW_V_0(x)			((x) << 0)
+
+#define ISP_REG_SC_AWB_WS_IWS_CFG_0		0x540
+#define ISP_REG_SC_AWB_WS_IWS_CFG_1		0x544
+#define ISP_REG_SC_AWB_WS_IWS_CFG_2		0x548
+#define ISP_REG_SC_AWB_WS_IWS_CFG_3		0x54c
+#define AWB_WS_IW_S_3(x)			((x) << 24)
+#define AWB_WS_IW_S_2(x)			((x) << 16)
+#define AWB_WS_IW_S_1(x)			((x) << 8)
+#define AWB_WS_IW_S_0(x)			((x) << 0)
+
+#define ISP_REG_SC_AWB_WS_CFG_0			0x5d0
+#define AWB_WS_GRU(n)				((n) << 24)
+#define AWB_WS_GRL(n)				((n) << 16)
+#define AWB_WS_RU(n)				((n) << 8)
+#define AWB_WS_RL(n)				((n) << 0)
+
+#define ISP_REG_SC_AWB_WS_CFG_1			0x5d4
+#define AWB_WS_BU(n)				((n) << 24)
+#define AWB_WS_BL(n)				((n) << 16)
+#define AWB_WS_GBU(n)				((n) << 8)
+#define AWB_WS_GBL(n)				((n) << 0)
+
 #define ISP_REG_ISP_CTRL_0			0xa00
 #define ISPC_LINE				BIT(27)
 #define ISPC_SC					BIT(26)
@@ -315,8 +398,19 @@
 #define CURVE_D_L(n)				((n) << 0)
 
 #define ISP_REG_ICAMD_0				0xc40
+#define ISP_REG_ICAMD_1				0xc44
 #define ISP_REG_ICAMD_12			0xc70
+#define ISP_REG_ICAMD_13			0xc74
+#define ISP_REG_ICAMD_14			0xc78
+#define ISP_REG_ICAMD_15			0xc7c
+#define ISP_REG_ICAMD_16			0xc80
+#define ISP_REG_ICAMD_17			0xc84
+#define ISP_REG_ICAMD_18			0xc88
+#define ISP_REG_ICAMD_19			0xc8c
 #define ISP_REG_ICAMD_20			0xc90
+#define ISP_REG_ICAMD_21			0xc94
+#define ISP_REG_ICAMD_22			0xc98
+#define ISP_REG_ICAMD_23			0xc9c
 #define ISP_REG_ICAMD_24			0xca0
 #define ISP_REG_ICAMD_25			0xca4
 #define DNRM_F(n)				((n) << 16)
@@ -439,6 +533,30 @@ enum stf_isp_pad_id {
 	STF_ISP_PAD_MAX
 };
 
+enum stf_isp_modules_index {
+	imi_obc = 0,
+	imi_oecf,
+	imi_lccf,
+	imi_awb,
+	imi_sc,
+	imi_cfa,
+	imi_car,
+	imi_ccm,
+	imi_gmargb,
+	imi_r2y,
+	imi_shrp,
+	imi_sat,
+	imi_dnyuv,
+	imi_ycrv,
+	imi_ctc,
+	imi_dbc,
+};
+
+struct stf_isp_module_info {
+	u32 en_reg;
+	u8 en_nbit;
+};
+
 struct stf_isp_format {
 	u32 code;
 	u8 bpp;
@@ -478,4 +596,21 @@ int stf_isp_params_register(struct stfcamss_video *video,
 			    struct v4l2_device *v4l2_dev,
 			    const char *name);
 
+int isp_set_ctrl_wb(struct stfcamss *stfcamss, const void *value);
+int isp_set_ctrl_car(struct stfcamss *stfcamss, const void *value);
+int isp_set_ctrl_ccm(struct stfcamss *stfcamss, const void *value);
+int isp_set_ctrl_cfa(struct stfcamss *stfcamss, const void *value);
+int isp_set_ctrl_ctc(struct stfcamss *stfcamss, const void *value);
+int isp_set_ctrl_dbc(struct stfcamss *stfcamss, const void *value);
+int isp_set_ctrl_dnyuv(struct stfcamss *stfcamss, const void *value);
+int isp_set_ctrl_gmargb(struct stfcamss *stfcamss, const void *value);
+int isp_set_ctrl_lccf(struct stfcamss *stfcamss, const void *value);
+int isp_set_ctrl_obc(struct stfcamss *stfcamss, const void *value);
+int isp_set_ctrl_oecf(struct stfcamss *stfcamss, const void *value);
+int isp_set_ctrl_r2y(struct stfcamss *stfcamss, const void *value);
+int isp_set_ctrl_sat(struct stfcamss *stfcamss, const void *value);
+int isp_set_ctrl_sharp(struct stfcamss *stfcamss, const void *value);
+int isp_set_ctrl_ycrv(struct stfcamss *stfcamss, const void *value);
+int isp_set_ctrl_sc(struct stfcamss *stfcamss, const void *value);
+
 #endif /* STF_ISP_H */
-- 
2.25.1


