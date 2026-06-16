Return-Path: <linux-media+bounces-64960-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PvKwI6L1MGo2ZgUAu9opvQ
	(envelope-from <linux-media+bounces-64960-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 09:05:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2985268CB40
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 09:05:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=tn5H5vZa;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64960-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64960-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8626A3016C51
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 07:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FD13438AA;
	Tue, 16 Jun 2026 07:05:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011003.outbound.protection.outlook.com [52.101.57.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188E330E0E4;
	Tue, 16 Jun 2026 07:05:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781593503; cv=fail; b=PB7wJ5wt0m40i5PoVGSIy3nCcPz3JQdmrtDeJ2RgmbKRmB5QZ8e7/USgzMdAWq3lzEWVOSXAG32VEbzLrYjQIGAzp6cGiBE4ElcyoQ6qrmaHwMHf6GVChTLf4xwiSC5rUSh52v+Y5eteD5CTl4d0t+sNXoatynLueuyc4MxrNus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781593503; c=relaxed/simple;
	bh=2E00JxBaD7+MDwzn14gYGWCFv74musqMDxr/0VW5LeA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KE9PFYK2uNhBusKGM3Mi5lu6Y1MiMR4rfGq57pSUCIzjz+uiA9lf5uWsHbjArkfi0SF8ado7+8oEA9uLD3qxgMd/coKDqs572TVb6WHUq6GMxfjOUI6uzepZbTOs4Y/YAdwKQSy7NbCxaIsXj1qtAoRyoLsgC0UD/7a3Gc1xYZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tn5H5vZa; arc=fail smtp.client-ip=52.101.57.3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yD12iWkpi91d7UlEpuKaa8PP3la1FuynPyFEy05ECpaC7V/K8kHhRVjjsaSYwNzEcWxw7hqEVxv3TSWbz0ICq1o50QyUjGwocWKAqhtowDQDfN+EZxYv5A5hWjYcdIC3qvIfQQgB0w3ISNKM3Zjr21cPmeO+f3ucdG92XHnoKxvuL1Q1XuvMaLs0QnkuT0J873pxNu3VnAQesHpr7kQiph1XGkcX2wbPgqN5SxPbXMHNdekz6GLqY+PllfgB8JPCXpsxNU9YOrnv0+Yygd0a6JR4+UtFkwK6DCQyNkO1mK4kjB3+jK4A1wodp5n9ZZauJc28oiokvOZJxcJvcZHoVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOk5blE+JNnwCDzOdO4ZfzrJXrhgv/6kEPEaLPUhorw=;
 b=o36GD1+glM+rtm32x3N5gP7iN5qXQJq3Ea9LWn7SHsgizBKZdleaboLl7cN7hkxnDuN4dsdYRHuKJz1Dq+32Z3st4jLnUL3WGl6Bm74D8xN+wGmhh4/mR/qPmCCFrmDAASEFDHTw3PuQrLD6/kbHg1Pz05IpWWARwcyszJCFbUBLSC/6sYpREGoeWFEZiBIVl4kaf+Q+NDxPm5/eKyCAb6wEXYcomHKv73X5fXUYWSZOfW7dlCWkkJ4if3pUa1MAETbSzF9C/i/6HEsMfLiZS8rjU0ye4NuQLa8RD5Xb+vwpfsZFgNxhoad5/y15zqIItdr8ElVm4P7sYT3zpQyYbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOk5blE+JNnwCDzOdO4ZfzrJXrhgv/6kEPEaLPUhorw=;
 b=tn5H5vZanEm5z8lbi9YGWyWVWO4a4c7XMJiJ4tF935BJlk9VW2yk4i/lICEiSMaAa8z6D8WeycY2zqIq8s6CpFg6E5Uqxzi0cgTOV5HfdMO1p78xgQ3fWtKkDMPd2HG4zRrwcJQ1d2JykAc4CJwudLyh54q1pFkpxTbNgh09pTc=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Tue, 16 Jun
 2026 07:04:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Tue, 16 Jun 2026
 07:04:58 +0000
Message-ID: <86e401f4-911f-4515-adf0-3bedba2b3f7a@amd.com>
Date: Tue, 16 Jun 2026 09:04:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/4] udmabuf: emit one sg entry per pinned
 folio
To: Jakub Kicinski <kuba@kernel.org>, Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net,
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com,
 dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
References: <20260612-tcpdm-large-niovs-v3-0-a3b693e76fcb@meta.com>
 <20260612-tcpdm-large-niovs-v3-2-a3b693e76fcb@meta.com>
 <20260615145757.0b2ddcf3@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260615145757.0b2ddcf3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9P222CA0027.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:408:10c::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: c2fb8fd2-1265-4010-03e7-08decb759314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	JxtDSX807mxqnz4gbybDYZc8t3y+3yNT9tE9v0tsin0PFOlMVaJAiX0Q/iUqjXM66LuvR73Ygxr6MsOgUIOHnTXKD7osuJ1sjJT7+7wgQpCiwgzKatdpsFc2pq1b4vD/rrbJg5hfuBznCEWRHQd+Ls8FbJfAKuLFNd1pCRhn+w49vRare5pms1pfimrLcimMB3/Inj92G4ka7bYrpteVUidS5JoB7dfbTQesXNTe/U1xbOm7sICAfHx3QZaUTEVrB7yGOb2YvMQnQkWbK7CglRyCCahJ5Mf1NAiQG4a1wlIJZChkQ4Ah5+Mete2jHBQvr2OrqtrkQ/ZoXsb6S/k8cIZh6GeuQ3wVkt9XEfPov8OO/6FZ3KMjdY3DXb/Uo+WHcuqKT48ZYl95iAzrhBj+g409dwMf8TERGPeGmB5r0MmBPdseaQB8aUi+6iQ4jrqNasY2SXCCw6O6jAL3XrssQCrEZRiQJkLA0dhPANP2e+cNfuTbzyUNj5txx3iOAI6Uh/joI5f+LJx9xygI+TKmZuw0kQolg9pDQDDS6nB+DZQfslPBx8eyaZBJfOXQ0W9mYNCm0ilgYYNRq7Y+NlbI4+EuoiDYP9iZOH1PogqPaScfHoELzgXVuP/Ia0JVHGt2QT70yJAoUU41Ote3/PwsA3x3RdLYkcfz+HVKg750lX7zAfoBMZvsCdWko35laJtd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3cvc3Ntb1Y2eWlkd2ltakt0R3FhTTA1aG1UdUJHVkFMK28zaStYeEY4N1o2?=
 =?utf-8?B?dFJwazhBVml6RXFqQ091Sm1lL2cwakZoR2UwZjB3NDQ5bmhKU0hSTWg5T0cr?=
 =?utf-8?B?ZGxldXIwbGRSWmhVd1pORTgyOVpYQy9jR2ZwdkphRmY3dnZMSFNmOXA2YWFm?=
 =?utf-8?B?TkdGdUgxTWcxZVF0cDYwelZVV1U1NVZKWE9tZ01Ba2hMNDg4cExNTXJFVm9i?=
 =?utf-8?B?STJ0UG5rTzFoMDNWdVBhQ290UlJCTEhBbks2SzNyNHBQcGd0eDE2cm9UdTdP?=
 =?utf-8?B?cEptTW9YczRWZW42bTZEWHVpUUtaUFVaRFJHYkFUcEtXZWo4T2cvZGtyZTcv?=
 =?utf-8?B?aTNIVVB5U2RuK0ZGdlgyTVRMRGd3S3cxS3hKL0FuaVIxVURKeEJ6RjFiVGcr?=
 =?utf-8?B?N3p6NHE1Z2pSQ0RUUXJhb3BLYXVvQURCMHJ5MmtvR1Z3MW1wY0lQdFM1SlFk?=
 =?utf-8?B?bWZBZWhjTzdYeFVIM0JZMVdHYkUxeVRTTVdoeGp2YWJ3Yk9IaFNOQy9XS1d0?=
 =?utf-8?B?SGw4MnAvTGlKZ2xZT24zbG5NalpXMWVXTFE5aG1VSFREdHJLVXZXVHhiKy9l?=
 =?utf-8?B?cTJ4NG8rbGVLcVdZaC9pWTlwWnVidXU2a3VEeGxjSEpMejg2K0FHSW9oSkxV?=
 =?utf-8?B?RzcvT2UxL1U3MktFQTRMZmVFd3RPRTBFKzhSTDJqelJGNTV4QjRYb283dFNt?=
 =?utf-8?B?aUQ1cWovQ0Z1SitFM0dWQzlidS9CLzBlNUN6R3M5SXFCWkNGVHlmdHhmazZI?=
 =?utf-8?B?aVdISjQxN0ZZVnZUMGxyeVJiQWFMbFBCeDYrRENkeVZJdnhGaVFITko2NWRw?=
 =?utf-8?B?Y2lGcG9jaUNJc0MrN0dadGVXM2gwUWtMRXRqMW8rL09UekpYNDgvVk5yVERU?=
 =?utf-8?B?cEplN0dIS3V5QWpwTUV4VFozNFlodC9Md2h0eThBaUdQYlFtNzN0Y3o3SFBI?=
 =?utf-8?B?ZDA0dHZmMnJ5ZHhKUmo5Q0VHdFBweXhJVmRNY0tCRkp3NzZuTlE4L0x2bWJD?=
 =?utf-8?B?ODIyUnNoTjNzY2t0SzhZaThTbmR6cnJuVG51RGtlQjNoZlFxTGNwdmZ0akVG?=
 =?utf-8?B?SThKOWFyZFhHWW41QmU0WmFQbFBXbzI3a2s2MUwrSm5GVkFoejVDOUxDYkZk?=
 =?utf-8?B?N0NuUDVRdGRPSVEwMkVaRm9kMUlWUy95ayszNEQ5NDRBSEdFNi8rR2xyYWpy?=
 =?utf-8?B?Vmt2Tlg3bzVRc1dHaDRjRDlKMmxhNkZsaitxZmRZRCtySkdLczRDKy9lT0Y4?=
 =?utf-8?B?aGh1QmMzdEpCR2gyV292UW5nWEJUdE13T1pBL1BWd1BuK1M2YXZJbDFPd00z?=
 =?utf-8?B?bXMwMVJ6QUdLNXJTaXFCKzZ2SGRUTmp6bFk0cFNhOU5VaFJpZEUvZlFWdTQ2?=
 =?utf-8?B?a1R2TnpNY3hNZTBEWnJZck5TVmdkVWFpWi9NQm02VFR6eitIWW44anJ1NVl4?=
 =?utf-8?B?TTZEYWhZTWM3UFZveWttNTFGY2pNRGpKS1RYUm4wS0NuOUVxeUxmSVkwaTFF?=
 =?utf-8?B?bU54bEdNZVkvd0M1VDFSaHdmYmgzSjk3Qmh4UDZMY1A2bmJwSGZUa0JkaW84?=
 =?utf-8?B?Z0dwck9Ya3pjWHVLUERmNzFWc250NFF0TTJlMU1KS3VGMDJsSTVXZFBFRTNs?=
 =?utf-8?B?SGlNbnpBREkyWFNOdzB0bzRadndJanBRL1cxamltNEVYdkpxMkNGWUc2bU9Y?=
 =?utf-8?B?YlBVbmJ3SHMxSzlMMnFtU1FMN09BZi9VRUdubWMzV2drVlJackI5V2FqQkh1?=
 =?utf-8?B?MTg3Y1RMMzQxOVlGM01SYTY2dWNhYzk1eGhzUlgyd0hpUkVkajJ0T05iWklN?=
 =?utf-8?B?cGJLVjJremR1M2RxOVZhT05zSFhFVEY4cjdPMkdNT3ZHdEU3ZnJGdVZaZE0x?=
 =?utf-8?B?UnREcEJLbmZCamhnWUJKbWs4V1pRd0ZPcVZPMDZ6cnR4ZlNJZTFRZ0VlWExt?=
 =?utf-8?B?ZWVQSHA1WTdtRGZhWWZLL0duTDV4WnB2SHFNWEtmSHlMWTAxZFZsLy9oUjJK?=
 =?utf-8?B?TU43RGJhVkZQM1pMNmxkUk1NbWtYbTQ0dm9oNjIxSUpmT2E5UzZIN2dZSTZj?=
 =?utf-8?B?U2JUOG5jOExIZEp6ZUtheEcxUytPRzhoNjdlZDZSZ29LbEsrSlQ3Qi9CWHlz?=
 =?utf-8?B?dkU5V3VnNzZnRDBtYzJscVpNR2pMdWZTcU9rbEVuYlc1TkhKekYxZVhnTjg0?=
 =?utf-8?B?Z1UweUZtODZ3THlJWVBUR2RSKzVUZ3dCbGsxSXRCV3lWZUtqUk9abldJZVFl?=
 =?utf-8?B?YVYzMHE5UlJSekowWi9QV3dOTjRHR083TFdjTlpyOG1NVjRzYW9LL2hJbmdw?=
 =?utf-8?Q?bCs8kQK0b4fXvQVzSl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fb8fd2-1265-4010-03e7-08decb759314
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 07:04:57.4096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ur2tQbZofG4fcJi3cFnfAKISzmd2k9X2Ml3yTJsRaNrmujqtHSndGaW3CmyjlKf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64960-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:bobbyeshleman@gmail.com,m:donald.hunter@gmail.com,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,redhat.com,kernel.org,lunn.ch,intel.com,linaro.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,fomichev.me,blackwall.org,iogearbox.net,davidwei.uk,meta.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2985268CB40

On 6/15/26 23:57, Jakub Kicinski wrote:
> On Fri, 12 Jun 2026 09:25:58 -0700 Bobby Eshleman wrote:
>> dma_map_sgtable() does not always merge contiguous pages for us, so we
>> do this internally before exporting.
>>
>> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>> ---
>>  drivers/dma-buf/udmabuf.c 
> 
> This will need at the very least an ack from DMABUF maintainers,
> so it's a bit late to consider it for 7.2

Sorry for not replying earlier. I already nailed Bobby with questions on the why and what from the DMA-buf side and while I don't have time to in deep review the code the high level rational looks sane to me.

Feel free to add Acked-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

