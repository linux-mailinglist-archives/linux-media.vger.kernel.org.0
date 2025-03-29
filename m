Return-Path: <linux-media+bounces-28977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4E2A7545A
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 06:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 859251895C73
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 05:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC6319DF98;
	Sat, 29 Mar 2025 05:45:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021083.outbound.protection.outlook.com [40.107.51.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF917170826;
	Sat, 29 Mar 2025 05:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743227134; cv=fail; b=gHmConpxwmHL3Sa7QJrGtn+8xAoy4He61+multoTIgNztO7i1+L/6k9cfOMfIr79cGxbYqBih33OKLa0WXHYrsWw3j03in70uXWUSqpuoWuhw2Iu0WbrZJgIKV1EYxhvUSYMpIb/3Cqq1yqnwug+OGrDq0KzfQMaiTZ9wUzlev0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743227134; c=relaxed/simple;
	bh=anM1RwVm9wyECGFhf9KFUf/MmiNC+Jq4V+xYLiZ5I0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FOYiQ2PBg6GrybjVATOVysHgNAeCEu/ri90tc2LSNdlQlQIVJXKJ+SPBGkpk3m/NiCi5tmW4q+oaLUrwAOfftEofI+H8FMccCgwSqgv6lEldNa9Rt2JiK4y1v/x9NdhgJC4e0nnnsV7K2qUV9aaPqrcYTFHkBiIuu7HLi5ifhTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlWP+dIMoOmT2U0ZlZivbG0/5q1F9wLcGXtJKFdMjdNtEZg/cUK9JA82Lwd/PIgc6P4SI3bDkUeto5H4VnTYtSlR04A4H1G+LQtAL54+FIxM+xysWdAdXRnRh/kbUV7RvN7RX7sMyQpH3n/ccO0eLIttwEsCuKlb4EYeOjGKW2y7JB9DvnTlSs60qm+JK2K15dsSpkZG6Rl8sbR9v5kQysDmxcmPKRy3/Wm2T7oIchXoa/hY54z0XMMc9LT5wdzVFpV/TAOzgRxKc8VnmpP0j6q6BQF2TKT0NFfrZAgqrLQUeBjIykKotxbzpXopBgO+Y2YF07O2oscQOL2+yn10bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqPMZOtX56B3Til9vyQTDVTiqW6ByjccrfuRKr7juuU=;
 b=c+V5fJHTLOcKqGS8+mT24eHs9rkBEYo1x4I7tZ6CW1J6E6p0aq8Q0Swa+HHigDkU1hxjpm5wJ/ikN4CkiHWmtb3fMlPV98YyXvPWAGMO2/dy+OkZD2Qrn2H/CRB8LVeY876SLS0Ne9hPB/R3Lwk+60evasyAAvzfq46mgO3rCdKZaIqxBURnC9O2N78mOoabUIZd8r6QMpDmF2EiwwimyZcdMSsVate3CD1PMZMP5mcSjdm13mJX7iFFLSqZ2nwPtGLPRoVYzA82rlARFXj7potJrxcWOI6nt8xVjsl6cG5stmy7mg5BZRdRqWHpDAP7KBa+pBLSb9+SfRZUnxEJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB1842.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Sat, 29 Mar
 2025 05:45:29 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 05:45:29 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Julien Massot <julien.massot@collabora.com>,
	Luis Garcia <git@luigi311.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] media: i2c: imx334: Configure lane mode Dynamically
Date: Sat, 29 Mar 2025 11:13:26 +0530
Message-Id: <20250329054335.19931-5-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
References: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::36) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN0P287MB1842:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b366d3-b218-4443-5293-08dd6e84e9f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UshwayqnxjS+VWkyHn+0SM9x13Kw+kujhhbp5uDeN2b4wd3vC9hDEttKnuJg?=
 =?us-ascii?Q?nB07AlIAbBma2+0yHLz/dcW+ufE3MftPplTL58Bq0ZOc7D2NwGohQBMZqHE5?=
 =?us-ascii?Q?QJs/+xKOzcv/9Qg+INkxkV2MRxaIioUAjsJU9CIAuLa+XuVAhyHZSc7TvPXo?=
 =?us-ascii?Q?mCCNRXpQPzowSPJR1RF96RAySmzeh0YJ1hHqfg+0MzKvA3RViuci83VhNxH4?=
 =?us-ascii?Q?kVdb/BmSC1SSd+VcZoMQO5u2UnEn8pDzryowQ06J07BTSZeiUH/Pid7K18CC?=
 =?us-ascii?Q?oaPvdR5WEQKVE7CC4SxHkK9l27JjM3AjBgpvsgSJrxCR0TfXWOPV+hJ4JJO8?=
 =?us-ascii?Q?Qye6ycUp39T/kWc0XhyZU/SctWT3vqwWoTYO6yTB162aepRMRikBpOaTmi03?=
 =?us-ascii?Q?r0bTMIDUxYACZ/Zn+I06oSMRr2ODce+Unl7C1UvLVfRHrI9Ku+oMrqiodnQj?=
 =?us-ascii?Q?T35tgCOIc6KPmhJ42+lbhGJLX5nOhZJTa2ITQXLUayI4w6At61xkQwwrjbF3?=
 =?us-ascii?Q?IfWh9+v2usmuXnc3Z14fHHm4zKw7wwf5230NM3riAGs4Yy46SMAZZwMEpCKO?=
 =?us-ascii?Q?Asewr14u+O9qsFBRin7dsFG9tfOJ4Cne1Vq/TUBnsZ/spRaJR+ihhgE+FxaZ?=
 =?us-ascii?Q?Vw85sUeSSYsXZWQmr4NGArxzIYvb/PZLELRaS8/hI/BJWaNnFhmX0xpp/98A?=
 =?us-ascii?Q?MF1g5ztx2IjrYlh9wHlEI1iGjRCvOW5PEzLZJzkSdvcrLtsMhUIDVTUdQygC?=
 =?us-ascii?Q?b8dPVet2oMVkcBKfV2yOlbcCJEH9JkIkasyn/q5zC0VtFv7jObQ6+PnAj24E?=
 =?us-ascii?Q?YYj6PNuDkx44RRkgqy427z/fgPTkafvYhUftkEjXr6CCtnn6w3zl6g4/AUKP?=
 =?us-ascii?Q?JL70tWp6zDw/bPsHY/1c4+5RtWFT5mbCIvEc/19K4BcCKtCPuKrDY82hC85g?=
 =?us-ascii?Q?4702Mup6ud5czlOej6s+tTbL8YnG46oOUFcxI8kyvsdUypU928GFI5vRa5gt?=
 =?us-ascii?Q?Rw0Z5lWjBAEwrUUgzaEbrx9VGdLbaZOGHqrwQpSejNDYiXkbRciV5dkqK8I0?=
 =?us-ascii?Q?7QjAPOZ+ArziTGanOSfoG4wbYwXK3nNIFaCRG1MJIVxqy9T8speaOZS86/WZ?=
 =?us-ascii?Q?5i+c91vvO9JQaF0Oyx3gsiDv/OY3iYSpHErKw/pyQ62CWB4/qeDDH4ViG88u?=
 =?us-ascii?Q?mHQcGdM6wawrPqsrXLgnbdGdFkVP+VE1rHtHsb/Gnl9gZECjs5jcKFDez8F5?=
 =?us-ascii?Q?8T15n8qSg/IowLqnlb6kL2RMLa2Fn+wn6j2nID7zNU9D21fdw20L3jhxtD5e?=
 =?us-ascii?Q?w9b/vaiN4XZeroEB+CHY5G3Cc97S4q1Uo1+dro/+6pPAmAoo6q/ASxWx0DQg?=
 =?us-ascii?Q?zDH437fSQOKursvNGfrt5201yujZ4TWLs5QxLHp6KFSwIsclDm+L/5sEbeFA?=
 =?us-ascii?Q?rmC06iRJ95kgY9HuvM8lVCeozH7JJPeDE/tM+NwckZGT2MUqMbBKxw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I++uHN9BEm/EW6puIyqj+wII+p5rQQCFAMdWjFsGcr/GHOSafhkPkwY0xHYK?=
 =?us-ascii?Q?2zLvSKvW9uH0tkt2V0JKBAuORLEDPH7XcUw6OV7RGJ0+6+zVdyvoEBeNyu49?=
 =?us-ascii?Q?cKch72KGkC47EXqCQH81NNUiSILQNmv2WBngC+VSCQXIKCe3aaHBQKo4C/fT?=
 =?us-ascii?Q?W9Kv1vN2HgtisIZq3HLLVGOdnfwO1QLbPAFUmGLt9u4HJo5oH1mewzj0S7TN?=
 =?us-ascii?Q?tAOYjfV5N7aHd0JrGpJORftrA7fuVwvlNQOgNMLhavW4yMhLzKNJIAcPCbdH?=
 =?us-ascii?Q?Ry0D4ueezfXvoMVI7OCVje62Mke7At3abDnt0uGw3gYytP2/6nITW7s4xSdD?=
 =?us-ascii?Q?668EqamlcvRF5bcifVoblBGHIj6+9556es6vojjYcwWkv6iU+lhhAX/t+CUI?=
 =?us-ascii?Q?vBlCKHSDKdaZz4o4x9S3Dc4bwywPMnFMNehengswqh5Uc1AA8upyl9hObyff?=
 =?us-ascii?Q?i0aqWUmbe42/eXto5h4Hh59S6faT/BwnqO650Yaq4D3Pb4lXARJOReKA1G2n?=
 =?us-ascii?Q?dgsR7C1sWJJs3+A8YhnYv0Ob8+JmVP6dKwnreo6tnXfPpSL/u3ySRqF0GAPP?=
 =?us-ascii?Q?5ziVU1wOhqbZ6kZOkel27pMHrCTpQWDSjLFZMiazRgfRt8FS2by0XjzCCAgG?=
 =?us-ascii?Q?7YtDfO4SEm7wX3hlG62XgLb3nI5NR1kcL3URU/xz45UNbFSQcvvJPDeoUHk/?=
 =?us-ascii?Q?Fa5PvL20R6FCQo7Oacc08dMFFHMI79o4Nht6AEIUIhFP8dwhXoBE3KChDAvu?=
 =?us-ascii?Q?Vs3mklI25RnXfo19kgal7Kg4e2hRXXfyIv6BEyZDIfCWB91HsafdpxLQTZrB?=
 =?us-ascii?Q?6TQqcPGSXGissAMMBE8HHGv47sjmZc50i4MgJn6vCWOnXIsZfQFFi3w3x9m3?=
 =?us-ascii?Q?ZOaGzEgmdvlM1WJDIbkp+RfZwzhK1h0YMbZHED5LAaAPORp92Lydz/5ep2RR?=
 =?us-ascii?Q?TRKRC5TSN11bJU6hY+kpzvHqKMcpDbFaoFgqeU2KhF35VwZ4XLZmvuqHNOTJ?=
 =?us-ascii?Q?L67GfuRRqOcbi7oagfF1UH2JE0etCpm+jh7xj78t+uAJ8TLW//q9ECTB0BJ9?=
 =?us-ascii?Q?Td5ov8mJhwFPol7nNNxCwAg1byG8hSZRMg7Sf+YumZmbF6F1dOg38SLNeORG?=
 =?us-ascii?Q?B1BvVKs+a2smpMn/sr7AtRXHfne2Njb2NgPF0SEz9NlQh0tQ+7foQpldMJmA?=
 =?us-ascii?Q?nNIyQNCwamCBtM4dtmBvWCbknjNMN+rN+xD9og+1x/FExG3UBCMiq0v88bLm?=
 =?us-ascii?Q?lZ5N3ieiUxDf/mGpXbvCBF6zHXUhXrI1/jVxsxCtv9owke0G2ShepQqwW97J?=
 =?us-ascii?Q?ljvndqWTwYa+7XcImAUXdqGgCMUW/xQypQ/blWfI+JkNL1zoX1x6KEl9R+1n?=
 =?us-ascii?Q?7jy5RWrzjZp0L5td4tGSjLrNEoOca2lj5PDWSHH67vhn0te693C7AF20pko/?=
 =?us-ascii?Q?fu/2p7vqGOH0Fi2SfbIt3DfZiUTruCN6xsfgrIANXa1GXgfxvZnyCjPhOuVN?=
 =?us-ascii?Q?jLmJAzd1N4kZ6zWt+Cv94BikcUwSZ2pIPbo1dqqidF0F+Lv4eww7/h6CYDyQ?=
 =?us-ascii?Q?52/SRvrV5lIyiuXK+MFcS300ZSv6yF+rhj110OwMPj4WPpU1yPHg9/bfrgDw?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b366d3-b218-4443-5293-08dd6e84e9f7
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 05:45:29.7908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJcVoXxdm4YwmHVHK3N6TpEBJuAUM9SXvVeo0hHdAcSnKRli+fgKa8G8YN8FhOlcD5PhHpcbqR+QdVKHlTxf0zTqKPN0U5ZWHSEcJPtPs30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1842

Configure the lane mode dynamically from the streaming
function instead of using a hardcoded value.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx334.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 9d4d15df8dcf..f7be303af024 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -47,6 +47,8 @@
 #define IMX334_EXPOSURE_DEFAULT		0x0648
 
 #define IMX334_REG_LANEMODE		CCI_REG8(0x3a01)
+#define IMX334_CSI_4_LANE_MODE         	3
+#define IMX334_CSI_8_LANE_MODE         	7
 
 /* Window cropping Settings */
 #define IMX334_REG_AREA3_ST_ADR_1	CCI_REG16_LE(0x3074)
@@ -240,7 +242,6 @@ static const struct cci_reg_sequence common_mode_regs[] = {
 	{ IMX334_REG_HADD_VADD,		0x00 },
 	{ IMX334_REG_VALID_EXPAND,	0x03 },
 	{ IMX334_REG_TCYCLE,		0x00 },
-	{ IMX334_REG_LANEMODE,		0x03 },
 	{ IMX334_REG_TCLKPOST,		0x007f },
 	{ IMX334_REG_TCLKPREPARE,	0x0037 },
 	{ IMX334_REG_TCLKTRAIL,		0x0037 },
@@ -876,6 +877,13 @@ static int imx334_start_streaming(struct imx334 *imx334)
 		return ret;
 	}
 
+	ret = cci_write(imx334->cci, IMX334_REG_LANEMODE,
+			IMX334_CSI_4_LANE_MODE, NULL);
+	if (ret) {
+		dev_err(imx334->dev, "failed to configure lanes\n");
+		return ret;
+	}
+
 	ret = imx334_set_framefmt(imx334);
 	if (ret) {
 		dev_err(imx334->dev, "%s failed to set frame format: %d\n",
-- 
2.34.1


