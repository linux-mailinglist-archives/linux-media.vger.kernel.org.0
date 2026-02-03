Return-Path: <linux-media+bounces-52084-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGlZBiqxgWloIwMAu9opvQ
	(envelope-from <linux-media+bounces-52084-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:26:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE37D6356
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A4113068A2F
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 08:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36985395DA4;
	Tue,  3 Feb 2026 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q0lxZcwR"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013041.outbound.protection.outlook.com [52.101.72.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F49395D9A;
	Tue,  3 Feb 2026 08:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770107113; cv=fail; b=Cq5Vq3u1mJ6Pj1U/YCmVqCphZ6/qQ+aj/bOYv48Xf42CBDwuo9N0MvlDFxNmGdl8sCLk+qBAMC9W76pzY4HRDhKBt5//tYgyNCtb5TRPlxnC2DxVLnuQRi55/We/Z0xGamSYuWjrgecOgeXiW5xcNaw0OHu/bSgXQLRzs4s8Tts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770107113; c=relaxed/simple;
	bh=kv79AkqPavr5/SrH0fgaz590HIg9KzlIp33pl7AS/Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ITz/tsNsuRSMESN3yYxs0yBtSkrzKndjDSTPXiEkeTEO1rjIIGVDTxKd8EAuN1wfVd3Pdd2mqn+A910Ei4EyqG5oc3s6dfV+q44uiukszttJSKEABMKt6soPCwI1GQ4wHJPZD4JPlB9KLsDnRfk94Yy9+2ClE43IqRLUYYkGi3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q0lxZcwR; arc=fail smtp.client-ip=52.101.72.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9g4NBnq76NQ/+CcL/j+c6yLNMeb64XFWEucHwi3x8okvG4C/aaQ5f1SDUsaKS8bd0H3PNn5l5QwxJYk1bh4np2/8qfe8uYkUIMXHKf2WMswrPHVdsHd/pC0MVKZ4ap5gKFZfpxCTtQPMuiS6kUFZm/bnEPuNAeTf4g4JkztyzbnrKZMTg8grDhRdXxpXRup2B3wnmHD3OwxDbUC/BhqyelMuoHymGkPd3Zi8Snl2Hf5Da45DMlMDWJuajqEU7eWm63M75wxoygtR3LnJvVTQBSPOY+30BV0ljGLZzGaKQhYIA0uyVp1dOqze0KafBQIYNUuMJ7f/tAbjOmA123diw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QS5B1YUvF/urgghlAyH/WIexuPQtnI9CXkAAb7pqo+A=;
 b=Kr7ywHE/SjoxepeI1/7TcrpzS/dDXejnfWkb7kOkUIcFxMjkgF3e34no6JhcYDfxW1D5N7Cl8u0UCl8eDjXdbk1UbJWg6ySV9wp4oH2oAk+VV+a5rZsXPHZ/3jZ3ShmSPsG9HRIjrJoMda/r3+XZlmz3LHHm8B6F7G0cxWMsPeognHU6jqYZ2/n68YOsBSMta9dppNx/iZvXvygx7Rn2ZZAuBfeU66s+g5+d/NbbSdF/GG4AKn6Bb+EnBd4A79cin7qYi9MuF0/Y5Nm2NckN16D+rzPpyz/HW2OYnFJRojCHvBMEn3MyLlGEAs+Mm/tT7oDn0zP4kJX9yDCogaQQlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS5B1YUvF/urgghlAyH/WIexuPQtnI9CXkAAb7pqo+A=;
 b=q0lxZcwRByoprgKJxRpz2mXeqROsYPd6LvLqd6W6zKaKw9OdCND0my3svoQJiMRQsFs6g+qyZRl4eoiwMZFmKaQD2vW6feV3AkwzTUrYzRRmuRUNOOz7b3P/XYkPzYBvUZkje+IB1FSrL+Sh0+1MS98/Xz9grukDKYVs+iRHUe6dj0zVQdxRjVxZ20OhbeeXsYt4cPaBLKOZVydSit4UVaGVJugLgxn+kSIKdy5eiaMWL3xyLEyzdCN/X8ZvgQenG0QJTvfdQqUyKQ566yepzzTA0W5f1LOTT6EBV4gkYdzvol+IC3SbIwK0wBjUdxciuGMVAFCMzp9P6W69l7Wh2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DUZPR04MB9919.eurprd04.prod.outlook.com (2603:10a6:10:4d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 08:25:04 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 08:25:04 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/4] media: imx-jpeg: Use devm_pm_runtime_enable() helper
Date: Tue,  3 Feb 2026 16:23:39 +0800
Message-ID: <20260203082349.1082-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20260203082349.1082-1-ming.qian@oss.nxp.com>
References: <20260203082349.1082-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DUZPR04MB9919:EE_
X-MS-Office365-Filtering-Correlation-Id: 2911d33d-63cb-4749-a83a-08de62fdbb01
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E+GGJmzR/XgekxRkiUQd/CHvT4+gd+wKSEn2hKxu8fAbPslFOKFoSRwH4C6i?=
 =?us-ascii?Q?UwcWq0vre4quypqGcsGRlJADoM6+Gdj/r/xwYjnzWhDR1pAFcSo+uJp8VTe2?=
 =?us-ascii?Q?mHMghxWjf/jZq8QzCJy7wyHfVsyY2djzMz0J0N23W/5O+ZrAY5qZLUDTm0EQ?=
 =?us-ascii?Q?n04QPhydj98HEhugce/0293Zs5XIRP5KCNO+lPebMGPxgf/E5GOWaApceh64?=
 =?us-ascii?Q?D8A2hQl4rIQkPhRhhWIvs6Y4wEerulN0CdyOzwqz94v7dAVs6jihpGi1FuMr?=
 =?us-ascii?Q?ysaZdYUNZbKpq9cBEvIQuO0Ef5U3cU04U0vBKd6QOISszWnFdHYW4sI4KsY4?=
 =?us-ascii?Q?XhIB+k4Zd4segmPhyDloHjCPTDoMfopwC7PdOrf0mypIAydhG8azbv4q9ww9?=
 =?us-ascii?Q?wV4R/zByY3ILRi3AmDX4l/ikg61aSH+eYytNCj/45mr0I1bn/dbco++oU3Xh?=
 =?us-ascii?Q?xKmrZoYzsFzShSfayMprk/yHDRYKkiZeuK5khxGTNFNIhZZX4NM6aJBZd3m/?=
 =?us-ascii?Q?a6IEj7j89zZo1zTqemo9oDvQ095Qb8EtBz6JxSiOcwJH1D0IT2wyog2jOvtW?=
 =?us-ascii?Q?Lu6AESTQMxMynIUWr1tde5AZNHMr3TUUWzGXVTzPp7wxmhy43FWbLuV+DwCy?=
 =?us-ascii?Q?PzTLw1ABf2PSruVUZmoicEMwYvMte4qdGusMbzzunl9hnpCkhN+cizvSBr3C?=
 =?us-ascii?Q?I0khJoPmXxO4LXr1xcf44ECnE3WkyzQ0oos2/U8hYZtALQlxFwACezZLsrNS?=
 =?us-ascii?Q?6NkeF1R6g+CByeHgr/FaEXswIOvw78+Lj/A788W2123rCaxUU9YL0eaLFR+7?=
 =?us-ascii?Q?6yPmMecqTBU0DZfhGYP8FXc9xFxeveW5FEfy//oBHp1y1ebMyL4qI5mQAIz5?=
 =?us-ascii?Q?qF2inMYQ1mZaXdYikG/ah/RCLx0Wv0c6Er9Px+7y29ABt1kVMEOM9PELPECu?=
 =?us-ascii?Q?Ne9Eae8lL5Y51jQflYfHHSsGyfPpHMhlko3B4dIWNiS8BKU6HVdFb5SKw1UM?=
 =?us-ascii?Q?2NAH1Q1R+3tedyVFL2NoJCgMG2Ho6ywMtS8IJ8jo6n5QvOL72aOFYwNasJBH?=
 =?us-ascii?Q?tqeOhejsL1umw2kTdhmEsrdb81653mA3FMTr88b6MYibND1Xu7L1EqYlIOL1?=
 =?us-ascii?Q?gxdVEIZWH79wUcnGEd55//ajGL0vqqh2DIkK1JqqhZFcfLBSQWqhZYKaCIDT?=
 =?us-ascii?Q?XA/fyCq3/VnkOdPcLrdjiJkK3bbe0Ja37bN9mBTzOsIJfeID06Ptl/JV0x7i?=
 =?us-ascii?Q?zaqAUTfE7xmWbs0YEzbS4wSHTp6QpgFYI8xMknx+7aBN9EmWrE+JUT4+WTFf?=
 =?us-ascii?Q?Nr58kTJ0ASokYC/8XhoNHZrZXlZKBjFRwTwZEvN4ord7l2tI4P5t9eDYAkl+?=
 =?us-ascii?Q?MtqSVXVALnl1OCaNQaEVef/E38eH9G1Q3RfAVZVmrvkKe5lNQCZmzqdTCkqJ?=
 =?us-ascii?Q?TlrFDbgdCU3rUk7up7/DNJcUweLmNO44S4LC9vOqceSJvOnXtNoQPEE9HUfL?=
 =?us-ascii?Q?Xbd12ODt5FSM2kn+HOY6Gonpx0OP7L8Im7yPzIaxDpPVUr34rgswehYITaRU?=
 =?us-ascii?Q?echEClje8KfKoTK0m/ihClczG7/k1YYCa/LeaqjHRKe+sidLQm0wpHD1QyTt?=
 =?us-ascii?Q?Rn1TIFDHX4/mZ05xvoZ1o6g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u6l1Jp4/iMvfUB/jzoh2kilk5qsITqUQKJFxFDgSdbBroAr9EN+K9uxN7pco?=
 =?us-ascii?Q?gjABGXTF+aOZsLbHYzAFWb6aNSCTCYE4jw4H86RJf28nOTTA5stLXvsCM49G?=
 =?us-ascii?Q?0H8L3ybBvxiQTZa085sNJ5DABGzWrpYn0ZWfNOEexLDr63L2T7/lJpOAlNU5?=
 =?us-ascii?Q?klq982knyGDAfkXlB+r6vhNbkdLfjmc6v/8pmuNUnpXO2nLPi4fTFHgrqET2?=
 =?us-ascii?Q?gOM+3puWp0aPHbO/RGNtT+1Y0DVXTFKEdllBbrN679TC+C2JrZ568mBud/nu?=
 =?us-ascii?Q?yqFHmdOvToM1eUlnt+ysTnklzdZ73uD0+VlPFa/d3AcDV/9D9v38vGJZAjxw?=
 =?us-ascii?Q?TBrdhFhjluLfLwr3xi1IL/Oegk1QuK0CuI7SWOfQY9ge0VzttQapiPggvfvM?=
 =?us-ascii?Q?id5wn74dvEOsPrxLjCBU/43xuEcSPuuXCqOkaVxAKvFXkWaqnvbcsMMdQh/f?=
 =?us-ascii?Q?a+5KnpWtR8H1kNdbk6uHEejsf8hWUzWKQwIcU2KaCgbt7LV8O1gYm9Pg+HL0?=
 =?us-ascii?Q?PaOtYtVL3uKP/YZYx5D6j432itdajASZ1wG8WVOWuF41Lpag9wE534+b3uHw?=
 =?us-ascii?Q?OmHlxbh59wzQLxgVjtAwi/XjZGzrRgkx8t+ZmlFhYxO2rMktF2bIuPE9xZTH?=
 =?us-ascii?Q?ySLT7hA9o3FSvlEwf624l2RYHLr71rRYYT2Am60Cn1v6bNLU+bIbtEt1MGfT?=
 =?us-ascii?Q?j8CJkP9kBa3a7jVZRSlDYrkC2FZHQYa3JYio94gHFZQBXbXmL2bkmWrGSAB3?=
 =?us-ascii?Q?k1pe7HTBCga5TcV16j4KrP0hWpFqz8+okJ6G/IrXl/wYvahLd+s+DM8khTSz?=
 =?us-ascii?Q?/dZxWgnNFhIoSdTdlD00QR05Rurqp7HA+W+1MWZWPlM/Cd9F1ezion6GdAMI?=
 =?us-ascii?Q?DxEL473Wo1FsrSPRRm9PERCaqPLgyjrTv6UViiRAiI7SNuRCp9lb+R1pj3pQ?=
 =?us-ascii?Q?ZhqVrcjO7eFSVyPuHu52ia/iKcMtfR37hkSVnzpZ/t04Z3hEGnGb/JjGDryP?=
 =?us-ascii?Q?8UXzbshZYRN933Kjuw9X3nkFPLxQnzUD8YQe2j+yXFHT6VqzfjErUoz4ZJmJ?=
 =?us-ascii?Q?Scpw9r2M0gENbgbYOaZIGHmFTTeOaXjVxCNNtbcgEB28+n5fvQGzr6ewaZs3?=
 =?us-ascii?Q?XEdOwnqX0KbCyHjPn8Ozz1UtaBjHLqnusW8DsJvh7S4XgGUX/kmCA2UPox/S?=
 =?us-ascii?Q?yKnjD5YY5alWAOqkWVuscSORpj4k33YNp9Q95fVMM3PJHz115ASzMowNMBuw?=
 =?us-ascii?Q?p2I3vGDZDMQ/nPQ/ulIgPQuoKWED6gDWVFI//94I8hh69oXlP/d0J8F7l01S?=
 =?us-ascii?Q?wfn0F6OlNeEa9p34L/NMkBoGC6B2KJE4qSfzIrVboZA4aQsd27JtUzBpyM3n?=
 =?us-ascii?Q?l0ZaMrF0Eg05FbsvgEgIr/n7f9X8jO0Th9wUvEZC0PPo4Qntv5kFgRYZ5OQj?=
 =?us-ascii?Q?Cvx8iGZAD5FZ+rp77Vqfng8qBm48l7sBVLJFU7Ah6nZhDagZvye3DatvnUi5?=
 =?us-ascii?Q?5pFw0bdxi9R91v8BBZVyKJRFgsOw0kIPpzHo+Q98naeTzqO4UD7R2vOGupr6?=
 =?us-ascii?Q?vH2IeB9FcvRyEqMdkZ/FmpS7GgbnjoGFl0Ggk8gPZY1ueEfyR3mM0V1XxB5f?=
 =?us-ascii?Q?hMI9v0JZ6Jt52mn184Sl3WSjLTvvDIvz8+I1TlkdboDdBTWhTwJTCeRsDiwk?=
 =?us-ascii?Q?TAKMpRH0gsgUtJ2H2Hty2CYDQOrWTllV8dNWrdVpxne3D/r3d4wEnTLAm0oT?=
 =?us-ascii?Q?Ucr4kpMQdA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2911d33d-63cb-4749-a83a-08de62fdbb01
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 08:25:04.0597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mA1rioxPV17piyzPrZHnJSeaS8aaoWaxpqFVstKURaf2hlPmW1Liqt5d06kb0223+JbYrZT14DO3gi0KSxrobQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9919
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52084-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ndufresne.ca,kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,oss.nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: 9BE37D6356
X-Rspamd-Action: no action

From: Ming Qian <ming.qian@oss.nxp.com>

Use devm_pm_runtime_enable() to simplify probe and exit paths.

No functional change.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 39022c1bf36d..877e6c4f7406 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2971,12 +2971,22 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 			  jpeg->dec_vdev->minor);
 
 	platform_set_drvdata(pdev, jpeg);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret) {
+		dev_err(dev, "Failed to enable runtime PM: %d\n", ret);
+		goto err_pm;
+	}
 
 	return 0;
 
+err_pm:
+	video_unregister_device(jpeg->dec_vdev);
+	/* set NULL to prevent double-free */
+	jpeg->dec_vdev = NULL;
 err_vdev_register:
-	video_device_release(jpeg->dec_vdev);
+	/* Only release if allocation succeeded but registration failed */
+	if (jpeg->dec_vdev)
+		video_device_release(jpeg->dec_vdev);
 
 err_vdev_alloc:
 	v4l2_m2m_release(jpeg->m2m_dev);
@@ -3047,7 +3057,6 @@ static void mxc_jpeg_remove(struct platform_device *pdev)
 
 	mxc_jpeg_free_slot_data(jpeg);
 
-	pm_runtime_disable(&pdev->dev);
 	video_unregister_device(jpeg->dec_vdev);
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
-- 
2.52.0


