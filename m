Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF42C315185
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 15:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbhBIO06 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 09:26:58 -0500
Received: from mail-mw2nam12on2074.outbound.protection.outlook.com ([40.107.244.74]:39008
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230269AbhBIO04 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 09:26:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTmp17i4TX2FSm2RIztCXU+ktQlhfomWlsHPuY6Nkd64NCrkcnsWfLefCt+uXSVxJY/yutlpen61HAG58Cc/HaWtSfvgIXbxET99whGMaM1WTAbqcjhOAd+Xm16s5MTsyWsCZDXO6JT28hEQoEmXIGUGg8cuV7/e6K4kFfhqCx8NN4QRBz9r9+leJ3m1RPWCPBbaT8tglANG+phXQX9qAGvbGjKiHWwX4i/DYIEVQl18lnjnnG5F6gntE+1AgXOITxXB+6QvXkATbF2hsKZ+BpMrUCYZ76tsdPaKi9wfdHSAp3ukX+VFb/KmAaVjRqPDOTDDihFDQm0T8VNA9nQqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDvd/VnOcvi3KlTpZQflahw8ROalMpMj+jgJO559s3s=;
 b=FAI2nBq8LNauZB/8EtNQ/Pl2abf+4lE1Abr5nOSEXxlDFLOX07Rhyh63SAFCkJrUFEBdyOWATShUWWSbCv3lrp9cHNQZzQM1UUH/l4uLraVEMJlyCgNdDvdpkuUCyHSz14Lvqpm5MKH/zy1pH0TsCLBHqODWjQmSB4C/DFbFq0H0PGxFitz6E0jQXgtQocCEbpuRdSa3PSIMBi61YpnhmvTRegG3hZnmOGhTg4l+i1Mb/nJOVm11/wa5YwXEe7ESSMClSMeCDaLsJ2uYmensbMWmQp1RpbC5G01moAP/L1tk46dvoqQKAfau6LVKZ0UctAq8o8RovkJ4JcV9Bpn8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDvd/VnOcvi3KlTpZQflahw8ROalMpMj+jgJO559s3s=;
 b=v6d+AYEg7AlDyJY9YqDSss8I0MYia1fFGcyPq/jmYOBUzSp/NBeT7xLKgEwriSUn5VZ+KaD110AhWvm5QFezXiWMZJ96SpEAXZRUfEmspmOaLeGWqbj9VCyCbWVR33CEbH0byoLTDP5ScmN4FxKqtGG+gIYcnXA/xkgnoaC8StQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4657.namprd12.prod.outlook.com (2603:10b6:207:1a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Tue, 9 Feb
 2021 14:26:00 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%8]) with mapi id 15.20.3784.022; Tue, 9 Feb 2021
 14:26:00 +0000
Subject: Re: [Linaro-mm-sig] [PATCH] RFC: dma-fence: Document recoverable page
 fault implications
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        "Koenig, Christian" <christian.koenig@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jerome Glisse <jglisse@redhat.com>,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
 <6d373177-2645-1d67-9c14-dcad87c4f4d9@amd.com>
 <68740fcf-530e-b929-1c98-5810fc97ed23@linux.intel.com>
 <1e38efbc-ec52-e436-21e4-49a0d074b57b@amd.com>
 <18e7efbd-3d10-5ad1-49c9-7e26f0a27ef2@amd.com>
 <c9c8d386-87a1-6678-b5c6-854de210d8d3@gmail.com>
 <65b7a61c-b4b9-a210-5a37-0f69d01f667c@amd.com>
 <CAP+8YyG1Yupdqvrp4uUunYkVeZvhWB4rojfAtuSwMmqXRj44oQ@mail.gmail.com>
 <CAKMK7uFwdmV007YhCF8ZDkzNFT71RapLPL5zHgjjsFd9huoUEg@mail.gmail.com>
 <d08c9a4c-e054-0f05-ebaf-94e05d98b798@amd.com>
 <CAKMK7uF-_QaQ+vvDPM1KEy34X3G5yfhmco290bmQyNSpSFSZbg@mail.gmail.com>
From:   Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <dc54e043-5f33-9f80-ef63-61e4a2184615@amd.com>
Date:   Tue, 9 Feb 2021 09:25:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uF-_QaQ+vvDPM1KEy34X3G5yfhmco290bmQyNSpSFSZbg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::25) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Tue, 9 Feb 2021 14:25:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 126342fd-2a2e-4e52-f9ff-08d8cd069f76
X-MS-TrafficTypeDiagnostic: BL0PR12MB4657:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4657933B7654DEE2422E379B928E9@BL0PR12MB4657.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2fwyosBrYQ+9XrH5RAkh3rpQ9wRK9Ac+lLdXOVN5auOxEJSQX7YSCgkYiRcWOpfOoVTMr+HXLd9OjpdGr4cr9KIOm5/LHy68CTMTLJ13hinNR9dOf5jounFpzsCpOtIExPBaUu+0TNrwwkl2M+V0aS/EYN2sFl7kkRhSGBoNhHzJzLN11keOXO06+mYfIx02UGJjWasOopyCYoFQFPEJ0CGojzbrpmWYecAylZPqT9P6QRsum1cHYy3zAYI/tTsOGMEZ7V5U8pu7i3ENCgo8GJB1kL6m4BVzGZr5IOh4ba+reAWjrUacIsTp2gS5ZhhMqDLTU+nCzOe1RToetRpC6GvWVsSUaA6RKQvg/Rez2y2fy2IG+K1WPkDjjAGXNE7+CPof2nNhmQoL35B8xBSyQfj5WE4EgF66U2bMyyT2bEj0bk3yfZ6DVeAATQrlBGk5UhPoIGEBEkHyRAOzEwPjefVDJV/g7TWVkBujVzsqZ9LWOkxsLIOjNal2jjhZU6014ybU84dlPgV3yMQ3P7kjpo3fzHgPXdtdQSjbDFvmNmIOzSE5c5k82f/OGXWGQ8ZBXAnxcIU5U9r+viRAzzE20iMPQkfwucUHMZbEsvQ9infbi6WRtWp44DTu3MU/8nw6CxYgoA1A4DUhvYuEyhepw+Y7VpVnn9lB/dwUPzf3WGXc88Q+evELFJbXJLlFCnOz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4948.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(52116002)(4326008)(54906003)(31696002)(36756003)(6916009)(6486002)(30864003)(31686004)(8936002)(956004)(83380400001)(2906002)(44832011)(26005)(966005)(8676002)(86362001)(5660300002)(186003)(16526019)(2616005)(316002)(66476007)(478600001)(53546011)(16576012)(66556008)(66574015)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dFhiblBuWHdKVWdYQ1hQVlFsc1lyeXhpNDYyajNlRlBmQ0orVDhITzBRbGpD?=
 =?utf-8?B?YTBwNGF5eWV5V2ZDZ2tSUXZXdHAzeERNOFd5L0JoM2czOWZBMmJHanRpUXZo?=
 =?utf-8?B?WGF1Y3Ywa3lMZWdlUzk1Vm03OXZuM0NiQXlBa1JxVi9ZSklaMGVZdTdSQi8r?=
 =?utf-8?B?OHdlOXdmQ0hYU1BpM0srdkF5ZU5QSFRQMjFpYzkvVzFsRHhqdDlkS0YydlNP?=
 =?utf-8?B?bjBnZmF2UjBQaXNMbzF4VFBhY1lxY01Ea2dBRlJWTzNieXhLTXNHZGZ3LzRw?=
 =?utf-8?B?MWNZWU1LdVpJWlFla1FveUNJQmZlQ1NXVkppRVo3c1ZQMiswQzliTUVFRVpl?=
 =?utf-8?B?MFZJMUNDMDBsRnVoTmM1Y1dXRmQyOHNEZlErWGg3WFppSUZPbDZuMUNLQ1Ra?=
 =?utf-8?B?emJjT2E3bTVuRnhhRUxselZST1FoM1dlYWY2QWxtbUxWUTJ0UDhBQ0NETm1m?=
 =?utf-8?B?alU3SURZNk1pZk9WUm9CREhQVVd1Sk9CaE5hSStrZXZZNjNRQXRyMzRTMmp0?=
 =?utf-8?B?WUVSdlVrUFFhbzlCSCtuMzdvMHRRanpTMlMxd1c3T0Vqd1U0ZFNOVVEzVzZ1?=
 =?utf-8?B?d28wREFSY0tRd0ZTNzNXdkNWbTVUMmUvVDdOa3ZjdGlVa21BdkQxQ1BJc1py?=
 =?utf-8?B?SzltaUErNWZsKzVCVVdtTjBxaTI2ZDNrV25pSEpwSHFGdzNuQXdPa21QeWFU?=
 =?utf-8?B?bU8zamxTOWJ6OTd5MWdoTW1SVUNqTzN6bkI4bm1FbUlQdUpJaDhBODBnQWNw?=
 =?utf-8?B?WmplSGRQZzhOVVdHcWd6ZGlXYUVRdjFEd2s0RGdORTYrbHVEbUpmT1VOay9i?=
 =?utf-8?B?RU9yVzlrRno5OGZadVdrRHhBOE5yRVl5WVkxSXNhYmxzRy82WmgzT3NXaHZp?=
 =?utf-8?B?a041MEcrNmtuenN3enI5WXFCcWlNTTJLRjlIRENYRS83QXpOZ05iYnk5QSth?=
 =?utf-8?B?TXkxTUl0V2wxTjlRS2c2c3dMVGhpb2NIRUtDeFR5U0xIOVRVdzdzTTZwS0ZC?=
 =?utf-8?B?cGJOeC9HRm5WRlFlTkN2L0MxZlpqWHNzRVhOcks0c0JXaFJKM01zdkh3MDYy?=
 =?utf-8?B?L0RxWVlxcXYrOG1EMGg1SWE3NjY5ZC9UT21HMmhuM045NWdEanhRU3ZSbkNJ?=
 =?utf-8?B?bTVkRVYyTzBJMjFFMWQ2ZnV6UDZNek1MTHZKUUtwbDV5eWNXN3pEeHBYOFN6?=
 =?utf-8?B?NDFBZzEra1FzalR5Wk1nckt1c0wzTWlqcDJkbi9ROHEwTkFVa05kbTkvdlBK?=
 =?utf-8?B?QjJmc3BwNGtMZnZpS3NWYjIyMk5xdldwa0E5VllHdEZsblExdzZpemNLcXk3?=
 =?utf-8?B?T1VwbmozRm1pQlcrRDh4NWgxb0VZNEZpVVpjZ1BrV05oMUhzTERtRWFIbWtp?=
 =?utf-8?B?aEoyL0d4bXg4RVVsNnpSWjJaOU9KZHkzcnEzb1FvOG9tM2s3OVdBSVZwYmow?=
 =?utf-8?B?SDBsVVBDOS9idlFMYms4d1dtYllXQkY1NStKaDBtY2F1T3NJWEZucDh4RFYz?=
 =?utf-8?B?bnhJejE3TGE2bnh4eHgvb1MvL1orbm5xQzFQdGMxOFJVd0FzS3FmL21WNyt6?=
 =?utf-8?B?NlNOS0hJekhFMDhYbWQ4Q1dMRjZ1cHNSSFBUWFNQb3ZyOTBHbUFZUVFrRCtU?=
 =?utf-8?B?dnVPOFBBbDUzNFE0eW1XT1FOVC9hekRxNCtQZlBHQzB6V0d0VXo3dDhWRi9l?=
 =?utf-8?B?dlVkZ0hKOThSTWI2SGpGVlpQUzVSZy8yQndCUTNGOTlhRkVNTk1kUHVvaXI3?=
 =?utf-8?B?T0tPaGhuL2llbGd2UGpZMGVSMks2bkVPZFNudFJTcyt3UVpqeUpSRzJWSDRJ?=
 =?utf-8?B?dmJCdnJQZTJNdkJFMWpZUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 126342fd-2a2e-4e52-f9ff-08d8cd069f76
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 14:26:00.3470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owZB781tZboWXXI6iHxusvy/Y7WuT5q6FUnpL6+CZ3/RPqZuxg6GULCIpRrrSKyZ6fq9yelyCz90KDTLEU3VXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4657
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 2021-02-09 um 9:08 a.m. schrieb Daniel Vetter:
> On Tue, Feb 9, 2021 at 12:15 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
>> Am 2021-02-09 um 1:37 a.m. schrieb Daniel Vetter:
>>> On Tue, Feb 9, 2021 at 4:13 AM Bas Nieuwenhuizen
>>> <bas@basnieuwenhuizen.nl> wrote:
>>>> On Thu, Jan 28, 2021 at 4:40 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
>>>>> Am 2021-01-28 um 2:39 a.m. schrieb Christian König:
>>>>>> Am 27.01.21 um 23:00 schrieb Felix Kuehling:
>>>>>>> Am 2021-01-27 um 7:16 a.m. schrieb Christian König:
>>>>>>>> Am 27.01.21 um 13:11 schrieb Maarten Lankhorst:
>>>>>>>>> Op 27-01-2021 om 01:22 schreef Felix Kuehling:
>>>>>>>>>> Am 2021-01-21 um 2:40 p.m. schrieb Daniel Vetter:
>>>>>>>>>>> Recently there was a fairly long thread about recoreable hardware
>>>>>>>>>>> page
>>>>>>>>>>> faults, how they can deadlock, and what to do about that.
>>>>>>>>>>>
>>>>>>>>>>> While the discussion is still fresh I figured good time to try and
>>>>>>>>>>> document the conclusions a bit.
>>>>>>>>>>>
>>>>>>>>>>> References:
>>>>>>>>>>> https://lore.kernel.org/dri-devel/20210107030127.20393-1-Felix.Kuehling@amd.com/
>>>>>>>>>>>
>>>>>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>>>>>> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
>>>>>>>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>>>>>>>> Cc: Jerome Glisse <jglisse@redhat.com>
>>>>>>>>>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>>>>>>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>>>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>>>>>>>> Cc: linux-media@vger.kernel.org
>>>>>>>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>>>>>>>> --
>>>>>>>>>>> I'll be away next week, but figured I'll type this up quickly for
>>>>>>>>>>> some
>>>>>>>>>>> comments and to check whether I got this all roughly right.
>>>>>>>>>>>
>>>>>>>>>>> Critique very much wanted on this, so that we can make sure hw which
>>>>>>>>>>> can't preempt (with pagefaults pending) like gfx10 has a clear
>>>>>>>>>>> path to
>>>>>>>>>>> support page faults in upstream. So anything I missed, got wrong or
>>>>>>>>>>> like that would be good.
>>>>>>>>>>> -Daniel
>>>>>>>>>>> ---
>>>>>>>>>>>    Documentation/driver-api/dma-buf.rst | 66
>>>>>>>>>>> ++++++++++++++++++++++++++++
>>>>>>>>>>>    1 file changed, 66 insertions(+)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/Documentation/driver-api/dma-buf.rst
>>>>>>>>>>> b/Documentation/driver-api/dma-buf.rst
>>>>>>>>>>> index a2133d69872c..e924c1e4f7a3 100644
>>>>>>>>>>> --- a/Documentation/driver-api/dma-buf.rst
>>>>>>>>>>> +++ b/Documentation/driver-api/dma-buf.rst
>>>>>>>>>>> @@ -257,3 +257,69 @@ fences in the kernel. This means:
>>>>>>>>>>>      userspace is allowed to use userspace fencing or long running
>>>>>>>>>>> compute
>>>>>>>>>>>      workloads. This also means no implicit fencing for shared
>>>>>>>>>>> buffers in these
>>>>>>>>>>>      cases.
>>>>>>>>>>> +
>>>>>>>>>>> +Recoverable Hardware Page Faults Implications
>>>>>>>>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>>>>>>> +
>>>>>>>>>>> +Modern hardware supports recoverable page faults, which has a
>>>>>>>>>>> lot of
>>>>>>>>>>> +implications for DMA fences.
>>>>>>>>>>> +
>>>>>>>>>>> +First, a pending page fault obviously holds up the work that's
>>>>>>>>>>> running on the
>>>>>>>>>>> +accelerator and a memory allocation is usually required to resolve
>>>>>>>>>>> the fault.
>>>>>>>>>>> +But memory allocations are not allowed to gate completion of DMA
>>>>>>>>>>> fences, which
>>>>>>>>>>> +means any workload using recoverable page faults cannot use DMA
>>>>>>>>>>> fences for
>>>>>>>>>>> +synchronization. Synchronization fences controlled by userspace
>>>>>>>>>>> must be used
>>>>>>>>>>> +instead.
>>>>>>>>>>> +
>>>>>>>>>>> +On GPUs this poses a problem, because current desktop compositor
>>>>>>>>>>> protocols on
>>>>>>>>>>> +Linus rely on DMA fences, which means without an entirely new
>>>>>>>>>>> userspace stack
>>>>>>>>>>> +built on top of userspace fences, they cannot benefit from
>>>>>>>>>>> recoverable page
>>>>>>>>>>> +faults. The exception is when page faults are only used as
>>>>>>>>>>> migration hints and
>>>>>>>>>>> +never to on-demand fill a memory request. For now this means
>>>>>>>>>>> recoverable page
>>>>>>>>>>> +faults on GPUs are limited to pure compute workloads.
>>>>>>>>>>> +
>>>>>>>>>>> +Furthermore GPUs usually have shared resources between the 3D
>>>>>>>>>>> rendering and
>>>>>>>>>>> +compute side, like compute units or command submission engines. If
>>>>>>>>>>> both a 3D
>>>>>>>>>>> +job with a DMA fence and a compute workload using recoverable page
>>>>>>>>>>> faults are
>>>>>>>>>>> +pending they could deadlock:
>>>>>>>>>>> +
>>>>>>>>>>> +- The 3D workload might need to wait for the compute job to finish
>>>>>>>>>>> and release
>>>>>>>>>>> +  hardware resources first.
>>>>>>>>>>> +
>>>>>>>>>>> +- The compute workload might be stuck in a page fault, because the
>>>>>>>>>>> memory
>>>>>>>>>>> +  allocation is waiting for the DMA fence of the 3D workload to
>>>>>>>>>>> complete.
>>>>>>>>>>> +
>>>>>>>>>>> +There are a few ways to prevent this problem:
>>>>>>>>>>> +
>>>>>>>>>>> +- Compute workloads can always be preempted, even when a page
>>>>>>>>>>> fault is pending
>>>>>>>>>>> +  and not yet repaired. Not all hardware supports this.
>>>>>>>>>>> +
>>>>>>>>>>> +- DMA fence workloads and workloads which need page fault handling
>>>>>>>>>>> have
>>>>>>>>>>> +  independent hardware resources to guarantee forward progress.
>>>>>>>>>>> This could be
>>>>>>>>>>> +  achieved through e.g. through dedicated engines and minimal
>>>>>>>>>>> compute unit
>>>>>>>>>>> +  reservations for DMA fence workloads.
>>>>>>>>>>> +
>>>>>>>>>>> +- The reservation approach could be further refined by only
>>>>>>>>>>> reserving the
>>>>>>>>>>> +  hardware resources for DMA fence workloads when they are
>>>>>>>>>>> in-flight. This must
>>>>>>>>>>> +  cover the time from when the DMA fence is visible to other
>>>>>>>>>>> threads up to
>>>>>>>>>>> +  moment when fence is completed through dma_fence_signal().
>>>>>>>>>>> +
>>>>>>>>>>> +- As a last resort, if the hardware provides no useful reservation
>>>>>>>>>>> mechanics,
>>>>>>>>>>> +  all workloads must be flushed from the GPU when switching
>>>>>>>>>>> between jobs
>>>>>>>>>>> +  requiring DMA fences or jobs requiring page fault handling: This
>>>>>>>>>>> means all DMA
>>>>>>>>>>> +  fences must complete before a compute job with page fault
>>>>>>>>>>> handling can be
>>>>>>>>>>> +  inserted into the scheduler queue. And vice versa, before a DMA
>>>>>>>>>>> fence can be
>>>>>>>>>>> +  made visible anywhere in the system, all compute workloads must
>>>>>>>>>>> be preempted
>>>>>>>>>>> +  to guarantee all pending GPU page faults are flushed.
>>>>>>>>>> I thought of another possible workaround:
>>>>>>>>>>
>>>>>>>>>>     * Partition the memory. Servicing of page faults will use a
>>>>>>>>>> separate
>>>>>>>>>>       memory pool that can always be allocated from without
>>>>>>>>>> waiting for
>>>>>>>>>>       fences. This includes memory for page tables and memory for
>>>>>>>>>>       migrating data to. You may steal memory from other processes
>>>>>>>>>> that
>>>>>>>>>>       can page fault, so no fence waiting is necessary. Being able to
>>>>>>>>>>       steal memory at any time also means there are basically no
>>>>>>>>>>       out-of-memory situations you need to worry about. Even page
>>>>>>>>>> tables
>>>>>>>>>>       (except the root page directory of each process) can be
>>>>>>>>>> stolen in
>>>>>>>>>>       the worst case.
>>>>>>>>> I think 'overcommit' would be a nice way to describe this. But I'm not
>>>>>>>>> sure how easy this is to implement in practice. You would basically
>>>>>>>>> need
>>>>>>>>> to create your own memory manager for this.
>>>>>>>> Well you would need a completely separate pool for both device as well
>>>>>>>> as system memory.
>>>>>>>>
>>>>>>>> E.g. on boot we say we steal X GB system memory only for HMM.
>>>>>>> Why? The GPU driver doesn't need to allocate system memory for HMM.
>>>>>>> Migrations to system memory are handled by the kernel's handle_mm_fault
>>>>>>> and page allocator and swap logic.
>>>>>> And that one depends on dma_fence completion because you can easily
>>>>>> need to wait for an MMU notifier callback.
>>>>> I see, the GFX MMU notifier for userpointers in amdgpu currently waits
>>>>> for fences. For the KFD MMU notifier I am planning to fix this by
>>>>> causing GPU page faults instead of preempting the queues. Can we limit
>>>>> userptrs in amdgpu to engines that can page fault. Basically make it
>>>>> illegal to attach userptr BOs to graphics CS BO lists, so they can only
>>>>> be used in user mode command submissions, which can page fault. Then the
>>>>> GFX MMU notifier could invalidate PTEs and would not have to wait for
>>>>> fences.
>>>> sadly graphics + userptr is already exposed via Mesa.
>>> This is not about userptr, we fake userptr entirely in software. It's
>>> about exposing recoverable gpu page faults (which would make userptr
>>> maybe more efficient since we could do on-demand paging). userptr
>>> itself isn't a problem, but it is part of the reasons why this is
>>> tricky.
>>>
>>> Christian/Felix, I think for kernel folks this is clear enough that I
>>> don't need to clarify this in the text?
>> Yeah, it's clear to me. Anyway, your latest text doesn't reference
>> userptr directly and keeps the discussion at a fairly abstract level. So
>> I think it's fine. It's the practical details of the proposed
>> workarounds where it feel like walking through a mirror cabinet, bumping
>> into unexpected obstacles with every other step.
> Oh yes, this is very high-level. The implementation is going to be
> very trick, no matter which one we're picking. And tbh I expect
> surprises and things we'll learn. But I'm still hoping that this high
> level doc patch will help a lot with avoiding the worst problems.
>
> Of course once we have some of these hacks landed we should look at it
> again and maybe update where it's wrong/unclear/...
>
> btw r-b: from you too on the patch?

Yes.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

Thanks,
  Felix


>
> Cheers, Daniel
>
>> Regards,
>>   Felix
>>
>>
>>> -Daniel
>>>
>>>>>> As Maarten wrote when you want to go down this route you need a
>>>>>> complete separate memory management parallel to the one of the kernel.
>>>>> Not really. I'm trying to make the GPU memory management more similar to
>>>>> what the kernel does for system memory.
>>>>>
>>>>> I understood Maarten's comment as "I'm creating a new memory manager and
>>>>> not using TTM any more". This is true. The idea is that this portion of
>>>>> VRAM would be managed more like system memory.
>>>>>
>>>>> Regards,
>>>>>   Felix
>>>>>
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>>   It doesn't depend on any fences, so
>>>>>>> it cannot deadlock with any GPU driver-managed memory. The GPU driver
>>>>>>> gets involved in the MMU notifier to invalidate device page tables. But
>>>>>>> that also doesn't need to wait for any fences.
>>>>>>>
>>>>>>> And if the kernel runs out of pageable memory, you're in trouble anyway.
>>>>>>> The OOM killer will step in, nothing new there.
>>>>>>>
>>>>>>> Regards,
>>>>>>>    Felix
>>>>>>>
>>>>>>>
>>>>>>>>> But from a design point of view, definitely a valid solution.
>>>>>>>> I think the restriction above makes it pretty much unusable.
>>>>>>>>
>>>>>>>>> But this looks good, those solutions are definitely the valid
>>>>>>>>> options we
>>>>>>>>> can choose from.
>>>>>>>> It's certainly worth noting, yes. And just to make sure that nobody
>>>>>>>> has the idea to reserve only device memory.
>>>>>>>>
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>> ~Maarten
>>>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> Linaro-mm-sig mailing list
>>>>>>> Linaro-mm-sig@lists.linaro.org
>>>>>>> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig
>>>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>
>
