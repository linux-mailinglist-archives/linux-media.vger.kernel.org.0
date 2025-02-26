Return-Path: <linux-media+bounces-27081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D179DA4654D
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59C5518966D0
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAE621CA1A;
	Wed, 26 Feb 2025 15:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="lRpa+PNU"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7A4223330;
	Wed, 26 Feb 2025 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584409; cv=fail; b=A/NV09A/Cu0OwGVyYiLkzlB9rrlEptr5cCPObeVlqvwx1KzQSzBgTS7aBnfRovIKgVgeFYjb9jq+I+ppuUzkTlx4ZKHd/kc2/wU9bslu/9LXdAAXz2X8Gp5t+FDDEmiZuJhsIO/sIPUQnBM5iCrsb6j6bp1LUQId7mTeimoguec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584409; c=relaxed/simple;
	bh=RP+o10M8l64pkQvEGKdkMNQJ44dETFn+DX+SSAclQTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=id6HQ/Z1EWVaY9vmQRYwtBcm2MC7ypEpUfZJVxvUKhr5xl7VB2Mw+X4Uu8C5expLTnr9HlJB24WpBJDFO5mzwSJ/iv0tDK29U5F1PVR+dxHhxouPNtfd/lMUR6QjZS35H2jYmY28DshkM4Ap7ZrgjTULlvQnRGREL8mP9wpCHHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=lRpa+PNU; arc=fail smtp.client-ip=40.107.21.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWbg8KrvpORmPMzqXs5fHTZhGJXOQwsUmyEoYMdWZ8USG2US6hitlprUyzbBqjAyIqaPHAL2Kxyc3JwNftVdUbc7cIerWeLoqGRNunRhYCZglncxNHgrFIGi0+bL7vpF1/baumqvlKZveczyPu3dlVaaFHkfQ7A723CPBLRHIl4Swy5pqIGVBeW0vBGfqs6QD8vlmQ4OAhhQ200DJn4ojOPlZ8asUNprnHnBKRNF9yLaQZtiumaaS7gkF3K17HVaOza0aQHO6omnn3GJT0yjJDRPHu5/rmHcT7rfaLpejqh0HtW6c5r0jm4LE/9g9Ul0s+PTuyD6KEBSd0bZ5Wj8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfSZI3TLRGGiNHLp/JIrVZuvrz6FUYarlpD348u1iG4=;
 b=oMZAubd4cuMuhMLW4AsFey+YkFDu0DRp6JeDvMXvhnaD6dkWJzYsMPROAIT7S5OEsWEoke3RihM2EC5Wk4DYyj3jNm2++BKETxoqW3XPYQDxGNUzHelchKUfWOUs2S1vHqnbaqlCxiNdclrZH4W1hQ5LRsrFC00+qrpaSfed0/6j+sXNtOnNAr9DUQtmaAmoGOioL7xZs0MKpEYFZRgRiebDpCyqssWrPeUMVOnMKIz+uF9t2L8QE7R7EB1BqIHhGCwzY/ITEtRcC0u0poWsNIzsa3DNjCQPEGegRbkYlCdlzVg8AA3tzNYfeKCB+qi37nVMHdgp2g8FO2RUI2t9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfSZI3TLRGGiNHLp/JIrVZuvrz6FUYarlpD348u1iG4=;
 b=lRpa+PNUcgQrhmHRRz+4IekE3W96L2lz7KqsXWzDtIgj+t4rGK7Quz3f2zts/bPHDyd3eZ23wCiuKx0cVLNjOuHN3LQEL4Yg2esUHzXKrfr2Oqo5PpmpzgArG/gwNERzdI+UGh9iCo17ham5VVtitMwbGW6IKtTcCvjMlaLGaSEqF5pUwHlnmiwuDDfkwTCVsnQK41k6jxZCvDTrd/XGigUYmyO4iHGYjmhoiHfrbMZdZ71oUIUejZyxPA0xqfciAWrcCjte2NPJyw6FnWVax6lTf1CLOSJfqSqCXzE/Fo1ZSVIU+A3Ouj30PyUl74ncOFjYdywITdn4nVjyAg+g2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by GV2PR03MB8559.eurprd03.prod.outlook.com (2603:10a6:150:af::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 15:40:01 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 15:40:00 +0000
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
Subject: [PATCH v1 4/8] MT9M114: Add option to bypass PLL
Date: Wed, 26 Feb 2025 16:39:25 +0100
Message-Id: <20250226153929.274562-5-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226153929.274562-1-mathis.foerst@mt.com>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0041.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::10) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|GV2PR03MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: b5435a6e-9e30-4a8c-653d-08dd567bd4ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f0n7dFPS4o1gxC08HDUdQGhITEDTWkml3x8HxQq/jvcXZSgsJ91k9m7vakvl?=
 =?us-ascii?Q?7Cz1+UfgROUw/nra10PRjgcgweYUMNBj3PsWXb3SKQ/Cc1sSn0S8wcBz7ZKR?=
 =?us-ascii?Q?s/8jPz/NK7P7zsTn30MzCZdn3hhhuWcp/55JQyPfz2zMAzD3dGUjiNvREEWn?=
 =?us-ascii?Q?cpMjOrTwULIa1z7V1EGtOiczM9v6mwfHFWd1wr6KJg4HhYqIcCDCrqTCJYnv?=
 =?us-ascii?Q?fAsch2KC6wvq3TZIffRHOKqcW2lyoV3e+coY75XK6PYSQedZqkkNLXoFb51j?=
 =?us-ascii?Q?a20q3TPWl8MDKs91635GG5ZFo00mitWzhU+tVmUp0onJ8q8MXaXRa0atUlIp?=
 =?us-ascii?Q?5dSA4PRWS9jt85L3wKol4tYS9gbwg1juEkuHySuoNV/bX8FulqBdu1B7GT+a?=
 =?us-ascii?Q?TOvdbc7fQs7I9AvffSFLhIlIHk2KoS4luoIh4lMgdxMnC8/vjgf7ZB4GPGNM?=
 =?us-ascii?Q?2Ps1VlG8OoxtYw02/pBjsy/Y5uSPhnB01m6YFZu42CmDKS8kfJU1pIuz+5d0?=
 =?us-ascii?Q?zm+155tBib+iWXzDrX6MjjH4Dc9UlsVjBTOqDF3mh0c9xJuQU10AlIVMYuHm?=
 =?us-ascii?Q?DjuXH59ZbpEnSTtkk7QquAyVoV386CkWtOB6u8kLI8+axNP5p7HiXAhIgjFZ?=
 =?us-ascii?Q?ALYcFbdW08pX5t+jDLfBGI5BHvs62s1sAZbiN1CxIaUBUdAzSXvqw3TRvglu?=
 =?us-ascii?Q?/qjbyKjzGY9KH9+ufEphka/GpvTLv1T1r2x4AjNA+ohf7W3wdMt2PwKTyPPQ?=
 =?us-ascii?Q?f/9pArgQYSKUsxfUOpY7GIYdVzLlN490JZlnjRyWUUMQYBoUr+UDVrZBntia?=
 =?us-ascii?Q?w/cnmdidnsXSySnBPrN4mwlIlBtOyvBxzCUDyHdVJXir8PT3UhB9GuYbSCDc?=
 =?us-ascii?Q?1EsD/XCPn2zMKeqrvktDerV4QSkylYY0HcpuKLW7w9suGyG0KWKn6EpwYxOX?=
 =?us-ascii?Q?Rx0dhtNHnyb52Ze36Ev7F7UHqkA23LcXfDgAC5YxSUgB0cy1e/jeFg2Jg8nq?=
 =?us-ascii?Q?W/MdtEyf5VNUPgl/SddOuO9gprKCYjEjFN3NSozQUcpLGno3igva0c3ymC+b?=
 =?us-ascii?Q?kD5eP/9wNr/GvBBZUmYc9Zqw4k3jEqzPUWgbleH8huzKBE7sN85HySoRu9CP?=
 =?us-ascii?Q?nDtrJ28t/sMTuo22yozNrD6nNEZdIdmQXY7NLmExqbwmRKXOUaG1A9cbeePW?=
 =?us-ascii?Q?pDhatyxdRtw0FsRPAIIrEC4mOcoJ/CpLy2X+T0uctIsxJTeCPJ0xUbf7pSfY?=
 =?us-ascii?Q?WMQxEDtaCGcOO0Givj2mavqV8t02S3pQeQSAoLXWXbXjfMbqVlbQ4ey33VU7?=
 =?us-ascii?Q?46vEIhtnS8yKwkedt/51p4DYmLVxUEPTC2OvYfE/uo8vppCAZtQUvb3j62F/?=
 =?us-ascii?Q?ViTViql6MCbQmAzoTuFtoaR47cJ/dnbGa2ZoI/pdNWACqebxvS6w+ewyZuuF?=
 =?us-ascii?Q?COMOn1Vdofez5hrWxVHO6k3lt1xeIJYc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VrXcqAPMbVfqyoPxRky5xh0iK8ERSK8NyiscQCyH9sZygI+6be6WqBKGre5g?=
 =?us-ascii?Q?a0WFqoMAoZAkaheMRTInJp0QqUsPT6a+oqcS4W/r1atJqG5xXb+g7TiXIvXB?=
 =?us-ascii?Q?RRCqoByzbIZBiwD50VD7UZuMacl7wM2upHEm+wtP017wP2c3nKG/I8DSODpZ?=
 =?us-ascii?Q?WvqJojn1FAOvVktosuWJthNKnJFl1rv9gQwc8Kt5eeoSW2rQ/ctf5d4WyLym?=
 =?us-ascii?Q?veCuCFnywZp20UdeDrVHSzZLv/rL0ibesVxOd1j6ubu1EoaRhYE5HOkQHUBu?=
 =?us-ascii?Q?2ZE7hPhg9Dy1YSmzXUr1M5sX9wx4qpFp6mn7hMSLkB3ltcpXFx7iqT5PkeeT?=
 =?us-ascii?Q?GfGGFU2cS/8ax4aRVX/5b5skCPk/NFjIodYRacTiXAIvjadV8U8lA3x3FLdM?=
 =?us-ascii?Q?hHz7AEUYkr3BNM5dZ06OKVIJc22xFzyr17dQMfvjPBZeEqb+TE1ajvL5lF6R?=
 =?us-ascii?Q?OlBMHVNyHjyKwkGLzwMvJBhMqs8Xz6fjrhyM+GUBja3PRZkwqDTs+a1tfZJq?=
 =?us-ascii?Q?TLCrA1o+X+oTYKpybJPjQgPpHgoQwvX06I9KmPVss8oDQY1FU3sTAGX2VR++?=
 =?us-ascii?Q?lSx6hyT7ZM80Bs0mg86MIlEUASzBC5L5sMJcEcOxIwn+QtSZnXpIG96HDfFF?=
 =?us-ascii?Q?5LIGoHBKB4w99jCkoOg5IDha88/RigQoOyCT/wtn6hlNwPbXw2hRICIFTSX8?=
 =?us-ascii?Q?b5VG57UMgd7PS8EAHuBPf9pX1+F4WdoYZLEbJ6xWspoeqJiaagPX1H7bgsir?=
 =?us-ascii?Q?JuIxpLyOCgnJtvdx50tCepzslX9cEFp8FwdDithxqamwTjmr1qCxWQA2e6L9?=
 =?us-ascii?Q?A6rxl3X3WLRRI4vOBUq4HO4s9qbDw3YrsJoqx0kaMAQudrK+3dF3v30jnOJE?=
 =?us-ascii?Q?JSnD3eay2REZYlMoQnl5t5DVh2A6N9R16mi8waylg/3bQuHQuVcHyPgZDlWw?=
 =?us-ascii?Q?Q638BpdbFhM9eQjMXqnLBGNr1u+dPqorLOeKH80Hvl8o5M5hDkQUS/zCA5p7?=
 =?us-ascii?Q?/ES61cBMRQ0lmbj/tfMCnBn+nA4gMFvds+w5iMCDEBYy/gizJpvtgXCe6//V?=
 =?us-ascii?Q?Aj8WVmr3eRrmCshYKu3q7Z72ZxTpPRCIBZEL+vmS1GrYHgT6DK+Tef+3avsb?=
 =?us-ascii?Q?89JSaH4LBQPzaeWVcxxHNmnIDAqKh99eT0ZqoNfpodtKa4LbL9zrpX1IumbU?=
 =?us-ascii?Q?8LmwjKThPd285/10P4KDXMkWedUPkbkVgL21zX/sUhWyCI9eR3k2LyV3Ra0e?=
 =?us-ascii?Q?/Rjw+Fq3m4CGqAgqUU1KCnzph6EbfksCqLrEB7XqdTpbdeVjSWQbnWT+VpJq?=
 =?us-ascii?Q?tICpmewRKAXWpSFbfmuRcjpQPpgfcVYl7y+6aN+3nul0bxxlbZ2NlYwQNDyi?=
 =?us-ascii?Q?hXf+ZxrxPdtsh1wdHBm8osqErjaTZ4jcqfcbS7iognYxFf5cufhUHqZibxMN?=
 =?us-ascii?Q?dGECkp1sXZqSh/AtFbJH0B60Kxs6AnHb/1a/Mut5uuodvGGbFzQ3ZFmiTE3V?=
 =?us-ascii?Q?76gyfsXBCyQGrPiu5f6kdsatnrYDwFxxSFe+GwZqQAbHNqH6yA5f0X2AgSwV?=
 =?us-ascii?Q?gjTguvNpSBcsqZztuQL67LoTZVo68qHvJst8mgtZ?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5435a6e-9e30-4a8c-653d-08dd567bd4ce
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:40:00.9116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeIeq8ADgZNMXbKS/NpqdxcJi9UTtOHHe4DPwRe2hBspWNMDS1ZdHtvtqvOBCT9pw3jSLai5tpQRMKyZ/xyQ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8559

The MT9M114 sensor has an internal PLL that generates the required SYSCLK
from EXTCLK. It also has the option to bypass the PLL and use EXTCLK
directly as SYSCLK.
The current driver implementation uses a hardcoded PLL configuration that
requires a specific EXTCLK frequency. Depending on the available clocks,
it can be desirable to use a different PLL configuration or to bypass it.

Read the property 'bypass-pll' from the DT in mt9m114_parse_dt().
Depending on this value, write the correct PLL register values and
calculate the correct pixel clock value.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index fa64d6d315a1..edbc0447141d 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -261,6 +261,7 @@
 #define MT9M114_CAM_PGA_PGA_CONTROL			CCI_REG16(0xc95e)
 #define MT9M114_CAM_SYSCTL_PLL_ENABLE			CCI_REG8(0xc97e)
 #define MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE			BIT(0)
+#define MT9M114_CAM_SYSCTL_PLL_DISABLE_VALUE			0x00
 #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N		CCI_REG16(0xc980)
 #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(m, n)		(((n) << 8) | (m))
 #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P		CCI_REG16(0xc982)
@@ -377,6 +378,7 @@ struct mt9m114 {
 	struct gpio_desc *reset;
 	struct regulator_bulk_data supplies[3];
 	struct v4l2_fwnode_endpoint bus_cfg;
+	bool bypass_pll;
 
 	struct {
 		unsigned int m;
@@ -743,14 +745,20 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	}
 
 	/* Configure the PLL. */
-	cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_ENABLE,
-		  MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE, &ret);
-	cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N,
-		  MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(sensor->pll.m,
-						       sensor->pll.n),
-		  &ret);
-	cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_P,
-		  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p), &ret);
+	if (sensor->bypass_pll) {
+		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_ENABLE,
+			 MT9M114_CAM_SYSCTL_PLL_DISABLE_VALUE, &ret);
+	} else {
+		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_ENABLE,
+			MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE, &ret);
+		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N,
+			MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(sensor->pll.m,
+							 sensor->pll.n),
+			&ret);
+		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_P,
+			MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p),
+			&ret);
+	}
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_PIXCLK,
 		  sensor->pixrate, &ret);
 
@@ -2268,8 +2276,12 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
 	 * for 16-bit per pixel, transmitted in DDR over a single lane. For
 	 * parallel mode, the sensor ouputs one pixel in two PIXCLK cycles.
 	 */
-	sensor->pixrate = clk_get_rate(sensor->clk) * sensor->pll.m
+	if (sensor->bypass_pll) {
+		sensor->pixrate = clk_get_rate(sensor->clk) / 2;
+	} else {
+		sensor->pixrate = clk_get_rate(sensor->clk) * sensor->pll.m
 			/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
+	}
 
 	link_freq = sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
 		  ? sensor->pixrate * 8 : sensor->pixrate * 2;
@@ -2321,6 +2333,7 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
 	struct fwnode_handle *ep;
+	struct device_node *dev_node = sensor->client->dev.of_node;
 	int ret;
 
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
@@ -2349,6 +2362,8 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 		goto error;
 	}
 
+	sensor->bypass_pll = of_property_read_bool(dev_node, "bypass-pll");
+
 	return 0;
 
 error:
-- 
2.34.1


