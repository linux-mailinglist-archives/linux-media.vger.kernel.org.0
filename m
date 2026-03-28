Return-Path: <linux-media+bounces-57424-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WK6EGueQx2kDZQUAu9opvQ
	(envelope-from <linux-media+bounces-57424-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 09:27:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C006634DD19
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 09:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF9F63045031
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 08:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A564375AAC;
	Sat, 28 Mar 2026 08:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lD2L6Jjq"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011070.outbound.protection.outlook.com [40.107.130.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FDF375F67;
	Sat, 28 Mar 2026 08:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774686402; cv=fail; b=dbBtC6AsvT5sBz2bsquQP7l9verZX1e3QYRlIL89WWQZWCY7Im34v/LZvVmpphMYEiOFucgyDgb+XLniRveZfrEJowEn7OKlaR1xQEG6YVBGTZkJOkv8vLMZtFNtFfe8LwLB4LIp1jpBdAD4WKSUT9Jlrr9ci5h9busK4p5EayE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774686402; c=relaxed/simple;
	bh=NPcgxVzS7xWqM2cwdpjVhEIh8K1PmnUQSrcIpHJzth0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BPP5oTAv9ntWqrZlO0xJ1LVpkaK3LsdfGGsBMIiTA3hJpIzzxEvKZDtNsaQXEHo1LZNdP1mO6WBLY1Eb40c2253X6RMmR9aLsFZJwGBibQRHmIDNEqJhlUfk4QWDJtWr7k+sN+sn9p42D8JpoxReIgI1Om1RTpLt574Ce29vPWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lD2L6Jjq; arc=fail smtp.client-ip=40.107.130.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgyg8GMJOQHwR4i3dgh69M1rIumNG54Ng3T0cjXWAD+8QSzuRVphayw6TWIrqwfHL97FdMbEc5CkPZy+VefVB5TJxV7kYVhUmXd1M1liPRuhtyfHcYlwPI9/Xv9kocG61IAXE7pwoxy2GiUZy3KhPDEbmcKE/FFZxHxBR0HY01bibEPdNtR23yo4W2tyPDAQjFC1wsaHWCJOFaTDSmR8+X1lVjbfUqMQWmQjd0y2u+de9oZa0hKFEM+8jYhv4GggQ2HxyVjdG6mQNSe52SYyc6rn0QZMBPPXG92Cn0kpWOT2S6mZ19+WpDVdj4/4nnmk0CVUEYYdKtyC3OasFUDmSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pPMMvarXXUEHNz1LGK/NI03PkPJpqWsU0t8mZpQwjA=;
 b=KINH6prtBSftf0q1XybxWHxdH1wybhjjBybmdOTUUpWmmAfvcujaN1irnuo8+6w/XaZk/rGmFDcc6NajTxn2/ZSAKrVU6O1rzdtXfKMUb/pXlQ8NXFmVCQ9UT+p1bl4gZ90xYUvCYIXi2Ww8buqcf3Qi7yojrUhuNUU/T7Zo94SpDMTgWEb0XWlAGY+wFr8dw+1pfhmWaXuGkRi5fKUiy8L9FQWWkqHZZGfYg61HCkoD96+xdOY8LFxYiq+oJJJA/EB22WLv1/odDDbOG/+fGDphgTsVwWwbWwvCEGE6n9hvFl+nY71aMqVyICfsqwsR7tiwWNrwJUPyRsGYgzzd7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pPMMvarXXUEHNz1LGK/NI03PkPJpqWsU0t8mZpQwjA=;
 b=lD2L6JjqDen186T1J61h5Ax6NoDzvQI779VkNYang62iQnEAR/BGbGxHgNyUdX1wcpH9pikuaBWw77JsSyX6quYij8yG/2XSYOt52Ls/Pq/+nUQLV1GVezMFjoloDzn7YUrrLdeak4zI/H05fc3rnGFWsTkCtmsEU8RzGeCbyuuokQ6Z7uy9kvp6ZQm8o+KYLy7XFHsDHNwLWJeS4T/1jSw7E6Hqi1StbIX//zPUFjP8k38X1xZpD/T8dowlmO4m+V+yC+xx3VOQfA0i73dXAhBYDrXOSjmfJ+uyDWdHF8u+ajynzswVSKXomWHaqZN0y3P7GBTSlIFAUzSZT55r8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI2PR04MB10569.eurprd04.prod.outlook.com (2603:10a6:800:273::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Sat, 28 Mar
 2026 08:26:37 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9745.024; Sat, 28 Mar 2026
 08:26:37 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Sat, 28 Mar 2026 16:28:31 +0800
Subject: [PATCH v3 1/2] media: nxp: imx8-isi: Add virtual channel support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-isi_vc-v3-1-a03b9a6fe117@oss.nxp.com>
References: <20260328-isi_vc-v3-0-a03b9a6fe117@oss.nxp.com>
In-Reply-To: <20260328-isi_vc-v3-0-a03b9a6fe117@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774686533; l=7729;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=r7kN8Es4d3B8tUpsbOBDyNgGHyO06V271u3x7nfJM1E=;
 b=lIlRAHlM9R0s1Td2z+iOuGXEHszb66hM8nmco1bBH6EBtykq9+GhMGDcHK8qtrqVYiXCsEcIA
 sUoAgBTnqavCByqgM05o7tkWZ20b7D2zjFwZwuQVoammIs1DMAcZXUq
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI2PR04MB10569:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d12969-93ba-425b-cfb6-08de8ca3bacd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 BURwpLkXf48+wr1JjoC1JHvbaXrHHTgd+ocui754Ji5gC1sCqbVj3DDKdT2rUkCAu5R70rNcJylj4o+VBM7iSBZwmqvH1QiACVsZl24HEooP2Ibgw6phTc7oJ3/XkO8eqZjll5Q9hgerfIkWJCREnVi2K+aGU6x5z3gsXr1q4zdICrtnEvwAd4hKtBB40hLpk8Wkeiij2m8gcM5MMi04XKESYZpSSrdI0ExeoBV8Hvedtt+1bb8YyBq9e90ZeFdasJ5nAsNdwRIOwnN1zVdC5wMAvKiDo5FHDEYCmNmdvVFkwnVbEwdH8cOGb+IBUqwAb/4Geq0hy6bx1/8H5Ud3WjgZz1psoAksxOazM3KmeX3noGYqEVwyMldzbGgnolurT3onLv/0G8wUzOmTJPIDe574QezLw/bJCUgI57hr9reqn+zUYHgZDO3Tnv814+7PI277syLSlEsUcnfOn6F4hMnAvNd8yvQpASy7ZUj6sN95rYbZevoQrOoR2pb5eSUW6oylZaxH5FKqIqAFJoFnajlMOOKfm1ao36qSF4eaT9C70Syt02S1ab2H2kf6H6jiA9n4ingIzwbb+bkKUPFGgfpZX9bybqycwlm/UplVSYcGSs5WQZrp2MyP+fEzlzUVzcK3joJY6NJ6iITg0mgTxxKfXCU0m1dg8ei4rjMXrd8qTqB86qBA4Yt+GT0EQGtugsElG1G0Jgh0UH4HHfQjFcXz/BcL/1d9odrKna3ZOUo50vgt2pJgyuq26+Nz0+Y4m54GO9dQlgAB9K425yHgNKt5ShLn/XccE4atE9yAOSc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Y0gwbk1XWE5ERld3Q1JqNEtoSDdpZ0R3Rno5bHJGQnlTYnh5QWhWNTRKcGI0?=
 =?utf-8?B?ZjROR3dLc29QYUpxS3FUOEZwUEEvUElpR0Y1SGJvUEFBc1hwcURBRVIrQjhl?=
 =?utf-8?B?U2Z5anVtRGcwNXNTSi9QSm5ZNmFXNkM0ZEVRVHEyNWRYWDcyQmIxTG5Zdmtr?=
 =?utf-8?B?TlZLNGRMT29Zb2xXdXlxUnFaSm9XTnhlSWhyRk52STNGWlhqVW5PaEJyVmVE?=
 =?utf-8?B?SmFLYmUxTHNXaEFueHVwS3IySTJ6VCtLMFFYZTVwWDJockY1TVk3WXY0TW1M?=
 =?utf-8?B?WTNxcmlmdEJsT3Y2SWs2NXoyQ2Z1N1hZZ09hWWxpVXJOb2dVS2JOZ3k0OXRo?=
 =?utf-8?B?dVRNZXNLai9XYVJXRDNWem9ER01OS3dMWUFUWEFsWlZzQ2ZqcjlUcXZNaitC?=
 =?utf-8?B?TWJJUHcyRGhkYmRPdjFlOFR6NlJ2Qm5lTFVJN2VEaFlnQURZZ2R3VFVLN0JR?=
 =?utf-8?B?K0hjTjZqeVBZbkZkekN0ZC96d2VKL3pWaUxZRXFKeFMvWEsvMCsxS1h4c243?=
 =?utf-8?B?WGtRWENWelVpUCtuSlQwMGVVU1l6NlNXZ2tLMWlPSXNrQXM4MGVMYXM5aENp?=
 =?utf-8?B?VDJBWENUWFVBM3psSjcycTcyYlYvVmpOTGJKR3NNYnRYb3VnVzQ5c2lWRU1l?=
 =?utf-8?B?a3BocHloeFVBQ3V2di9Kd3ZZdklqaVc4NUdEZTdJS2VDdjNnc1ZLNU54dThV?=
 =?utf-8?B?N2dVZnozdDBpQ1dRbHRtcDladEJGNk40U1ArSHpUK05ETlp3NjduOVdDcWtn?=
 =?utf-8?B?YnlHakRiR3VCTEZBV0EyMDFDaDIyWEtzUWxvTEptM1I1OWpCSVFYY2hpOHNB?=
 =?utf-8?B?cWFSaHB4eVovSWsveFhtMkRYOUYxQnZWdEJnbGNlYWw4RlZTdVhSbmtXalVh?=
 =?utf-8?B?VG5ZcEZUUzhiSnc3NXQwWHcrR2MrWXE4dEJGZlN0dVV4MGxHdXFGOVNkcWk1?=
 =?utf-8?B?dnl0azFVbmZMOWxrMW5UTnVXYW9NaklQRmJBQXByd2huQTFOaW02cks1ZThL?=
 =?utf-8?B?UjA2d2lQcEszclhITzZDNjVsTk1VTnhkTEl0SDFhTzZHZWdOVitqZlA3Q25I?=
 =?utf-8?B?WVZDNzJpUDdOcHM3UWxDQUNVTDdTNi9MWC92SVRPNEJkcTNGNk55Z3dRTnBQ?=
 =?utf-8?B?ZERXbnR1UzJleE10UGxBRWo2RnZiVkdKNW1RVmpoM3docHIzNmpkUlJ2cGVT?=
 =?utf-8?B?bzhpQjcvV0ZMcTJFVVhjYnNBcFRVVXZVK3dJSUo5aGJYcHZNU0JiUkd6aDBT?=
 =?utf-8?B?TU4xVDRvTzVBRk1sVm5lVUp5M2t3Wm9nWDR2b3puQ280bGcrbWNmd0ZJa0ow?=
 =?utf-8?B?S0RRb0kxelM4a1FXTDA1cHNnb2gvOTE1L3dWQW9OUm9ETjJLd2FrMGZ5RGs1?=
 =?utf-8?B?emVVNjRpSFgxbklvaXdJNDJRWmZLUHNlS0Z0NDVFblJBYTRuTFpQS2NPOWxH?=
 =?utf-8?B?NzBEVitzZ0RrdWt0U3lobjN3ZzBwNnZCYWx1Nk15RWpvdUVWb25MWisxL2R6?=
 =?utf-8?B?SW0yblVDeDl0MS85WlhvaURsOUkrL3VNVFlzWmxXblZ3NFhuVTQ0a25kbU9a?=
 =?utf-8?B?bWgyelNmYWNUOW9JZGx4ek0wdmZHaGswV203UGpqbFEyQUU4aHpzTHlNUmNE?=
 =?utf-8?B?VkUxaXZZWHVSNHJmZktWZjRuZDZFUk5qNDRFMDhtWkVBdWtpZVdoekNhQmhi?=
 =?utf-8?B?T2JUa09KTmlWNGVtcE5QeUdnRFp0eG1VL055clBoK0QvYW9NY296V3M2eXlj?=
 =?utf-8?B?dWJvb2FIOERldmtKNVN6bnlvUytEY3R5SHZ4RnhHdFo4UDRUbW9leUI1Qy9Z?=
 =?utf-8?B?NzIzcFhrTDNqUXVMaXlNanpaU0xQZXpHZDFkZGc1alU5MkVTTlE4cU53eXdU?=
 =?utf-8?B?UjcwcUhyallTSnMxV25jYi9zMGIvbjRJbjJpclNxSmd0b2U5QTM4bm4yZzAz?=
 =?utf-8?B?QytHejFwYmxMYUs0WVlhZDRNb1cyQTZCdTNUdGJ1WXVrMWxMWWx6R2sxa0N3?=
 =?utf-8?B?cmh6SXVuUnhwbGtBMlJEL2E4dTFvcDdlUU5nejlRUlBsVWkzWnZNZWFOa2pK?=
 =?utf-8?B?Sk1xQUV6TDB4MjBubTBzRlNQSU1OZFNrNW5TSEkxdXZOZExVb1lKbERiNzI5?=
 =?utf-8?B?RXp1TU9vUzRWYzJoTXRkcllDZm1FNHQyd01mNVhpQnd4TGFTbHdXMm9EanYr?=
 =?utf-8?B?Rlh5cEtqd1N3NGdiWUh6U0lMTTJLTUVxNjI2b0owRStTVk5WQ21FN1pwWm9X?=
 =?utf-8?B?Y1FMK2lmWDgwVWo3ZTJaN0ZEQWVsQXFMNENsZjFrdGRwVUhmK1FvK0NWR3M1?=
 =?utf-8?B?c2RRZXh3dkpuWTdHeFhCOVBoN0NhUnZ6dS9CbXFOK0RJNmo0dmdjQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d12969-93ba-425b-cfb6-08de8ca3bacd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 08:26:37.7773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p19JP04+GPCtjV0fhD7cT9fwul575NG1CcSg7k5iMNo4LAICKCllE9bL5od7In81h9ASgsBtYFS1L48Fd/qDqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10569
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57424-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C006634DD19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The ISI supports different numbers of virtual channels depending on the
platform. i.MX95 supports 8 virtual channels, and i.MX8QXP/QM support 4
virtual channels. They are used in multiple camera use cases, such as
surround view. Other platforms (such as i.MX8/MN/MP/ULP/91/93) don't
support virtual channels, and the VC_ID bits are marked as read-only.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v3:
- Add num_vc field to platform data to indicate VC support
- Clear VC_ID_1 bit after reading CHNL_CTRL for proper VC switching
- Set VC_ID_1 only on platforms with num_vc > 4
- Improve mxc_isi_get_vc() error handling
- Add back CHNL_CTRL_BLANK_PXL and document platform-specific register fields
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  3 ++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  4 ++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 14 +++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 52 ++++++++++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  8 ++--
 5 files changed, 77 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 4bf8570e1b9e..837ac7046cf2 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -318,6 +318,7 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
 	.model			= MXC_ISI_IMX95,
 	.num_ports		= 4,
 	.num_channels		= 8,
+	.num_vc			= 8,
 	.reg_offset		= 0x10000,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
@@ -329,6 +330,7 @@ static const struct mxc_isi_plat_data mxc_imx8qm_data = {
 	.model			= MXC_ISI_IMX8QM,
 	.num_ports		= 5,
 	.num_channels		= 8,
+	.num_vc			= 4,
 	.reg_offset		= 0x10000,
 	.ier_reg		= &mxc_imx8_isi_ier_qm,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
@@ -340,6 +342,7 @@ static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
 	.model			= MXC_ISI_IMX8QXP,
 	.num_ports		= 5,
 	.num_channels		= 6,
+	.num_vc			= 4,
 	.reg_offset		= 0x10000,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 14d63ec36416..195c28dbd151 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -169,6 +169,7 @@ struct mxc_isi_plat_data {
 	enum model model;
 	unsigned int num_ports;
 	unsigned int num_channels;
+	unsigned int num_vc;		/* Number of VCs, 0 = no VC support */
 	unsigned int reg_offset;
 	const struct mxc_isi_ier_reg  *ier_reg;
 	const struct mxc_isi_set_thd *set_thd;
@@ -257,6 +258,9 @@ struct mxc_isi_pipe {
 	u8				acquired_res;
 	u8				chained_res;
 	bool				chained;
+
+	/* Virtual channel ID for the ISI channel */
+	u8				vc;
 };
 
 struct mxc_isi_m2m {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 0187d4ab97e8..ecd0c2ef28b6 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -308,6 +308,11 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 	mutex_lock(&pipe->lock);
 
 	val = mxc_isi_read(pipe, CHNL_CTRL);
+
+	/* Clear the VC_ID_1 bit on platforms supporting more than 4 VCs. */
+	if (pipe->isi->pdata->num_vc > 4)
+		val &= ~CHNL_CTRL_VC_ID_1_MASK;
+
 	val &= ~(CHNL_CTRL_CHNL_BYPASS | CHNL_CTRL_CHAIN_BUF_MASK |
 		 CHNL_CTRL_SRC_TYPE_MASK | CHNL_CTRL_MIPI_VC_ID_MASK |
 		 CHNL_CTRL_SRC_INPUT_MASK);
@@ -338,7 +343,14 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 	} else {
 		val |= CHNL_CTRL_SRC_TYPE(CHNL_CTRL_SRC_TYPE_DEVICE);
 		val |= CHNL_CTRL_SRC_INPUT(input);
-		val |= CHNL_CTRL_MIPI_VC_ID(0); /* FIXME: For CSI-2 only */
+		val |= CHNL_CTRL_MIPI_VC_ID(pipe->vc); /* FIXME: For CSI-2 only */
+
+		/*
+		 * On platforms with more than 4 VCs (i.MX95), the VC ID is
+		 * split across VC_ID_0 (bits 7:6) and VC_ID_1 (bit 16).
+		 */
+		if (pipe->isi->pdata->num_vc > 4)
+			val |= CHNL_CTRL_VC_ID_1(pipe->vc >> 2);
 	}
 
 	mxc_isi_write(pipe, CHNL_CTRL, val);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index a41c51dd9ce0..879193dc1766 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -232,6 +232,54 @@ static inline struct mxc_isi_pipe *to_isi_pipe(struct v4l2_subdev *sd)
 	return container_of(sd, struct mxc_isi_pipe, sd);
 }
 
+static int mxc_isi_get_vc(struct mxc_isi_pipe *pipe)
+{
+	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
+	struct device *dev = pipe->isi->dev;
+	struct v4l2_mbus_frame_desc fd = { };
+	unsigned int source_pad = xbar->num_sinks + pipe->id;
+	unsigned int i;
+	int ret;
+
+	ret = v4l2_subdev_call(&xbar->sd, pad, get_frame_desc,
+			       source_pad, &fd);
+	if (ret == -ENOIOCTLCMD) {
+		/*
+		 * If remote subdev doesn't implement get_frame_desc.
+		 * Assume virtual channel 0.
+		 */
+		pipe->vc = 0;
+		return 0;
+	}
+	if (ret < 0) {
+		dev_err(dev, "Failed to get source frame desc from pad %u\n",
+			source_pad);
+		return ret;
+	}
+
+	/* Find stream 0 in the frame descriptor */
+	for (i = 0; i < fd.num_entries; i++) {
+		if (fd.entry[i].stream == 0)
+			break;
+	}
+
+	if (i == fd.num_entries) {
+		dev_err(dev, "Failed to find stream from source frame desc\n");
+		return -EINVAL;
+	}
+
+	/* Check virtual channel range */
+	if (fd.entry[i].bus.csi2.vc >= pipe->isi->pdata->num_channels) {
+		dev_err(dev, "Virtual channel %u exceeds maximum %u\n",
+			fd.entry[i].bus.csi2.vc,
+			pipe->isi->pdata->num_channels - 1);
+		return -EINVAL;
+	}
+
+	pipe->vc = fd.entry[i].bus.csi2.vc;
+	return 0;
+}
+
 int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
 {
 	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
@@ -280,6 +328,10 @@ int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
 
 	v4l2_subdev_unlock_state(state);
 
+	ret = mxc_isi_get_vc(pipe);
+	if (ret)
+		return ret;
+
 	/* Configure the ISI channel. */
 	mxc_isi_channel_config(pipe, input, &in_size, &scale, &crop,
 			       sink_info->encoding, src_info->encoding);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 1b65eccdf0da..bbac2ba6b5d1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -6,6 +6,7 @@
 #ifndef __IMX8_ISI_REGS_H__
 #define __IMX8_ISI_REGS_H__
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 
 /* ISI Registers Define  */
@@ -19,9 +20,10 @@
 #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
 #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
 #define CHNL_CTRL_SW_RST					BIT(24)
-#define CHNL_CTRL_BLANK_PXL(n)					((n) << 16)
-#define CHNL_CTRL_BLANK_PXL_MASK				GENMASK(23, 16)
-#define CHNL_CTRL_MIPI_VC_ID(n)					((n) << 6)
+#define CHNL_CTRL_BLANK_PXL(n)					FIELD_PREP(GENMASK(23, 16), (n))	/* i.MX8{QM,QXP} */
+#define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))		/* i.MX95 */
+#define CHNL_CTRL_VC_ID_1_MASK					BIT(16)					/* i.MX95 */
+#define CHNL_CTRL_MIPI_VC_ID(n)					FIELD_PREP(GENMASK(7, 6), (n))
 #define CHNL_CTRL_MIPI_VC_ID_MASK				GENMASK(7, 6)
 #define CHNL_CTRL_SRC_TYPE(n)					((n) << 4)
 #define CHNL_CTRL_SRC_TYPE_MASK					BIT(4)

-- 
2.34.1


