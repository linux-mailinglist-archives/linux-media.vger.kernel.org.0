Return-Path: <linux-media+bounces-56669-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOs2BIz6wGkwPAQAu9opvQ
	(envelope-from <linux-media+bounces-56669-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:32:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA662EE475
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5564E301487F
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 08:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C91337E308;
	Mon, 23 Mar 2026 08:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e6wXSQLM"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010063.outbound.protection.outlook.com [52.101.69.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B960737CD47;
	Mon, 23 Mar 2026 08:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774254719; cv=fail; b=QT0dqsNQ4NVZOztCaq9Xp6T7zGR2P85a09UxQAbkO3AzU7R6v9F/XuaEDnfk/YdsmCxQvuiR/NI8ZBEmdI+ikSS68sBeMyk833jI5AenoEwV6JYpWGAqkJQVCXn/njgixGOYUNVuYxElMIX+fFvVtELUjDQq3Kr5pCyYuMSy1E0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774254719; c=relaxed/simple;
	bh=o58ZyIH6vcBxoK1UohtZ6qqWEAxMMkBKYCnIobxDXDU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oiOuV/0XjD5z9NPw0BLwtR1ns+MaOE1UnBvFPUTcRYET4OFzDRFbrxeaVKebJ9L2MuL6nUVf4TjR7VcGaAbEqvvcRKzHOTNEXqzng8kW2aMTQvPGjDTjn0UoS7Ha/CZlosfKM6VJ4Y5Rl0CCnh1L0sx4AYfFHA4Icmfsjg7EpPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e6wXSQLM; arc=fail smtp.client-ip=52.101.69.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pv8sZwdnrR0aUBK9kO2LgBoGAJvFFY0VT2o0swzuZgtYlY1U8o+Ory/LGiWmDUMveCtaKT9w91mcT0IMr4pUL7AElueTAsXVdz1hibR4hcKJBFNopJjKeG42fp/H9MzF83QFc7io0TuOAKqwF7B5JptRDm8Kx3AWe+2/EZ2ki/SBdtslOfczkQ4akMLAX4bO38hhlyKxj4KjpsNALMSRNVAhwwNwaZ7aDKC15AB7GpZ6Q7JbBoOaD2puvJW5JMcogdYl/f/qbcvgMnG6b5wg1sYQJew3OZUZOHTYNnRXE4yfp3+HFWBiE+bKj1XZGhnh05jDMgoBXQkpAlfx8bFbYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dA5fDH3bbbO8YX7yy979CjopqcbhCl5wovn120SxdGE=;
 b=xqChiQWcXpbhoLiF0nYZrh6aYfAsrB6lc0mvq68UoUgM7p8xVMjSO3zKlyO0RPObyz0Vayg1iJMGFWGOgPaNCHyI1CL1Xj5iXAoPPvWF2dR/lO/xC4r++KaI8quRyCj+U6mCAal7tELvhDdE1TmfTwleH4nsfOxQJTYH0SR7xcF4uEQPoGwr38bPCEddGIWjJhYr/kV5rWdkglJYIETbM8suDivNaYQSVdR5+1c6QP6OI2ZDVdIrNXCGrbWodCe/qjF4yI+dD6MS0YYSD/ymsf7N2GdgAMblDOBbJBjuvW/C+gWay43J0lNYQsTVn7WpZIG+6JMH72JPehNVEX0qlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dA5fDH3bbbO8YX7yy979CjopqcbhCl5wovn120SxdGE=;
 b=e6wXSQLMymbGBvmQaYPD2fOO4ucO9aXFTjsX55ayLxcdKa5r/p9au6O0b5wCBtSQaHdDhcoFJ4usR5QqPNZXKpXK02yhid0v0hLlrqo0CIv+K6FSaz5SovNrWP2H0TAdJrJ09IKH1WI7Z7KIxgbf7UmRxEZu5isCvEkcYIpbpyqUDYnloDW7aQRr6nA+9NSa54XefPoAWWNISfmBOa/tySt5UK67ErgWtDga+ZxMAcv4W2rmT2Sel88Sutww02fBe2ujtjb/iCNKXtkxdQ/PchNF1Ku7CNKgydsUOsHdkGxU96ISCD246MU3sCzILpszpi7Dy+U4qSUXd5XH1vksSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB10993.eurprd04.prod.outlook.com (2603:10a6:150:226::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 08:31:33 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 08:31:48 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 23 Mar 2026 16:33:31 +0800
Subject: [PATCH v3 2/2] media: nxp: imx8-isi: Fix scale factor calculation
 for hardware rounding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-isi-v3-2-8df53b24e622@oss.nxp.com>
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
 stable@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774254837; l=1627;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=m7xExheB/IYg7EIXFWb1yzaiizUTLT4j3QLSJGo2LF8=;
 b=7O+abIqcOnLqr+Lq/8OSx4fSfVNtO42U3k5GIza7LhguiR610+UJDlj2matL7/F4WuE2P5wU2
 Rzs3gOyViDgBSjRC9wV5yZb2vMzg7DtSJBNwkeQUOsTOBez5C1t41Co
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
X-MS-Office365-Filtering-Correlation-Id: e72a6a83-2107-4577-d201-08de88b6a039
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 KHwH4bb5wz99jt/2bYP0eis2cFbBJLlzEYCIGWRKkdeOexpReqS9Z9D4QpD8AaBvp91tg9p0BE+drUm8aPqo2itXNzP84nc4wr1PZc6Jhz8pLH8r14JoEzD5t7dngi4M14pOpFPxx+GBR8hjDVQfaRwsLsPzD/vp4U8ED4ZoyZ24YBQOIqZYJmn0rJh8Uwjjh9lLAWmb+x/I/17zVsDhJsATydT+3Dd7N0ZpBkul/YpXPaUNNhria4fdgySBRr/ilJu2JYpqPoKZDPddV+gwT0oNNEX2UDWQs7ZCbyCqfF8208qTnGaiWycIhWU2LKJdOXd2BqQABgpzTYWaRB/P65bXqvULdN+GptNFSJF6ExaINajd9O6aY0Velrpx/q8TOXulyFtrWumi1KqFW37K80YF1qqckZpXWVwGQ+pgNarqJ4ViLQSYpu9OsdVLP18CnbNZTdoq00NVFzHSZO25vtioB/fbie5/fRS42g9xuq5dUQZe/IxdMCzp9xfm9CjcrW1HJhr8gfKx3hAfRPxeO40VGVy2c47gh/SpwAYZ7JM1m4wd8Dkj4kh+VWGoeOfF+cADxmhvVEGfadCldi6SPVeE0b7LFOyecWa7YXfx6EfGXC6/hzovchIuc2CxwAuDguytmzsWHg76sfXjqSJ+QnqAmF6WLzKgZietDCfH9kCz8hMMUDPd3msIA7TEcp0FxliXBieGgx+EMqp8uVnuO4XuAqpwMMgP6Yll9c5kqd3uVRY0ocel8F+WWh/50+HZUHZbNrVMJxkBs6YrtnMVi8PlaowbuJ/9b7aB2W1dEyUVLNpDu+jxaIDFxZKhwpIC
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZDdPTEljVnBDVjhLUy9ZUmU1UWJhdlY5TVFHQm9VOXhoZ1UxeWFvTmZNUklE?=
 =?utf-8?B?RWRsVk9ZUDFLbmFGQ01MT0g2dEVXdVc4dlRidUhqUjhBckhsZWRDT0lnRFFj?=
 =?utf-8?B?c2MyVnZPUVRkVkkwYmN1SSt3OStURGJRcEdCekUxK2hpTHJxM0FKeWxlSmc0?=
 =?utf-8?B?NEFheDhSbHBSWXpGTk1DSkV0SVdMT2ZwNEdia2tPaXdBUmpURnlmSnpDc1V1?=
 =?utf-8?B?dDRYWnl4ZnNHdHVsZWNCbllZZGdYUlhtek5UZk1ZM3lkckhnbjBTWCt2RDZy?=
 =?utf-8?B?ZDRqMmpKUHZzYTJsMW1OR09PTnM2R3VKSWRQYktCYUEzSmd2enRJcmk5SVQ5?=
 =?utf-8?B?eDJnTWZyNTRSakVXZGw4NkZsUGc0akxMd3JUQllZYVpISnRyaGsvLy9YYzRw?=
 =?utf-8?B?ZVlBMUR6MWNCZTJRMXRaaGh0M2lUSGxERGx2UFoyTHhzSXJRYXZEMklLQkd5?=
 =?utf-8?B?Mkhjbmk3V0FNZTZ4UDV4dE1jVjVSN3E0c3JRSUcxSWVOV0tuVSszL0dkWnZt?=
 =?utf-8?B?bnYwR2s4MUZzVkZqSGpSWEE3K2toKzFHNzBremhlbk4yUHE5TEpQZVM1eGJZ?=
 =?utf-8?B?c01mUmdCUkpsVGx3bUxCKzdKWm0wT1NUVVlaU2ZRU0orM3piNUJzV1NwWks1?=
 =?utf-8?B?UFhlazZjSS9TSGRHQVNwTGhvVWNNbUJuMnVMNWQzREExL0pLcEI2TkhIUWJn?=
 =?utf-8?B?MDRIREdwemdHQ3JNR2REZ21oT1ErSHplZjJ6ZkFISWkzUTQwRy9JSFhyYk5B?=
 =?utf-8?B?ZEZyZkw1SUtwa0lDYUJ3MElVWXpyaDUxTkdiK3RvSlMvMkJLdTZFd3V0ZTcy?=
 =?utf-8?B?clJoS1hjNWozL0ovVTN5Y01VU3o5aDVreEJPdHR1NC9nSlZXTHF4UTVDYWF3?=
 =?utf-8?B?U3czVnFDSkpleW8wcE5BbnBxTTU2WlVKd2FTazRmUTZadk5RbWFqRHExQ2Zx?=
 =?utf-8?B?VnpFV3ZiMFUzRHV3eSs1UzZGK2NkcW5GbldUMUJHdlJMcWZITjRUWGxBdXcz?=
 =?utf-8?B?RzNJSmN2T0FCRURFMG9seGVrdngzSlljTTF6alVPMnBBOFdVV1FSSVljMkpG?=
 =?utf-8?B?TEMwR0pNejU0RWVaWVJncnJ1RDdtcUtBV1luWGprQjdJQmc0dUNOZlJLZHY4?=
 =?utf-8?B?d0dPWjZYMFFiTGtNS2ppd3gxbUo1bm1DUWNDUnBIL0kwM0ZoSGU3YzczM1Ny?=
 =?utf-8?B?Znc4eCthOGdBeTlFVFcxck90TG5Pd1A1VFZEVkVZQ3dnbzJ4NG9LTUVudVVk?=
 =?utf-8?B?S1dxa1RkTURYb1JwUnlFdlpDS2p3OE9ULzRWLzJNNHB4RCtyTlAvNXVnNzYx?=
 =?utf-8?B?NnZ1M0lLYi80VkF1MU1acUhOMkQ0c3F3dGtuRitSSnNmZDNmWXFpWkxIdUs2?=
 =?utf-8?B?cnFPRFhKQVZiU1FRbXowWDdxaE5CZFI4b0NKSGU3R1FnTklIS3QwaTFVMlAx?=
 =?utf-8?B?aWhVZXY2MFZzMU0xRjZldmhXSXNPbGdRQlZpUHBwaDZuWFE4emNWTG5tNzZB?=
 =?utf-8?B?S1NMbSt3RGdneHlvSEh6VURYL3Q3VWcyZHlKWWo3b0c1QkEvYnd6TWxxaG5C?=
 =?utf-8?B?L284emVLWDErci8rT0NmMS9QMWVjM0RvODF6NlF0WFhBcHA4TTNydk1Na3ZO?=
 =?utf-8?B?T1VYSUM0TGI4UjlRTk04bUpUWklDMm5qQ3k3alV1SndKZ0g5OXhHWVAwT0ZZ?=
 =?utf-8?B?dm55WTNDb0FTbWkxdEU5OEVOYjJDNkMzYlJmbGFBSmJ1ZEVCb014U0NLVDhk?=
 =?utf-8?B?bW1iaHRhK0tGZ1h3aDVsVmlJZDNrbjRIZDdOWEdndENWa1BEWE9ETFFoVXVR?=
 =?utf-8?B?VWg3Vm16NmZGaEpJOTBnRVJSdmwweWNFQWRGS0tYTHVnMjA5c2tLZzFqNHVr?=
 =?utf-8?B?NnZKVmVZKzlOMkE1MW50ZU5MeHd4VXFvQnpudkU1QnBNZ0RmNzIzMVp3MXI3?=
 =?utf-8?B?RXN2RTRjSDZkMEJXd3FrY1pCc0tESXlGNHJUSXBhY2lQNzhQeFBaWkhOT0k5?=
 =?utf-8?B?bUdra1lId2xMUmRUZjJjQWRFM1N0dWFNcHNoaExJSFFHL3BXWWZFMzNXeUdQ?=
 =?utf-8?B?SmUvMnNObFpLM3Nhc0JOd2J1WXhMRmxhMWMwNExISW1NNGZIR2o1ajVNS2pO?=
 =?utf-8?B?dk5JdGtUU08xS2luOEpQTFR4Zm1CSjdiQXV3dmszTTh2Y0ZnU2JtblZNa2wz?=
 =?utf-8?B?WkhoSko4QTh1UjV0QTIxNjBFeVhSTU9RSlhrWXMxVHp3SnVZdS91MzhrNXdV?=
 =?utf-8?B?ZzZ0NnErQ2ZHVDdkaGlvY1NsYmVmOU5Mc2hQVkhaRSs5T2dZeFJ0MUpGODNZ?=
 =?utf-8?B?YnIyelpVdFo2QUlIUlNzdjR6Mkd6bHhFQmo5MXJiQ3A5SE5jRGVkUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e72a6a83-2107-4577-d201-08de88b6a039
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 08:31:48.8581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3zIqemk0yq+erwIhYZNLYrcqpi8MqVLbyWLTZ7prRDr/KwMeGk5povCtLZW7c+muv7E/JHW6ExwX/n6zozkSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10993
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,phytec.de,jmondi.org,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56669-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 7AA662EE475
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The ISI hardware rounds the actual output size up to an integer, as
described in i.MX93 Reference Manual section 57.7.8 (Channel 0 Scale
Factor). The scale factor must be calculated to ensure the theoretical
output value rounds up to exactly the desired size.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 37e59d687ed7..a2edac8292a7 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -112,7 +112,16 @@ static u32 mxc_isi_channel_scaling_ratio(unsigned int from, unsigned int to,
 	else
 		*dec = 8;
 
-	return min_t(u32, from * 0x1000 / (to * *dec), ISI_DOWNSCALE_THRESHOLD);
+	/*
+	 * The ISI rounds output dimensions up to the next integer (i.MX93 RM
+	 * section 57.7.8). Calculate the scale factor such that the theoretical
+	 * output (input / scale_factor) rounds up to exactly the desired output.
+	 *
+	 * Example from the reference manual: Scaling 800 to 720 lines
+	 *   - scale = 0x11C8: 800/0x1C8 = 719.859375 -> 720 (correct)
+	 *   - scale = 0x11C7: 800/0x1C7 = 720.017578 -> 721 (one extra line)
+	 */
+	return min_t(u32, DIV_ROUND_UP(from * 0x1000, to * *dec), ISI_DOWNSCALE_THRESHOLD);
 }
 
 static void mxc_isi_channel_set_scaling(struct mxc_isi_pipe *pipe,

-- 
2.34.1


