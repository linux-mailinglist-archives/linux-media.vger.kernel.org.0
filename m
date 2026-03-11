Return-Path: <linux-media+bounces-55421-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DvMOa2HsWmjCwAAu9opvQ
	(envelope-from <linux-media+bounces-55421-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 16:18:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E89AF266480
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 16:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A88133016142
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 15:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B193DCD80;
	Wed, 11 Mar 2026 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DKSK6H0j"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E814629DB86;
	Wed, 11 Mar 2026 15:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242268; cv=fail; b=X3X/aJnyH7vMnQpbIPlE2gQovWTU9S5y2SuEkdCKdlY4+KOnLv2shhIkUiCojyiJ6fBKtTCKC9rgHKtMGlnx3a66lEEs0ezDNit/kqpXFkhZeFpKfVmWmj7KRHZnQNsJYa508mBKuLwRRnHRwUcVvA15eH9nfusKTP/flukfNLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242268; c=relaxed/simple;
	bh=s3iUNw2NyWOgkzJncy4uBwuOjPbKHxtPbK0oBKjCgbA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HwTlNm4j1ckv0mAgLF2v8KW7Pd4VINpdRwv5dshAG/AErX8a9MtnM5ib7BfRaJoN0cBZilKpnuR8OypiNX02b08rCz9ZNsEenui36Okttfa6ugimf69Tro3sJgfWs8ajQZ2HMfrk8qyNh7YtlzH77cl2hWG6m50i9uJMuZ1016I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DKSK6H0j; arc=fail smtp.client-ip=52.101.70.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDcS/5FvpDX9wMA4UVSSEd+EOpYMGrP+2P5yLuaKYBenU6ouJeLjh67Ug8+h77hEuSG7oqt6fNn9w9eITsyZ0rFpoR4gtA+peZtfZ53Lo2gQULauty45l5OsAOjggxjngBy264wrkJm7Rvq+rSmfpSiUPIQknvdsn6zMVEp1cUt+j6qpB3nhSrmSk7JpNS+u1u73vLYnciokjrdywkB5GGookekpbTA2VU4asxmzWlWVhX4fi2cukYhBj75j64t6XoNm3NkcqSAYlwiGAG7ytAF6TBAdzIF0kToQNGllOs797KVh8MT02dP1EzbTgmrQjBkKcme6FCWnjSAa1DjoPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3iUNw2NyWOgkzJncy4uBwuOjPbKHxtPbK0oBKjCgbA=;
 b=xhKCSBU2x8Dy7mvO1ow4fv0hQpgFgHh4aNhaebiEzN76c0opEdtg4SZN2IVZV+bHaq9/N/MVnBhVKB1op1L/BkatnZanmWZ2uT6g+L2OfXq4OOSD7xysLJwoS/t5ASTCpD/F3Y+ukP06+7wF1QeyLs3YcC4DUiNGuH1hKl7+lhTvrnEivQ7ccX2dNA73R2SB/gtNgAs80CnCRgaNhAbqHgKRe18cSiS3vlAzJqFqSz+huThvb39kCXYO1N6zYeliuaudjs8C6NwIf5woeTK2Tf+E/2JaCYpmpf/nI9TqyJs0hiqvjRAFJoECc+hdyIpqfRJjUwX9Aclgl50HES0GZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3iUNw2NyWOgkzJncy4uBwuOjPbKHxtPbK0oBKjCgbA=;
 b=DKSK6H0jiXmXD9ToeZjspLijieQMBGwaynwEmSn7SH5D9eF8BNIjJq+0VKndrs0Sb6iXtXRsT4GnP+/xe3g2guhloazVlirSHAgrV70Jj0WaRdnHTZofJmbymT9CBRn2g484lcdXfHmtq2D5Zqd84BbF4c4rhMFAqQgjOv9yp053N8Rr5k2moY72fjZQLW5xgbl1U++q+MjvI4AkdOvVNqHLtqUrZxNbbYDib/eizGYFxh457hF2SS3Et+5vG8VZPze1jzHBVqzC21f5Pe5Go02taxySLMKcarOT6dHCb+qUOfwvb8iPJfS/9IPlxQGSdgYJgjPk/ugGc6R+4bOn3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AMBPR04MB11743.eurprd04.prod.outlook.com (2603:10a6:20b:6f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 15:17:43 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 15:17:42 +0000
Message-ID: <a26ba4c7-05d9-4df0-b4ec-1a82d2df075e@nxp.com>
Date: Wed, 11 Mar 2026 17:20:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: atomisp: fix brace style and trailing
 whitespace in isp_param.c
To: Kalyani Patra <kalyanipatra2003@gmail.com>,
 Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Simona Toaca <simona.toaca@nxp.com>, d-gole@ti.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20260311151302.105992-1-kalyanipatra2003@gmail.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20260311151302.105992-1-kalyanipatra2003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P250CA0030.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::35) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AMBPR04MB11743:EE_
X-MS-Office365-Filtering-Correlation-Id: 512aee0e-1e45-4a8d-e1a7-08de7f81574f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|19092799006|22082099003|18002099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	lKViCRlwo4LgVbz0mzRq/EBHXk9Cpjsfb/eYqzQJADTcuQoahPXnn/jgjav/PZefQ/7+T+QyLR0c+bjHvrYKdIUs8aIcSrTlkoyRtUAde8BEsqfm0WU8XhXvu91stdGm00/Zfx3549UQ1rrd0MWA3sLALNB26bLzuHyfNsIP4PeQaad8Figc+apeU78GPLYbw4NEeWDXxFtjNv8E8Ar4VvNzISXLySVJ/9UQ8ftY7w2H0QOHQMA17P+2I9/vkTLP9XUf7+ckSyNY1Fr+i+zJlbhVxBrmXAcjiKmWqlCfgBRC1ng3rFk1jQqM6cl7v8EEwbBhgurj9ZtnmhJSljs4O6nocCzQ/Zd9AzrcEFVADKXiQ1W7qBBUSizTcfU9TK81YyfoIlam6iJ8X3IC08TR79UTmwLs2MD5o4WBVCWZ2B8obFUw2oVma0Mj4GnRXAJSWyvXHaaWbQoe9IoUcFH0N8bg/HrI2A5xMN+mEgA7J81zc5h1mn8l/pqCtJb7fKUg9PizzBHofKeJpZtrgPNO8+RZaIXpugADwCdLECPdpMtD5zTQB38VOworX6G3SeZ+XEiJ2IBvldV5c4R9cmZL2c94moxaiOVG7NbkvyO+BthL0eKkcg7X6LqfRrhhQFL64vg2Sm35i9EGr77EKPNTObsriSmLH0AqthFihL2Y89UjwAk8n9P61dmxx77/eFD6Zr/NxcX5ajkLjE7fbiOrAyK466yL8nd8n1qm6gpuDQA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(19092799006)(22082099003)(18002099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVRMaUtBUXBkRkhZRXptbkdlUXdOS0ZJakkzYXBOcmxWMk5QT0tVR3NtM0Nl?=
 =?utf-8?B?enFrUVcyUEM0dTZDMndYT3ZMWWxIRmV4RXVzQTJQNGo1SU05M2dMbzB1M2Mr?=
 =?utf-8?B?NENSMTZTZUVhMGV0N3oyZXc0TVdKL29Ka2p5ck1Qb2hFczg1SXJscWhOMGNo?=
 =?utf-8?B?b3VqTzJUNnRSdlQrQU84L0FxWldsSFRuTkp4cldDb2tEZmVObUkxc1ZaZ0hm?=
 =?utf-8?B?YTA1MXBQdWRPMkRQaHRkVlB4ZitiY1FvWkk4SXF1bmhGTThqcmxlUnJrZ05p?=
 =?utf-8?B?dG1NV2dtaXgyaVJqdFk5OHBPVmhHUDJPSmp1WnpLWG45ZEF3bVUyYXg3aURK?=
 =?utf-8?B?M0I0bjBZR0gvaS9hWXEzdjR1cSsrVC85R2dwV1FEWm1pOTMwVUVGay80SGtV?=
 =?utf-8?B?dkx6bWhBeDVONTdCbm12amFJZTcxVTNaa2l2ZFY4TEJLR0EwZmZhUkdHWk8z?=
 =?utf-8?B?NU83VThnSkpEeEc4UXVBeGVxYmxvWHJ1UnRWa0g4K2lEUDQ4NXYvK0gzdTRy?=
 =?utf-8?B?NHFBdDVNRkdVWmYxU2Y2SkVWQjdmN0dPeTJISlIzU1MxWjN1VEtqWnBoelZi?=
 =?utf-8?B?V0hUZHBLS3NBUCsvTDlyR3VqNW5xamM5TVpkMXBvSG5yZkpJTnAxdE9CTlBt?=
 =?utf-8?B?ejFqS2k1cUpVTmJMaEp0YTZZWTNJVk1sRk1kYmdaZ2FyTENnb1RoZ3NNSHRo?=
 =?utf-8?B?eWgwRVc0aUkvZTQ0ZUpVWXIvWW1sTXFQdmF0UkpGRVd6bGlrc1pRQmJmZnVu?=
 =?utf-8?B?WWVldEdILzkwR25BVnBSdnVybkwxTkxJQUlhRkFEV0EzaUd6alBoYUZzMUFP?=
 =?utf-8?B?NWFYNTI5M3RCVW5BN1B5TGpwSysvVmtVeHBpUy9sNWxHZE5GR3FyNFZlZmVX?=
 =?utf-8?B?TXNVUzhRanNrZnlDVDlmdHVrbUxUbGhPK0c3UkdKSkhOYXU0M3FUbkFBMml4?=
 =?utf-8?B?WDZJZGZJenlyUDhOaUZJT1ZEZTU5aTNWdFN0QUVsYzVvR1RvbC9vWG4vWkpM?=
 =?utf-8?B?aXFKVi9nSHNUNFM0WlU0dGpQTVcwSzB6VURiNDdXdjdBb1NpblVYaWlxalNv?=
 =?utf-8?B?ZnJGT3ZjWnA4Ty8zMGl5V1RlWVBpQWpaR01QM0lQNEVId3doVW5zK0gzNGpt?=
 =?utf-8?B?RWwycUVoaE9vVUJEdjJNa3h3cUpENDZyZDd1SHNKS3g0dmVpQnlwYndlbkty?=
 =?utf-8?B?dEs4MEF5S0toNFZzRS82UXRDWjZSYmpCNlU5aXBhUitFWCt5SnFZeldveHpE?=
 =?utf-8?B?bnpJTDdLZmhVd1h0L3FwNEtUQ1Eza3hjdnlVVmZTN2d4MzVEQ3FSWmZrTzNO?=
 =?utf-8?B?SzhWZTk3eWRIUVBFckV3Skt3d1NmTkxDYnR6dmFaYVRadzZENTVTY2hjbStu?=
 =?utf-8?B?bk9ITFFJSnNVcjJWekZqS1lrYTExK2V2bmtvOXZveURFdUU4eFozc21UVjVV?=
 =?utf-8?B?RmtrU05qYUVNWXFQN0FUdzVXSjlFZzlGTEZXc1hLVDFlTTU5ZkpRRFpwWTd2?=
 =?utf-8?B?cTZBVE01WUEwb3BNWnYwOUwwaS92V1U2TmtmZW1Obk9UbGd6U2xybFp4czRz?=
 =?utf-8?B?SW5ESXhpSVZKYW5hRFJoWkNpWGFvck12ZzduZFN4SXVQSUowZDgvdThrdHZW?=
 =?utf-8?B?dVBQTFhaMmI5L0IxMythaXNleThaUGs5clI2WXVxQ3dLaVlGVCtXTGtIV0NR?=
 =?utf-8?B?TmVzWXRsSXo3Y1Q1N0t6bVZGekxBZlpubTB5RVFERS9TcUNmblY3VUh2N0pY?=
 =?utf-8?B?YWdLME5EMEhiWVVaUkN4Z3E2RkFtVmZaMkJLMWVSUm1PSjEvVnNXSWNjL0hC?=
 =?utf-8?B?b3FkYk9BUUc4dnRweFhLQTlHSlV6bU9kYUg1M0Y5aGpzZnJzcE5NY254Rkw1?=
 =?utf-8?B?VStSNlpONFVvaVB2eXRzREdjYXFEeU5mNkZKL2pQa0dUT1BQMU5lU1lhejIy?=
 =?utf-8?B?S083ck90UnV6M01PTUducnNCdk0xWVh6ak9RcWNlNlp2SkFJaDVnUDhsVjZC?=
 =?utf-8?B?d0RoT2tVdVJiSFd1OERjakw4MFNOMzFuNFhUQ0gzRVE0NW4zQjg0a1ZoMENM?=
 =?utf-8?B?bjZ3RnNTUmRBbWoxb1JmMEFKN1J3alcySi95S3h4Nis0OFJYZ05uQkZGcmFo?=
 =?utf-8?B?ck04eURPdjZ6UVZRd2JqcWwvazNpNWc3clFCZG5YK0FhT1JWSm5XUUl1ekZv?=
 =?utf-8?B?eHpPNzl6bXhxUVF1Uk1EYkszWkNGVFU4UXRqQVJtNzVLSnYvTmpvNmtzWE9l?=
 =?utf-8?B?QWRsZ2tQVTRPdVVUN2VGQVBlaDZQOExLUE1oL0x5Wlc1VzAwbVVtRjVZM0dS?=
 =?utf-8?B?Ly9ZNW5sZGFVN2I3R2M0MWViQ0lab2d2aWkxNzNkdXpkSG0ySjh1Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 512aee0e-1e45-4a8d-e1a7-08de7f81574f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:17:42.7353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYofVFprOfGTFZOPO6XHueIShvYHxz5AjlpdNetU7iH3SE+1aQB3g3dEaQDMOvzTnNRfj45eX5dbdjyEaOzddw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11743
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55421-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.baluta@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E89AF266480
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 17:13, Kalyani Patra wrote:
> Fix checkpatch errors related to brace placement and remove trailing
> whitespace in isp_param.c.
>
> Reported by scripts/checkpatch.pl.
>
> Signed-off-by: Kalyani Patra <kalyanipatra2003@gmail.com>
> ---

Please keep in mint that when submitting a patch you need to start with version 1, 
saying [PATCH]... it is enough for people to understand is v1.

Now, even if we did an internal review until v2 community doesn't know that and you need

to reset your counting.

Otherwise, people will ask you where is v1 (plus where is the changelog for v1->v2).

As now this is clear, I hope community can ignore [PATCH v2] in the subject as git tools will do

when applying the patch.

With that,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>



