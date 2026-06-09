Return-Path: <linux-media+bounces-64311-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gCo0F+EwKGpl/wIAu9opvQ
	(envelope-from <linux-media+bounces-64311-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 17:27:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C387A661BA7
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 17:27:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=jny8EeeJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64311-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64311-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B651B3292DDF
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 15:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4657748A2A4;
	Tue,  9 Jun 2026 15:09:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012029.outbound.protection.outlook.com [52.101.66.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4843248165B;
	Tue,  9 Jun 2026 15:09:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017794; cv=fail; b=JZW5BDa/BZkwGahU5yjPeHXa1dd+nosor0GiBXdWI0BnDwjXYp9ug2r9YxA11POzGQu3Iz31AclPX/11GZ/PUgCu4CfgdoXh53LrrGn9T1D5oXwx2WasEibzGFnwDvAZMbd5Ie//Y6uc0bo20h4P88+fXWkF4HKYzmqSDrAZMBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017794; c=relaxed/simple;
	bh=B4InVk7+a1B8WJg4fAznNacX6TYqjIFh5dLH7ngTJJQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V46OtrRbe/Mh04qIOHz0ToX6jL8t1V6dhs4PHOjBcjsU3hwhuOzCb+X98ABvQAbpWTas1KGeXvqCsJc1rHi4yd8aWREc84j3sBTsejekijPeOs5uGFZRmq04FpI47/Ys1IV2Ek+XsQYnWg9V5HcuBzl0Ix3r1g7J2bTUGjDJpnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jny8EeeJ; arc=fail smtp.client-ip=52.101.66.29
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3gfnywMlDRklW2zZUqTNnxS+n+8k9T9Nz1m0NPwicUOEjaXON01dLDkZv9nkVRqdDZo+z7i7RsTz6wtcfM3MN7sbdpHTrdJX6Dwe0z+n2bsJIYoV+2bTxZm6scFXtyxFEStON4iigYY6RITr7fnXaBpLgY2AjO3fGnNStePIcpx7V/Iekeh2hkavEVDy57Amh+T2xEbhBH9eKbNyIZU7NGJTqTtAqlGDHfBbaDjcu2oeAT+1w1DzjgBpAyc5lUA2tfLmVtha11mNSpMnTpcIyFHKAFA8V9I9QYxvCzV3tMgcNnPxJLWAGLG1iyF5JAgVJyqYmsw3tUhvynjxMbLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNFVcolxAHY13G2aCB5m/HJe1APiF+5dv+bNgoV0yHs=;
 b=hbJLDZbJDRcn2J5Q9bvKrmzS7HzaneUgAko7qJVxWzyKAetm1Uh8q64c6hEPpsn/PBSkIYevQKwKey8anYl21tYMb8pd10i3/SDrMIYkQ/j0NZ4BRK7m6mjkDaPjcJScY3TklPWkBNycrceNg/RQVxh188Fbc5dl7vyXTrB9PToPSfj1dZwwKMe2KEgVQlCdBcgTQuRlBxr0Ub/p4iei8ClDQVgZtVbZxisSD1Hr5FCbl6osdK2ftCJz7+dRxLMhxRNyxs7czXfCyFMvp+JpM71dVQsXyB3+0N26elFwt1uvY7Zj1R+zDNEeWA5P7ddmuzIXc0f+2qy3rhyZcD8vgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNFVcolxAHY13G2aCB5m/HJe1APiF+5dv+bNgoV0yHs=;
 b=jny8EeeJ7KfI6tEcxtz0J4zdnNlaYoaSVlR5HeYq8gCjVGQcfWK1YJ2pcZsAlqVchWSbFJ9Kn6fr0zU9YFWm996k6aPMyweJU13Cox4XGv4Y1dvo2SrBqTA6wq7uQxG1xA81fuEjMW6tG1WKuFCAZ9MmZ2p8BEkRFuZkS85afTviYco6INuie/PfUWVEp/vEgHfH+BnczLTIxGzrlh64sHGC+Uj/Oag7QcHAh+bR5CxUNYS+ltcMwR5GWshS/0luZZUIIOss5GmDXg7d9U+Rc7dTtoHjXlWIyEOorWM18Nh0EI15hcg7RqHoXy9uHXcEKs872WtfYBFfffWCUyzHWw==
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by VI0PR04MB11721.eurprd04.prod.outlook.com
 (2603:10a6:800:2ec::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 15:09:48 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 15:09:48 +0000
Message-ID: <8fa93d01-603c-4f1b-8d95-f44a27f00ab0@nxp.com>
Date: Tue, 9 Jun 2026 17:09:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] media: Add iMX95 neoisp driver
To: Krzysztof Kozlowski <krzk@kernel.org>, julien.vuillaumier@nxp.com,
 alexi.birlinger@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com,
 frank.li@nxp.com, jacopo.mondi@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, michael.riesch@collabora.com,
 anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev, ai.luthra@ideasonboard.com,
 paul.elder@ideasonboard.com, geert@linux-m68k.org
References: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
 <e15b9653-3d49-4300-9961-9303b983a4f5@kernel.org>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <e15b9653-3d49-4300-9961-9303b983a4f5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::12) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|VI0PR04MB11721:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de07f06-aa0c-4cf5-e159-08dec63925e2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|921020|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 klL3MdO73kyvjCkeQbVZaX2KwCw17MW8LJKpfCpcAB8SLlc2t0JZSjPn7xJuNMIQBk2mxPE8YelGoEa98WMGccJvzPoXtktZLn6a7yfdV3W/G6m+iWWHxI+ue4Lz6GKAMY6yPbyFnGpl1kCE/ia/Gw75QUc1Esp93BaSaxOFN7ePNElf+ZUuGX+at69L+QMYwjCFUBXGs2EZSpYVLIrqAOm3drKT4+hEFVIbwNJ9h5zIwmX8TRpLxkczvSqVOIyWuzi29hDx0vY+VU8TGHt0lqp3flM/SOAYWjHDGHqidY0UhWbJLyELyYCTwu0O6+9NYu6p6xJb0Yygta0unWrIwx3/OYkO2lwWw4/NhQ+22O5IF1gP+sr+xcJVciB8qTkkJ1hFFeVPJ1A4hZRafbpNZuXQIKMX3PrsFDlMqPdkEKz09gX/wbME6a4mPdVfXUXU5jR5t7bJezVjxyH/9yNa419kTLw26oKc51qczOuGOtQ9Ehq/rFVATVuehfMHYRdKEDzH/w4ovOOv7xEFHuWN0NwCjjGmGdxox6or8j326dQfcDKAy6DNS3ByDdiVF23l+L5TOqgQUD6MywM/JS6QcgOL2TCfP/DpU69GwTtdF8gA9e0Uf+3eUuC3Pr5uVz1APpJmBArklcfu6w6Gtlwix4J5m7aC/LnVA7j/u8KwE7NkYaUV+3bW0TA/ATWFks8nb9egRpdOjA1el4tnZxa6PwmqqCsvyeM8o9JrCC2ejYS1t/ywOIaevcepOhMfhXJW
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(921020)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VFVDa0RCMWxZZyttbHRxdkI4MWZiQkFQaHBOTlJTSFd0bEtZbGR6dTNEWm8r?=
 =?utf-8?B?M3hNQXdHSWNSelVTNHJXMVc2emU3UzRGOFViNm9XR0lhNEUrWTl3WFNYdlVi?=
 =?utf-8?B?OGVnd2doMjkzZmkwOWs1RVM4cUJ2WEZzV3k4ZWc5V25pQ0x2RHF5TFBMOTRW?=
 =?utf-8?B?bUlBd2p4Wlp2Uldwc1VqMFlsZmU4RC9iajVwZmZudk9yUG82dmlCc2JnUkpS?=
 =?utf-8?B?SDYwT0xYeWVLeEw5K0xCVjE5c0Q2MDZULzhrWkM0ajRBVEU4OGFYb29tajZl?=
 =?utf-8?B?SndzWlhTQTJ3OXUzUk9FMDZwWWxKZThyYms1N0ZFV3JmTi9BM0wwYjFMVDJj?=
 =?utf-8?B?VisxNlBQaFMyQjFDSWVaQW9leHc1bUdxTHhyM3pqalhPS0lvMFVhV3lGQlJD?=
 =?utf-8?B?cS9xRThTOFpnbDdoTHFzMjlGbURScWdUblhJQWRjK1hWdVRnMWNhanpxSlFG?=
 =?utf-8?B?R2VIN3E5Q2JBVnloa2pkQnJMcllhY1RMay9ja3UzWE5EZmxma0N4enpHM0RS?=
 =?utf-8?B?NFU2SWdqaWZXMVk4LzBTSVM0bzdQSnRrZ3Y0ZHJIb1NqV1p6RWVKSmpscmE2?=
 =?utf-8?B?WkNnVFhPWnpSY0pJcUdsRmZYL0VtRXRIVXNLK3R3cGpLaHBLZFAyc1hRcjFw?=
 =?utf-8?B?cXp1TGUvOFJWU291Z084cHdibzlkVTNnYURTMWRlYW8ydTZnakFjRGxPRjhu?=
 =?utf-8?B?UDZwNDJlYTdveVBtWm5Hc1FsT3I1MnFoVnNoSHN0R0QwbHdkaVJ6Rk9BS0lM?=
 =?utf-8?B?RUlCQllQdzBsZEcySWxENnJvKzZsS2E4N1RMc0ladzlFckNLaFBoMTJDUHJL?=
 =?utf-8?B?cW8vVHZwZnYzdGt5am5tdUtPeXJwck1qWDhsNGswdVp6YnRrQ2ZaalpIVjZr?=
 =?utf-8?B?dDljY05laFNRcDBHNVo1R3FaTzJqbGp1MUZTKzBXM1J6bWNkdjB2SjQrV1Uv?=
 =?utf-8?B?NGRBc0pjNVhPRVpsM3R6d0J0bEcyNUkwQkZ3MXNsYjZxemJHY1AyOXdlamlr?=
 =?utf-8?B?d3hac2dpL0haMlIzNzhZSkhTWGxoT0NhbE9qZVoyWmhyRktRVkl1WWFpMDNK?=
 =?utf-8?B?Smt6YlA4WjhDUEtsUTFUSE02UDlCMVdwOCtUeFk5WGs4Sm0yT1gxTkxPbC9n?=
 =?utf-8?B?SGlDbTJuM1VhaDJXMjV6UitpeFdjU1diK2F2aWlzdjNidkVKSzl3dDZlckZm?=
 =?utf-8?B?dW5NQ0xPL2RjS21jdmFFTmprcVg0K2IvNW0vUlJmTnlFK1BZSDhuUythVXZo?=
 =?utf-8?B?TzdWVDRjTU9yR0w0U0RGSmRvMnRRWEFUM2JQWmVuUDMzMlhOeTJBY21JbEsw?=
 =?utf-8?B?c2ZqdVNldW9CMUR6VGs0UVNDVEFKOGJlVWNDTlJySTJ0LytHWVNmVG85K3Nq?=
 =?utf-8?B?T1VQSzVkR1MrRXZVaGk2c1puRWtMVXJmMktEcHJzUzA0TTFJeE5NUHlLUkox?=
 =?utf-8?B?dXkzdTJwelpkYWo0aXpyR0VPOUpxMjhBZW50MzZwbmVaWUVDai9GcjI2UFNY?=
 =?utf-8?B?K0xxbkJIeDAyTlQwaFdNMDIyMGMzUUQ2VTViQ1NFQVcvRnJNLytRVmlJZENr?=
 =?utf-8?B?S3ZZelg0dktCMHhldnFDWUp0STB3VHlUaWxzUnZRZUorSjlhcHJYeHFMS2Rw?=
 =?utf-8?B?YndXTm5ta2VDb2RNaCtpdTZiK3FUVG1paUYxQ1BCdzlQU2dBZHJNNXY1VXd5?=
 =?utf-8?B?Ni9QTWgzOTBNdnduRy9WTC82dGlqckZhdTBmZ21MNkdnZTZJajJ4Qkcyb2k4?=
 =?utf-8?B?cDNUU0o5Mm5nSmtVeWlCUmlrbUNqeHJaZEExT3lZZzRUOVp5K09QWE91aDla?=
 =?utf-8?B?a0trM3d6dkNZeFJ1S0VudDZMWm9BTGJvUG5LM0IybGxlc3dIV3RQWFc1NkZ0?=
 =?utf-8?B?ZldVSGRYeldvYVJDa1lvMTJUajhTTTNiU2VDTHNvSG1ReTh0MWZjeEVVRk5D?=
 =?utf-8?B?UTN2ZmRxQ0tiNWpoMVNncXBiYllNaVYrd29wUWRXNTU1NnV2cmcvZUZhK2Nv?=
 =?utf-8?B?NWJ1ai9oS01uZUJ6b3BMTm1BR0hRUjBWYkRnRnJsM0ZPZUQxb2kvU0p6MXpI?=
 =?utf-8?B?R20zdDUvSzRKL2FRK1pVbExnS1pUTllpV3M3eTFMRXBOQjNLVGVwTTM4TDhP?=
 =?utf-8?B?WG5Pcm0vQ2I4OXFWYnBIVUZaK2F0QlRQVlVxVTNLYXJsbVdxcUhLRDZkMFc0?=
 =?utf-8?B?dENadUFWV1pwSktwUE9wdjE5NlR3UUpYTlBMQml5MWxVOFNtL0NuaHozR2ZH?=
 =?utf-8?B?RngyaTNPaG5IR3VTV3UwTmdaWkhCeGEya0pEYWw2NDZSckJJeWs2UEFvOGla?=
 =?utf-8?B?K3BqSUROZ081ZmkvOFphOGkyZkxPRDM3QVhFZ2FpN1hsVGs1eVgyUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de07f06-aa0c-4cf5-e159-08dec63925e2
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:09:48.5591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aygyGaZzIkmxNymR9+ZjoLMf6X6bf7GpTq6xRD41WXR4FiHth/p2tlY3iJ5AFV41dTOMULV5aWb5WQI8+gbEmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11721
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-64311-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:julien.vuillaumier@nxp.com,m:alexi.birlinger@nxp.com,m:daniel.baluta@nxp.com,m:peng.fan@nxp.com,m:frank.li@nxp.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:michael.riesch@collabora.com,m:anthony.mcgivern@arm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:ai.luthra@ideasonboard.com,m:paul.elder@ideasonboard.com,m:geert@linux-m68k.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:dkim,nxp.com:mid,nxp.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C387A661BA7

On 5/14/26 2:34 PM, Krzysztof Kozlowski wrote:
> 
> 
> On 11/05/2026 15:26, Antoine Bouyer wrote:
>>
>> ---
>> link to v1: https://lore.kernel.org/linux-media/20260413160331.2611829-1-antoine.bouyer@nxp.com/
>> Diff compared to v1:
>>   * Fix dt_binding_check errors reported by Rob's bot.
>>   * Remove extensible stats introduction, and use v4l2_isp patches
>>     from Jacopo's series instead.
>>   * Use the common v4l2_isp definitions for stats and params in neoisp.
>>     Replace all occurences of v4l2_isp_params_* and v4l2_isp_stats_* by
>>     the common structs and helpers.
>>   * Use the new v4l2_isp helpers for statistics buffer handling.
>>   * Apply comment from Geert in Kconfig.
>>   * Fix some typo in the neoisp documentation.
>>   * Remove `neoisp_feat_ctrl_s` from uapi (used only in legacy format
>>     which is not supported anymore).
>>
>> link to RFC: https://lore.kernel.org/linux-media/20260123080938.3367348-1-antoine.bouyer@nxp.com/
>> Diff compared to RFC:
> 
> This was v1. You even called it v1. This is v3. When you mess the
> numbers you make review unnecessary difficult.

Hi Krzysztof

Ok. Sorry for the mess. I will pay more attention next time.

To avoid further confusion in the numbering, I will prepare a v3 and 
keep the counter incrementing from there. I assume jumping now from v2 
to v4 would add even more confusion.

Please consider the RFC as a "v0" for this series.

Best regards
Antoine

> 
> Best regards,
> Krzysztof


