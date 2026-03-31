Return-Path: <linux-media+bounces-57748-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKkCHteSy2nMJAYAu9opvQ
	(envelope-from <linux-media+bounces-57748-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 11:24:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DBF367014
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 11:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D25F3096F00
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E533ED5C2;
	Tue, 31 Mar 2026 09:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eRKIiYb7"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010019.outbound.protection.outlook.com [40.93.198.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2D12BE7BA
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 09:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948757; cv=fail; b=r2EgB23IrRqvXiHEd4SivcOZuz6TyMV1pOzSyqyk1BAmynniEDCwJoCyyqgfZic7ZgwlHAg++G63qm8a93KrUMM0W61e0z0wWfKclRuDZoqaritcCGDVdatOSHdECeYChmJgnNZIeHxzeFTsV3wXpllc9RGY+7sh4Tx4EOAOOh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948757; c=relaxed/simple;
	bh=qz3x7xgx060uu/9+HL1mhd/Y/BjYpM/s+Sjzhm2IKIw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZYGY7D8Rh1h83b0Bfhi98opD09w8Ax7+nzCPJpDqmXtWGpYGxAEggj+3WvG8caH3PZj+BhgB+uw9jyWzDzqvYKSX0X8Uqg97cWOvuxEPp64Rb4VT/M2ARt8KWhPP28ex96lc71fiQ0xjRW2KRjYVKiu1zBfJ3vswqnr1ogZH4Dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eRKIiYb7; arc=fail smtp.client-ip=40.93.198.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m78rCI/Dm/7ILO8SLWAIzwpCYLV/qX+t3ZDjkp/BHhOIOGn9bL7WRWsDZiQsRrFk/2TDe1BrSXgFcZkQiLPZcPHA3IA+rw1Rgis9tYOBqQNPlqDqwax1SVurawWSNaVAinuls+ZtyWQEpQNa2G268aObeiG/SzrtrlWO6DU/oiFEowjFxdVZIbFYE+Fq2mpIYxwjmIpDXVQ/cuOAeyaA7WkTjywF4X/wLomB9GS5dyS3CvM+Jr7tZO4oZIIsVnyMlQkw5B+uefJDfRVCwLTqNFaXpW4A+4qKSFenZCuxANJOvdOc1dsCuYlXW0OdkscliBgGpp0PNhjeJMjQqVzeZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uRDj9ZJSeo61OSR7kE63DPMeClXfmvzISg+YAdnjU0=;
 b=pwT4CHQPI9OTqZ2QgxF57HBfk9O2n2ZLg9QiSyJPyUSBS8G9+rUoeucDwwfVKdjHQg3a6KSessIDK+TKUk/BCwdUsUw2EmIb3CjuT6Qfc95HxKrSJ+cQVs40F++FbyIvXQM5t6U1Lxc5jx9GYAvz9/RNH13l5yy4h7UHZlcYpLTMrkGwkhgiksdRHwkvLsdG6B1NrUPu7dU5VHzXWr9qvzW24ry5rK2ENaQEbiC46ZFfvMlsGvBRbRqGf5qnKI0f5x9X6DdN1q0yUjN6aiOhpJdqlHN6CliinfypyS8JMBx+m6DLkdeJYh+kjlEeOW/YTV81FJzkfGg3B6rHNGikDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uRDj9ZJSeo61OSR7kE63DPMeClXfmvzISg+YAdnjU0=;
 b=eRKIiYb7z/ggAcQ/zbTH0vRwV6VvqoC8u5OH/2ZJUyEGE3m8g1xGvXv94RAe0dLEInRVGqjp5WtlLuLScg/opCUVrVxMUV+ABEXh1lJPxSs2MP02Ph8v6kyRvin3ym+CQZBo/5rTQtG7eIpuSHTHd6pJZh6i6vW5XnX0nDMvnn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7040.namprd12.prod.outlook.com (2603:10b6:806:24f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 09:19:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 09:19:13 +0000
Message-ID: <d3e186a8-d807-4e4f-ac63-806aefea2b68@amd.com>
Date: Tue, 31 Mar 2026 11:19:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Move signalling tracepoint to before ops
 detach
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260330133623.17704-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260330133623.17704-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR11CA0013.namprd11.prod.outlook.com
 (2603:10b6:208:23b::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 828ba407-1eeb-4e2c-c689-08de8f0692c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6tFJC6ekD+D3FNC4UUuP5oD9lE/ekWV5JZq/P2YpXirA5qN2VYQZ+/Vdq7ZagwuXD6+K/kZth5GTM62KRvZ9Th66+dRCqr3bdpWkUPBYL8Qm+Znq59fxBJBNbxJX1X8BP+adLW/SofSqshdHcw7HIwJ6FyRPnaBlmWia5HRDJZv5P0pVsKLqbs/V2URa4+5htkiY1/nYwJXX+5+fpAdKxRH1OCrBm8cHbNEeWGENdWX01SVlfOhGj1WljC+k8dcsS6iFl2MOmAem/CT3qUzJYwW2utiCbabWKdsP/mw/4DGiF2UzUWDSgR3F5qA9cI+cOUTObbfemmClh8r6u9ktXFoFwc9FAr2xefXkJn0cREK86I1d0IewxFUy0kOvyJwG+EC5cW3R9K+uxgcYq0X6oR6csj66rt2rYhLf4b9wVQ4L/Sa87RgMqXqwF5g6pQadMbdLwCqxMvHBOpgOi0+iOr2IDiUkbV4n8GZ3klIn36UW/smkSVXBqcobj7uGKjH4qbAVtPbkzXmKmpYupC5yfTXhIjK/gzs6seYsvrQ83DBqukEBA5QEFo6933DLnye2NOIR0Xx+gYoEQWLzXPM6UWMLfL4K2uOioDpA9wW3y75y2pJGlOJxNfayp9cNqIWDsi0ls6aVoF6CEv56lqKDeuCrkds2NDNQEb9t8IxKx2Us5KE6znsPR/TNL279Zb0Pi8YOVWz/W9AJr61F6Jn2MUovWsiAGUJXDdUC60kC83k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnp5bWFhcDBWQmxjc0FOWmxqNHJXT3ZJbjE2K21uUm5ZYmp1YTVOY04wanBM?=
 =?utf-8?B?YVB3UWZoREtLdVIwOGlVQXcrTEYzbVBzaFdqU3BMSWxIaVlPbm95ZDR3Sndn?=
 =?utf-8?B?MllxS1kwV3V1cFZhY2ZwNjJHWXN5V0xyMktRMWt2a1BUdnVVbjJmTWhEZ0Iz?=
 =?utf-8?B?RCs2aWd0TmtrSUI0d2VXSHRTQi9sYjNZWUJDUVhPT1Yzc0pNVkE0aThKSTdl?=
 =?utf-8?B?NWs2dXAzbDhnL0dJWGdhb2FTL09ZWCtDYkpOQlBvU3V4TW44NzRtSFVlRzdR?=
 =?utf-8?B?Wk8yZE01UFpxQzNLN3h4Y1ZCdDkzREJpNjQxdnhEOU5IOXNhcUNJbkI4N2t4?=
 =?utf-8?B?d04vVUY0UlY2VEJRRmhFc0MyZFdSaXdxdTgwYWwwUEU5eUhuMTdJQ0c0ZW5O?=
 =?utf-8?B?TDk5SVRRVFNDeXFhSkVDbmFjYkVHWVRvSzZPOVp6V2pkSzgyL3Q2ZTI1OSt6?=
 =?utf-8?B?UmttUTlTRWkwaEJNODM0ZzV0dnIzUVJTTXJiTE9xdnoyNFNtWWRzUkZ6RUxD?=
 =?utf-8?B?VCtvOUtwYlJlMWo0eGhCTG8xd1dBeDlGYmJjTUZUQnlCYVR5aFJlcnM3VlJY?=
 =?utf-8?B?S1c4SENqU0Z6cEs1bmd2UVRiUDR0QTdZM3E1b2p4VFBBNisxWmFMOEE3Yk9u?=
 =?utf-8?B?bVFMZHpPaEdFZkZ2TWlDL0ZtY1Zzb3JsZTdhQ1N5SFVZc1hjWmxGYnZPWjFH?=
 =?utf-8?B?WmQyT1JveldQcHEzSXRvai8wL1QzZmxDVTJ3UW4yN2lpWTZIbXBLbnVGRE53?=
 =?utf-8?B?bUVZcU5OcFpyT29nbmRsejBHWllIRFVsOVpqWVVTQ3lZN0p3VnUyT01IM1Ru?=
 =?utf-8?B?N1E0UnluVVEwK2VhMitYYUZiNFJtU2h4VVBJeUVjWWRZNjFoSU9LUDVkTTBP?=
 =?utf-8?B?cisvYmJLVEY1TTBTTTlWOWNEcXFocFVYY3lRbHRjZDY4WlhIa1NBSlduTGhv?=
 =?utf-8?B?dXJUYURoVEwxVndvakg3Vk9SWGZEcUo4YVphTTFwS2V4MWtnc0tqaGlJRXpa?=
 =?utf-8?B?ZHB4V201UjBNTExxdmtsWHhGU0c5VTQ3QkpPUVRaNzl4dndqWmtZMTVDeisv?=
 =?utf-8?B?KzRqd0hTQ1MvRTJBSlZ0K0YvSUcvOTZiUW5MNkpDeUV3MUpBdjNMSUc0SU9L?=
 =?utf-8?B?RDEwVGZPNVY3dlZVK1FzWHNES2U5SVdhRytCaGIwK05MbnZiK3Bla21LYVZL?=
 =?utf-8?B?WkI3US9Zb21CS0pURkxPdjM1dVFNaGxKU20wKzZXYmFJZ3ZramFDSVZ5QnJk?=
 =?utf-8?B?bnh2S01sWTJzcDlIaXV6dHZ0czFNSERmWWdvbUFlalZNeCs0TXAwMTJSM0ky?=
 =?utf-8?B?TU5NZXlDQ290bXVpcDUzclhuNi9YQnhTNXlyNGVIRkI5V2I5em5QeUNNQ2xw?=
 =?utf-8?B?RldWVG9oUlJiS2VNcmNTaUdtR2kvVGFaRFhZS2tsajBIMzhDaHFCR2ZEV2pw?=
 =?utf-8?B?NW0wVkZHcTc1Zk1TZjRtWUtrZ21VeG50YzJ2cXpjdUc5N1pncHA2TkU3UTZU?=
 =?utf-8?B?cHJFRGg2R2NVeWY3ZWdMdFltUFRBb1FWOWpFb1RLeHhvVDN5dUZMN3VqS3R2?=
 =?utf-8?B?VzVtSkJXSkhCZDZ2bnB6OFZQTk5INmVYbzdhNnZ6Y1NLVm1BdWVQRnUvdkk1?=
 =?utf-8?B?NHhCMUFwMFVLVlQ0eVd6YmVVQjVKeHhpbkIyT3gxSDVEbGpJUHdDeVFCZ2dh?=
 =?utf-8?B?MzJTOFdISk9WT3BMR3ZNTldKbU1ZcDFPbnRXSmM2RzFKWGo4TUNSYkNRbThu?=
 =?utf-8?B?RW93VjM4WkgyQTJXRzB4R010RXVxQTBJM0RFZjZnUm00RXJVUHFxV0FiZVM5?=
 =?utf-8?B?WHE0NitjTm53TCtPaGFwemkvRmljUXlBWDZwZmdNMDdsTmtGUmFDU0xCQTE1?=
 =?utf-8?B?and4M3ovSjdDV1NUTmpQenNRUTd2NlA4eUpZb2RhUE9PQ0VhYlNuNUlhMnJO?=
 =?utf-8?B?RkpZUzVKZjNMTUtiSThmbGFUeHJsVzhWem9aM2lQRXB0TGJHWVR3OXlzTUds?=
 =?utf-8?B?VENpMjFBbGp4WVlxZWlaamNhNnVJRkpCWW1FVTh5c3pNU0ZTVjF4S1hhMXVu?=
 =?utf-8?B?ZmtDY1VMVkNrM3ZWakJYMXdnU2NwRVRPbFdHczRObm9JbU1xRitTZ1pCRk9Y?=
 =?utf-8?B?VlVuVnUrMEFUL082YkxMbFBJR05BbVlOYWdkdHY3Y01nZWhjOXlJaWhiUEZC?=
 =?utf-8?B?d08xY29kNmc3N0xDcTkxVjZvQ210dld1ZnE2emZjMkRYRTRYYkk0QjM2N013?=
 =?utf-8?B?bGlVRUxiQi81UzJWRWNVMEQzdmQxTE1DaTNSYU1KRG8ybmE2dWwvSUpFSDZq?=
 =?utf-8?Q?gLdPavmV1acY6oXA1W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828ba407-1eeb-4e2c-c689-08de8f0692c1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 09:19:12.9226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hwC83UvFQCD4d3eFz1Zxm5FB60bDn+ZLHvR/we032aGtyEyv1UGwNPO4pPgsOr/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7040
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57748-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,igalia.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: C9DBF367014
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 15:36, Tvrtko Ursulin wrote:
> Move the signalling tracepoint to before fence->ops are reset otherwise
> tracepoint will dereference a null pointer.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Good catch. I just silently assumed that the fence is not signaled when we traced signaling.

Going to take another look since there might be more problems, but for now:

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-fence.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 1826ba73094c..1c1eaecaf1b0 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -363,6 +363,8 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>  				      &fence->flags)))
>  		return;
>  
> +	trace_dma_fence_signaled(fence);
> +
>  	/*
>  	 * When neither a release nor a wait operation is specified set the ops
>  	 * pointer to NULL to allow the fence structure to become independent
> @@ -377,7 +379,6 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>  
>  	fence->timestamp = timestamp;
>  	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
> -	trace_dma_fence_signaled(fence);
>  
>  	list_for_each_entry_safe(cur, tmp, &cb_list, node) {
>  		INIT_LIST_HEAD(&cur->node);


