Return-Path: <linux-media+bounces-65976-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A17ZMM+EQmrj8wkAu9opvQ
	(envelope-from <linux-media+bounces-65976-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:44:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D086DC316
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:44:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=jh2potoc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65976-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65976-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C7B03033B35
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CEA4192E3;
	Mon, 29 Jun 2026 14:34:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013068.outbound.protection.outlook.com [40.107.159.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608BB3BED7F;
	Mon, 29 Jun 2026 14:34:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743643; cv=fail; b=coRX0SRFXM4FjwRA5HZ7VvNV7eyHsgFdrlCSZs45eY8ItedyQ98BAveWuTwcfDpbVCJ5DTnY3Bo/Vs+mJslRGZUA/y2nRS4CRrPIlQw4B2ojGQrIL1sTzVih6YKB2BWMDNE1yLD9qz8MZIBlv6Y79jMIcA9cYeRlbz5Av4JgyI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743643; c=relaxed/simple;
	bh=n/C8dwd6ucTluWwkibjtT8qzowRF9OrsVmVpQTLzqZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PrlLnRWl1sVOQXV/wijyV95Y5k+0YkwAnjdSooBT2OuEeYcFDEvX/UZSanj67MVeUwNPtb5s12J0jmszhZdVWW8DYcY2k4VTB60N7mxQQz4Sd0p863RM85Ead39vAH1XCTt52ISyxvGi+5JvCM9pcIGWwKoB7FXNloVwwgkjdLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jh2potoc; arc=fail smtp.client-ip=40.107.159.68
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ankFUUDd2zVDXSysJ1RLQmLDcKsLetUA+xPEL6Obo21Hg5y4g16dFkziNBFulSp2IhYzR4MDbIR9WG9X+gr0MAxvalWXRc+CBe9d9qnai4Gk0EGBMEWu6rOf5QKnlNIv9aF3RlKvx9rluQblpn6n44TLH7AlpMm+h40v0WiLbrrG0+tYGbkubJkfZP41mIu9pEr67h19itCwtj4kNHIW7L9bATMmCDhLXNerJ1vXu5+4BKVogiOyUgAq9TkdeABBtAaCrtdB79joukOHLfCJDqKnWYkGZQYjvAfLCwLSOc34tYvCYWroxXkPday4azdbM2VbOdWO6TvXu4ChG4OEFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOG08ktp7wHkzoKL7az/48HqMHIEBrltDzRccUL2f44=;
 b=zNWcBwswrgsGInZtO9Uwi0DYhZI36ERtAPK5y/jM0edqBvpSyUsH5HJua1S9Ab+CABhWIclOnXcCkSHFi/o/C6dcmUzkwMZCDUc/+d1w03rJa9wq9CtUbupmC4gYmt18Gy8kNFj0+H86DBHKpRM3wLYvNqJcJhDliMXMFKjtOzBF7W6lmZEzd0CP06stXIFrHn/mEOQVkmH70lyQIqYjkPgcW7hgRlKUjdAGdrGXUF9B831Uc6DCQxNvDi8kLBH3fCuinhh/oc3eXuIpDFgDH/ABR/a59B2XqGuxDvjT3uHYjqLPepi+gKJIUkXJtKe5NQKuMz5iGM1PIBlvbrslSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOG08ktp7wHkzoKL7az/48HqMHIEBrltDzRccUL2f44=;
 b=jh2potoc5WP67ouM9sdTU+qLyeG7H+sbsnK/j5TehkszMF78+ZUqtBqXJCgbOhPoXYnZCuzZVaBztddbd4J72eFtOF3MmGZsIOGk1Sy4nDpca3HigiyuTdKVUeN0E/zHHL8gatYX9NxHv/nWXtJ7BXDxFAhIEV8enugoi0HqUhhdOQOkPDK4kQKFWY5/qdfTKPFzFqSHNzlzH9w1cMnwguVuND2OuEB82W5e4qrNPgd8hphsUgiR8oKbUFlVSixSi0m1SaZveKvim4a6dnlRb490OMnzbpk5q8jLIrDJ6QYDxR9AUh5RABJUat6MjuEUQZLjaM9YUWDZJZllDLP5Dw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10627.eurprd04.prod.outlook.com (2603:10a6:102:48b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 14:33:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 14:33:58 +0000
Date: Mon, 29 Jun 2026 09:33:46 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/5] media: nxp: imx8-isi: Fix stream ID validation
 bypass in crossbar routing
Message-ID: <akKCSo-vZX9DF9lO@SMW015318>
References: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
 <20260629-isi-v1-1-deebfdb1b07b@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-isi-v1-1-deebfdb1b07b@oss.nxp.com>
X-ClientProxiedBy: SA9P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10627:EE_
X-MS-Office365-Filtering-Correlation-Id: c2057342-e861-4ea1-0521-08ded5eb7463
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|7416014|1800799024|366016|23010399003|3023799007|6133799003|5023799004|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
 +hS1d8h+FDaoYbgfTze4EtOCGMMnjs9jgOV9Wyof0rGIQaxo6aVQsrPfeYurpHcY9Bz5F2OcTpLkj5NiAqWRUvtPvE/tbbcI3NOGy8EtZdvnR2MUzJSoloAOiG0XOshChyu8VnaxPKYQl5CxgqH4xQCk+eHP6M2SpAGIC8ywsF7k4LM4UyhKspb98yOJj3dCpLifvlTTkuUONLTgqHVyLBVxZI5IzFNunSuTHlAoEEdsOl69XQ7GGZHHk2r0BLoIuypQXVH5Zpxn6g/AhjylypXxpXwDa0wliXMXODm5U33mom/00qeZUBf0shTj/puyqznRjwtzUQVLwcXwkNfKHQvoJ/yoa9XPvLQw+TIUGXKkFQyafGWBtn8X9XwQ+T4Q3fENks0rbsLmTA65nBou1Ra/GQoU+yloXv5U/KbAEP3rDllog6EEnQqxwEm1/dGB3JlPJnkeub3iwcJImceA+sWRuaU517KTU9q7OMA+GhqHnhpvdr8bUnGOKOJdJcGvCxybFxwyuYlhqLxArraL0KHAR9lZ9zUyx2tdZFZOgELhbYQaurgiDqMKJj4PGlGbjgYKrsJvwpbOz7t51nzzMYdnIHUEYxU8ZDN6XIl79EKf+IZktGUvI5Frw9vAxWx4zRmtAcuFFniURjsxsLm+bVIOUMo41r6Rk5s+eQcyP/8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(1800799024)(366016)(23010399003)(3023799007)(6133799003)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?mDh3p8zVRTTtGmZaNFA5zASIMa+i60iKqnzw8Zy+DAuPsfOht40iPwait6dE?=
 =?us-ascii?Q?wj6dB+9VLnTC2f5eWGECMskG8thU929HLxRRKRuhaE+/fi8k7UDoBK77U9fx?=
 =?us-ascii?Q?kJUAQ4MdSTA0h1iqVW67z3Cn+QuagubnNA3Um/FGi/iTA3sDStoJmLyC22+F?=
 =?us-ascii?Q?gtG0GVN3DeCY/wOO3sOzIs5DGwQv6zDd3zbKysAcS+ltqNfZByGbS2m2aQfg?=
 =?us-ascii?Q?mpjV4as64oXp57q2HJ94gPEfqocvFFDKTvQZq5Fve3GUiz0B2XJnsXx1cbUt?=
 =?us-ascii?Q?PTCaqr/a7bSg5LcCiKyeMAxu+XqhNFRzUedPUf5286UXPUic2BPcYJgYfYrK?=
 =?us-ascii?Q?a752eO/ZtM2xLlcGf10KsFSSCfKJ1Z0J2KBQ0bhxdaEIbYu1gMj7BWyNRW9B?=
 =?us-ascii?Q?ShuirgY8VMAnqN5e736/S/HphtB7zKccapLUCs18zZowcZKqjCV/CV69gneP?=
 =?us-ascii?Q?QF3vqApAmEEngnvcJGSiTM7Xem5gWl2/P+tk0DsF+9wJ2qNShbEcoa6RLiA4?=
 =?us-ascii?Q?LKX/RIP7G9HuvzLiNIqlP9caJq76VTXEoV4S0ukqyXKBg4K1RAbM6U/pHdv1?=
 =?us-ascii?Q?BLG82647eiqRAO+fhe001xYv3XjQXgYr1BpCEmYy4uRiqosvMRBj8rRmQyXR?=
 =?us-ascii?Q?3eja/U/gr2Ph+I5cl2kk8xfJ5lUcRSyel4Fk83cN+52ag0BL38utrFpy5sj3?=
 =?us-ascii?Q?AJ7FQnG6k3mxlnbimuAUqTNjko34w+jAopGFmVFiMHsNySx9MATzcx++Z9r3?=
 =?us-ascii?Q?w3n34K49O8g9NWpyw6fqgXaUdSdIcy/f8mnZjm6hTaZ0MliNEklGZbY2ySIJ?=
 =?us-ascii?Q?akbBzooP9tkwsRrB3uoeMR1efLU49mkF8O0dmShIS8cFj6UqccvHwMf+OETS?=
 =?us-ascii?Q?48qDZvLvXnDw6E+blN34Ia8/uRkYPJDgMzpNSKD6k3N0OjlJLbFiXAz9IAtI?=
 =?us-ascii?Q?aHZggCbCm/tMjcZii6WmxZiv2lH6pYcJKmgFIqZDQNSs4KjL62RxfjNRx7ye?=
 =?us-ascii?Q?JQ+Tv5Dx+7R1/qOqXSehoPM7aenrsUb3JB3eq8iJDAYKLReI5iQiosF+YQzj?=
 =?us-ascii?Q?UmNw065qzeAWG0KlwJPIH75thrRWQ9Gk8DdjItYSDLisx+y14IZOqU52fKt5?=
 =?us-ascii?Q?ruEPPSIhr0OSD4ecCmAQ6cZhMvhMyoruKtH+RO3QC/WbPTNexIOFBwq0saNg?=
 =?us-ascii?Q?V/Oo4v6QAD1Vru4YY1PjpsflcpaxwoRVkZc31Gp2ohmvfH8hWZ0Y6IA/88Aq?=
 =?us-ascii?Q?qUUsSx4wM9LBqLgnup2FR1LAtmQOntT2GIemHw0ZilELHZ8Dnh70qr/hbmrb?=
 =?us-ascii?Q?P9Cyk+Ke3sp3aAyc5WQH5j8qBjiquPE6qo+yDxsq4y11MniJlk6LHyzHm9Xp?=
 =?us-ascii?Q?B9+XEB8yerKPC2nnbvgXug/DyBLjVuJqep4bEoNOOQNszJw2qVsY+4NfmzVf?=
 =?us-ascii?Q?p702mHB+Ja1CTNfWnD3UBE/5Nh4pSL80743MiPcwcz41op0WXL5xChFnxt/T?=
 =?us-ascii?Q?J37ZvGnW/pyTBtWs4h0xUt6cqUoGqKYbG/nnF1qecTY4sIFJkn0W7oeWbmnb?=
 =?us-ascii?Q?sqWbYwhp9B+VUS1hORBLqIlHgWrEwn48Pr4sJtg/vgSXOQaPrlodTH9jbo86?=
 =?us-ascii?Q?ersTWOt1bv2MbyTZ93ecf0u7gQgFCXosDkluqwULTB1ZLgp4gjako55Vt1Ao?=
 =?us-ascii?Q?s05PHsUB6WB+7Mcbvim/C7YTj74TFm9V1inPssJZkLZ2hGs0Q0wx8A1umtN7?=
 =?us-ascii?Q?+o0OPGR0M1lw1FzzjWiSkTpHHowBZppIYXzKY+RzudYgcQ/Yoh4C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2057342-e861-4ea1-0521-08ded5eb7463
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:33:58.3264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VVNB22I/Y0Qm6zKxkOrZGUitIihaa0JlSSl0OFylIpvlx/f3p1oy8JzVkzQN22Ch4nnZElqLWk9JtSoH1jcKTGX/lE+Ibl51E3BQe4QxIouUaP8NNNs0ox3NtFVLHSYP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10627
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:guoniu.zhou@oss.nxp.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:c.hemp@phytec.de,m:s.riedmueller@phytec.de,m:jacopo@jmondi.org,m:aisheng.dong@nxp.com,m:guoniu.zhou@nxp.com,m:linux-media@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65976-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,SMW015318:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.nxp.com:from_mime,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6D086DC316

On Mon, Jun 29, 2026 at 03:44:55PM +0800, Guoniu Zhou wrote:
> The crossbar routing validation has a critical bug where it validates
> the wrong routing table, allowing userspace to bypass validation entirely.
>
> The __mxc_isi_crossbar_set_routing() function is called to validate and
> apply a new routing table from userspace. However, the validation loop
> iterates over state->routing (the currently active routing table) instead
> of the routing parameter (the new table being validated):
>
>     for_each_active_route(&state->routing, route) {
>
> This means userspace can submit any invalid routing configuration and it
> will pass validation as long as the currently active routing is valid.
> This is a security issue as it allows userspace to configure routes that
> violate hardware constraints, potentially causing undefined hardware
> behavior.
>
> Fix by validating the routing table that will actually be applied:
>
>     for_each_active_route(routing, route) {
>
> Additionally, add validation to enforce hardware constraints that were
> previously missing:
> - SOURCE stream must be 0 (ISI pipes are hardcoded to stream 0)
> - SINK stream must be less than the ISI channel count
> - Memory input can only route to the first pipeline (existing check)

Please use two patches to fix one, one fix for_each_active_route()
other other fix others.

Frank
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 24 ++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index c580c831972e..29f14d30dbbb 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -106,8 +106,28 @@ static int __mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
>  	if (ret)
>  		return ret;
>
> -	/* The memory input can be routed to the first pipeline only. */
> -	for_each_active_route(&state->routing, route) {
> +	/*
> +	 * Validate routes against hardware constraints:
> +	 * - SOURCE stream must be 0 (pipes are hardcoded to stream 0)
> +	 * - SINK stream must be < ISI channel count
> +	 * - Memory input can only route to the first pipeline
> +	 */
> +	for_each_active_route(routing, route) {
> +		if (route->source_stream != 0) {
> +			dev_dbg(xbar->isi->dev,
> +				"route to pipe %u must use source_stream=0, got %u\n",
> +				route->source_pad - xbar->num_sinks,
> +				route->source_stream);
> +			return -ENXIO;
> +		}
> +
> +		if (route->sink_stream >= xbar->num_sources) {
> +			dev_dbg(xbar->isi->dev,
> +				"sink_stream %u exceeds hardware limit %u\n",
> +				route->sink_stream, xbar->num_sources - 1);
> +			return -ENXIO;
> +		}
> +
>  		if (route->sink_pad == xbar->num_sinks - 1 &&
>  		    route->source_pad != xbar->num_sinks) {
>  			dev_dbg(xbar->isi->dev,
>
> --
> 2.34.1
>
>

