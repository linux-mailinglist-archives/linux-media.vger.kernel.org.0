Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E933D366603
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 09:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237037AbhDUHDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 03:03:19 -0400
Received: from mail-dm3nam07on2058.outbound.protection.outlook.com ([40.107.95.58]:10273
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236975AbhDUHDF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 03:03:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEwawST47iRuJPoy80yB+UlqnD2w/SBHvUIQMnx15jqPWrcQyltQxKRv/G6+DTMYcjOIZ0HM9K6Uwh1O8Jt/f08jh+3OsdidPTDQ5ln2hFc5E3p2AjJ0cs+EdaPqkPTXPicTM9PST6k3vYx4jtfClpMFVcSKiJ4rpY6RbQu2i6SuAddMVH2UI/wDymsjWuEsH7Uvh6kSxB+1OTMVvIIa6aWMLaEoKUyh5nM7LK59o45VQJMgLYNl9aA62pvpl1hfBxdRFIk2Eh0gDTSTA5X5xGxOkdlOixEFfQGNSmRH3cRCD4/qQ0RdV5vj0jWVxQtdHiXqfLFjSYLmr+Ql+8Srjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlEN4BvQVyswTO0VQn6jEiqqLMW3lnZUqrdUvRunTsk=;
 b=K2cQuibSJ62jxSe7LXWRnUHS8LkW5pmEVZofF/dL2U6uPcZsPJCTdbQo1fDgaZrXP3Cs7N7tTUn6ppJ7SmoFv8ZFNWV1KsChdxEwWtTUMhh7dRH2PQtEQVXvzZxfvKsLuxwLzCFi+yGOOVD6Zm5HC2B0JpGkDZsaaQoQwbSqkq4DHRRo0QZzSzcTYocLQvL8spK2KVa17jVdOGqyk2A6rR5S6CJCS1yR1vMRZ8ZtcV8FmVtvNK6DwU99pjcnYAhFjGnjme8IKVw1V1/jUHZgDvMoBNc5sxe9o0B0zGVd800DtIky/gqd0xLnrVOc+H7qtPzxxiFSBKYhjbvWFfNnOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlEN4BvQVyswTO0VQn6jEiqqLMW3lnZUqrdUvRunTsk=;
 b=ZGKanLmc9PZjWzZ2AUATzI3rzndbxNna5rzQ9sI+l5zPFVHoioN9A9PSbfkSCZMnar4syeKAGLnYJaCzKPLFNzRBu9w1NObckdYLAdNc0afyOBYYGXcm+hcggZ3RjcU6doBzhIZ/bfEn4JWUYdl9CZz6bWkR/S3cXAcva8ETo4c=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3951.namprd12.prod.outlook.com (2603:10b6:208:16b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 21 Apr
 2021 07:02:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 07:02:31 +0000
Subject: Re: [PATCH 23/40] drm/ttm/ttm_bo: Fix incorrectly documented function
 'ttm_bo_cleanup_refs'
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Huang Rui <ray.huang@amd.com>,
        linux-media <linux-media@vger.kernel.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-24-lee.jones@linaro.org>
 <5035dd00-45a9-80c0-7bcc-8035167a8e0d@amd.com>
 <CADnq5_Os8LjPoj7_fim2x2RqMhySSUT0BRFdMfd8AFdAjGkhTA@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <14888522-b8b5-3be2-9af7-b876ad85feef@amd.com>
Date:   Wed, 21 Apr 2021 09:02:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CADnq5_Os8LjPoj7_fim2x2RqMhySSUT0BRFdMfd8AFdAjGkhTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:30c1:a1b7:433d:2c5d]
X-ClientProxiedBy: PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:30c1:a1b7:433d:2c5d] (2a02:908:1252:fb60:30c1:a1b7:433d:2c5d) by PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 07:02:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c1b4281-3f5d-4cf8-a2a5-08d904936eaa
X-MS-TrafficTypeDiagnostic: MN2PR12MB3951:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB395154EFF5A6B9FD0C0CCF8E83479@MN2PR12MB3951.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GA8OYMbNE4Cw1IZ5fRGNvBV99yF9saH3/Yp0j7APsl72ofsj0ty1XwMXm03s8NVrTxHhRFjwZdJ8UB1GMSbP2eAHiNclpyxEnhz/Ls+jFSHlNVhDYFZar9guyBxurXfqPJ5vf5fMh2+QCeSppHN2fhQXxhbJK5oZD5R+PtVTHwQAqt7xixkJ2Abq4jRV+ceUwN4eOZmp1IEiBq29jG1+5Yjr/Vq67Se+EGIJyL+iMyiPi5uNYRcdxRPLLVWuTrYoQCfEE8+ZJZD4SQeP9QYFsQNp16w39hL/WFLYS+91X3ngePKERuCWo/8wqFn0955/RbASuMGnHgiXqfSWtq28HugLEYMCYCYSwvRfs5Dn3iDOQW2ZAoRtDnhzbBQLiADPAQ4+2x7V7nPenYe5kHLyKD5ImOhE5ozw9qlNskfXritExZGwr5q3Gmgy4NUAHsSp+au+yJl2WIVOiB9hnsMY6o+0AbJ6+gS4LyJKYbwqTgRNrN0Ayml+vxZ0OjOhLX2sl02p1GtTJh6no4akJvhnXI6ME/x3KygQnfFdMNoqHLxLM7PoEfMXUmrz5/S6LdyjJ9hL6ZYv1NAeKKSSA0NdL/0wkZd91rhdS2+PZFUajdwcsPcWI4UmMDIgsxza8Hgwll+NmHwicHN5qE58M2mmtQxeRTmiGdDd2lESO5Njaeiuzjii4aufxG2HDJVH7K3qFhPRrL/O+B7AiVpWiPmgvd/SNglwV+VmMUfKaSBXFxo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(86362001)(6916009)(38100700002)(31696002)(6486002)(8676002)(31686004)(2906002)(966005)(4326008)(66574015)(6666004)(478600001)(45080400002)(83380400001)(54906003)(66946007)(66476007)(53546011)(5660300002)(52116002)(8936002)(16526019)(186003)(2616005)(66556008)(36756003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NzMyOC9lWVRIODBORDNvbkVldU93QldHMnUyYlpwR050djRrUWpBZVFZYUNn?=
 =?utf-8?B?U1JnQkEyNk5mK0VEVFB3aFlIa3V3dEFRV0haZnNtVzZ2bWZ4UWJoT1EyK1dr?=
 =?utf-8?B?cUdzcGZ5RG04VzJuZTZWeG5MZmJLcG5CTUw0RmFDb3BEWVdTUCthd3lKQlll?=
 =?utf-8?B?WTczUk5EUTBML210UWJMb1REcFZoQnk2eXlWZzVhdkFOZktFY3NzUEdRRm5l?=
 =?utf-8?B?TklxWXdjc3RGL0FVdDNQQjVhZE1mckV4RjZxR1U0Z3Jzbk5UZ1VvckN1OTY3?=
 =?utf-8?B?YWo4NG1NMGRqN2JyR21lRWRlamhxVTRZb3k1azRFemF6cW5sYzE5RG9wVUlv?=
 =?utf-8?B?TmdxaFdxR0VFdmM3SzlUSjA2SnhVUWQwYjlnZHo4eFhPbW5MR1dHdzVoN09K?=
 =?utf-8?B?UWxKM24rL1NzZnhKNmVuSGRNb2tSVHNjemRYUHdNVEcrK3duMDlEMlRBVzRR?=
 =?utf-8?B?NDYzcy9XcEJRNmRJZWJYRnJNOWRQVDQ4VWlhSEwvQ0JGYUlVME9PNzcxOG5R?=
 =?utf-8?B?eHkraEowc215dnVvQVhXM0lvM1VoS0NKejF4VlQ4MVFYem5QMVljamw3VzRy?=
 =?utf-8?B?ZnlJelRvUnRwSnJkTmtYbUw2RFJ1ZWhNT1ZPcFRTY0xpVWlNbU9WUWRNZmll?=
 =?utf-8?B?UUlCc1EvL2VkbGhFN2oyMUZwK2d5bUhCNGFYNExzNmhXbVpJK0RoajRXMmZH?=
 =?utf-8?B?UW1QMnhtYlhZTVNGdXgycU5pdnYwT1JLV2F6Ri9XcG5vS2NFYldEK2VOaGF1?=
 =?utf-8?B?eEZwS1RMbXhwV0l0dC9hZFpBOUFjbm9HNWFTMXlOamFGKzJZY2ZrNzgzS1Zr?=
 =?utf-8?B?UnVoM3RrRTFPaFBodCtSREZSR2paOEhNMVhRaGN2N2N6SFFzdGY0VGRCb0Nx?=
 =?utf-8?B?RTJWNVUyTmlkTzdvaVBUamhUN2FocG1jT05NUmhUdkNhTGdTTEtyWDROSUhv?=
 =?utf-8?B?clZlVGY2K1lWb1NZYm13cmd4UXR1aUwwVnRwV3RXRG12RmNsZloxb1VZMnhv?=
 =?utf-8?B?azdnclpPek9CWFA1a3k3dTE2VDdUZGZTRDQxa05sSW00ejk4VTlTMGE2ckRt?=
 =?utf-8?B?aVNpcFA2eExaVnRTdThhWCtITVRBTWl6ZElVUzBWQnhGZStySDluUDdOa3Rk?=
 =?utf-8?B?ZnJzV29KZE56ZThrMzhzZmVqdTRidWFmTC9yUVFBeHhidkF6cnRZUEk5ZHBx?=
 =?utf-8?B?a2I0SGZXRHpiNEM0dFdrNnhFYUdKUlJ6NTBXbnpEL0IySFk4d3JJWGw4NU5S?=
 =?utf-8?B?U2h3ZHVRM3E4OFZ2TmJxSVU2UlU2Z1puK3BvZ2xONWVtUjMzeXJNYjJWYkYr?=
 =?utf-8?B?SlVrbFBpWTU2MXArSG95UzFQdlBwZkl4U0tiT0swdDhVL1Nja0J0aWdLMzFa?=
 =?utf-8?B?WWJRTXlScURCeFROK3NjSTJQRHZjbld2MDFtSUJwVkNrTS96UjhuKzJKSThY?=
 =?utf-8?B?WWh1a3ZEK3lmdGh5Szd4cWpNZ1A0ejhsQkVHZVVUZGxxRmpSejNrNStJUmJx?=
 =?utf-8?B?cWJ0VjJxS0RBdm40MVNhRHdSbGhrL2ZVK05ZT0JxMm13ckFYTG9UM25PcmM1?=
 =?utf-8?B?dXlxSmszQXFQaTNDRE1QM3FwLzZ3azVOSHBVazgvczArS1p0dGJHQzVnbWdz?=
 =?utf-8?B?a3JUY0ZwbjNQZWhZQ0dzbzNYazlaN0Q4N09KMzdyOHVFa3FxRXUxcUd6Mm5B?=
 =?utf-8?B?QWFRWDBhYTRUanFFdHNDRXhQYVEvOEdMMVRwdkRVelFPVjJBMTQ3dHNTL2xw?=
 =?utf-8?B?OGVwUVhQYm1vSVhSZE82L2JVM0VweXNaN1RRV2ltUGtOVnZXZHo0SThFelNy?=
 =?utf-8?B?SFBpV2RUSW5qejFsREhNREpoY1oxZ1duaWxHT1BnYnl2ZXF5N0V2ZnVUbmZK?=
 =?utf-8?Q?Cb0nokSgbkYQ2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1b4281-3f5d-4cf8-a2a5-08d904936eaa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 07:02:31.5704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9b4NC47mbucaDqt7vWouUplyyFuBZnjZa4kd/AM38x4VhlNhRyIpkZjHf30cDFX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3951
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 20.04.21 um 23:27 schrieb Alex Deucher:
> On Fri, Apr 16, 2021 at 11:32 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 16.04.21 um 16:37 schrieb Lee Jones:
>>> Fixes the following W=1 kernel build warning(s):
>>>
>>>    drivers/gpu/drm/ttm/ttm_bo.c:293: warning: expecting prototype for function ttm_bo_cleanup_refs(). Prototype was for ttm_bo_cleanup_refs() instead
>>>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Cc: Huang Rui <ray.huang@amd.com>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linux-media@vger.kernel.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> Can you push the ttm and sched fixes to drm-misc?

Yes, Daniel already pinged me about that as well.

Christian.

>
> Alex
>
>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index cfd0b92923973..defec9487e1de 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -274,7 +274,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
>>>    }
>>>
>>>    /**
>>> - * function ttm_bo_cleanup_refs
>>> + * ttm_bo_cleanup_refs
>>>     * If bo idle, remove from lru lists, and unref.
>>>     * If not idle, block if possible.
>>>     *
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cf8fdcfa489074adeaf5c08d9044311cc%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637545508403690573%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Fq7MSyZmno%2By0o%2F%2BLO6NjM0C0%2BnKA2Ml2oPMmcJJ7AA%3D&amp;reserved=0

