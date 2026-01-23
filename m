Return-Path: <linux-media+bounces-51393-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE48DR0sc2mTswAAu9opvQ
	(envelope-from <linux-media+bounces-51393-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:06:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 196DB722F5
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6B753008D6C
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 08:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BEC356A11;
	Fri, 23 Jan 2026 08:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SfOKoTe+"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A1934DCFD;
	Fri, 23 Jan 2026 08:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769155589; cv=fail; b=Fcp7Pv1JAn3UBZ0Ot9XqHpmBKiHOM0HLgP9LPQqaOquQCJj+3yJNFOADdJoKJ5EkOkI/1cIYkWXuFeHDUYSMvsm7eR3VCLLBKODEiIHcj0x7Q+kWxb5ZpjuOroduiibhDN8lFcKYJPXy3iIXmUa8lK9JoRV5omUWo68Hr8cS7wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769155589; c=relaxed/simple;
	bh=Fz1b+9/Z3zba0mBQEwBcvkFi4Wn8xHUqmeJPFm5vM0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A+2Iz8OGPn3HKCPH5l3izqkUQv2TbyyHHOjynDh+cjA8fHtm5W3ZYzq0N5yVwWY/yTDfGSB6+V/9H/kkafkkOO/oqtBdXIqzRTNV3DjKfwMZGzJkBPyPjzC4Pp1klraggdtv3o0T5wGFO3uW0rVc9R8nHJ4AoXmibqX4JzUcrdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SfOKoTe+; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZP9SigOYf5r2K+nq8RjEJ9EPYDXl8wwsBSsiyB0XxaTcnanuybEQIRK2poJBQAkVyKLBOdii+dUy7i/gKXybDkF8gGi8iL4Cudt/7MIEIfnZfWfM9cO5exMR8oCryNXLpLC+bGsM9rVTCh3BfmPq0KgyYPLW5PDQlmspGbKHGZvgi8S58BNgdlRCPtmNcYDnEcQsNXzGSWRlP1PvITlrApjxEC6nRttFJpA8qkfwnEUG+b7KtzJLDa44q0X9MveA7zHAE9JfKHC45a8rnp+MqBICSh9jonaRen6kjjUAM7S3D+afSQs5rG5tZuLWhEvt2qcGQ7UG89v2s9zRUIevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IveoOprG3oUjHGXJid12Av2zpWUXRu/uEj2s0NVOtrQ=;
 b=lWR5V+lmFltVSl3KPpT1g5YrzetFZgiMhG3OvVB3RPhFUTLcs4gaQt6F1veJWhvoeDdgB4cHkpqySN8Upm3HquV7kG3Dnh4L+yo2MUZ+yXHJ0s58vvVCOGXMOA5Dxar5jJ4N7i90wes2s3MTiOzrJCm+eHa7ZGnqmt2ZECkfEeM7qtVIDdCnJL+MFRuwXsGgxgvcXdlDO3RKJqyiL4/U/Dk2LrKd4joJFdt3VTNfl+FpfPYaGVOkT/HvmIKiZejhbeT9rFJruokEMw5aUgR/sKssA5t365XaHF83yB5mrXkCVC/fD0kANLXWtdgSo5H9vuJHe8lislYf/LfPj158bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IveoOprG3oUjHGXJid12Av2zpWUXRu/uEj2s0NVOtrQ=;
 b=SfOKoTe+SwK3QhhJMECn67yXa1MXx1RLadj0dOJgaj9GipcdWXOIFFMKVX1gcuxDQ5EOR40dSgmqdOe3Riy4DpPsq12oYgtTR+M8kyR+UhD2pmv2EFXPAMPAHlE6en+nEGFNwzFG3v0xenifttHxoaEYghkEqf+xqb9jXzInWI76jiTM6Pqd0xOSTQFaG2DDPm/qlNx+aCvmigbi4GHNGKbu0YB9bq2FzzJKdZdCobsqYHWP5MAj5A/nMG0z9TzpzCoZZolJQHaGLCFH/VMLCk40uRmUOlFuQqBTqpv5/GXkDOml9aI9faN9hiFKY06Upb8o+kvIU8irvXV7mvS8NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by PAXPR04MB8624.eurprd04.prod.outlook.com
 (2603:10a6:102:21b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 08:06:22 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 08:06:22 +0000
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
Subject: [RFC v1 04/11] media: Documentation: Add NXP neoisp driver documentation
Date: Fri, 23 Jan 2026 09:09:31 +0100
Message-ID: <20260123080938.3367348-5-antoine.bouyer@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: a083b261-5c9d-48af-df46-08de5a564bf4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?0X/us+BGRWJFdtqqpOw23phR/3bBRIdtG6/cbRQTGVC9cna+kOw/bUU1rP/9?=
 =?us-ascii?Q?7DZd80tHM+aXVbfGqPMMiDAUOtr+x+QXZ8r3AJKc8uGfp9ZRAe2G3dle58z8?=
 =?us-ascii?Q?PjkGRfkqE8giQlnQBpOzVKS/UWbe7f+wwYzBLcJnQhOUFPhvqUV6ErrTnmzY?=
 =?us-ascii?Q?gK5vi572zA46bjL3DHADg9gjndsqDVu1y4X+xV/efVX3ALisC+66Y9B+O4/m?=
 =?us-ascii?Q?PiYeg7XPDlm5ChVApz9L7H3ZVhBuIaR9rWT9thsHZ+Ll0pup1/fufIqxCDrX?=
 =?us-ascii?Q?5+sy5Li0cluAi8V6QvAgbzDxt3pDXALOUl4Lf8nzRyA2aIP1LKowj5saGjbs?=
 =?us-ascii?Q?eOrHTmGxG76Lt9K41j+QUbroNNFaMcR2Ock0gceAxxhPc6obxOGkUvblKt8O?=
 =?us-ascii?Q?JlrFgM78iTLcO1AKevnKUKpv0l0soua3+l8b65PaP31yA70Nv9wAJX0gLndM?=
 =?us-ascii?Q?nWaWWqJSMcQRlEROF/UrJrCfcaSc6xXVZaEmeXVJNPdDk2exnKwPxj4G8OTJ?=
 =?us-ascii?Q?o38ZMM2EVMcvfsuKZGtLR9HopXS/DmH8d84Ft2T/hHLGQFwm7THly5Epc5IR?=
 =?us-ascii?Q?2ADVSOxzyVjGCODs80U+fAM6Yhq3zK908CCtHtypJO2iUdFPsuBjHqTBASpu?=
 =?us-ascii?Q?Ny1yTJ+l9wGR1u/XY+jsJsXSHSGVn4oBxOsutSZ6/f+dhp+wkAYsSMzxuL15?=
 =?us-ascii?Q?+MkLTM4/L58ziKJW34jwSYrlwxi4m9hajQX+brMP8Sry7XAyZ2PTo+0zl3Ay?=
 =?us-ascii?Q?/ySZIRMB4F5n/gLK4lo4RR3W5rl9v+64elSKvJVMKf0dKUTwTcTCt+Mv51f/?=
 =?us-ascii?Q?gmtkH146kGJnlESuSGbOvbAZmUpjzSCjZI0IPcBi/RLfjiw1qjUOnXoyUNtR?=
 =?us-ascii?Q?e9XO0NfKuB1e4Oo8W+N7JGN52mvj812eVAINUJ4hItHwgH/10Abk1ba745LO?=
 =?us-ascii?Q?dQjSC9fee1xp5T6zcuU2EE8i5CLfDjKwTEGu6TnFAvuU34KrBZDx2jK3OhpR?=
 =?us-ascii?Q?EtggLVzwGBN6h916nmvBQsOFM7IBbyzhmYPbBLrEidxikE/lLTU7H3YSMEy2?=
 =?us-ascii?Q?/3Sj5PT6fKAHjQvdJZjxSzv0yyyRWrZJ+RgXXZeAO5rH6owGf/OavWljLXT8?=
 =?us-ascii?Q?hj0XqyC6dGScXkLDXQggdNfptc1muW89Oj21XdtYWTtkcpSHr0qmkEqgIAqx?=
 =?us-ascii?Q?IdTXvlN/TpPz2ZUJ8Q9IMcWGY9AgtGj2b279QRCGXSne4iucL8NkgbX2G7Ik?=
 =?us-ascii?Q?DBPpXsbLqQtrFhy0WV/vp7RBicjbTlm8ApEsIHPlcQL3IAn3e3iv665YTCZA?=
 =?us-ascii?Q?p8rooj+1QT08Z1Mcsob9QvHzqvI3xfKKpeiiGZ5UPv6zQYtZxfvftgOg/5ij?=
 =?us-ascii?Q?XPVWZwU1dDqyarLTQcTJSouycktUy/G83Hl7NI1sdRbpf/JORkfIDPCPLNMO?=
 =?us-ascii?Q?/A0RV0HMTyUUDtxBowsrYcmB1Dlev9Pw4F1CGAvOxesrYOLU5XxSMpI+3B2L?=
 =?us-ascii?Q?6ljCRh9sUaChyaLZPx46uCKm6/T+hGkvCaqXEm85tbCgBntp0yLUl0vOTGL/?=
 =?us-ascii?Q?gRjz1S0F0keB9Lfh3pSM8Z6SqBr9994TVyOp2YgkxpzQoAbMTHRm4sG5pGHi?=
 =?us-ascii?Q?aZ2Pt337A352TyMqCPZ6ii1YP3V2PUCPUet/4MAGOiEt?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ZuodAPOxc6x3yCCUp0+vm7WM5rPIc5W+eY8K8D1xVOjj+ewt0ysIQ6wYoD0X?=
 =?us-ascii?Q?j6++5fkKQycmdY2pCt+9hc5ytUYN5q4KPn82zQLRrmbmCWnh5m5tYEbwGlUL?=
 =?us-ascii?Q?G/TCP0SZ1civ2GLUr2LHNvdsPovmwTTz6dZWqJVNQDqj/KY8hbH41S4J4CM+?=
 =?us-ascii?Q?PnM2zUGD/lXodGTWS6Ello9gEZa5FaBs4uvOQt3ht7TzNfntGBWHO7ngMsaF?=
 =?us-ascii?Q?MbL3E8vI1OR5IAtJlVQ0uRhJ8PCNm22Qt4MAANc+53gn+eiRSXe8ifSQ/dZK?=
 =?us-ascii?Q?o5aXBb/tcyAhjBMbFLwxxHBjLwvMf7fLPPutNvc9ziuXbbS3Z2AsTFSRbBUV?=
 =?us-ascii?Q?NNNhP2yr4ADvTD7f1eCI094a+SRp53KZwwWvqlfNqqRjB+qT9uVkHgZ/hIqU?=
 =?us-ascii?Q?s2tIQoFdA3LbBpXi25DzU9WRx2WDWFW1E8DA2vqM/UHmkeaDKRmA4wyUuqh8?=
 =?us-ascii?Q?LdOJQWTtZBKzrw4+0f+vyHt+YM8IFPGDEUV523hg/hHKnEf1HgE2mjnslmqa?=
 =?us-ascii?Q?7GO7RVDa+EnQ1xSs/PiV61ekYVhT6x1zlLTtRJZQxGHMYZ/wvoVY4OwTmMS/?=
 =?us-ascii?Q?DRM6wrWntRLW3Shvyf1mHcXLgKZ3PRME/pJqaULkn4758vCe5+B+cNVstnzA?=
 =?us-ascii?Q?jX8jxX5LX1BXy+3cBi1XO3Bj8dDpgEVbo5Br97muJz/jUTz4hWJXtDp5rrMq?=
 =?us-ascii?Q?xDEmqvZjfWqKN11I8+oBdqKC1SZ3ZtizdaLJoXZiDUNGoeeIz6k+D5+svdlS?=
 =?us-ascii?Q?DHzGZXh7aWGhWxPvIQYd3JcmYEx2hE0PhNS8N0Iz6jMpVxW5vbUB9JAMZFa5?=
 =?us-ascii?Q?C2bdFqOiKPIfkURSqCOm/TrCnzfEURhKXId5lWClica0Ls+kwJNRfUjw686i?=
 =?us-ascii?Q?qoRM6a53Wdp8zTtJILbP0ogXOzhGmCqPxDGy78AOPXgwZ6V8Tsbj+418xVEd?=
 =?us-ascii?Q?GTyR9k1nbF/AP/Fv+7YJ5yONi2p6KawgKBG0nMLueENY/GcO0ATDO2xvIN9G?=
 =?us-ascii?Q?mGiiYApbuZJ0hm0qwoRb1Kzv59qSpaNHJX4ODg1zO+jyG5/C8QMuAb8PzYWo?=
 =?us-ascii?Q?Ud3rCa79hWBFMs8V4ZMFA+mNvlL68ZQVgafqy1Fe0OW3marh/Y+8h60nlHm+?=
 =?us-ascii?Q?g2J9AuYsVsAzUPCJgDZLaZbXf0D+iG/n3zuJ+0nTZ2wDV03o/Lpnh3D5Mlpm?=
 =?us-ascii?Q?kNVHMXZMqFox/IF5Ak4nyRyv7ce1BX8gfz0dOmOGspdbq1w1FHlZUld2DDEb?=
 =?us-ascii?Q?1SmukuNugkGT+GSuTV4jTbNsLsfI7B0fEYw3FBdHdfXUvF5PrI5Xk+PN/j2S?=
 =?us-ascii?Q?4pBAX6Fx7rZAM7yPVSkuvQ9KeIXpoKnkgZvvniWm5aS9vhIyLUOFq1/NhX38?=
 =?us-ascii?Q?v3I28phAS6tsa8UyiaJzgDCespGYdl7GxVENUcqrszZYWKMuwlKxk4+x1l9i?=
 =?us-ascii?Q?goaQDPnIbmwnV/s74TMrL41LpeUPRtYXJDV4zfq45f89cdmJ2Gr6sbE9hbi4?=
 =?us-ascii?Q?Tqp6KZ80PSUabYWMgi63BOdGvxjCR8KjoZYf7TKTJX2YmGwCfd7wmM3tzaSa?=
 =?us-ascii?Q?f5xSdFenn6hkhXCkX9xmhG7IFU3iAIRaaJV2tmu8dvY2HHKChdEIZ4pvmCU6?=
 =?us-ascii?Q?fa1fXmoHNE8NE5G/CVpaiA8oAtEOfQ+xxthzYRDEoZ8vx9tAy75Y/gk6QGOI?=
 =?us-ascii?Q?UE45EubQx1z/2rHiMBVx4G+lrIRkbPZeJqm46dhiruizD7e/tYE0l4XyCSSr?=
 =?us-ascii?Q?SikVjx9wAQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a083b261-5c9d-48af-df46-08de5a564bf4
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:06:22.4417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dP/j/V1eAmDJbrAzajUtbZ9uQI2ugHAMjizFZ1JZCBFiRMQd7cWyHfRNmY6UZhuWkv+jyvcyue8L9mbpgLigew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51393-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,nxp-neoisp.dot:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 196DB722F5
X-Rspamd-Action: no action

Document the NXP neoisp driver both in the admin-guide for neoisp IP
description, and in the userpace-api for neoisp interface description.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 .../admin-guide/media/nxp-neoisp-diagram.dot  |  22 ++
 .../admin-guide/media/nxp-neoisp.dot          |  16 ++
 .../admin-guide/media/nxp-neoisp.rst          | 189 ++++++++++++++++++
 .../admin-guide/media/v4l-drivers.rst         |   1 +
 .../userspace-api/media/v4l/meta-formats.rst  |   1 +
 .../media/v4l/metafmt-nxp-neoisp.rst          | 114 +++++++++++
 6 files changed, 343 insertions(+)
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp-diagram.dot
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp.dot
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp.rst
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst

diff --git a/Documentation/admin-guide/media/nxp-neoisp-diagram.dot b/Documentation/admin-guide/media/nxp-neoisp-diagram.dot
new file mode 100644
index 000000000000..ac0d950bc1dc
--- /dev/null
+++ b/Documentation/admin-guide/media/nxp-neoisp-diagram.dot
@@ -0,0 +1,22 @@
+digraph G {
+  rankdir = "LR";
+  node [shape=rect];
+  splines = ortho;
+  label = "Neoisp pipeline diagram";
+  {In0, In1 } -> HC -> {HDR_decomp0, HDR_decomp1};
+  HDR_decomp0 -> OBWB0 -> HDR_merge;
+  HDR_decomp1 -> OBWB1 -> HDR_merge;
+  HDR_merge -> RGBIR -> IR_compression;
+  RGBIR -> Statistics;
+  RGBIR -> OBWB2 ->BNR -> Vignetting -> ColorTemp;
+  Vignetting -> Demosaic -> RGB2YUV -> DRC -> AF;
+  DRC-> NR -> EE -> DF -> Gamma -> Packetizer;
+  DRC -> DMAP -> DF[weight=2];
+  DRC -> CCONV -> CAS -> Gamma;
+  {rank = "same"; RGBIR, DRC}
+  {rank = "same"; AF, NR, DMAP}
+  {rank = "same"; IR_compression, Vignetting}
+  IR_compression -> AXIOutDMA;
+  Packetizer -> AXIOutDMA [weight=3];
+  AXIOutDMA -> {"Out0", "Out1"}
+}
diff --git a/Documentation/admin-guide/media/nxp-neoisp.dot b/Documentation/admin-guide/media/nxp-neoisp.dot
new file mode 100644
index 000000000000..abcc2dc9bb55
--- /dev/null
+++ b/Documentation/admin-guide/media/nxp-neoisp.dot
@@ -0,0 +1,16 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2} | neoisp\n | {<port3> 3 | <port4> 4 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port3 -> n00000020 [style=dashed]
+	n00000001:port4 -> n00000022 [style=dashed]
+	n00000001:port5 -> n00000024 [style=dashed]
+	n0000000a [label="neoisp-input0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n0000000a -> n00000001:port0 [style=bold]
+	n00000010 [label="neoisp-input1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n00000010 -> n00000001:port1 [style=dashed]
+	n00000016 [label="neoisp-params\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+	n00000016 -> n00000001:port2 [style=dashed]
+	n00000020 [label="neoisp-frame\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+	n00000022 [label="neoisp-ir\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+	n00000024 [label="neoisp-stats\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
+}
diff --git a/Documentation/admin-guide/media/nxp-neoisp.rst b/Documentation/admin-guide/media/nxp-neoisp.rst
new file mode 100644
index 000000000000..0632de6bc51d
--- /dev/null
+++ b/Documentation/admin-guide/media/nxp-neoisp.rst
@@ -0,0 +1,189 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================================
+NXP Neo Image Signal Processor (neoisp)
+=======================================
+
+Introduction
+============
+
+Neoisp performs a set of image processing tasks on the RAW camera stream, where
+the input camera stream and Neoisp processed output image are stored in DDR or
+any system memory fast enough to keep up with Neoisp processing.
+The overall Neoisp operation is frame based, that is 1 complete image frame is
+read and output pixel by pixel, line by line wise.
+
+Revisions
+=========
+
+NXP Neoisp hw revisions are listed in UAPI in enum :c:type:`neoisp_version_e`.
+Version is stored in the Media device information, hw revision field,
+accessible from the ioctl MEDIA_IOC_DEVICE_INFO.
+
+There are 2 versions:
+
+- NEOISP_HW_V1: used at least in i.MX95 A0/A1 SoC, not targeted for production.
+- NEOISP_HW_V2: used at least in i.MX95 B0 SoC.
+
+Neoisp hardware
+===============
+
+The Neoisp registers and pipeline processing are documented in the NXP Image
+Signal Processor Specification document (under NDA).
+
+The NEO pipeline block diagram is shown below:
+
+.. kernel-figure:: nxp-neoisp-diagram.dot
+    :alt:   Diagram of neoisp pipeline
+    :align: center
+
+It is composed by the following HW blocks:
+
+- a Head Color (HC) selection block,
+- two HDR decompression blocks, one for each input,
+- three Optical Black correction and White Balance (OBWB) blocks at different
+  stages in the pipeline,
+- a HDR merge block for HDR image capture from the 2 input lines,
+- a RGB-IR to RGGB converter,
+- a Bayer Noise Reduction (BNR) block,
+- a Vignetting block, aka Lens Shading Correction (LSC),
+- a Demosaic block for RAW image conversion to RGB,
+- a RGB Color Correction Matrix (CCM) and Color Space Converter aka CSC or
+  RGB2YUV,
+- a Dynamic Range Compression (DRC) block,
+- the Denoising pipeline (composed by multiple blocks for Noise Reduction, Edge
+  Enhancement, Gamma Compensation, etc),
+- a Packetizer used for UV sub-sampling or RGB packing.
+
+All these blocks are controlled by SW through registers. Some of these
+registers are accessible by the uAPI, so that usespace application and Image
+Processing Algorithms (IPA) can configure them through the parameters buffers.
+
+Neoisp driver
+=============
+
+Neoisp driver is located under drivers/media/platform/nxp/neoisp.
+It uses the `V4L2 API` and the `V4L2 subdev API` to register capture and output
+video devices in addition to a subdevice for neoisp that connects the video
+devices in a single media graph realized using the `Media Controller (MC) API`.
+
+The media topology registered by Neoisp driver is represented below:
+
+.. kernel-figure:: nxp-neoisp.dot
+    :alt:   Diagram of neoisp media device topology
+    :align: center
+
+
+The media graph registers the following video device nodes:
+
+- neoisp-input0: output device for RAW frames to be submitted to the ISP for processing.
+- neoisp-input1: output device for RAW frames short capture in HDR merge mode.
+- neoisp-params: output meta device for parameters provided by user space 3A algorithms.
+- neoisp-frame: capture device for RGB/YUV pixels of the processed images.
+- neoisp-ir: capture device for the infra-red pixels of the processed images.
+- neoisp-stats: capture meta device for generated image statistics for user space 3A algorithms.
+
+neoisp-input0, neoisp-input1
+----------------------------
+
+Images to be processed by Neoisp are queued to the neoisp-input0 (and
+neoisp-input1 when in HDR mode) output device nodes. Supported image formats
+as input to the ISP are:
+
+- Raw bayer formats:
+
+  - 8 bits raw (V4L2_PIX_FMT_SRGGB8, V4L2_PIX_FMT_SBGGR8, V4L2_PIX_FMT_SGBRG8,
+    V4L2_PIX_FMT_SGRBG8)
+  - 10 bits raw (V4L2_PIX_FMT_SRGGB10, V4L2_PIX_FMT_SBGGR10,
+    V4L2_PIX_FMT_SGBRG10, V4L2_PIX_FMT_SGRBG10)
+  - 12 bits raw (V4L2_PIX_FMT_SRGGB12, V4L2_PIX_FMT_SBGGR12,
+    V4L2_PIX_FMT_SGBRG12, V4L2_PIX_FMT_SGRBG12)
+  - 14 bits raw (V4L2_PIX_FMT_SRGGB14, V4L2_PIX_FMT_SBGGR14,
+    V4L2_PIX_FMT_SGBRG14, V4L2_PIX_FMT_SGRBG14)
+  - 16 bits raw (V4L2_PIX_FMT_SRGGB16, V4L2_PIX_FMT_SBGGR16,
+    V4L2_PIX_FMT_SGBRG16, V4L2_PIX_FMT_SGRBG16)
+
+- Monochrome formats:
+
+  - 8 bits Monochrome (V4L2_PIX_FMT_GREY)
+  - 10 bits Monochrome (V4L2_PIX_FMT_Y10)
+  - 12 bits Monochrome (V4L2_PIX_FMT_Y12)
+  - 14 bits Monochrome (V4L2_PIX_FMT_Y14)
+  - 16 bits Monochrome (V4L2_PIX_FMT_Y16)
+
+.. note::
+   RGBIr camera sensors are supported as well, and can be used through user
+   space activation of the IR block.
+
+.. note::
+   neoisp-input1 link is mutable and should be enabled in case a short capture
+   image buffer is provided to the ISP for HDR merge.
+
+.. _neoisp_params:
+
+neoisp-params
+-------------
+
+The neoisp-params output meta device receives configuration data to be written
+to Neoisp registers and internal memory for desired input image processing.
+This v4l2 device accepts the `legacy parameters` format, or the `extensible
+parameters` format.
+
+When using the `legacy parameters` format, the parameters buffer is defined by
+structure :c:type:`neoisp_meta_params_s`, and userspace should set
+:ref:`V4L2_META_FMT_NEO_ISP_PARAMS <v4l2-meta-fmt-neo-isp-params>` as dataformat.
+
+When using the `extensible parameters` format, the parameters buffer is defined
+by structure :c:type:`neoisp_ext_params_s`, and userspace should set
+:ref:`V4L2_META_FMT_NEO_ISP_EXT_PARAMS <v4l2-meta-fmt-neo-isp-ext-params>` as
+dataformat.
+
+When the related media link is disabled, the image decoding will be done based
+on the default parameters of the ISP.
+
+neoisp-frame
+------------
+
+The capture device writes to memory the RGB or YUV pixels of the image processed
+by Neoisp when the media link is enabled. If the related media link is disabled,
+the processed image will be written to dummy buffer and not delivered to the
+neoisp-frame video device node.
+
+neoisp-ir
+---------
+
+The capture device writes to memory the RGBIr pixels of the image processed by
+Neoisp when the media link is enabled. If the related media link is disabled,
+the processed image will not be delivered to the neoisp-ir video device node.
+
+.. _neoisp_stats:
+
+neoisp-stats
+------------
+
+The neoisp-stats capture meta device provides statistics data generated by
+Neoisp hardware while processing the input image.
+This v4l2 device accepts the `legacy statistics` format, or the `extensible
+statistics` format.
+
+When using the `legacy statistics` format, the statistics buffer is defined by
+structure :c:type:`neoisp_meta_stats_s`, and userspace should set
+:ref:`V4L2_META_FMT_NEO_ISP_STATS <v4l2-meta-fmt-neo-isp-stats>` as dataformat.
+
+When using the `extensible statistics` format, the statistics buffer is defined
+by structure :c:type:`neoisp_ext_stats_s`, and userspace should set
+:ref:`V4L2_META_FMT_NEO_ISP_EXT_STATS <v4l2-meta-fmt-neo-isp-ext-stats>` as
+dataformat.
+
+When the related media link is disabled, the decoding statistics will not be
+delivered to the neoisp-stats meta device node.
+
+Control
+=======
+
+To support additional neoisp hardware revisions, the read-only bitmask control
+`V4L2_CID_NEOISP_SUPPORTED_PARAMS_BLOCKS` can be used to query the list of
+supported blocks. Each bit represents the availability of the corresponding
+entry from the :c:type:`neoisp_param_block_type_e` enum. In current driver
+version, default and max values represent the blocks supported by the i.MX95
+SoC.
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index 393f83e8dc4d..5b6c71ae369d 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -21,6 +21,7 @@ Video4Linux (V4L) driver-specific documentation
 	ivtv
 	mali-c55
 	mgb4
+	nxp-neoisp
 	omap3isp
 	philips
 	qcom_camss
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 3e0cab153f0a..46268d955d3a 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -18,6 +18,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-d4xx
     metafmt-generic
     metafmt-intel-ipu3
+    metafmt-nxp-neoisp
     metafmt-pisp-be
     metafmt-pisp-fe
     metafmt-rkisp1
diff --git a/Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst b/Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst
new file mode 100644
index 000000000000..bcde8edcb441
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst
@@ -0,0 +1,114 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+********************************************************************************
+V4L2_META_FMT_NEO_ISP_PARAMS ('nnip'), V4L2_META_FMT_NEO_ISP_EXT_PARAMS ('nnep')
+********************************************************************************
+
+The Neoisp image signal processor is configured by userspace through a buffer
+of parameters to :ref:`neoisp-params <neoisp_params>` output device node using
+the :c:type:`v4l2_meta_format` interface.
+
+There are two methods that allow to configure the Neoisp: the `legacy
+parameters` configuration format and the `extensible parameters` configuration
+format.
+
+.. _v4l2-meta-fmt-neo-isp-params:
+
+Legacy parameters configuration format
+======================================
+
+When using the `legacy parameters` configuration format, parameters are passed
+to the :ref:`neoisp-params <neoisp_params>` metadata output video node using
+the `V4L2_META_FMT_NEO_ISP_PARAMS` meta format.
+
+The buffer contains a single instance of the C structure
+:c:type:`neoisp_meta_params_s` defined in ``nxp_neoisp.h``. So the structure
+can be obtained from the buffer by:
+
+.. code-block:: c
+
+	struct neoisp_meta_params_s *params = (struct neoisp_meta_params_s *) buffer;
+
+This method supports the Neoisp features currently available, it won't be
+maintained for future Neoisp versions. New applications should use the
+`extensible parameters` method then.
+
+.. _v4l2-meta-fmt-neo-isp-ext-params:
+
+Extensible parameters configuration format
+==========================================
+
+When using the `extensible parameters` configuration format, parameters are
+passed to the :ref:`neoisp-params <neoisp_params>` metadata output video node
+using the `V4L2_META_FMT_NEO_ISP_EXT_PARAMS` meta format.
+
+The buffer contains a single instance of the C structure
+:c:type:`v4l2_isp_params_buffer` defined in ``v4l2-isp.h``. The
+:c:type:`v4l2_isp_params_buffer` structure is designed to allow userspace to
+populate the data buffer with only the configuration data for the Neoisp blocks
+it intends to configure. The extensible parameters format design allows
+developers to define new block types to support new configuration parameters,
+and defines a versioning scheme so that it can be extended and versioned
+without breaking compatibility with existing applications.
+
+******************************************************************************
+V4L2_META_FMT_NEO_ISP_STATS ('nnis'), V4L2_META_FMT_NEO_ISP_EXT_STATS ('nnes')
+******************************************************************************
+
+The Neoisp image signal processor generates statistics data while processing an
+input image. These statistics are captured in a buffer and provided to
+userspace through the :ref:`neoisp-stats <neoisp_stats>` capture video node
+using the :c:type:`v4l2_meta_format` interface. The statistics data are
+processed by userspace application to produce the next Neoisp parameters.
+
+There are two methods to capture the statistics: the `legacy statistics` format
+and the `extensible statistics` format.
+
+.. _v4l2-meta-fmt-neo-isp-stats:
+
+Legacy statistics format
+========================
+
+When using the `legacy statistics` format, Neoisp statistics are passed from
+the :ref:`neoisp-stats <neoisp_stats>` metadata capture video node using the
+`V4L2_META_FMT_NEO_ISP_STATS` meta format.
+
+The buffer contains a single instance of the C structure
+:c:type:`neoisp_meta_stats_s` defined in ``nxp_neoisp.h``. So the structure can
+be obtained from the buffer by:
+
+.. code-block:: c
+
+	struct neoisp_meta_stats_s *params = (struct neoisp_meta_stats_s *) buffer;
+
+This method supports the Neoisp statistics currently available, it won't be
+maintained for future Neoisp versions. New applications should use the
+`extensible statistics` method then.
+
+.. _v4l2-meta-fmt-neo-isp-ext-stats:
+
+Extensible statistics format
+============================
+
+When using the `extensible statistics` format, the statistics buffer is passed
+from the :ref:`neoisp-stats <neoisp_stats>` metadata capture video node using
+the `V4L2_META_FMT_NEO_ISP_EXT_STATS` meta format.
+
+The buffer contains a single instance of the C structure
+:c:type:`v4l2_isp_stats_buffer` defined in ``v4l2-isp.h``. The
+:c:type:`v4l2_isp_stats_buffer` structure is designed to allow future Neoisp
+driver versions to populate the statistics buffer with future blocks
+statistics, and defines a versioning scheme so that it can be extended and
+versioned without breaking compatibility with existing applications.
+
+**********************
+Neoisp uAPI data types
+**********************
+
+This chapter describes the data types exposed to userspace by Neoisp driver.
+
+Some structure members are in a fixed-point format, in this case the related
+description will be ended by a fixed-point definition between parenthesis.
+
+.. kernel-doc:: include/uapi/linux/media/nxp/nxp_neoisp.h
+
-- 
2.52.0


