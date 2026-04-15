Return-Path: <linux-media+bounces-58773-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNpRNgsK32n3NwAAu9opvQ
	(envelope-from <linux-media+bounces-58773-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 05:46:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC53400172
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 05:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6048D3044D09
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 03:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2233375CB;
	Wed, 15 Apr 2026 03:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sJjFHJmk"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6873358B0;
	Wed, 15 Apr 2026 03:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776224702; cv=fail; b=bFABdQ8cAF4z8UFlRVoO6uQsJZMxaacQr68k65IKmli9x1piItTcJNKTvqiq7QnDmnBQ65DsZi6uri1eXqFsaymiSzg5sPKQrf3gzAB29fvIj2KDa3EwHnDyKNXrQPVTvSGTav1AIBIjZjBpiPRQsN8Tp4ZArcs8FDLDS1g3ffM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776224702; c=relaxed/simple;
	bh=s5m9HVtmmSCAzC/pDI/ERzPQ7jE/VS4twCWvZK4sOQ4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=q6JYDuIdqa8/OvNgFB9ltFdjErTqqT6DN9zKb+TZPrXq57gE55hBPoG7pfVo3AXfXkzmUXpIYOHgjhVau+F0jbfgfm8K+4nBQCpx/evJX4MBfqRAKlsBwfoQW1peEwhI9EVbvjShquPJCgWIfOtV+L7NGtiZux3giQdgXgF0sss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sJjFHJmk; arc=fail smtp.client-ip=52.101.69.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmSzDNqsqijrmE7xOqlzj8ymIoZL/54RQQli7xzk5H9m0PhO1cOiZTQX8rR8+0PI2MRj4L2F11mXEdk/4D5KNUdrgbku3QvWdFzXgayIVi1h73Ob35Fr/SKJJsnIIQy2HboHaFvgWZesACuOdkTlXrR5bXX6BgwEpe986TRkiX4EntLChZyh5kNrdUog89XH9dxHEyIcJHu/T433abvzf757EbCDWmeNK/P5Upq4zdTpgiQt5ZTxFPdlDr6baxVU0Nhx0X8J/tjk5pGizhqAuSQHbdNcUc+L8fqRNPnwUI6lsAheHiLh/JBIhd8dJOqnVSyfS5zXCZnEN0GOB0aN6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PP1yBkrWLoPWPhcPUJV3Sl3P0ZFn/KcEpjuk2TiYsRQ=;
 b=B82svVe5h+wuk45AX7HWM1DGVAac/FSGiLzsM/H85PRBSWLOOAabeXH87kdMFDVT3yGrHvzUgASYZQibsDdVVV2Zn/cuSbzmuOFYjcr66OfS/XSe+OhkkmibvmjorWNXZmyWiXikXTwz2n0LxiF93iB5bKpauMJTgCaDQcTLkrr1F9YI+zM+8FOH+pIZKBYmXDLgG9GOuX/26x0CWI+zjIIcqUQqzSlqf7aP1hSfJErmCHT2y5IZHYXWJVTyZRM9v8B48BdXA7YQiqdjvWDKf0FzOdLsPfJ3CEnRt5vS8qRzdL+Fo7HjSyrtht8OsmJ0fxwKv4dRhBIFFaqip5juEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PP1yBkrWLoPWPhcPUJV3Sl3P0ZFn/KcEpjuk2TiYsRQ=;
 b=sJjFHJmkHgYnf9EX5BgLUvgM9h+BlvuZaELWdPMNiptZwrtMiyCC8//yRCPZyDPZlxnrhlkppbjzAlq/IRdnwSrcvj4KVTUAshdNeDbf6S/87SpH40SynQdmzt306yKAYBkhv7kReNe/nuwDRPKYPl5Hy0p2ZmDTGEaAQobEPApAf9O2h+0QsUH61CCo3bT/OhKJWBIstc8AMmFAFU1eozIfUe/cgn+6aQMrN8lJXEJ4gLWAoSLtfr4FzXLZLplMoGBuAJ6Ifjet4FirfVuedP6EzkpUZL49eM9rAQu3nh7SbV2Gar4c4AnA1k3joxkrNGT6xuIFxFSL/w/bcKTlhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by AS8PR04MB8785.eurprd04.prod.outlook.com (2603:10a6:20b:42c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 03:44:45 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 03:44:45 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 15 Apr 2026 11:46:52 +0800
Subject: [PATCH 1/5] media: synopsys: Add support for RAW16 Bayer formats
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-csi2_imx95-v1-1-7d63f3508719@oss.nxp.com>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
In-Reply-To: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776224832; l=1201;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=s5m9HVtmmSCAzC/pDI/ERzPQ7jE/VS4twCWvZK4sOQ4=;
 b=+CfsiWOJd41/sIMmcuFekHmleXzdUWV0rPiEXkMuRc3OyMWleAKLHAWfBf3QLoGvhf6la7ej9
 HeBXyCIGxJYDmk3Hb0zdzCIDBSijUfQoKV/4C3DJplj0xqtQ5IH4XPx
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0181.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::8) To DU2PR04MB9081.eurprd04.prod.outlook.com
 (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9081:EE_|AS8PR04MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: 873872a6-2e3e-4bc6-ce1f-08de9aa15586
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 wWTBe46GPJKaCf0b2+r2fqFRSTx7VHyKCg99GlIypkM3rU1wqmarwfV4Qu1dF46YxdhuElfWSMtTbQQJ2D1gfaRLz2rmr9LHeBMFKIgzamBQraIBUCgzjYquT2ezBRVnfYvBInqP12hGZiJUIQsN0AGxRHyGg5eMIS1uwKZj4Obc5SmP+lOrsWU5ZFHfmefO8/tW09iWfmOgN9P/U2NFowNpe9zRiWMsOK6PDqktn4PATS7vaAhJOHxplY3nwoteKDn/v/KRjco0GBQ6q+Obq6nZQhHk6kILmHc9LQBk/O7E7Dbkg4bYpNhpN10qUCX0XC3opN6RsrYm13zXEO4lCX92kZ/d0Bc4S6xkoSo7Ffk3lk3fTcWrycr46p6WNrrfGaI7ZZgh2T49K6sxU84G1vdu4lpLkH5t8IYmj8EjdJk9UhMQ2RyUedMKdAWnmELhlf6ICrxOdq100p1IIBEKXn1GPH5Bkw8GD+nz97ncC6NiumzXOD+ycLET9PUDIAcyYNqBLXQKCSjAOWBhHRT6eaYRRvxnYsp7eQbXlepNctDuj3hmRJwdHmzaAb8OWE5GH8wfQGHjCRJ3vciMHDQP4aUznrO41/OF0Y9Fc0j0RU4LGD5pdHwGRA+J6qmYGx2oqqQFszd3ykDzEe9npaLUyCzz/TmpBFrLfS7zRegPxNjgzskDwBys66ycBI7aRLfeNI9iApMa4SM41arGwDQtmgOrbhFm+n5c23E/shSYJgOfSOpfW0yr+5OYkh368NHBgFEupPYvWb8YQi0JIGDVlyV7nC9LKCZ9gA1Uwijcj5I=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?U3hKUnRtdTNzRTg2NlU4eUU3OHI5TUJhNlpiZXZQbmE4alRHakJ0NDM3NFdl?=
 =?utf-8?B?ZVUxdFRWMDNkVnFRdVJrNGt0SG8wc1R2YXVUb20xTkVSdFB6eEMwN1R2M2lp?=
 =?utf-8?B?WGlKMGUrRk92VU95WWRpNHI3NTNoalZxL2JibC95ZE9HQ1pXUG1IS1JERkhH?=
 =?utf-8?B?a2RISExra0pFWGJmc3BSVXJZd0NvZ3VuYU1KelZXc1o0Rjl4RFZlVENDREJC?=
 =?utf-8?B?UXV3aGthbnphaU1HWTZqTmM3c1NBcnB1VVlZSGNIZTNyNHRmRytJQ25nTTRF?=
 =?utf-8?B?TUc4RXNnSVBtaGlpYy9oVlJsZDZ4RU1ReTdQZHc1WkVLWWRHT1hCazZkSEVq?=
 =?utf-8?B?MmlZQi8xdU9ackd2UnBkQWVOOHQ5SEJISzJhVncwcTJWSnBvcmtqNTFsdExW?=
 =?utf-8?B?MnZiYWpLdDNvaVZBMVFNR0dzOVNiWlZ4OTR4MEhqdlkzYitPSTNRSXBMc0pu?=
 =?utf-8?B?N2tvL24zc0pnQTdDc0tTaGUyd1FhL08xU0EyaDdoSzN6eWZqNmdqNEEyUXYy?=
 =?utf-8?B?ZTA0dlZMRStGZHFKeVRIVCthSzJJdys5MlVzVHFsS2xtb2FFZDM4dk0rTjNi?=
 =?utf-8?B?ZG9JVDRpd00ySFNGOTUwNk1odHdEaUpaMUJZMWxCSmNaSXhGZVZxZFZ6NkRQ?=
 =?utf-8?B?OUdCSTNVbEFteHYyd0liZDNNSFQxYmhDcE02UVlrQS9XMnhFZ2hEQ3ArakFE?=
 =?utf-8?B?WjBIc3lyNENZSUxDL1Zic0Z4elpMN0VSSXEyTVdhTldNL3BBcnRBZzhzd0pw?=
 =?utf-8?B?cGtkVHEzUWl1eXdjOFo4S0hzdVlvUUE5VS9oS0s1ZXBUR3ZzM2VQaEtwZWpi?=
 =?utf-8?B?cUQxYnAvdnJzWVBBc2JkM2VrN215bmx4bUJNN0hJaWlDT0VENm5GUXRPU1Yw?=
 =?utf-8?B?YWRTMjhFYmQxd3VYczlQQXRldEF5QWM4N1I1UmEyakhQRFZ1Y2swL2NBT3JI?=
 =?utf-8?B?SFFkQXIwNFFyRDRLbGRLNnEvMGlnV1BjSDdSS3ZKSmpmVXpxOXExRm0yUHV2?=
 =?utf-8?B?WEc4ZkxoQlRYdS9nZzg1L2lCZmxNa2N2eGQwYmgrU2l1WXVuay9ZMzZUZWdi?=
 =?utf-8?B?UWdabnFna01zaFRUYXYwYTJsWFMvSkZhdXJ4b2RYOUhGb0ovbUxFckRHWXd6?=
 =?utf-8?B?VUNaLzhmT1FEUnFVRWV6SzY0YWRYWlNoU1FzMlJvelo1SkRPbnZtNEtYYjho?=
 =?utf-8?B?VWtVSjdUVU51Q0lRNDFtYTNRZXg4T3VxY3Z5a1UvYlJ1Y29kRnlYbGcxK2Ex?=
 =?utf-8?B?amtrQWVUMDFXRElLRUN4OFdIM2pzWG90VnlnSExnT2l6c3dydm9qN2w5Lzgz?=
 =?utf-8?B?VlJhR055Wk9HUHVNMWNQVGozVVhoaW1JanVuY2JyMWtzVnMzVzRXanV0cXBj?=
 =?utf-8?B?VVVnYzBuOWhoeEwzMzArMjhIQXpvZGt2UEk0NUVVa3ZXOENCQ1BjcUlnMGl5?=
 =?utf-8?B?M21JSHR4ZE5uZEtXOFE4M1FCRkhVaXNnMmlneWE2ZFQwb0hQamFsZStZdCtm?=
 =?utf-8?B?M2lBb0VWclNWTXh3dnY1SUlQellBL1hoaVhSYnk0RnN6S1VxMVpRR0lORWVH?=
 =?utf-8?B?ZjYzRTQ1Z0ZqdHJJaDJJREZ3Yk1IRmszcDBtVFNnRmFBZEhGNEFtWmlvSGpG?=
 =?utf-8?B?OTNSSngveWxMaEhvT0IyTEZJT3lIbVhFaW04bHpWUGxQdXlqYTlnSHJWSFl1?=
 =?utf-8?B?YnNkUjIzUzVZR2xaN2ZsOWJIazN5azBqTitGbjY3UTN6TlZIT1hEcFVCWEEv?=
 =?utf-8?B?WU95WldyUnh2c2FJWGREbmhqNC9kM0VWN0YvbExUQ2FST0V5VlRWWXhNRlNt?=
 =?utf-8?B?TzRBZUkveWgrQnpkYmxPY3JXMnQ4Y3FrVmhwUi9kOXgyVGNwSHdKdW1Sd1Zq?=
 =?utf-8?B?WjZvS1daSUtoSktLQndobVV2L1cyNjFNQ0IyQVB0VTNSMFFxT3FJSUVBR3gx?=
 =?utf-8?B?Q1FmVGVkNHRqRURtaTlGMDYrOGsvYU9WcnNJeXF4Z0pUMFc3Z2hwNjJ4c0NF?=
 =?utf-8?B?SS9xZW8wT3BWSWVYMURqUUd5clk5c2greEFXM1ZPTEFwYjFkVlpoUU9LQkJk?=
 =?utf-8?B?aXJzZUgySCtrOWtvMVVTOUdweXY3WWlrdWpsOFhXenQ4ZnZLNU5xWjV4UWhr?=
 =?utf-8?B?Nnhwd040S3BRNWltTWpWdVFsVE1yQ0ZUYmN4VHJUZitqUG9mbFV4YUN6cmd4?=
 =?utf-8?B?TGVYNTc2MmxGY0Jib2dMZ2d4OTg1UDNmVXJ3T1lRbTRwRmVMTkhSdHIrekd6?=
 =?utf-8?B?N0lKcWJRRzFteUQxSkxMYXE0ZXM3dC9KejdwVUJybVdNODdKajFMUkdSSWd2?=
 =?utf-8?B?OGxZcTFaWURZZDkwdnBkcHhTayt4eTF4ZkZiU3JVOFQydTF3RjlpQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873872a6-2e3e-4bc6-ce1f-08de9aa15586
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 03:44:44.9696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nzytzlh9qu0OYIwxvzo4BE++oSVvz4fZtjHS0bxdLO6i55AL9/+w/0DMVWQU4lsgaIVhlvXT5mrf9j9KH3rXdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8785
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58773-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.nxp.com:mid]
X-Rspamd-Queue-Id: DCC53400172
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This enables the driver to handle higher bit-depth raw image data
from image sensors that support 16-bit output.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index ce17f986279e..46e2a4315ac2 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -252,6 +252,26 @@ static const struct dw_mipi_csi2rx_format formats[] = {
 		.depth = 12,
 		.csi_dt = MIPI_CSI2_DT_RAW12,
 	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
 };
 
 static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)

-- 
2.34.1


