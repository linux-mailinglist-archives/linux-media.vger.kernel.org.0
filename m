Return-Path: <linux-media+bounces-53694-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFcgFd5+oWlxtwQAu9opvQ
	(envelope-from <linux-media+bounces-53694-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 12:24:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB051B683A
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 12:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A964531A48B5
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 11:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F273EF0A5;
	Fri, 27 Feb 2026 11:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RwTMrFSj"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0CB3EF0A8;
	Fri, 27 Feb 2026 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772191189; cv=fail; b=Uafw4tysYvl+6oVqYXtN+Rou3xd44oJr9FDZQz1IPtSR1RMTge4RTTR9hd3sGgxBwagOS8ErldNSG4MsNLa0/z+xO6FGzVVTXQOWIlC87U6ITEiAyZuC7NGZAOX84MuLWl/U1X/4BoAlpLgXHvo6zk39uFz+OQ7v49PKprEHeig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772191189; c=relaxed/simple;
	bh=o3WEJQuvBSglI3gOb6xhO0qM6yjqfrXmqB0glmBDPWM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AIl5WjxZxAXYaLkSjeudxBHJsyrczgVPg3q8/i7HjQM5ZJy6ufpzh1fGfvv54d7efLCSwxIT2cM/sTGwTGQXO6B9plyWMjgTnAOBav+2teUhUysqt0+/FRx6FWBaRx126aEvoYF6tG5BL3BUgd/vhnH0Sz0wUXy1XLRRilcwfb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RwTMrFSj; arc=fail smtp.client-ip=52.101.84.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gW/XhAKaUzxv6bnmgmJ6ay3h8p5FNhcrvE+Nn5yYC+uss2o24gwc7U2TjL2onJvwPJ4mTF71sSeo5xM4NGzwUNGpOXQMsaj0kgweh8M7wETIjXFp0Oq9OHlkHldjc6oy83oF5msArf5T6OzRJ9+qUlENMHibD2JT84u1S1q6njtyDzgVfem7McNsEZpuOsrNFC9yyIp4i8QJaZxhO0RkVO4P1mXeSJTSf/nUbtH2ccJ5+Gufr+MZu++xM2uzX165wdXk92deYymJPpMZdDWqA56BRFZB4ta4TPFvmAOufMIn92MLMz4jmr/mA6IsRKcqckyJYmhc6+dKAfZVghkdQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgw5A27Fq/Xmmk6axnGp5p4AdQD2aNs3UIv4EPtH1BU=;
 b=wfPx9IaXdq4lKeWT/41/aJM7zC8WZIre7KqxRJrhbdhn6r/z1k3HIQ7HVxSZ3kNLp2NCwpecRWVmjSA9nJNqvzgJU/DZmcEIrHz14CbxpHMzULwkPTAud06JHm4czDQLuM8sWzVMS6adhYNfc9o7dBG8/hFEkldX9OyHXCZ/Q/cc6MQ0dcidmI87qjUwXjpJXpNlLtI6Xo//QdVmpo9eRWQTiiqqo7pwHmu/kgOR73hPJDuz1NLiauu+cHx8N8kg9NNZr7w2+Sh5FruVfhWqCYVxjbby0IAMg8zop5Gfd3MdyjItZlEWoi+YMgKJMFGE7s+g8M7wJGnfvkEN7Wi+KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgw5A27Fq/Xmmk6axnGp5p4AdQD2aNs3UIv4EPtH1BU=;
 b=RwTMrFSj4o2Ye8d2aLLVHqplqv9jOomnuzZ6Vn1wGVh4kV44fMHYrTFznnAsl6fQkoWrx1k/F9ZDxE31YHgWaz+bHS6PrpD5r5Nl5o1KSpG0v4KPMV2L5wnKZ2oHAVxvIl7UNaGnvOgcC3Sp5Lefn6R+Cm1nqFMD+7HgtV25+MeHL/d3u2lSb8kcEkuuc9n0zWzIyjCdc2tPdcqns4ZxxowVMjwJPU2nWX6/RMaEwf3/IV9uufnto/+CzFsMoMMr7wRzckSNEIxAGwsGzwbnZkolOde/lYXtg298wIWouu7uFvMVgorIHuip9ITBMQ7FxynaqgWsS/lwJ2E38DVt0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 11:19:43 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 11:19:43 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 27 Feb 2026 19:21:13 +0800
Subject: [PATCH v4 4/4] media: i2c: ds90ub953: use guard() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-ds90ub953-v4-4-dea596205f9e@nxp.com>
References: <20260227-ds90ub953-v4-0-dea596205f9e@nxp.com>
In-Reply-To: <20260227-ds90ub953-v4-0-dea596205f9e@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772191287; l=3324;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=r/v6tcNvULydFHfDTrfblx8lKA6B3paTS1RqF7h0x1o=;
 b=yJ96B6IfxUkdRGxPVhYJpUk4DGIpKSvOQCbJuPPDDJYMrrQH479KO0Q7hrtYir1RaqNFUmbHR
 PfZhR3gEqyfDEtqGofPEHzFMh0VJt3S2mnMKJsFkFb2JdDmxm/vDxM7
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 1096dc8a-8a21-4b3f-8faf-08de75f21b24
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	87oGJI2jV23xyGAnWvCmk4EZ295teIASn9UgAATe6mIf5LFHzDE/OSDa6cFDqCbqnWM2YdJQ1LiJ9dbtEzYrdMYz62DQ1x2q0o3npAuYK3nJY9VAFGeokM0Oioqw74ozQ8FmH6tk6Gkeqkxg5pZuVpCQRjOE35GrqDlhQd7X63FRWpqRBV11lDg+WLVkzcx/n1jKL8sMdurUjrG62SmbIPaF/B9wv9+U+7vfQ+1hUfOnmvsjl9yXpN7k7NR+Jdgoa5qyB82Rr3oAG9JK2oBKIjeCearG3Nbq9/JZlMlcprMjFPVb9498T/25pWF0t/QorrMMrjAnKYS1QfvL9uIP0huF6anbYygh+XNVD+K/HasNg4PH7UZWnn0sE58/uJP/yeQByYbgK0exyqI/2vmTc9Yd2VPqFdOKPPMFe8afwUgqMQOyQ9GaYUmwg7Qn+TdCnzXkkx7BDtoYRpqzdPuW0JPZRuqyIr9Dv0x9c1zv77XfE7JeSUsIXxf8l3Nfczj8N/OA168HAPzcWJXdLgu2obVBSGZffS4HaxGO+y9OFghARkKAQoLeXS71LijBUzWu6NmrRchYXxA2kJ5dRXXrfpEL5kavchdr6Sb2JJ9zGolbw3M9w/EBhQ7WEIKYF8UCYf9a1PsUyYpcVqH21T1pvfsncojJlqvi+/jaOZKs7asbmUL7JJ2r0VbA8CZRR40ESlD65eBYmmtyhIu5JawglDu5TrskWW/MtAoP4gjrTAH5izPzc0Z7Yw1YeHwWcsoMbya0F1yrOh+c4OnxSJymr4Y8vnhnbC+ft85DCUlq/kg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVlOTjFtWUxLR3kybTBncXVsMGFsYkdNUE1zWUtSM3pmME5nMjBVWkpydXpR?=
 =?utf-8?B?Mnl3Wkd1UHl1WklwaWUwV1VlaWRDN211VEtpdk50aGVuSzFFbGxZcVFlbjEr?=
 =?utf-8?B?NitQOXUrdXU3RDRLcTc0Q2EvWjV0RDRzWi9SdXNqQ3c1ZHQ5YXlNYXkyaGNK?=
 =?utf-8?B?Q2c3ZFhwbUhYNmhFNUtjK2l0SXNJQm84Z3JqUGxiZlo0Z3dRTm5UUGpjQTd0?=
 =?utf-8?B?bVMzamQxTk9TVzFIV1A2bVZTT21aWnl4UTdVTjBXaHdSWWtoem04TEZhd1Rw?=
 =?utf-8?B?VVBSV0F0QngzbVo4azJZTHhIVFBYSVA5OU5lTlYzVVJzWDZTbkFJMkFYRE1x?=
 =?utf-8?B?bVJQOFcrUXhWei9jRkVVZkhRQjZXM3ZRUVlKcXc2anJPNlVrL0dqS21aWVNI?=
 =?utf-8?B?QWs2eEtWSGJ3cngyQkZreVZGTXZZZlBqTDZyTFNxOFNubmpIYTVBbllUUHA5?=
 =?utf-8?B?cnVjUlc0aEtHY0JSMEQxWHg4eHVjcVpYRmxLRHJXNVg4cnJmbjRMRHI2aUlx?=
 =?utf-8?B?ZEFqSysrbk5DM1ROOU1DWmE1clkvZTI1NVpzN284c0FVcmRPc1BCb29EVk5C?=
 =?utf-8?B?SXdnNzVwNHF2aVRXTGJSV2EzaWVzbDQ1bElqcUtON2FIbnd2UjZ2eittcnVy?=
 =?utf-8?B?WVRxaVYxdEZLbFdBOExYVXlsbk9lRGU4UE0wbkg2bzdhSjJHWGplZnM0YjZN?=
 =?utf-8?B?Q3QrUjVMQ01oZlMyaHZ5QWVPWVo1Y1pINkNJVHBsTjduaHlReGdRanJQZExY?=
 =?utf-8?B?Ti94dDE0V0FRa291THl1TndHMDUwckFZNWdDbnBsWVNMWUIzVEkrZXN4MWlP?=
 =?utf-8?B?V2FDUzRzY2F6Ymc3dTZSa3BXMnYwRlY0QTBPY2k2SWF5ZXhheDdKTXpDWE92?=
 =?utf-8?B?OGZBTmlsQVl1Q0RQZElIZXVkKzN5QVYyeG1uckEzd01ycWsrbUovaWdVRFdT?=
 =?utf-8?B?cHNQcHVINUxMM1YzNnZqOVljSEx2ZGp2TGlmVHFEMVFGNVMrS24zNFMvekRI?=
 =?utf-8?B?VmpjSU5jYVlDemU5dU96NldsMk1xa0Z0bFpxMjhvck03M2lqRHVYSFNGOExx?=
 =?utf-8?B?MzFyUEZUd0tqSjJiNUkvSGhoNUZGckpHdlFBb1M2cGtseEdUNmxhMWV1aGN4?=
 =?utf-8?B?MUtZMlFlQmhBVkRadFI3emRjY1Y1S3h6b1ZrN3RZWWw2bVJIWGpBdWtrMUk5?=
 =?utf-8?B?TGtjZEdqeGViclBJWGUzN2FjakRpYzNscGg2R1R2NFNkdmNBVGZtckd4U1Fj?=
 =?utf-8?B?YkhGdm1JdytBbzBKUkt3VHpMdUtRVDhRZkl0N2E5STFyeFBrRDZHNmsxaGFx?=
 =?utf-8?B?eGhWc2RjSitBNk9NTnoybmNQaHhEeG1mcmQreUY4TStGa05JM3d0a21aV0hD?=
 =?utf-8?B?ejJVdXR6NEovMnY0eVpnb2d2TTRqbmw3NHBCWTRMSkNyY2RJdUNFS0dGdW5l?=
 =?utf-8?B?K0cvb0VITEwwZ1dEc0dNUi9paWFZaHBPNlA1ZFhxZjR6ZzFSeEI2QW9ETWp4?=
 =?utf-8?B?RUtIV1RsQytRQ2RzNWJMbnZiSE1tVVNuWTVGMzNDU0xhQUJtcmQ1Tk5EcEhI?=
 =?utf-8?B?ckZZVElBTFN1SGtkTUE0UUJSSjNyWkhmc3FKUy9wMVgyZS95UkI5TzU2MkRC?=
 =?utf-8?B?Y2cyRnRTTktDY0lLK2g4U1hSNjBhaFJHUFg3ZGs1ZUwvck5hZzN0Nm9WMDAr?=
 =?utf-8?B?d0taUjZsMG9DM0RKQm1tQjd4MlBJQ3A5LzYrSkVZYUNPczFMZXFHckVYTGk2?=
 =?utf-8?B?VjJ3SzF3akVBS2hPSEs5NjdKa1FMNTA3ejlhVmlYUW40dzhPdVc4REFwZzFk?=
 =?utf-8?B?RlREZUhKSVB4TnlaN3RaSFlZYTZ2Q1YzcCtZc1dZQ1VpbXgrS3ZEVnd0SFI2?=
 =?utf-8?B?U09yUEJ5UnY1eHIzaldPc3plMW5QU2RNSGZJdjM3YjhUZHlTdnJBdVRoT25O?=
 =?utf-8?B?VWtOQzlRUjJNQm52MTZHbDZtWWRjbXkwVkdVTmFDYlUvWVBBOE9ZbzNTNlB0?=
 =?utf-8?B?NTdMbFZVTGJaTk5DMXpnalZIcHBHNFV4eitoMmpPUHVTTHRMVDZqWFJxWlZo?=
 =?utf-8?B?UDBPdTBZbGZ5OXVQdytudFQ4aXUvdTR2LzhTZEJSVHhuNWp2aEQ0NlVibzJP?=
 =?utf-8?B?WWZBUldPN0xMMXBucmU0OW0wWGMrckhQYk4vZmU0UVZ0KzVnUFpUMDNmWjVp?=
 =?utf-8?B?ZTJ1WWhnLzI3Z2IwVm1heGJMRUY3L2NxZU5HeVE3Zm9YQUxDN3NRMWo5WFE1?=
 =?utf-8?B?N0ZiTGZibnNLL1JQVHRzSHF4L3JyWXFIUGFRdzVINGlxeDMrS1JQZ3N6MlZP?=
 =?utf-8?B?a3lzRjUySndlbE5jOEZYRHpFNnpoM3JtMzhPdGRNVzlXYXQ4Ykordz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1096dc8a-8a21-4b3f-8faf-08de75f21b24
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 11:19:43.3246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjJNMFR1aj88Q1AV/EGPkonJHewzJyhjjm1cX8mQiSENxkToHv/lTA1DVoy7Nc2jYH4zuyPzmtUea/aA3ufMSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53694-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 9EB051B683A
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Use guard() to simplify mutex locking. No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ds90ub953.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index a85c6a9b64070491db161ca1586179dba9c69cb0..3a459687aefce05ac025a517c8d4cc6d76cd7293 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -113,20 +113,18 @@ static int ub953_read(struct ub953_data *priv, u8 reg, u8 *val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_read(priv->regmap, reg, &v);
 	if (ret) {
 		dev_err(&priv->client->dev, "Cannot read register 0x%02x: %d\n",
 			reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+err:
 	if (ret && err)
 		*err = ret;
 
@@ -140,15 +138,13 @@ static int ub953_write(struct ub953_data *priv, u8 reg, u8 val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_write(priv->regmap, reg, val);
 	if (ret)
 		dev_err(&priv->client->dev,
 			"Cannot write register 0x%02x: %d\n", reg, ret);
 
-	mutex_unlock(&priv->reg_lock);
-
 	if (ret && err)
 		*err = ret;
 
@@ -185,18 +181,18 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto err;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when reading %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	ret = regmap_read(priv->regmap, UB953_REG_IND_ACC_DATA, &v);
@@ -204,14 +200,12 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_DATA failed when reading %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+err:
 	if (ret && err)
 		*err = ret;
 
@@ -227,18 +221,18 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto err;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when writing %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val);
@@ -248,9 +242,7 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
 			block, reg, ret);
 	}
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+err:
 	if (ret && err)
 		*err = ret;
 

-- 
2.34.1


