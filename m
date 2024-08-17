Return-Path: <linux-media+bounces-16405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 255A0955647
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2024 09:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49F5C1C2145B
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2024 07:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1111428F3;
	Sat, 17 Aug 2024 07:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PYCTwhFi"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C57B657;
	Sat, 17 Aug 2024 07:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723881024; cv=none; b=Asl5h0DZp2HAN5Nrms5LgqH28CFsR+H3kHicayEYb103PalLeSdoWZZJdzzHgRlE3fBIUyA9oNyQ8XdY/OGWztecuVR+mJUHPxtTKmNV4/CGG5BRpEGLP44bHAWLs0DWeFpaaSliP/ciUaWXsKI1rNJd+kXGrBqSy8HL66u51X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723881024; c=relaxed/simple;
	bh=lJ+bzKxQQ9J1zundLHGX0rmjg4TeBxh9Iu4ubcsLQxc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G5Wzpa/yya/h4/nR4SEUpGiGSt81bilUEym3JJ02eymLKeCvmyijbtdz0+tqFGJFih+RwqOUXOH3VQc07IkjugEeSveyAcZ8tgoGnFaUmNkPZM/V5Z3SgCQrP6ZECMKgDTRJiovkBqDrDiiW5bw5mXbwSzfhFCdb0fM6Ox0s7mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PYCTwhFi; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 38175b385c6b11ef8593d301e5c8a9c0-20240817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oDxP565M3e/1/ATaMhgsl2oGGX16jXdrhb9ibx6pOK8=;
	b=PYCTwhFiTcPigEHwtY04nvBNAaq6uTdHIbLvJJExzeXdFr7Xffz8HwGeJVOB7UJir497OeAEtAhs6vbFZPar6MC0yUDQx96YyUoXjpH/DgyG+GSX5Xe7+sqO4K0lHLJtBz8gWonjL3OUNNYta3Pe5RjkqMSCTrB/+rQF1mRCABg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:e9cc2b30-50e5-4c89-8d19-591f6cb3e96f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:f7cfbdce-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 38175b385c6b11ef8593d301e5c8a9c0-20240817
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1055596188; Sat, 17 Aug 2024 15:35:04 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 17 Aug 2024 15:35:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 17 Aug 2024 15:35:04 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<shengnan.wang@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <yunkec@chromium.org>, <10572168@qq.com>, Zhi Mao
	<zhi.mao@mediatek.com>
Subject: [PATCH] media: i2c: improve suspend/resume switch performance for GT9769 VCM driver
Date: Sat, 17 Aug 2024 15:34:02 +0800
Message-ID: <20240817073452.21627-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.895800-8.000000
X-TMASE-MatchedRID: Oc3lNZcRIY7R/1qlpYxoUlVN8laWo90MWjWsWQUWzVpcKZwALwMGs8CS
	2AMm1nQCXj+G1I2Cld9RCqldf11uXwClEgKLW3itBDoR8w7C9OZWjiXAsVR2K0+OfsT6fdpn+Vi
	hXqn9xLFMJgsbV0+Bf+pAvk4T8Agrbn83JMqUbr0MH4SsGvRsA7zWODqZvEk5ol3uZzZ1GLfXvK
	BONfUNb+krhuwxhcex326LyHbpKCPsIv/PxUkglXV7tdtvoibaMVx/3ZYby79fXk0kfCOnbt5NR
	zJ0gz5HsNV8m2Omj9WAMuqetGVetnyef22ep6XYymsk/wUE4hqfigt155p8oY9tUqB3K1zQw//t
	taiU0fabfUda0wkrLX3dHoIymspUwL6SxPpr1/I=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.895800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	19799DA5C2E152BDCCA6451577318065D2A4DDD1ED7AB9367165EB13BC04EB7D2000:8
X-MTK: N

GT9769 VCM power-on default setting is PD=0,
so it is not necessary to set again in dw9768_init function,
and it also has no requirement of setting PD=1
before power-off in dw9768_release function.
For GT9769 VCM, PD mode control will add extra time
when switching between suspend and resume.
e.g. chrome camera AP can switch between video and photo mode,
the behavior corresponding to VCM is suspend and resume,
it will cause camera preview is not smooth.

Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 drivers/media/i2c/dw9768.c | 65 ++++++++++++++++++++++++--------------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index 18ef2b35c9aa..88d96165a805 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -97,12 +97,17 @@ static const char * const dw9768_supply_names[] = {
 	"vdd",	/* Digital core power */
 };
 
+struct dw9768_vcm_data {
+	bool pd_mode_ctrl;
+};
+
 /* dw9768 device structure */
 struct dw9768 {
 	struct regulator_bulk_data supplies[ARRAY_SIZE(dw9768_supply_names)];
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *focus;
 	struct v4l2_subdev sd;
+	const struct dw9768_vcm_data *data;
 
 	u32 aac_mode;
 	u32 aac_timing;
@@ -221,18 +226,20 @@ static int dw9768_init(struct dw9768 *dw9768)
 	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
 	int ret, val;
 
-	/* Reset DW9768_RING_PD_CONTROL_REG to default status 0x00 */
-	ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
-					DW9768_PD_MODE_OFF);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * DW9769 requires waiting delay time of t_OPR
-	 * after PD reset takes place.
-	 */
-	usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
+	if (dw9768->data->pd_mode_ctrl) {
+		/* Reset DW9768_RING_PD_CONTROL_REG to default status 0x00 */
+		ret = i2c_smbus_write_byte_data(client,
+						DW9768_RING_PD_CONTROL_REG,
+						DW9768_PD_MODE_OFF);
+		if (ret < 0)
+			return ret;
 
+		/*
+		 * DW9769 requires waiting delay time of t_OPR
+		 * after PD reset takes place.
+		 */
+		usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
+	}
 	/* Set DW9768_RING_PD_CONTROL_REG to DW9768_AAC_MODE_EN(0x01) */
 	ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
 					DW9768_AAC_MODE_EN);
@@ -294,17 +301,19 @@ static int dw9768_release(struct dw9768 *dw9768)
 			     dw9768->move_delay_us + 1000);
 	}
 
-	ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
-					DW9768_PD_MODE_EN);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * DW9769 requires waiting delay time of t_OPR
-	 * after PD reset takes place.
-	 */
-	usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
+	if (dw9768->data->pd_mode_ctrl) {
+		ret = i2c_smbus_write_byte_data(client,
+						DW9768_RING_PD_CONTROL_REG,
+						DW9768_PD_MODE_EN);
+		if (ret < 0)
+			return ret;
 
+		/*
+		 * DW9769 requires waiting delay time of t_OPR
+		 * after PD reset takes place.
+		 */
+		usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
+	}
 	return 0;
 }
 
@@ -440,6 +449,8 @@ static int dw9768_probe(struct i2c_client *client)
 						      dw9768->clock_presc,
 						      dw9768->aac_timing);
 
+	dw9768->data = device_get_match_data(dev);
+
 	for (i = 0; i < ARRAY_SIZE(dw9768_supply_names); i++)
 		dw9768->supplies[i].supply = dw9768_supply_names[i];
 
@@ -525,9 +536,17 @@ static void dw9768_remove(struct i2c_client *client)
 	pm_runtime_disable(dev);
 }
 
+static const struct dw9768_vcm_data dw9768_data = {
+	.pd_mode_ctrl = true,
+};
+
+static const struct dw9768_vcm_data gt9769_data = {
+	.pd_mode_ctrl = false,
+};
+
 static const struct of_device_id dw9768_of_table[] = {
-	{ .compatible = "dongwoon,dw9768" },
-	{ .compatible = "giantec,gt9769" },
+	{ .compatible = "dongwoon,dw9768", .data = &dw9768_data },
+	{ .compatible = "giantec,gt9769", .data = &gt9769_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dw9768_of_table);
-- 
2.46.0


