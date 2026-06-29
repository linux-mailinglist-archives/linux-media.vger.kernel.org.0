Return-Path: <linux-media+bounces-65987-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GDVdEYGRQmqP9wkAu9opvQ
	(envelope-from <linux-media+bounces-65987-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:38:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6006DCCA3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:38:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=g1jZP8As;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65987-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65987-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23C1B30DE196
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC4D426688;
	Mon, 29 Jun 2026 15:25:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013064.outbound.protection.outlook.com [40.107.162.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49FA43D4FF;
	Mon, 29 Jun 2026 15:25:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746738; cv=fail; b=LnnYiP99hA0OVAY8jI+ikVj89EPDlTmt7/oeoNhAM6JXaraSXAU4LDgLgMppyEpvPgU8CquBrWHWXdjyg/7h9QP2dGOyXq6fJ2ReKPEOGF48mof60QSZ8o3bo/Tj31nc34A4WClJ0X5g7ZhpwYaiPCATQlKw8XzBFEXwtH7hAk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746738; c=relaxed/simple;
	bh=PPcGQtX3Cy5lvLntZ8NViuM3TvodFgNzQJpwRNCzz1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RXBaEyse8RdOrBXpQTfKJV3S6ItS2tTT6Q89w5egQExj3xy0IsG2IUJmVLuBKJ8hzP137AkJ8u1tIKY88KUHJmCN3vWCFEjFDnZZ3N23sNUQOo0BYzYmM8dPaa2n8MgYcQ8fqqbfPiTW36X15X6ZQ1fnPACDiydTGQQzQAIZt+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=g1jZP8As; arc=fail smtp.client-ip=40.107.162.64
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lbx6kwpN49JkNeH4XRSVFOll4mOIKDNcAIJuwXQ1E/pRdYW9RVuOZpTWPW918CRi/Ji95x2u4N2WCVKVQ6N9VwoP6DOBW5QEuXvTknsMQjCBNhxGWQ+DCKcUnLukF0vJ68lP0o/z76KpT408Yqr+rrUjr/GPxIk3zw+rALRy4L2SwJiJfoTcxj/CRIfT6Da+6IByS+0PUDa+/eybb+7hNS/nPR6lsHZSSWbh4TjVOhXPdT6ly64DPfNkjZkYGccdfC9tqE1e9ftvprux3l0sZ4BRKMNq9Z2BtS9G6CWiVG1QDdKAvvNj6onTIoChAX4bK7koHax0Tpc/C6L0lhDptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILlSeYrUmELWWolSwfNZrso5lXkNEFjMb7Owi96EGgA=;
 b=e6vcabQr4kV/lZAlp1A/0g7Sfj8DioNlPj5uJb6JTfS+DHI+6JuU4SnZYDd5I9tZow/2ytCqjT0YeLM684sDpk1R96Y65yIKeo/ssCkfwQQz0FBXdb9r5Qce7JONeowU7fRSUnby/N2HX0xZHAsIGqmTVI/HEu7E49dBn8D8pH6PsxZevedXju8IP/jmOmTCmbBEgqFS+SmzNHnkpxwdIAFltiPefaEtvQAVZT6Y99mrg4k58tED8JD3nnFDd3LrEQZECewvjH3BkOOxk6mD73h1ols4Gzrg23SlBNkJsDGTkESMZMbeq5smdNyPg/t6dFxfUKFtF4SknXCRhDzV2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILlSeYrUmELWWolSwfNZrso5lXkNEFjMb7Owi96EGgA=;
 b=g1jZP8AsO62cDdw1twsN9EtrOlTNbezb0GbCOeenfO3Xpjn+BVZd8zcg2rNhtoe7E1gRci124j+KuIVgCJqYCwebruzMzdPWcC83YG32ONLMaU8ahpXxuf4qpbSgk61EZVTLZW5azx5fqMS9RFec0IjTVYKdkbbOm9q8qZqpaidK0JEsoPaxJuWxxeZS7UiR76QCujzEex3VDIjtZGg6qRSAp3W5XjUwsYZJKJdy+OXnN5DE2xdpEDEiCaFXP3Q3BcbOMv8FOp5sqM4Np/SpRIacM0SedIMFOoTqqlj8qG465OfcGW6neU4PuiPtWB7jcG6UeiOMGB/fo9UAH5GEGA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10267.eurprd04.prod.outlook.com (2603:10a6:800:225::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:25:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 15:25:32 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH v12 0/2] Add i.MX8ULP ISI and CSI-2 support
Date: Mon, 29 Jun 2026 11:25:25 -0400
Message-ID: <178274668169.2234725.13199199536463715866.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424-csi2_imx8ulp-v12-0-da148eabc035@oss.nxp.com>
References: <20260424-csi2_imx8ulp-v12-0-da148eabc035@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10267:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a08f39-90b5-4c88-ca42-08ded5f2a8c9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|23010399003|366016|11063799006|22082099003|18002099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
 Wq8lxrJtMUpxqUxQ7ypCyNRkm8n/E14g8z04mDnqhV1IlshjEQ8/hfOzQG0vROQYuT2jI6A/5DJarG/Pm/K+UWes2dOTO/XT1mtLE/Er9l0vQB8fwq39F87hA9p9shjQ58cTBPz2oXQrPy46Gg4BnRYkXyIekB2ioVre15VPsp5oSxAYsnL/y57TyRLyePUk6GQkTzPSG/mmeqKvyKQ2uPdpjrojnkyqHdj/vaKc+zlTnm4eeDk/mYaZB0xEZVeUJFI41kOqVH6wkO359uec4NtOcnMc7ch4peHnh9gyidcqj03R0VqWcmFS+Z5l2T2ZGBHGmGOh9Orq+O5GokpZaaI4t6qlokTmKrhInprRqLyimqdd3rFkc+C7zJAOaCK+GySSn6rkmW5CwgrvFM48pIv8g51Mlp8A3rGJjukf2BunuccEq8Dby+RstJYQP1O6H1qeU4koFIw5vsjiiu9x9Nx7E2IVa4bNxwRd9cp885vnQOzaMjKvh59rFv4eUCn4Px7U6vSSKO5rPgAzX+mqYYv9g/DjBNR2uY5kpDg8Hgb5a5KSRhBvKQwf79WUvaSq1+ayiJRJTM2jmXORW8hSi/i+jL7mbDtCzr9lPLyOvXdfn+9aYkoV51QKqE5RljdruVmb+AHSEHotPiB0S9XflkeZs+cTLvWHWWgO/ElTO9aBphgGMafGltazuFxqUTBUlPYRrw/80mfAVmKOT1tcdQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(23010399003)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Ykh1a20ydmE4a2RhOE5vZVkxei8ybG8yVndOeiswVVBVN0R6WGl5VWxSc1lD?=
 =?utf-8?B?VEJGNWtYbVFDa0dIa0dqMG9yL1JXc29mT2cvY3czOGlpNDI2K0VHSmJxL2RK?=
 =?utf-8?B?SWJYUlYyQkJXaUkrRkVEU2wyclIwMElmcnkxN01BaGt1dit6MjZPRmcxWkdz?=
 =?utf-8?B?OXNZZFpFVmUxL1c2QnpTU0hPK0dweTJYUnFIRkxJVDlTRFJBQStVWmlXVllW?=
 =?utf-8?B?KzJXcFBxVWRPZUUxY1V3UHJ0c1dhVjF3T2JnS1JVbHByODVDd3JIQlhEQ2lp?=
 =?utf-8?B?ZVdhUlArQ01oeVIwNUd1RVJoYkNUWEZFeHo4YnNkdDVHQ2s0bGFGckpCRzJV?=
 =?utf-8?B?S0NSN0YyakR5WGN6WVhKZEpCZksyY2dNK3NRbk53K2d6N0o5a3FOYkJxS1Fv?=
 =?utf-8?B?dDhzRVhFVytBOStsankwSG9sM1huS08xRDg3dDdkRjBSSmZncDd4V0doM1ZK?=
 =?utf-8?B?S2JGblY1Tkc1NldqcUJOanpvWVViMlVKM1JVQkR4V0poQlhCSjVIWUFQejVC?=
 =?utf-8?B?QkxaM3JYL3VSa1NONTJTQXIrblN6MTZVRGVPRFdoelp6T0lhOHBOeFlFcTAx?=
 =?utf-8?B?ZUpGSnpucUNKSU1WK2tpMnhWeGowUEI2V1dIZFgvQ1NjZnNEME1mcG9UcTV0?=
 =?utf-8?B?cFdQNUxnanpxek9jc09lejBma0tvbUYzZk1HMDZyV0Y1dHZhbkJaTytnZGp0?=
 =?utf-8?B?M2s2RVVVdkgwRysvcHRweHk4WGh4WDBJK1FNYXdYVjM4U2MxdTkyYmhXcmxF?=
 =?utf-8?B?cnRFb2hPL3NQTy9tdnBtMFVNRjBxZlh0SlVkVnk5NzEwcStPaHF1dThoemhh?=
 =?utf-8?B?N2RBL3JLZzBSUm9IVzZYQncyRUpOUGxGdkdTNnhjN05xTzNSRGliUklESzBD?=
 =?utf-8?B?YnFhdjdhNDhYZFlZdENkVFZsQjkvVGx1dEVmcTlCRHB6ZWY1THZsaWFUcXJz?=
 =?utf-8?B?aGR3YUxVL05vTTZMV3dicWhmeUlTQ3hxUkRJank0QzFXRDBwcHpTekRxdlQ4?=
 =?utf-8?B?emRKT0VwRkhNQTNyQVBHOWNmMElxcUlSK2RmSDJyZk92Ym8yWHI0ZTlDZmlC?=
 =?utf-8?B?VkRpTnRnVUJXbGdiREhzMS9IUitoN2E0bFp3ZDBxQUVJRVY0ekNZdTNBUHp6?=
 =?utf-8?B?cXZMQVpTUTBXWGxoQ05jdGhYUC81bjBvek9veXJ5UnVSQ1RQTWthajd2S2ky?=
 =?utf-8?B?My9YV3RwMzVaMUNaNys0QUhSSFR0cEgxMFoxVmMrcERTYU9WbjF6NldNRmln?=
 =?utf-8?B?bEpmcHhDREZKY0tWUWVDeWs4ZUdQcGptcUtrdzBVaVB5RHBkYzdGRG51Tklu?=
 =?utf-8?B?cksyK3p6ZHI4YmNBMTFVcWtVcWpENnZjdS9QendiVWZ1bUFIMVNhSEc2MXlq?=
 =?utf-8?B?U0U2NTZYQjRibEpWSzJJUFZTbElIRjRnVkxkNG1ROGpKNjJLcyt4SVdHZm5E?=
 =?utf-8?B?RkhiWk5mMlFPVkFjQyt5Y2hQcVF0TGtHMHo2Yi9XRXFWbEtuS05yVmVLdlhR?=
 =?utf-8?B?SWk4blFmOXVXbkt1VTBScVRQOG5KUlQ0NDgvejRpbUtwOVFTdnk4S1JpUWl3?=
 =?utf-8?B?eTFLMnVXejhkU3RrNHZTbXJXeGVhMXlHL2V0a2xZSE00MmJGeU1aU0dESURk?=
 =?utf-8?B?c2xDK3RCNTBnYTFGOUJYY1hWVWJzcEFoK1VsK2huTUIvcVdXZFhtVUJ2di9l?=
 =?utf-8?B?aENZYUNMZDI4QkZiR3E2V2lXNWFLTXF0SU9iV0Nqb0UwVWlSbzF4RGQ1U3BB?=
 =?utf-8?B?S2Nnbm82eFZWeDBKSmMvRjBjK29ldmNxVEdOMkxqb0h4M2JjY3dqbnhreElQ?=
 =?utf-8?B?UkwyRGtLNEI1U3VaMTdXWlM1UkdnbTNRL1BIalpoeWdmb0Y2OE4wLzBWcHFs?=
 =?utf-8?B?ZGZLeG1NN3lGY0lWcWRXeFZOQ2NmZnpFNkZPeFFKOEUxYXg5UklQUTVuT2hL?=
 =?utf-8?B?NTJrREtWSGhuaHR1Y245Q1V0VGgvVlYrMEJncW5RWlhoVDM3bkdFbzUvRWo1?=
 =?utf-8?B?STUrV21HaFU0T0RPOEpBWFRLeUk5cnBTYTBqOUloSC9MVStDM0pDT0tNT3RJ?=
 =?utf-8?B?UXk2WFpBL3BVbnE1RnNPKzJkdDVlUEhFWTl6VVZSaUNVWUlJYWpER081Z05V?=
 =?utf-8?B?NnU5RmRBcnNDemx1aGtTR3JWWkdTRlJYamFuU0pNY3AweGlKVkNxbS9uK2Qz?=
 =?utf-8?B?cEdrMFJnN3JaNEh6YVQ5NzBKU2RLeXhHby9SUC9zTmxzUFRESGNsYTRJM2Uy?=
 =?utf-8?B?VW5jd2FJakNhUXpMUmdlc0R2S0t4dWY0VUk5Mi9CdTJScXZZNnpTSzJjTlA0?=
 =?utf-8?B?anNDYVN1bXhjcXNHS1Ryc0ZJYVQwTkhVUHpFbHAxNlpBNHYxYkhJUG9zclNh?=
 =?utf-8?Q?zrZGx4mrbbgoswjTJtXrLi0OfDN5fcZZ3vkgA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a08f39-90b5-4c88-ca42-08ded5f2a8c9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:25:32.5807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUHBUbqaYAlux+ykXuVUIEv1tSkNde/IFeA9rI7oZI3u610Sn29rQChez2QHz+gl5MYLpNJWMBYqOtaVcab0eRrXLCTZXCZCJxzs4Ixw4ofM1FvuLF0PATkWDy3kik7S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10267
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
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:laurent.pinchart@ideasonboard.com,m:festevam@gmail.com,m:p.zabel@pengutronix.de,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:guoniu.zhou@oss.nxp.com,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,ideasonboard.com,gmail.com,oss.nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65987-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,nxp.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC6006DCCA3

From: Frank Li <Frank.Li@nxp.com>


On Fri, 24 Apr 2026 14:49:49 +0800, Guoniu Zhou wrote:
> Add support for the Image Sensing Interface (ISI) and MIPI CSI-2 receiver
> on i.MX8ULP.

Applied, thanks!

[1/2] media: dt-bindings: nxp,imx8-isi: Drop fsl,blk-ctrl requirement for i.MX8ULP
      commit: 2514a04c7455d0bbf41b3b1bfc3af2984ed6a7cc

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

