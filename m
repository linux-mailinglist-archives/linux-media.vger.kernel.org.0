Return-Path: <linux-media+bounces-56668-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPkRHIX7wGkwPAQAu9opvQ
	(envelope-from <linux-media+bounces-56668-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:36:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 104FC2EE4F5
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC45A3051CAB
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 08:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4835837E308;
	Mon, 23 Mar 2026 08:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ujbWFtGZ"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010026.outbound.protection.outlook.com [52.101.84.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387D437C110;
	Mon, 23 Mar 2026 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774254712; cv=fail; b=f5efZ4Qsxo7Fjyebg76ljpiJFh94oqDLLgW3xAyQyz0sE67VOzLcx0ut6QvHrD2DvmG92C5kyoyj7bPzkR/YEfWImYJbGOSCUVyYXzj3zIuFYslT7p42AVIwLHPR73bZgw97tZL7WmnzbgHO7J5DD2A0LQb5BNfHsytyDlp+fjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774254712; c=relaxed/simple;
	bh=AsjpPWeIvOwa6CVmsm/WLxuAdIeXNCPI5eGVLKc0Hvc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qfApGQEMAPvublAOG3VL8rqWlBUYIE30/AGma4R1fWiXhmafT1kb3ZoymP49rp/oqQD98ghc/8E2D5pveB0k8spWN7atUvy/pLL2upV7Y8aJQhm0Nuyi6OSfKj0Rw0/QlFBTSJ8V2z8LIuwe5fyZTISWsqqSDL3VszbErcmaXPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ujbWFtGZ; arc=fail smtp.client-ip=52.101.84.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+QjmZWAaggO20re1W8vmMxB1Bz+odFP5Y6p9n9NWQf0ZYEoK8ISQu7LBH5DVcqrqZdn07CtVi0QpUCDDTiKCmeCK2WVJ3I6ttC1UCMB116pP6z3y2vRquC3Mtqkpt5QB7W0mdhKNGoKGYA+k76SXX6sX7pytlzyJh9kmqH2Ens4cn1uH4qZh7pX0TfxWBpdlR9U3uH0DPfmTHDFr8k0mKpayN3veUQWvPZM8ZF6gNj74afzPToTGgrZygWdZ0mDTtLicuZAKnKuXmR7dy/oO+o6YjRRGN6LgTZT2BS053Ut+XKCH6b4MulOpO7VgLMUyY9m78L5QeyGtwI0m6x6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/ZZ2V3VJpKbH55OK4IZhIGHIsa8LENy44odvkHgSr0=;
 b=oO3QtURf3FC9Icj58nJYFIrlMMsUgAQPfRdMgl69SeznrZqYg4bC2Z5HFs+Fyn5OkL3qMPpbWdJtWVwmVag4wXAkvG2e00CBkxlJRGdMgTJu6oM01fwC8orEdcjzJr+tY+gcT82lBjAeDawW5QA/or6ocDB0qw4z5CV0kv4D1/OCB8PRDnCFtG50R2ePAtu0sSuLpn6eQtXcbxsbywWbbHfxt8TWhXXxRty5pVo+yleAS43ABxv9xDhNfh82fly0UOBkCz0feYdLFfI6EzkehmjoXZ/T1rjuzJ7B6aK68AVZGkkal8miY6SPPIYMJginzcjt+y5tAPg+B9zojq+dbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/ZZ2V3VJpKbH55OK4IZhIGHIsa8LENy44odvkHgSr0=;
 b=ujbWFtGZUPxiM80Dtpj/NJ76sdv1f2wG4P3ChOmLh8nmXUySFn8K3PhFnb4auURfoORLCT+Gb8l4J/rV7WAEN566XD+GL6/77tccfnkYCdkcqakCJn0npyuPkfnBw51nFbrtcHJhP3VDXoY9txCUolY7qd37UqjBTpCIxUFzdkXxrL7xGSw3+O8cRlQ0x+wJLwzQ2sbQakdkrVbM/dcFG9/ejFfZvd9DOWWoXpdN3oHDz8Fd38ZYzrj/P7L1lr31Icg/k83SnY9PnXDXlB/IJkWor8uvEVWwndkQqUbWvPR4IORstnYCLtFy9FSgk3YMmQWZfpMjjQIrEBqK+8njzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB10993.eurprd04.prod.outlook.com (2603:10a6:150:226::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 08:31:28 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 08:31:43 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 23 Mar 2026 16:33:30 +0800
Subject: [PATCH v3 1/2] media: nxp: imx8-isi: Fix potential out-of-bounds
 issues
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-isi-v3-1-8df53b24e622@oss.nxp.com>
References: <20260323-isi-v3-0-8df53b24e622@oss.nxp.com>
In-Reply-To: <20260323-isi-v3-0-8df53b24e622@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>, 
 Frank Li <frank.li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774254837; l=4823;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=JDblkfHoHAEQJpaLB436kGhQKlX4mAGfuOGxdLlow6U=;
 b=YzK0Kc/LaiOgQT4RFQEL0gV24qTpnIX6k8SCwYBMAprhTfM7Ti0uNSWrpFn40/t1MGaJM/BQ2
 Q32FPMHGcP6A/OU9sEJog3UE2pC5KYkOjv+aHbLmcxI2AfpICBS7u1y
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GVXPR04MB10993:EE_
X-MS-Office365-Filtering-Correlation-Id: 23120ddf-9fc0-42ea-f51a-08de88b69ced
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 gnfScCHlezuhWyjLJyiPQ9/m9ecMZIyL0BEhZB25kTJXjab3UH4xJ6B2JBkFM5+m2sHfnuBYbiCUY7kgFFbIz0hKlT31MQ7q4hHGZKP1K+l9DJ9quzg/erJCEFU1NtDZhRREOaRZDdRfbvoBjGNXHCBi0tKmLP88H49gsN3EKWXPvFz8PfiQObwPPBhgInU0Obx9Nf1rL9SitsO5YEJRzmrS1ya3bztXrOGj//Op92i/yHL9leWLx2WsFXNLGugd50IN06Nqthhs6q4y4b3iCz16KgjXhcn93tq2/acDPEhsZhkUYZcUtI9Z+O7m+ODFGegG6HOBP+46n7cXapwZ5nj16gfD9USSjOmvZw6rJkFNw6KksD2rwXZ9xx07vpq7MwbtTJ9AOOLoZPGwvwkxcgjaaYWF33yw/zvcdgBBE2ltWd/DHDMrJbvYw/IF9Joaz3k2T0Jc2OhqYkxsyzqSLClKeeTMc/d/esS3wZVQP4T7TGj+21Uhl/8VN9o2wBrd/5zZoKpMl4X13+T66YLUbWh4sHjxidw7TsQLKhhq63MYgU5vk5WDj0CCZbzUdDMEH5tRczN+W4I7vst81O3skG/rNf7SRitDXjfOfAhvOuhlWM/JmxwICIgmZyZMLkPqDqvWsc9w9zhBxXLvChn0YWSTYLJRYVE3DcjfIaeiRhqRx/lZsT8qUwfUEO202QdJTISDB3j3sRzC0kd4AjN84J7225YjzLWY6rfkQk6QFv9jFQMHYT1pPkQ4rFQtViSbH6cAD66BqoLEUUvkGhMckbNOENGfHNkHEVSZuAsUhF/ufJel7uE7uRmh2SyINU2U
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WG9YcDIxUDA4OG5KU0xQZTU2YU5OWCt5ekFXQ211dy9hSVkzRlBpTS9MTkc2?=
 =?utf-8?B?dWd4SE1tRnJqMXlxbjJiUXkzWnlGY0lJQXUzRVI2RTR0SERSTXlnWm1oc3pD?=
 =?utf-8?B?d3hnK2lFNXZLcVRqOWgwOTNPdUxJVU1oWm9PSzN3SXRlc3FSbWlOcVJRbUpO?=
 =?utf-8?B?cmpvNFhmalQ3dkNydWsxajRKek5UNlJTYnord2NVWDh6TE9vVWwyanZiMzZl?=
 =?utf-8?B?MjdVSkZHdG03eXZOR0Q3UDRUeVBFWWQwenhBVnU1VDk4RUJFMzc5VDQ2ekhp?=
 =?utf-8?B?M0NEekxoR1lMVnNidEVTbjZCWEFiUVNYaFd4cnRvaHE3aFplN2pFOUtieE9W?=
 =?utf-8?B?YXJCM0NBNUJCU20vQVlrNnZGendNbkgra0JOZkJ6OXVmMlYzNVkwMWdZQlJT?=
 =?utf-8?B?dUJSTTBuR292aFk4UDdWNmhSYnlSVllSYitTOXNqT0NLZTRQQ2pkRGZFQzFq?=
 =?utf-8?B?OUwreUE2VysraGZYOXZ0dGp4Y0hpNVNtOTBGOWJhOW9zdmxFazZrQmNmVkpZ?=
 =?utf-8?B?UXoyeHhnaXVZencyMDdlM1Y4dE1QRjdOOHJ1QTBxK3hQWUxYZU00UlVPeTNV?=
 =?utf-8?B?SnFYWGlhNXFLV1FlNU1yNkRCTGF3S21WUlY4Nzk3N0ZyZFFxWklnUkxqdGxK?=
 =?utf-8?B?a3ZHWm01aE42NERuYnBiREJrSU5BZXVvNFVPN20vSWV2MU9pUmZLMkx5UGVQ?=
 =?utf-8?B?NzhzU29GRm95ZVB6citxT0Y1MGJ3aXRKSG5VelZLb09mM1BrY0VGdXRXSU9C?=
 =?utf-8?B?TFdMRGZ0YUpHR2Fialh1NUlHUEZSTVhMRVZsZlRqelJ2WW8zV1g5em9Qc2M0?=
 =?utf-8?B?QmIxUlFJdjU5VHpBaFBkNVVFOTFaU2JKZ3ZLMUY4bmFQUThpN1h4TCt1OWI3?=
 =?utf-8?B?SFZDaWI3OFFHbVJDNzhNMXRMbm0zRUVqYk5aRVgwdzNlbzhpR1owSFE1ZitS?=
 =?utf-8?B?L2VrYlR0MmM3aDE1K0hQM2h1L2Y1YjFFVWFTN0FiWHE3dTRDVytBNmxnTU1B?=
 =?utf-8?B?cDQrTFkxTU1NRUZlZ0lxdFQrSWZlM3I4U1lOR01MbFREZ0dPWDM2dmxPamdR?=
 =?utf-8?B?Yk9oNjBZK1hjTmYxaWNxVUQxZjNTQ3ByMVNjMjNPMjlDN3hmSVNmbWxsWXJq?=
 =?utf-8?B?bjlQWFRSTmI4ZFg5K09xVUx4bDlscU9WQWozRjdaYXIrNWVqbGI2UjVlZEkx?=
 =?utf-8?B?aVVtR2dQWlluZys4QUo4QklLMjhqY2RnVmI3b2EzdTl1dU9maSs0WWpaQitZ?=
 =?utf-8?B?RG43OXFOQ2pJMVFZZW1kOXBPQThyNmM5QmduTHIwZWhMK3oyVDNrOE1ONkQw?=
 =?utf-8?B?Smt2Y0FaQ0ZKakdUVEFZMys3bzNLM0R6bTFJRXNFeUt3K0Q1TE9CNGY5MmVY?=
 =?utf-8?B?dXpXNmlEbUhNb3c0V0NUc1JHVTVOZUgzQW1IVGNib2xCbldPM3dlR1F5SWNo?=
 =?utf-8?B?bE9samdOc3hnNEZVMzJ1ckVzZkg1TlRPeThHaWppWjZsREwyQ1h2allrZ1VS?=
 =?utf-8?B?OUNXZTNHMUh5alJBemloNTAzWG5OWkhFRlhrM2p1bkZrRTh5NWVCUVNlMktj?=
 =?utf-8?B?VGFOYm1PM0tvQTN0ek1SeHVEZmkrbjkyekFwZkNQc1BYSkFsYkMxa1BzcFZz?=
 =?utf-8?B?WXhUd0JZMlBNaENIbkx0UjlwbUJKVTZ3ZFBFS21MWHd5cUFxWjBhSjJ0V2E2?=
 =?utf-8?B?NlRaZlNWTURGYlYwZlNraEtnSEM0ZElrd1pneFdCajlOQXpoY3Z0NmJER3dW?=
 =?utf-8?B?NXlTeUxEOWRuSUdIb1lSMzFYd09nSUpyTVc1K00yb0ZWb2xhNWFjZVN4QW5t?=
 =?utf-8?B?Mk1JOWJmUjZXQ3RtM0RGMnNNYUxPY1dLSlRIcWVSZFVXMjFGeWdSSGo5dW11?=
 =?utf-8?B?SVZFRkpIdXBGYVIwcjdZV2VLQm9kSHo0dUxhY1RCZ3hES1BhMVE2b2hPSlRh?=
 =?utf-8?B?VkxMVGJDdDRLcXB5OUplYXd2MjdyOEcvcVJ3V0Vsc3kzTUtxbnZwMXhGVmhp?=
 =?utf-8?B?M1QzWXhweFB1eCs1UEpoZ2Y3VGpaV3JrOG5Ld1B5YU5IUGpMOVNNUUZKcFJr?=
 =?utf-8?B?RUo0R2tUSTV2KzJjRitzcnRTQ3pUQSttVFpsaVN5QzBIM1NhUWg1SWxtZ0Ur?=
 =?utf-8?B?SUt1elEyR1c0eTc1eFVobUV4RTZua2pOZ3MzZng2TzFTcmREZ3FyRUV4VDlx?=
 =?utf-8?B?Q1I3TGlFWHlIZjJsam8xVVBmWHNUTjNBbTFCZXFza3dBQ1o1RlptQmxaK2hS?=
 =?utf-8?B?dEVDeUlRa21NODZFVW13NXR0bURzVERxTjd1dEJ0TFQyaUEzRjhTVFFLN0J0?=
 =?utf-8?B?OElHcWc5aUVjUlFaZ2Rja2JnUy9BQ3VSUEhhV2dwVVAxNkgyNlhzdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23120ddf-9fc0-42ea-f51a-08de88b69ced
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 08:31:43.3637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leCKjU+mwLiNPScNNzR8pAEl+jqe2VRPRhcoyc9cKf2qCw9685cxNalRjn9cYQvtT1cGnh/8rXZuLhwzBBthDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10993
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,phytec.de,jmondi.org,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56668-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 104FC2EE4F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The maximum downscaling factor supported by ISI can be up to 16. Add
minimum value constraint before applying the setting to hardware.
Otherwise, the process will not respond even when Ctrl+C is executed.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v3:
- Replace CLAMP_DOWNSCALE_16 macro with inline function
- Adjust downscale threshold from 0x4000 to 0x2000
- Clarify downscaling limit in comment
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 16 ++++++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   |  2 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c  | 11 ++++++++---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c | 13 ++++++++-----
 4 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 3cbd35305af0..822466445b72 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -11,6 +11,7 @@
 #define __MXC_ISI_CORE_H__
 
 #include <linux/list.h>
+#include <linux/math.h>
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
@@ -413,4 +414,19 @@ static inline void mxc_isi_debug_cleanup(struct mxc_isi_dev *isi)
 }
 #endif
 
+/*
+ * ISI scaling engine works in two parts: it performs pre-decimation of
+ * the image followed by bilinear filtering to achieve the desired
+ * downscaling factor.
+ *
+ * The decimation filter provides a maximum downscaling factor of 8, and
+ * the subsequent bilinear filter provides a maximum downscaling factor
+ * of 2. Combined, the maximum scaling factor can be up to 16.
+ */
+static inline unsigned int
+mxc_isi_clamp_downscale_16(unsigned int val, unsigned int max_val)
+{
+	return clamp(val, max(1U, DIV_ROUND_UP(max_val, 16)), max_val);
+}
+
 #endif /* __MXC_ISI_CORE_H__ */
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 9225a7ac1c3e..37e59d687ed7 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -11,7 +11,7 @@
 #include "imx8-isi-core.h"
 #include "imx8-isi-regs.h"
 
-#define	ISI_DOWNSCALE_THRESHOLD		0x4000
+#define	ISI_DOWNSCALE_THRESHOLD		0x2000
 
 static inline u32 mxc_isi_read(struct mxc_isi_pipe *pipe, u32 reg)
 {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index a39ad7a1ab18..a0e2061f4344 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -508,10 +508,15 @@ __mxc_isi_m2m_try_fmt_vid(struct mxc_isi_m2m_ctx *ctx,
 			  struct v4l2_pix_format_mplane *pix,
 			  const enum mxc_isi_video_type type)
 {
+	const struct v4l2_pix_format_mplane *format =
+		&ctx->queues.out.format;
+
 	if (type == MXC_ISI_VIDEO_M2M_CAP) {
-		/* Downscaling only  */
-		pix->width = min(pix->width, ctx->queues.out.format.width);
-		pix->height = min(pix->height, ctx->queues.out.format.height);
+		/* Downscaling only, by up to 16. */
+		pix->width = mxc_isi_clamp_downscale_16(pix->width,
+							format->width);
+		pix->height = mxc_isi_clamp_downscale_16(pix->height,
+							 format->height);
 	}
 
 	return mxc_isi_format_try(ctx->m2m->pipe, pix, type);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index a41c51dd9ce0..b290821d03d2 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -641,16 +641,19 @@ static int mxc_isi_pipe_set_selection(struct v4l2_subdev *sd,
 			/* Composing is supported on the sink only. */
 			return -EINVAL;
 
-		/* The sink crop is bound by the sink format downscaling only). */
+		/*
+		 * The ISI supports downscaling only, with a factor up to 16.
+		 * Clamp the compose rectangle size accordingly.
+		 */
 		format = mxc_isi_pipe_get_pad_format(pipe, state,
 						     MXC_ISI_PIPE_PAD_SINK);
 
 		sel->r.left = 0;
 		sel->r.top = 0;
-		sel->r.width = clamp(sel->r.width, MXC_ISI_MIN_WIDTH,
-				     format->width);
-		sel->r.height = clamp(sel->r.height, MXC_ISI_MIN_HEIGHT,
-				      format->height);
+		sel->r.width = mxc_isi_clamp_downscale_16(sel->r.width,
+							  format->width);
+		sel->r.height = mxc_isi_clamp_downscale_16(sel->r.height,
+							   format->height);
 
 		rect = mxc_isi_pipe_get_pad_compose(pipe, state,
 						    MXC_ISI_PIPE_PAD_SINK);

-- 
2.34.1


