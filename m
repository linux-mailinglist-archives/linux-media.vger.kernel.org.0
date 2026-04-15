Return-Path: <linux-media+bounces-58772-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIUnM+EJ32n3NwAAu9opvQ
	(envelope-from <linux-media+bounces-58772-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 05:45:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2EB400154
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 05:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 615653039ACC
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 03:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93393385AC;
	Wed, 15 Apr 2026 03:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MEtJXW6/"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8397232C94A;
	Wed, 15 Apr 2026 03:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776224694; cv=fail; b=uMRhKD3oxgSn0grE/YA3uHZCPyTDqSOkAMkIcG0e61vlU112Bnjcz6L4pAiuPXhlrjB0HeziAQdgxB24VwcCIJGUkoGrDBoyhrMf+wjB6tAomXCSBK+S0VivfzRfHLMF69yxk50IgksgMmXSX1U40/A54vJZVlAvLaQ41iUzRxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776224694; c=relaxed/simple;
	bh=VqS1ccn27uBHLU77MVMEfEKlgoQsXr2kgNj17EV1UHE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=gn5SFWv/A7jWYAsmSFMOYsTfNGDXq4f6WOOewwk/Q0ezmjk67V9tnMxXG9u2BJYPM29pz3tyE7XoYbSsUNyMaOBt0LI3TsGxPON9WOtZrB3N7kTfZj/8jkcdOknnGLsB79Or2Q1oRQ6htUPm/ujgoGiZz4MW1LHT7wo6GWZGfDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MEtJXW6/; arc=fail smtp.client-ip=52.101.69.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNhC4J6FfKxz91a226KacaF70Nde66dNaVWXwY6/uwP6/njOUoqlOB59rfexaxJHP1nAKgc8ZqvSjabUBxvrFWLMNln/jPnTPp3C9ss4Qdx1FbSSCEilsEG1Qpta09sltJ1yGzPoovDZfehSYiJIBaTqWOaXxWhIJTS2FUm7Q068PsIZmf4k8XuikYa2yOEgl3axXqMc39LVl5cB1LRRKqGcniSAfseY5dIDrbQYL9hbaGdiXEMqTDjZW/73ZRE70TMYDPCAHvIrLQu0PC017MlGwkmGaXWoYdoVCybDOF5MLQ+EzJ/VCoKP5FTx0bOfRhGAEZPqvRAJjxWd/Zz+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRjSS724tEiehDG4/kwHMjn/ssIL76UEZb+otux+UJI=;
 b=pKQIb2ZKf6Q/GQvq9fgVPcoyeh73hfxW4cdx7A93TvS+MBZVZL9jxvLa0jD9YQ4PNYe1K3Wq3GGlelbCs8pYK2QZRmwQU2Kbf1pis8EDMagPw+XGv5yB9kE2IM3mkw4aMjkNUaBZiSEj6hMU/1ReIsJ5afvq0cyT6pkmvourawCjkb5PiKYhDww4vkwcKHjvcY9SUzGG0lp43x15wZ+TMFPzZ5t2FncMO1s1hzMkTeZ5n9+AS9DQZwqgmMjog9ZsRo6w6n902PC9U+SBT4MsoqRMpRow9p1a+YO9BleoLExLJVIcrBd/muMlSvIAS3zRWR2gQ/iKLYitWFKwKEmSug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRjSS724tEiehDG4/kwHMjn/ssIL76UEZb+otux+UJI=;
 b=MEtJXW6/sbpWu0AHsw1dp7pCffMa2ejqP2NZuRZDIMlxjZxOlUoBWVvoDQD35Ihd+du/OtwOMNbMcGkquhIP2R9enViHR/HjIZVYzo5FNt5TDk2vawVyazYXcNIV+WUQCGDYnfOV8FeBqVkEwVsf5EzFiIKk0I6Ses60j1cB/eFIrwFNIJCS7lKzTChlxowzxtBCxuE4CbXppxS+Ak+3e21HQDsIqHUwrC2ZAX2A3kzPD4an0J+Y/Mwv08kBinHmrAwngmkLiwUz2lpaD6jIDc5B2HLT79+7IZjsw8o3wJBe+d8+hanwoxF9FJftRmOZgj9QdqEnOWePVC30HdMLAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by AS8PR04MB8785.eurprd04.prod.outlook.com (2603:10a6:20b:42c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 03:44:40 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 03:44:39 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH 0/5] media: synopsys: enhancements and i.MX95 support
Date: Wed, 15 Apr 2026 11:46:51 +0800
Message-Id: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACsK32kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0MT3eTiTKP4zNwKS1NdM9PEFINU8zQzY4NEJaCGgqLUtMwKsGHRsbW
 1ADjcYCxcAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776224832; l=1054;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=VqS1ccn27uBHLU77MVMEfEKlgoQsXr2kgNj17EV1UHE=;
 b=WQAn99dSWMsQZezBAnfYOt0AvHoXbSLxclKkOZ/GYZ6ibGgeVXhMkbOGbPbugIhqxn9zWqGAj
 ThDdpW8u2WtC//ykPt51OsrNu3U4YfqNuLsh47pQgnwSvEHbWEYmEJI
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
X-MS-Office365-Filtering-Correlation-Id: f4346ec1-9720-4c35-bc73-08de9aa15279
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 zYYmbMHTH+LSmpv9uSPjwoR/56yMC1lOXlrXuvQIdLB8IUgmUktD5vEMnbgsdQHt62DdFB+EbTQIe9VhsTq9SiGIcGoMH0nI6Yni19QTKdInGY9dPd1pjWS+OQ2ZMLgRvIjWl+HpBAerAmgjOebBteo7imtIa8a85jq2BKvqjWz88Apr652V/DF7JkbxvP2hBn6KGldIdVbLLzsgR5/n/5q2CVXMnx48Sn2G7lQlXha64zrAWsDtpVINPMDd8C/Az2FNI6M4XbT1EAQWmrsqdDyHf3hjGAqQJqv2RQmEPVrxvjJ/zAasGFqeFqqnqn173UbNu3gU8IjOYYLWoz0oy+lNMQ2qOz6nAiGmTURmlNYjMdOIU/E4HTSuFwpI9i446WmJ6J7XgpSujWrkenXxXiHxoyUOQ9G6Jn7SZbtDP5Uce2laHh8BRKNyqXLjXIL0h3Kcor4VmGWeHh5l+4hxnoDqjuYJ6IZlxSL1abB/+pEIM1nmsHmuyC0MCnTybaohjea/a7FyMt5am3gRz00YlwXc1WqKbIQeNnsmf6rV+6SB/RWHD404MBVdxp90k+PWTUHIMZ3+GXcNywp46qF9+TiCmNyMYTnk+K6FLIuuqJ1Kkp0gatE6dSieDif5vO0NBHgRLEZft+QApMY2ABu9qdHxM2fb461XQ5kDvDi/odnWEqpu4hx5nwrL2YqM/ffaNnLMqYBVGrZNEA/WxcLhnGpBNFj/clZKniXdFHaeBmWP5Zpzxawqx/6bYi2JL6OhPpgw5bCa6B+HgQYFd2zd7GiKOEXrfGygTtg6Hdsnqsg=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QjY4UWtzRnZVMlRIdUpsNjljMFpiZ0VUUkZVMmQvY0N2d1ZvemJIaWRSZEZS?=
 =?utf-8?B?eThEVEcxNkszQnJqS1lISlJ3emdFWi9aNHIreG1xWTJ5c0luMzNjQjZHTzBG?=
 =?utf-8?B?cE96dTdUS2JMMWV3SHJISUNsQU8rV0d4eS9rOE9uQ2czQ2lNNHJPWDFwYlNv?=
 =?utf-8?B?VXA3UFF5am5HcDk4enkwczJuKzJYUHVBTThtSi9qd0R5MEY2V3c1Tm1GLzBB?=
 =?utf-8?B?dVZoRVZrRmVjK3FpVVZGMVVNdG1QUmExNVNvbHBsTkFOVjdSbnRlMGJ1Uklh?=
 =?utf-8?B?ckxIbWtNWFhIRklyN2JGY25ibHEvUUJ4ZHJVOHJxVmY3ckpwOUltZHV4ajRz?=
 =?utf-8?B?WFJYUEdEQmxJVEUyNVpkODlmelZPdThJVFVuZ2k4RURyWENtOFZpUDdIaFFG?=
 =?utf-8?B?OUdXQjI3MTg4dDVjK3EvVHErRkpPU2tzYXdJK0kwdTcxZFJPZXhwbVhrVGIw?=
 =?utf-8?B?Sjl1OHNpNVlFTVp0WDVJejF4UjNEYVFrelZySjNMY3QwR0JiMDdaNUtjV0xa?=
 =?utf-8?B?RlpjWWxjNDMyMnBsTEs3ZmVoUk51amZueDBnWlQvYlRKQUlnTlpMclBtL2NF?=
 =?utf-8?B?K3RhRXc1bmdTbk02RXExUDgwNlc3WTdkSHJvUldHYmd0Vm02RkpGc2dZS240?=
 =?utf-8?B?azdnRDdZcnRybnk4NkxBdzlCdy9FNVVBTU5vSytGR3dBV2xtUm9KYVZHMlRG?=
 =?utf-8?B?NWtwTkJvTDdWK1o4a1V4ZWtXV2hwWmJ1U2xHbUl6UWoxMjVUbzF6UlZoTkNh?=
 =?utf-8?B?WEptclZaWllaSlMwckJoT2hIK0ZOZHZRc0s0OTJ4OEpqK0pHNVNqQzd1d05u?=
 =?utf-8?B?ZUtNbkY4QlpNY1AyM3A3RGlyK3BFcHdwZ3hCQWEzZ0FRa1pCT3BHVUJPUHp3?=
 =?utf-8?B?UnQ1amZ5eTROS1FUb2NHbmNvZUpGeS9mOXNhK3V6Z3lpQUZZOHBmTkVVNngy?=
 =?utf-8?B?TUlibm5wV1YrV01ySWZXVmVoSWJmc0VneVVobW9ZS001SUhwNExlUC9XdlhH?=
 =?utf-8?B?Z1RZTmdMSzZndVUrVWRJNVFGb3UzWU5YWjZqUUZLQTFMNEJDQlcxNDZGakZS?=
 =?utf-8?B?bks3QUk0SDhMYjBWdktIWnpFbFprNmQvQ0dHOFU0S3VYei92ZDhtem9CUkYy?=
 =?utf-8?B?WHNubGdyM1lMdjl1NDVpSktBZjdGeThBcGhwekxHeEduSDh1N21CTlZtY1Iw?=
 =?utf-8?B?TnZCZ0hyT2Fxd0NWRkkzT2RrNUEwdGVleEF1a0VKeUVpQ0VaaStSeFRlZDZG?=
 =?utf-8?B?NFIwVWZjeEE4bVlnY0FTTmVHbng1a0xzYVVOWkJtK1Avck43N1RhR2Q5aHZm?=
 =?utf-8?B?OThiQkt1Q09LNFY1TElNa0lyZTc3U2ZCbVV4QlNCVG5Ocnd0UHJhZFdyVG9F?=
 =?utf-8?B?NFlpa29PVFM4Z2MvMlpEWWNRUnFvRUdkRXNPdHlGRmtoeFd2eU9kTzRwUnEx?=
 =?utf-8?B?YS9YRTVjeXVYSGxFakR3RktGQzAvbXA2amRMSWE0dURXcHlzaVFxaUlGRkJM?=
 =?utf-8?B?bnNPTEhFRmVsUTNnZ0JybU9pQi85bjUyTU4wMk5tcHRWVTJGM3E1cDB2dVZN?=
 =?utf-8?B?WVNrZ2cxWDhqNGlVeURhV1c2ZVZmekNzbm5XbmQzaUJTSXNPMk9qUDJ0OURl?=
 =?utf-8?B?MmRsN2FIbEdxYnFpTXBmdk5lZ2NSSDAwUFVUZ1R3VThQTVJXSW5XU0RJbFA5?=
 =?utf-8?B?TGFwWGx6TVFrcnQxRURYRTRoMGUyZ1hOdlZocWxqTUpCQjhJaUZObEFzRzFl?=
 =?utf-8?B?eG5pYy9OQ1JsRWVnNnVXRlMyTWFLd1FzVFhINmg5Tk92cE0wRWhCcW5zWkVq?=
 =?utf-8?B?YVhWUGdUMlVYMDZQU0VadlhHeG55VWU2cTUvKzVxVWRSTVU0Q1BXSm9RRlow?=
 =?utf-8?B?STA0SWdTUG1uWTNqTjB2ZVdYS0hsZWhVR3V6Um1tMU5qS0lTMW9KZWNWNmIw?=
 =?utf-8?B?cjJoN0dZd1dKK01VWHFoTUI1VTFuR0FlR1JvNy9lelJBc3RnMCs3dmFMUTNL?=
 =?utf-8?B?VWpMU2NvdnBGZjV0WWhyOGNtUzlwVUJLenVEWDBoZk1OTVlISHVyeS9LbDJX?=
 =?utf-8?B?c3padGRrL2daN2xoZVdtMm1ieWtCZkN0Rm8xY0RyZWxiQ3dqSGRCdks4eUlV?=
 =?utf-8?B?VEc5TndWbG9aY2JGVFRDL3oxQThNSEZvV1BMUHI0azYzYUQySzJWd29JeFNj?=
 =?utf-8?B?ektSV082Z0FKdVlLQ1BtU2huQytFazdnd0pzS1lEamNCYW94Wno5ZkxkdERv?=
 =?utf-8?B?RkVqRDZUK2VPYXlJTE4wK0VpVVAvMm5WNnRWQ0R3VTVNK0crbFNiMGNsaGVt?=
 =?utf-8?B?L0xYSHBLajRHUzQ3UzMvMlU0VXkrdHdBNXBBN25YOExqWjk5eldJQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4346ec1-9720-4c35-bc73-08de9aa15279
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 03:44:39.8861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pl21rqCn+f+Cbcs78lvNOBv8N27tTIjvO7VV3rNw4EM4wwvJXED8LOhd+VvAuhXR49abImnpytKnG2cGgBZTQw==
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
	TAGGED_FROM(0.00)[bounces-58772-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: DA2EB400154
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series enhances the Synopsys DesignWare MIPI CSI-2 receiver driver
with multiple stream support and adds i.MX95 platform support.

The i.MX95 variant is similar to i.MX93 but uses IDI instead of IPI. Since
IDI is software transparent, only a different register map is needed.

Tested on i.MX93 and i.MX95 platforms.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Guoniu Zhou (5):
      media: synopsys: Add support for RAW16 Bayer formats
      media: synopsys: Add support for multiple streams
      media: synopsys: Add PHY stopstate wait for i.MX93
      media: dt-bindings: add NXP i.MX95 compatible string
      media: synopsys: Add support for i.MX95

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |   5 +-
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 125 ++++++++++++++++++---
 2 files changed, 111 insertions(+), 19 deletions(-)
---
base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
change-id: 20260414-csi2_imx95-65ad0e7f630a

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


