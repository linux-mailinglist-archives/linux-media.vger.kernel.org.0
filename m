Return-Path: <linux-media+bounces-58168-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNHPEHzZ1GlxyAcAu9opvQ
	(envelope-from <linux-media+bounces-58168-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:16:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF103ACA4A
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B01A30146B0
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 10:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0DC3A7F6D;
	Tue,  7 Apr 2026 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VFakcKQN"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011026.outbound.protection.outlook.com [52.101.62.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F223A7F57;
	Tue,  7 Apr 2026 10:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556984; cv=fail; b=W1rqQAhrDFN3r8/K9wBFyqBt5MR2KjSo+73lj30OBRVEBsnnRJ4vU82QG/zANFXpTlHkMukLQiXo829HyvF3/tOKr3wyv1+CePnWduC0qWnNaDb+S9j+9iDx17hZyt/X0nePZChGXknHRiCO3XY5IxHVItE7aGLAXKhcqO/ie9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556984; c=relaxed/simple;
	bh=isBckhNuyHxSwRpKSk7mWLpF/oBfJzPGfImJeABfgro=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E44AdTit3mI2WHC87PGh5Da/yz2FcbB1jfSwQjv2bG547Yq3OY0KgEl96FoeG4KvRQo4PgAbpRbU4v4VMzJY2d/0fYqBZGz8niEo+WE11lD/WOFjI9+Kozdr/S002A9aZD8FRSvqNYgiIKevFOlp9BLWpTsukDuvN4MLnB5RzEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VFakcKQN; arc=fail smtp.client-ip=52.101.62.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYc4yjlssfayStgP59igAEN0ZvYIouSGUlLHF82iB8UHuJkj2Dr/Bq1ZVcpv2pcFkJ9OAt8KPB9c2vNWlk3QuVbG2WdgdKb4fk+LAUB6blj3To24j+nAPxet4ZBFR3U/6iIpqkJoD5E1hChY/Xr/ESFdkdjNDOGx3iPnnmPa7uKAzg4/VDGq+a0vDoZz5FD8BzhtQqMe5Gl7AKja8ro2erQS2Iv1SPdxRYZVo6buUV2zZfp92Y5wmJO7KvbHmKJSREgbjRVAUcxpQUwoNHkywcto3tGD0RXieTYdGxhKCazBYa9RFOirxLm8KQZJqMZFFZ9GUZb51PBn1HNaPC1++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkigFcR1irUy2nXTSzCcFNLA857EwMvMS7nX0N71T70=;
 b=BvH7LmCkKXLbX0AyfyE+B9wdsmTfdCF3Hi9HlngOlCDscYL19kWxLccX6LhDX8/zVbLSeYkvJTnCbw4q2BXE5M3A3L20TT9WO/UQi8zxyiFk3vkEutHlKjp7V9vsnv9LrntIASie3xW78LA2VEGu8D5UkZYcip90m55H/Mq9lYOacVZcG+9uWvThQHJd8eWp45JUflS/JqIZvx6DgFFEvYUD7fyyDyJMxRIkwi6Tt/PY1XhZA990eQP8iVRPK/2wwTaegnv+X15koZ5YAVuieTbG70cR3oWyRppgvy3jMNbMBd0v3sRIvJiJJ4ToTh/95bydUaJZHlK5eCV0tRMuMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkigFcR1irUy2nXTSzCcFNLA857EwMvMS7nX0N71T70=;
 b=VFakcKQN60FpsChd4+56Bv7bjGd6LkwFadSrX+IPoGtmMAfPvlyh8uwgdkPhwyf+4CLhk/1yqHxw6nPJsCfI3ri6oF5UZU1d+7a03IF3F4411k0UH+I7y5dD6hcqDgbprkx1VBtnAWSbPU8DX1VEx4X2X2O7CkCYo4kkNECLjDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7879.namprd12.prod.outlook.com (2603:10b6:806:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Tue, 7 Apr
 2026 10:16:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 10:16:19 +0000
Message-ID: <0c00c6ec-5834-42a3-b1a7-0bb81943bd98@amd.com>
Date: Tue, 7 Apr 2026 12:16:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] drm/amdgpu: rename amdgpu_fill_buffer as
 amdgpu_ttm_clear_buffer
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260403083602.1771-1-pierre-eric.pelloux-prayer@amd.com>
 <20260403083602.1771-6-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260403083602.1771-6-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: 5291394d-4060-4f97-da81-08de948eb60d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lkqSACdnwEUhkcd0gEKgsS6pxprleR6ehFepPTm5o83dlvnqs6JPlhtBnkK7DRW/MugC6i5DRjY6aPA36dHAWbeMYG99d1ElSyqT7S7QiVgdpU/n2Fit+Se+QsdcoAG4L1vJbA6gAxF8C1TF29P+WelSj7v3q2uH5CA5z8GSXAc4FBBe6HhBreKs8QwbSZhwnpN1LtjKd/5CS/6IOgZExvq4g+7ylpflIewOrrOxFx7jwgvTaNCkstx6C7/iY8sqYnt8KbcIw0G9Z8OlFLA1PqRpOLFjqwulegQf7VbuHlXDvkiwwIRMHb79fE0IuyuW0Q9J0A9b9OP23hxvZ6JL8G57RxQVWlXB7hU99wJSO+wXTPpf6mo/zvtlUV3v+rjvlR0CTfzi7yO4gkx/yrP5cnUxF0oIRBt40eUWLr1FdR0G5dhDVqGCceJTNosxqW5KtnITK8fY9St/pCtwAge6HjrJ1rAqRelWwXXBypV/g1TqONYShvt+ha5vxSyp6GKWnRhpXn45Kd+gDdiBZiZo+GpLrbJySh2fC87pKx8hO52xxDAwl1w1so8bhqU4GqC7udChqOjJ2wvBHweiP7L3cIXfLYleZCXvOVmUpLNNqES2Q8vVqUvO0N2ukNdWYltRFk1Tgt5TrUWIAdtDiqxcNZlEuGf1NzwS7N/e1TbsV6TuloFjUlXlY1p9n6xXzC+s69OXZPn38CXFN8ueeXbnTE6wWX8pBDtQsSTwif1R7j4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3JDZlVSeWZTTHowWE9YTVF0TGFVMHB3eUJWL0tyWS95bzdMK1Q3a016Q3dZ?=
 =?utf-8?B?S3VkSTFCZVpFNlNWcmdBNkNkR3BTRERqTlUzOHVUTUE5aEZwaGNrZkl0V01C?=
 =?utf-8?B?OVF1NG92YmE3RkJUbWlnOU9ubHJ2Zkh1NkdQV0huUlNDNnEwcnpFd2VoUWdi?=
 =?utf-8?B?UlFrWjJlQkdWNkh3RWg5MWl4eHFBM0xFNEs1TjdTZFpOeFkva3hDU1hpcXYy?=
 =?utf-8?B?R1VmRCtCYzVucTlNMTU0ekk5VUZhYmVtem5zeWpETlgwK2NQTFFsRDRLRVFI?=
 =?utf-8?B?V2RsQ1J6UFRtNjVJTzU0V2ttOGlzSThicG5MSHJ1WWpjT1B6QSs2M0xacHlC?=
 =?utf-8?B?VEladTBiR0RUVzc4Y0lUbTA2VmFHRlQ1RVBzcG5vZk5QaHhMeDZVYld2Skow?=
 =?utf-8?B?eUh6VzFhdHF4elVSZFQrTURVN3JCcVRpUmdwYWxyMWdIWXY5NWc0dit4dHRJ?=
 =?utf-8?B?MVZ1Y1R3bFVIU1hwN1c0Q2prVW9wSGw2K0tMWVAzOUJDdENRckMzOGZRMzJs?=
 =?utf-8?B?b1cvM0hiS1hkaWc5OFJJV3lqUTVOcURzY1BFSDlSK0Rlc1oxN2h2bUx4MVlU?=
 =?utf-8?B?U2VZTzF6bjJIejRrMXVsMDVFVjB3UUFaTU5GQzdYV3Z2SkZRbG9qbjArWmlK?=
 =?utf-8?B?QTVIeitKZGFwUkhmYmFNbk1Bc3N0T3FRaVkvcGEwNlZOVmJjb2lMQzhQQmJx?=
 =?utf-8?B?Z052eXVHeHF3NWRsUGJzMGlYWWlzMHBDYTgyMGo0YjRQNWoveHB3TGh6Mi9r?=
 =?utf-8?B?VWhFTXlKMGJYM1FRZktRUWl1VUJOaElSaVJwRkZGRUx2WkU5RnRFZTYxZGt6?=
 =?utf-8?B?SVJHRit3bTNySVgrdlozNFJqWUZ0TVdFQlZNU1NrRW5DOWtvdUFXclJNTXd4?=
 =?utf-8?B?WGdMMHVSTkFCNEptZXNoT2M4QUZkNVdZUmxNdjZuL3hESm9ZeXRrM1g5UmZ3?=
 =?utf-8?B?ZE5XVWdDdTBkaG4rbVpUeDBkYzlBeVlxQ2x0RzNnR1ZKNkw4bkdMQUNpSkha?=
 =?utf-8?B?b2NyZ1hZSG8rMDM0OVNidHc4Wk5QRDR4L0UvNXVPakt3NHpQRlRvZVY5VmlZ?=
 =?utf-8?B?akpjTis2MlVkNitEVHY2TW0zcHZmVUJFRUxDc3JQM2NMZHM2cjZWcERYc3lm?=
 =?utf-8?B?ZnFCSkNTWDArNWtKdk1xUEp6NkNOeGhWcU5CK2ZDdHdMaEQwamFNZmdUMVZI?=
 =?utf-8?B?WGIvN01HeUVtMlZPT3RValdJbXVGUkhJdGJWc3lkcHMxSGZvcGNHRWthQS95?=
 =?utf-8?B?NHcxM25DdUd6Vmd2bDFtNEVwZmdtUXBGRHhJUVlmYjJWTmRORTkyeXI5bXAw?=
 =?utf-8?B?Z1c5Q1dSQVNWVXhoY3JOS0pKOHFjbDdBb1RkelR5V1pCakRvQUdiTnp6a1dk?=
 =?utf-8?B?Z3MxMjdMZHVtVHhuRDg5d3FPYXFVTk9UcURCamkralNhQTQ1dXlvbVJPblMw?=
 =?utf-8?B?a3pmU1BscVBOenpSTTM1NjluM2ZtVDVEWGJkTmFvK3pMOEpUUncyeXE4NnZq?=
 =?utf-8?B?QXhzZ1RnazQycCtRRW96NFhoaGtGL2lSNVY0Qkx4MGl2elczcWU3RkRyVXdB?=
 =?utf-8?B?SGE3YmtFSURnZ1ZrOE1OSXNuVkdjYkdaSm1oRDQvdGJmK3dHaVFZNkNLSVJT?=
 =?utf-8?B?VkZXUjJIN3ZmVHk0YzhkcDZtdk1GOFV2ZlVZYVMrWlJmRzVUd0VuOTYxNDU4?=
 =?utf-8?B?VG53aENwd25PZzZmdVdnNmE5L1RKTlJLOG5SMlJsT3FCNUVUZzB3SENGTEI4?=
 =?utf-8?B?MmVOd01XSnJyS09DcWlQMmpWV1Z5bWpwYkZkaDhCeERmdVBmdzRqeUdQY1Mr?=
 =?utf-8?B?RVZ0dWxLVXgwSnd4bTR4Q3h4cG90ZVJoeS9BN2dvNHVXS2JOQUxmY0ZndXpB?=
 =?utf-8?B?TElheVU1TmRoRm5NUUZ6UEl3VGNQM2xESmNMWDA4K2thT0JRS01QZ2ZJRHZV?=
 =?utf-8?B?R0lHZ3pqbHFBMFhpdDVIZVoxeVRqYzhRY2QvTWZUdGYrelNIM3RINzJYQzZk?=
 =?utf-8?B?ZmgwYUR2b25ybmRneS8rRlBLZmE0dy9kMTZ3VFFPMW9EZ2RRVjRxVVNNVDEz?=
 =?utf-8?B?a0UyaGd6SGludHdiV0xCbUtsSXlFTUN1bmpDTjkrZ09kU3JhRjZoWkd6WUZG?=
 =?utf-8?B?ZFdwdTlYdFJ5b1RwNnZ3c211RDZZeG81VEc5RlFOUnQ5c3plSkxkbDVkZDFY?=
 =?utf-8?B?WHJ3UEJUV2o0RGU1dFZiZ0Q0VWZqVmtWdWtWamtEZ09iSlFaQXNldGpVcW9C?=
 =?utf-8?B?NTNFNG1MQlNaRFlJMVZFbVRpUjYrR0JlNEczM3NnOTRyTFhoWmJjVHV5NnFK?=
 =?utf-8?Q?qkIJMTqrqflAXgXqC3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5291394d-4060-4f97-da81-08de948eb60d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:16:19.6995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UwgL+uqt0zSmYoTCloFJbMaWnv3HpNqHQIOFHPYezBSmxCfprDXDCgyotYto7WW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7879
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58168-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: ABF103ACA4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/3/26 10:35, Pierre-Eric Pelloux-Prayer wrote:
> This is the only use case for this function.
> 
> ---
> v2: amdgpu_ttm_clear_buffer instead of amdgpu_clear_buffer
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 12 +++++------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 23 ++++++++++------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    | 13 ++++++------
>  3 files changed, 22 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index d0884bbffa75..195cb1c814d1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -717,9 +717,9 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>  	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>  		struct dma_fence *fence;
>  
> -		r = amdgpu_fill_buffer(amdgpu_ttm_next_clear_entity(adev),
> -				       bo, 0, NULL, &fence,
> -				       true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
> +		r = amdgpu_ttm_clear_buffer(amdgpu_ttm_next_clear_entity(adev),
> +					    bo, NULL, &fence,

Wait a second. Why is the dependency NULL here?

Could it be that we relied on the fact that clears and moves were serialized in the past?

Regards,
Christian.

> +					    true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>  		if (unlikely(r))
>  			goto fail_unreserve;
>  
> @@ -1329,9 +1329,9 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  	if (r)
>  		goto out;
>  
> -	r = amdgpu_fill_buffer(amdgpu_ttm_next_clear_entity(adev),
> -			       abo, 0, &bo->base._resv, &fence,
> -			       false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
> +	r = amdgpu_ttm_clear_buffer(amdgpu_ttm_next_clear_entity(adev),
> +				    abo, &bo->base._resv, &fence,
> +				    false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>  	if (WARN_ON(r))
>  		goto out;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index a3d0998b8cec..e74f9f8a88dc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -417,8 +417,8 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  	if (old_mem->mem_type == TTM_PL_VRAM &&
>  	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>  		struct dma_fence *wipe_fence = NULL;
> -		r = amdgpu_fill_buffer(entity, abo, 0, NULL, &wipe_fence,
> -				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
> +		r = amdgpu_ttm_clear_buffer(entity, abo, NULL, &wipe_fence,
> +					    false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>  		if (r) {
>  			goto error;
>  		} else if (wipe_fence) {
> @@ -2572,26 +2572,23 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
>  }
>  
>  /**
> - * amdgpu_fill_buffer - fill a buffer with a given value
> + * amdgpu_ttm_clear_buffer - fill a buffer with 0
>   * @entity: entity to use
>   * @bo: the bo to fill
> - * @src_data: the value to set
>   * @resv: fences contained in this reservation will be used as dependencies.
>   * @out_fence: the fence from the last clear will be stored here. It might be
>   *             NULL if no job was run.
> - * @dependency: optional input dependency fence.
>   * @consider_clear_status: true if region reported as cleared by amdgpu_res_cleared()
>   *                         are skipped.
>   * @k_job_id: trace id
>   *
>   */
> -int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
> -		       struct amdgpu_bo *bo,
> -		       uint32_t src_data,
> -		       struct dma_resv *resv,
> -		       struct dma_fence **out_fence,
> -		       bool consider_clear_status,
> -		       u64 k_job_id)
> +int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buffer_entity *entity,
> +			    struct amdgpu_bo *bo,
> +			    struct dma_resv *resv,
> +			    struct dma_fence **out_fence,
> +			    bool consider_clear_status,
> +			    u64 k_job_id)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>  	struct dma_fence *fence = NULL;
> @@ -2622,7 +2619,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  			goto error;
>  
>  		r = amdgpu_ttm_fill_mem(adev, entity,
> -					src_data, to, cur_size, resv,
> +					0, to, cur_size, resv,
>  					&next, true, k_job_id);
>  		if (r)
>  			goto error;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 436a3e09a178..d7b14d5cac77 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -187,13 +187,12 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
>  		       struct dma_resv *resv,
>  		       struct dma_fence **fence,
>  		       bool vm_needs_flush, uint32_t copy_flags);
> -int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
> -		       struct amdgpu_bo *bo,
> -		       uint32_t src_data,
> -		       struct dma_resv *resv,
> -		       struct dma_fence **out_fence,
> -		       bool consider_clear_status,
> -		       u64 k_job_id);
> +int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buffer_entity *entity,
> +			    struct amdgpu_bo *bo,
> +			    struct dma_resv *resv,
> +			    struct dma_fence **out_fence,
> +			    bool consider_clear_status,
> +			    u64 k_job_id);
>  struct amdgpu_ttm_buffer_entity *amdgpu_ttm_next_clear_entity(struct amdgpu_device *adev);
>  
>  int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);


