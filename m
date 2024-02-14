Return-Path: <linux-media+bounces-5163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C73E6854EF3
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 17:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8439D28BEDA
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 16:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2DE604AC;
	Wed, 14 Feb 2024 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p4HWhTLG"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C9F5D49C;
	Wed, 14 Feb 2024 16:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707929160; cv=fail; b=Xptee8aKKbuxV8LBOIy9BUc26xzwZfGv4JEXKwhXYzqLlbXlkbDs/b22Uv+GtIdm8VfIZ/+/Vonvy5fj1CB0m8m+880OAS9pKEdCX5jOKTGahzsAqtszwxxGqMxnPrBnm8LCw3gdzcRunKw/6v41N0s8Ht29g8O8T6HcEtn5z+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707929160; c=relaxed/simple;
	bh=YjgsUJB5t13F/7ST2M474h0USBA/d/rkDxYWKrPog8Q=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VZ9QN91dqim4gjx1Y7tHLnz0V9Dhjso6viWwbHmvs2X2N9DSBVqVgbRJWA6G54eiPRg8AjJsW/mSq18BecxMkb8lebsLlQAwDkK3tyqiu0ThoCdxApxK7IQyi432EdkkK/xcr75AZqGS0ikDIQ/4M1EO21Fj9EVavNZ1e2+ViPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p4HWhTLG; arc=fail smtp.client-ip=40.107.244.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXGMhl/ak31id2L8Pgd+XPnLWIkjTQtfClW3cfqERkSKTb1bStAX4cbMtOKpNSbT548tpCE/1FLWC/ZyZe8nPJUO5r69vkSok0uV0jT677MMhYD0TLINHMLJnOT18pm93wo05owFgG2ZrEBL1X7buNx63/wZX1NVdEx/JZxFKJT2jxv6JjjdOXLYfsHTyj3tGC3iJqdb11TKgeVCdozTliVuEeT004EP2znLVmHksgEG1yHXAchxjBmJ8hu0nbSmtZT5xWQfC7P31q59XteqiseDRYqyauh+uKiMGv9Uau19Jwo7tbsDCrr4rtlx8bwGC+FJMRABzXT4ynHastaySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WW/E8RoNZwADXdvUVFmgfsZv3LCk1TqRFwkBh6MbLWc=;
 b=Y3n6geiM2I7emOX2cnVDneEB9K9gM9044uPORcCugRPnyyoE6DWHgUw9UZdI/ScOc0LSfvgdEt5kZgPQK72BjV54hHekgwRI6tyWA1P4KJnB3Vox4F5M6MiWf2jwHJ87u2vIXR0Pc1rzUnIASqSJ6x9waDampgP4VsJbWWHbLGhMq9pDPKyE59Dv/KDWmid6h13l65y9K2k/TjNoeh3rRMLpJjgmvKn6sE8WLgyOsoE4hpepX3xq49d/js2f9S05aXHkwKjlVzf0i65I5iU7Lv+0Jj7usNSQF/G1Vi5zL7V0gmvpkBp2KDlYyeLht6mVF75kqIB7UODcEZBrMQRZIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WW/E8RoNZwADXdvUVFmgfsZv3LCk1TqRFwkBh6MbLWc=;
 b=p4HWhTLGNxLrKwv2d+ss0iR1GdI9Kl7wJznXCFuLLSy/t8mHG8XyBBIhq6sqmeBWN+0Ktd0k4ghP5f3us75cx0PoGe5P1IEe4Br0icqzYu8iVBkRW+s/dz71nzYRxFSwSL8WXUnqzYnsmCdVlRtJM5iGsM5PY9qBj6Qt92zyn9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4938.namprd12.prod.outlook.com (2603:10b6:610:34::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.28; Wed, 14 Feb
 2024 16:45:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Wed, 14 Feb 2024
 16:45:54 +0000
Message-ID: <2e775c02-f19c-47ac-96e6-1cabeac99319@amd.com>
Date: Wed, 14 Feb 2024 17:45:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/amdgpu: add a amdgpu_cs_ioctl2 event
Content-Language: en-US
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-6-pierre-eric.pelloux-prayer@amd.com>
 <2a6a473a-3e87-4838-83eb-400bde712e91@amd.com>
 <37984611-fe53-4088-be32-0a2d825ff47a@damsy.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <37984611-fe53-4088-be32-0a2d825ff47a@damsy.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4938:EE_
X-MS-Office365-Filtering-Correlation-Id: d45c2881-cef9-4685-833a-08dc2d7c68f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tvIM9sGggT4bK8Hboc9CGd7rvT4kB39f2BtkVdsVQyuy0Lyv9oRZCrUa3JOxUSS6gVzaTASNPq8syTaxn23LUSldTXiROgX3XUPwuXtwUYc3/wtNjq42kptUSssqRpxdrwjnEYtCPXhpsjZSxdNVRU+ZIafFfPTVEZ4+sERgzY9Xk3nI62eQATv/P/7re+MjJ9LrZe8Ty0AULTvDWs1+P+1S+SBu3hamrB1K+NFn9uYZzbGQwIoi+CPhjgTSI8lajEqCsXX3H82UG/FVxbxQafSod+J59C01Gz90HA+emqhrYNVgrotHlOedyrY2KWRuJIDluYlkYUEr051k9hurwQi8RfebHm/svP7zE3r8rXYbgFgLYosQY7xYWjflAf6HhxE2xGxeaMt8NPLNoOIlXRBqsrdyQKcZzBrvB2Ie4H+6bcYHDdQSvm3CrjyxrjIDJ/5NgVeZPi1HugZ4myanFP5bM16KLkpjdSX9z2djs9iqzJoopA8h8G4uXLcysly6RDrbybVnIXKv56qr24B6HD3kDmyzcKrcyo7CJucw3DCqbhgloW3kqt7yv2O5aN9W3yTwHHBEwt1tJ62X+vkeUwYMLaejlB4nXA58DqW7JkI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(366004)(396003)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(66556008)(26005)(41300700001)(2616005)(38100700002)(7416002)(5660300002)(8676002)(8936002)(66476007)(66946007)(2906002)(6512007)(478600001)(6506007)(6486002)(316002)(6666004)(110136005)(36756003)(86362001)(31696002)(921011)(31686004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlhLcFdHRm9hb0hnOFh5S1BXS082bmlJcWFyMERQc2kyN1NpN1BzQzE3cVNO?=
 =?utf-8?B?a3IzdkRvSnNKbUx4S0xNQWFHR0JBeDFFT3BtVjdpeGxlZVMvWVc0T2sxTzEv?=
 =?utf-8?B?dXByS3FNTE9HODAyTVI2VnF2dVd6eC9tcmV6eHAwenNIN1Njc0VFanEzM3Nn?=
 =?utf-8?B?WVlIYXMrakhnWW4yVEhoVm1NRHh1bndxOHJ5ZHZFRjk4UmNiRnJ1elc5WjVm?=
 =?utf-8?B?MnpKb3oxTDR5SXZCTENEOWt5T3JRQVBrcnFub3hhcWdWMGlQM0NsMVZROExy?=
 =?utf-8?B?Qjg2VzJQa1JRdml6MzUzeG9aVllCNDdVSVowbmdxQkVvbStwVTNwRk5YQksz?=
 =?utf-8?B?R08raDZHc080WUJTRmtsOEg3QU5LL1g1NkhmSS9VRkhLZm9tbkRRT3pqN3Vt?=
 =?utf-8?B?THNCbUUwd2ZCaWxPTnk5Y3pseHU2cTVPUHJTVEdFbDUyYTNDdTdxRE9qcDVz?=
 =?utf-8?B?dDJjb2h2U0xNWEJtL3U1SmlleTl4b2ZaaXh5MG5HdUI3RW1mVmp1eFNvZ28y?=
 =?utf-8?B?UjkwOXFkcGhXckZhVGhkTVgrYjlDUlJmdVc4Q3VHeGpzOS8zc2hKeUVCTnFj?=
 =?utf-8?B?ZXdxR09ydmF6TUR2VU5JOTYzMkZPb2ZxOVNybkdYcTFoNDVybU4rV1B2VTl3?=
 =?utf-8?B?cjdNOC9LRlFneVd5TkhDck9oWWk1b2FKK2tNNmZOWThIN1pWcmZGMlc3aW9H?=
 =?utf-8?B?dmRlcXhZYTBxNmw0TmRqeGV0Qjl5alFQdXRRTnRqclZKcHVlaExEMm5sdkFI?=
 =?utf-8?B?YjJPMTJjeXBUSG02WmxqS2FxQS9PTzdQVzRzalRLUDVhaWtaaFE3K0RweThn?=
 =?utf-8?B?YVpWRkN5azRFY3lGUDZnUkZtN3lac2VZVmlNVUdsNWg3TGZoNXhEVXhsNG0w?=
 =?utf-8?B?SzRiUDVBb1V3cktFSnJSenRVQUZSa2xoTm1yM1ZrUWpnRGNIcnpLUm9HUDlj?=
 =?utf-8?B?eTc1OURGZkxDV2I3YXlvUzRNaXk1WjhRaWZNeXF3Q1RqOTJkVUlaMVhLU2RO?=
 =?utf-8?B?a2xqOTJNRDVFMm1RQXBkVFU2em55TmF3RkxaTDE0bE40MCsyNmxBaUk5UTJ4?=
 =?utf-8?B?VVpnUm1xdnR3ak50R1JzcXl1aVFJcWhDTjBhYXBzZmNYUXdtVFlnaEFJZ3R4?=
 =?utf-8?B?YmVyT2NIcnRDTC9vSWZybXBjbjZ2MytxWlZOWHZBZjdhakR0eUZ4dXJaQTVp?=
 =?utf-8?B?OXVhWFpCZjBFbTVVMHdRVHpVYW1Nekx5TUxxcE9MK1ZvVE9rcHpEQ3BVTnNP?=
 =?utf-8?B?dE05ZCtIaldvT1BKV0FqSU9yYXlBcmFRaFdJNEh3dkpsMWRFcjJFRTllRUNx?=
 =?utf-8?B?Zm5jU3NybHJZb0FxcXlKMWppeXN0SzMzaGE0SzIrWlBMZ2creGNGT2NiWVUr?=
 =?utf-8?B?eUJ6d0JKTStvcHk4REl3bmQ0VGcrQmhaM0xoODVsQXdxb2E3QjY0T3hMbFBZ?=
 =?utf-8?B?Tnl0U3preFZhbjZROGwzNU1TZVpwQVdBU2lDMzIwYm5KQWRTcWcyR25Uc2VG?=
 =?utf-8?B?VzN6TFVLMlAzYllZeXVvNEQzanNPL0RGK3dUQlIzWm55eFQ2NUFMaGwyQVpB?=
 =?utf-8?B?UnE2WXN6VnRIZGptSmt0aWE4cFpxUG50Uk4xcHVuWTZlN1FaTFBxTHpyU2NO?=
 =?utf-8?B?ZVlsblRQWkVpQXdReUM3Rjg0c1VwaEovY3pSNnJ1QVQzZWIvRTA4QU96ZUJZ?=
 =?utf-8?B?WVNmbzZjVmR1R3o1TnBMVjlBMXZYejNwSEZjTU5yM2MzMzlFVllSQS81cFp6?=
 =?utf-8?B?NFBnVklWN0gzWWtRU0N3cS9DbytFSnBJQ0xOb05KdVZRbENHTnFqMG5LeWN6?=
 =?utf-8?B?Ym14ZjQyenpHamh6MXlrQkpQQU9UZXlPYUNxK0JJY2JXUDJpVk1IYmRDUE1I?=
 =?utf-8?B?Wi9nbnEzdGZVRit5d1NYS0VmdHU5RklFbzhYd2F1WTdiK3kwZFlTR0w5aDR1?=
 =?utf-8?B?TzY3dlhzRGNyNTBmbG9LODFsVjhVNEJpWXZhRklacHlSS3pIdDlxK1hrdk1H?=
 =?utf-8?B?UFJTNW0rTlVvUFdDK1RibjFreEJBMjdUNFkySmkwSGZJRFAzc3dCOVNjRFVi?=
 =?utf-8?B?d1dSamZ5N2dsRjRBeUwxY01FRzBlRithYUpYTjZZdHBycUkvYUZBR1h4YUQ5?=
 =?utf-8?Q?82cb3z6fhJIAMyMj3sZISMhoY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d45c2881-cef9-4685-833a-08dc2d7c68f3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 16:45:54.1696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cc3Xn0QhcKHSYh+vNzdFn5Pz/xqCf0rY2ePZiV6K/wsK41QBAGGrBxBPkvdEWS8y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4938

Am 14.02.24 um 17:38 schrieb Pierre-Eric Pelloux-Prayer:
> Le 14/02/2024 à 13:09, Christian König a écrit :
>> Am 13.02.24 um 16:50 schrieb Pierre-Eric Pelloux-Prayer:
>>> amdgpu_cs_ioctl already exists but serves a different
>>> purpose.
>>>
>>> amdgpu_cs_ioctl2 marks the beginning of the kernel processing of
>>> the ioctl which is useful for tools to map which events belong to
>>> the same submission (without this, the first event would be the
>>> amdgpu_bo_set_list ones).
>>
>> That's not necessary a good justification for the naming. What 
>> exactly was the original trace_amdgpu_cs_ioctl() doing?
>>
>
> trace_amdgpu_cs_ioctl is used right before drm_sched_entity_push_job 
> is called so in a sense it's a duplicate
> of trace_drm_sched_job.

Ah, yes I remember that I wanted to remove that one as well and got 
pushback.

>
> That being said, it's used by gpuvis so I chose to not modify it.
>
> As for the new event: initially I named it "amdgpu_cs_parser_init", 
> but since the intent is to mark the
> beginning of the amdgpu_cs_submit I've renamed it.
>
> Any suggestion for a better name?

How about amdgpu_cs_start ?

Regards,
Christian.

>
> Thanks,
> Pierre-Eric
>
>
>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer 
>>> <pierre-eric.pelloux-prayer@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c    |  2 ++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 12 ++++++++++++
>>>   2 files changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index 6830892383c3..29e43a66d0d6 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -1402,6 +1402,8 @@ int amdgpu_cs_ioctl(struct drm_device *dev, 
>>> void *data, struct drm_file *filp)
>>>           return r;
>>>       }
>>> +    trace_amdgpu_cs_ioctl2(data);
>>> +
>>>       r = amdgpu_cs_pass1(&parser, data);
>>>       if (r)
>>>           goto error_fini;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>>> index e8ea1cfe7027..24e95560ede5 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>>> @@ -189,6 +189,18 @@ TRACE_EVENT(amdgpu_cs_ioctl,
>>>                 __entry->seqno, __get_str(ring), __entry->num_ibs)
>>>   );
>>> +TRACE_EVENT(amdgpu_cs_ioctl2,
>>> +        TP_PROTO(union drm_amdgpu_cs *cs),
>>> +        TP_ARGS(cs),
>>> +        TP_STRUCT__entry(
>>> +                 __field(uint32_t, ctx_id)
>>> +        ),
>>> +        TP_fast_assign(
>>> +               __entry->ctx_id = cs->in.ctx_id;
>>> +        ),
>>> +        TP_printk("context=%u", __entry->ctx_id)
>>> +);
>>> +
>>>   TRACE_EVENT(amdgpu_sched_run_job,
>>>           TP_PROTO(struct amdgpu_job *job),
>>>           TP_ARGS(job),
>>


