Return-Path: <linux-media+bounces-66405-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 844WJuOwRmrbbgsAu9opvQ
	(envelope-from <linux-media+bounces-66405-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:41:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A296FC35F
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:41:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=dcLJNoUq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66405-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66405-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0245931A66EA
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 18:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DDE39B972;
	Thu,  2 Jul 2026 18:11:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092F23612F1;
	Thu,  2 Jul 2026 18:11:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015878; cv=fail; b=R/RHM0m08n0pbZP5w+CYklqqEK5Bt4/+gBlIqAZ16NlZ4L6UAQlhpHUXgqov18M6KXkUGgHg1IdGPvXYYCi2F0kkTfx2Q9bkFpxPcivKQ3A8PibcTZyxIdWvLCtfCvxTWvO44x0POmXbIHRchZ/+KhrjUlDvXWsPzZjncoTYqow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015878; c=relaxed/simple;
	bh=+kcc7JmCArazoWT+M7xiMOM9LpDbgZOGSbaEZExtzbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GGktPolojxyZBXBPEJxree0DXr6VhfARk7Tqn7KXrAt4iWB6sfurOhn09DPxwRPdBYIbv+xC7POpE7QUdM51KIsh0czXhb4HLj3C4GaVNoUu693tDERgmS7BUF8rOGHgfLHhXXVTLa+5MwozVCQq8xwbXdHr5kr1OXdKJYtw3nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dcLJNoUq; arc=fail smtp.client-ip=52.101.70.44
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcFO/8x/Oj8NHYiuHNkVYv4eP9etbrOjxv4La1/tLCHonpkM2vyXfvYq7nT0pqbeOjAgLjpyNdSyA9M/TQhoF6zQEYJ8Wkzc5TeGzbs70XbGDdR3X0SXYRYdpETD3GCUYgWHCLCmHe6NcBQswxY2JPRu9KGlrU+s4VjOKuEtWx/7+4cTaSroAiWrZFpkWjDZRJIzcihE27aFggn/2l9zwGlDW9Wr0DPbbsgOQWWjVwfJWWavsAkqxbiJNJFOBGUmtHxNq0NQDCK1RXyXSR9fWaxFiFSZ8EPF7DONB3cDmGe3jaNHwf9wHSrccLBBH4cv4SDJo1xfY32c8y2NWSXhqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kcc7JmCArazoWT+M7xiMOM9LpDbgZOGSbaEZExtzbU=;
 b=VI3GwquH7JzCbyn5kc2uKJ2SQgtdbNWp9TXIWYMVpGSCt1TeFCM9O6PmcdlhTEedQ9HOktLZHVNazwtioUPVCXVGu4xzGp2XaCz4F/TLy+ttTNEoHNqYCnWztR/LdYTO6Ve9ygbp6mFNf3/GtGS6WodZlhCF+0hJqIUC3ktwP0idkUQukmgMR9pkRwN6t60OCQPEx4Kyfg7/xX4wLPRuAtXN6ME8vyalSYziqPJrOXiEjnulV3oeoLiIcVTARUq4RB41ayD1sNtaBjwXzmJty5EXE6JvAlUJYyisvncKVno854Rgfif44hpJjhKa2P1df97XOlqKAGR+joCebKA1yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kcc7JmCArazoWT+M7xiMOM9LpDbgZOGSbaEZExtzbU=;
 b=dcLJNoUq1C3tDDQMtBuvZZCJps+y/wvzBK5JJu2Tiue4WZ3YVKtgFQ6Zh6ZOOPLtD5LwIYOjqmmoAFHQi/2Ko3qZsvWbLp/+xwGFOedgd2n+grPnnKi6wGQbl4wcEouGEK7ZU1/a+s2RtwpB2hRwo/LnxKr0xN1Fan+XwteBqOVgx5NDbZ+95ECxopmfyjvyrjOmrdkprR3bWoqWDZjtwhKByYkA2RLaZhXVIJ4f9WQuC7W//rwxtLxk7dvayg7mme2FgeblPOU0bjEllXJkmgJoxzooz02csDgVyky+0DiAxHNJuyVcxQCizyUBo8PLQL9xl/Ty7COCN3kley6D1g==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7884.eurprd04.prod.outlook.com (2603:10a6:10:1f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 18:11:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 18:11:13 +0000
Date: Thu, 2 Jul 2026 13:11:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Guoniu Zhou <guoniu.zhou@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/8] media: subdev: Add media_async_register_subdev()
 helper
Message-ID: <akapt6v_DBJSAnj0@SMW015318>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
 <20260702-imx8qxp_pcam-v7-2-b47d9e363400@nxp.com>
 <20260702161519.GI3534761@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702161519.GI3534761@killaraus.ideasonboard.com>
X-ClientProxiedBy: PH0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: dfeb13fb-0f1b-4446-b86c-08ded8654d2e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|23010399003|1800799024|19092799006|376014|4143699003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 vvAmrEg+799HzW8zXxFXjqnKFp+T/acahTlGDXa48r8lXV8a2cgspSZHtQhblpXIH+2P8b963uIy4Fom4mJNzbG6Oc/kO4nyjus/Fq7EprI/ZOh0JImdjehyzolOS90r9J1ZxRBEeobqSxHqvdSTrxix8NE/wxvoFldNM4NL5Ahc+OkNcIGKOz+L1cMClZdpFMY0R66JMOiG5WlzuNuB0l1ewSuzECNHiw4GrSYV/Fy8Xo1nk4BS6zg42luuyai3CUjyd+RNVlAqKNNSXwwl7qSvACYSkAGKq3Ll6c0fqZwN2XvlhFVGvyrxZu4Q1PZ7fNvaKrCVRNagz/O5vG4DdOr/93WTjRklardQkRVVXaKqCnZQhJwBmke0aFBu4YGaKEOOC0UfCQ2TMufLZ0le8FPJqDG8lhyUNp4StTBfPcJJc5YDQT9vzv+pPOQj0tvYoQtSWL4j+qtdMfQhXt93sgL6eKvDCXIZ6tLvrt6jxmCnuvqAzGTR3nGPvhhA1Pesxx5r7QPBTt3eng9ecboKVPf508+flZGWC8H9djFMl3E/LMiI5iKMz/SOkFeAdmKMCR5znhnMFt98J1Taz6srjAPcjOWz9xHYPSQB2mFQz9wWRLpBc2V8jOIthCFMNFo2OE708m2GtBk9ysF8f+ZEHDrQ6BflgkL2Y+cDVVYZme4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(1800799024)(19092799006)(376014)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?4MCu/T6Wdvng5+hfgKLBq1TzQQh67vXK/jw2VQgo2NG+m2iYWXiJJ+h6Y3Wg?=
 =?us-ascii?Q?vqJLVqfRh8A2sotFau3CKRz4WCcE96VYlFC8xZ80E/FF74VowJ3wZ0fLWEmE?=
 =?us-ascii?Q?W++oeVrx+Y9tZCrma1lVgu4mPQlKFpQW1noC8/DtpYt7nsI6KUvgJuQL3koF?=
 =?us-ascii?Q?nAu/XBT4dZt9mazhFxpznuTUIQwkPGHZoASUqg8jGwvWrcZdPhgopRuXcu64?=
 =?us-ascii?Q?ZpGAaCtASvgRKHQuYZ3reoo5TcDuONHxKsMa7kGOIZPTCeziUjQZAmSgAsnk?=
 =?us-ascii?Q?mLwMW+KWfoDqeVcnN0w3ZGsC5a86MAY9SY7H6mBQeChxQuIZxfHz+6Q7eUgO?=
 =?us-ascii?Q?DYaGcc35WT4Q0TCFjueUsxqj5C0FhkZGBo5f3e2rb79fW6bSSAqw08Mt2PsM?=
 =?us-ascii?Q?9Lcf8gKupVWzQOWyOoSiByGCRgCSdASUBCMRcPP6rTxyun4AkjrMrE53RqE9?=
 =?us-ascii?Q?lxXjRrAXMYJVh3zz35woVaXnCAs07SwD/MXKuqTqkXaAnBDb1ancnEVoihoY?=
 =?us-ascii?Q?RN2n4whoozvAMNJ70LFZsk8bbgZBq0aG6nbFxhXdeS3Rgnw3f1b1yxt/qHDR?=
 =?us-ascii?Q?SEsTcg2V/8L+J4Q98g5GdwN2H+Kr9fMVepMIIcwr3o+BRShBASgW5pHGmMdc?=
 =?us-ascii?Q?DFbRdwCQEXtGRRCStT6qm9hW+fJjXykvo3zkabF8FQECUgejm08JzyfMOAWX?=
 =?us-ascii?Q?s1wmtvGHwzjZv3+eBNbOTQP+mFcJ6Pf7+kQmJQFW1N9NQyurCjIceg17uqpd?=
 =?us-ascii?Q?mr4lmI3RWSbiPVMfuKQ5sytekqN+a8tWhk9YbU+HL6YbaEe4LN+jZpjK+e/W?=
 =?us-ascii?Q?AYpMUg7eD3vDL8UF66eROhE5v3k4dkY5eZPRHrz0DnbAqEJ4FqKZMTUPoiT4?=
 =?us-ascii?Q?cr5Eq/9eyla9yMKMfX7hxPJs3fVdzU3LnWOTvtue+XuxF0x+A67tMx0QLZII?=
 =?us-ascii?Q?38fw4uCHf7HYzwfWqbtnS8BpBudWYT5aHPafKOiGyzqJ6wAN3lyd71XOQr2N?=
 =?us-ascii?Q?rEpsbKNXsgp+GnJNbhaTd7qvkaKt5ezkdE83zr8JGFmbtalCfU/PNfer8W5i?=
 =?us-ascii?Q?R2Y10FC2p7Ybgz2S4M/fOWQ57njMMK4If/gIu5f6dzbVNe7LCPUh2J1wFlfn?=
 =?us-ascii?Q?ntk8uNL/PxKbch352P4mAdM91AJwCVBZC+AinRghGoPOQJCxrqRkHdEbriaY?=
 =?us-ascii?Q?QwiIaGD58Peapep1L+/tiOf4BflTRWPBdwj+i4lsj87rgygjGamQ+TymYBv+?=
 =?us-ascii?Q?7OTR2RLWkBfYgo022EdyQ7GadBt2MBmstQSoC8N8vLcVF85ZdtLUyjjigRSG?=
 =?us-ascii?Q?u+QxABGt18YBuhMSeYAZi2fQ2lEwGFEd1YZqQ9oPYDiWpwaXD6sMAOwNws+v?=
 =?us-ascii?Q?iS25EraQBP2SGGyBpGON5ZHWM9s/P/v4V728jrkITXCgMtmSjNxAfaa0PCT4?=
 =?us-ascii?Q?DzzL00PqvtiLdEJGI5qrvfDKrixWA6CPg4XjGzf2oOhyQVlwrydBPucWSBOR?=
 =?us-ascii?Q?0UC7K2fbccw8gKyMNw7C4K5imqNyPL7SEKuFYkkD+rt1OY52jKBN//iLSMCR?=
 =?us-ascii?Q?5+2317h9L2zTGVA5A7hFwOTFa1KEb6jqHWd40OZirwOGMi3Skc1zyd5OO+4C?=
 =?us-ascii?Q?8vFjkXmUNtab5HFZ1g96EvbwSMgWRdLfLNVAi5YSLnRMH6dsgpMdMmzYnw9X?=
 =?us-ascii?Q?8EzTT/aL4x8N9GsCJ1JEAdgU3f/0hH7dCaIDVjg+k971gKjdn7ce6FKltbZc?=
 =?us-ascii?Q?L6TPEoA9cA+VF7weu8ww1XMBuMANgDK8O36ADkVRsOvcWKXfZilg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfeb13fb-0f1b-4446-b86c-08ded8654d2e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 18:11:13.5139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNm85SBzc8w7TgpxYkuW8vtn1tARL5/irmTg6C3Tx9eLIxzOecqm/1mb5a178al5aZs5596QJMgCX8mvlwxyPhdYVs651s0IfxXM4YDFKXT4T7U2xZ+oj5lKGWP/MGLV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7884
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66405-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,collabora.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,SMW015318:mid,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9A296FC35F

On Thu, Jul 02, 2026 at 07:15:19PM +0300, Laurent Pinchart wrote:
> Hi Frank,
>
> Have you missed the comment in v6 ?
>
> https://lore.kernel.org/all/20260629084654.GB3054459@killaraus.ideasonboard.com/

Sorry, I forget emphased it in change log.

"For the reason stated by Sakari in patch 1/9 (dependency from MC to
V4L2), I don't think a "media_async_register_subdev()" function is a
good idea."

The reason already NOT existed in v7, I removed v4l2_fwnode_endpoint from
media_pad. So MC will not depdent to V4L2.

So this comments is not suit for this version.

Frank

