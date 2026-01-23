Return-Path: <linux-media+bounces-51399-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLqrGmUsc2mTswAAu9opvQ
	(envelope-from <linux-media+bounces-51399-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:08:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0671172335
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 073F6300B262
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 08:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D47936AB51;
	Fri, 23 Jan 2026 08:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gzBZSseQ"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CF5358D31;
	Fri, 23 Jan 2026 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769155604; cv=fail; b=KwQ90wMfyZcnzqfOxgGwQlC+/lzhOP71ngWVYTfwZeOPUwr6KbZReBBQcq2PjGEDiEZtDaObnIg6b2/6qFbDDh4sx4YBc1I9YmPZbZe3TgNVHokEu3PFBBkiCUYY5ibg483V33r4XQMZqbwwbAOMDxs3ex/tDQfVBUQgaA/9KdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769155604; c=relaxed/simple;
	bh=avb6y1kP8lDHC8Q+smLiGSEf7o6Y7mOfagOIAofRwcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TA6foXvA2sVFJCnnyoOEj2lMmgvKcdZJv6mGBDh8uhfHSwoBSTxuxZw8uy23ARIcfkk0w2fdkd04ewReR+LlYzyFcXiqqJ/y2luZjzY14YLUYDlbon6jXNocC8ohvV8Q04mDtfyVZ20ljrY8w99Z4N+NraPOHMg23bQAf8Bndok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gzBZSseQ; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdeaZIoDY1XmfuiPiSjgfUdWKcPDNbcstz/mb4z/GgAHvsJ7AQ1+iWpKlfXLJfM1bw8Dd8qD1XqzeCRWM671ZQnRf1ne3ZyeiDw0X20epct8MvLxXp9svIvqZztzYyTFykxcZ835obTJF3+HvBWKLKPAMaRue1CzXXswM3VrJOowbmqoWbNxH60dvAY/K9CUFtVKUevAEdYgc+CfRqxQNg2Av5YTs4/o8VehIr5kV59FAxqYXXcd0TIzfavMlskOLUanCYiY0uwc3xcw8ddPG2bmq4QjyOznn88wJ2FdysrSwnPScqC+ZlMvyvUQP4eAz4wxejJ7kF/6ZBKrwnIfKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3xlcBEraFMkRr6HeCEEn4iV/Wo2WflG4sAd7esjSqs=;
 b=J8llQXNSO0xJjEFEimCKEl7CTo7pzdpu2EAViuquzLwoYQkVnZBV90XVyMcnxL02120TLSTWS030QT/zt80j+Z1I2nl1vL8rOxcv2XBjK812plWzOhgI+nxXZRwV34QDzCTUDonQG0CdsyD7H3RofFBXVq6HJiL6Mn1KixpbHIaFw6MDO9ZiNgwROucUyAjovAd7HJ2cpl5YJ/4wPW4D47Bh90eWHZRexpmE7WxmGKHIKG4DC2vl3NDEXYhGRilv3D8FNYqol6yg3fHB2NwFUczUKCAEN4HltdbxNM2RvQAS90p1uWxc2OQMMQ6UILX12+ATKeYZrgAYDCfBD45ZRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3xlcBEraFMkRr6HeCEEn4iV/Wo2WflG4sAd7esjSqs=;
 b=gzBZSseQJX+V/WZXlX/fgrinDvVxuwiE8ip7xoQv0pdXE76BGjKgPGMyci12SFv/nPNnxaS4zQzEruW1qBQmqQFV7Ep2cyaAFmOiZ4Xoq41GPN1Bdms2aBfLBj9+4Fqcp8VmB9pvKPgQEY7fmW5ai6rFThF1TUV/0zst/bdDs3WJRlLQMruR89Gr4hclvsZYz0eZUUXYNM/+KUGAV7Be2UknfX0sThMAXo5+h17uWOb93e3C+uEG65/u4KbIzPL3yAoGp5iwsZ92eVzAb4vQqLJoJmy5JA1RAntF7UEAiqHPEzfmAs9GgMFUqBshxOWUknhONSE/RL3KbfXo6yhrpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by PAXPR04MB8624.eurprd04.prod.outlook.com
 (2603:10a6:102:21b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 08:06:33 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 08:06:32 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [RFC v1 11/11] arm64: dts: freescale: imx95: Add NXP neoisp device tree node
Date: Fri, 23 Jan 2026 09:09:38 +0100
Message-ID: <20260123080938.3367348-12-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c91e67-369c-49a3-a7d4-08de5a56523b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?diipDJPYaitVQsh7OyzPjOcQfYr7s7grVWqTJMwnW+T2mMDX5tbvyxZRU8hk?=
 =?us-ascii?Q?L4GR6ffeTFM+8VQ6Rj1AiymJGRyL6l1ajGZqc298QFnRX3KxmqYEiYxwnhfY?=
 =?us-ascii?Q?jBVqDYJ0LyvF4tArog9h+FMaIyEWsP8jtn3rzoXZ2jrWWqkzV7zIb+B3A9w+?=
 =?us-ascii?Q?FYSq7v+NAKBlYMtlxK7jyyg8uq9CSNsYDhlQmsMRRCyzYYiPXW+1rd9i2bsU?=
 =?us-ascii?Q?tuBpscxooGTMnH4C+nq/r84A1SJ1N2p16rPVf8mXBE9auxi6NIoqjcgOMKG7?=
 =?us-ascii?Q?KTbYaOGSe99UXCAFTv/yxsnbiOf0sP7J78h+xR53zyRRT+lX7hbLNRSq809i?=
 =?us-ascii?Q?wyDJjhrO/1X/ajpBTEBU4yjJckMW2Hjo2mMUAb6CVhcvIQsiGtxDATJKvXJh?=
 =?us-ascii?Q?nU8ektvgVvyQsx/0MYj1aFb3/0elfP/OfjyNPqvxcaPpz/WawFEPR84D5UvF?=
 =?us-ascii?Q?5F6M9d4rU1hIBiMOxrKL5TGwOnR2IC9ptNwGM/gdSL4KysA6CG3YrMsrwXup?=
 =?us-ascii?Q?jYej94ViLChEtU4ctO7QPyRXrmZCHln6x6NDlKMsXQ25HIUItGFtx9xnl6Bm?=
 =?us-ascii?Q?Jl5Ls/1rd4xR9cUXOOcb2AQ+8qjlwIl+pcX4Mk0AZaCflkJLSiHU385X5axe?=
 =?us-ascii?Q?5N3s4ApfE8jODj5JhTvTH2Z+S8g10y+/c2poEkR3GZTmRbRuSFIjfHEcEbfa?=
 =?us-ascii?Q?R/fXKbCcUmoRQzLm9Ta8xJ97qu3V5uDjiu2JuwAZGE1xWObdTG7HHcHP7HE7?=
 =?us-ascii?Q?Imx2F8tOT/DJTSO4drLexYezHW3xJGMJz9mL9iNp5uW+F3izCg3Q3hLWbwDT?=
 =?us-ascii?Q?+rWtxuo/5canthSTghEoR+gFC9bTuwK1YpASY5B5I4Bwx5ermVI4RLoJN26H?=
 =?us-ascii?Q?NZ4cpq89dle1X0rIMsl8cJbCWTQPoFOBNRvr34Bb9ivLOH7iTy/N0YmZifUy?=
 =?us-ascii?Q?DwA0+YVI16ib9hPwVSLLIF3UeiCWtgFmPvZ5ucQb+Sodz4vGoI1R17sgHozD?=
 =?us-ascii?Q?Xxytbss2ovUQi4hxHIbCq8WEaIWKHKFH6lAnWSGO13SRjPq5gmdBd1Hr3/FJ?=
 =?us-ascii?Q?myCB0y1OmdOeL8YPXi7WilvQot0b9wjkkshgidKrhsc2TAvUdByc9SHuLKIf?=
 =?us-ascii?Q?BJY6/EJDc02RuPu4ltbeQpoS0MSI3lTsOLAKzS88kr1FWy2xPCXLbpFEIYaY?=
 =?us-ascii?Q?66YpjSoDrmGsVGUn9I6iYmzBH+zwvKVvK00CLNiZx3PLem/UmrbxrVR34JxK?=
 =?us-ascii?Q?6ObAzHixc83d56F4xSdMLOFu55v1LIG5KwT3+HuYSw3tniuLJVq2CBUWQThI?=
 =?us-ascii?Q?0/LIpOJuXW82B1KV8B9HTIiaAudDQyzUDrq/sna5p7TizgJ88n1rBdZgEFCO?=
 =?us-ascii?Q?rakw0wPm+oG+ShCxsuzFd9eFJe/y4dWC+tA+6i9paxUouQkw+RHR9Optpi6v?=
 =?us-ascii?Q?BVow65W6VS7Wd3DvcYUR4lZ+NS+MJFZsPgxvLUcN+PLp3vrIGET9VYcIfm9/?=
 =?us-ascii?Q?bVyINa97XhGA2YgB3r0+Ttm9XPmsX68PElKCLtXAzyc8L4Yhl1FVC/5BTBKN?=
 =?us-ascii?Q?OogalFYoYYPCMVXSJG6r50jzr1b9eTXvFCY05VnTQASy5ikdsomrnyS8MsVw?=
 =?us-ascii?Q?vRMT6987J4bjdvndRAG9u6kDJTGBaJF66xap8PhZYd4G?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?oAOM3d5tgA5UwCsTWNDie2ksv34vivkpEMGR40jzyzS9UBAQ6uw0/ltQt8a5?=
 =?us-ascii?Q?gm1hd1dis723ggvtgEUhe8Yfhs8utwEfhX5Bn8d6bnfJMCwcbzrZQKX9M+PB?=
 =?us-ascii?Q?MXv75/LTVJ6pTcb8p0Zs79OfQp6R4LtYezsHnwBZ6EGG8kvysAP2uTrvVPvx?=
 =?us-ascii?Q?nAXrHCelSGYI6x/bv11Kt4snPXi3Wudksya2/sUPyQXyLAGJftsEjuDRrvUF?=
 =?us-ascii?Q?F5AfWkzG1newVZpCVLsRWU03SZ3FZJz4XbxIvyc0dvg/CYySPA+f4XOmh/M9?=
 =?us-ascii?Q?t0l8xqUWObAfytThrjkAOj1g4bxuyFOgcE8mrfakihCs+ve15FOZit9uIYbH?=
 =?us-ascii?Q?OuylI32t9UsbHcATKx0/XpIkkU8BsTncEuRiE0txqvdtQfJF/lmXqbscoDLG?=
 =?us-ascii?Q?zdXMMHBd9pLalJqIuspX0ON0Z3oL0DkBCYe4Huw5M8ZugNvjVGdtho52CRdO?=
 =?us-ascii?Q?H7FF3Ulj6r3D1foIX618J01Qy/ox8WxsbvYe2QYP0laqu2fVcXb+IIQa2b9V?=
 =?us-ascii?Q?RJg+vBVmgjMyzRTDziI54ijl03dzt/uJCWDHAsGnYhsaVcprZdcDUjqbGhTA?=
 =?us-ascii?Q?U61UkrFwzMBd9T6TSnopIAzd62Vlm0ogM2GQugVhiMlcQPFKjXuxWaY2kfCp?=
 =?us-ascii?Q?WwWLyKhGyN77i24iHDvvAk5yzTkZS6CSmJT/oGlwyD5dp7EZQWEUYZDsAT8L?=
 =?us-ascii?Q?/rOey0lykwMlagcrR5JlsQJX+acG8PYRMkVX7AwNnecumBZcIQCkMyisrTKf?=
 =?us-ascii?Q?EzfBCDwBj4g4H3/NMnYCMAfXIoGIuJmzmb0b/bp1tV/uK/K1Iot0lh2Yp6t5?=
 =?us-ascii?Q?hxpjEhoT5xAzzXj03bjqYdIJpqw0s9aFTsNMHbv5Bg9jCjjljL3YYRb18WlM?=
 =?us-ascii?Q?mnnqrh8sLDeMbS8/cgxHRG8+S1kn4UifE1PpC7COvu3g87bBQIEDv1TAsoy+?=
 =?us-ascii?Q?ljKqQpyuliamCtf0tuo0XiuYEzkPvSeg/IIod36/dcnCbKOFU97ntOZAvvvH?=
 =?us-ascii?Q?2nfnQVQjGjWojqijb+zOEgxbtbtcOAAV0XOmbywdAzOpv1+DzENs7SltuN/Q?=
 =?us-ascii?Q?LtdT7HQqWABKpBrbs+tJpG7RCBYRH8JBNJF1ro2nDfmIg+usvAbcCuc5PItI?=
 =?us-ascii?Q?VGVLD9CsgFOO9l45BzhoVN8arg/36NBQghMRHdnSWNy1AsFpGfa1Azar40Ki?=
 =?us-ascii?Q?7yWyc0VWDTo53eJC83IKv3yqt4OsusBg5kG+hmY7twGxFba25GpKCmf8CDBJ?=
 =?us-ascii?Q?uLAs53F9EGwAVCxtJlwQp+k7OgozW3LcK4z6VC7mq1T1Xq1839e3vl4Atxvw?=
 =?us-ascii?Q?ZMKYpqDi3+Irb0mDrTZze2zXCenWOxqIT351/hbo25qK2zAE3XArceQ2vJ6R?=
 =?us-ascii?Q?MRyBCTMf8ITxcFf5C9z67KlP2g2/fpyH2NYDk7+oaliHizI8Dm7n4JbqI+q2?=
 =?us-ascii?Q?aVVb1y3Iy1dHutuKQXs5pAPS9X9e49Rr4oPQThoVZe2DOzcMvzIBDVZEo4w+?=
 =?us-ascii?Q?smpoVggi+WGJ8QYsiaHD5muVXAEZc6cgonh6YrAesNVS/CJDG9jWd7NqP/Mg?=
 =?us-ascii?Q?GiNpHjtWiOBZC3MeeqtvPCmvoYfchkL+kBnqMKm/UIAzX+nHHzZp8LAjtCGe?=
 =?us-ascii?Q?t9gytOGtgwoTilWcKWozXuIzbRHaBwfRNPjWu6TfTzeFqj7NPHFrEHpbSCcR?=
 =?us-ascii?Q?jvVAifQj77CjfrIEFrhP9Qra6vz/a2Afp+g0vrPDN/gTTr0bzUTrp3ddvhN5?=
 =?us-ascii?Q?7gXAXsJwVTuaajqir8tybzzXtIB2G9k=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c91e67-369c-49a3-a7d4-08de5a56523b
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:06:32.8567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQWdonKix+Or1SOG3TdmIQQfjAQMA6COMjDt0EjocvbabfQM2Q9xVGWvKU/jF3sxuwBDKCoRidR87Y3m9Ej61A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51399-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4ae00000:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid,490d0000:email]
X-Rspamd-Queue-Id: 0671172335
X-Rspamd-Action: no action

Add neoisp device tree node to imx95.dtsi and enable it by default in
19x19 evk board.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts |  4 ++++
 arch/arm64/boot/dts/freescale/imx95.dtsi          | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index aaa0da55a22b..9fbf22a57dba 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -511,6 +511,10 @@ &mu7 {
 	status = "okay";
 };
 
+&neoisp0 {
+	status = "okay";
+};
+
 &netcmix_blk_ctrl {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index e45014d50abe..03c7f3de6e9c 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1765,6 +1765,17 @@ smmu: iommu@490d0000 {
 			};
 		};
 
+		neoisp0: isp@4ae00000 {
+			compatible = "nxp,imx95-b0-neoisp";
+			reg = <0x0 0x4ae00000 0x0 0x8000>,
+			      <0x0 0x4afe0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_CAMCM0>;
+			clock-names = "camcm0";
+			power-domains = <&scmi_devpd IMX95_PD_CAMERA>;
+			status = "disabled";
+		};
+
 		usb3: usb@4c010010 {
 			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
 			reg = <0x0 0x4c010010 0x0 0x04>,
-- 
2.52.0


