Return-Path: <linux-media+bounces-64528-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CxemMn86KmoCkwMAu9opvQ
	(envelope-from <linux-media+bounces-64528-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 06:33:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 084E366E317
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 06:33:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=J1Tct7IT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64528-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64528-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0624730B32F0
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 04:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DD633F59E;
	Thu, 11 Jun 2026 04:32:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4026064A8D;
	Thu, 11 Jun 2026 04:32:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781152372; cv=fail; b=EyiD/CKOYE82d6VKHAZLDn3OsHOwNcidsSxbRf8z5eqCrCZE3VVMahfa02/vuDma+a1QoekiUTSx1LJs6B3niMzcon3UF0msR9mMfzYGqL7yyB31FVN4O/nVNdzdKrX5BoQqdVTfLMMr3b6L+LgMrKcfaMMKEmmXYR0OsGtkbuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781152372; c=relaxed/simple;
	bh=0w5+g/cg9ebfgFKWorCbHalu+eNjaq6f1/Je909NQvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d3XwYvl+X3tnCQKJrWvOej2cVrlegOh0BJ4aoaY8SWccX678gaPzxIKS5uDoOWGSUioVmEJVDH+oohcMPgjc/hTJt1RGIhvodok0v/eDdMhwu7YRMiQQ94mPj4akXLSVS2ozo5fgXgE4gybbrppqkUqVe0rkdGHSNHOo5DG5PGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=J1Tct7IT; arc=fail smtp.client-ip=52.101.70.35
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nr70o5ZSP9rubi7pPqnex/Vql+fY2DFQebfCK28oBp8OD20ySAKbcC5RvRGSWSFUqWwvtJSXMr0yytiFa0vh95ud4criEfUglzF29HBRD1/6ygDrvQXJFx8H0R3mGnPnwTUCs5lkTI5Ckmaa6sWmGcFFItyqhXQg/2lsXl7TEQStZSavs56jNRMiP55z6pkiQJad2N4OjHTr9S/sx9xGxssnLi5TGXk6pu5gU/DLZntt9EaXudAV6pCeKuSeszTBkCOuk35GPL+PSQTn3Lec3r8c175YRCa0zjLT8LrZfpT5NrVLIMVWzG6GLCYbXZxu+vAetJ6YiU6qFqmkWN7Rpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abit53dmzlpzdvPgfjNGmJ7kuts8POsIEa1ZKjUjJ/I=;
 b=AYuIzUwv/+WRcd39yt7aWfoWVPUJoOHE3GEAU1hI2VbjGsV3EPvY7YTU6z9EcQAFcmmFSV22rWok1aKRVjCvC4hHwGxWFYOj7e7sEOnxYuQoIfVUJoCLMHx9lIKE2QYwrf2o1/1ZQNwGpLZ8M319OuAqbzhggk4Zhnu+Ptp4oDW17DfL+TGOZW408OBWWVjUUp40zuEDKX0pWUCXV3dQ7XdlS37NRiY0BwEesybltz8kiO1xilFwxRzqEZaSbBaS0gI0r+NlbfVaza2rGT3X0vo0iriM/8ALpz5HJBqx8FwPgeOnWtcoQHSTStA1YkikdJc36IMyrYS7wXHxzwEUng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abit53dmzlpzdvPgfjNGmJ7kuts8POsIEa1ZKjUjJ/I=;
 b=J1Tct7ITQ4BzoyCufMqc+2rF1kN8y+c2YgAPY3sISUqHgbxvervgXT3GDL6pbFbuwUhE1KzkLK92q2vaO49TqaVN8W3cbSiiqvQnTipIRv+flfdR/yjMkDDmHt4oRtcp+245+CyBdK2NoyYNJqdI+JfWTpOIICyqXFfgZNsdorgID/gy7VkRcOSNFZgIgwBCOJYvMgpYpFJkR7WLJGyFKH7gHhn6wBxRBCVg1qedF1YyDLTmubSX/o27U++ry+g2dMXebvSwMOTMj29D4zKrXnF7JuJkSkvxZfD/N1bg/LoSxXnL+EVgYTSd9AhlBh4cAaiC3ACgeXVi9I7llgr7bw==
Received: from AM9PR04MB8570.eurprd04.prod.outlook.com (2603:10a6:20b:435::12)
 by DB8PR04MB7084.eurprd04.prod.outlook.com (2603:10a6:10:12e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 04:32:44 +0000
Received: from AM9PR04MB8570.eurprd04.prod.outlook.com
 ([fe80::c9cc:24fa:6f6d:fb03]) by AM9PR04MB8570.eurprd04.prod.outlook.com
 ([fe80::c9cc:24fa:6f6d:fb03%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 04:32:44 +0000
Date: Thu, 11 Jun 2026 13:32:32 +0900
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, 
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, "hverkuil@kernel.org" <hverkuil@kernel.org>, 
	"mchehab@kernel.org" <mchehab@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	Eagle Zhou <eagle.zhou@nxp.com>, Elliot Chen <elliot.chen@nxp.com>, Frank Li <frank.li@nxp.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 1/2] media: docs: Clarify
 V4L2_FMT_FLAG_DYN_RESOLUTION usage
Message-ID: <aio5W7s1TMBfK3GQ@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
References: <20260608-flag-dyn-resolution-v1-1-44dc65516148@oss.nxp.com>
 <20260608040616.1A3EE1F00893@smtp.kernel.org>
 <AM9PR04MB857068E0FE59DD8ECB27A9AAE71C2@AM9PR04MB8570.eurprd04.prod.outlook.com>
 <e689df21c92861e35b6d11e391bea3404321484d.camel@collabora.com>
 <aijOPSFPEDsVlYFY@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
 <6d3acf626e0018c4175c413c3eeb9b8b12c3c8be.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d3acf626e0018c4175c413c3eeb9b8b12c3c8be.camel@collabora.com>
X-ClientProxiedBy: MA5PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::12) To AM9PR04MB8570.eurprd04.prod.outlook.com
 (2603:10a6:20b:435::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8570:EE_|DB8PR04MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 8380026b-08c2-494a-1434-08dec7727a5d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|376014|1800799024|19092799006|3023799007|18002099003|22082099003|56012099006|5023799004|11063799006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	G0RXpnHCR9Jf4CfWxkb5EWtku+OGc+chJ5cNQ5A5JyBCM0c6qHppmaD08vxClupGOfC8V+1fZbPtRAjEaw9AAS/+/t9sAmNXvnOlG7yh4NxVT28gkCxI4zT4aFTZQkW2glXCnpkseM1Wm/eQchMpwmLexO4C21oqG7WpJipmU9zvCvwgsW5GklkTZni3uoSoDfB56H931HlMfX3cV20OqcyKilSMYt0u4kmE3IoIROhp3xCKTu5jaPHmnMLf35T5Y87lDqaxJlSVbQHIMd0GrnXYTAnOh308ii23ifBwr9dh+pq0G5N05blVO0QFAPV/Yvoc8jnwm9qfOdTd5yneR2auPRxbdzZbpjNd9tyeBuP5FpY/aZu/R/mwthVqNTw+l/A2Nzkz+JrPd1N1sOgBnSSbHqpm9q+ggDa9gwlU3fYchqqWn2KQ7k1eH3s1DoYKGIwFjGd7hrZnO/i3F8LEbnF94PrXzAkpB2OvGBEQXnTGZLgnRVpM8FeedTsxGs2CycUmuTTg4GoQ9lETHlruKxcvLpyEOtZz2NUz/gn7cThHdauwugeUbFZIZXHWHunb3RB8ap6GrtE3D0Q0918WX+bp1gkfsseCP52HvGvadWU6VP+Hjar7L6xeKPqL5Ed+O225nvsbhAxB+rVB+ykBng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8570.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(19092799006)(3023799007)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2xueC90ZG5UK2xGMFZVSk9KVkhrelNoMEcwWi9uVHppY1hCUGJ5a3NrVlB0?=
 =?utf-8?B?bVpEMlcwcTF6VjQySzJLNVR4eFAxZVVESTBhbXlyZlhoSytMVzJ3cDZHWDhp?=
 =?utf-8?B?SEVmTWxyZ0djYWprSmV0N21udHptU2hXZnFjUDdZU0d1elBML2Z2aUprMkww?=
 =?utf-8?B?b2RTQzdTNlhyUzM0NGxtQ0I0Rm5oSm5Ecm5RTlAzVlorYUwyOVRxb3kyeGl5?=
 =?utf-8?B?TXUvT2V5Y2U0TFh0NWRmWG5odmRZM25aQkhLdmRrZEQyRzcvb3dLSVY1cVU2?=
 =?utf-8?B?UkxqNVRITzdldDdtTUxuY2c3bGV5ZVdhbDNzbzhlZytVTVhKYng3cUVuUncx?=
 =?utf-8?B?MUZhWm5LV1Jrak1peHJ6S0ZDTXNEVkl1b0NQQkdObUtIQnlyV3NaazhSV3Fu?=
 =?utf-8?B?ZFptc0F6LzZnV2RuOEE0UlFDUUIySjEwL3J0c0NOK2E1bmhaWWhxMXI4enJI?=
 =?utf-8?B?TkVEajJQUkx4UGZyb3FXbUJRQS9FTVo2WGJ6KzlYZmNWUkNybjZ3bk1hWmFs?=
 =?utf-8?B?aGlQOXNJQmhWYzc3dlgrckVUbUdySEhPS1lTZHJQOWlQbTdGZVYzaE0ycE45?=
 =?utf-8?B?VkdNZzc4TlNGU0g4UnVPMDlSYzhKNlJwa3hQY2sxQ092TzN1OExFZzU3ZkZu?=
 =?utf-8?B?ejlwbGVKelVSR2F1OEMxdnBOK0VaRW91L3J6S3dYUFhoL0h4czlpMnhZWXVy?=
 =?utf-8?B?S2dUR3JjRmJYaS8xcm16ZDV0SGJ3aFBSam9mRHVlQlo1VEptNFQ5azZWbzhw?=
 =?utf-8?B?eUl0OWZ3MjVyVVBraUZXNHZpWkNFVm9aQ3V6NWdBTUxPcldjZHB1RmFwUWxW?=
 =?utf-8?B?K1M3a3ByRi93TzdYMHQyQndWdm9QM1B4WGUxemlTVFYxcWxiSmlDd3FHZjFl?=
 =?utf-8?B?bGZMaXJXOTZWMTFhMWJTVHg1bittV1d0L3NiS0xWMTVyYktENFZwK2F5Mkhq?=
 =?utf-8?B?MXhVL1pLUkhNMzZhSHhZaUg1b3EyWHYyaHJYMVBjRWNqd1hhM3pVK2M4OG5E?=
 =?utf-8?B?bFpNemkxc0hjbU9lQ1ozVXpOZlc5VDNONTFTTFFxbVdLZ0JwdDVjYWhwWkRu?=
 =?utf-8?B?YXJ3VE1YWnc0aFppL1JtV2wycGx5Y2pPVndURGxnTXluOFZjOGZsb003cjE3?=
 =?utf-8?B?VER1TTZQYzBLcy9vUkYxWVNzM3VaRUZEdDNuRE43a0d6Q0ZsaCtoeVgzNnJ4?=
 =?utf-8?B?ZHI5WVJuS0NtNWpUbTNpWklsU015NjkwcjB2aExva1dTb3dWMEpJcU9hTTZ2?=
 =?utf-8?B?ek5pdjk5clM1c1U0aTR4dHZMZmx5ZVdWblJpTlpSYWZ3aTZXRG95akYzYjc2?=
 =?utf-8?B?dTRIb3VGOHJZbExOYUI5MDgya3k4eVNyYjRyT2VUaG5leVo0ZFFYRUJodGZT?=
 =?utf-8?B?cEFDa1VBb0doY05OSmdFcEp0V1lHNkM3aVJqVzMyVzdud1dWbWk2MTRXSWt6?=
 =?utf-8?B?M0E0R2U0cjFJRWVra0xMWE1SalgzUXZKN2x4bm9qdWh3bUdKMFhLYzdLM3l5?=
 =?utf-8?B?UU00WjNLUjJ5Nm9VWkJveVVZS0p4WFR3T0hwV0xQbzlYYkJwYjNVTkpsQUUv?=
 =?utf-8?B?anVuOXJOS2V4MXhHWG9RNWxoQWVtc0Y2NU83a2ZYNFVlNEVpYXJaOGVKV0Zl?=
 =?utf-8?B?NVlOeHJrMFc4aWNRcHpvOGdOa1laTytQalVWT3VMVFpyMjh1MkNyUDRGM0o5?=
 =?utf-8?B?RUZINEhqbTFqZVpQK1JMOGJOa0g5bElYM3h0ekx2ZHNScWpQd28xbXI0UDgz?=
 =?utf-8?B?b1dYeU5KV2FjYVdZcldMYWlJaTZhRFUwdm1RMUlEK2cxb0ZzRC9UTFVhUld6?=
 =?utf-8?B?M0RxWTB3dklsSGdsMG1iTkU4WHJsM3FCQTQwVU9pQ0ZFd2Q5TzdPZk1ybFc4?=
 =?utf-8?B?Tk1Zd1FFbnIzd0NQYnZMYnhLdnpMRnFnc05LMER6MkU5MDR4dldRb3FadERW?=
 =?utf-8?B?aXYrcXZuVHllbGpDSGZXcS8xWXVUOW1KVjU2K2VkeUFTU3pCMTlWQi9iOThx?=
 =?utf-8?B?a09RUDY1Q2VWeThQWEUwOWgzOWNTYVZNRXZVQk41QmVENTJOTHNnVG9RM245?=
 =?utf-8?B?aVdjcmtGT0o3RG1nSGxlY2k5K2pWeWhFVmpxTy92a0o1Mit6L1prWkYwb1Ny?=
 =?utf-8?B?N2V6Q0VCQW5STEhFVHlEZXVkNzhkdFd1M3d3Y1NPcXI3cmRaQk50UEZzQ0F2?=
 =?utf-8?B?VmZqUjJCTU0wMmJLZ0RsYjhMZ3BxL094VDY1VVZBRFhsQ0FBZzlqcENpMjZv?=
 =?utf-8?B?Y0wzaVFjUCtzR1ZLQjhtd0NrS1Q0TDhDVisrWVduWUdnMEVjQ3BwclpIL3J0?=
 =?utf-8?B?SVdlcFk2K3J3WVo0ZFE1NFUzOE1RK2ROSEJRNllWaG1KM2RpZUpCUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8380026b-08c2-494a-1434-08dec7727a5d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8570.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 04:32:44.5007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Od9O5vsBvEwdtgg6T9X4gvGXLfQswHlgVPBtxAccKbI4ZfmRnR7G0H0bzP4U7iM2KyN7tGtnsygeWeNsAmig3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nicolas.dufresne@collabora.com,m:m.szyprowski@samsung.com,m:andrzej.hajda@intel.com,m:sashiko-reviews@lists.linux.dev,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:imx@lists.linux.dev,m:Frank.Li@kernel.org,m:linux-media@vger.kernel.org,m:eagle.zhou@nxp.com,m:elliot.chen@nxp.com,m:frank.li@nxp.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64528-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.nxp.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 084E366E317

On Wed, Jun 10, 2026 at 09:20:12AM -0400, Nicolas Dufresne wrote:
> Le mercredi 10 juin 2026 à 11:49 +0900, Ming Qian(OSS) a écrit :
> > On Tue, Jun 09, 2026 at 02:00:02PM -0400, Nicolas Dufresne wrote:
> > 
> > Hi Nicolas,
> > > Hi Ming,
> > > 
> > > Le lundi 08 juin 2026 à 06:26 +0000, Ming Qian (OSS) a écrit :
> > > > 
> > > > 
> > > > > -----Original Message-----
> > > > > From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
> > > > > Sent: Monday, June 8, 2026 12:06 PM
> > > > > To: Ming Qian (OSS) <ming.qian@oss.nxp.com>
> > > > > Cc: imx@lists.linux.dev; Frank.Li@kernel.org; linux-media@vger.kernel.org
> > > > > Subject: Re: [PATCH RFC 1/2] media: docs: Clarify
> > > > > V4L2_FMT_FLAG_DYN_RESOLUTION usage
> > > > > 
> > > > > Thank you for your contribution! Sashiko AI review found 1 potential
> > > > > issue(s)
> > > > > to consider:
> > > > > - [High] The added documentation conflates
> > > > > `V4L2_FMT_FLAG_DYN_RESOLUTION` (which designates mid-stream dynamic
> > > > > resolution switching capability) with the mandatory initial
> > > > > `V4L2_EVENT_SOURCE_CHANGE` event. By stating "Clients can use this flag to
> > > > > determine whether the decoder will signal the initial resolution", it
> > > > > explicitly
> > > > > legitimizes a flawed userspace heuristic that violates the V4L2 stateful
> > > > > decoder
> > > > > specification. The specification mandates that for coded formats containing
> > > > > resolution info, the decoder MUST parse the stream and emit an initial
> > > > > `V4L2_EVENT_SOURCE_CHANGE` event (Initialization Step 4). Compliant drivers
> > > > > (e.g., `coda`) correctly emit this initial event but do NOT set
> > > > > `V4L2_FMT_FLAG_DYN_RESOLUTION` because they lack mid-stream switching
> > > > > capabilities. If userspace follows this documented advice, it will
> > > > > erroneously
> > > > > skip waiting for the initial event on these drivers, breaking Capture Setup
> > > > > and
> > > > > stream decoding.
> > > > > --
> > > > > 
> > > > > commit ec9c0583334c246f7813132b55724e42622e8edd
> > > > > Author: Ming Qian <ming.qian@oss.nxp.com>
> > > > > 
> > > > > media: docs: Clarify V4L2_FMT_FLAG_DYN_RESOLUTION usage
> > > > > 
> > > > > This commit updates the V4L2 stateful decoder documentation to clarify the
> > > > > usage of the V4L2_FMT_FLAG_DYN_RESOLUTION flag. It adds a note stating
> > > > > that decoders setting this flag will always emit an initial source change
> > > > > event.
> > > > > The documentation suggests clients can use this flag to decide whether to
> > > > > wait
> > > > > for the initial resolution signal.
> > > > > 
> > > > > > diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > > > b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > > > --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > > > +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > > > @@ -361,6 +361,14 @@ Initialization
> > > > > [ ... ]
> > > > > > +    .. note::
> > > > > > +
> > > > > > +       Decoders that set the ``V4L2_FMT_FLAG_DYN_RESOLUTION`` flag for
> > > > > the
> > > > > > +       coded format will always emit an initial
> > > > > ``V4L2_EVENT_SOURCE_CHANGE``
> > > > > > +       event with ``V4L2_EVENT_SRC_CH_RESOLUTION`` during this phase.
> > > > > Clients
> > > > > > +       can use this flag to determine whether the decoder will signal the
> > > > > > +       initial resolution before producing decoded frames.
> > > > > 
> > > > > [Severity: High]
> > > > > Does this guidance conflate the V4L2_FMT_FLAG_DYN_RESOLUTION flag,
> > > > > which designates mid-stream dynamic resolution switching, with the
> > > > > mandatory initial V4L2_EVENT_SOURCE_CHANGE event?
> > > > > 
> > > > > The V4L2 Stateful Decoder API requires an initial
> > > > > V4L2_EVENT_SOURCE_CHANGE event during the Initialization phase for stream
> > > > > parsing, irrespective of dynamic resolution support.
> > > > > 
> > > > > Compliant drivers like coda correctly emit this initial event but do not set
> > > > > V4L2_FMT_FLAG_DYN_RESOLUTION because they lack mid-stream switching
> > > > > capabilities.
> > > > > 
> > > > > If userspace follows this documented advice, wouldn't it erroneously skip
> > > > > waiting for the initial event on these drivers, potentially breaking capture
> > > > > setup
> > > > > and stream decoding?
> > > > > 
> > > > > --
> > > > > Sashiko AI review · https://sashiko.dev/#/patchset/20260608-flag-dyn-
> > > > > resolution-v1-0-44dc65516148@oss.nxp.com?part=1
> > > > 
> > > > Hi,
> > > > 
> > > > Thanks for the review.
> > > > 
> > > > You are right that the V4L2 stateful decoder specification states the initial
> > > > V4L2_EVENT_SOURCE_CHANGE is mandatory for coded formats that contain
> > > > resolution information in the stream (Initialization Step 4).
> > > 
> > > Be aware that Sashiko is an AI bot, llm words things with extreme conviction,
> > > and it this case forget about backward compatibility from pre-spec.
> > > 
> > > > 
> > > > However, in practice, GStreamer's v4l2 stateful decoder implementation uses
> > > > V4L2_FMT_FLAG_DYN_RESOLUTION to determine whether to subscribe and wait for
> > > > the initial source change event. The reasoning from the GStreamer side, as
> > > > Nicolas explained [1]:
> > > > 
> > > >   
> > > > "
> > > > https://docs.kernel.org/userspace-api/media/v4l/dev-decoder.html#dynamic-resolu
> > > > tion-change
> > > >     Says:
> > > >         Not all decoders can detect resolution changes. Those that do set the
> > > >         V4L2_FMT_FLAG_DYN_RESOLUTION flag.
> > > > 
> > > >     So normally that wording should prevent requiring an initial SRC_CH,
> > > >     or emitting later SRC_CH. Your driver don't have this flag, then your
> > > >     driver can't emit this event. But a measure we should take into
> > > >     GStreamer would be to not register (or mark) this event."
> > > > 
> > > > @Nicolas, could you elaborate on why GStreamer needs
> > > > V4L2_FMT_FLAG_DYN_RESOLUTION to handle the initial source change event?
> > > > Is this something that should be fixed on the GStreamer side (i.e., always
> > > > wait for the initial event), or is the current heuristic intentional due to
> > > > legacy drivers that don't emit the event?
> > > 
> > > The coda source_change notification is completely fake. It does not dependent on
> > > the bitstream content. So the event is left there, since its kind of part of the
> > > ABI, but it does not behave like other implementation, or pre-spec drivers.
> > > 
> > > So what we do in GStreamer, is that for legacy driver (no
> > > V4L2_FMT_FLAG_DYN_RESOLUTION), we pre-allocate both queues, based on our guessed
> > > dimensions. If it happens that the conformance windows is small enough, it often
> > > works. DRC will only work if the display dimension changes.
> > > 
> > > For any modern driver, that implement V4L2_FMT_FLAG_DYN_RESOLUTION, we strictly
> > > wait for the event, and on DRC, even if the display resolution changes, we let
> > > the driver tell us when to actually reconfigure. The legacy method was kept to
> > > not break coda and older driver, the new method is a lot more reliable, and
> > > avoid allocating twice the capture queue (wrong guess).
> > > 
> > > The userspace implementation is also a bit more flexible, as normally the legacy
> > > way should kind of work for any drivers, and we still subscribe it seems. But
> > > the implication is just strange and shouldn't be needed in drivers with
> > > V4L2_FMT_FLAG_DYN_RESOLUTION support.
> > > 
> > > Nicolas
> > > 
> > > 
> > 
> > Thanks for the detailed explanation of GStreamer's approach.
> > 
> > I have a couple of follow-up questions:
> > 
> > 1. Regarding coda's source change being "completely fake":
> > 
> >    Looking at the coda driver code, its seq_init_work does parse the
> >    bitstream via hardware (SEQ_INIT command), and the source change event
> >    is only emitted after ctx->initialized is set — which requires the
> >    hardware to successfully parse the stream headers. After the event,
> >    userspace can call G_SELECTION to retrieve the actual display crop
> >    rectangle parsed from the bitstream.
> > 
> >    The limitation is that coda requires userspace to set a sufficiently
> >    large resolution via S_FMT(OUTPUT) beforehand (since it validates
> >    stream dimensions fit within the pre-configured buffer size rather
> >    than updating G_FMT with parsed dimensions). But the event itself
> >    does depend on bitstream content and carries useful information
> >    (visible resolution via selection API).
> > 
> >    So it seems coda could work with the standard init flow — the source
> >    change event is real, just the information delivery is partial (crop
> >    via G_SELECTION rather than full coded resolution via G_FMT). Would
> >    you agree, or is there another reason GStreamer treats it as legacy?
> 
> Its possible I miss-understood the code indeed.
> 
> > 
> > 2. Regarding s5p-mfc:
> > 
> >    Interestingly, s5p-mfc sets V4L2_FMT_FLAG_DYN_RESOLUTION but does
> >    NOT emit an initial source change event. After SEQ_DONE, it simply
> >    transitions to MFCINST_HEAD_PARSED state and wakes up waiters —
> >    userspace discovers the resolution by calling G_FMT(CAPTURE) which
> >    internally blocks until header parsing completes.
> > 
> >    The source change event is only emitted during mid-stream resolution
> >    changes (RES_CHANGE_FLUSH path). How does GStreamer handle this case?
> >    Does it timeout waiting for the initial event and fall back, or does
> >    it use some other mechanism?
> 
> That one I have no idea, that MFC driver gets highly hacked up on Android, and
> Samsung is pretty much gone from the general purpose SBC or IoT world. Last time
> I worked with MFC, they did not have that flags set (it didn't exist yet), and
> the blocking G_FMT was the thing that pretty much everyone disliked, and why we
> made a spec for newly introduce decoder.
> 
> I'd assume that GStreamer cannot operate on mainline MFC. It would be nice to
> fix, but I don't myself have the bandwidth. Is there anyone left at Samsung that
> cares about it ? Adding the two maintainers. Though clearly, its non spec
> compliant to flag V4L2_FMT_FLAG_DYN_RESOLUTION without emitting the initial
> event.
> 
> > 
> > Overall, I agree that using V4L2_FMT_FLAG_DYN_RESOLUTION to unify the
> > behavior (both initial source change and mid-stream DRC) is the right
> > direction. But the current state has some inconsistencies:
> > 
> >   - coda: emits initial source change, but does NOT set DYN_RESOLUTION
> >   - s5p-mfc: sets DYN_RESOLUTION, but does NOT emit initial source change
> > 
> > If we want to document that "DYN_RESOLUTION implies initial source change
> > event will be emitted", s5p-mfc would need to be fixed to comply. Does
> > that seem reasonable, or should we take a different approach?
> 
> I think though that we don't have to have that documented, since
> V4L2_FMT_FLAG_DYN_RESOLUTION comes after the V4L2 stateful spec, and so, if you
> include that flag you also have to comply to the spec. Maybe I'm a bit wishful,
> but the reality is that this is more about unmaintained territory.

Hi Nicolas,

Thanks for the detailed explanations and historical context.

I still think an explicit note in the documentation would be valuable.
The amphion case is a good example: the flag was intentionally removed
because the reviewer interpreted V4L2_FMT_FLAG_DYN_RESOLUTION as only
relating to mid-stream resolution changes, not the initial source change
event.

The wording in the "Dynamic Resolution Change" section:

    "Not all decoders can detect resolution changes. Those that do set
     the V4L2_FMT_FLAG_DYN_RESOLUTION flag."

can easily be read as "this flag is only about mid-stream DRC", which
is what led to the amphion flag removal. A clarifying note in the
Initialization section ties the two concepts together explicitly and
helps prevent such misunderstandings in the future.

Regards,
Ming

> 
> For CODA, its very very old, and the legacy way of guessing the allocation is
> what works best there. Though, I'd be happy to help fix and test this one, I do
> have this hardware, and surprisingly, imx6 which host this IP is still in use
> today.
> 
> Nicolas
> 
> > 
> > Regards,
> > Ming
> > 
> > > 
> > > > 
> > > > [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5126
> > > > 
> > > > Best regards,
> > > > Ming
> > 



