Return-Path: <linux-media+bounces-55339-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHGNHl4isWkOrQIAu9opvQ
	(envelope-from <linux-media+bounces-55339-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:05:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F81525E81A
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 86BB2304DEB9
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 08:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AADB3BAD98;
	Wed, 11 Mar 2026 08:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VO/Ze/In"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E934A3B3895;
	Wed, 11 Mar 2026 08:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216086; cv=fail; b=luVvjkEJmS3g/YcDayrUuHnadXCM/ND6cCz633ozIb8ZXWp4gcWnOYxROoZuox9zUqE/73npPmg+kwGoHUyhgrIWWeKQ/euZiZDaLiJdMwENv9O3Vm7G7AA05mzFwVklQgXG9AOx4mGAI6ESz65PjHk81eL413ygFSfVVafirmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216086; c=relaxed/simple;
	bh=rTHb8C2JTYArig1Gm1kUr4rQ10e3bcoY4TDmUYBEjlc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GnbZ/5nczfAArSms3wlNhoEV61nVK5ArKUApx8TsHTc3z8F1SSMeZPeeGNrzVC21njP6p2EKEv37iBB/Z6kFA+iOHrYpLsEID7MC03P81ErrW5ikCuanYL/FfKX7oXWVVjZTEmay4lftObRhmDcfKc/eglSiArV3kQCxmP64ZPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VO/Ze/In; arc=fail smtp.client-ip=52.101.70.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5CrBRp765x1k0h1fNlEnjzPd9tN6iCx+dDJ45Yu/bFDz0A/Xc9qFsoeCP5ddzSaW6JAd8tHAJCv+YDP5vrOqjoTjv6gVg4+ozy+Y7V6S4aa5OIiXeAYxxE6k63RBQsD8pPoLI+rRUCH9IXD+6ygtFk+CGQ5tUxYoVVBDyNe5QdeVfondFkxjlpU9oThupLaUO8wOEziHtmz1w6KZaRffdxp9DFYapJaQNe9LvuWWPsBARHKDBFfxKx4XyfZIsNkGGBzycEMA/vnuxz/B6RdlDfsTZLrGXzdlQ0R2p45CcVLGbb4IzwtpNudiumhV58rCs8wxWbL5MaDdguxedzX0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gK7eAKwZoL9n+8TUl0A+ExydOruyKUg58sucnFoB8gw=;
 b=ZjOS3bW+mHZHX/ikKkEaBRsBQtNvgZkVr1vDUqdcPIqpRRR6E3qIaSqyWirGg0JaX2qqAXgVjJzhrPSZacHg4idtsq1ApOasfuj+/vEEx22kv4f9UELgSkXn0hRR2CBBD7gmNzkTx57iswCeJmAK2SrY6+I3qXjsBQyeRpENfn8M+eOCDFQz9ciyMo5L1wIvEhgY7OeuWEVfbyMkU/UrITst5h9G+6J/vVJ+89lDGKtbBX/Bc/23KMs8I+VjhYWHXEtm2PuE8LIfOHJbNPpIIdd3WrO1niaoZTVwQKbwd9ZrB8ey60OzFFHFc1kewVxThsjN2p0Aw2qsK3faB7yP7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gK7eAKwZoL9n+8TUl0A+ExydOruyKUg58sucnFoB8gw=;
 b=VO/Ze/InrTOY9Z75nMRmLeebLRXZ9LbBSompHBFO7wIBvCwa6OMqnPPAvsycqdc/ZIkbA1mahCo6G5aiLUMej+07YESyBOO6Dwed+IRh7UQcmjUVknXxfi9rIS4OE2Nj/MlgPoopavY4AhgOG2s5AAj7fO0aSfGaHZH6SHdPZFb/41h3kY4CfOYM/YC3rsBYZSp1Ba7ZDho6of5VpIxScNUHN0UhJgJRg6dSswL+4E7kPg4TktxQawhqUsWXekiAGVgyZud4OXz2kATwIsQ3SZxk3+kNgPpCAG6zlV+bglDMabzkwNhomFsCFlozVIQRktvwv9d6vyN1KfYZ/XzN1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM0PR04MB11967.eurprd04.prod.outlook.com (2603:10a6:20b:6fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 08:01:21 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9678.016; Wed, 11 Mar 2026
 08:01:21 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 11 Mar 2026 16:02:59 +0800
Subject: [PATCH 2/2] media: nxp: imx8-isi: Prioritize pending buffers over
 discard buffers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-isi_min_buffers-v1-2-c9299d6e8ae6@nxp.com>
References: <20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com>
In-Reply-To: <20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexi Birlinger <alexi.birlinger@nxp.com>, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773216202; l=1733;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=QSdeMboEc8+sIq5FzVj4Ow0qVDLLaNIHzJ4sREYkY5I=;
 b=9Q7IhuB38MXGnYlM6WleXcxN02eOurvI6Y7ClSXzDYhv1UOjjcQH+Ta8nVG3tLNs9jtHxrY8y
 Cr8Ef1JVY4kBjSMSe6tiquY97tryk+LqXuMAGNL/6GQmZnZdiMok4bq
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM0PR04MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: 180aabe0-e192-4517-cea2-08de7f4461cc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|52116014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 xs97NrmFiWerRjiur6skRUuQyAQ6jpHhmd1dD9s75Rj5KUyG63oSqV5TdEqp17tzdLFn3xPi+KCXDnYDHK45ycPQnhwCGtKmMXjjaMd+ATyYtO/Oug8eCSQ5GzcaihCopq6pDRXFhx2A78U2VdCB59COo9EFSXT6mT9YZrc9VB2mWZotyjcSbX/rlZNJEEb/LxIt/lNZKrArn3qyoXLdt6zprIhdoqfYlaZ2taslcuA5xAi1VS39HKMwcgrwenGlAE0L8+wrRiWOYPSHXD+56PytU6r10WGjplOFwo9cBL7PTOfJSx056CEFtzYVbCXrqEH0wqFNCPzi3Zeg69AY5UTOAoA1utA0qI7mnnxJ8qcJZsjbBIkflFB7tWSRi2tGiZCK8g0U1NSdTEL6c9qa+bCkQlh4GGxBn6o0BocDNGk0ejK7ISYCy0h0D3W2VaaWabsr0J2LPq0CUhIzLOAiggB8ySOuWqZ1DmyRhdKv4rJGwkyjExqF5v0Hdrt5cpqpgjLQBFs4ei0tkA0expCE7ilERRn6ak+271lM+AIFWquwwHL4s33eDNI1jxhHizbdcCR2rrl9Rl4Hj64XFKG3vsAOce2cA3ygLmFkDaGf9KOgwbDbPA6IWACo0oXM1yPWU+wm0ppDk/bu673/r3oCPnk+HAyh0pBGgHcGqUivxdULpNjxQ3TUsJrOWaGolNYCrFALpHhtZ640YtsQeOOBkCtCs/4vkjNwXFbwg4Cl35XPTvqoDWzn19Zhp8FMUwJqiRlYhQKnSL+xyZPgx6+hwVaxlcVfxtAGagySJvcRv7I=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(52116014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TThqUlVZMGxlY28vZGhQeXZpMFNtaldpb3JFOVBFaTZLSTRnUFpWUTQrbEtl?=
 =?utf-8?B?bEpxNHp0b1JvSWRza3lMbC9xQ2tWQ0d3a1prSmhCZzlkd09nb0UrZ09GdzY3?=
 =?utf-8?B?MUhxbHE0bFcxbEoxWi9MMHVWVncxQzd4ZW5tNndRaGxvMElnU2lYS05FWkQv?=
 =?utf-8?B?OVZnd3BmQmJNbHAzNWgxMGNTWERrU0t6amhYZklZOUNRaDFXajE4OHRQb1hx?=
 =?utf-8?B?b1A1bUdBUmF0QkdGTWhVS1VyQkZmTTJsNDNwZEtaTkRsQ2RQM2JxNUZnNng3?=
 =?utf-8?B?RzNvNzB0RWpQOXZQQkJxam8zZUwvaDlpdjJoOFUrYUVGem1IR3hBQytScUR6?=
 =?utf-8?B?R0tPV2MxK0NXMmZCem5DWDhNNnZlbDFPcjVqVzNwU204cFZtMjhrOUUxZGh5?=
 =?utf-8?B?eWswaDZVS1lOV0grQnRFclpSMnZFQ1dURFJSRDBlQVZ0NDR0YURKT1NYT1BD?=
 =?utf-8?B?L2pLZ1lkeDJjaFJxMDR2OFlXRmczVXJBakd0bXRCc1M5aDRoVEEvaWpwRTFJ?=
 =?utf-8?B?S29qR2tjMXB0eEEwclRVWDB6NUJxUENVaXhjZWJWd3lwVWx2a3g4dHMvTE5j?=
 =?utf-8?B?UGdyVXFmZE50RzR6R0gzeUdiVXc2RlNJd2R0VENuQW04NUVva1dudXVIMENO?=
 =?utf-8?B?SVAzbkEwM1ZhZWU5YUNCdVpFTWMvUGhzMUZob3dGbXNGZ05yaVJEZWxCT21o?=
 =?utf-8?B?Zk02R2IwTUE3V25GQ29vL2hYWWROa0pSdks3djZhK0lBMlJkbnJIcVNDNTdP?=
 =?utf-8?B?cXB3VndqMFFMQm40Qndtb01KQWV4ODZRcER3QkRWQXc5a3Z6d2N2eTRjYXhw?=
 =?utf-8?B?QXBRckMrNXNmb3NYb3ZMME1DSnVKTm1wa29KUG50RldpeW90ZlQvOWNNMW1w?=
 =?utf-8?B?S09sQUpRWEUvbHlaT3JCKzExaW9ZVWdYNlpQOVJvNEVVWjJhTnRoQ3g1bnZU?=
 =?utf-8?B?Y0kwR202YXZkemZVdkFjZHVXS0pVR3RUT2VmN3RmWjcvNjhBck0xZnpWMCs5?=
 =?utf-8?B?bmNEZ09iYjV6bWVpN2lEOHpwY25rb3lueGZTS09uOFpoR1NXallhUkdwdjc4?=
 =?utf-8?B?UDE5Y3lWN2NpcVB4SStoTjErU3pRMlVtWEcxc2p1Y2VRTTU2ZUtTZTUrZDVk?=
 =?utf-8?B?c1ZsSlhHTE9pL3RHam82RXk4SjEwTm1nN3NZck4rdjliMDBGTktYZndXcFd5?=
 =?utf-8?B?SUtXUG5pU1lkQW1Xa3ZudWdLR2hrclJlZWlXUTdZZ0M3RVlWREcza2R6MnRm?=
 =?utf-8?B?NjVMVEJ3ekR3RnZQQkhTSTZ4OVczSVpDSUpldXh5a296c0o3Wm8yUlV5VEFv?=
 =?utf-8?B?ZWh6Z3RHNENVSVJySjgyRTYyTDVDa1o3Vm5abHIwQzlzSDVveEZ1MTdaVEQx?=
 =?utf-8?B?R0xaY1FmL0puUW0wUkNhbkFMRzhud3NHOXJxcmhWa0VDd2hQWWU4YnBCQ1BE?=
 =?utf-8?B?aEtFbTU2K1k5TEhzemtMMWdUaFkvSGUzNmZodUsxYXZUMTZWZElia3cva2RN?=
 =?utf-8?B?Z0J4QW9lREVzK2Q0UWVBclBGenFTRFJ5U3JmS3V6eXdTOE1jbHF6VFJuMHVr?=
 =?utf-8?B?bmVYaWgvQmhzaFdpZ2F2SzJodmJZL0phSmhDamZXUktsK3RDRW5pM1U1Lzcx?=
 =?utf-8?B?QURsYWc2dXNQQ1RtSkQwUEdrN2tIc21IakVMQ2FHL0l2bmdRTVN0ZTdIeEpB?=
 =?utf-8?B?WjIzZHprMEtSUXlsQ2xHOUcvOWVJNEhjTDZSRFlvTGZaYWZJZ1FrdFhhRmt5?=
 =?utf-8?B?Q1hWZStDcmNmeHFpbzVPbWNsWGEvekJYSC85YnpacnVLbE5wbG9EYW4zVGFX?=
 =?utf-8?B?K0dSbEs2anlmVllhdkQvNDlYZWNTSFF0aENKdEdkTWpta3NiRFBDZnR3aFl5?=
 =?utf-8?B?ZEs4TzJyV2hJdWtscC9ha0tNR3Q1WWlRS2RaUlRNMWM4OUdTT0JZbmdQY2RK?=
 =?utf-8?B?QnVucS9JZ1JMRnlIcXFVTjhxNVptemd6Q2JNTCtGaGZ3d0VUYmY0a2NIM0RP?=
 =?utf-8?B?ejdZVWxEcUVoYk03Z3F6UnFSa2VwOG5zcUM4d0hZOUtLZ2F5UnEyeEhhRWhx?=
 =?utf-8?B?dzJIbXhsSElxNlV5SW5ZdUI2bWNiaTJDWmdWL1NneVNLZjhRaFFkQlBBWk9X?=
 =?utf-8?B?M3NPWURzamYzZ2xOSlpvUXVKNE50S1MvRzY4Zi9RUjFuYVJjQmNMRCtiYlU5?=
 =?utf-8?B?ZmtLQnVHbHJ6QTlWWEZTamNTck1yQkd0a2U0VkhmRWRyMUtZcFNHckd6UVJa?=
 =?utf-8?B?QnhaRWc4aThxZlN4bkpOOVMxbDhwTXJTd1lkQk0yQ0JuMnVweDB2NUJVeVJa?=
 =?utf-8?B?aUsydmxpNUFwd1dqR3VoMENZQ1p0K3ZpdGIrT0VuMTlvNlIwOG9ZZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 180aabe0-e192-4517-cea2-08de7f4461cc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:01:21.0299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgm0eRCEgLoP4nhkIkk58jjY3JaTKyO2gACD4rmiuGoYIlvJpdL9DtzH1ZAikkNjeJlkl60KINtwf+JdLioHyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11967
X-Rspamd-Queue-Id: 1F81525E81A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55339-lists,linux-media=lfdr.de];
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
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Change the buffer selection logic to use pending buffers first (up to the
number available), and only use discard buffers to fill remaining slots
when insufficient pending buffers are queued. This ensures user buffers
are utilized as soon as possible, improving efficiency and reducing the
number of discarded frames at stream start.

For example:
- 2 pending buffers: both slots use pending buffers
- 1 pending buffer: first slot uses pending, second uses discard
- 0 pending buffers: both slots use discard buffers

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 2405baf21594cd18cf2b349234313c5e103b7802..53f4f74369f7855fe6b6f372294ee569f40a8ae6 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -786,13 +786,14 @@ static void mxc_isi_video_queue_first_buffers(struct mxc_isi_video *video)
 		: list_is_singular(&video->out_pending) ? 1
 		: 0;
 
+	/* Queue buffers: prioritize pending buffers, then discard buffers */
 	for (i = 0; i < 2; ++i) {
 		enum mxc_isi_buf_id buf_id = i == 0 ? MXC_ISI_BUF1
 					   : MXC_ISI_BUF2;
 		struct mxc_isi_buffer *buf;
 		struct list_head *list;
 
-		list = i < discard ? &video->out_discard : &video->out_pending;
+		list = (i < 2 - discard) ? &video->out_pending : &video->out_discard;
 		buf = list_first_entry(list, struct mxc_isi_buffer, list);
 
 		mxc_isi_channel_set_outbuf(video->pipe, buf->dma_addrs, buf_id);

-- 
2.34.1


