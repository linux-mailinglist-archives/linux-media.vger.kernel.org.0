Return-Path: <linux-media+bounces-27085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8224FA46551
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F46A7A359C
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C24321CC54;
	Wed, 26 Feb 2025 15:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="xKYBUn4U"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A0E224B15;
	Wed, 26 Feb 2025 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584413; cv=fail; b=pnMPf/xUk4gP3nFbLDJ474La7AH2jmDXBzm50pFP/wvQbKE4ufoJPWG7cEOJqcw01qtH8TO8Cnzf5K9+4NjL+k59IMaTiIa9NNj2hKxU5K+xZ0atUuHsa93R7bLYlg81YE2Tlhvernm8iUPmyWUUmfyW79IDxSZNnGTnKz/uTSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584413; c=relaxed/simple;
	bh=176Fg9aeaKYOFYzKxNM0nfFiKzrP7YvaRDSCNoLhED0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PkFCO6yiY+078r52NQznWojMMm1pIIxXw/5nPdblSP3/1/mxWqL5p7Lg6dyyn+BXjCwTdPKPnCKeJpdK8S04z7/HT7/dG1S5eC8i1IxPbseKzNUsFDMV9wsyyzuZqymeJ9eOoiIrrYC1yHj+lpBTcBzZOjB2YydOlluR7HEkyoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=xKYBUn4U; arc=fail smtp.client-ip=40.107.21.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lI3PZxNt/0KwAyGOl5EUpeWmd4RdTPiDJ2+SVdtbRHhCmxChhJ26Mk2XEn4moKf0y/6jlLri88OqdoxSZJoPP/RMQ02i12gooDpjmgnUmDhK1V1YQHuQJAJWnu//DELO36lds6JwMvezH9IeQlEvUTkxNHGr7SwbcDut/MLsN7o00fhmJGGkpRohq3Oiw8fWpXCGTeY5bek0gyXgcEukoQIr5P0gkYwtin4EGRE//ixIwVCxxf95jeXGLZAtEEnLsub19iQnM3QnX1eOh/LR6uxRKFz1O9b3WTIXn4bwj2Lx90pV8wNFrNLf1rsx32vrlDchsqfklDWY0om9wB3zBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5retvrIfN902pYWgyW6LA5ck2sdmGzIu6Foojuk58c=;
 b=uD9ikhSCnogmWboXeBPiEK/t8JKKiktJt09b2ERc84f+YdSedtY/QoWfr4qj5JP1gTT0Vn39RFqO83yjCI3klp5cb+7klN2h+r8E4CTncADAZ45vF6lk3inTLLxQBGQsz+GHQNsLzO36dRLwR4bJ4jD9/3UpwsgoSLIgu+5KDlVLENhuPh+gGyzLFlQXGQ+Xldxd+Yz+o4RTAwHkoSm0/AuL+RDbD1ACT+Cu1cwbu9BH2P+WZFIINyDg2ZDv4J3CnXA1ibdl1i51J2YL0JaWh7pHNRoP3m4UWhaPXGv9p7c2+7QL/gauXPgpe63Omj0e2U9Rp8W17hSLBYoG1I4Klw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5retvrIfN902pYWgyW6LA5ck2sdmGzIu6Foojuk58c=;
 b=xKYBUn4U3XPL8R6rjyb9WDXqHQYRe1IzAfw6dQc0W32tF7OucEFnYSokX/EE/PrLw/vWzp+/51WMityHkJ3+ZeDVyXlCkd5vK1Czz0NF3HuugW06L2C6I16LyP2CYdIexcV2KIPf9vpZL8dY0nkwkNGBzBSv1Tal52FXBQxaj8fmj+hIX315y9kotB9eJqSrAGJ4wtOnbtbKwOD5jmjcGEwDX8z0IW8vpCVpLcids//uPd4NSuaEpUBM4QNa2s286cjfKsxBKUBQuQHn2dxk3aFm2aHPoYOb6xBHduuzxqOKUWxVHKOedeRbM6OCyMD2WKpCxpYi83Vzs5Grw6U4lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by GV2PR03MB8559.eurprd03.prod.outlook.com (2603:10a6:150:af::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 15:40:03 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 15:40:03 +0000
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
	manuel.traut@mt.com
Subject: [PATCH v1 6/8] MT9M114: Allow set_selection while streaming
Date: Wed, 26 Feb 2025 16:39:27 +0100
Message-Id: <20250226153929.274562-7-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226153929.274562-1-mathis.foerst@mt.com>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0043.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::17) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|GV2PR03MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: b3663bbe-24c9-4220-525f-08dd567bd606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Oan1JIdP6DYxcF3YW/R+NYdQyi7/xXZYwMAZDGFe4M9N+gNLj0vUPKZ67EeA?=
 =?us-ascii?Q?HrUuIsJ87/YsD+uwB9FspL0Nh72eGszHay2bmV60nbIgw0aPs7LvdVceYNsg?=
 =?us-ascii?Q?vbJMakm1x4C2OXg+5QjbiJz1QmQv4m8fTsYkd95haKiUS5OxBzsvVwbYoxlw?=
 =?us-ascii?Q?RflbRNvB3QsZ2VgRd5inKHb/AfFP/iPbYxApC/ENYdWcDrQ6UR8FwBRAaU92?=
 =?us-ascii?Q?uqA2SEafzuudnooAI27AVnjd0E6glueQjsH3NGY+6GCDw+HY2NeTxpO/VNvl?=
 =?us-ascii?Q?AtidTxk8E6yJLJLmexqDMnUGXHr2MXFSaeQQr8LslFrOyaIv2lGUIxtT3QzZ?=
 =?us-ascii?Q?XgLrO0EpSQweOAO0F0A427T6iKuf/zMmCcKFkBToyMTa00tygVrqiobMImEX?=
 =?us-ascii?Q?sPvyVcagP23tUtbfFiLTXioT8DvKn+jB0/Zedhc7eaDkSHuxMiMhCPuQN5so?=
 =?us-ascii?Q?C7ny/Xv2IWqW7/R8OxEE5VIO7xUxrptWcW11W0h17ICDVZahtqITb5p6qTWF?=
 =?us-ascii?Q?RNBSa8HnMz3pvgOLQ0u5xQPbj12Er6trOMIeuV1+SxrXVIOn3eU1z8vixUZ9?=
 =?us-ascii?Q?Nx8YcUjmJj1aNObVRgdekAKr3Pazxxq1OAfIvaKUtwG0WbV6Ly+P8aAsHX59?=
 =?us-ascii?Q?ylA/T0FbhMlx7CSJJk5lzL7wN7kQymE1LVmFoEc2xznLzZYQwbtSTbhvoX36?=
 =?us-ascii?Q?XjsJbJzSMLwHEXE0rum+g78WVTx2/J7xW5b+asZ4ggoz86+7KMJghj3yEbRt?=
 =?us-ascii?Q?gMRYY6CezKBtbC5wIBbXxPn7Oay8647drg6/SsVA0RxlJop/+Cd9iWT0Etv3?=
 =?us-ascii?Q?R8kOrodTv6fFpPyRBeGm0gWgl6fNaDMobcwYVQ/3Zklu2eKVPI9OOQ/o/naN?=
 =?us-ascii?Q?N/BUw6HN9VuNujqK/Znzh2gFP+CRVMVPmBp22Vbnyvk/oO3Z56P0zWqPwJ5b?=
 =?us-ascii?Q?2Dky6EA1HSFBIjn6w6eoI9ybD6o6h1ZsS4TwnqilRFPl8O+aR4etaeBkU50f?=
 =?us-ascii?Q?dLZrEtFfPACcjQJd0PnYz6GfdxBmXw0e4uW6KvX+JlDiUt3pPUg3pi5FDBNJ?=
 =?us-ascii?Q?dT6f7DQtZJmI63cNdVEQyq9Mj+CFIxHc0FH25Prxt9WIrkoxnqlnnV+CBjPq?=
 =?us-ascii?Q?CycGtfTieUAML68Q1eLYoz0SZasvdHLQwxHjksJ1GeoPTRl4M0s7kwRKshyW?=
 =?us-ascii?Q?YzShNWmytSugVLg/E4Yph9bLu+N5GXsHhTeAG5kBSWEJCtb/4zg6aH6iEhab?=
 =?us-ascii?Q?sTXsW1BMw6MN2YmkdveJlmQz7967LS31w7x6hiEbfQpTRvLr1SHmJjssOjms?=
 =?us-ascii?Q?nVKyYHbGGnj+GZ6q3OxnGbFaAU6UuhYzFWhNTSz7hoBaI8MEqbbQTlFF4w+b?=
 =?us-ascii?Q?5s3aac5/EZXuI7tirkvdg3E9AHqWaAQ/wbpAab3RjE0ahCydVzgx2FyVj3k6?=
 =?us-ascii?Q?usTR8ktzbpGdVpeLcdjAkz1v7gDiZ//W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0bF8/RrlHSQC25hTeJkBY4erAMs5CRIVqSD6pFXrnELfSciw6mPK8BMMRGgZ?=
 =?us-ascii?Q?KIacWmvcSgYiYGh54lFg66we1wbmUDHk6HaYx5qXOuq4HcUm69A1ySwQlM7Y?=
 =?us-ascii?Q?/0nDfUwNuzMGDLYTtcwOkjvZ8ms9fqrvGO8l9ECEtLqCCKKtHg6A/9axep/k?=
 =?us-ascii?Q?m5zPLTKSPkm+EvF+tKQN3E3GtVl4mWk3qIszZLciMOL07fx4XiBqAd6qfNHp?=
 =?us-ascii?Q?IblSPaXi0nyVzhVreVesXPeCFEC1NK6ZisZDIe9JJSJPUxolJsnrhey4QMMK?=
 =?us-ascii?Q?YM9IIWRyVuMUj48sBvNprxVnNTQWIcZOoGmnF+oGpV9IyiPGfaGHgmfY30QJ?=
 =?us-ascii?Q?7bqewxD1Aj1Ga0GhWGeOeLgjuPr6Uhq1U9SipNDSGVzJzi30NxP0mwdP60j4?=
 =?us-ascii?Q?3hB9bBvbP4+tIbZIuOJ4HF0NGCWtHBxUYNR5OEPGGVFqTkme3z/vp0Eb80ZR?=
 =?us-ascii?Q?dWm5hwWMN1U42BqOeMsRV9BY+no3rnUF5vGRprB2fiMPadovxKa1zWIfGfIw?=
 =?us-ascii?Q?z/2A7maji9CobcDprD1tEzn+xtjnt3nRLiPgY5Bts8nAqcNPWn2AP9+wl295?=
 =?us-ascii?Q?Eke9vta+HXwmY1550+w8vYEPDkxJTalhxLe5fIf7IyIOjb+064PKPJ2xEDVE?=
 =?us-ascii?Q?XcBWkizVfNtUeHofvvR7sMaE5UuyHNQORb5sIfrrndr3dYStNo3lOXMIa1bF?=
 =?us-ascii?Q?RMb7wmbdUigewh5JE97GCMoElihcF0ITZrdF0EFo6z/90Pv1EMS2QITIS2+p?=
 =?us-ascii?Q?zNHiv9cMj3gEd+eRdkXGfXXUg/3zXDcRorfnQUVwWSj6QuVAGPWTtyULljyq?=
 =?us-ascii?Q?PAGzQEXYtRyUzmABDoFHIoFSteiw35RCD6HcTbQh/2+wzOa4csIBtO1tXbmu?=
 =?us-ascii?Q?cYNZFKPaA87uJtOiiFexVqVwac5M6xRD9t364Xi3u0beZ2Pj7pr3c0QVX1Kq?=
 =?us-ascii?Q?GHIRkP/VBkDaHMhGk49NNpTM6WW2RB8Uplng/9jnahv3FRNYm8i98/wnDuOx?=
 =?us-ascii?Q?inSeX3gDIdiTJgHBVcTgGfUUB2B15gu7iTZcnOk9lvunQHQleyeVq6gQMUMr?=
 =?us-ascii?Q?p747F94RPoFRyaxTJqGCCVjusRSAQb/OA3MUx6d2LtCzb+4/JIQzJivbTrgu?=
 =?us-ascii?Q?STU8n7AHMjHYshIFnOytUnjhHBHxOZ+BwSgbAuTpJJr9umZG9JdG/BeSzn08?=
 =?us-ascii?Q?PKC6o2SS+SLYKKhsHcInx14YhyHSk2GOEZnoQ7h0kU57zJeQ8ijA0//AbY4N?=
 =?us-ascii?Q?4GCz+S18uO5PyVEmeIk/3v+KLKzqe8979W7KygQYXS1wkh1je1xz/G2gHZ17?=
 =?us-ascii?Q?/xaot+Z/IDSrvLSRPATYC4gedNx8zGv1/0D9zYcvD4a2MT8w+xXjkZp8tKkd?=
 =?us-ascii?Q?RALx9HKBmO6+8dkwcuIk7fJdQWntNNtzqNFz71OnOVPgvoqc16L+MmV2uUjx?=
 =?us-ascii?Q?eMk5v9K+l1B72Kx7FTh3mRZUGoCF4esS/9x+QaeoqH/KFCNhkFHJl2kmgKra?=
 =?us-ascii?Q?ugZ0rsRR+ZpVEbpuTlY/bKFrNu/rPeR2Bs7woP5uigMIznwQdD+o3Rv3uozP?=
 =?us-ascii?Q?Y/DmLtq3QIPFWGaRzRTX1000R4qNeNfEVNYJO4sx1KhsMOOr1PMhH9fQaQ1X?=
 =?us-ascii?Q?tw=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3663bbe-24c9-4220-525f-08dd567bd606
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:40:02.9778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzV4VQBOW4/OC0J9F1Aw+ISgJ8Vyh+BW+1XP32AV5zQErvAJ4fo74qWkld/FlvkE1EXY1V88eQ2Ydoe9M8umLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8559

The current implementation does not apply changes to the crop-
configuration of the sensor immediately if the sensor is in
streaming state. The user has to stop and restart the stream for
the changes to be applied.
The same holds for changes to the V4L2 controls HFLIP & VFLIP.
This can be undesirable e.g. in a calibration usecase where the user
wants to see the impact of his changes in a live video stream.

Call mt9m114_configure_pa() in mt9m114_pa_set_selection() if the sensor is
in streaming state and issue a CONFIG_CHANGE to apply the changes
immediately.
Issue a CONFIG_CHANGE when the V4L2 controls HFLIP or VFLIP are set if the
sensor is in streaming state to apply the change immediately.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index a1976da74c08..5c0a8a940fd2 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1098,6 +1098,13 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_update_bits(sensor->regmap,
 				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 				      mask, ctrl->val ? mask : 0, NULL);
+		if (ret)
+			return ret;
+		if (sensor->streaming) {
+			// Changing the flip config while streaming requires a CONFIG_CHANGE
+			ret = mt9m114_set_state(sensor,
+				MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
+		}
 		break;
 
 	case V4L2_CID_VFLIP:
@@ -1105,6 +1112,13 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_update_bits(sensor->regmap,
 				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 				      mask, ctrl->val ? mask : 0, NULL);
+		if (ret)
+			return ret;
+		if (sensor->streaming) {
+			// Changing the flip config while streaming requires a CONFIG_CHANGE
+			ret = mt9m114_set_state(sensor,
+				MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
+		}
 		break;
 
 	default:
@@ -1286,6 +1300,7 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 	struct mt9m114 *sensor = pa_to_mt9m114(sd);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
+	int ret = 0;
 
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
@@ -1316,10 +1331,21 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 	format->width = crop->width;
 	format->height = crop->height;
 
-	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		mt9m114_pa_ctrl_update_blanking(sensor, format);
+	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return ret;
 
-	return 0;
+	mt9m114_pa_ctrl_update_blanking(sensor, format);
+
+	/* Apply values immediately if streaming */
+	if (sensor->streaming) {
+		ret = mt9m114_configure_pa(sensor, state);
+		if (ret)
+			return ret;
+		// Changing the cropping config requires a CONFIG_CHANGE
+		ret = mt9m114_set_state(sensor,	MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
+	}
+
+	return ret;
 }
 
 static const struct v4l2_subdev_pad_ops mt9m114_pa_pad_ops = {
-- 
2.34.1


