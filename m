Return-Path: <linux-media+bounces-26090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF033A33040
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 20:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 530CD188BE8C
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 19:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA01201264;
	Wed, 12 Feb 2025 19:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="aomLT5fR"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2110.outbound.protection.outlook.com [40.107.92.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F60E201023;
	Wed, 12 Feb 2025 19:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739390261; cv=fail; b=IH3xUJ/SF7/6OIgrKryvfNqCf+kGQtRwverK4IzVdIMggVbNrmHBDyts9fzb7j8mvFPATM5NCFXInrN1HbvEHUCfF4/6r4qVLMtsGzkwI2hG+7ANeZMAvWysmRT5IjaYKgK1vC1FAzYWErtj4l4h60pL62MuUSIWGrRUboHtnOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739390261; c=relaxed/simple;
	bh=O64qX3wYeTFiWq9BHqvTsCWwGDIGdEe1xJr8D9SeS+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TgVLNli53EPOlkqp8Y+iyi4OFbRSOMA98FyMK0ElJ05+8HYCI7SipbWEEiRI0MMrqdV5jMVvmkE+B4dWIqmojccKl5nmUhMLirk99ZnNcQYbmeRLoumMTZkzgnKn5f8lJEcABiz3NozIMFba/2L8OMbJji7apLdhyEVQz05oSF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=aomLT5fR; arc=fail smtp.client-ip=40.107.92.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNCd2luNviWQ+dPFQiqfiqHWtYGif1q/kiWoEbzk5fdbW6nmMTxuuLnmutDSG6z1iSyOraFQgS9BnnBkcF5D97HfYmMtI7yvHfPxjrF2ltOW3/ckbgCorx5+dc0T13/Nj+3hF5oyzOkMzxRBDrPyz/x2G8j1pKaZVJlq/Dv/TLB1MBPI7CigPoyezX3aXGE0cKOcPxvtleIjrlXRckM/YBpFp+ic0ThEBsacxoFAHgHa6mghjCcbTY6QbHVJSNhIKOGrAIxUzkaKwryW1+rDz8uQJWml+ugKpsOmmv0PdNpXhDiyE7cFKFjU/zqmewjoA5VtxRtczRb2lsBuC/6P7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+1KlPytuSokHJ5nbMH9kGQ2KJcc2UPradwkLoPOBfw=;
 b=mGFccQlVJmhdIa1Eo3jxDK1bqiGaeaCbcTfeZ18fCiSpKUHtFrJ9u/CNfZ8VCumFpl+HfnW1CbZ7Z53tQJDYQ9H0pV87EAzW1PeinwTucJvDkK2Ajv7fd5nJRPeyZ2AkY6wIhb0BPEbU0doHdDXTmOoRsp3d3wFfEXSfnNe783cMlS9FjmL4kf19PN1/woFfw0pTSRlnZI/h5B2TxEAtlFVcfvxUxwfeHJF5yuIH8YlfPS3Tz1hKrWWfPsXf6w5lk4Ph/27tiOa3vL+pVVSDbPs2sgfZMemDlfQ0uIOX9QAJMTYuA1Mr29ss58Cnsj1wMcZELxmx46MUOSwUO9FSZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+1KlPytuSokHJ5nbMH9kGQ2KJcc2UPradwkLoPOBfw=;
 b=aomLT5fRMSatm0YS9KmEfJjtIpTRdnBCrgvHV+JJYn/2LFUU5eRg0Im4b1wAdokvdsfeAHY6V+Mq7thOL9EyVzThexe8LrmVJD7B8ptGqkdyVK97fywYORIil8Z4TSssklqilQk7jTwIPbIMEaOVCnzf353h0MtTXuIXrqth5Eg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from BY5PR14MB4194.namprd14.prod.outlook.com (2603:10b6:a03:20a::7)
 by PH0PR14MB5496.namprd14.prod.outlook.com (2603:10b6:510:14c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 19:57:27 +0000
Received: from BY5PR14MB4194.namprd14.prod.outlook.com
 ([fe80::8455:2eef:6470:1665]) by BY5PR14MB4194.namprd14.prod.outlook.com
 ([fe80::8455:2eef:6470:1665%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 19:57:27 +0000
From: Sebastian LaVine <slavine@d3embedded.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Achath Vaishnav <vaishnav.a@ti.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jianzhong Xu <xuj@ti.com>,
	Julien Massot <julien.massot@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian LaVine <slavine@d3embedded.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Stuart Burtner <sburtner@d3embedded.com>,
	Tero Kristo <kristo@kernel.org>,
	Thakkar Devarsh <devarsht@ti.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Will Deacon <will@kernel.org>,
	Zhi Mao <zhi.mao@mediatek.com>
Subject: [PATCH 4/4] arm64: dts: ti: Add overlays for IMX728 RCM
Date: Wed, 12 Feb 2025 14:56:56 -0500
Message-Id: <20250212195656.69528-5-slavine@d3embedded.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212195656.69528-1-slavine@d3embedded.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CH2PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:610:4e::25) To BY5PR14MB4194.namprd14.prod.outlook.com
 (2603:10b6:a03:20a::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR14MB4194:EE_|PH0PR14MB5496:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ea9647-6667-41b0-66e6-08dd4b9f79d7
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?y7MNi2a2WU5kwwPY5xbazaugCcbMDEsN5/HfkYzgjh4Jw06c+JtfJzjPqvHU?=
 =?us-ascii?Q?EBAbTNwntbOwVOZx2N2NH9wCw2wb9PPVirLkKX9M/hiQBpQaV0R3IaEBcB0B?=
 =?us-ascii?Q?pT3GN+TaPC2GBZOBfiJd6cyQXl8TqvO5Jchb1fcnyZ9f+KiS5PPE8lq3A7Uq?=
 =?us-ascii?Q?EhjqosO5jh/2XrEw1qFG9a2ML983y56q13Srqq3LEUJMN2MWlhW5cEn21SW6?=
 =?us-ascii?Q?ivRi4SMhllPP8BBt702nHpdEjqEhkgkMXxemLWaLFKGIszu2EISrtva4ZJFG?=
 =?us-ascii?Q?yM6yn5RidNpcjdEumxh43/JwW2eza2pX4+gYeyGloNg8oY+0L+rb7dU/ybWd?=
 =?us-ascii?Q?TdeaFRqtTNegIocszXOZpbK6TFCAgznSIj6B3qjdUTdOP1YZT5RtXzeQwg0A?=
 =?us-ascii?Q?n2aeqW2OpJQbsVoJRiQXJPid1nyXfaZO4f7MpV7mEQGuk/8HlP9sAJKigUkt?=
 =?us-ascii?Q?MpwEtQSBWFuq4upBh2icklV3UQZlwmX8oSZic4u79M3qQ6kHPq/p/9OReoFF?=
 =?us-ascii?Q?V3WUAZ/oU2JKoaJfzHE7ABS5nuVMGempA1IrYWdxKqtSPUnBDBKOSDcqOgAR?=
 =?us-ascii?Q?RMAx0P6KKRx8nD+voLOYhb0S0Fe+HlP9Cxn7hESxZZrts+qmChmA2w1Uh3Rr?=
 =?us-ascii?Q?jWfU6PHMkm7g3qMVBu5ZabnZZjzObt6b4k9FMcCv+mXnguxx7cEkRGodEK+a?=
 =?us-ascii?Q?kYXrw5eEMhyvgKllKeVDANdLRf+rBVSQ903V/kk6fijoXKrftHHbRGQH3VXv?=
 =?us-ascii?Q?CnB/cRcY/OCClyfV2hZVi6C0BvcaaZBNKjWI0+lYnLE6P/qUOI5y2Scg3zAN?=
 =?us-ascii?Q?GeFuuK4fcrM+CMb+AHSEGKcJwDJFirdXEJTjwGBy76By2ksO6UaY9MPBjOnz?=
 =?us-ascii?Q?sl6qWhpVOvfdBznA9hgYI7IKkNNBsL15P5Pl7STa61jdI30bbxzrTCVI0vXp?=
 =?us-ascii?Q?25PovPGnKCozL/PGJtlBGfnk6if3Pbq+9gLXKzZ0GWg4QKpTcz20mbCqENdf?=
 =?us-ascii?Q?tV4WMdVpPYe4lutpkR28SfY0qrUBAw70Y6H3JQy8nZUT1GmrA17SV5X+TW92?=
 =?us-ascii?Q?3RoZU/VhzG2EOkkmjhJWBjT6BE82C+XTBA2jBDj4goZAKVLDqjQUQfLyFK/s?=
 =?us-ascii?Q?9F9Y79ywoBLkh0qjNJxmja1n8EEL9yqyIMSS0osHKpdqgPgAuacm1cJMUIsS?=
 =?us-ascii?Q?ZfpvBHB8oLDCKUt22zJTpy7xJqKb3RHNntbDrTOTq9/4SNjD6Xwtjxsy2U1B?=
 =?us-ascii?Q?7bk9tL883+1B0bjJytcGe0j45m1lA453qvf6Dja245b8qHWzQTEWPTq8ONBc?=
 =?us-ascii?Q?ObDgVEaznloaeAmc0XNPZ/Dt?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR14MB4194.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?bF60wMX5ilMNlvwNZr4rcibZvatmhd0Dwjf/YELeomAWAF34/Hin/8zs9r1X?=
 =?us-ascii?Q?AIp3kZtenO4jB2ztBRX7gE+m27+UorAA5o5jQWAlop0r1wFiwr8Yc1jKXWRM?=
 =?us-ascii?Q?wgfGIpT26EQ+EATqPDNPPPn0VYG5zXHWyeTBSuf5VMwRF6M4rKfbBmENZ5Au?=
 =?us-ascii?Q?dmMHI8ukKCjW6lovDluexNrES5GV4J6Hfa9of9Xg9iT6YqVa3WoW9Jbojc2D?=
 =?us-ascii?Q?Ys1Z4GWy7Q/3d9/W6hW9GWbVM7mjwmrIToG/74LlSIOt3pLcX5hZT+OF9D52?=
 =?us-ascii?Q?qJDdM4BGLBsq3PCWaLpzkqjBu1F0lD043fpiIX3QMSyC4PQraTzrAMA7EzE+?=
 =?us-ascii?Q?/L/lm0T1R7Jc8UuxHv6WZqxPzeaIoGBmu1g7pMMxm5BUMwj4lAOefoKaPuOA?=
 =?us-ascii?Q?P0/pb//Aflgcp4RuR0IPrX8OZoPXbcHuizTOTMcJUw66HjC0TpjoXVxE5SQ+?=
 =?us-ascii?Q?0PU8HC0ccXsUFUFR7VeyDNGCkqIX63QK5RSxGFDxHoK0pj1pYWknr53R8jIP?=
 =?us-ascii?Q?8nGwzioix7c384scp2gBaYZxnLKLjLzFtGRbi7VDV7OgZAN4s4viTeXADucu?=
 =?us-ascii?Q?wIU3rfRTlGwWtNsbIAJoFMjnYLCFdRac79fajUyi+CdyhVQ4tLQjjcx7DUpd?=
 =?us-ascii?Q?AucF+A9suvEdS9xpijHMWuv57awkgtNJ71Uah2uS2k7gnk9IXJQ5vTGHSodK?=
 =?us-ascii?Q?nvUZjV25y+EDs2e1Nt6PkOT6PZvEvU043P9whB8nmMii9O1BOnIhBpKq+miG?=
 =?us-ascii?Q?RAQ2mmZ1LIEMRUEc9UOVeubZDm8KJlLPRIvJHGHY4qDkO8HerEpCA9i9L4LJ?=
 =?us-ascii?Q?R45eV+kfzXh3lTjX3X0s7frQTOH2YXIH7l3gkaoHnik5etLRjnEw/JcpeiC2?=
 =?us-ascii?Q?NMiHZW7tc6cpnoAfh6r378tbpN7K7m5kYXsWsVs8lcrJmnb9Gt2MW7m3cKw6?=
 =?us-ascii?Q?FnnOY/RSI4T2A476m5zTP6U8Fs1a2CFpW+/7t21UsoHNrogVSQqshqlOcGVS?=
 =?us-ascii?Q?iguZkkILHsu+3VIr7ju83ZicZYxcmU5nRWvFpNf2VbwO1q8ChK62JhLP6z9G?=
 =?us-ascii?Q?f4+VW6RiGTKe9RF13gZaYPEp78lz+ETmuT5fj6ELZYDw0/QCt3aE/clHHnei?=
 =?us-ascii?Q?GH9M+73lK3Dl6NE5ctr8Ak2d3w9gyb5Ef+L53sSKLT8IchSk3EOPZa6AFNf9?=
 =?us-ascii?Q?gWTBe/YnjFLLAu5iVafr08H+/OrxIO5wj3eBo38irYrkANpuaPYr3sS87QmC?=
 =?us-ascii?Q?QR2NVfSb79+9PbQ7VJMRdtq3dj43uGagxXatViXlUFJ8VE7rXWcPoGjiRPnb?=
 =?us-ascii?Q?Q/Ug5ykMPsjYu6UFPqivpUaX+pCOp/lQUx4mFJ5upcrfBtsB1sTMCcThS2VV?=
 =?us-ascii?Q?bc39IQigAivoSyiJbdRQwQFvBvBvtEliL0AR1UGiTr2Wb38N8xka761+WeQf?=
 =?us-ascii?Q?b1aDch1E/rLqoxP8ioo+Bx4NK6eNe30SD6PO7NJaHNrBwwpir8pKxVfjxguL?=
 =?us-ascii?Q?MnDTrhGImwShsclMdgiiDVLIv6j8mlqoGhx0adGUT3nAlR0DGMBli8fjKmU1?=
 =?us-ascii?Q?GiE787Wp7kvs1yDku69k6S0o9EOWo6hej5wVNXnRQM9DRiCwll9I8I/vKcJH?=
 =?us-ascii?Q?ug=3D=3D?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ea9647-6667-41b0-66e6-08dd4b9f79d7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR14MB4194.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 19:57:27.3955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5nMEYj1Z8W/+Ps04eZnGOD/lR1rTjwm0oFlhAeEeIUEtu5gU93adZ4BmTIh4IREwISfVVmcTXtSgwxuvr4MPoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR14MB5496

Adds overlays for the D3 IMX728 RCM.

Only a connection on port 0 is currently supported.

Signed-off-by: Sebastian LaVine <slavine@d3embedded.com>
Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
---
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/ti/Makefile               |   3 +
 .../dts/ti/k3-fpdlink-imx728-rcm-0-0.dtso     | 108 ++++++++++++++++++
 3 files changed, 112 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-imx728-rcm-0-0.dtso

diff --git a/MAINTAINERS b/MAINTAINERS
index bf6a48da0887..f109b5dc8fa5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21891,6 +21891,7 @@ L:      linux-media@vger.kernel.org
 S:     Odd Fixes
 F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
 F:     arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
+F:     arch/arm64/boot/dts/ti/k3-fpdlink-imx728-rcm-0-0.dtso
 F:     drivers/media/i2c/imx728.c

 SONY MEMORYSTICK SUBSYSTEM
diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makef=
ile
index fcd8d11e5678..6c8bbea246f1 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -240,6 +240,9 @@ dtb- +=3D k3-am625-beagleplay-csi2-ov5640.dtb \
        k3-j784s4-evm-quad-port-eth-exp1.dtb \
        k3-j784s4-evm-usxgmii-exp1-exp2.dtb

+# FPDLink Sensors
+dtb-$(CONFIG_ARCH_K3) +=3D k3-fpdlink-imx728-rcm-0-0.dtbo
+
 # Enable support for device-tree overlays
 DTC_FLAGS_k3-am625-beagleplay +=3D -@
 DTC_FLAGS_k3-am625-phyboard-lyra-rdk +=3D -@
diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-imx728-rcm-0-0.dtso b/arch/a=
rm64/boot/dts/ti/k3-fpdlink-imx728-rcm-0-0.dtso
new file mode 100644
index 000000000000..97631184ff65
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-fpdlink-imx728-rcm-0-0.dtso
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * D3 IMX728 FPD-Link 4 Camera Module
+ *
+ * Copyright (c) 2024 Define Design Deploy Corp - https://www.d3embedded.c=
om
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+       clk_imx728_fixed_00: imx728-inck-00 {
+               compatible =3D "fixed-clock";
+               #clock-cells =3D <0>;
+               clock-frequency =3D <24000000>;
+       };
+};
+
+&ds90ub9702_0_ports {
+       #address-cells =3D <1>;
+       #size-cells =3D <0>;
+
+       /* FPDLink RX 0 */
+       port@0 {
+               reg =3D <0>;
+               ub9702_fpd4_1_in: endpoint {
+                       remote-endpoint =3D <&ub971_1_out>;
+               };
+       };
+};
+
+&ds90ub9702_0_links {
+       #address-cells =3D <1>;
+       #size-cells =3D <0>;
+
+       link@0 {
+               reg =3D <0>;
+               i2c-alias =3D <0x44>;
+
+               ti,cdr-mode =3D <1>;
+               ti,rx-mode =3D <3>;
+
+               serializer: serializer {
+                       compatible =3D "ti,ds90ub971-q1";
+                       gpio-controller;
+                       #gpio-cells =3D <2>;
+
+                       #clock-cells =3D <0>;
+
+                       ports {
+                               #address-cells =3D <1>;
+                               #size-cells =3D <0>;
+
+                               port@0 {
+                                       reg =3D <0>;
+                                       ub971_1_in: endpoint {
+                                               data-lanes =3D <1 2 3 4>;
+                                               remote-endpoint =3D <&senso=
r_1_out>;
+                                       };
+                               };
+
+                               port@1 {
+                                       reg =3D <1>;
+
+                                       ub971_1_out: endpoint {
+                                               remote-endpoint =3D <&ub970=
2_fpd4_1_in>;
+                                       };
+                               };
+                       };
+
+                       i2c {
+                               #address-cells =3D <1>;
+                               #size-cells =3D <0>;
+
+                               sens_exp: gpio@70 {
+                                       compatible =3D "nxp,pca9538";
+                                       reg =3D <0x70>;
+                                       gpio-controller;
+                                       #gpio-cells =3D <2>;
+                                       gpio-line-names =3D "IMG_RESET", "I=
MG_ERR0",
+                                                         "IMG_ERR1", "IMG_=
GPI0",
+                                                         "IMG_GPI1", "NC",
+                                                         "NC", "NC";
+                               };
+
+                               sensor@1a {
+                                       compatible =3D "sony,imx728";
+                                       reg =3D <0x1a>;
+
+                                       clocks =3D <&clk_imx728_fixed_00>;
+                                       clock-names =3D "inck";
+
+                                       reset-gpios =3D <&sens_exp 0 GPIO_A=
CTIVE_LOW>;
+                                       error0-gpios =3D <&sens_exp 1 GPIO_=
ACTIVE_HIGH>;
+                                       error1-gpios =3D <&sens_exp 2 GPIO_=
ACTIVE_HIGH>;
+
+                                       port {
+                                               sensor_1_out: endpoint {
+                                                       remote-endpoint =3D=
 <&ub971_1_in>;
+                                               };
+                                       };
+                               };
+                       };
+               };
+       };
+};
--
2.34.1

Please be aware that this email includes email addresses outside of the org=
anization.

