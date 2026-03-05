Return-Path: <linux-media+bounces-54618-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKFKOJ5jqWmB6gAAu9opvQ
	(envelope-from <linux-media+bounces-54618-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 12:06:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 585682104A5
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 12:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CE033056B76
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 11:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F25383C8F;
	Thu,  5 Mar 2026 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="XpEzh3FA"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023104.outbound.protection.outlook.com [40.107.44.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E2E3803FD;
	Thu,  5 Mar 2026 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708524; cv=fail; b=Sboj5c5UXcIUSMxo9mpzqE+1fJf//hR0WNyJwv0Zboqxyt7jnFscUG4L1jb4wgf2FurweTh3zcT7IHxtwaGf8irS3v6zzopSZMiTTRhgOJu3CAeVN23iMimo8AwtpbbjseAlVsBu3wRZvt/abNgvrQV6NIUz4lJkHPRSRItWBuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708524; c=relaxed/simple;
	bh=cA+wNIbv+7unAqX/k/4NwfXEZMJGj28OEhXNufdN9q8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sFNy6fhBjTj7YF5+5Ztai5WoImxpiAQPepW+w7ZFSXnBhZpKh5KphCmUJGE6BumOhdG3qe4XDrUdA8MtSCCMs/l8UcEjmDMxdwy51tgGKsyA7yOomEGE0xhyDAxGqSYUPB3CFeHIvfobICOxwBydraw7eAFvqyW2WWNFxhbFJao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=XpEzh3FA; arc=fail smtp.client-ip=40.107.44.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mExdneQdFTjtsm1xSwSnV76r1rsKifMvNTfquj/xtD+OX7M0ZFF1WqWqs+eghVfmqWljAdjaP/WptKCxveNpXg4M/EtWEVMcoLfsbPjoVvVk74w31nZfsSA/3X6m63JhShEf3MYnOn/+kYuj7Hdhuto+3AbGRy/KyNuuJYTtDQB2B6FoB4S4SDFDc6XsoPkeanGn1Gg6PoD4u9p17SrgbnC7Eiggwc9FaYonnX0S+f4CJ4iOTOcKNTGrp1iLQF7qfHZAALFYhyUBWFxSxJw/sP1KIxhW2Eea8JNbL99mfZlawtVG2fmO7L88WVG6rItCoMlShtDpm8sdSMsdImVO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyesQE+TW6j+u6Nu2efXqFtQJJ+iNIFO3dSsHafZdsQ=;
 b=OWUloQ+h48w7ht6slwuy+YMg3LJEXkhKvodKY8O4j8EjwhP+oLQ2La/9SGWvKDdHjkO071Sk2JIwdWfkpdiiBuncxnrxT6Rou+dLswxBu6f+F84nMh0x4Fmc3C9twupWZlGVI5bctJUqNgBBFAIWvN1qzFp6wxF472d1SFeBgZ4GvF8QFITbX1yLHicHJfNHGlep4qFh0lz+Cpmh64l8GMtmmpL6F5uyjH/GOSP8oXXsZ7uT1xPlPTErkrfOkSAGsTvOgUeyK+3SbUiiH9IXRBg7MqURNXoSo6SlBZo5AIfk4NAGP/yp/xf3iDkB9bEZNhre/lw/TuTYs/9XjebkoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyesQE+TW6j+u6Nu2efXqFtQJJ+iNIFO3dSsHafZdsQ=;
 b=XpEzh3FA/f2RDVyVBJ0kWKbiEOiiiHvislxTJ403io0ikSYBvZwtwWE8NjxX3ZudNJ04Urrj3/nI5sKDYaLBjKYT2txPM15PeAWpB5bXigDw2kysibK/odXeV9/XChmVJlDQ/2IuvZpjX+fAg9tKIWIvlyWjE+YsC7s5tgPcsUR3NIS4DTTdIMNEqRwn4NFmx5m1OZCih/hDVvCWPuQULW/gE/YGcFP2lreagIhD/bqLK5uMv5Uxln127SCU3ENamK/3GRJ7h++4ztUfi6cNPy+Se52Hoa2gC2jnMJIhJY6BdmNONDT0eXZin5oHCvnXP0ZZW3n11rRtxAO7JAGQGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by TY1PPF28B8111DA.apcprd03.prod.outlook.com (2603:1096:408::a4b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 11:01:59 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 11:01:58 +0000
Message-ID: <26d0f52e-3681-46ce-b0dc-0cb020e8d9a1@amlogic.com>
Date: Thu, 5 Mar 2026 19:01:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 1/4] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
 <20260213-b4-s4-vdec-upstream-v4-1-c7112d00d662@amlogic.com>
 <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
 <75e55ceb-e6dd-47b5-a829-66f6fbb3e13e@amlogic.com>
 <2f68ee18-e9d9-4da6-900c-93a7663b3c9d@kernel.org>
 <598c161c-d157-40e5-992c-912540589d7e@amlogic.com>
 <58d57a6c-7c69-4f5b-a4c2-f34ef0238511@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <58d57a6c-7c69-4f5b-a4c2-f34ef0238511@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0070.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::6) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|TY1PPF28B8111DA:EE_
X-MS-Office365-Filtering-Correlation-Id: b707d7b7-26b5-4b4a-13e7-08de7aa69e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	Mfc2kUm+9p4dTNJx8dlmwvQJ5/h8RT1fNyy+vz516g1L2YCejj0efAriMyq0bmQ7BLJDH7On2/B3Pli0cBItH5GlPZsZ7rtFbAeQdRaMHcrOiKYIQiGYXNL6f7Y2z3P4bmn1FsIxJBCcf7tEDiZAOLPIsh7iTCFne9EvzbTlqnIXzXy9BlCqjMjQQMey17LgKgDtOVemVU/Ku12nfuyaNdI9pxaV0aZnAuY1IfwUJbcmWVVdW0sUIdGEJEh/CcS5NDO5la+P/46l/9d4uGZzu9BgPHEZUoOsrJrFoAT0UBBLM9z8Pv1Imcn2PKY9jbD5eaOWJWTQ29nRL1eNQ6Q662aTDHiUXs/HATtEiQNhDarm0s+nXcIwDCIyGUKn4Da6r5bAg79D4Q0cU24UbswuovNwJZTjhlVLjDjjX1u0YZmYJjzdxLqG88J7mrbm+eWWtH6CGgwd+sFHNsEzFdQgKRPjPiU20sOSlISjpemykoVNx8z1mfy25aImvWzWIlYt0BjP1mtpmARVUsQGER+DwD8nzoQ/u/D4kWl0bygaPAS0m1/JmU1eSLN/Tj+sy76WL8AuBXFJobZ+mPuAoQ+VwPBCDJitGIuXCPs4hx6mR3QCWGotb++KMSLZjEYcwuil3aX5NB/Wk1KQC2xjX+k6icmLvRrDArQZKoI6COvjiYaAlu3KA8jXO3VY/jkdiKUyVNkmGsAzNHDh+WONrQTlofPoal9Ai/p357qMW+jQ6QQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azJDa3dRS2FGSjhMK3lESytsdXAvQU1CdXJZdVJnRXBDYXh4ZExTTDdLbTZh?=
 =?utf-8?B?bTBNNHhiZU1TV0F2bXQrSEp1dmJtWXJIR2wwZjlmL0M0T241VHhkYjJ0SENU?=
 =?utf-8?B?bnJrNjFCbGNQT3ZPU09HVU5ZZWxWWTZidGo5V1IxeHREMHo3bm9pSXFiUi9C?=
 =?utf-8?B?NlVCbVpNTEdhNndnQm1ETUV1VXlrSmVySDFCVGwrd3BOYTZJUkdyeVVsdFRR?=
 =?utf-8?B?V25aQ3ZQYnVIZXRhVmdjc1JVcFJlclVaNDZEdkdBMUkwR3dsc29nckYyT1hy?=
 =?utf-8?B?VW1zSDFiK3BlMHBaSzU0UWJyWG9yWVdnVlZnL2NjRnh2N3p3bEpXdWpvSy84?=
 =?utf-8?B?WXpBRkxqcEJMVmRJTXdCdFJtcFlpNXBGdHlJZkxhczlwVlA2MzhwdEwzNFdv?=
 =?utf-8?B?NUlybmhSVkg5dEsxY0hHaXdTK3hISnR4OVVjTGlSSE5ZYVYwdm9ldUhHNXNa?=
 =?utf-8?B?SHA4aUcwVFpON3phenlTU0d0VW9NbE9zZ1A0Wko5ZTFxMms1cnJwd2VDZnN0?=
 =?utf-8?B?UHZSTGdOUzkwbUZrMkQ1R25BZTJSWGpkdUpheUZtRG9wTElxYUk1N1dkZ0ZX?=
 =?utf-8?B?bDhvWUp6d0ZxRll0T002ck02TlRtbHR5c0RoMERkdTFLbzJLRU9kMGh2eC9Z?=
 =?utf-8?B?cHhZeW9QcHp6VmZqd0hGV05CQk1EVzF5Q05HL2ZJRXNVR0Q0QkpFRG9DZzhG?=
 =?utf-8?B?K2hXU2RGd3o0eXRZY2Zqa21SZXVFWUZsd3g0TTVHV21PWmE5aE9rT0RPeDBw?=
 =?utf-8?B?R1pwMjl4eUlXRTJoSDQ1OHFTV0wyNlpHZ2E3WUthTWxYZ1NmMlBScVd5SVhM?=
 =?utf-8?B?NnRFMnZZMzVMcStKMm5iZVQwODVSWkdlNUl1NFFnc3JnMmpMV0RvdjVLSnJO?=
 =?utf-8?B?UXBoYUZBcllOa3lIUzJjcVc3QURBdmNWSk0wY0RwQitDbWxoUC9sdDJINExQ?=
 =?utf-8?B?bXllWStDUjlVZVcyUEJvaDdrbVYyVjdvU0daUklFeFRBeHQ1WmVMR2U2Nksw?=
 =?utf-8?B?bkovQmtKQ25aRWhhd1cwOFdibkxqcERQalJnMFVZQlZhQm9VTHNWTGVXY3Bj?=
 =?utf-8?B?OFl2a0hDeTNCSGJsZmtEYVBQblBVVHJ5MG1lS29HYjluRW5uK2hRWjNsbEZY?=
 =?utf-8?B?NnZzVE05MUlXdm9mZHNHZHZoYmRCWTZSbW1hVi92TDJQamVTdjFjU2NwS0hp?=
 =?utf-8?B?UndaT1EzZDQ5QnZYUjhZcHBoUTJUcjdIUFlWYmorc3FES0N3eEYyT21HNTht?=
 =?utf-8?B?cFhEQTRlblBPakhNTzBrNnFzSDljL200SVlBemVHT3ZjeUdqYjQ4cEtEbGJ4?=
 =?utf-8?B?cDU0MjdMVUNWQ1I2SnpxNElxNjlIdE9ldWdYT0xTb0o0V0sreGp6TE05QWRt?=
 =?utf-8?B?M0wrckovdDhNcGNCRmJjT3hsNWxqRWRrQm45Nk83Wi9iQ0wyWVI0bGx5aE9z?=
 =?utf-8?B?TEFZcElEZFM1MDFoaWxhTzQ1TUZCd3NZMmV6ZC8yS25JWDFRNGJoYXFCNW91?=
 =?utf-8?B?TkVWVzZZUGF3TWZ2N092Z1NFa000SmZBdTNZSWRCcE9SZnlWbk5WdXlucHZl?=
 =?utf-8?B?aEEwZ25xOVgzQzFuSzFST1pkL1UrZ21FU1JNUTl2bUZZSXdVMkdUaFduMUJE?=
 =?utf-8?B?WEllajk4R0xsSWZzTHdPN05xVk5Da1RLWUdwckFkd1RPNjZabEhZNWhWQmZy?=
 =?utf-8?B?MzdsQnZ3ZlBLYmNIZlBkQmwzSUVIdDVMT0wya2pjWmFEQXNJbVlDTVp5NUVi?=
 =?utf-8?B?R1dFbSt3M2dSZ0VkSVhENW1zeS93eEdCV044VFBaN1Nla2MySEZ1aDVieTY2?=
 =?utf-8?B?SGdkMklLRHFxL1dIUS8rNkRMUWFNRzMyeEZaL0JhYWxJUmg5aDNYaHlTbTR4?=
 =?utf-8?B?K3Jibi9Bd1pOaDBOQ1dTUzl3L25QTUVCN01nbGlqMmVjTjJ2eWhFRVloQVp3?=
 =?utf-8?B?d3VCUFhpd01VNEM5YjB1VWJPUVJ4VTRxazB2NEZuMjVibWk0SnYrcGlKaDNM?=
 =?utf-8?B?OWRDdXU2SEg0QjBYb05qVDhDTFBIaG90RVU0MmRROE8rbGoxTndNcERpaTZr?=
 =?utf-8?B?cml4ME10SFJ1dmVMazBNMzc3ajNDbFRCbHlEMVRaTmFaZlBpOUZjeVkwZkpa?=
 =?utf-8?B?TTc4NnhnQXVNVjk1OFg2ZUVHV0pqRktWU1BhZERxeEpMT0ttbi9jNDFlN3VH?=
 =?utf-8?B?NHVTSWl6N214NnRyTlBZY3pySnBJb0V4RWZDZGxZcS92T3ZLdTgrSWtDQU9j?=
 =?utf-8?B?SGttOWhiWGF2cGxiUStZUlRjYm52eGdncFNFRjVaaUR2LzNtWEZJb0owQlF5?=
 =?utf-8?B?Y1ZQejdMT0lXQU9rTHEyL00vaGZTZUdBUWFTaG1WU1hnNHZaODBxQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b707d7b7-26b5-4b4a-13e7-08de7aa69e91
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 11:01:57.8999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKHJhuMqAUuNVZiAficI+ZaHDSsXUXtl4OxhwzlBauVhItbS7UBTjktvZUQeLrqi0N42fWymnW8F+EeN796kXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF28B8111DA
X-Rspamd-Queue-Id: 585682104A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-54618-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhentao.guo@amlogic.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amlogic.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amlogic.com:dkim,amlogic.com:mid]
X-Rspamd-Action: no action

Hi Krzysztof

Sorry for the late reply. As we discussed eariler, I would like to show 
you how the hardware module canvas work and why it is needed inside the 
Amlogic's SOCs. Hope this answers your questions.


      1. What is canvas? How it works?

The architecture is presented in the following diagram:

             +-----------------------------------+
             | Linux Kernel (CPU)                |
             |   +---------------------------+   |
             |   |                           |   |
             |   |   V4L2 Decoder Driver     |   |
             |   |                           |   |
             |   +---------------------------+   |
             +------|----------|---------^-------+
                    |	      | 	|	
                   DMA        APB       IRQ
                    |          |         |
      +-------------|----------|---------|------------+
      | Hardware    |          |         |            |
      |             v          v         |            |
      |      +----------------------------------+     |
      |      |                                  |     |
      |      |              AMRISC              |     |
      |      |                                  |     |
      |      +----------------------------------+     |
      |      |                                  |     |
      |      |           Decoder HW             |     |
      |      |                                  |     |
      |      +---|-----|-----|--------|-----|---+     |
      |         idx1 idx2 idx3 ... idx254 idx255      |
      |          |     |     |        |     |         |
      |          v     v     v        v     v         |
      |      +----------------------------------+     |
      |      |                                  |     |
      |      |            Canvas                |     |
      |      |                                  |     |
      |      +---|-----|-----|--------|-----|---+     |
      +----------|-----|-----|--------|-----|---------+
                PA1   PA2   PA3 ... PA254 PA255
                 |     |     |        |     |
                 v     v     v        v     v
      +-----------------------------------------------+
      |                                               |
      |                      DDR                      |
      |                                               |
      +-----------------------------------------------+


Canvas is a hardware module which maintains an on-chip-memory table. 
Each table entry describes a physical continuous memory region with its 
properties such as start address, size and the endian settings.
The design of Video decoder hardware uses canvas index to accesses 
memory. E.g. canvas #10 is configured to start from address 0x10000, 
size 1MB with little endian. And then this index number #10 is set to a 
hardware decoder register to set up a buffer destination. Canvas index 
is basically a reference to a memory region and its configurations. And 
a single decoder hardware register may take the canvas indexes for all 
three YUV components, which is helpful for AMRISC' s firmware (assembly 
coding) when setting up HW decoder configurations.
Memory access through canvas has HW out-of-boundary check. And it also 
has endian controls.


      2. Why canvas is needed?

 1. Since the ARM IOMMU HW is not integrated into the Amlogic SOCs,we
    need canvas to prevent the DDR memory used by the decoder from being
    rewrote by other hardware. Canvas provides the decoder with a
    configurable DDR memory range, as well as hardware-based detection
    and blocking for out-of-bounds access.
  2. From the diagram above, we can see a lite CPU called AMRISC. AMRISC
    is the controller of the decoder HW and the decoder driver needs to
    access the decoder hardware through AMRISC. However, AMRISC is a
    16-bit CPU and cannot directly handle 32-bit or 64-bit physical
    addresses. Therefore, canvas is required to convert the addresses
    into index to facilitate processing by the AMRISC core.

Regards,

Zhentao

> On 13/02/2026 09:31, Zhentao Guo wrote:
>>>>>> +  power-domains:
>>>>>> +    maxItems: 2
>>>>>> +
>>>>>> +  power-domain-names:
>>>>>> +    items:
>>>>>> +      - const: vdec
>>>>>> +      - const: hevc
>>>>>> +
>>>>>> +  resets:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  amlogic,canvas:
>>>>>> +    description: should point to a canvas provider node
>>>>> Why? What for?
>>>>>
>>>>> What is canvas provider?
>>>> The canvas provider is: drivers/soc/amlogic/meson-canvas.c
>>> What is this "canvas" device.
>> You can think of canvas as the agent through which the decoder hardware
>> accesses DDR.
> AGAIN:
>
> What is the canvas device. Describe or point me to bindings describing
> it. Your current bindings say that canvas is "a collection of metadata
> that describes a pixel buffer" so there is no way it handles DDR access.
>
> NAK
>
>>>> In short, canvas is a hardware IP inside the Amlogic SoC. The decoder IP
>>>> needs to access DDR through canvas IP, so we need to reference the
>>> Why decoder cannot access DDR directly?
>> The internal topology of the S4 chip is designed this way, we don't know
>> why our VLSI colleauges designed like this. But similar designs have
>> been removed in subsequent chips, eliminating the need to rely on a
>> common hardware IP.
> Quite poor explanation. Based on this, this as well could be entry in
> device reg lists.
>
> Anyway, I am done guessing, explain properly the hardware instead of
> answering with half-baked responses just so I will go away.
>
>
> Best regards,
> Krzysztof

