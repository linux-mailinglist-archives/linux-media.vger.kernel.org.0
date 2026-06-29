Return-Path: <linux-media+bounces-66018-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jFigNTLIQmpMBwoAu9opvQ
	(envelope-from <linux-media+bounces-66018-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 21:32:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7527F6DE6B6
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 21:32:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=t37XBR2D;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66018-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66018-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EE88301EC7F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 19:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53B835C1A0;
	Mon, 29 Jun 2026 19:31:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010038.outbound.protection.outlook.com [52.101.84.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDCA40D57D;
	Mon, 29 Jun 2026 19:31:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782761511; cv=fail; b=dJOxau4jMeASRSxc/oBcD3q8UqwzZbmCLJD5qRPE1BBho0668zycXyTVGcFmIs1ebzOx8ov2UpqUqfEsvb5HBB1fhBaHSaxhA7VXTMMcenC8fI94nJmHywwICKwU0jwLNnO0K4OHmY4Pzvb5WYtm8mjDYFeyT57iHZc02vXHJAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782761511; c=relaxed/simple;
	bh=SCgy1F4Gm1ZNXrzS3LQHg7J+rSndwXSjLawA76actIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kco2I0tXtD0s/0zySMlMvi+g5UcfRnBai9NHXqgXdbTTGA6SH8IDdhhMjec5S7VTRuYlh57J77r3oWGYoFvt8TsXdzKSfXN2qWjO8KjDm3cVSZZ5IzP/qkg2X3rLbFtGOPb14FLBZR5893ENcTQ4J4s5lVwd5wEWPkag//zCBTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t37XBR2D; arc=fail smtp.client-ip=52.101.84.38
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFFQL8fW6uGh0eZ9/CVKWG3wkEZp35amhUJ3Rc1KlICGdXCfdZr4obHLdmG3pP/hyE5FBpQF6773If1FI/GUGQGIzbplfTUWx5AtsAHiCUC5gJb7OVVKNrAy2H5lQAMXMygAxKVo2ExrSKcjC627vh0ObP2Gbdym26wEOOaPfmuGD66ghejPkWnlZQjSkCwz1LaXcn/8VvcfxdvGN/RhoBTE7Tfvguhz783InanD9s18KYAQge6IclobXhfH6bKFD9XXxzpS7HEajcZzd0B9/K0/KdpRVrIHW5qKWVeDTDZbn3a1rFc3UDG1/iGeIwP/IQcoIHfr427atxxCHvQemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiIJlN7hy0Y2wA9KHHVXP6PM52F7F/YeRuEXYvsOscI=;
 b=mW16r/Gqh4wXl7fnClg2ueAMgjOvpIYBTzWXk+6pi2mR6FqBANswfjtlVZZ12/2MyT5X5IqJg8SzD5EIDD0uKDkOLvTlgrmTlC+IIu5fRLUWn1RtGZcVttLN7MnzR2WDhfR744BzAdUatZSLSs63HDLKpHNFr+iRq2Wc4oL9o5+gXEqSSSXGuAuORqYbXFvDSPAn8euFN8JrJyuAimfEyWgeqoAYbfTZIqwJX6EFolZ+8yZLAK0pQHZHhpKJ3IHPYIGyU3HntuKo69YKslDcxTX1Fc2f9T4qDf58USuPWsYWgAIXn+2QDVv5FYZgLY2LxQOnuhpQidC9FFJv89Tepg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiIJlN7hy0Y2wA9KHHVXP6PM52F7F/YeRuEXYvsOscI=;
 b=t37XBR2DSha+xK3TuTRcEr0+5f9soSdMFoic+VIoy7/RC2e4oOcUEngk+4UIa0cLOYikiGuCL6+lTz0SBFrDoUy610Sv2vdki8NL3GwkEdTpOHDZVMZCp5eS/syinlfECE8UF7J5dz6aXx4zJgD13ydnVcN+eoeMVK5akVrTun39Fyly1+CAe8XfxtGnRUGPG0cR72UF3gqfkDeB8TSdV2tmcepo9ToflootdnU8yuvl5MQWuBGPGfYp3SNOeZOOdsRKvSS+AKy3SB3mtOQ28WAv6iI5xLlD8LOIWM4ikyArkut89R6SqQcGo6JgWJA98zMKwsheL46z4woIfZPcqg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBAPR04MB7270.eurprd04.prod.outlook.com (2603:10a6:10:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 19:31:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 19:31:46 +0000
From: Frank.Li@oss.nxp.com
To: Robby Cai <robby.cai@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: dt-bindings: nxp,imx8mq-mipi-csi2: Fix example endpoint label typo
Date: Mon, 29 Jun 2026 15:31:39 -0400
Message-ID: <178276149121.2421775.16396513414846222417.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519113824.91533-1-laurent.pinchart@ideasonboard.com>
References: <20260519113824.91533-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0102.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBAPR04MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 47665b61-27b6-4482-1b21-08ded6150ec3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|23010399003|22082099003|18002099003|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 qxZowETPEk5oJc4YnjuZUGYhFtbyDzDt6LQXQJfOythbmVx74cO0vPUgyFlLWMIqv4Kj98pHixv5R13U3Jfb1eoIaSqj5l7oC3j47IYBMlOOkjwtpRHnAzYCQU3pBdPheOMDp2FTdUoSY2mshndK5NkQCRXQtEdPfisAcs+Km6o7p+8M7WmAxQ2Yhma0yr/CvUxLjY7aPmW9eluElT3upr95OZ5SftazWuMNqgXkQw+kknd0JWghNRLbbDahBpAGFcxPhO6E7bEMYZU5LK0ku95ltllBcKEOAjAGp/RzwcfsMZv1/3XOakTSYQavA3cRCGu8eZ+3vNPHkV83PCOzPqtFMLjzqyM9k5DRaiAdwPnqMaNJV7jrN/7Vo16r5DzFWRo57Ij02hlW55EAiMQjcL/E1sQ+DQ1lEG7oDogvVTyHNFkEy6Iw1clsGqMQ0G3Tr8TzuoG46SoLg5XxTFl2aE5g/ou4HPFy3Jw4r9A9eqEjcvzwdBFCfsUBLSQXTVUSgn/7PJH7ZLgtSJR3Y+NyUZuhi/osCBXK43A6bkSBcAnOOtpp1kH+uydvtTUtDPtZOhVSqPivDQz6/adz/sj3W6G8Xl+uyakjY0b83f/TruzFosLvTQpRtoKJ/RbXWM/Azw5DMuiw6U7bBlsRdEy929dLcGmnnA0U9UVE50KrufEe4C85zRnz/tCzpteCit3+W8c7Kvscpy05kXR9rOD6sg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(23010399003)(22082099003)(18002099003)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YTZ0VDF2NmhhT21XRG4ySXk2MzZTWWpCSENNdFJrMWpVUWNVSnRYWE9jMGlk?=
 =?utf-8?B?elNHV0FIeWxJaC9wTHRVT0VRc2tmRVBhMU9IVWhKSXhWNVM4cXE2dmdYZ1lU?=
 =?utf-8?B?ZGJRQ01nTklZUGVrRng1K1ZLRTRmYklkVVZPTSthMk4wd1pQTytZQ3ZvNE13?=
 =?utf-8?B?YnI0Z3Ezb0lDcDd2WThjRzBPUWFmNnp6SmU5ZkgveDNWdDlRVWxhUkxHb3JI?=
 =?utf-8?B?TkZ3RmpHb2Y5UEhwOTBObWUxaXZJVFBwdm5PU0U4ZVhFaThMNGVqMTdmUXlk?=
 =?utf-8?B?WW1GNmh5b1VIcTk1bmZrdVUyYlhlNkZyc3crVExmcktWQTZ4cUpoTmhwVUZK?=
 =?utf-8?B?NFFjVHptZnlLalZlNnJZYzFNUzl0cHVsNzMzbi9pSDdJLzVCdkpPU0NKbERB?=
 =?utf-8?B?N2NtaEg2b25BZXh3QXRiUWJ5cTJpZEJ3Z0pNSU5vbTN2U1ptcERheHoydG5V?=
 =?utf-8?B?OGltd3g3eTlzRVpNenQ4c3FUTUVMUDZCQXh1NGtzNWZqNWF2RWpsemNLT3BB?=
 =?utf-8?B?RWIvTDhoL1ZUL1dSanY1TmZ3U2ptRS9lQzZaa1NUQXBqTkRBMXE4b1RYNy9V?=
 =?utf-8?B?R1ljME9EZGlMMlVucWgyVndybTFHejEwbzZwWGZRTDlxeUNteWdVV0E4QW9Q?=
 =?utf-8?B?WUh2R2hrejlqa3JzU3RBeVpOaUxkU1FLNnZMdTBJSUM3UEJOeEt0VzFPc3Zs?=
 =?utf-8?B?NFJiaWg2N1NIMEMxV1ZWd0ozK2wvOXJXTFpCS2FoRFBtaVZUc2FEaWNQdTkz?=
 =?utf-8?B?dzZsV3ozR3QrVHFFZmZyeGZldG5QVS9MSjNZYzA4UlMwelZWczNmVlppRzFt?=
 =?utf-8?B?dVk3TVhBNjE4RlJRNnpVTUZJL1gycWgvMzFwMktkamJwdjcvallyMTlta1o5?=
 =?utf-8?B?MUMveUlPV2RybTVNUmRiYnd5SmUyRzc2VFh1dFR2SVBNV2lycVdEMGFnUEsw?=
 =?utf-8?B?T2FYK3Q0cUVuOWhoakd1YmhhKzB4dlRXazNXMnFIQlhJejBJWFhMYzFOcENs?=
 =?utf-8?B?MUdIMzZSNGRIY04yS2tlV1lnMjlyTjJsVDMzQ0lyQmJhWjB1ZmpsSWlwRUF1?=
 =?utf-8?B?U2FHSUowM3hYUmpZNGtPTWNKVS82b2lJeGdSZ0lMTzg0MElEOW1hUWVpY2VP?=
 =?utf-8?B?T1gyOEp2cVdlTTNqU2pWYmZDN01uVEZtT0hPeUhQekhIS2ZkSjNpVTZUYWs1?=
 =?utf-8?B?ZjNYbEN6T0ZUYzRnbjcyZ3N4V1NMMlEwazRHUkR5eWg2MDlnWDFFd1Vid2tC?=
 =?utf-8?B?cmgrSmNsM2JaZVZIZEYzcXp5T0pZVkpOWXdCaVluejI2VmpWMFJWWUdUODNx?=
 =?utf-8?B?cFJwZTVaeWY1dFErbjNPb3h0WWdCMVQ2Z2RMNHlOZnFUdnFBRWo5THFBZWZW?=
 =?utf-8?B?N2wyencyWkpGdzNjTXhGbTNXMmk0YmtoTTlSN01UeHN1Z25hZmhsSFlyOEZl?=
 =?utf-8?B?cncrLzBnRlppSHJQR0VUbzI3ZHcvYWdUMC8yN0ROSDU5TndKWHRlc2hRaGpv?=
 =?utf-8?B?bzNpNUVEUGkzdW00azQ4dm1HeXNycXJ4NW5EZW1XR3BGeWI5aXdmbENEcFB3?=
 =?utf-8?B?K3lveExYMWtGOUplVWM3WDBMQWs0SEpGSElBS21MTFlzVFpQd0VWeXBnQXBm?=
 =?utf-8?B?V0RlUXowU3JMOGVja3k0Z3J5azBvOVFFMzBjaUFFZ0VQdVZvQWZpaWV5clZH?=
 =?utf-8?B?K1JMTmZyeHhjK3hLVTVnaTFRWW42eVZGdWZLQzZiU0EyN25KTC9GaHV0dlFa?=
 =?utf-8?B?N0FYRFAvTDlBZ2JaSUVZVmtncDVSeDEyaGNaaW14VEdNQkEzeHpvTTNaVG0x?=
 =?utf-8?B?UVVKYkpwY3g2K1FNQjFrcnRrSHVBNW9yRHBJOHRrRmJPdEl3MU54OTdhU2FB?=
 =?utf-8?B?bDR1SE1JYjczZkZFWjNvUEppMXVUc0FwZzZ0d2gwaExVeC9leEl4Y2lRNHZG?=
 =?utf-8?B?WE9mdWY3MXJnc0lHU1ovY2lOVG83Mkx4Mnh5NEU4Q2kwRW5meDN2bmRwYW4w?=
 =?utf-8?B?OWtVT0VKd042bE5iSXhZZk45L1Bld1hWdEZlY2dtajJYSWx5aTNiV2h6R09K?=
 =?utf-8?B?bmp6elo5OW53V0VVS29SOWZFbWltaHZIeFNBUk0xYU10a1ZPam02MlRTTHEz?=
 =?utf-8?B?ekpCeXhxb0pmb3RFL1lvTC94M2E1bThtRU5YVmtwMU56TzR4RTBTRWtzU2VD?=
 =?utf-8?B?Tmd2aVZBOXFlZUJ1WFJTT3NBenNNNytjdFdQWjVEeXhUQnBST3lOWmFRaFpw?=
 =?utf-8?B?QzBZbTB6ZzJzZUlyUXNhVFNmcjU0M1pzbmI0dDlHRmZiU2Q0MVFJYm90UE5z?=
 =?utf-8?B?V0lCcjRyWjVIQnNHOVRWdDVvQUo3b2Q3S3VrbU1FMFQzUzNWeTB6STd6WmVP?=
 =?utf-8?Q?SkxZZYJvrUsCWand1RsH6gR0L4t8SLzHuohFp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47665b61-27b6-4482-1b21-08ded6150ec3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 19:31:46.6246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZq8KyOLA0Wd6vZTEG0a5WSuLMFuzpaeE7jkfPZbkqRzJ+KxLaH/zNAxR+emBK2Qw/dyv0j3MDoBuDwADrnq6KcTl2p5fOiyLnz+eGSx1fJiqwsYUhl6yv2zl6Cj56WA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7270
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robby.cai@nxp.com,m:martink@posteo.de,m:martin.kepplinger@puri.sm,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:imx@lists.linux.dev,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[nxp.com,posteo.de,puri.sm,gmail.com,kernel.org,pengutronix.de,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66018-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7527F6DE6B6

From: Frank Li <Frank.Li@nxp.com>


On Tue, 19 May 2026 13:38:23 +0200, Laurent Pinchart wrote:
> The example in imx8mq-mipi-csi2.yaml uses imx8mm_mipi_csi_{in,out}
> endpoint labels, which is confusing for an i.MX8MQ binding. The labels
> could be removed as they are not functionally required in the example,
> but they have a documentation purpose that brings value to the reader.
> Rename them mipi_csi_{in,out} to avoid the confusion.
> 
> 
> [...]

Applied, thanks!

[1/1] media: dt-bindings: nxp,imx8mq-mipi-csi2: Fix example endpoint label typo
      commit: 733394c59684b8d16c5e4d26d6bf021a3a2d4bed

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

