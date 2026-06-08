Return-Path: <linux-media+bounces-64110-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QwDxA00+JmqMTwIAu9opvQ
	(envelope-from <linux-media+bounces-64110-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 06:00:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C72652892
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 06:00:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=DAUe6k9E;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64110-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64110-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 451263034B27
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 03:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634D330FC34;
	Mon,  8 Jun 2026 03:57:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010028.outbound.protection.outlook.com [52.101.84.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B82168BD;
	Mon,  8 Jun 2026 03:57:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780891071; cv=fail; b=cxR2m6eVNyjJynZzqXxdl+uwJoC7KhZD0uoPxqsUzzAvhK3R9XtiZPkAMqKYykuXBFaFHXzwD6b/5+Csa5eTvumMtjfuDwLq0lqL17hfWvTKjfuYzamTo8ZAudi+wAa5KJHHCJ1FIrAybeVsbVNAnK17sIwPFY+0jb5q0TrDjeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780891071; c=relaxed/simple;
	bh=K17tCP1/0kWvvC7DqvY5Dy9BhDmKZQHfF8hvN6AofWw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=l3oP61uTCVSvFkpywQxSHYIAe2csaQDsMUg1sXCJGKQfoHs49kqCOfBCcaBxd8HtC5C7vZBXI+kxHZfmOnjmze2iUFqeV7ilfnqRcA0zWBw3XcA/iF7XOeDqlxtKMyjYB2L/lYHi9KD/ZNxoZmdPLhLgKdVW7dW4IdW9G21PI0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DAUe6k9E; arc=fail smtp.client-ip=52.101.84.28
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XcVnwuSOxzB/3tOPk8N8o5L/0G0gCOnmET/V1rRkNDu/O513PsGFDssT2AXk2ueCfXMnXHTTIiq9rR+9hOhdk2pl80iZfdA3Awaj2CfZcNsFpS7+3LCuHaDtBs0KZWtwiHbNEoAL2a3560bHy3PS7SJUrVCztDxOZ2oMX2ZDoe+9IoNg3TKSlePvfFEeVglR/yC0+Llaloz3C2XiSsSe2SjalRf2aBDMjwq3qs5neogv6cyznfnlu0wYlCAgRhcQcKYWHr8e9Xe8hQ0SXCJaPn3SvkogDNz3s4CFKpwcukvFemXZMr0jX07H7jvU6uBPQ5168LUdENIm2mM/MQ8N1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vORFfQBisTUYo/toq1zXgwo1Pf0JdJhpzfDoBx0LF1Y=;
 b=lbA44ESFfFIqEkOtFot4JGttJm9nY1OVxxOeWljMIrqnLL/HP8GhPF9ULCNyCvn9b9pMsPtJClo/11m2aPOjhVF65dI7v4FJmOEhlphpvlIpk960U/PNalNZIwS29Fwz/iyrUBU8APVgpJaj92pobHo+eSTL/JXDL8hYFHU9bp7LO2yFnXEqF1Gwckjbhox34L23fTV0uDDHaBIMmvEt+Y5zecjYRVBjMojJ0MM79zw8jJavn1Dtw+xmug+8L/52dRtn1/wvD0si/WCBVaiHkBcHSaGY8++7iVxxVVf3M1rgmlAcnx0Jyp7M4X4KDqvisVh9LVje5YKmvX3f+oLe9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vORFfQBisTUYo/toq1zXgwo1Pf0JdJhpzfDoBx0LF1Y=;
 b=DAUe6k9EpuunLcQbC4JLXuBtyZw+VoJPlqmegk5F7k7tU8dzPfSAD49uQc8nDinlZGOYeJ1QbK1xzZxbzlr/7y7JOwhZLfsjMEu3NvtAoGavOzo7hQU7arbh0u1FdNIQ2wRZUo13irHzconnd/Mhvr/ICwTIDEGAbgit5TWEUKqBLQ/cMRDbKBzM1xzTZrxca7KZJddO0ydOdpdQUkeLoSIA27VLQmDo0JOrNeJomm70zH0exMp5Cxf42R78tfmx18td/73FsHTA1+q1eHttIA3hSiSJneniO0WOM4+JuChnP/Py13aFGwR0BhCbuPaEJNMTBuDkAUD81+vyzrqHiw==
Received: from AM9PR04MB8570.eurprd04.prod.outlook.com (2603:10a6:20b:435::12)
 by PAXPR04MB8443.eurprd04.prod.outlook.com (2603:10a6:102:1da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 03:57:47 +0000
Received: from AM9PR04MB8570.eurprd04.prod.outlook.com
 ([fe80::c9cc:24fa:6f6d:fb03]) by AM9PR04MB8570.eurprd04.prod.outlook.com
 ([fe80::c9cc:24fa:6f6d:fb03%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 03:57:47 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
Date: Mon, 08 Jun 2026 12:56:59 +0900
Subject: [PATCH RFC 2/2] media: amphion: Add V4L2_FMT_FLAG_DYN_RESOLUTION
 for VC1L
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-flag-dyn-resolution-v1-2-44dc65516148@oss.nxp.com>
References: <20260608-flag-dyn-resolution-v1-0-44dc65516148@oss.nxp.com>
In-Reply-To: <20260608-flag-dyn-resolution-v1-0-44dc65516148@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Zhou Peng <eagle.zhou@nxp.com>, Elliot Chen <elliot.chen@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, linux-imx@nxp.com, imx@lists.linux.dev, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ming Qian <ming.qian@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0202.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::8) To AM9PR04MB8570.eurprd04.prod.outlook.com
 (2603:10a6:20b:435::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8570:EE_|PAXPR04MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f90fde0-e7a3-4a8d-77f5-08dec5121a48
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|56012099006|11063799006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	r4dXNLoFjK1n+ZnPyyfabDwY2IT3M2ga9njix7PXxo0xbLIe25Z0pmrcGL44yNbbutD9tANZj4edOdivu36c2MXw3UBEGCDXwwptwezPuACCm7j3vOQqD4v9RnT34vEtIEq57WcYEAY4fpZy3FeurOB/vgmEGH9V2jlW1eqHje3HgrEjKWdXeVEu3EUenk6kP1zQ3VXTTTBihWimrDJjmT3N953jZ64tZhxuIV5T5aDMptwKKfLY+YSWEc5+mdYnuWB35+Bezin/hL1pcqsb09eONHt5WK/PUvxg3UGmjaj99+fhXhT9iNbGvUqeEpInAhsiU5h3Oq3/irtmJwBr0OlLOnSUXy2eZMrUKiS5mg5Ip9HC/h3Se5Nmxx5WIj3DbXE5wV6oYiGk7iwOQqyfzj0Gl/CGasASCam8M7YUNzAd3FT0HQryJF0vh0fyLL4VB65cx62OV7T/7IcGJrBarhvSR/mW05Ec9kbXyJ99Ee7na0qMe1z4S5Et9sNu/sKerA9/wJ5OBSZUeIAhjmbfODuOcTeFTHySYoKRybQwmivl6zZyackCU2U8v3hOVYVxrSPOtp3mKcgGO7OgAGbXpCJBsma4JMC3A2NttIc8Dve3Ak+8Yx5eoKV7KeikEaO4nLZOnWUfxENgco+sNJHIZcxY4/6Wj1ONYNIgxupdPVMTcQOSrJlyb8oxJlG9RmD2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8570.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(56012099006)(11063799006)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjFFU01HWFRkall1eWdiZmVFenNqMlV0ZVdPTkhFT2laa1p2QmpxL1JKYUQ0?=
 =?utf-8?B?R1dQRGhNcm9tSmdxNW9ZUGFYYnZHUzVYWUhFZlgvUCtQYmtndXo5Yi9RaUR2?=
 =?utf-8?B?NG9NemQ2cmlDYkpxcjByTlhEUHc0QjIxN2o3R3BBaHcyTmJIem1ETmRITVAx?=
 =?utf-8?B?OUZMVGg2eHd2MDVGOGs1NU1KYzcyOVpRazNERmNRSHQ4c1ZadVo4eEtoaE52?=
 =?utf-8?B?YWd5eFBUSEFjMjVOVG5ycktTeXlyd2hMcm5ldnk3amcxZmJSamlhTFB0Mi8v?=
 =?utf-8?B?RlhCSDA4TWRCeXpRdDdlL3RFRHhoU2RiT1RFakhVbW5ETnRlRjQ4ck81WnA1?=
 =?utf-8?B?RWI1VlRkenRzYTBMN0RLemVBSWVyUkFFNlcrQmMwbkx4eEJwckdqR3NVVzQ5?=
 =?utf-8?B?UnJITzZENXI0K2V5WXBnSkpaT0U4RDN3YkhUZzZ2VjJqZkxEaUg5UC9oM00z?=
 =?utf-8?B?Vm1yOVFQcDVqejVxb3RveEVVb1ZpMktSNGxSVGxkTEVFaVFGb0tMdU5VckVL?=
 =?utf-8?B?bkd6amtqZjVZdUhFMitPRHFXOWpxOEhWQVJFdDRjeU9TOFZDMmhZUDZKZ2JB?=
 =?utf-8?B?bjlMR3NDRWttQVU3d0IyRGN1VU02cGxZZXRrbFhJb2F5UW1xdjZtQUZwbFNN?=
 =?utf-8?B?VG9MQ09HWVgrcit2ZENCRXlOOTNTOEhlYUt1SGpjTGNWbUVHSy90QjBvK2xl?=
 =?utf-8?B?YnNOQ0FnTm1lUjR4NXNBV2NvN0xvVTdQMnV2V2xvWkxzSXhWRml0YmRKdExN?=
 =?utf-8?B?NFFNVGtHQWZmYmFYS0tvcWhxU0prMThiemxqZFVTZDY1QU4zT1BPVmQ5WGcx?=
 =?utf-8?B?cERnb2VuNEkrM0dOcE9peGdqMXI5YVpHQVgzcWxWK05JLzkxVVFGOUxNQ3ha?=
 =?utf-8?B?Q1kveGdjVFY5TnQ5c1M0dXRHS3F0ZDRidUhUMUg1T3RNeVcwMDNZMitheFdH?=
 =?utf-8?B?OWxDM0c3MDNleG9UTWtpS05iNi9IQ2wyN0xzcDhCazRqanRuVlJmN2E1ZlhU?=
 =?utf-8?B?KzZWdVBETStVNjFRdGRDRll0SnVrZW9yMFRmSFNpc2RZdElYTW5CdkZMTXU5?=
 =?utf-8?B?TWRYMkpoZGc1eVRWcWFzbWtpSlZyQjl5Qi9uRjF4bVpSS1NteXI3cHg3a3d4?=
 =?utf-8?B?VXd1dkxLVkliMWMrWUt6d01ZUk5RQlFta3FxYmpsZVFMUmR5ZUhRcEtzZTVy?=
 =?utf-8?B?SDlxL0JmSEN6OTdyaWdSOWJqQzFxdjlkenY4ai9qUVVpUXllaUlwMG0zTnEv?=
 =?utf-8?B?eGRLb1JHVWxlVEFWZEEwSGx2cldTTllPSmI5RHpKd2lyVHJWWDRCbkMrdDZ5?=
 =?utf-8?B?RmVGUHhUL1owcS8vMkd0a2lrSHhqekszd3JuUDRZbkVtNTdrSG9Zd3FLM0k0?=
 =?utf-8?B?ZHVLeUFFOGdGS1VqU1dnbVA4NHpER1pGRHJFTk5TbS9TWFRoWDhJZzFpMnpF?=
 =?utf-8?B?blUxZUJlOGFBczNYWFpnRUE2QjFNbjd1Vy9sSXh4Z2o5dWtvOXN0VlRFeWdJ?=
 =?utf-8?B?Qy9OV1ZTTFNvbTUxQU9BRlc3RVVneXV0RldsUi9rMmVwcXY0aW1lU1VINTZj?=
 =?utf-8?B?UHFRNzNDbStxcWpnQXZNano1Y1FNQUtSNTBtOC9LTzQwL3lIdVd3Q1gyUFcr?=
 =?utf-8?B?eVhtUm96WDJVQUh1bE0yams0TlZIM2VSZ1BvS0E1Vkp2d011SDNPYkFramJp?=
 =?utf-8?B?b21mMkhFYWMrOEFmMWFHckxpQ0ZaTEZieGNIQTgvUTBWb0l2cTZqdEdtWExi?=
 =?utf-8?B?NDJSZEtjTndNVURTTlVNb3J5bXN6YXlrZ2dqaEFsbTVhMDVTaXZRa3NaSlJs?=
 =?utf-8?B?dkhybUNzSThFTE9ncWd0NVllZDBWNHNXeHRWMlhxSXRnYnU5aHdCRW55VzVk?=
 =?utf-8?B?UE1ZeFdpWGdpZzdTYjNyOFk4T2lFNDdnendFQjEzWEF4U0xaQ3llWlJkWTlt?=
 =?utf-8?B?Ni9wK0x1TmlIZ2hjRStHOXM5TGgzbzBLZzAvYjUvRlhlWmZnZ2dqL0lqeEhR?=
 =?utf-8?B?MjEzRGwzVm1HU0d5dlo3VmYyU05vK1BSU1ZxV2xuVEV3RlJBdUpKZlBGMWZ0?=
 =?utf-8?B?ajU5SDVYTVBzUXBHSlhwcVRTTXZzSC9qeExsRmY0MVZBQVY4SzA0ZnErdDNn?=
 =?utf-8?B?cklJcnFCbUxCNCtIamxxdTMweDE4QXMzd2g5Zk5sTXplQ2JlZkVYeDVpd21y?=
 =?utf-8?B?blhmNjIxY0IyTUdoRHJxT3JpaUNnT1lwM2dIYkR1Tm5yQ2V6TkIrS3lmZ1ZJ?=
 =?utf-8?B?UGFhS2YzUGRRNXhxTyswTjhsUTVKRTVEaE9SelQ0VkhMdDlzUHdSb0Fwa0xR?=
 =?utf-8?B?T0hVL0RLUGRBTDZYdzdWSVd0YVhFaTNqNjFPM1A2Z0dsaWhrM0ZXQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f90fde0-e7a3-4a8d-77f5-08dec5121a48
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8570.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 03:57:47.5291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADRKJgWSJBOHFGbuXVE6IbkecQD7dcm7V5osd2HTt09j8c+xRY0gD5J9cbHY85zlhBUg6hE1+ixrsE7cpd80Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8443
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64110-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil@kernel.org,m:nicolas.dufresne@collabora.com,m:eagle.zhou@nxp.com,m:elliot.chen@nxp.com,m:Frank.Li@nxp.com,m:linux-imx@nxp.com,m:imx@lists.linux.dev,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ming.qian@oss.nxp.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,oss.nxp.com:mid,nxp.com:email,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61C72652892

The amphion VPU decoder always emits an initial V4L2_EVENT_SOURCE_CHANGE
event after parsing the resolution from the stream header for VC1 Annex
L format. Without V4L2_FMT_FLAG_DYN_RESOLUTION, userspace (e.g.
GStreamer) cannot determine that the driver will signal the initial
resolution, causing it to skip waiting for the event and fail to set up
the CAPTURE queue properly.

Add V4L2_FMT_FLAG_DYN_RESOLUTION to the VC1 Annex L format entry to
indicate that the decoder will emit the source change event during
initialization, consistent with other coded formats supported by this
driver.

Fixes: e670f5d672ef ("media: amphion: only insert the first sequence startcode for vc1l format")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index a9f0521f2e1a..75808482d090 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -136,7 +136,7 @@ static const struct vpu_format vdec_formats[] = {
 		.mem_planes = 1,
 		.comp_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-		.flags = V4L2_FMT_FLAG_COMPRESSED
+		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION | V4L2_FMT_FLAG_COMPRESSED
 	},
 	{
 		.pixfmt = V4L2_PIX_FMT_MPEG2,

-- 
2.54.0


