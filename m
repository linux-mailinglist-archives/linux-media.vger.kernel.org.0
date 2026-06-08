Return-Path: <linux-media+bounces-64109-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZtC0KSE+Jmp9TwIAu9opvQ
	(envelope-from <linux-media+bounces-64109-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 05:59:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F402F652883
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 05:59:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="M8Dn/TDC";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64109-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64109-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 746573028B5B
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 03:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2143033C6;
	Mon,  8 Jun 2026 03:57:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D83168BD;
	Mon,  8 Jun 2026 03:57:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780891065; cv=fail; b=MeHHdXzBMCvkqUcOlTnncSykFYJJg3baIRaXuVLwtWnNojZi4pKvMhnqkNDCa4sSu3k4y6Xt6FogKexJA/mvybtg1UIbJrG5omIY4mLGM1BBOoQRsgwqJijgkTspfH84w93FTLvNHMDo8DNP6mT6gPalcaF+Xk6jLuKoaluBx2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780891065; c=relaxed/simple;
	bh=bYJmGnlg3vZEFW2zuyKQhsOtc+iooZp/cds2hrEIj2c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=j8BKVv63GgnayKoMdPZjSoauO5wwUU7ixl539Jg6Gc/GMVG9/Pmu2Wg/VsCkKT+lp5lgNAlDQmmn7xxKJyIBjRe/q9uxhU06+BGQEvUG5dZLmXbrxlyeP1T+tMVkPxaYR5xx9S5YoerabZF+VJPOd9ktZvY/hTKuxsc6GC/xbfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=M8Dn/TDC; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyBP5B3KZ6cIGJYHWkz3hyi/XjmvSnYxjvkUSq9SV9D2bRbS45L+oqevKB7cb/5I2HvTHdL9HswGekgvLTb0Dx2og7CQSzWYGg9iG9hGvs+9GtkhYPED3a74Dr/7Zy97bpvJ3DSWeFzBnybnjPrBQa04NzG5O07Nj6f9rNt0/4E02i8Vle2GdZWC4mY/XgKJBgsv9BxwmY4AEE07/tvzNzQUtJ8Ui06o3EaymlzdEihswY10KrIeuhjS5iHWIekla/z37gocgrFWpkL2H2bcvkYErdjExzNNb8P2H94c2Pk+hE7dgPRejf5eg3n9goHZEKUjmvybta0p/cVXeGl3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idhRp7bJS9GHOBd7sYoBNkdqsnNE4b3rQjJ9exfRLSU=;
 b=HXOkaigTU3lwpxZExNmcmiJhML6tyxYbewHXPyKR4NUqx1S3jFsrCcKQb7yVxqBCHAM8lPkqO/t4OclCW1MgUt1g+fZeOGAkrKoiFjLJ8YkVWN7FaarApW6B7gfYo3PaGNSmg8azaz2s+9jJ5JhQe1myxkNssK7fDsdbVZFyLKDS9J4egdOOd7miLCkDCYIWyWwGwrZ8junN6b0dL/nzzVDX4aKdoqqdPue4t67bpiJ62xcJqlhNwHNJbXski2GcHorLOOuH6t6iaTRko6wZbpkaNTlCAhXWPYjp2lBws4wmbGd0L52YT5Sb/LxNsB2VV7D4pXz3ELcRfAxNiiMd5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idhRp7bJS9GHOBd7sYoBNkdqsnNE4b3rQjJ9exfRLSU=;
 b=M8Dn/TDC5DS/hKrcplEvzNO+abQs0OEIaSX24+uC5QdxHd16ZqpHxtcLd5RotS+hC6u0abYD1zXyJu5zo24W3RPtsuJ+KC0XdpN1j+YaznhXcMf5RiuzlJ8yYd8NawSevqSYej630X4yXal4s92JoiiDb5rr1ZBAIn62dHTZS8ZjH3RTiRXPh5dcx5fR4o2kHYqgsigE2wfVXi0W6Dq9Y3glHNoIzTi6yfk8wGOYff5PB1j8YCUiODa11R5DdFlP76IkzFjPnzgxD+LMg7B7pyuko2mvPIk2KqLOsDNAxonrw4acSadiBXM9y6+vtCS5mf7vF0zKdKoeL9E8rOgzDg==
Received: from AM9PR04MB8570.eurprd04.prod.outlook.com (2603:10a6:20b:435::12)
 by PAXPR04MB8443.eurprd04.prod.outlook.com (2603:10a6:102:1da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 03:57:41 +0000
Received: from AM9PR04MB8570.eurprd04.prod.outlook.com
 ([fe80::c9cc:24fa:6f6d:fb03]) by AM9PR04MB8570.eurprd04.prod.outlook.com
 ([fe80::c9cc:24fa:6f6d:fb03%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 03:57:41 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
Date: Mon, 08 Jun 2026 12:56:58 +0900
Subject: [PATCH RFC 1/2] media: docs: Clarify V4L2_FMT_FLAG_DYN_RESOLUTION
 usage
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-flag-dyn-resolution-v1-1-44dc65516148@oss.nxp.com>
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
X-ClientProxiedBy: MA5P287CA0193.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::7) To AM9PR04MB8570.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 36d92296-5e9e-4d5b-4c29-08dec5121690
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	i9iZ6ydMAydrwQbwdx6bDerVCUa59+uZsiPh6bPtK4UIUc1Mpz0fMP1IIV+UUY2+APCd8aJAU8FE8lAleHEJqZxJR94ZSDl271IVqA+UQE+UR5o8CAy6UKVfvPNJkll+iM3MXM86O7PlTLV67jT/KQPFSikMQSE0uaUgCZfa/cQt0FqLF6RnzL6wGWHLPzAgqLtvASH0/yKfjAofROmT2Lu1wOWdIYI3jG728SLPy2n60ibHJV0A8gcFkNP2wOQ2OAxKJEI5CE5gkzGUDw38R62cF4ItzHv2/ebUzM29U7XPjvb8HyrQsZwc40C22xWK46e8rmcxIsiQkFEVPocBNJ2puL5Gcp4y65sLHQqKJ79VEvL1+YTOVT2sv+olxK0OZ4yTUNea43AcnrtSwAJORxJF7X6pKv3WEIaSSNKUcH5nb5nrz1c4vSSL3ejaHHTnFw6vMXG/33RfalCi0cP+gT1z3Edoqipmd7phZ2mTAyaSp8Ser9M1S7+ewaIWsj6f42a4s2TAZ1mSqVLWHgp0G9WLfovqNogMr/bHew5Rf9xnB7UNRg8fzBolUNGO8a28oNLC3mqZSS5Ja34Iikk1bQnpfKrINMGoDV8n5LiiSK5wn1jZjlwtnpd9ZCC2tJ7FKcgM6yPRGMnPySgrAz1myXRdUT+6SYaMBZTOLqQnKHP9pN0QU/cGcKB/lkkTYJd9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8570.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vk5SdUpuWFJ6di9hVFRSZXNmenZmUEdnQU8rb08wd1F0WHhUanUzZTlFa1NF?=
 =?utf-8?B?VVBIWFVmakZyb0ZLZEJ1dTZLNEtkWThVV20xNmN1d0ZwRmNsNVBFRkFlckUw?=
 =?utf-8?B?RWxodFkxU3YvQS9UMm9XZ1dLcC9UNHFFVWdMWlNQMC9CaDczV0p0azIyMDlW?=
 =?utf-8?B?bElCZnhzYWIxUWF0MXBZVXVSMnU0QXNkb2VvTlFUcGZxNVZxQjgxTVB5eWFW?=
 =?utf-8?B?MnlZa0c3OG95RmhPeXFxTzZFcFU0SlZyRkdLZW1lRUhGQnBBR2JiRFYwYlhv?=
 =?utf-8?B?WHBTNDk2KzIwT0FuNjc5V1hVSW1FSS9IdUF3d09LbkVVOGdrSDhNWkxxU1or?=
 =?utf-8?B?WXhteGZVNEZTOGlEamZpVmpOMEY0RTlqWjNLVXJtQjJwbDN3KzhTWWFkUGpk?=
 =?utf-8?B?TGdDemx5RVpreXp5b05pd3hjSUhKL1k1WFJPb0NJcGlCSnRSdDljaWZHREY0?=
 =?utf-8?B?YnNKbGhBMjZ2THJ3YnB2ekVqNlB0Skx2aDNLK21Xcll5c0tmWnMrOEk2eU14?=
 =?utf-8?B?UzhxNXdaRFJiVWZDNFBKUC9UMnVpSEUxZ2Z3SThma2hnUGtyTlV5K3lIWVFy?=
 =?utf-8?B?NzM5WU52Y1Bmb2wzQS9EaHl6NjAzYkJxSkhSNk5FQWkyNkxmT2hnYm9UY1V0?=
 =?utf-8?B?ZWI1NWtiZm9HeFJRT3dLcnBIZ1BpMjM3MGpWc3VTUTJYMUl1Y1ZkU0gzc0Ra?=
 =?utf-8?B?bW5vbXczYjZva2djMGVhVWdTZlZTOE85ZDQ4SmRwck55WjVVUm9jU2ZNVkJv?=
 =?utf-8?B?dzFCQlFxOUZYSlFHaFg2R0cvOWt1YjBveUVSelMwL25jbzZ5bkhTZHJzNUdx?=
 =?utf-8?B?dExpajFLNmp1ZDQrZlk4Uzc5T3ZBeEprN3daa3pneFBZMForQlhpY0ViNVk4?=
 =?utf-8?B?SEI5bmxUVGlLNXlRZ1ltUC9nbFhnWmFwZlcrdk1mdDVlK1ZVQzRFYXdEbkR2?=
 =?utf-8?B?dU9JVWh4dGtYQkJ4TXlrRVVsaVhNT0VvaS90Q1lOZWErV3I2L01iTXROajFE?=
 =?utf-8?B?WnBad0NNaU1vTGVPMVpHL2R5SHV5NjVLcHJxN20xNHplZFA5M21qUTd1WGxW?=
 =?utf-8?B?QTJ1UlRvanlybnNjSGFoYUJqTXJWdlZnVUhaQ0N5bkp4SzAvR0VLYis0aGZ4?=
 =?utf-8?B?UnZNcGNMbkNZRjI3T25KcTRLejZsenN2aFhGWUxBVzRMZUtmd0tpWXJtbURT?=
 =?utf-8?B?N3Y2RzUwQ2FEdnAyaXhMZ0xLRk9IbE4rNE5zTDFsbTdETzdDM1hGeWs5UWpr?=
 =?utf-8?B?YW5SNXN5YWZFbS9Ib0lWM2hJeHlnL29uOHd6RTBhNi9WUjFhZndHWXNRZFN6?=
 =?utf-8?B?Tm93VTViMDNQR0M0TkxSczEvQ085ZHlleGdkRnJpSmNWTHFBbGVVMVhaRGdM?=
 =?utf-8?B?NDN4ZmhHNVhQOGExdFQwVE9UdkRWOVNZUU52SGd0eTZ0a1dYTVIvN3NQMGdi?=
 =?utf-8?B?UXNXS1JjaU50dnFQN2NSYXc0M1VOMjZMd0ZRRVRkYllHRVNsaDVQcmxOMXVY?=
 =?utf-8?B?NWlsN1BIUk9FekZoaGMzczhpR1ZJc3huSUtRSk9LNk5TbmV3VENIU2tWZ0lI?=
 =?utf-8?B?ZGFGQW9uNzZyQWw4TFBQQ2kxTGczdmtleVZRNmx1dDZpTkFJVXFTNmxjbkt2?=
 =?utf-8?B?RXRiQTRGT0V2Si9tUHVqRUo5S3BZc3AzeFh1dGhINzdDMVNseUVEZGFHNWQ2?=
 =?utf-8?B?M2NHelIrOUorNlJBV0tvNjBsVTlYNkxGSmpEZnptZ0hRdjFHMWViTzZHT1hj?=
 =?utf-8?B?WmJ5djVNRnBCY0xIenlRUDluUGhzM3hsSjhSMEVQdDJwZG55dVh2dnhSVXYw?=
 =?utf-8?B?Sm9lL0F2SncwU3FkLzl0SWpQV3ltTTNoemJNamlHQ0JHN3JDTmhLNnRtbFIz?=
 =?utf-8?B?Tlc4MXh4V0pWb1hFdUdnSkJnN0MwWmxUeWN5dGhtNDZBdTA0OVU1T2htQXFE?=
 =?utf-8?B?VDF3RkltVUhoUU1XMWdxYXF2alRGV1dISSsxRldueWl3SjVwQjluMUIxaXNj?=
 =?utf-8?B?bEloR094L2lNSG9XMVg5WS9PRVRpYWlobGw3QlltakZZZUFnNmJ2eGNzakUz?=
 =?utf-8?B?cUZSZGFQbTJEYkl4OTQ4L0l5UHVTRkU1SzN2MzU4ZGg3NnBwbHBwV0tqV0Q3?=
 =?utf-8?B?SENST3RMdVRUUlMxSnlNeFJ5WW1TeWlxU2QrN3Rxdk1Ub3dMN2dTUGN3aEtH?=
 =?utf-8?B?dFJNOXQ1YmJXb1EvTVhTemoxdmNvZUxEUDJYRklmck1Scm1BSjhlVWxWanE3?=
 =?utf-8?B?eStkNzU4NTlKK3JyMDZpbzRBZUZJWlZIaTVseFVMV05waFI5Mzh2MURZRitx?=
 =?utf-8?B?QXEzOUpmNW5TSThFRldBM25wSTJlYnUxbnJyTHZxNm1YRVUvVHZaUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d92296-5e9e-4d5b-4c29-08dec5121690
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8570.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 03:57:41.3442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlWXI2TPTTKPNTE8OQcNvtok1LCcSJSSOljwgnRElKMATDlSBvx6DEGUK28HtGQ2YgI8VsxrGqx5XuvpgI0jFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8443
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64109-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F402F652883

The V4L2_FMT_FLAG_DYN_RESOLUTION flag was originally documented only in
the context of mid-stream resolution changes. However, userspace
applications (e.g. GStreamer) also rely on this flag to determine
whether the decoder will emit an initial V4L2_EVENT_SOURCE_CHANGE event
during the Initialization phase, before producing any decoded frames.

Add a note in the Initialization section to clarify that decoders
setting V4L2_FMT_FLAG_DYN_RESOLUTION will always emit an initial source
change event, allowing clients to use this flag to decide whether to
wait for the initial resolution signal.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 Documentation/userspace-api/media/v4l/dev-decoder.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
index 2beb6ba1b3c2..19c1912804bd 100644
--- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
@@ -361,6 +361,14 @@ Initialization
     indicated by the decoder sending a ``V4L2_EVENT_SOURCE_CHANGE`` event with
     ``changes`` set to ``V4L2_EVENT_SRC_CH_RESOLUTION``.
 
+    .. note::
+
+       Decoders that set the ``V4L2_FMT_FLAG_DYN_RESOLUTION`` flag for the
+       coded format will always emit an initial ``V4L2_EVENT_SOURCE_CHANGE``
+       event with ``V4L2_EVENT_SRC_CH_RESOLUTION`` during this phase. Clients
+       can use this flag to determine whether the decoder will signal the
+       initial resolution before producing decoded frames.
+
     * It is not an error if the first buffer does not contain enough data for
       this to occur. Processing of the buffers will continue as long as more
       data is needed.

-- 
2.54.0


