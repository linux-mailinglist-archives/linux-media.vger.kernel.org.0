Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F08362475
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 17:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235380AbhDPPxB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 11:53:01 -0400
Received: from mail-dm6nam12on2073.outbound.protection.outlook.com ([40.107.243.73]:39776
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234312AbhDPPw5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 11:52:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjOpjToFKvYdpQaeWi4Ptv50TNAGJvkCBgfjVCC1P9ncMl/sgPz8X+mB+sBrWBkVds8t1/KTLb8SAbdD+hX6z+N9PtqTVWEIdblLtzN5YJ+vMpYc3OLdEREExNQma0jwZWjM6BrVnYQsipg5TMlcSDIZ1588n4BsPdM6G3tXviVrNMYHeAyugaxwX0/Hij3rskF7PQF6tfBJ/j44+FJZ9qZaBSgSzYu3t/XFU4zrjsOKgdBTetaK3WD+0ZdMTHxZPbI9Xat75+3K5tEjbMF+PqX0JD7Pf6b3wywPVbuQOhP+zdFxy0B3WBasjBD5HjNZyK5nSf3DHBArBS21KOxHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dF6G+gFBN9ury3aeIcVISgR4tEDopdz8tIiAp89PtCQ=;
 b=OVU3FJT0QFaFKEc8ug4gq/mi5jsZBHRv/4rrsqoTU4kWsxdg5BSk1Je021zw8Qbsj9c/o0KAqr3dKHMwVfhd62fbkWXJU5C02Tsw/DYWeerKsxa4s1swWQb3whgdbPv95p26fK59QKZXpx5zSggHYExSgevUHIzwroaFzkeT7oKyMe6Ij6Xftt0Ckgk9EWSdPLsxhLHog4f5qz8kjVViy0uOVhnYfaCLWjIIjvieRaqVq4as1McpDCCwoAUgrs9s4RXeUXD4xL6T8Rsd3E0vshu1GkmmoQNuGrqGoBbDCJetJEMN6VbUWsi3ybM3af4JTx+Qkq5r/55gmrcM9p0tlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dF6G+gFBN9ury3aeIcVISgR4tEDopdz8tIiAp89PtCQ=;
 b=NlCvJr/g/bbWvf9bhnTTEW3Khx7HjIOdNSYhPvwyYIx1xzTOxUMNQpsuek7HQc5lgVv40gn37J05JVk8Ob0dLYuujUvQg4/lOqUuPmZ6rwZd09kVyzJpbCMH8iq99qACBBXnb71xEoRbTsCvDeBp67CGSFb2o17yfH0mRtHnVHI=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2484.namprd12.prod.outlook.com (2603:10b6:207:4e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Fri, 16 Apr
 2021 15:52:28 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.025; Fri, 16 Apr 2021
 15:52:28 +0000
Subject: Re: [PATCH 29/40] drm/amd/amdgpu/amdgpu_fence: Provide description
 for 'sched_score'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-30-lee.jones@linaro.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <dfb153eb-53cc-ad27-2114-c0db07610a60@amd.com>
Date:   Fri, 16 Apr 2021 17:52:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210416143725.2769053-30-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5d8d:1198:63ca:8fe4]
X-ClientProxiedBy: AM0PR01CA0175.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::44) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5d8d:1198:63ca:8fe4] (2a02:908:1252:fb60:5d8d:1198:63ca:8fe4) by AM0PR01CA0175.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 15:52:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b6f3edd-e56b-4d6f-1b3c-08d900efa2f0
X-MS-TrafficTypeDiagnostic: BL0PR12MB2484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2484AB52D219B87DC7BB5AF7834C9@BL0PR12MB2484.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3GoGCZrNuASO4NZPMi84K1MavclE7oQauiLLq1ehY8XP3uXH5+SZfJDP2aHnly2ZiPgXB4Rs6IOpvfMouLLlQHqyPto6S7h5cdfeQB9ae4wncY1s2AjbeR3FTJEYxKZ/JbmrueVwDIgwoXPkPhXRx+X7ifaBxRhUKMg3JU0hZ3sKyvWVvRRsQu2lBCnjimWJ9p3SJeQ3Avfu9kFBUAZILhICLduArU+YiuoAQv4hYHUhfSQ307GDr14SBnw2M52wFi4sSx/IAIoXR0srmap4xoEOn8aD5GYxnPpTWDEq2/QKd2ndKmxJ44EP7TgjSXBCy0IlJU0EQPfWj9Gxtc7sp1EhUW1ZxEnCdIlQLxjr8PgxBbuNZsSL/HS37NrcPnNRAUFfAyO8t6LXqM1s1lsc05hziVh7XSEI6sNwSSzvB6M4KUxQXkhmlAyGL8ZKSFGcJxv/uYfAwWZWRxlUtzr7I6DM9+e4qCTFd78OpzDjt832z16X5SG3KPMQUbX3T5j+aHo7AINtNpWfUhBw9DelTTEqH+LUzakPit2uxUMnY11eCyqQMkL6NloZpTMpjzQ99N3y1en66oXZwlkpuzRQTAX3Ep81X/XIEiiL0z9N242lpnQ1gaon3qvP9Z1MCnwXZP5jNybxc0OvCZd+Hsc8tPS2JJzS8DF9UNlme/A7Umo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(6486002)(6666004)(66556008)(31696002)(54906003)(2906002)(52116002)(66476007)(2616005)(38100700002)(66946007)(8676002)(316002)(186003)(86362001)(31686004)(36756003)(83380400001)(6916009)(7416002)(66574015)(16526019)(5660300002)(8936002)(478600001)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VU9WMWZpemZ5RitYVFczN2ljVnV5T0FmclB2RFh1Mzg1Sm1xV3dqUjJqWlRD?=
 =?utf-8?B?OTBkL1RYUjlzZmVFWFZPVmVtNXg0aTlxOWFxNy9FVENZdmNUdUVVcGpucWhE?=
 =?utf-8?B?cEhuL090QkV3dC92cWZTRk1iY3F0ZDlwSWpFcEpLcW9CVE1Kc1NIRmdvbE9G?=
 =?utf-8?B?NlFib3Jac3hmQVVXYXM4Z3NoeHVUM0RFM0R4MW5DS24xYUZ0aVVoRXdPQ1Aw?=
 =?utf-8?B?RlZCSUIybnJPTXR1QU5yMFduL3ZrNXQzZ0JnVVlSRTl2NFpLeC9jSkhpYzZY?=
 =?utf-8?B?Syt2azkybi9OdzRhUy9WNmZkWElBeXpETGFSZEpmanhqaFNsQWVqY0dIZ3dZ?=
 =?utf-8?B?WWh4My9MN0dCQ3NMaEQ5WDFzNklCckZ1bmRja2NJcWh1WnJNM3d4ZGxDc09j?=
 =?utf-8?B?dWh6dDZWZURMVTlkaTd1SWhOQkQ0OE5YOXA0TDRZTU9rU0FqZlNDZTJqRTR0?=
 =?utf-8?B?alZXd1lmZWZKM1NCaERNRXZoaEt4RmVMSXVrTjlRdm1oeDIrNUk1UTFkZlM4?=
 =?utf-8?B?cXBscDIva2FGZW5ZRllrWEdsUTk5amRIQXpzZ3o4WHU5cjdBTllGYUExazBX?=
 =?utf-8?B?NWpSYjBkQmlaSFcwZE52R3cwVzQxZmZXYnNDTkRncHM2NEF2NzlHeDQwRnRL?=
 =?utf-8?B?K2lSTXh6OXNvbDVNTEdNdjZUZW5XY1p1VUNyaW5kOWYrWWthcnFmZCs4ZlF2?=
 =?utf-8?B?MG9UWmRITmhxSlpncUtiV0l3aFByOHpvajJMU0EySVg0TmZKc3NtdEZPM2Yr?=
 =?utf-8?B?QVBabjlFNjdsenpiOHNhd0pNMTJSWjZSQmVVVTRFM0tLVUFJbjNYbVB0UW1U?=
 =?utf-8?B?alUzeUN3NEJFcWZWcHZZdHZweHl0MTEwb3JkOXhZYXdSekExVi9kZERjWnhN?=
 =?utf-8?B?TXpidVBRdmpHdUY5UjIyeFBJRlhub2tobEZzYzFxZUVYNnBKNnFpYkhmT290?=
 =?utf-8?B?Y1F4LzFFZjc1ZzRzUW5kZlRMMnFnN1VDWElKQkNhRkpvcEppTklwcU9oaUpV?=
 =?utf-8?B?b2dZVVR1MkMwcjg0anVLSWxnbVVhRnhZWUM3Wm1wTGdJNW1QaGpJZXRocmlJ?=
 =?utf-8?B?Q0N2MVl5MWRJZitDNzdBai9CK2JCSlR4NFBWN0JRNlg2ck45ZFFDL3gvOVAx?=
 =?utf-8?B?TUFHSFVBOHNYU3VsVngzZ0RHSzNYbmM3U2QxaU1ORzFpbjUycHNONThmNFIv?=
 =?utf-8?B?Q1Y3Z3dmSFY1UHVJOW1nbEpwRkhwUkd6cnhqUFRBRUdWenBLdkF1L25lVEVN?=
 =?utf-8?B?b3kzcDJUaFB3bE5uUFg4ZFZ4ck90QTNzM1lTdzFaSzlHNGg1OGl5MVpZdVF2?=
 =?utf-8?B?K1o4bGRDUFNmY0l5eE4wM2RMdk1qVS94N0x1clBGaWVqNUtyUHdFRnNXUDd5?=
 =?utf-8?B?ZmdMeFRVRlJCMVVscjRmR3lFTDIwOC9NS3J0MXNnUXovVjN5WkxVN2ZvdW1P?=
 =?utf-8?B?N3cvSUxDUEtrWThjSzdRa0hVQWxNamhTUTF4aFcwTEc5Ry93T0pPK2VtaHZJ?=
 =?utf-8?B?N08rWTgwQ3FMWEZSdy9Ydm1SdEV4QXgwUDArL2NkblhWZkhkdzBMeVkwQ1Fh?=
 =?utf-8?B?WitaUWF6ZjhlZFdTQ0o5Mk5SVHMyZHY3cXVlQWRrSDYwR2xtL3hCNFhSWUpu?=
 =?utf-8?B?ZmlYUi9WNVpLeElvVE83Z1VSTDZITVFOQnM4bEs3L1VvNXRsYktpckFYZldV?=
 =?utf-8?B?MTNhVTFGWEhweHFON3pHSi9MSFV6N0pWRytMMHZXOWtibUNoamhXVXZXb2JM?=
 =?utf-8?B?Zy9hSDloR1NtcFA5LzZZS3RaVklCNWZDOE1YdXplUHlSZFF1ZzRwdXlvclZO?=
 =?utf-8?B?NmFrWHl0OUpCMlJnMnd3NFhHOEVyQ2hZV2wwQ052RStGd0pnWVdCUVNPdzRG?=
 =?utf-8?Q?RJ92qji2d4//R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6f3edd-e56b-4d6f-1b3c-08d900efa2f0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:52:28.1543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goD6zZOxlLLH+M/vtpViFPinv/bhaEc0I2lp7MQmj6gBUFBeJ2diq/feFWXwfxmt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2484
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 16.04.21 um 16:37 schrieb Lee Jones:
> Fixes the following W=1 kernel build warning(s):
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:444: warning: Function parameter or member 'sched_score' not described in 'amdgpu_fence_driver_init_ring'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Jerome Glisse <glisse@freedesktop.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 47ea468596184..30772608eac6c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -434,6 +434,7 @@ int amdgpu_fence_driver_start_ring(struct amdgpu_ring *ring,
>    *
>    * @ring: ring to init the fence driver on
>    * @num_hw_submission: number of entries on the hardware queue
> + * @sched_score: optional score atomic shared with other schedulers
>    *
>    * Init the fence driver for the requested ring (all asics).
>    * Helper function for amdgpu_fence_driver_init().

