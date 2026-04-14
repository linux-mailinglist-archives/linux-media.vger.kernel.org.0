Return-Path: <linux-media+bounces-58759-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA41BHyI3mlXFgAAu9opvQ
	(envelope-from <linux-media+bounces-58759-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:33:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E9B3FDB56
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5133302F395
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 18:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2C52609EE;
	Tue, 14 Apr 2026 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xk9v+5Mx"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A101E511
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776191327; cv=fail; b=FSVzO7IOUiB0tHk4k29Zf7ASJgmgeRPAwVM/W0plqNBwDbEnbTSlEshPhNoNZ9U59z7NhBg2cZkOipsaEmsENhjn4iX44NmPvbVfxl220U6/snciikmvdjNqOT/VMKeysQLoClT9haVzWTwsy/RzSn65lDdai39GwStuhpAH7v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776191327; c=relaxed/simple;
	bh=nCL96tmESAPLz8dqsMfLQPaI0NQutK2GEbnEZYE7sVo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H+gj7uyGo6mNIKzXcLSafUvRZMctIjTXwebICy08GeEOIJuY9lMmD00eNh2FceIn5HFIptHVfNMlUeLzAXNSeiqF+4wej00loFqSP40z22vZPRV8EhfyZd6GOJ/6HmEXoGPoH60xj7lmr3ixHQQjMk/xPy0vbe8Zdav2wmR7JF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xk9v+5Mx; arc=fail smtp.client-ip=52.101.53.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfmwL6Kr5PchQYGzVybTEAXWfOLQS9Z9gvo5g6k3oqVkR35L52JkGmcb8uPyof47lw9eIJRbDt09cyVSGnpIj5mfHU4oGni6El59Jw1WqvzICJbBTQgvVwB75eMCGfrBesK1hRF/x80WvmvElrd/YMkG4A2Noz6kWLL6aYs1a0+JtTTW4TkttucGqvJUD2inixXROplINZg8rwPQUUMfgVtlg/LUyj++E9U422QPLrCLOjGQJt13mIrowwwmQLVUIgkF3CoIYJSuvTJn+mmO8ry0eBuQhH9yLYyF/0gSiKnd5eQL0Rg03gsjUg9ty3GI2WNTnn/3la5dQN7K3l6fNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZngdMYvep3SPdvk+4sd/zGUN/yOyZcYAGnxNE9jcYk=;
 b=foz6m3CMohPf6VBGiKbsB8tM9gR7GYarY2U+yeBYuccBn9z4BX7cUJHAgBV1U7XsOfnabYww1hJNd/GPYkADAE85Fgeu6bs9+7lMp4EJ/pj06L4ZoCg8FHwex81jO5ctq9MxZ8ihSD5suyRRZREEpW713YBvewtiV8Py9Kd/JtfwKW77L/fwAr3xqWsfqVjU0vIMkK4T/8G416c4fDsh0OPAf4v187SL6ThaHRJ3rAtyFqqdAO8KDULo+hP9oUJIO70ctBGCawEDBuAnbJotybDn/4BU5OLRdFt7ZrTC/faUeSH83CYpXbqpr9L2im90G2SPQafmB6B6HTkFGSAAaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZngdMYvep3SPdvk+4sd/zGUN/yOyZcYAGnxNE9jcYk=;
 b=xk9v+5MxMwwsPyjH7BU8bVaPsD0fuABHSY9avXvBbrXwZXt201HcTA9SssZ95r8MzLlpuZ75y9c+Kk0p2z3YNuTZUYC/8EvARh5y+1+Ss5kHx1jmeWqUCu9KoTpyyC2fe2pFvbuE80BdTA/HDEB7RR0a0phaL+/PA7KFy+9BNOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6195.namprd12.prod.outlook.com (2603:10b6:a03:457::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Tue, 14 Apr
 2026 18:28:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 18:28:42 +0000
Message-ID: <1f9b6a4e-2494-488d-824c-bfac240ddd9f@amd.com>
Date: Tue, 14 Apr 2026 20:28:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-fence: Silence sparse warning in
 dma_fence_describe
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260414154928.32934-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260414154928.32934-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:208:2be::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc264db-a248-4a82-b3af-08de9a53a80c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Afv1Nvt9Nj8OOVKhyKTkSKmvAexnbX6rTo3IqOrHn+2yEStaY8fdk8xMqvOYaILt3mSgsjaPeqZGGrOlIqoEzUqD+FvFHwRI2NheMK5YPe1LT9lhznIKdGGQOXgooYDcJUfY2THo2IzpK4bWt5F5lAYN886yxbLxZPwzSa8ZeoxK+LrHI4Ad7PkX6x8V+/BiKra8iGwB7zZxYe0b3b8fXzqstzWG6JeBJPtaf8B9jrGVWL+HG4o0u45EfcX6e1tjP1jEO+DLS9BPNs+OSmtmFqSQy3bMMuYH4g4tP+yRLr4NmyMMAuvrqrHNBQAwqCwm4z2F4ebS+a/AOrBdhZp2durciLeCyF2xWAbDvRJeo346qqBFX1mwSMLN2NhMVgBpuGtJ/oQMX7wNb/pjn42FYQVzkwLY1gZ45UOCHZVrXLoE/a3lXh+BPIAtAyuYkWv2dsMifPuYwwd7PAbNJ4GtXcyXOTj1mhHbrNgtZcT1c34PXZAsf8YzNI6r5dZMAuLHmaRK9vR+WRP32zQMi52oFQGrOcVKm/fRqayNe/bUOL5SX4vRYojqwpJx8yFXnScvlEaFATPLUmypCiUIogZrfYz9O5lkNnQeJkYI0FZii4yg4KCXFnrdHIBmNWRUkxswHSpqJTQF7pUIKaaa16QPd7WPvmrD93iO/lQIVCsf6oQvcz50Cg5O2daPM2bq7Pi9nL6iFbMGVwOTuhz7Y80ETbP49uLlNLYQOirMDv1p+Ng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cyt2SUp3UXFZTDNnbDVmTEJzYnZkajVaV2phMWhhdHBHK1BRQlljbFJiRDEy?=
 =?utf-8?B?SjRTWVBEblQvdEVHWHJuSzNFUzlvdUlEOUszdWNnR1g2LzdZaWZsTzloWDRH?=
 =?utf-8?B?VHBkNXBralByeEZKaEZYTm5TQ2VaeEF4eHZUczBlejdTNFp3K3pWSldxTmVq?=
 =?utf-8?B?TElmQ0VxcEVvakZhdHN1RG91Z2x2WkdRVUU2RUZRaUJHZ2NndEw2Q3l1SmM1?=
 =?utf-8?B?YVh3TGlTVE9LRXIxSmZLekxRbld6eXVucG9vNzlyaStWRHFUb0NzWHR0Tmla?=
 =?utf-8?B?M0FqTnhFZ3ROQnR1UTh5Qm8yVXc4Um90SE5HK29ENG9XV0FZdlV2UlpQV0RB?=
 =?utf-8?B?ZDhuV1RuSHJMTHlxVmQxYkgwVVdFOXZ0SHIwZGVwYzRLMjBpZlllamdzTUV6?=
 =?utf-8?B?L3IyMXdscVJLQTVYR1lVeFB1SUFKUlZLZWtFTG8ra1BEY3ZCeml6V2cvcm5N?=
 =?utf-8?B?UUNXQ2ZvYW4xaXk2T1dLbVRUSEhUMmNycno4ZitwRGVFMy9EZ2xJQk1QSFhJ?=
 =?utf-8?B?azFYVmxnVytybW5PTW1lZFpYVnBDYVFzWko3RFc2ZnEyZDR3YUs5emJaL0t3?=
 =?utf-8?B?R0hCakp5cGZXcElEeUFnMWwwdjFQbkFkaG5iSmpRREh2Vm02eXJISWZhTU5v?=
 =?utf-8?B?Mk5Cb0hFaGR6bkloTnJUQWlycTBwRzJXVHRta2FNNXU0SVpvK3VTZEpZN2tp?=
 =?utf-8?B?YjhRdDNMWXg0ZE41TS9IbTNZcnV0QU9wTDY1Z1o5ZncxbWtzdDNIYzRJK24x?=
 =?utf-8?B?dCszc3ZTZklIdmcxdmVNajREU1pzYnBVQ29hZTl2YWF2QVlBQ002VkFYMVJP?=
 =?utf-8?B?YU12YzBMVFF2dDcyT05jQm9GMHdwY3h5QUFuQzBsQjFhNUpuWmpyMjRERHVS?=
 =?utf-8?B?MnNKOTlsbDV1MW9pVW5welY3bnlEaFcvYVlDbGEzT2RrSXc3UW03NkVzTGlM?=
 =?utf-8?B?VlpXOWIxZ3BKaFpjWmlEVS94NXQ0WTh0emNDdnBGaGtUdHBwREhCYUZiUjVJ?=
 =?utf-8?B?ZFhXTVZSTUd6T0Z4eWkwQnM1YXpEODhqckc1Q3M4cnlQaU5rZFBwTGlTd3ly?=
 =?utf-8?B?RnBtcTJvajZhU0srUGV5RFFHaDMvVWMwRjZNeE9OR21DOWpWb3o3SXpJSmtN?=
 =?utf-8?B?R0ZrMncxN2Y5cTRPVWRhWEFONWwzaVloNmdlSU91aGdvck13ZmgvNnAxRDF4?=
 =?utf-8?B?VDRGMGxZRldqcS8zR2R6TmxMTkw5V1hDTUlvVmNveGpOZ2pUSk40K3dobkpP?=
 =?utf-8?B?bFpvZXZFVnF1VEpYc0JxSmRMVXhaWjFOTWVLamRjV1Q5cmgxaUgrK2ZpVklQ?=
 =?utf-8?B?eFVpOHhGa0VDZW1xMTFla3VLbmNpbVVIank1RytveVBoeHJ4QTNWWWZqemJY?=
 =?utf-8?B?TlhGVEFJSXpqL2NyREgvVkwwUERxYTVLUUlRY3h0NWdmNTBmZjdHenJMMWJs?=
 =?utf-8?B?UWU1dk1jLzd2R25DejVvZG1xdGJVcVd3UXV2elp0d253Z3IrRUhUNFNQQWhC?=
 =?utf-8?B?NGFyaVh4YWdFV0ZwY3FiQjAwTFdwdEpqWFhNN2EyWmxhb1B4bWN2cEhvazlt?=
 =?utf-8?B?cXJ1NUNxV1htOTRtb2RCTVRWVVFXelA5c2VHTENDNGorR241N0tUaHFweXZo?=
 =?utf-8?B?ZEh0SzRFeVBuK1JIUDJiMUZ4NUR5YnpkUmJpMk9XTXk3aURtVG4weGhSMFFN?=
 =?utf-8?B?OVZBa3BYUm9JWm0yK3NMVXZsclVJVVhXYTFZb1JtaEhySm9HRDJ1alZMamJF?=
 =?utf-8?B?NFROYW54MzY2QlMvVXRSSjdJWjNhUDhxcGNGUTJSK0plbFlFMjBUV2d6YkZH?=
 =?utf-8?B?aDZFbVBtamRobklKaXRDRFBaaUxYSlQvQVc4MjVrODIwaDhVYnlvbDR6ZXhQ?=
 =?utf-8?B?SGIwNFFob2VrWHFSbi9ubDBjVHoxVjlnN1BZaEo1YWlRM056L2VGSC9NOHBs?=
 =?utf-8?B?REtJS0V5MzltbnF3NCtYdEhQdmNvUFJJUzQ1MnUxQ0NxMVp0Zy9IR3A1Wktk?=
 =?utf-8?B?SXZmaEVWRERCZEJJN3ZKSDE4SHlUaUlISTJraEg1VEduMFI3WWgyZ2tNbEFj?=
 =?utf-8?B?MC80UXlrZ0VTV0Q4QVlOR0pDa2tkRWE1L0NaVGlzc0JtU25ZWFpyMU4vSUhH?=
 =?utf-8?B?RWRBbDREU3BsK2VZdDBIR3JneUF3M21heUJyQ2VVKzNET2d4dGN5aURhSWdj?=
 =?utf-8?B?QVZ4d0pwSzFwQ0x0Rk1BalZIMm1SOGJsajI3MHM3elVHMkN3N1RZNXAySGNO?=
 =?utf-8?B?UDV2Wk4xeFhXaHNYK25wTklocWQ5OXZKbno0NWwwNlc4TC9FTTgzVU5VTWlF?=
 =?utf-8?Q?3tZ1CF1MPqMPgQMQPG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc264db-a248-4a82-b3af-08de9a53a80c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 18:28:42.8333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6L5cA0HgTmGc7QuOF9PRQcIN/TMvA7zaXz0xmU1XPe4a4WaArKG/P9MJ0kHmkpWJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6195
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58759-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,lists.freedesktop.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid,linaro.org:email]
X-Rspamd-Queue-Id: 49E9B3FDB56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 17:49, Tvrtko Ursulin wrote:
> Sparse complains about assigning a string to a __rcu annotated local
> variable:
> 
> drivers/dma-buf/dma-fence.c:1040:38: warning: incorrect type in initializer (different address spaces)
> drivers/dma-buf/dma-fence.c:1040:38:    expected char const [noderef] __rcu *timeline
> drivers/dma-buf/dma-fence.c:1040:38:    got char *
> drivers/dma-buf/dma-fence.c:1041:36: warning: incorrect type in initializer (different address spaces)
> drivers/dma-buf/dma-fence.c:1041:36:    expected char const [noderef] __rcu *driver
> drivers/dma-buf/dma-fence.c:1041:36:    got char *
> 
> It is harmless but lets silence it.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: ac364014fd81 ("dma-buf: cleanup dma_fence_describe v3")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-fence.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 1826ba73094c..a2aa82f4eedd 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -1037,8 +1037,8 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>   */
>  void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>  {
> -	const char __rcu *timeline = "";
> -	const char __rcu *driver = "";
> +	const char __rcu *timeline = (const char __rcu *)"";
> +	const char __rcu *driver = (const char __rcu *)"";
>  	const char *signaled = "";
>  
>  	rcu_read_lock();


