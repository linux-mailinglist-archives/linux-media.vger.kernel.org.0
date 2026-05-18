Return-Path: <linux-media+bounces-61920-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePAcAufZCmoA8wQAu9opvQ
	(envelope-from <linux-media+bounces-61920-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:20:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2865698DE
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E7CE3027944
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C893E4C6B;
	Mon, 18 May 2026 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n2cu12bm"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010019.outbound.protection.outlook.com [52.101.46.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2637A30CDA2;
	Mon, 18 May 2026 09:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095825; cv=fail; b=lY2XolreG9hVSIgTuXwC76E4mbAsCV4n/4ZfBl9q4lIwqH2Zp36a4FDxKfequ6aLcnRVp6zV8E7ixFN+M/aG4hE4P3/BYQVah6qf+NEm499uuOAF9+XJKmySeJDCJ/ld4h5kcDXbsbwTLa78lD4CqQjx6La8/SLeiRP4fIV9tgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095825; c=relaxed/simple;
	bh=lJUbMLqvNa6Xog9ID9nbKBdnrv+nUwOd0KnSbysMI0M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GASZ1geCu4revLLerGlb1x3upbMhOVRXxNB4HSCEY0e/60koMi3PaTJeS4otLvPstmK/Dk+gsURRgZ/WoVQ9lDWAu/oCa7sgmtW2cUIl6heHkL3Tlnk3mmTYIy4LqpXnVD2DGEO9Hpv+XKZF6rSyKmFiWUWSUvX+sGZdqxzOmy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n2cu12bm; arc=fail smtp.client-ip=52.101.46.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huV/hQorE2M5rnl0MiXAKMKP0LMHWDD36h1puEvA20ixXbzV9Nk1En7DK3oWYIjzd8Q3bqj4i/DF4UcErcxtn42LnjridWxDLs4UOfQwBFXv9AkI00LoRoKicpKXawMEUWiVgLoLE1D/N7kvYtnBabOVwl0SVew0BeRknh1ZAd+4C2Nmoy9zdL+F05x98b1Ox41OW7vfG9OyDQuv8KjZBmDqPP/hRxEezzeIHCTh589vBNjeiwYnAid1g9kUuU19IVO4V7kh0dh4b2vPpcNd94AJvS2ev2okm+E5Nz7uvyrEMm41SAvW7Eurw9YkT5tThNe7ppYXT6+5FAFrHOyi0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mwNt+McfOPGrwrs7q6p+5GwN65tbNUfu4uqRqZCFxI=;
 b=McSAEKsKmZvmhTjgA4I9UJE6Nx+YVH7E8qdI3BS0ocEAgdJq1sUx6kj3il/03xYkgdc/oViJ9kxJRSBD770ql50nPrBU/6WAwI8ZysmPT1U+emChLkEfBHz644b+oWoFW98gno9bzMbCMax6EpcwmKlpjGAswgX9kr0Abn3c3nXOYeAVitE3TO01JRj4lP2YY+DnJavsrvhl42z4G79MF5a+Yyk+JwgZLHOufpjhLwNHe5B0haMQUtOe6UUlXMCYQB9jk4f1gNUgB2a5JpUn3fLvYsOed9QsJl0hZOQYIdRusdhCkSnWKtE3rF46LgAQ4WmPCZf5p+Ai1kWyoChPLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mwNt+McfOPGrwrs7q6p+5GwN65tbNUfu4uqRqZCFxI=;
 b=n2cu12bmQpLq6+SV8mtSeieQnGkycvn9bR2Kz7mnJt4JcYmaHYLyIRI+GpADtIh+9JsZCgmKPHBA8ZRX2NIhw2Xd+S4NT5wBGrXpz7wu6cksTGwgnEghPCItJ+xXQWBVYARGmZqiM8L9rGhhMBJP+seU+rQoO1lG/uzEdHv/dLs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8353.namprd12.prod.outlook.com (2603:10b6:610:12c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Mon, 18 May
 2026 09:17:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 09:17:01 +0000
Message-ID: <a872ef35-6d5b-41fd-9242-bb44902fb237@amd.com>
Date: Mon, 18 May 2026 11:16:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm: Define a conditional guard for
 drm_dev_{enter,exit}()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
 <20260513-panthor-guard-refactor-v1-3-f2d8c15a97ce@collabora.com>
 <CAPaKu7TULU6_-8eoygq0svBTbnX-vFvF3sH5hDzyi9kDP-9enQ@mail.gmail.com>
 <20260518102813.50555650@fedora>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260518102813.50555650@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: 750752e5-23c8-4d8d-895b-08deb4be37ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|4143699003|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tuMXEwIiV+wRpSgkgJA4CAvwY/aKKrx2oaiNKddvFml0xPLUzuWwhQCMu/vx7286UcgT40pdo3kPbCJeJGjUQZw1v8tGdToNPMMbwumPEPE7D0jI7Nr0DONG7NnWXO37joU1tW3b3WiNVAWWICRqkNIrSMNBdog49Ify3C4cw/u0sqBsET+7EVwkKN+JE0cZpX2mhPeerJakfcOLa/bLpfxJLPjC/DjZxHZjoU0TgzGRSdG3MNiYxdN3eTZr3HF+rmvZv88OLNLwASCLk/5lt7Yupa38Nvv9ziV/Jznzn7yNkedOlhyGQTZl2EHiuepUPy31tBDSvkM45rpifHmUJFY2U7DNX5+uFAsRw0tOslOWEbg165bEvrFxSbuU5og6wmFXYpZvDil0+ryI/0/9jKPr7HqCadVNNRj64dGUQQYtuc9+lcgab0tYYbdh2JFrlSBZtDHvNz7o0F+HZypWcUbiyL36GWCWDEmchGbhz2JN+gmWKSD/uXCe20W+GbWR0QN9amnPi/s16fun/wCXAIUtYy7uSpOUUcl8tN0ADQ4K8bH1VzpHO3ul7dMU8+TQKbDW1MjDDqg9oTuHBjyposEPHMfR0Lq/mews9OopNF8KCMwEei4wh+CM1133oAw+pD6Z22hQ48CDpdGlmDuF13jKe5SEzEk+j0cwkPqh6itHJRvjJYPqvsd8BMWnT4JK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(4143699003)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUY2TGYrbjNHNHoxcVpwUDVCamJhNjZ6cmlPWnRjYmRXK1pQc3BONVYwZkF0?=
 =?utf-8?B?VFNDZ0tybUNaUWtlTFFhaHczc05kZGg0MWQ1c1RRUkpFd2UwN0hMaWdkdjZp?=
 =?utf-8?B?RFY5SHpwQlFVd0N2aVZ3Y2ZxdGluNHBIUkU4cWEwVGpFeHB3b2lFTnZac0hF?=
 =?utf-8?B?ZlRKS0dHNm5XWGh6WDU3elg1cHdDRXlDRnp2WmwrM2pRVFZaZWlXeTN2UFJo?=
 =?utf-8?B?WXI2WUQ0VU5qMmxmZnQ0WG5MeVNBbXUwSXNwSUdTaVdVM0xEdVQzRDlMOFNs?=
 =?utf-8?B?YkxCTFhqdG50QytvbUdVOHBNNGZORS92MXMwVUR1SlB0TzM5bTNwcTgyOVps?=
 =?utf-8?B?M2lBekJMeW53S1lJNTVJM1FlS0tCZmhqZzhpUUswN0wvcVZDSk5UeGUwVEh4?=
 =?utf-8?B?M2JVUGxNT3lXcElDWEYyeTNhb2tqbUxncTdOcm5QM1hSSDhPa1NLRmlBUW00?=
 =?utf-8?B?RG96Nm9rWUY2aTM0TDBQWVltdEp1ZFJVSmczUU9XVlZkWjRpK2pRT2RuTUtj?=
 =?utf-8?B?Qm1zbCtxZnBQU2xTNzRwMmlPVUlvZ3dWemxnam01RzhtQ2pIdnNzUUR0YnJI?=
 =?utf-8?B?b3ZSSWdmbWQ4cno5cEhJUnRNdHNFWEE3TTltbU1EUGtMenFIT21Id0hTWXFh?=
 =?utf-8?B?V3E3NmRMMURJVnlHdkFOWW5XQ3pZTjh1Nng4QktKWmxBZUZmV1FPVm8rL2lt?=
 =?utf-8?B?UGVFRmE4bnNZSGM5by9ScnVCWmdnUXpmQUc5b3owSCtrU0orL3VUMVVaMkQy?=
 =?utf-8?B?QU5wOGJJME93UzcweHlUMTBkMnd2WW0rNXJjQ0E2b1UweTRVdHFJYXp0dzcv?=
 =?utf-8?B?RS9NWFJMU1NlY2VtTGt2Szd6Sk1CZGxsMWJpOW1haEU0QlQ2bTRoNUw1Zncx?=
 =?utf-8?B?TGpGdkc0NlRYQ0VMcEZSOWoyVUpYdGVlMTlRQmtxazQ5SEpPelM0WGhzcElK?=
 =?utf-8?B?aXRoOVBHOWFFVzE2bzFKcWhmc0t2TXFNeU1rcUNwZUVnMFVtMzNjdWZ3eGwz?=
 =?utf-8?B?Y3l3YVZLYUVuOXppNWZQbnR6RERISEtwZmE2S1FyU3lUdXA5R0E2c3NDSU1J?=
 =?utf-8?B?eEQ3cGVNR2pmQTl0TElBK0Nwc3NQN2hEb3NhY29XUU50aTVUdzlmS21aSEpQ?=
 =?utf-8?B?ZDhwU0UxcEJoQnp6b1k5VEFSaW9tU1FDTHBYQW9YQUUxdGl4UUlBQ2dKTnpj?=
 =?utf-8?B?UVF5NW9JdXM1ck9sbWU3RHFjL2lFL1V6UzZVQVpsbFpmN2dGcGpWMnB4bEtC?=
 =?utf-8?B?bFVWaXgzTE1PYzltTytrL1BRNkhRUTU3dVQ0ZjY5T2NUUUpjcG1odEIxUVBn?=
 =?utf-8?B?cWQwSDNpREs1TGlFK2lMWC9qTEVmcldDRTVsbDRXR3pyTG9GRGpPK1NFbnhw?=
 =?utf-8?B?aDYxVHRFTUovL1h2OU1iSDlqSnVINVBkanJyTmxqaGVQUDJRZVZNeUxBUzlQ?=
 =?utf-8?B?a0Vpa0dVYmtpR0xEWWs5aDlJaForQUJMelA2WHIwcjlJSjJqaXd6c3JtY041?=
 =?utf-8?B?V1pUNUxGeWVBYyttRHdjMWo3K0djclRqTzRZRkR1aXJ6TU50ZUtCY2VsOWNQ?=
 =?utf-8?B?WXpZNnJBaTFOb01nd28zU1B1QWlZeWtPV1hWd2lBNmswZG03K0plK1gzWWIv?=
 =?utf-8?B?bnFibHQvdFF3dWtQNFpEdTFwTEtRTTdpZy90K0p5N0RWZWxOMDZGWFF2TUtE?=
 =?utf-8?B?THNlNVdrMWJYa0VNWDBoTHZUYUJKeEZpTk16MVJwelB1dTQxMFRwa1RjWkh1?=
 =?utf-8?B?aDY4RDQ5NDN5N0p5UUxhRVRBYk5zc1VRZEVBZlFIdEVwR0ZtbWtDNkp0YXJK?=
 =?utf-8?B?d2RXditFajA4cG9mRnpNK1Bpc2ZEMW1RbXVPbnloL1BVZmRhYmRHNzNQVEx0?=
 =?utf-8?B?YTYxbmlyaGI4VFBaUENrUVRKSWszeFh4Um02SlREb3dtRk9JS0c0RWxHMmNJ?=
 =?utf-8?B?dHpHUE9yQlNBN3M1dE95VGR2NFVTclBQUExDUG5vQ2NlS2ZXK0p3WWFKZGRj?=
 =?utf-8?B?YnlONk5rMFVKSytLWEV3OCtDRktWOFhDajJLT3BmWjFCSVBKS1plZGJFOTRa?=
 =?utf-8?B?MXRveEQ4VGkwNXlpN0dKSy9HY1lJcnVIRG03Z2FIRjhKQXBuNDNsSC9UN0dl?=
 =?utf-8?B?NjVsZkM3RlAvcElndkZtb0hmN2RVVnJMNFByVmhLeWl0MVYxQjVXNHRPMEJG?=
 =?utf-8?B?eHhGTDA5TksyeVF4bloxQkh2ZkFZZ29XS1V2NEl5K25XQ0x2NVh2ZnB1UTVt?=
 =?utf-8?B?emwwQVhpM2NpKzNzMjJYMEZKbXBSbnR5OHVWNThVeVBab2t2dm50WXIreVkw?=
 =?utf-8?Q?Jz2YxiSsU8r1nWLdPv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750752e5-23c8-4d8d-895b-08deb4be37ea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 09:17:01.1274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfh9Nur/+DpxnmR1wZGgXjzAGrQtVHv1PLHFyItD0jQvkBVMCNs8yScjOtTfBbuP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8353
X-Rspamd-Queue-Id: 5B2865698DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61920-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action



On 5/18/26 10:28, Boris Brezillon wrote:
> On Thu, 14 May 2026 11:34:52 -0700
> Chia-I Wu <olvaffe@gmail.com> wrote:
> 
>> On Wed, May 13, 2026 at 10:24 AM Boris Brezillon
>> <boris.brezillon@collabora.com> wrote:
>>>
>>> Define a conditional drm_dev_access guard to automate the
>>> drm_dev_{enter,exit}() sequence.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>  include/drm/drm_drv.h | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>> index 42fc085f986d..79d1958f93e4 100644
>>> --- a/include/drm/drm_drv.h
>>> +++ b/include/drm/drm_drv.h
>>> @@ -490,6 +490,15 @@ void drm_dev_unplug(struct drm_device *dev);
>>>  int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
>>>                          struct drm_wedge_task_info *info);
>>>
>>> +/*
>>> + * Only the conditional drm_dev_access guard is valid. The drm_dev one is
>>> + * here so we can extend it with a conditional variant.
>>> + */
>>> +DEFINE_LOCK_GUARD_1(drm_dev, struct drm_device,
>>> +                   { WARN_ON("Use cond guards"); _T->idx = -1; },
>>> +                   drm_dev_exit(_T->idx), int idx);  
>> If this is ever mis-used, drm_dev_exit(-1) seems to cause OOB access.
>> Is BUG more appropriate than WARN_ON?
> 
> I actually had
> 
> 			if (_T->idx >= 0) drm_dev_exit(_T->idx),
> 
> at some point, and I ditched it thinking the WARN_ON_ONCE()
> in srcu_read_unlock() would cover for that. I can add it back, of
> course.
> 
> I'd be fine with a BUG_ON() too, but every time I tried to add one I've
> been encouraged to handle the unexpected case instead.
> 
> Ideally, we would have a DEFINE_LOCK_GUARD_COND() variant that, instead
> of expanding a non-conditional one, would define the whole thing so
> that the non-conditional variant is never exposed.

Would it be possible to use BUILD_BUG() here?

Otherwise I think we should somehow come up with just the conditional guard version since the guard one is clearly broken for SRCUs.

Regards,
Christian.

> 
>>
>>> +DEFINE_LOCK_GUARD_1_COND(drm_dev, _access, drm_dev_enter(_T->lock, &_T->idx));
>>> +
>>>  /**
>>>   * drm_dev_is_unplugged - is a DRM device unplugged
>>>   * @dev: DRM device
>>>
>>> --
>>> 2.54.0
>>>  
> 


