Return-Path: <linux-media+bounces-64270-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JD30GjvLJ2pR2QIAu9opvQ
	(envelope-from <linux-media+bounces-64270-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 10:13:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7AF65DA04
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 10:13:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=LQvfWv1c;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64270-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64270-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86EBF3084321
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 08:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C26B3E834C;
	Tue,  9 Jun 2026 08:02:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010014.outbound.protection.outlook.com [52.101.61.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3C02D7DC6;
	Tue,  9 Jun 2026 08:02:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992141; cv=fail; b=hwUiTf1swBoKqmhKLTlQXytO0stVvvcNXxtuRAQ/T6lWfQ8qZ5srsiF90Qj3/R+9ABA5UWrdRtFWS3OEq1VbPZbQeXvGiExNvKWKiTOyIncNBSF3R8lCxkudU4VnqvU2VpuN3qfFL3A7r6uOe1DuMFROtjs2IUJuBPpx7PqlQis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992141; c=relaxed/simple;
	bh=9IjS7pCJIKHPb789HXTSNadmcyTPkfp6A2fNVCIodcE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q7pGTB4SVEEmVU24XkA1qeY+Tpob+7oVztlcS0v/mvp8OvLjeaKUOuA8oK8kPYpSnLLucwosP0TaMIspg30MIz/YjaBvAUbQFz0eqsyB3i6zyzbeszS5CcVKTSoCVjbZmL85DqXj6It25jCfoJnm/EnKDStfBiy6ep57XHhefQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LQvfWv1c; arc=fail smtp.client-ip=52.101.61.14
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3JPxv3nMQXYktM1snfdeCBWrWKo87nCIOEurTEP0/IxTsm+QnI5aN48pRlnt07YdR2CEfdCteg9tcMLuyXtKy4Kg0MIwVhcA1GhRJj7MiK8jXPCWDTQpzvxvQskYs/MV96dmogkWe80Gm4rAk5n/Y2UpJCJrnEUnDY/jpBt0Q+wViqzC8DCCnSQvXi+EboiYd/KebrVEG0OuV+Yq6SveQAd911eUqcoLxNWLZYpAvq8r8TXU3Y7bAInbR9n8OtPCk8B1rQLbUHpz4G3nGjpBlOw1AnybsezPF/L+gM9P6KIJLmODpxiuZFlkYXmr6US3bnNgpuYiMWZIgUBk9eUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kl4tOugl1V+R+AftUUu3gM7FuPDyJdhGVFS9+9Q7BO4=;
 b=kZLevhbE/G4BblEbVSo0I+frEEWHpqjQKQ+rGkDxcGaj0aLWlYAobxY1kbup7pwlTO6Al3VGO6f7wR3WVVbW1XLRCccHMkfM4BvhThnC5+/9ql5qYRC9dOKqA1NCgnZ6qEmGbgclnjFv8o7hTzL1qtEzjvFwNjesdcRBglOTZ2ulO1oHCe5gbMWC6QzQf1pZG228TPazyqfJ1cIzvmNnRkjAsNNOLS4mPWoPIzwOceOW0x1Gm6A/zRWJJ07m0ySXodjLKUdmRtovXlz53itr73EX4xYyXJOAyd6gIcRXXwB0oGxksDuHcT55e7eOeArlmvbZCH+kCt2zsjKDEQFv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kl4tOugl1V+R+AftUUu3gM7FuPDyJdhGVFS9+9Q7BO4=;
 b=LQvfWv1cEus0TDzkWFVkUYB7hjMQjee6B06cellGT8L+qwYKmynG2iXrxyKSgKteNvzhCSjsMBbUL+8e1dKzdc+l+DAtZHDsO03cJXfvUIuXj6LFRRKswpO0K7JOrbqb8vi0Q0Ekk5MJf94FmFP0+iY6bv7qkmD00C2kxiynagE=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8539.namprd12.prod.outlook.com (2603:10b6:208:446::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 08:02:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 08:02:15 +0000
Message-ID: <850fd675-714e-4e3c-895a-d1dafaeb8219@amd.com>
Date: Tue, 9 Jun 2026 10:02:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <dwlsalmeida@gmail.com>, Gary Guo <gary@garyguo.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260608142436.265820-2-phasta@kernel.org>
 <20260608170112.24fd92df@fedora-2.home>
 <6bdbdb6541392c6ea58e0035f0b20ac3c8f3e54e.camel@mailbox.org>
 <DJ3RRRX6JY4M.LCRKJ074W9DQ@kernel.org>
 <256dc5ae3529e2548c4151af34a540476ac928c1.camel@mailbox.org>
 <20260608181630.20145d1c@fedora-2.home>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260608181630.20145d1c@fedora-2.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: 30401c63-5864-40f3-32ed-08dec5fd6b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	xukndNzwn7imoZNwBirH62Wiww0pPuJy7SiLndPhiXrf6IWhniqepMzw3NrrVbdF2dSAdiX2QNbaJPakaXuFn1wYzZNvQKDY8bHRdttPZjg94smgsFCcmmw94HWW6Th5QgnBTmWQswv1zWpPytUgOayEhdpS2PJVyy45Whb+RVXOz6Zjv0PnFzUZ6OUgd7zke8S2JR96Dm3m+qTr872Ovb2n+TjVlZNk2CjwwwlaaiIuHQp/e2wfewY88AM27wpl9wQzlOJpiKLr9d4D0um+5wMgf/hpdHivJBHjUv5RGOiB5EtYl4XgVbT0UQphUhPrdyPATJ1bj1M6qJYQSNIKKRe0tRC6M9rtgfnkALSOrYAXfHGd22B2T8lJEfUrm+OQqZlKvrWKsRWS5sTUFCEjZSMG6BFs0kD/Jh76CjtOFWgJfVwwduH3IzzzuFyQXEE50piQOlfPbu53b3D6sNSpH8JKCF3n/LRzsSyNwFkt+ASuPXMZo7BXiW74rslzKacjV7ORRv89DWh2lSTouS6zSqpmNX1IkfWd2OZxq1rEARpmCnQYRMxnDHgghDtdW7eHs4hFsGJrZDiTxZv3S+3cSEz022JkIv5qTCyZmAwlE+2bTxjZhpyi4l/9RfKPv65E0dHp7d5yBT6Yn6x3ts6S1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm1QUyttRCsrcS8xSU5SMGtrTy9lelJRb0tXOTcvcm14a0MvN2hPZGlwcXpP?=
 =?utf-8?B?MDY5TXVmV1hMUXFIRlhQRHRIUG50aWJnZk1nSmNTbERwZnhIbWhLSXQ0VFhC?=
 =?utf-8?B?Q1J2TGNRLzc4QjMvSHZla0pJbTg3L0RCa3EvZUhhVUhzSmNYbW5ORFczaFFT?=
 =?utf-8?B?OTRtRWFZSm1iYWlxeVpEVkRURmdxSVJqdGIwTTlaNUhBMEg5OGFkbkJWZHlZ?=
 =?utf-8?B?V2hxWjA1MC9odDVKK28yTzZsUitIS2RONkRUZTExNXN5TVV5NkFYOG0yYTgw?=
 =?utf-8?B?QTdrSXEra2d0OVF2ZUVTUW52Qm5TN2ZqV1VLSTF0RXlETXFzSmpvOUN4dXU2?=
 =?utf-8?B?amlvaEw2d3BLenBLRUY0Y2crR2U4WXZLaVk2R2VrWUlGVmRqbDQ0emYwK1hW?=
 =?utf-8?B?YW15dUFwNnVsbFcvUFphZTAwblhVRkhZaHdad2lPZXJvbTA2Z2JVL0FRR2k5?=
 =?utf-8?B?ZG5nODBsVFFpclM0QlplTGd2WTR5OWpBYUFFeGc5N0NDeHhZdklrUDR5YmFS?=
 =?utf-8?B?bW5hR3pHOVZRNXA3U0xOa0VuM1pKNmNzRHlINTQ4VjNTREFZMi9oY2xNa3Iw?=
 =?utf-8?B?ZXNCaU5Eb3lxR3IzeURXb0htR0s4dnVHU3dFUnFCMFNwYXR1K3VTTHJFVGll?=
 =?utf-8?B?MVp5SEdzUFB6cGJQZjF2R3ZHYWVFWGNVQ0tVWWxNMUpqRFc0S1QxMWVIczdW?=
 =?utf-8?B?NFM4YUxCQzhKaS9FeWt3c2t5UWFlaDl1MXpWQTgrY0U4b3FGWnFicmNxVU9I?=
 =?utf-8?B?enF4WnFxNHEwSGNkY09aRU44Tm1uV2dLTUwvdDJlVnBtYm5CZGM2N2VFS3A1?=
 =?utf-8?B?cUk4aEtqemxpZVdlbGN4LzhnOTg0Z0RsbWNGTHNzNDZLMnpUczBza0UxRTZZ?=
 =?utf-8?B?aE85OVRtWHEyeE1TYmx0aElGRDdiVjVUbVBRWlcwT0lxQ1o2YXBCM2FqWWxV?=
 =?utf-8?B?bHZUNDdudXM3UHlieWlGTi9VUk5nalUwNXIxV0Nyd2FZTVhzZUYwanZRaDha?=
 =?utf-8?B?VmRxWXBiTDFlNDhTamw4Z0xvbEY2Y2t4YzdCenduU2grT01nSWV0MEtPZ09r?=
 =?utf-8?B?K3FYcVFhZ05GTmxDekR6OEJqVXhjY3NzMFJXQlpQb0FlWWFBMHdTUDJxYmlm?=
 =?utf-8?B?cHZQSXhkUEQxa3JQWGJ2OXo5WE5XMlRRcGRPa3FBV1J3M0E0d09vY0Y0SVVh?=
 =?utf-8?B?TEVWYVVZd1NCeE5sUjc5L0trNVdscmdmcm9XTEg0Y1FsTXRSbHJmNm1pMDFE?=
 =?utf-8?B?NFdScDdxVXJ2VzJPNFowUGFzdkFRK0U4bkJ6SWpjUEV5ViswTC9iQ1gvdzE4?=
 =?utf-8?B?WWp5NjFZVTVKbHMwNExmd2phTjEzRmpmUVJxeEhrallZY1R6cldvUUdUSnls?=
 =?utf-8?B?ZXNhbUlMcjdLUXV6ZDV3NytxUFJJRS9PUm1wem9YUTNPNUFCWmxxYmJzS1Y5?=
 =?utf-8?B?Qytvd2ZSNUw4dFBOeFdBcXNEbVhNSEQxdGtGNzFZaEtKVHk2TXdJaEUvOGcw?=
 =?utf-8?B?dGhwcTlFaFByNlFHeFM2NnZVZ0dSeVBzMkI1VFlaVmIrRjNIVTIvUXRZNGF1?=
 =?utf-8?B?YjdweWtjc21tT0lBR1pwV1dPU2VOeXZjM1VIM2YwOE4vWjE3U1dCZjg2a1Ev?=
 =?utf-8?B?NFQ4YVNNb1REaXoxYmw1SlI4V1h4N2RvVG9DN2UwWXRCWVVDTElvaHJKeW96?=
 =?utf-8?B?ZWNRTUF0d1FQSXdxYk5qUFN5LzhnQ3RaMXM2TVdwdk8xL3VUb09ZY0NDSnVl?=
 =?utf-8?B?dEhhSmFoV3B2U2xTb002YVArY2lHc2MwSE5nNEFBNUhwS2IxKzF4V3VqR25W?=
 =?utf-8?B?djV1QWdxblp4VDJmL2hjQjg4eG5LVTAzd0pGQWFDVTVOVm0zRTRGMXB5NVFT?=
 =?utf-8?B?UlgzVXdVdjkzYkpIcUs3Y1h0Y1BlYU5pVFM0d21lOUFFc1drbG9HRzhGaE1H?=
 =?utf-8?B?MVNjTitrdWVROTdhbks1SnU0Q1Qxdm56UTJKWnYzWDI2SG14cUhySlRNU0tl?=
 =?utf-8?B?TDd5Sy9CYWw4dXh2azZSa252bmZySGFqb0N1MzlpK2FzZThyekR3ZS9yc3BS?=
 =?utf-8?B?YmZzNlZ6UGdOQmtqUXJrb0ZZODZGWEpROC9zWUxsbUI2YnA5eXBXdDExVkxU?=
 =?utf-8?B?aGg1TnpRMFZOK0V4c0lRUHdnNzJaK21qYXV0ZVczbDhiRitYYTFrWnhUQUxH?=
 =?utf-8?B?Y0ZFOUxWTUN4YVFSK2xESTBYQjRrRmRoZklQMHAzK3hBajJ5RTNjcnpaR09Y?=
 =?utf-8?B?SGM5RDBiKzdtUVcwSVViR0RZdzRwTXYyUVViYXYzVDlaUDA3ZXNYZE5MRU1i?=
 =?utf-8?Q?Dj7z6+xjUpRBUlOKeW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30401c63-5864-40f3-32ed-08dec5fd6b4d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:02:15.2932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PacNo0bndq7z8gFsMLzEmioDjJSME8Fw0pBW+oeZiRmRxqiLGiODBItDwzNE2yh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8539
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64270-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F7AF65DA04

On 6/8/26 18:16, Boris Brezillon wrote:
> On Mon, 08 Jun 2026 17:30:58 +0200
> Philipp Stanner <phasta@mailbox.org> wrote:
> 
>> On Mon, 2026-06-08 at 17:23 +0200, Danilo Krummrich wrote:
>>> On Mon Jun 8, 2026 at 5:17 PM CEST, Philipp Stanner wrote:  
>>>> On Mon, 2026-06-08 at 17:01 +0200, Boris Brezillon wrote:  
>>>>> On Mon,  8 Jun 2026 16:24:37 +0200
>>>>> Philipp Stanner <phasta@kernel.org> wrote:
>>>>>   
>>>>>> @@ -1020,11 +1024,20 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>>>>>>  void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>>>>>  {
>>>>>>  	const struct dma_fence_ops *ops;
>>>>>> +	unsigned long flags;
>>>>>>  
>>>>>>  	rcu_read_lock();
>>>>>>  	ops = rcu_dereference(fence->ops);
>>>>>> -	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
>>>>>> +	if (!ops || !ops->set_deadline) {
>>>>>> +		rcu_read_unlock();
>>>>>> +		return;
>>>>>> +	}
>>>>>> +
>>>>>> +	dma_fence_lock_irqsave(fence, flags);
>>>>>> +	if (!dma_fence_is_signaled_locked(fence))
>>>>>>  		ops->set_deadline(fence, deadline);  
>>>>>
>>>>> You can't take the fence lock around ->set_deadline(), otherwise you'll
>>>>> deadlock here [1] or here [2].
>>>>>   
>>>>>> +
>>>>>> +	dma_fence_unlock_irqrestore(fence, flags);
>>>>>>  	rcu_read_unlock();
>>>>>>  }  
>>>>>
>>>>>
>>>>> [1]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/dma-buf/sw_sync.c#L182
>>>>> [2]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/gpu/drm/msm/msm_fence.c#L139  
>>
>> Oh, MSM actually doesn't btw, that's a false positive. That's a
>> distinct spinlock on their fence context object.
> 
> It's not, it's the same lock they attach to all their fences coming
> from this context. It's just that this lock appears to be per-context,
> like is the case for basically every driver, since the inline lock was
> introduced only in this release cycle.
> 
> Anyway, this is all stuff we can fix if people think it's okay to
> protect dma_fence_ops calls with the fence lock. But my point remains:
> each op has its own locking-rules, some are called with the fence lock
> held (enable_signaling(), signaled()), others are not (set_deadline(),
> get_xxx_name()), so we need to carefully audit each of those to make
> sure:
> 
> - calling with the lock held in the new places is not causing a
>   deadlock

Yeah, exactly that.

For example the set_deadline() is intentionally not called with the fence lock held because that won't work for some use cases.

The problem when you call ops with a lock held is always that this lock then becomes the outermost look held. In other words when you for example want to grab a power management lock to implement the deadline feature the framework enforces an order between the two locks which isn't desired.

Regards,
Christian.


> - the returned data, if not a scalar, is protected by the RCU read lock
> - any driver implementing ops that can be called without the lock held
>   need to hold on the device data for an RCU grace period
> 
> The last bullet is probably the one I'm the most worried about, because
> instead of a single rule that applies to all ops, we have various cases
> based on whether some ops are implemented or not, but that's already
> the case with deprecated ops like .release() or .wait(), so maybe
> that's okay with the proper doc.
> 
> If I were to choose, I'd probably go for a dedicated rwlock_t to
> protect dma_fence_ops, so we can:
> 
> - protect all dma_buf_ops::xx() consistently no matter the kind of op
> - protect returned data (get_xxx_name()) with this lock instead of the
>   RCU read lock
> 
> But the overhead of this extra lock might not be acceptable, dunno.
> 
>>
>>
>> But yes, before we could upstream this, we would go through all the
>> implementors like Danilo did, to find all the others.
> 
> There's the two I pointed out, plus the array/chain containers I
> mentioned, which are not problematic.


