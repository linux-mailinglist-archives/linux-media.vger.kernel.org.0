Return-Path: <linux-media+bounces-27083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB76A46555
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BF0D189FA84
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB75224AEF;
	Wed, 26 Feb 2025 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="hygyxhFA"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01303209;
	Wed, 26 Feb 2025 15:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584411; cv=fail; b=fB0qecOBE6JgOrDrvwLJ5MWazU+5XQxcltAsGBQGmCwK+O5HE002vnbZqdV7PHe45+JFJlYSoKi50/qWgTp04KE/osgodkzR+XqUHN6fed/V9qQRu46n7BUtxWK/dRQq29yd/GO7CKdBy1SAXjNIvqOZ4D8Ra+lNYTLTEm5c+R8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584411; c=relaxed/simple;
	bh=+AuiWZBHdI6gQjcYQlUWYJStVL6sKuzSEVZ86ENVR1U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AOzfd43TzwbdbVZrmxYk/VB/uDdEjNXVODDW2XT0nFELZdfIOiY++Hbvz8OQSZhwnGbTYGXxwUSDyzDE5wZMRwweNqS449Oo26c1d/l+jnYK1Jq5Tw78HCJnhtMjL1I9X9KANQntAmwp7wS3MB38CV2TpyHDwz21SWBS9bK8v58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=hygyxhFA; arc=fail smtp.client-ip=40.107.21.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOLW6uPt+/VXJqmmOsw8YKSJmrtVTXctyjMXtGNmkWMdrdCuzygfyzuSu3bqS7ee9bkpdRhd1iz3QuXIDgpY1mfydMgRMvz8bpq1qsMDoQMpBG4WENnfwDviFuvQuypQjQngW5jzjq4md8FnukZPC9Dh0tWDMtjgPIcaD/O4nkPX0i5jD3+h55HPpHj6e4Ceb+ed9Jf3cUhn6VsP5vDm85UxDOw5JihM0sTMO5IwBJgyJ8E0mHCF3fjEb3f3ykEVcrOOEw3SQoMUmdXDtIKI5obg9LAC9a8LR75mdieubeJ9GBZ8cpikjoiV9zf1V4r6v0tL/PorSbQ04ttlMYmfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yc0f5rTXwBAs7/o7qyPsXP1fZ7bs10GaJgGqKOErqQA=;
 b=FgsrWbGe+CAI/lUpZUpAtMFDo744AKJx8wZXiLoITQ/5YlPCMd5L7ZX7bc9sWJbjuvTBs/RE0vv1sGQxfTubra0+Q/7f+GY2CrnWZJv+pBPVeoZD7EmJIaO02d78lPAKJduSoMTjVoC6ckuGJppo2/xvyXieKSHLpVAL2xxfquTjXObxsY6g6vLKXbDO60fxA6599vjrXpQSnffNAVD7ekMZiLaA3cixc+meDnwl1sYj0racSev7jDLiUWT2jslnwC7bXk7MisNFs3cuP3+RQIh/Vg/61PT5un94KnAUa7ATiMumDss9wrqIe/6421Os2dfi/7TdPO11amieogogYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yc0f5rTXwBAs7/o7qyPsXP1fZ7bs10GaJgGqKOErqQA=;
 b=hygyxhFAJw6uC25JL4IopYxPtseElKlf+XaDRYZXtTkkESVm79v0ym3aEkWhj8rz9Twv73ANRtgm+rjPFRN+nuj6opg2MvinUw77QUlrg5cca3pvr2BCREAZ4I0JGereXto7YBFIzaBRH57TsY3lXukgZH0+hpMFzyGltd3uY0MxqC8Usao+779FgM3XlnU7gjTKdAk2Df/arsgfjHQYFmKIBXtGOlDzKoIYUdSl0lmHkRnPG1sWQyB4Jr6QeZHtv9ny6TapmiMgfC5Kd78h/Q7YHQzrBmNFsDPnwmWJcioY7afMwyk3ah1iB+xKfNKwao73KipOURRhsRAsJpDHHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by GV2PR03MB8559.eurprd03.prod.outlook.com (2603:10a6:150:af::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 15:40:02 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 15:40:01 +0000
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
Subject: [PATCH v1 5/8] MT9M114: Factor out mt9m114_configure_pa
Date: Wed, 26 Feb 2025 16:39:26 +0100
Message-Id: <20250226153929.274562-6-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226153929.274562-1-mathis.foerst@mt.com>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0046.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::15) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|GV2PR03MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 72887143-9a39-40a4-7126-08dd567bd564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1wL5aMSfvnWDaV/2od2G6SIIZ2ks2UJ8TKR4pqk9Zm245Tk19oId5/vi1VNs?=
 =?us-ascii?Q?R0t/xD5JSW5iNlmn8yuY2ozxLo5L9QKdIZuFd0Q5c0utgR/ptQOjQa1pci39?=
 =?us-ascii?Q?AE6qQEON6qzwZ5CJ3OLj15HIK46Gyl1umE0W7ujpEuDLXfgjQOcC5m77fuVy?=
 =?us-ascii?Q?EmcG5FYDFIQ80udox8AsTMaTb2jvjBG6KWCcKBF/KuwmbnEMnZrBWfgXdTqh?=
 =?us-ascii?Q?at3z0W+VFbDwWhy/C3cJr7PCZaz9bWEfNjXl9vI1nQNDvgt+rZhEk6ngpHu6?=
 =?us-ascii?Q?Ps4/cDoCnCExFFg3Jly1x8ZKpM0En3YISwnsK9OHocqvwe7rjdOdsv96e7W+?=
 =?us-ascii?Q?q2j4sfxpcOUw8vNqaZtapm6Xg+z+yYHnGm7DWfi+ifDrhqVfM4ahc2EtsCR2?=
 =?us-ascii?Q?3qhKUiIBIjAyqqmKFJs5oj7ITM2gHW70oPd2c7rWmhyum2cm5ffOOSAQxs4A?=
 =?us-ascii?Q?XUDq9zzlU+ctb76rhf9U3GsrH+sedRE/38mDk1nYX/44LsawsVED48FrXOSA?=
 =?us-ascii?Q?xuRsyN8/QtRxcckdBUgG2LgdXBaBX92tPLSBZ6ofueECMS9iWE2feyPJBfvm?=
 =?us-ascii?Q?qT9fmhDSCaGNmcsDKDVN3RxsFBdNrgxyGISsIVdyPXEj3qPz1ZMsq0roDjbs?=
 =?us-ascii?Q?5lJnMdzeJyjwDU14xi/TpTI4Xzp94+uA30UnmwXYO+/VskFanLJysxPkzZyW?=
 =?us-ascii?Q?YGL6+yCAcFGMAw1JGFxfDpbRxCU0GVh5/rMDA9U4oAZt3zruJDpI2Ys+eZta?=
 =?us-ascii?Q?xQtkyupJNSe9/zjrwrP9sPrZJ8EhbWo6Xa+8I/WbMjEZanqLk3DD4ZAzCjtb?=
 =?us-ascii?Q?MNH50EHLUW+ZYi082nHfR1r6Fhx89SmbNMuD91cEUcDLkblppKLUXDht9kcJ?=
 =?us-ascii?Q?xwCTUfOHp6seOxoDBWyEXYXWYGKN5eViDI4nlaYQ1kdXQw7hBY1JQxnnX+gk?=
 =?us-ascii?Q?C+FzH/wWeegfTdyFET4VOa0SiACaSW6E/i9N0M8E5vZ1Z3dL4McPD9K2PKM3?=
 =?us-ascii?Q?ayuRykiwViGPJ/QYuPtj307wYjwFLBiNYQjIycCmk0wws9DtwQkVN8i62zxc?=
 =?us-ascii?Q?i+oM7Qqk7INj6LAT/6y8Ap57DQyrEp2Z4ZloqEhcIuOCdDODTlDuCU1gbse6?=
 =?us-ascii?Q?EW6vyHtXFQ4qiupVwicPi74y1XZzeXKxL5IFJ96OV/7x4LUhgMCdwKgMT4a9?=
 =?us-ascii?Q?GVGXQM56bLJfGjW+MgsE7W2ZuNhUO+swvhGuWLLZ2BulO15WWSTQ2JFl3vZ0?=
 =?us-ascii?Q?Zucfr+/tbaBKu7xf4Duyzhu4tJJw3R7SJ4o+9bZwDNyEP3QOAuiNBZLmyIVB?=
 =?us-ascii?Q?+HdKYw4foSWejRzRnt/XZ1L9eHErWpj4hBZW8qj3Iug9R62iD1BRnLCk6A+B?=
 =?us-ascii?Q?P5wz8X/Q/pY1X3dQeVMqjX1zHm1FI88+G4F2HbsFbHrZ4HcK8vnyWP1ObOtj?=
 =?us-ascii?Q?2W9J4jO1JBd9Lsvt/ublWxQSqRV+QIuZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3zZHfqTUcf7pNBkgukQSLJdP5pO+2GpmP0L/fSI7mWKPqXxTrYCgO1+QCntB?=
 =?us-ascii?Q?C4GlkEryO5Ik2wDILC26M6v8h/oNgp2GsDnJ3dkDAaKuvsctpFJhZUfDjjHh?=
 =?us-ascii?Q?C37D41eMLsmm7paRBdjOGo5HwQWM8scytBu1mW3w41zNVzjblHF2febemAzx?=
 =?us-ascii?Q?kI35CVqTTxZdWX1TIqpwEw1BL0wjyfF4DK8+sEaEcLcJmTRdsMNcaNtXQd2i?=
 =?us-ascii?Q?PLEUuccO9VIocluDS47E8svNN3mtKfwbKK9QQmTrHSj9Iv5B528g474qs1s7?=
 =?us-ascii?Q?m9GJpk2cB4+NhJ1WNflULwpJkn7Raxui3muV/6a99cBLTSkDYKfOPl7Y5GLn?=
 =?us-ascii?Q?OChXxXYcFJzrRtYBl1YEsWvZdEUSjva1XCvY3bWVyjHxRzyFdzak0km/b3qy?=
 =?us-ascii?Q?XZTqsysnK2gm633hXCozrWmGPJ45FL1s1jRhaCfIYMPy0NUbj5faxDXHqPq3?=
 =?us-ascii?Q?zm5BjaQ1++yVxKpdNI+AEeT+46Vdbnudaf8Y+OlMNFHuOSFFnfozbsNUXhXv?=
 =?us-ascii?Q?AA88T4GPZkFaFRblzyjizw0LcEEXWzQOQEn9BXaxhd9KkMyZ6dMCYQuJk+6I?=
 =?us-ascii?Q?B+45Li6G0rIAQm6arZeq0gMYhhyhLhkOOv3BKS38cJY2NNPBY9x06SCvjaZF?=
 =?us-ascii?Q?gNahPKuvgoEynaInqlgF5Y9S4gGccB4VTxhQJ5eapl8UqeN57Xd8wdt1TV84?=
 =?us-ascii?Q?1pYbasG72zp3eYL8Qw5Qb6CEREKpuOwCaO5HRnmf7nnilpN8XdW4+L1kEgAc?=
 =?us-ascii?Q?DEqmL6zHDsKCSV/xAPelLsr/qtbSp8LkfXXHhm3ocxTg8SSA12gS3kYcC9GT?=
 =?us-ascii?Q?EcI2Tg5MMddTFsu1zwgRbgKAQ//nRSirHRns0x8wTXqHMTz8N81ICMdr7tmY?=
 =?us-ascii?Q?uYUeVxMKkQndl8n7ovGJJY0JlvkHjbESLw/auEnoMjb9i4GFwj3B51bPpvua?=
 =?us-ascii?Q?DV87A2dhx0Vo6JtkR5AvXw1ke4skBLZhnqnU7vZV15Vwi44TYDqTBCkbqjCD?=
 =?us-ascii?Q?8BDUqOScnHMR8pVxnYrLOQJVKl3f/53Ylx/xWap6XPjQp2GAgeXk7cJ4dJxK?=
 =?us-ascii?Q?IWHyM7hM5QIAW/fF/r8LsYZR8Rxm4Jr2AS4GexpTxOGbw+1d/bZ5Mb2TyPsI?=
 =?us-ascii?Q?ZH0rLausz3X5yuo8Gfmo9cTc0kZuQyOf21KdSyAhefwRtmKCcWlQl4FQnusB?=
 =?us-ascii?Q?1g2zA/yuHtIGNeD6EoJTEH9enj1GbaM/3bx8WqEf8GtahMUqd1yLcgMY5rqA?=
 =?us-ascii?Q?NrpJbMIyAqmYPserIUvrssWABd7rYUO+sdfBv9VUnTX7aEQZAIHbSdiEqOil?=
 =?us-ascii?Q?N45N34U/orbdzb8m0WtBg4h25CQA3KXJlpVcTRim5+G2OqmT7oWB+YeAAarb?=
 =?us-ascii?Q?ZM+pheX0FOHVntXM1tB7Ldnt3W2R0socr8NCl7CZkcgFOkpc3x8gbF1RN+Kl?=
 =?us-ascii?Q?JL4Kzn+n3AMDsiFdDB1mwW+jUA8JKTiAKb7qCZwcEx03vM2BSs9ndbM15Amb?=
 =?us-ascii?Q?ENbapsmIJ8uQSu/NF+XUcCS0AG0gW2+FsTZRpXv6b3ku6P2cH9uw2+wg0N/R?=
 =?us-ascii?Q?LH9r97ddb3SHOfhguXe6nmHGXv5Gl7wxhF0++WBr?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72887143-9a39-40a4-7126-08dd567bd564
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:40:01.9070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TzrwzynP0AJ2tFXYILTvVjKaic+RtPsBpaPQEh1ZPT6TaNks5roOdkroZdfmuRTeJy+/5oGZsslyjoH3OiTVag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8559

The function mt9m114_configure writes the configuration registers of both,
the pixel array (pa) and the image flow processor (ifp).
This is undesirable if only the config of the pa should be changed without
affecting the ifp.

Factor out the function mt9m114_configure_pa() that just writes the
pa-configuration.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 49 +++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index edbc0447141d..a1976da74c08 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -789,39 +789,22 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	return 0;
 }
 
-static int mt9m114_configure(struct mt9m114 *sensor,
-			     struct v4l2_subdev_state *pa_state,
-			     struct v4l2_subdev_state *ifp_state)
+static int mt9m114_configure_pa(struct mt9m114 *sensor, struct v4l2_subdev_state *pa_state)
 {
 	const struct v4l2_mbus_framefmt *pa_format;
 	const struct v4l2_rect *pa_crop;
-	const struct mt9m114_format_info *ifp_info;
-	const struct v4l2_mbus_framefmt *ifp_format;
-	const struct v4l2_rect *ifp_crop;
-	const struct v4l2_rect *ifp_compose;
-	unsigned int hratio, vratio;
-	u64 output_format;
 	u64 read_mode;
+	unsigned int hratio, vratio;
 	int ret = 0;
 
 	pa_format = v4l2_subdev_state_get_format(pa_state, 0);
 	pa_crop = v4l2_subdev_state_get_crop(pa_state, 0);
 
-	ifp_format = v4l2_subdev_state_get_format(ifp_state, 1);
-	ifp_info = mt9m114_format_info(sensor, 1, ifp_format->code);
-	ifp_crop = v4l2_subdev_state_get_crop(ifp_state, 0);
-	ifp_compose = v4l2_subdev_state_get_compose(ifp_state, 0);
-
 	ret = cci_read(sensor->regmap, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 		       &read_mode, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = cci_read(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
-		       &output_format, NULL);
-	if (ret < 0)
-		return ret;
-
 	hratio = pa_crop->width / pa_format->width;
 	vratio = pa_crop->height / pa_format->height;
 
@@ -853,6 +836,34 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 		  read_mode, &ret);
 
+	return ret;
+}
+
+static int mt9m114_configure(struct mt9m114 *sensor,
+			     struct v4l2_subdev_state *pa_state,
+			     struct v4l2_subdev_state *ifp_state)
+{
+	const struct mt9m114_format_info *ifp_info;
+	const struct v4l2_mbus_framefmt *ifp_format;
+	const struct v4l2_rect *ifp_crop;
+	const struct v4l2_rect *ifp_compose;
+	u64 output_format;
+	int ret = 0;
+
+	ifp_format = v4l2_subdev_state_get_format(ifp_state, 1);
+	ifp_info = mt9m114_format_info(sensor, 1, ifp_format->code);
+	ifp_crop = v4l2_subdev_state_get_crop(ifp_state, 0);
+	ifp_compose = v4l2_subdev_state_get_compose(ifp_state, 0);
+
+	ret = cci_read(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
+		       &output_format, NULL);
+	if (ret < 0)
+		return ret;
+
+	ret = mt9m114_configure_pa(sensor, pa_state);
+	if (ret < 0)
+		return ret;
+
 	/*
 	 * Color pipeline (IFP) cropping and scaling. Subtract 4 from the left
 	 * and top coordinates to compensate for the lines and columns removed
-- 
2.34.1


