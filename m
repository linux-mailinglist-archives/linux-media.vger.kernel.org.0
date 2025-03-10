Return-Path: <linux-media+bounces-27924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B637FA58CAD
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 08:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 329A1188D5F4
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 07:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77811DE3A8;
	Mon, 10 Mar 2025 07:20:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021092.outbound.protection.outlook.com [40.107.51.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63171DDC35;
	Mon, 10 Mar 2025 07:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741591222; cv=fail; b=l7KEtUrXiAHKP4XI0ouFYxYQVa2RheQQYN3FviwCWTczrufJCeo8YeRNqC3e1gTEyp0Wp6RpHqk8PVb1al9gEhh8OzFVtstmgakfpPAAYmKxQ/uZy1r/DivPUTw3P3ezEQHuMWM3KaW66HsXDmeET6D9F1MWQBRt7hy5UIockmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741591222; c=relaxed/simple;
	bh=ewWxnjPNDBo3Ieghsw94WQ3xRvsJ0/TPoYNmTlt7+/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ItS0VEv6HR/K7q6kUt66ffx/fY8IcMqovmXEvP3ShUAC2x17FoXAMInvX+4IeACO3jXo02m5BM9QFWeIoMIiXyicGjnDwwpL2fuk8zRkaX5BVp1QlvxZGKxX5tdNvEkIs768QCWns3vxgkPV3NcHC7FXLRlu+BgGkbHJikfjsOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2K89zDL3nvopUEtI1yBo+3YUHK52CUHtsBtk/SHImbHwgIBYWQpMpakZExD4/Vb5ayYym9fItN+pTTFjMjQj7u22WpgiwNB9+SwRqRFDwrWJqQSv4G93fg/E++cMi/KfDhoj/FRLWmgIIapmKG49zvAXsmm+hi5fOIPIgciZB1r8Y1bUrjz/cFQj9FNbAb/lZVIhyPKTKAA82ZFZnfebX1QiovYfEHiM9Njt1fIkAvIDyM4pGIott3wjBbVpt1Dc7Y7Ee82DIyZxJVQIwQGUiL/GhD0RqDzp3/UKh2KDohke/U98ZX994S3ADC8mWYkCwBJW45a7O6tSmThsKGi9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13AEPMgvU85jOuFrFuRPqX51b1bvxuHi/BqqRKrU3nk=;
 b=EHw3+jvg3n1LzmOJLHYxAgA3AcRPxBFigTFobvhDmc0nP6dYwBnRA+0dSEUsU4McIjjQIchKxU956btUQoawuI5c1VG3X12fJ9kbm6k0LBYEd4zy+EIxgG87kBcolvNpBvcguypDCKaZtt+SDk344ML+d5xXkBFMsNOnYvphre92GN6tnZtn1h+Jpvg4OggqnFy7ugHJaRVqksQsf+aYa2Q6OWcz70jyL6Fk/Z4ZT0NREUCDh1vzJ5borzOysS/Nv77iXYops+YvufK67Tf8wEA4Emr6qTOd0QSoJFRVYlQdmXGVzRHjcoJLFk7T4Dl0UMb66olz94H3eaQwraLltg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1311.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1ad::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 07:20:15 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 07:20:14 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Julien Massot <julien.massot@collabora.com>,
	Luis Garcia <git@luigi311.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] media: i2c: imx334: Support 4 or 8 lane operation modes
Date: Mon, 10 Mar 2025 12:47:46 +0530
Message-Id: <20250310071751.151382-5-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PEPF00000180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::50) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB1311:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5c95a7-0fcc-492b-9df8-08dd5fa400a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?InXvaA0RNdbM7auvTSkCzUMjV/8UDz/juyNgiGgyA4nVIzDpkAVdJ+rltjlp?=
 =?us-ascii?Q?Jnij/a9GgGJoEWKtZoyyPZAZ/G+QWjBnJEgFlmjnhtyrhiyPY2WbkNX5mN3r?=
 =?us-ascii?Q?xyp3x+UTmrmtwtVF903vCsbZ0+G3kBxPEfOxNBezrAkdPcNNhBAN2wqM8/46?=
 =?us-ascii?Q?1AohjBFIRi5aZO4fwARnwRs7SXJmnvMFk0oqpdNNNtS9iG3x4/mMNZpeO3xd?=
 =?us-ascii?Q?1ru8g1A7CmJjfI2re4GW0p1FMEj4yuPcPKWKs4LhANVoPPw/g6OMBLwIb1dk?=
 =?us-ascii?Q?0f8T6V1C3wwKRTjO2/DoAkcz8ps5ZT2jGd3rOwlzUTxugsu7MGqgrxMmRF21?=
 =?us-ascii?Q?7nXfeIjSuAyNQtOW6wYRWmevWdLxNZrPpiPeZiQPlv8MhH8aAZj/Iu1ZxuVA?=
 =?us-ascii?Q?wDCMVfl+sBtVpIBvzrHe6O+UYjajVYSMtOMAiB618yUw0KiwLre8l4rrVgvR?=
 =?us-ascii?Q?TRSwloOcCnueKK7zsWO+PiFei8RdqDKtmLNIAvotDR6A6+aVtMraJffMzAC1?=
 =?us-ascii?Q?TA/sqJYGO6hZmgu5/ZwxBr3g8ztKJOHBsHecxbEIQ4nsvZTWyT8pabm2MRvN?=
 =?us-ascii?Q?/V2VhRselAOtuORC36+9lW+7m08NtOli2SGka5QI1xsnalseOcN/VIR8fakj?=
 =?us-ascii?Q?y4uTKiQH18yu+Ba+WOHQP2mbPpy5ElRJMKNBiYPEm14uUqKWNTB7iySmPQD/?=
 =?us-ascii?Q?l4Ejc6GYk17rjQXT0ECmcTTjtRG4bSz6EhrjfpsNsuZm8Llj/EQLFJEbtUDG?=
 =?us-ascii?Q?Z7Vo2JGcUSD3BJ2+YbUNVVukV9Da4+ERcs9XqT+BU8ISL1ciGJkz+oo1P1pl?=
 =?us-ascii?Q?nTVxqx7/ccoftcCxb4JQwgA67zubMHqvzWPlF0wGSca8aMTo49RChFP77mxA?=
 =?us-ascii?Q?qQhbkrwqaPh/GlsJXqPD1b596ZnnPcd8OcsJkmcrPeEYyRtbxUmhnzkDiY+B?=
 =?us-ascii?Q?e6hSU87l42X5Fy/yXm573qRQYtwtyJKhIe66PW0SCxdRf2eFg2aOdvczNQOo?=
 =?us-ascii?Q?IXzVKCtOerothyK5b/vKUMjnLfk7HmYWlDwEm7Rk2j0y2CEK+JC+HqY0VnM+?=
 =?us-ascii?Q?gS7/sd7tXylV5UkeroBLBmV/idyN1rW2O6sRx0qVXJgdUCJq1f0sILpi1zYn?=
 =?us-ascii?Q?Acx4e+pZtXtQNrgX8rDblyQrFh7NNg62ceBrOdP/xQfNMZq+Ayeqg5LsyKst?=
 =?us-ascii?Q?q9m/35XrC5P7Sc1EQkKhKYKaCmbcugIr7AEWJE5NFDtrgZwjNFsMxgkxGRQj?=
 =?us-ascii?Q?HDxve8BxNG3HWsdPvbiHoihWRWVNX3poRpwaTkFsFmVXbgX0QIE7cZY61tHp?=
 =?us-ascii?Q?UXPe2Q9rPhoriFjlq3WT/F+OnOxD6kY5qwGzlX2FOd6EeHVIKybECXBVzAql?=
 =?us-ascii?Q?Qf3YvNHIBECyTZe8D4EuuJb3zgChkOLkQW4gbz2GByY+kKEqNegyT6bdq9dS?=
 =?us-ascii?Q?FvrC8a6e2QM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?srrZ5Ur9jgJC0ppCkJ4QlKxESjyW500mQudmx2zPr7parC2et81ZHfhO+iIx?=
 =?us-ascii?Q?LKqdjlxO25Xqtm1qSibcQN9qwIOeg8bcyRwKJL6CvFy+e/Y/wHPhJTYQN9wU?=
 =?us-ascii?Q?3fKJKOVjVYeUE5wWSdrW+gLeS55QKVRb6rwIRsA0UvP5OY790uvBkqw6kS76?=
 =?us-ascii?Q?ykZVtPhRzo+FxKalINI3Wyz8YaQbyQBcB7BfkLxHMtBfCWDgUJNlaOysyY5y?=
 =?us-ascii?Q?qN9K8iX4ClUoOy99blxsc0N1EldP6ssMTHYqzzEZaGUO1AzWJDC1Ad+H9qZG?=
 =?us-ascii?Q?UnrJZBxwnlhKascoR0Yj2NmW2EmbltmacyS/MR5r4CccAUwztkoq63j1c1wZ?=
 =?us-ascii?Q?UffnDnQ6cf7yTE0vSxRvLNtP+BWoLjtGY5d5X7rnENhTUw91M93P4ghs9CQr?=
 =?us-ascii?Q?xI6Se91oB33MG7eAeCCr42an4FjZfz0b3R7NXaJz04z5TyQP9lp+x8AdtLZV?=
 =?us-ascii?Q?04PUQV9SorQ3IBioAzlPZKw+Ae1EuezCbmV+cGAVAAMK2Ega05Esinpp/f/P?=
 =?us-ascii?Q?5Se8Dd+weTn98Ts/UNbBGNQBBt5vTs9rTSccAzQNCe6c/nuAUTMhinyyWLyX?=
 =?us-ascii?Q?ETUjtwJ53eww2Ry+Io4Mcnr7uL6GWVHb/JOXbbTadDH6ARq0Tzf1Ks1tC36j?=
 =?us-ascii?Q?MGAHP1lafL+PBNGCRCCIpjput+Rao9vD9ZKSu5RCd3eAu5OjSNUP4fXu+8uz?=
 =?us-ascii?Q?KMze2jw4VdH+JRn+dn4XeI2owDcUjsYX7KgU0ONAZfFURJKgAkldSsr4GgbO?=
 =?us-ascii?Q?iICbsQ/+Nm6jaNU1hl1rZXd4PsNgkYhTt6JHupzjNn4B0NWDZVGPga3EwM5g?=
 =?us-ascii?Q?BfpCnsYtYWOvbzTZJs1Rv5RAcpbszU6qcB0Tm/Q62ehFa6L0u0maSuO8BrN8?=
 =?us-ascii?Q?ZSOqEFGu98mCC8s/2Px+i8ugQEJ7AvJLRe8jb0K9poFA161aWJLz0D4mQQAL?=
 =?us-ascii?Q?JT4EAmHqWpUdl0eo3BoALEJgwBwIkq2jbOJBxkUDb5iHYnRAGi2JUG/hNZt7?=
 =?us-ascii?Q?RhSfzokZXMbW1AWgtKmUcVfyGyTpThFUXHP+AhgbW7bLsx/ZREPreRKkfjyu?=
 =?us-ascii?Q?f6t1HzTdB91wLb4y6G1CgDSS0TMxaR7UBeCeJ106VCopd+Td862cg85Xnvd7?=
 =?us-ascii?Q?SMzLZvVSe9ImAyhlwE8UHZk94oGG8GhYQOtLkoiYxIKQnzluJ/n27sXTZbSW?=
 =?us-ascii?Q?ZhaULsbSFxtBcrv+CQikk8w5FPbg8wuE/n02lJye2/liwgkEaJqrLDfRrsQj?=
 =?us-ascii?Q?ktNOQrG197y/nd6c74Gxl+G9fJHrRoq18QbVPXrJ3QH7MS9uvOZ3xGrK2sZj?=
 =?us-ascii?Q?2mtCfkUBq+kbk9D59FgyhXx9rAiof54y86Qwaocy09tr0JxNjAtIqqkneRxi?=
 =?us-ascii?Q?dQDfvcXCm4jbj+DmD05c3HpIPZ3XiWkLq/dIgsntScoME3emfHd0ZVQP+whb?=
 =?us-ascii?Q?SBYI3U50HLbXkj/5+76weJFqXyQDA5djgn1LuPSywWnhsr38V4QtloaOPoo2?=
 =?us-ascii?Q?O27aTcsWRrUkQ7xRq97SFJjkwr17FosZrUTJI8T+zGKlGZtMHu4khP17oXV9?=
 =?us-ascii?Q?yejOBbSj+zbL68z28FuvugGEv6JBPOgy1kw/+J/RSIevtVxiPusDMhzVVro3?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5c95a7-0fcc-492b-9df8-08dd5fa400a9
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 07:20:14.8322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0djX3dcu8369z0bhMEiYV2cwjk2mQzistrXpdrF4n8efkmEUmKgUA05OCxY9gJgnIWQWgItUTrg1TmUSgMd6u8ZAMh08/DteQ05ZjRG3+gA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1311

imx334 can support both 4 and 8 lane configurations.
Extend the driver to configure the lane mode accordingly.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx334.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 24ccfd1d0986..23bfc64969cc 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -47,6 +47,8 @@
 #define IMX334_EXPOSURE_DEFAULT	0x0648
 
 #define IMX334_REG_LANEMODE            CCI_REG8(0x3a01)
+#define IMX334_CSI_4_LANE_MODE         3
+#define IMX334_CSI_8_LANE_MODE         7
 
 /* Window cropping Settings */
 #define IMX334_REG_AREA3_ST_ADR_1      CCI_REG16_LE(0x3074)
@@ -107,7 +109,6 @@
 /* CSI2 HW configuration */
 #define IMX334_LINK_FREQ_891M	891000000
 #define IMX334_LINK_FREQ_445M	445500000
-#define IMX334_NUM_DATA_LANES	4
 
 #define IMX334_REG_MIN		0x00
 #define IMX334_REG_MAX		0xfffff
@@ -181,6 +182,7 @@ struct imx334_mode {
  * @exp_ctrl: Pointer to exposure control
  * @again_ctrl: Pointer to analog gain control
  * @vblank: Vertical blanking in lines
+ * @lane_mode: Mode for number of connected data lanes
  * @cur_mode: Pointer to current selected sensor mode
  * @mutex: Mutex for serializing sensor controls
  * @link_freq_bitmap: Menu bitmap for link_freq_ctrl
@@ -204,6 +206,7 @@ struct imx334 {
 		struct v4l2_ctrl *again_ctrl;
 	};
 	u32 vblank;
+	u32 lane_mode;
 	const struct imx334_mode *cur_mode;
 	struct mutex mutex;
 	unsigned long link_freq_bitmap;
@@ -240,7 +243,6 @@ static const struct cci_reg_sequence common_mode_regs[] = {
 	{ IMX334_REG_HADD_VADD, 0x00},
 	{ IMX334_REG_VALID_EXPAND, 0x03},
 	{ IMX334_REG_TCYCLE, 0x00},
-	{ IMX334_REG_LANEMODE, 0x03},
 	{ IMX334_REG_TCLKPOST, 0x007f},
 	{ IMX334_REG_TCLKPREPARE, 0x0037},
 	{ IMX334_REG_TCLKTRAIL, 0x0037},
@@ -876,6 +878,13 @@ static int imx334_start_streaming(struct imx334 *imx334)
 		return ret;
 	}
 
+	ret = cci_write(imx334->cci, IMX334_REG_LANEMODE,
+			imx334->lane_mode, NULL);
+	if (ret) {
+		dev_err(imx334->dev, "failed to configure lanes\n");
+		return ret;
+	}
+
 	ret = imx334_set_framefmt(imx334);
 	if (ret) {
 		dev_err(imx334->dev, "%s failed to set frame format: %d\n",
@@ -1022,7 +1031,14 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 	if (ret)
 		return ret;
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX334_NUM_DATA_LANES) {
+	switch (bus_cfg.bus.mipi_csi2.num_data_lanes) {
+	case 4:
+		imx334->lane_mode = IMX334_CSI_4_LANE_MODE;
+		break;
+	case 8:
+		imx334->lane_mode = IMX334_CSI_8_LANE_MODE;
+		break;
+	default:
 		dev_err(imx334->dev,
 			"number of CSI2 data lanes %d is not supported\n",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
-- 
2.34.1


