Return-Path: <linux-media+bounces-49128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C18CCE312
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 02:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90CC93070F26
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 01:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9EE242D7D;
	Fri, 19 Dec 2025 01:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="as/IJiGY"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013034.outbound.protection.outlook.com [40.107.159.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAF623E334;
	Fri, 19 Dec 2025 01:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766109005; cv=fail; b=TPjWi4OsT+YgRxvPQEDkRHq3IrPguqAg8i39+eH773h6bFjb7Lj82GqU6wIoEzXAspjvbFo2y0W1OCB4RDn/yeAbqi48scj0un5Gba1GL/Cy0qL5hiS57GjnN83Vaw+jUZ0/E4gJAo37UuAalTymQKmLuHdvGPLg9KtxicNHK/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766109005; c=relaxed/simple;
	bh=zV+GS0IvfoTQmrBZsyOvz5060y3K4NrcSUUo2zX9ZXQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dpwakJKHCagqKFxpwuF4wN+719tcjlaSTJsKEUUCwMq5F1K+jGNbKYdbWKh1D+4DC7YMVlPz7y49umbAOjKmNewsHm9KaLBBLNdHvShR/cIriP4TufNERGH/g0SBXgdBzKaHoqdtC1yEkosXI8Idn2S0rgCURi3DaN1rWmUNiOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=as/IJiGY; arc=fail smtp.client-ip=40.107.159.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9il15TLJTBEqGf4pchpkDVe37cpzlZRQPA7SUISr4S5DRmjykEqjVGAN/s4gih/s65serDbw6POOe0p+cYQN5fH5l7LB+Fs3tCNSNfU8tQmdyRwPQNBmX9N/ZJzwSP2koqf4C9PRmvf0tZ2VDtpbEccl0hd+9xLtsKqol1r/yAowV5ZT/9vANa+n/sdFIQcYZGg5mUH4lm/esY4zJQ2TBOHvcyIErz2at7oxAzgfD3C3+MJhXWr5L0jwbpEUWPQMqgnZwfBN2zTnx2dM+Swal2xow03WshhG6oWFd5IFDJf+yJsuWfgSrFHe0NM+m279CnOpOV92FTeA6dBAr69Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToCLTJTtU+VRr6HmD8QPH3ACodjAIu3/xjtbZt9/Xd8=;
 b=jYAFf0zvS6yJnHByNabHfsZc13nl0Sv/yG6yqIfNgfB5XNiKzCIsTm9rx4+iifYs8WOoZM8eL6gJg+asnd70zzuAEZqekka3jkYt+wS3DRxMoY/RyOiZf3bYvJWgsClYLfzXR/QBor/5h9nEhcx4fuQWwfcSG1SiNWL5+pGjgVPfbWwDvDioJAqEJ2uII/vfsOkaw36JEYNtCW8CAWgIgVRme8z4CkxjqneBdHLzkudBCrHhs8F3AOJLIGU+slGNKjw1PGTYfpeW3xg+FwGauysdhxjSvNLxQkRL1qom00v+7l8oe3JxnA53IUOlnBOV8BjYwlGsH132KtCRgkJRHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToCLTJTtU+VRr6HmD8QPH3ACodjAIu3/xjtbZt9/Xd8=;
 b=as/IJiGYQLloU9aNWCRdHpo+JxaTkCDxgvQwqnhNJXy0CYptsKQhTlv+Fb1f527ObG7zKBdXWTNV8xZvTC9okfLVbdnCu9CyrUmWIJObGCCjWZiyFD8V0te0qodC4O7PIeRlM8ohLHjHiNid0jBQvp7C/dRnwI8KlqY7stdDkFe/jPVWB1PO6A/12kk1WOig2KnFq4GgICZK5gfrjVIkc3rI11vrE4Op1nhTJ85C99Hv36zYKT1yIXykw3f7PuyDnUFsyHMfS7tHSyHp+ZIfECuvh0pUJc0KeYxf2QKAFWOP9DL4Ja6iZGiAVMNABEQjPmsCanqDLGlAOBOoC9jxnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU0PR04MB9495.eurprd04.prod.outlook.com (2603:10a6:10:32f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 01:49:57 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 01:49:57 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 19 Dec 2025 09:50:58 +0800
Subject: [PATCH v3 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2
 driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-csi_formatter-v3-2-8680d6d87091@nxp.com>
References: <20251219-csi_formatter-v3-0-8680d6d87091@nxp.com>
In-Reply-To: <20251219-csi_formatter-v3-0-8680d6d87091@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766109067; l=28338;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=Wl2tKt2ewjY8BqfD1iDZ8DaZFOKOtJ85tlo4WSV4gbw=;
 b=WnfkGSsFvTN79KNlXTcuPxqBuRF0z8iSvIpkoS6tMcoGDdZcxGH4Bv7aIzVcvgrFyytgN2sdR
 YNGDxgArL1qCyaA0vklzzdX+Wr2gJ9nN8ZyBEisnBTKdXEMLskU4S2H
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU0PR04MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: 50055622-a545-415e-7e23-08de3ea0e9db
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|7416014|1800799024|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?LzJTU2dXVUxYbUIvbFBuZEduU214QmkrNmorU2t5a0pqZEVWRzZIeEt1OEpI?=
 =?utf-8?B?N2pkb0U2UCtOMzR6Lzk0WWpwekJURXpLSSs2OGNFNXBHY2NISUc5SWg3S2FJ?=
 =?utf-8?B?clZKMXZwOXMyZDVvVTl3RU5CSFZzOWNrbWNsaEgrM2lvcGp1OVlXeXlJNXRH?=
 =?utf-8?B?Q2dJM1lrV3k4Vm5ydytXWWJzbmtJVk1abnZIMGZkQmFmR3NJNUdHdUd6eWg3?=
 =?utf-8?B?S0pYdXF1K1lTeFArYUlpcjJHYXBuQStDd1R1V3JTU25rZS9zZkpNM05udGNS?=
 =?utf-8?B?ZytsdTJQRTd1VTZkTzgwTFJhVkxXYzJJVGdKTnAvOTBCNUE1TENURGtoVmlO?=
 =?utf-8?B?M3h2OWZFL2txMDk3Z3RBaVB1Szk2cFBmcmhBcWVIK1Rab2NjQWd1OElnSm1K?=
 =?utf-8?B?c3RtVld2UVd3SVFpQjRkNEZRM2p6c3VKbWVHMXJrL01IS2dFQmJxeCt0TTcw?=
 =?utf-8?B?VzZma0k3Qy9ocEVxUmEwVVZ0N3I2SWVYMHBLbXp6TVJTd2hKOG1mWlRxanVW?=
 =?utf-8?B?eVU0NitCWHl2SEpXZThHVXJOTTZHSlh2MDhQOCtHS085UnFHQmFqZjdjTzFt?=
 =?utf-8?B?a1krTG1GenFkajZhaWdGRUs0MG9LekNIV2cwcVQxVzd4bUozNFdVU1VsRFZU?=
 =?utf-8?B?UWRPK29UbVJIYnR5UnRxa2tldDdCNjZFRnlnZVFRdTZrOFVBWkhYaklJU1RH?=
 =?utf-8?B?dWxicHFDZndvRVg4cWhmbVg0RUJTdG1zVGQxRHBvcWtyNG9xOThUVnAybktF?=
 =?utf-8?B?djMwVmJSMkhsdjlUMVMyVEh6Ykx2WXhUUldmYU1FQVVPL255QnViS1pveW9G?=
 =?utf-8?B?UFJDQm9vRURMdytBWU5rLzYySmM5TTNiQzVNYnY5UzlXbEdoU2ZVWW9LYWYy?=
 =?utf-8?B?Mi9VQ3JlRVkxaUVwaTcwODJ3YVNoTTR6QnJ6MVZpV1lYMnpWMVRvTmVIRnRW?=
 =?utf-8?B?aVBrZnNRaStha05ETEhHWWZVdVZVSmkvaUFTN2pZZ2MyOGdxaEIyZUdCVWND?=
 =?utf-8?B?WGVZeGlBeFVNRlNuelIwWXk5N3RWYm1MOWdYclFDV1VyQTB6Nk5IY25tM3lI?=
 =?utf-8?B?TlZ4M20xSExmOXVYc0FJUnJ1SCs0R1pTN0tRdVk2QzB5TzlUYTdFVjlvdWZN?=
 =?utf-8?B?TVh1cjVnWnkwWm1pb0MzWTlpZE1CZDVETDBOMU8zZ2FnOG9wMEx3d09zYll2?=
 =?utf-8?B?QjR6cDhBSHVsY2ZmYk42MllabTUyck5Nc0ZOdVR5TUJVZzBTakhwTGZ6d25Z?=
 =?utf-8?B?Y1E5K2htTzZlOXI5c0VjdTc5d3ZnakdaZVlxNEc5N2Z6ckhCYzRiZEkzY1k2?=
 =?utf-8?B?L0FwSjQ3Uk1tUURFb3MvSUpmb1FPeHpJUDBZb1RkWC9DUVQvSmtMeTF4dmJJ?=
 =?utf-8?B?N2NIMlNQTE52Slpad0NPVjVuZHkyQlV4d2FobEd6ei80QkN5aXAvdUNXanVx?=
 =?utf-8?B?ZS9aMndtS3Rpd2JTZ1lFMXhCbmFzM3B6ZEdSR3UzTFFzT2JsZHNiaEkyWEVo?=
 =?utf-8?B?ZkFXRXdoK09oemZGTk5LcVR1anlqZ0FuWk83T214bFRtUXppcTgwbStnRkRY?=
 =?utf-8?B?NnJkQUdudC9LZ0t0VjFHZTE4dW9XY21yU0RsMlVFekVZNzhFQWRJeTN1b2Q0?=
 =?utf-8?B?eHhxNkxaVGpEaElkMVRIb3R6c0NvY3FSM0h5NnNOMkJwTnRuaHRXVjcrNzZZ?=
 =?utf-8?B?MTAzanA1Nno0SzRFYU1ZNWdzdWpSZDBJUkt2ME81blVWdnRRVDB3UCtxaWNt?=
 =?utf-8?B?TmF0N1Z0NVJ2QU5abkxTNmtwWWFKQkdUOFJBS1JxVzE4VlM3dEpQMHlHcjA4?=
 =?utf-8?B?dG96a1ZJd05NTVFTRmIzaVhtNjd2c0xWUE1FVEtPNW45NkhabWxPQlNlb0ZX?=
 =?utf-8?B?b3JEemZNUjM4TWh5N0hxNlJEdGkrTWlBSGpzQlRFYk9JQ1l1WWZWSzZncjF5?=
 =?utf-8?B?dXF6RWRUVHJ6ZGwxVHFOS3UxVHppZU5HS1dFclpXVE5KdktheXNsaDFiV0RI?=
 =?utf-8?B?dElZNThJcmhrV0RTSU9GbHVwbGY4czZJQlpOb0VGcTFGRHY4VWp1QzRDT1BL?=
 =?utf-8?B?QlRJOUpGTXMrd3IyQVd1Y0JnNllRd09TVEhTZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(7416014)(1800799024)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MCtCdzc5dFpwYjZzYTJkckNybG1ZTDJqWU56SXhUc09QY1lTK1RxT2FNcFlT?=
 =?utf-8?B?azQ5czhRcjVXWnV6WENZVWw4aUg3V1FZNkFhckI4UDlhVXkyazNPUk9CVEhK?=
 =?utf-8?B?am9mTDJyLy9nRFBGL3NGQmdyY2F1K1l3ZVY4QnBRR1Q4U1lTT2FDaEVPQWNC?=
 =?utf-8?B?QTd2TXNNdTFlbXUyMDNkcXl2TFpYVHkzVUtUNUpwMVVjdGhqaWhZK0dkb3hs?=
 =?utf-8?B?cThMOTdXNGVZbzNqRGl1YkdyVkZOcjZ1ZHEwenVwNXVlelBSUllMNFFtbWov?=
 =?utf-8?B?ZHlsRE1IUFhzbkdJU1FaZDlvb1lnejh6SklocVZHMXBOMDFUTXZOc2V5Unpm?=
 =?utf-8?B?c3g2UWlwcFJvQzUrQ0c0d0prcUhjQ2hFcmNQakdzc0hUZzZnR3UrMXppMmJu?=
 =?utf-8?B?WkExWVZHS3VFdE5SQWsrSWlPYkJyYUNSZjRybGpFSjRvYnZLYkZSeEpSeGdT?=
 =?utf-8?B?Q2gxQ0VSUnJwL2pmNEtoeWJ2SXhJd1JFR09jYTN4aWo0SkdCcGZ6MGF2ckh6?=
 =?utf-8?B?a1JjR2t6dXNLdUxtZE4yMUdBUFNLQXNDbTlTWks4SElYeFZRZDFhVnlyQy82?=
 =?utf-8?B?cGdjVEhaSnFldnhxS285dHRHOXhZM0k2YnFRTkRIOXdNMjZWc256TTNKZXRC?=
 =?utf-8?B?ZWluK3k2VEw2QUk0Q2d2cmc0VEdJS2RWMGV2cEJKTnh5ZkFwMUFUTk5veEdI?=
 =?utf-8?B?RnVJU25zV1diNTUyWHFUYnVPaDBORWg3WXlodllQK3dZYTQvR1BOempNTndC?=
 =?utf-8?B?NnRkOHc1TDdQeVErdkNBOW12WTJrN2tTQWRGZmFhdXVMRWlicDJjOFpGVVJR?=
 =?utf-8?B?dkJNVkRnYzZ0d1hvOGJmNnovZ0JRVDVZMTFlY25GU200c1NoQVV4UEZnUFlW?=
 =?utf-8?B?a1NUSlJPeDZOaEpIUzkrczBBYkJIWlFSU25RbjREM3BOVkFjWWV0dUR2VjVi?=
 =?utf-8?B?T0FkR1FWdTgzVERCVkU0V1RKM0ZUNU1tVXptSW84NktHWlpXdCtLdis4dUxn?=
 =?utf-8?B?RVBnWHFOOEczQmU1S2tmaUcwUDc3M1RyV0UwYkp5TS9WaC9LbmYwME1lUG13?=
 =?utf-8?B?SE1NOUk4dTN2NlhFd0N1U0xRbGFIenk1N1IrTTU0R3lXd2o3YVVzdGNCclVm?=
 =?utf-8?B?ZmJ1c3VsV2FrajJxUWFuenNuYmU1cFhRL2hLUGx0ZmpKYys5c0dEcmVsOXFw?=
 =?utf-8?B?MXp1WWNpVFR3Qk50SEQ3TWZlODVpdWtDcUwvQ0c1OW5WZ2dYeThTVFZhQTkv?=
 =?utf-8?B?WDV2bHIwd2loVkF1NnZrS25lZVBUNk5DNU5leElmZWw1KzR0dENvREh3NUsr?=
 =?utf-8?B?UHRFdkxITUxaa3FKMUlCMVRvMUhyNUJ6MitHblhsOUU4R1FhWStTZGRGRk9G?=
 =?utf-8?B?NmdnV3hwaldaZEg5V21QKzJLZkJCUEpCaG5XRVliZCtBNktIcW9oR1Rnd2hn?=
 =?utf-8?B?czhubXNDeWFFaWx4OXhCY05lWlVIRXQreEJPQTB5d0JaRnVGUnQxVk44eFly?=
 =?utf-8?B?eDZVSjMvR3kreE42UXQxN3RqTjk4Q1hmdTkvQVJHSS9wS0xmalJFMUhXaGdQ?=
 =?utf-8?B?UmpRcTAzRzYzK1AxUlUydVFVUnpHZk1lczNGVWFoYTlIeHZQbFN5bUJ5YnI0?=
 =?utf-8?B?SFZxandNN0pWRGV1WkNrMTlmaGo2VVlWWWpMcWFzdXgwZUQ1QkMvS3NKZ3dt?=
 =?utf-8?B?Wk1XSGFxRGRCbDNLT21Xbmg1M0hBOVJ3K0ZlUTJHUVpkMnlaaEdTY0lVZTJh?=
 =?utf-8?B?bnpFSU1xSkhFUHZYcXRlQzVxVDVxZnFtcXd5RDRnVGN3eWJQMnRRMXJYRkhI?=
 =?utf-8?B?NXNQK3Z2NTlrRzhyZ2ZGV21pODJ6SVRKeWQwcUNaSjRESGVSV21Yc3pOWlRF?=
 =?utf-8?B?TElIMzRJWHBBY3BYN1NLZHZZbkRIQWIxbU9sclhHNFVBR3NLQzlLbjVJTWtU?=
 =?utf-8?B?aEFkVStGeXlEMzdoRUxjSHhoK3BkQVhyVHIzalgwc2hGTXRTMlM1YW1sbTVu?=
 =?utf-8?B?dzFMMWZNbkFuZTlTVlJYb3BzbzkwVFZGc0hFTm84QnplK2F0NkRlMGpLZVRt?=
 =?utf-8?B?eU5GZWkyM3ZEK2x5ODlwOTVJaXluamFNaXd3UXM5cFdmdzVtOG9jK040dVNx?=
 =?utf-8?Q?tSyVUNwG/Rne3mKHhTWe6HvUm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50055622-a545-415e-7e23-08de3ea0e9db
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 01:49:57.4119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwlpibArv6vxRNsHVjBuP7h0CUv4qpjLybEA8x6HBV5bUjH/F/+dhS2XB6lFc1YU2n5FXThO4M6zhPk9SbbIOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9495

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI pixel formatter is a module found on i.MX95 used to reformat
packet info, pixel and non-pixel data from CSI-2 host controller to
match Pixel Link(PL) definition.

Add data formatting support.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 MAINTAINERS                                     |   8 +
 drivers/media/platform/nxp/Kconfig              |  14 +
 drivers/media/platform/nxp/Makefile             |   1 +
 drivers/media/platform/nxp/imx9-csi-formatter.c | 880 ++++++++++++++++++++++++
 4 files changed, 903 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4205ca007e076f869613032b51e8cc5bff06b98e..3878957b81156e5cb41da2699b2f588e49521724 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18626,6 +18626,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/nxp/imx-jpeg
 
+NXP i.MX 9 CSI PIXEL FORMATTER V4L2 DRIVER
+M:	Guoniu Zhou <guoniu.zhou@nxp.com>
+L:	imx@lists.linux.dev
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
+F:	drivers/media/platform/nxp/imx9-csi-formatter.c
+
 NXP i.MX CLOCK DRIVERS
 M:	Abel Vesa <abelvesa@kernel.org>
 R:	Peng Fan <peng.fan@nxp.com>
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 40e3436669e213fdc5da70821dc0b420e1821f4f..a7bb62a2b0249659ffdfeac50fa488aee9590a87 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -28,6 +28,20 @@ config VIDEO_IMX8MQ_MIPI_CSI2
 	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8MQ
 	  SoC.
 
+config VIDEO_IMX9_CSI_FORMATTER
+	tristate "NXP i.MX9 CSI Pixel Formatter driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This driver provides support for the CSI Pixel Formatter found on
+	  i.MX9 series SoC. This module unpacks the pixels received by the
+	  formatter and reformats them to meet the pixel link format requirement.
+
+	  Say Y here to enable CSI Pixel Formater module for i.MX9 SoC.
+
 config VIDEO_IMX_MIPI_CSIS
 	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index 4d90eb71365259ebdda84ea58483e1c4131d3ac7..39ba5660ba923141e7637b01b5b34a021dad7bb3 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -6,6 +6,7 @@ obj-y += imx8-isi/
 
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
 obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
+obj-$(CONFIG_VIDEO_IMX9_CSI_FORMATTER) += imx9-csi-formatter.o
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
 obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
diff --git a/drivers/media/platform/nxp/imx9-csi-formatter.c b/drivers/media/platform/nxp/imx9-csi-formatter.c
new file mode 100644
index 0000000000000000000000000000000000000000..5786e4690e31ee471caf8201329c8e02a2cc0ee6
--- /dev/null
+++ b/drivers/media/platform/nxp/imx9-csi-formatter.c
@@ -0,0 +1,880 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+/* CSI Pixel Formatter registers map */
+
+#define CSI_VCx_INTERLACED_LINE_CNT(x)		(0x00 + (x) * 0x04)
+#define INTERLACED_ODD_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(13, 0), (x))
+#define INTERLACED_EVEN_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(29, 16), (x))
+
+#define CSI_VC_INTERLACED_CTRL			0x20
+
+#define CSI_VC_INTERLACED_ERR			0x24
+#define CSI_VC_ERR_MASK				GENMASK(7, 0)
+#define CSI_VC_ERR(vc)				BIT((vc))
+
+#define CSI_VC_YUV420_FIRST_LINE_EVEN		0x28
+#define YUV420_FIRST_LINE_EVEN(vc)		BIT((vc))
+
+#define CSI_RAW32_CTRL				0x30
+#define CSI_VCX_RAW32_MODE(vc)			BIT((vc))
+#define CSI_VCX_RAW32_SWAP_MODE(vc)		BIT((vc) + 8)
+
+#define STREAM_FENCING_CTRL			0x34
+#define CSI_VCx_STREAM_FENCING(vc)		BIT((vc))
+#define CSI_VCx_STREAM_FENCING_RST(vc)		BIT((vc) + 8)
+
+#define STREAM_FENCING_STS			0x38
+#define STREAM_FENCING_STS_MASK			GENMASK(7, 0)
+
+#define CSI_VCX_NON_PIXEL_DATA_TYPE(vc)		(0x40 + (vc) * 0x04)
+
+#define CSI_VCX_PIXEL_DATA_CTRL(vc)		(0x60 + (vc) * 0x04)
+#define NEW_VC(x)				FIELD_PREP(GENMASK(3, 1), x)
+#define REROUTE_VC_ENABLE			BIT(0)
+
+#define CSI_VCx_ROUTE_PIXEL_DATA_TYPE(vc)	(0x80 + (vc) * 0x04)
+
+#define CSI_VCx_NON_PIXEL_DATA_CTRL(vc)		(0xa0 + (vc) * 0x04)
+
+#define CSI_VCx_PIXEL_DATA_TYPE(vc)		(0xc0 + (vc) * 0x04)
+
+#define CSI_VCx_PIXEL_DATA_TYPE_ERR(vc)		(0xe0 + (vc) * 0x04)
+
+#define CSI_FORMATTER_PAD_SINK			0
+#define CSI_FORMATTER_PAD_SOURCE		1
+#define CSI_FORMATTER_PAD_NUM			2
+
+#define CSI_FORMATTER_DRV_NAME			"csi-pixel-formatter"
+#define CSI_FORMATTER_VC_MAX			8
+
+struct formatter_pix_format {
+	u32 code;
+	u32 data_type;
+};
+
+struct csi_formatter {
+	struct device *dev;
+	struct regmap *regs;
+	struct clk *clk;
+
+	struct v4l2_subdev sd;
+	struct v4l2_subdev *csi_sd;
+	struct v4l2_async_notifier notifier;
+	struct v4l2_mbus_framefmt format[CSI_FORMATTER_PAD_NUM];
+	struct media_pad pads[CSI_FORMATTER_PAD_NUM];
+	const struct formatter_pix_format *fmt;
+
+	u16 remote_pad;
+	u32 reg_offset;
+	u64 enabled_streams;
+};
+
+struct dt_index {
+	u8 dtype;
+	u8 index;
+};
+
+static const struct dt_index formatter_dt_to_index_map[] = {
+	{ .dtype = MIPI_CSI2_DT_YUV420_8B,        .index = 0 },
+	{ .dtype = MIPI_CSI2_DT_YUV420_8B_LEGACY, .index = 2 },
+	{ .dtype = MIPI_CSI2_DT_YUV422_8B,        .index = 6 },
+	{ .dtype = MIPI_CSI2_DT_RGB444,		  .index = 8 },
+	{ .dtype = MIPI_CSI2_DT_RGB555,           .index = 9 },
+	{ .dtype = MIPI_CSI2_DT_RGB565,           .index = 10 },
+	{ .dtype = MIPI_CSI2_DT_RGB666,           .index = 11 },
+	{ .dtype = MIPI_CSI2_DT_RGB888,           .index = 12 },
+	{ .dtype = MIPI_CSI2_DT_RAW6,             .index = 16 },
+	{ .dtype = MIPI_CSI2_DT_RAW7,             .index = 17 },
+	{ .dtype = MIPI_CSI2_DT_RAW8,             .index = 18 },
+	{ .dtype = MIPI_CSI2_DT_RAW10,            .index = 19 },
+	{ .dtype = MIPI_CSI2_DT_RAW12,            .index = 20 },
+	{ .dtype = MIPI_CSI2_DT_RAW14,            .index = 21 },
+	{ .dtype = MIPI_CSI2_DT_RAW16,            .index = 22 },
+};
+
+static const struct formatter_pix_format formats[] = {
+	/* YUV formats */
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
+	},
+	/* RGB formats */
+	{
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
+		.data_type = MIPI_CSI2_DT_RGB565,
+	}, {
+		.code = MEDIA_BUS_FMT_RGB888_1X24,
+		.data_type = MIPI_CSI2_DT_RGB888,
+	},
+	/* RAW (Bayer and greyscale) formats. */
+	{
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	}, {
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_Y12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	}
+};
+
+static const struct v4l2_mbus_framefmt formatter_default_fmt = {
+	.code = MEDIA_BUS_FMT_UYVY8_1X16,
+	.width = 1920U,
+	.height = 1080U,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SMPTE170M,
+	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+};
+
+static const struct formatter_pix_format *find_csi_format(u32 code)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(formats); i++)
+		if (code == formats[i].code)
+			return &formats[i];
+
+	return &formats[0];
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 subdev operations
+ */
+
+static inline struct csi_formatter *sd_to_formatter(struct v4l2_subdev *sdev)
+{
+	return container_of(sdev, struct csi_formatter, sd);
+}
+
+static int __formatter_subdev_set_routing(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+						&formatter_default_fmt);
+}
+
+static int formatter_subdev_init_state(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = CSI_FORMATTER_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = CSI_FORMATTER_PAD_SOURCE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return __formatter_subdev_set_routing(sd, sd_state, &routing);
+}
+
+static int formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *sd_state,
+					   struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->pad == CSI_FORMATTER_PAD_SOURCE) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(sd_state, code->pad,
+						   code->stream);
+		code->code = fmt->code;
+		return 0;
+	}
+
+	if (code->index >= ARRAY_SIZE(formats))
+		return -EINVAL;
+
+	code->code = formats[code->index].code;
+
+	return 0;
+}
+
+static int formatter_subdev_set_fmt(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_subdev_format *sdformat)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	struct formatter_pix_format const *format;
+	struct v4l2_mbus_framefmt *fmt;
+
+	if (sdformat->pad == CSI_FORMATTER_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+
+	/*
+	 * Validate the media bus code and clamp and align the size.
+	 *
+	 * The total number of bits per line must be a multiple of 8. We thus
+	 * need to align the width for formats that are not multiples of 8
+	 * bits.
+	 */
+	format = find_csi_format(sdformat->format.code);
+
+	v4l_bound_align_image(&sdformat->format.width, 1, 0xffff, 2,
+			      &sdformat->format.height, 1, 0xffff, 0, 0);
+
+	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad,
+					   sdformat->stream);
+	*fmt = sdformat->format;
+
+	/* Set default code if user set an invalid value */
+	fmt->code = format->code;
+
+	/* Propagate the format from sink stream to source stream */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat->pad,
+							   sdformat->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = sdformat->format;
+
+	/* Store the CSIS format descriptor for active formats. */
+	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		formatter->fmt = format;
+
+	return 0;
+}
+
+static int formatter_subdev_get_frame_desc(struct v4l2_subdev *sd,
+					   unsigned int pad,
+					   struct v4l2_mbus_frame_desc *fd)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	struct v4l2_mbus_frame_desc csi_fd;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int ret;
+
+	if (pad != CSI_FORMATTER_PAD_SOURCE)
+		return -EINVAL;
+
+	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
+			       formatter->remote_pad, &csi_fd);
+	if (ret)
+		return ret;
+
+	if (csi_fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(formatter->dev,
+			"Frame descriptor does not describe CSI-2 link\n");
+		return -EINVAL;
+	}
+
+	memset(fd, 0, sizeof(*fd));
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *entry = NULL;
+		unsigned int i;
+
+		if (route->source_pad != pad)
+			continue;
+
+		for (i = 0; i < csi_fd.num_entries; ++i) {
+			if (csi_fd.entry[i].stream == route->sink_stream) {
+				entry = &csi_fd.entry[i];
+				break;
+			}
+		}
+
+		if (!entry) {
+			dev_err(formatter->dev,
+				"Failed to find stream from source frames desc\n");
+			ret = -EPIPE;
+			break;
+		}
+
+		fd->entry[fd->num_entries].stream = route->source_stream;
+		fd->entry[fd->num_entries].flags = entry->flags;
+		fd->entry[fd->num_entries].length = entry->length;
+		fd->entry[fd->num_entries].pixelcode = entry->pixelcode;
+		fd->entry[fd->num_entries].bus.csi2.vc = entry->bus.csi2.vc;
+		fd->entry[fd->num_entries].bus.csi2.dt = entry->bus.csi2.dt;
+
+		fd->num_entries++;
+	}
+
+	v4l2_subdev_unlock_state(state);
+	return ret;
+}
+
+static int formatter_subdev_set_routing(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					enum v4l2_subdev_format_whence which,
+					struct v4l2_subdev_krouting *routing)
+{
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	return __formatter_subdev_set_routing(sd, state, routing);
+}
+
+static inline void formatter_write(struct csi_formatter *formatter,
+				   unsigned int reg, unsigned int value)
+{
+	u32 offset = formatter->reg_offset;
+
+	regmap_write(formatter->regs, reg + offset, value);
+}
+
+static u8 get_index_by_dt(u8 data_type)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(formatter_dt_to_index_map); ++i)
+		if (data_type == formatter_dt_to_index_map[i].dtype)
+			break;
+
+	if (i == ARRAY_SIZE(formatter_dt_to_index_map))
+		return formatter_dt_to_index_map[0].index;
+
+	return formatter_dt_to_index_map[i].index;
+}
+
+static int get_vc(struct csi_formatter *formatter, unsigned int stream)
+{
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_mbus_frame_desc_entry *entry = NULL;
+	unsigned int i;
+	int ret;
+
+	/*
+	 * Return virtual channel 0 as default value when remote subdev
+	 * don't implement .get_frame_desc subdev callback
+	 */
+	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
+			       formatter->remote_pad, &source_fd);
+	if (ret < 0)
+		return (ret == -ENOIOCTLCMD) ? 0 : ret;
+
+	for (i = 0; i < source_fd.num_entries; ++i) {
+		if (source_fd.entry[i].stream == stream) {
+			entry = &source_fd.entry[i];
+			break;
+		}
+	}
+
+	if (!entry) {
+		dev_err(formatter->dev,
+			"Can't find valid frame desc corresponding to stream %d\n", stream);
+		return -EPIPE;
+	}
+
+	return entry->bus.csi2.vc;
+}
+
+static int csi_formatter_start_stream(struct csi_formatter *formatter,
+				      u64 stream_mask)
+{
+	const struct formatter_pix_format *fmt = formatter->fmt;
+	unsigned int i;
+	u32 val;
+	int vc;
+
+	for (i = 0; i < V4L2_FRAME_DESC_ENTRY_MAX; ++i) {
+		if (stream_mask & BIT(i))
+			break;
+	}
+
+	if (i == V4L2_FRAME_DESC_ENTRY_MAX) {
+		dev_err(formatter->dev, "Stream ID out of range\n");
+		return -EINVAL;
+	}
+
+	val = BIT(get_index_by_dt(fmt->data_type));
+	vc = get_vc(formatter, i);
+
+	if (vc < 0 || vc > CSI_FORMATTER_VC_MAX) {
+		dev_err(formatter->dev, "Invalid virtual channel(%d)\n", vc);
+		return -EINVAL;
+	}
+
+	formatter_write(formatter, CSI_VCx_PIXEL_DATA_TYPE(vc), val);
+
+	return 0;
+}
+
+static int csi_formatter_stop_stream(struct csi_formatter *formatter,
+				     u64 stream_mask)
+{
+	unsigned int i;
+	int vc;
+
+	for (i = 0; i < V4L2_FRAME_DESC_ENTRY_MAX; ++i) {
+		if (stream_mask & BIT(i))
+			break;
+	}
+
+	if (i == V4L2_FRAME_DESC_ENTRY_MAX) {
+		dev_err(formatter->dev, "Stream ID out of range\n");
+		return -EINVAL;
+	}
+
+	vc = get_vc(formatter, i);
+
+	if (vc < 0 || vc > CSI_FORMATTER_VC_MAX) {
+		dev_err(formatter->dev, "Invalid virtual channel(%d)\n", vc);
+		return -EINVAL;
+	}
+
+	formatter_write(formatter, CSI_VCx_PIXEL_DATA_TYPE(vc), 0);
+
+	return 0;
+}
+
+static int formatter_subdev_enable_streams(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *state,
+					   u32 pad, u64 streams_mask)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	struct device *dev = formatter->dev;
+	u64 sink_streams;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       CSI_FORMATTER_PAD_SOURCE,
+						       CSI_FORMATTER_PAD_SINK,
+						       &streams_mask);
+	if (!sink_streams || !streams_mask)
+		return -EINVAL;
+
+	dev_dbg(dev, "remote sd: %s pad: %u, sink_stream:0x%llx\n",
+		formatter->csi_sd->name, formatter->remote_pad, sink_streams);
+
+	if (!formatter->csi_sd) {
+		dev_err(dev, "CSI controller don't link with formatter\n");
+		return -EPIPE;
+	}
+
+	if (!formatter->enabled_streams) {
+		ret = pm_runtime_resume_and_get(formatter->dev);
+		if (ret < 0) {
+			dev_err(dev, "Formatter runtime get fail\n");
+			return ret;
+		}
+	}
+
+	ret = csi_formatter_start_stream(formatter, streams_mask);
+	if (ret)
+		goto runtime_put;
+
+	ret = v4l2_subdev_enable_streams(formatter->csi_sd,
+					 formatter->remote_pad,
+					 sink_streams);
+	if (ret)
+		goto stop_stream;
+
+	formatter->enabled_streams |= streams_mask;
+
+	return 0;
+
+stop_stream:
+	csi_formatter_stop_stream(formatter, streams_mask);
+runtime_put:
+	if (!formatter->enabled_streams)
+		pm_runtime_put(formatter->dev);
+	return ret;
+}
+
+static int formatter_subdev_disable_streams(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_state *state,
+					    u32 pad, u64 streams_mask)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	u64 sink_streams;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       CSI_FORMATTER_PAD_SOURCE,
+						       CSI_FORMATTER_PAD_SINK,
+						       &streams_mask);
+	if (!sink_streams || !streams_mask)
+		return -EINVAL;
+
+	ret = v4l2_subdev_disable_streams(formatter->csi_sd, formatter->remote_pad,
+					  sink_streams);
+	if (ret)
+		return ret;
+
+	ret = csi_formatter_stop_stream(formatter, streams_mask);
+	if (ret)
+		return ret;
+
+	formatter->enabled_streams &= ~streams_mask;
+
+	if (!formatter->enabled_streams)
+		pm_runtime_put(formatter->dev);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops formatter_subdev_pad_ops = {
+	.enum_mbus_code		= formatter_subdev_enum_mbus_code,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= formatter_subdev_set_fmt,
+	.get_frame_desc		= formatter_subdev_get_frame_desc,
+	.set_routing		= formatter_subdev_set_routing,
+	.enable_streams		= formatter_subdev_enable_streams,
+	.disable_streams	= formatter_subdev_disable_streams,
+};
+
+static const struct v4l2_subdev_ops formatter_subdev_ops = {
+	.pad = &formatter_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops formatter_internal_ops = {
+	.init_state = formatter_subdev_init_state,
+};
+
+/* -----------------------------------------------------------------------------
+ * Media entity operations
+ */
+
+static const struct media_entity_operations formatter_entity_ops = {
+	.link_validate	= v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+static int csi_formatter_subdev_init(struct csi_formatter *formatter)
+{
+	struct v4l2_subdev *sd = &formatter->sd;
+	int ret;
+
+	v4l2_subdev_init(sd, &formatter_subdev_ops);
+
+	snprintf(sd->name, sizeof(sd->name), "%s", dev_name(formatter->dev));
+	sd->internal_ops = &formatter_internal_ops;
+
+	sd->owner = THIS_MODULE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		     V4L2_SUBDEV_FL_HAS_EVENTS |
+		     V4L2_SUBDEV_FL_STREAMS;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	sd->entity.ops = &formatter_entity_ops;
+	sd->dev = formatter->dev;
+
+	formatter->pads[CSI_FORMATTER_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	formatter->pads[CSI_FORMATTER_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, CSI_FORMATTER_PAD_NUM,
+				     formatter->pads);
+	if (ret) {
+		dev_err(formatter->dev, "Failed to init pads\n");
+		return ret;
+	}
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+static inline struct csi_formatter *
+notifier_to_formatter(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct csi_formatter, notifier);
+}
+
+static int csi_formatter_notify_bound(struct v4l2_async_notifier *notifier,
+				      struct v4l2_subdev *sd,
+				      struct v4l2_async_connection *asc)
+{
+	const unsigned int link_flags = MEDIA_LNK_FL_IMMUTABLE
+				      | MEDIA_LNK_FL_ENABLED;
+	struct csi_formatter *formatter = notifier_to_formatter(notifier);
+	struct v4l2_subdev *sdev = &formatter->sd;
+	struct media_pad *sink = &sdev->entity.pads[CSI_FORMATTER_PAD_SINK];
+	struct media_pad *remote_pad;
+	int ret;
+
+	formatter->csi_sd = sd;
+
+	dev_dbg(formatter->dev, "Bound subdev: %s pad\n", sd->name);
+
+	ret = v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
+	if (ret < 0)
+		return ret;
+
+	remote_pad = media_pad_remote_pad_first(sink);
+	if (!remote_pad) {
+		dev_err(formatter->dev, "Pipe not setup correctly\n");
+		return -EPIPE;
+	}
+	formatter->remote_pad = remote_pad->index;
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations formatter_notify_ops = {
+	.bound = csi_formatter_notify_bound,
+};
+
+static int csi_formatter_async_register(struct csi_formatter *formatter)
+{
+	struct device *dev = formatter->dev;
+	struct v4l2_async_connection *asc;
+	int ret;
+
+	struct fwnode_handle *ep __free(fwnode_handle) =
+		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
+						FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return -ENOTCONN;
+
+	v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
+
+	asc = v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
+					      struct v4l2_async_connection);
+	if (IS_ERR(asc))
+		return PTR_ERR(asc);
+
+	formatter->notifier.ops = &formatter_notify_ops;
+
+	ret = v4l2_async_nf_register(&formatter->notifier);
+	if (ret)
+		return ret;
+
+	return v4l2_async_register_subdev(&formatter->sd);
+}
+
+/* -----------------------------------------------------------------------------
+ * Suspend/resume
+ */
+
+static int csi_formatter_system_suspend(struct device *dev)
+{
+	return pm_runtime_force_suspend(dev);
+}
+
+static int csi_formatter_system_resume(struct device *dev)
+{
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0) {
+		dev_err(dev, "force resume %s failed!\n", dev_name(dev));
+		return ret;
+	}
+
+	return 0;
+}
+
+static int csi_formatter_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+
+	clk_disable_unprepare(formatter->clk);
+
+	return 0;
+}
+
+static int csi_formatter_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+
+	return clk_prepare_enable(formatter->clk);
+}
+
+static const struct dev_pm_ops csi_formatter_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(csi_formatter_system_suspend,
+			    csi_formatter_system_resume)
+	RUNTIME_PM_OPS(csi_formatter_runtime_suspend,
+		       csi_formatter_runtime_resume, NULL)
+};
+
+static int csi_formatter_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct csi_formatter *formatter;
+	u32 val;
+	int ret;
+
+	formatter = devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
+	if (!formatter)
+		return -ENOMEM;
+
+	formatter->dev = dev;
+
+	formatter->regs = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(formatter->regs))
+		return dev_err_probe(dev, PTR_ERR(formatter->regs),
+				     "Failed to get csi formatter regmap\n");
+
+	ret = of_property_read_u32(dev->of_node, "reg", &val);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get csi formatter reg property\n");
+
+	formatter->reg_offset = val;
+
+	formatter->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(formatter->clk))
+		return dev_err_probe(dev, PTR_ERR(formatter->clk),
+				     "Failed to get pixel clock\n");
+
+	ret = csi_formatter_subdev_init(formatter);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "formatter subdev init fail\n");
+
+	/* Initialize formatter pixel format */
+	formatter->fmt = find_csi_format(formatter_default_fmt.code);
+
+	ret = csi_formatter_async_register(formatter);
+	if (ret < 0) {
+		v4l2_subdev_cleanup(&formatter->sd);
+		return dev_err_probe(dev, ret, "Async register failed\n");
+	}
+
+	platform_set_drvdata(pdev, &formatter->sd);
+
+	/* Enable runtime PM. */
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static void csi_formatter_remove(struct platform_device *pdev)
+{
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+
+	v4l2_async_nf_unregister(&formatter->notifier);
+	v4l2_async_nf_cleanup(&formatter->notifier);
+	v4l2_async_unregister_subdev(&formatter->sd);
+
+	pm_runtime_disable(&pdev->dev);
+	media_entity_cleanup(&formatter->sd.entity);
+	pm_runtime_set_suspended(&pdev->dev);
+}
+
+static const struct of_device_id csi_formatter_of_match[] = {
+	{ .compatible = "fsl,imx9-csi-formatter" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, csi_formatter_of_match);
+
+static struct platform_driver csi_formatter_device_driver = {
+	.driver = {
+		.name           = CSI_FORMATTER_DRV_NAME,
+		.of_match_table = csi_formatter_of_match,
+		.pm             = pm_ptr(&csi_formatter_pm_ops),
+	},
+	.probe  = csi_formatter_probe,
+	.remove = csi_formatter_remove,
+};
+
+module_platform_driver(csi_formatter_device_driver);
+
+MODULE_AUTHOR("NXP Semiconductor, Inc.");
+MODULE_DESCRIPTION("NXP i.MX9 CSI Pixel Formatter driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


