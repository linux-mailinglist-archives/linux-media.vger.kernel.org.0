Return-Path: <linux-media+bounces-66821-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ev/8EHjETGqhpQEAu9opvQ
	(envelope-from <linux-media+bounces-66821-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 11:18:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93577719A2A
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 11:18:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=lgOYhPxP;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66821-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66821-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8264530F4047
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 09:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2123905E4;
	Tue,  7 Jul 2026 09:06:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010049.outbound.protection.outlook.com [52.101.61.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8FC38E8DB
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 09:06:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415211; cv=fail; b=kyiA6d+mLEyccmWhCXVsBxEgY3BPkDJaEzpPGSUR7J28yXWCWHktWuMj5E4MyY6jxJHc9XKMlxcPgAZ58tFW6zTMfH+IkpA7prQm+Yx3vw/1NsWcCa/r0u43Dc4QpwE00ajOjAbCi4k+idq+cZMHpGpmNwh7jXPdm3X9UedufBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415211; c=relaxed/simple;
	bh=ZtYiTEqxMhJFcQN7JryrT074taX10g8i+dFIjGREvTs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bOss1Yu2SoojcEE5ci5Hjouhe711TfkNsg7r6JGh2dsvEeVUqV/PsympSACS+sRPE1JhYbsjrnRLHuPzIxacONZaAQsrbL5f4kE1oWYB3HUS0UgGA2BV7uC13VfaJ/sAvw46KtOWXL7WRPJ2wB1LUI0dP+9VKmGQZhcp4moNBvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lgOYhPxP; arc=fail smtp.client-ip=52.101.61.49
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxZ4vg2e0RkXbUMzsQuvy0+uIMsh28AlVsTXTudXf+4E/3gvs8hOyzjhthe0kprjJ4dFOq0aFIqSWrUhiucVfphRoJVVKRSmt7KlNFI7wvn86ggibxJ6HKGQzWXEH0pml1oJeIOTV+fjgxFXkNTHea5lDa3pzWKkZN8lrIa0ROazADAo1J5ZZfKqy1j3nNBqnyBhnozcPc5BjT/16s/emKJYhQ3FF4wmxExJUbSVw/c+IuArYIehmuZhT0OwgVI8JJpieAjqOQ2M4z3Gm1xcFA/Gn+K4rnH7+rF117jODLcmJuCxceJBTvPerPpp0ixM7hEGdIefk5cplwa6z40GPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Xy6Gzryvi8zoBnUmvbtNx5jXU5V2sEi+R1eM9hZ9XM=;
 b=JGcAT+W+s/O3WYdN3pYSjZ6PsN7F9z1sMdBJnvbSc+fnL2dWPILjpSGyBjsONFG9WMw2Ei7LwHbAQfDdfGFlPViunZWEJpp577MfOO4arZ9v9KHvXQchOx90yUtUaYanTXIZ1H4g2XbBSOh94oUZJ8feTcpQi8Ueeppclq+AV67hsdj2RYeuVjpzNX/hVK8qWnUayYQMcaFc4PupgfDQ01qt1YrJILujhKLZ+pPCG+6f5kdL/VWV8EP9BYo2rHZHIw1t0CtuRTP/J5WMn83J3t3IQmW03JvD8kWHrn1CVvYpDXy6TjF5PrXhsFvAuiGqzoV2sanyxKxa8gUqNpmLEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Xy6Gzryvi8zoBnUmvbtNx5jXU5V2sEi+R1eM9hZ9XM=;
 b=lgOYhPxPku40mfIS9B4wJ7qjsHEmeydJ+HHT/EcTylZ0ti6yq8byAkq7PV4l0F+RypTARh5TFtGjIScuBpJskl2pWmcZK+N5xwxvWIVuZYxeCaq66Hq6KIlaoqhvEmEkpQJGfLN9J5FvSOgPSJYodJBtuzEWkMUTld9q7I4cmio=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 09:06:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 09:06:46 +0000
Message-ID: <1293fd6c-4af7-4025-9624-aa35a6b0d4a1@amd.com>
Date: Tue, 7 Jul 2026 11:06:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: explicitely forbid exposing pages from
 get_user_pages()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 lizhi.hou@amd.com, Max.Zhen@amd.com, Mario.Limonciello@amd.com,
 airlied@gmail.com, karol.wachowski@linux.intel.com,
 Simona Vetter <simona@ffwll.ch>
References: <20260630080112.1117341-1-christian.koenig@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260630080112.1117341-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4333:EE_
X-MS-Office365-Filtering-Correlation-Id: 1273d22b-a155-4721-76f1-08dedc07123e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|56012099006|18002099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	7A0gUtzDxaKkuSdTftZ40Eh2kq/wzSzTLo9v+8ZcgSErKLNS73tsvQE8Xrz8Mnal92bu29CgspbElJALNHTpyKTgKIkY5kiScH+cE4dkUz3YQNSa6k7d2IF8jjTGNMvabQ4nBg58TopfqPW+p0KZNSdhQJtgFHSdcyuT60yV2cooXiSaKPg3q5DX3SiN0Rcm78LFFyjqU6vQuEmHAukYJQdauTPsrZRvkNF9UmkZ0oywyUBso3qQ+cxGMjsiVqreHBzheHimWtJmHo9jytBmJIMRYDSoAUEr9N3dq7wRIFgJl7BnBSEqfRxfnBug444hQxyEw6Ub7te2DyCLTb0tS1CxNbxJtvezMHb0GsuYuHSs/oIvYU5o4nknpis8FdKBuuSw528Tkc2C1NZR663Leu8IoyB18ZUEiVkyBMS4V36wpdhnaXET6KRvPdIx6hbgV5wgk9uPXcJu4CNSOBg1Pe/hL3YL9xyiQzk3+Po5eKqVBmws7g2BuZ3bMQu/0Zfxeb6Kc+jLDafWfMlXMruHa6E5LWIXwVFjXktNil63Yk7ws0r7ihFWGF8FoRPxgzdQk4TnwnJ9qf0Xkl/11VVRjqSF9QXhSlF/ai3ACC5VdglXQ2lCXpL4r3wzTfiNz5XFOTlPRjqCwDEPh7x67dLT6HPPcPSoD6tFXiuCTfzepHj+GB+PXFsSlB/WW4n9wzn9T6PGs8kovLGHlcoyfduH6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(56012099006)(18002099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTBRbnFnbDNLNGZwT1BVSm5mdWxWNzhwSGx1ZUprSHBvajA4Nk1JUDF0c2xC?=
 =?utf-8?B?M3pyZTlBNUNXSElMMVM4SW1PdlJZSG8rdkJNMW1LVk9yRW1MQkVteXZNNk8x?=
 =?utf-8?B?OUZPMXBKdllXTHdxQ2pheHZhQzFISERTTWd6Y2ZQWGRtTHQ2TXpjQzhPenRT?=
 =?utf-8?B?SUFMaXlqQkhJeThZTlUrTXdaMXNXN2N6Y2VxZmlGcXlrRURQU00wMm9PbjVt?=
 =?utf-8?B?d29XK2V1T2srK2ZrcnFKV3pwR1lzME9WalJXcngzTHZyVkE0WlNJakM3b0Vo?=
 =?utf-8?B?ODUwVG41Ynh4UlI5UlJQYkJzbVRHRTRBcytodG9jRGY4a1djNk1XQmt4OGJ1?=
 =?utf-8?B?TzdWWWVZaGRhN24yYUt5OU9NMmhTZjVNd1RWYWxUd3ZFeHNKVnUzd1l2VjJq?=
 =?utf-8?B?bGM1dzNwR3hBNk5SMzVybnZ4Z21pcWpOVVJEZENKclg5ZGJOVWxlODgxWDBr?=
 =?utf-8?B?Y0RLTFlYWHYzL3lKODdqV2Q3UWZadFBjeUtxSW9GM2o0T0toQytxNExmWUVk?=
 =?utf-8?B?Wis3Z2lwYmEvNGJzK2pxRnhWaUcxU09tR1dxTHo2WkJHRC9jbXpEc25UT1ow?=
 =?utf-8?B?S0ZRbnJrTmQzaWh5QW1WZmJXVU4xdmZxMEdWTlh1cVBGd3YxUW1hQ0Y2MjJx?=
 =?utf-8?B?dUd3Yk5EU1lSMll4dVgrMStJZGNJbGhmdk45bW14a3FHY3dKUHlvTHZta1Zj?=
 =?utf-8?B?b2d0S0s0cHJZcWVuMVJrM1VHRWZVQmd4QUN0M1A3VzhNNHRqb2VETXFkeE1q?=
 =?utf-8?B?Ymw4Mk1YaTdIa1FPdTBBaERLZ2dQZTN4L0hFM0E5T0dpQWpTR2h0NnhESE1r?=
 =?utf-8?B?cSs1eUR1U29lc1FXaGIwdW1MM0VHNFNOZWV0Mzc2WTQzdGx2REswUDJDcDhG?=
 =?utf-8?B?cVh3aXBXQUQrWjVteHNoNkhnbllEeUVzZTR5T1VHRUFLUkU5R1BEdWlsdzYw?=
 =?utf-8?B?a24wUXJlMTNVL2RlU0E0RGhYQmttTkFBR0lJK2VWaXhqaGVieldWMUE1bjRa?=
 =?utf-8?B?eEpzQ0hWZmlndWloK0NXU2xJZFFhT3p4UUJ5NS9KbVFBa0FhOVArSGI0NDFR?=
 =?utf-8?B?SlgyaUljcklRT1FlWEJEcEk5OEp5UjNRbHljbUZEUWptNTZyNlJob2ZPVWRl?=
 =?utf-8?B?WGkrL1lNdHZLRlJLYVN1cmJsalVSSHNROFhoSlhsRFI1Rk9TUEUrRXJsMFhH?=
 =?utf-8?B?S3hzMVJHL3VzM0Y0NW5CWmZhQ0l2bU14cW10a3U3ZUhQRExlaXpBWFpXUlMr?=
 =?utf-8?B?dzJhaWVWbnZhemZUL1Q4dDNmT2NHK1FBcUNVRHlOVzY1MFZoaFBhOVd6c0w5?=
 =?utf-8?B?Rzl3NEliVFQwdDhCd1FramFiQ21YNUZLMCtmekhjUXF6b0RxblVHelVmaUNm?=
 =?utf-8?B?QTlEeWZMU3BiL3pqVjREczBnd0hUWTdCV3JwR0F6dStDQlgxaml1aERHTGlt?=
 =?utf-8?B?WVFKeDVzcWY1eVBxQmpzdjFhZU9zZXB0WGpncXk5UlV6enlKUlNHTTF1bnht?=
 =?utf-8?B?UmxNNGN5Nk9ETEdWNGZjNDl0d1QzQXV2U2RRTnVqbFc4Zjc2RE5ZQlpZdXFw?=
 =?utf-8?B?L1gwbE5aV0Q1M1FnSzQ4dnhwVFdSRjJjZjJ1amlYUUdFbWdSRDk2d3Q4RmZR?=
 =?utf-8?B?V3d4VXhsSFRvNDdlVVJTYWhVOTNncmxKcHd6TE1PS2xBRmFnQzBwOUdJWlFE?=
 =?utf-8?B?OW1kQS8vUlM1VXpDUWZmWmIvRi9XWWlid05Ed01BZTFjakZlOXV3TkFGaVIz?=
 =?utf-8?B?c2lhbytQcWtSRlJNVE5vZDN6RWxwazhUZk1VMjYwTndLZk9aUGNyUzA1YkNZ?=
 =?utf-8?B?dVJmNDhnaEc5bCtkcURmRjhnMytXV29oYnNJM1BYdWQyTGFqSFg4S0VIR3lm?=
 =?utf-8?B?ZkI4RTg3K3FPMENIWHhKNnZnRXBSUllwaGplZThLOTd5YW1SOFBRTlB1VHJv?=
 =?utf-8?B?eDhpZ3doMWdmWEZZbHJqTzluVVJqWmNxQVdCaHdVQ0pHUTVlbWJuOHRNbnJj?=
 =?utf-8?B?N01leDduWTA3UndoNzhQNHord3VYOU9uNlNWdzdFOUp5dVJOWmtxQUhNci9S?=
 =?utf-8?B?cnp1TjVyVmIxaEsvT1h5UHdDWG03a0ZoVithQlYzSEQvakdzSzlBY0xiZE1m?=
 =?utf-8?B?S0MyOFRWQ0pma29BMC91WUpkeDJubE91cWJCYnBhTWFCbTYwTG1xNFE5SVRV?=
 =?utf-8?B?ZHFMVnJwd1Zmd3JVOW84MkllQ2MxQ0VsWTE3NlVuTTN0cHp1djUzRGhJekpw?=
 =?utf-8?B?M0MxZ0h5NkRaN2xEM2xpUU4rMFZDNHdaT21ZZE9KczkyT3BqRXY4aVVIZmtv?=
 =?utf-8?Q?4HQhbKSTa4tbU8azRm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1273d22b-a155-4721-76f1-08dedc07123e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 09:06:46.5639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVy4ZoL6rkbU8qUDNKQZ7wzYFQbdlDS4lO8aPpWfJyyuv0JaWrDSPJSlvSnsTM4h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66821-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:lizhi.hou@amd.com,m:Max.Zhen@amd.com,m:Mario.Limonciello@amd.com,m:airlied@gmail.com,m:karol.wachowski@linux.intel.com,m:simona@ffwll.ch,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,amd.com,linux.intel.com,ffwll.ch];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93577719A2A

Gentle ping.

Apart from the spelling mistakes Sashiko already pointed out, any comments on that?

Regards,
Christian.

On 6/30/26 10:01, Christian König wrote:
> We recently had another incident where two drivers put pages they got from
> get_user_pages() into a DMA-buf and cause quite a number of problems.
> 
> Explicitely document that this is not something exporters can do.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-buf.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 71f37544a5c6..aa5af4f439c2 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -685,6 +685,14 @@ static struct file *dma_buf_getfile(size_t size, int flags)
>   *
>   * For the detailed semantics exporters are expected to implement see
>   * &dma_buf_ops.
> + *
> + * It is explicitely forbidden for exporters to expose buffers they don't "own"
> + * as DMA-buf. This includes pages acquired by get_user_pages() or other import
> + * mechanism. Not following this rule can create numerous security problems.
> + *
> + * It is also strongly discouraged to expose the same backing store through
> + * multiple DMA-bufs at the same time. This eventually creates aliasing and
> + * cache coherency problems which are extremely hard to debug and fix.
>   */
>  
>  /**


