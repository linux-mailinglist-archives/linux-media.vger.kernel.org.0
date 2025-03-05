Return-Path: <linux-media+bounces-27583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B9FA4FB9A
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD5C416A3D6
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DD220A5C2;
	Wed,  5 Mar 2025 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="XS3doUbP"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B055A2063F3;
	Wed,  5 Mar 2025 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169777; cv=fail; b=smhZ7m6SMBlMtANas67w6z+6DXKv5aGcjk9p0LW/1pJVr3f7Ss76aIC0QzQgWQmnH7yMWD6BiWhLfBQdl4lKH62PNRDt64x2OkrGNfy/DP0Os5FIULH/MdppRlB5scdZAjPFg9OErdPOA1cUm2y5YFf318ASlVtueJ30mRIgU0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169777; c=relaxed/simple;
	bh=jOBcKAk3x263mpJ//xEMBWXdHLZrTW6yK7mi9/oDXCs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QOMzj+dCv6HPIp3z3Yow9s2gmf/vM8SfldN7OeW6QS4T05nW1wOs7cLoduA+P66dbgHrrw7U/fc+EFyEezajVZXZ4/VWlJE9LB9Mi/kMPQIC+0h+TYA5tdO3cvTdql04gM61P4HO1EKY0G9SpR2Rql8wjrLUigX9glV0u7+QE/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=XS3doUbP; arc=fail smtp.client-ip=40.107.20.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKTTF71gEEfU+wqtFkxd0UUKtaMhBpfMrRjJSmJvh2ENt4Iu9+XVfvirvtL8FMcu7khtJGxiuAJJB1NfIjGwisRH2Rsep4dhkC9bdC4S++Afig9/gHCRD3SVfpGf93/Wo2AMFJ0DouCRQ9cxzjd/IUJeFWnJhZeTcxYa2xxoZr+i7s80Cg5EHRQDFMW5MXW6X1UCXfYAJjtrTkgK44K0lGAHEDMgnSpjNcnkQfw/sBzEu/gy7gMd8fWiJgfCqS8MF0BxktBC4/ROXvlC6YW7afLcLel7aUcZQmXl3SW6vLZNspAvBHwdj0P2jXUcTIWDtM381ffnVC3SOsYa3h6ltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzzqFhs2PfkzeYDbuAYqNH9sSrH3SAUaB4azNc61v7o=;
 b=XjX/x9kmYHgWZ6oWPhq6/dt+6K2RJd0YOOBEEXaGvL0N4tEVdYmyIwLSbOHZ11q0tnsD3BcXDMQMmo/CfCJJrUe8m2CwBkLfbHiEl2waMu2SEf1zv2lnhNip5v8IarMjClBBuUjPx6mVQDBGoj1zg95Pt1EeCspYLaT6KijDvUugkZxpnaXgHNBsMR64JwCroDhulqGsH5rZTHDHlyPi3JcRNC9fFWp4w1HEc4bTi3YDxzg0mTS4KXp30baS6y5NQoai5R5aevBYpA+JgSQMRCXYzOFBdKP64v5Lg2Dle0vbUIoaVHKgPoGJHVmgUQZ4+r5/QAdRqsJtzV82DzLqJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzzqFhs2PfkzeYDbuAYqNH9sSrH3SAUaB4azNc61v7o=;
 b=XS3doUbP5dvBRiE9gr78Cy+qIuUCEyBAb21p88pb45L7MSnNoi0Aic3koWKIAHNa0x106K/H0j7B01vI4FV4fGGxKZOe9nAbPzoJuWMW/PZhRJMaKbeV1OxmpChXCO42rpy1rRtDoL9nfAImdBx0tVbi4TLBVEH8w4/hD8gLC3zx4MkHtnfSbhVl/V28LdBl4iD0d9Q9Lvs2CVpLtoTzOkzQ+5t1fR4rxf+LgYWCclhGDwVPPA7Zi+ARh3Uj0lgeoPBWbNRaf08Mtj+On5kln4BaQs18SDtNrAYBRp/yHeDCkJpfKqm25mHhcciRCDIDpVrOgyf/aSMfUnpM22gs2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AS8PR03MB8715.eurprd03.prod.outlook.com (2603:10a6:20b:560::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Wed, 5 Mar
 2025 10:16:12 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:16:12 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v3 6/6] media: mt9m114: Set pad-slew-rate
Date: Wed,  5 Mar 2025 11:14:53 +0100
Message-Id: <20250305101453.708270-7-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305101453.708270-1-mathis.foerst@mt.com>
References: <20250305101453.708270-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0066.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::17) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AS8PR03MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d83a03-88d2-420a-3277-08dd5bcec13e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6JpAm6vhWexSlCMnP6wCUJ1+XZuICz+uxIVIUXOyKTEpMoVOrcgRLnrxExyq?=
 =?us-ascii?Q?37Ecb9PkrB5Rdc8rdFO1sgvmUBYzMBIn6PZdj61vjtrSq2VPw1ISmM62FTVK?=
 =?us-ascii?Q?SNhs3IhI13cvmgstXn3Twp6ugbMru/EKKTGc0saX9xmMMccXkQF+P7hF2JML?=
 =?us-ascii?Q?QFKRB3peDSB572eFlA+LZkvGfXJ+fexq88BNgoU1o/+HQmTcqlJx773Pjp3u?=
 =?us-ascii?Q?5PfB7FQvAiJid3iC+2N1Jr2No4jt0AwVc+kZtDC4x2UfiaiKtfIPFDG2QEgf?=
 =?us-ascii?Q?EXZZ9EC14DSBrP1Hn13B5dmSVbFFY5dt8FkEUF9oOAYh5UjSidDsN2MlUmlg?=
 =?us-ascii?Q?9n1ytafI1PvrfEYT2HCaQ9aTX8GmVBOWzANJQHC5MBh1ydCd9OMmupOSLBnO?=
 =?us-ascii?Q?cWPGJ5Yas93yVQpFoVVYMG4Iap8kTJopXRPLXWGTOmGgQn2EWMji9U6vWH5X?=
 =?us-ascii?Q?cyOIj3JwmhGKbnLjy0rpmwMnbHr/SMOJu8Y5XoX4bU0Wss/WA/7hB00KrVzF?=
 =?us-ascii?Q?Igg0JjmF0exowAJQBN/QUJkA8a+OsdnlMY0CDlbdKVIqnSWA/bLecjchp9Fw?=
 =?us-ascii?Q?BTDxHWHAawutN8SkFMkX5pszEONJvYfSdaHF8adXCN+AtKgthWZ9IbSPLYZn?=
 =?us-ascii?Q?EWm8UolKXTLSPcFeEH/So+l95UDHa2+iN9JAnOqcD3tSsfLkRVA9MAvJr89G?=
 =?us-ascii?Q?xRYHQUvN1Vip8cNSU0oz6aP4+xUHEXszrHUkhYOcNR5KymLfjHbamL+ipJ+O?=
 =?us-ascii?Q?7D7YrLoq5mcC6rU6wyuUEDJWYcrlAfWtXZDKH9dbpPgPUKIEuRxTxq7rZUGp?=
 =?us-ascii?Q?K1GPFEKFBptrV74s4wUmEu/LlA/DAan5OQjN8Kk6cTpT9MX1Q83hhT2XL9H0?=
 =?us-ascii?Q?kJGiHJMqPWpDjmzN5XBicuC8rvQriV/B7XJUyasN96EDc+uNX7ThqJMhw+k3?=
 =?us-ascii?Q?/URGXJejScZPuazmkiO824UDv6wjuVNMpi7wqulhiZDPySKHsTbe9KK4Gb23?=
 =?us-ascii?Q?8j2IvD5qkE0V7wusLdd8NLZe1V7N+yYJ9LOoXx6hM2mni7F6iW5woSfRx6Sf?=
 =?us-ascii?Q?51baTf+NqETGHtoK7j1IVtlauQD6H/h7sjk1Iq0/LGRuYgkQRk3SA+tT+3aV?=
 =?us-ascii?Q?hfI22pfk0TRRTvWf4ODsjPl5svLmgpvr2MZ1T79EdfRBWZFbhCcdufDxWiwJ?=
 =?us-ascii?Q?VsM6DWkdYnWrdc4SoAgpO95WCoMuKGI/kHuHtPqQm6B8w97Sow1skosLqnhr?=
 =?us-ascii?Q?Y+g10mfHJ9uOmFZELVEIiXvlERjEe0r3AuX7KCr3a36jGQWmCCtpL14unahx?=
 =?us-ascii?Q?NDJd30o5kmgOtI8t66SwBhGJNX5lkAFeCe+ZmxmbiWQMNxa/5QdSb/I3SEvK?=
 =?us-ascii?Q?8tfFtVxOe5y0Mns9ZBrbNx6zCKuEyXzPbkcStEO2mk4Kmi0zo920oqsq510Y?=
 =?us-ascii?Q?3PazBeUQtFgUcr6pCo+81eZgB1rqwVJq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rDEK76z0e3akHBjMnH83XkCs8u33hjja1BsqvLyxbws7j1zfKYfl3F5QQ1p7?=
 =?us-ascii?Q?A6mF5TWCiYGSvcVGkHj2Z6ZUbsPknZsKsiEMS5V9Fi0VuiGLx1nhiF3s5r9B?=
 =?us-ascii?Q?1xu1khVMpiNJj21z6XZY6sVI0Rw3bCL+ejPOu5RWX3yz/U+DtwMwliGNzUh2?=
 =?us-ascii?Q?LL89OoWUYnB6MVDDPAUifgaf02dQgSsSoXugfV4f4OV+MNnxPkT4PdjMQmMS?=
 =?us-ascii?Q?f/fi4ynJ91PSJ1kkFnJvhYBqLHp20tivF9wradxeKXtw8sGM93VxakLCh48k?=
 =?us-ascii?Q?/y5Jsk4u+oLzHgnbcuuIpIVZo/5kiqT6g/nyeMLjvr9S+8KNq6NDVpkLb5L3?=
 =?us-ascii?Q?z5MFW0ojJe7bQCwWQ+h0pobdBYz2xzJIKcHSqkbTL6rUVs9aKlU3OhLDvgsH?=
 =?us-ascii?Q?AGSEy4QqFf2BdtCb0CSrWdZh9VawYjuGxANLJ8tnUVXMBavaioQ2wS5cuMpD?=
 =?us-ascii?Q?vyc+sVtwk0zi5ApoiEMNRV6MmxEZdScBHbM2xVCOsEhHH1wqfUp6n/hOCXv0?=
 =?us-ascii?Q?svJdMGY5Wnj3cp1HsTvAkJG1cZedktzRPA2dZIpsHXUPSF6qNPsPideeU5bT?=
 =?us-ascii?Q?iQ2+czlGYnz13IEXEb8E1Xztgskj0c2fTPj69wm664ADXFY93+Nb8GVpt6e/?=
 =?us-ascii?Q?a8rrBy5RgGIJkUkMeRDJQHf1cK/pWSN98QPA3QuBnhOAbw7ZBLvoc0hGc71m?=
 =?us-ascii?Q?dSir5O55SI/IiRuXeGe8l1deQCkHB3njeMgAu2h8rpBpH655rlbDopzMXwRF?=
 =?us-ascii?Q?pf2WS4J3/l0pb8QFKYh2TLS2tmDIm8DQodnrF/MpBTlYYbBS+y2LvfEPgNJv?=
 =?us-ascii?Q?aTUogp7yZAnHaiuisd0BICP3kyYcHODpLqhRznUfI1vz7W34pKFUKxCTJ4l+?=
 =?us-ascii?Q?vxZQkKejIeFbBFIZIxbD2nfFdwh5omUBWQUAmNneFBD6/ltYtoCYBck3d/w2?=
 =?us-ascii?Q?fRIOGmjZV18kNaGZSzgJlxfLfEodXc+ecuRaEbcAmp5VAGFb4p3z6xQDO9OQ?=
 =?us-ascii?Q?CNN3ASvJ26hGhEzdNBWxE9inHYgnHmcct8ruMa11wRgfhTUg1ocF0ClJ6PxH?=
 =?us-ascii?Q?SwsyBISt7NrTu5ORlP3+YPOUOFs+teRhQPdhltTXfmLpHcOR6QfPd493D81m?=
 =?us-ascii?Q?xl4q17s7qRHDf3rl+tpf7LAwtvvljG46p3+uaRiPJpZlTmWLMYVPmvgxs99x?=
 =?us-ascii?Q?7JqpAcHXdMNX1x5r4PKB2JSPQcv4LYG7xe9H9q3jsjAs+WcxXVrkE4nVfgNL?=
 =?us-ascii?Q?T0uR48HN5WitLgIEWMrDq1Lbo/PLiCcEXIrbFP0Y3Loouywd85F0GKnuVPHn?=
 =?us-ascii?Q?3RcgwWgk/DpCohPbt4l2uanaVPrVe8uhO/XLR0ANHlhdocDZwwZcgl+auupg?=
 =?us-ascii?Q?xH1Vu1COIL9X7h26YB3V13FG75nDOY+9/JAHw2lEnIXVX+JolVMMBATvdVGU?=
 =?us-ascii?Q?7UfeLT8ncM4A7I0/O6O9R/Q5v4qg97upRhppD0eIOWtFdFTc1+BJK7OiYlah?=
 =?us-ascii?Q?z0dBp0djEfQ2MPSNnoFHUqE1NSZNJUGnvLRpsCnLFMkWfTSpHuyupQFbyFw2?=
 =?us-ascii?Q?gofvzv8BeQ1J1VmUWgq7u3csQbd7uLZZjtMa/kc0?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d83a03-88d2-420a-3277-08dd5bcec13e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:16:12.1429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7OCpstyKSfCm958o9GKE4NbnewU8X9DonkeNLY1jHuKRSzTVZILY96G+uNGsQObzCicX55S4RB6gfNHsgaFuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8715

The MT9M114 supports the different slew rates (0 to 7) on the output pads.
At the moment, this is hardcoded to 7 (the fastest rate).
The user might want to change this values due to EMC requirements.

Read the 'onnn,slew-rate' from the DT and configure the pad slew rates of
the output pads accordingly in mt9m114_initialize().
Remove the hardcoded slew rate setting from the mt9m114_init table.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 79c97ab19be9..df694a3e14d5 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -42,6 +42,9 @@
 #define MT9M114_RESET_AND_MISC_CONTROL			CCI_REG16(0x001a)
 #define MT9M114_RESET_SOC					BIT(0)
 #define MT9M114_PAD_SLEW				CCI_REG16(0x001e)
+#define MT9M114_PAD_SLEW_MIN					0x00
+#define MT9M114_PAD_SLEW_MAX					0x07
+#define MT9M114_PAD_SLEW_DEFAULT				0x07
 #define MT9M114_PAD_CONTROL				CCI_REG16(0x0032)
 
 /* XDMA registers */
@@ -388,6 +391,7 @@ struct mt9m114 {
 
 	unsigned int pixrate;
 	bool streaming;
+	u32 pad_slew_rate;
 
 	/* Pixel Array */
 	struct {
@@ -645,9 +649,6 @@ static const struct cci_reg_sequence mt9m114_init[] = {
 	{ MT9M114_CAM_SENSOR_CFG_FINE_INTEG_TIME_MAX,	1459 },
 	{ MT9M114_CAM_SENSOR_CFG_FINE_CORRECTION,	96 },
 	{ MT9M114_CAM_SENSOR_CFG_REG_0_DATA,		32 },
-
-	/* Miscellaneous settings */
-	{ MT9M114_PAD_SLEW,				0x0777 },
 };
 
 /* -----------------------------------------------------------------------------
@@ -778,6 +779,13 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	if (ret < 0)
 		return ret;
 
+	value = (sensor->pad_slew_rate & 0xF)
+	      | (sensor->pad_slew_rate & 0xF) << 4
+	      |	(sensor->pad_slew_rate & 0xF) << 8;
+	cci_write(sensor->regmap, MT9M114_PAD_SLEW, value, &ret);
+	if (ret < 0)
+		return ret;
+
 	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
 	if (ret < 0)
 		return ret;
@@ -2357,6 +2365,8 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
 	struct fwnode_handle *ep;
+	struct device_node *dev_node = sensor->client->dev.of_node;
+	u32 slew_rate;
 	int ret;
 
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
@@ -2385,6 +2395,11 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 		goto error;
 	}
 
+	ret = of_property_read_u32(dev_node, "onnn,slew-rate", &slew_rate);
+	if (ret || slew_rate < MT9M114_PAD_SLEW_MIN || slew_rate > MT9M114_PAD_SLEW_MAX)
+		slew_rate = MT9M114_PAD_SLEW_DEFAULT;
+	sensor->pad_slew_rate = slew_rate;
+
 	return 0;
 
 error:
-- 
2.34.1


