Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31D5616AF9A
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2020 19:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbgBXSrK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Feb 2020 13:47:10 -0500
Received: from mail-bn8nam11on2056.outbound.protection.outlook.com ([40.107.236.56]:44673
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726652AbgBXSrJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Feb 2020 13:47:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUKR8m1tO5rZircRQSarpxDkv1wKLElJDJjZaC2s1xwemLEA/4yFWyqRFy2P9Y+5GE0ZlEj2Gy4fvpmt56PYbRFWDqDuewyYMDp0U5F27oOSQ0yReb46+QNJOPwIFgnbFEQuK2p6YUHXuPq2DRy9aw4Jw8H2ytKGOgW58oYxMSAQRP+tsCXA6u6js6mwVW9+/W+oIpNqRmFtFD0YubHKD2mFr8+cod8t0sZkecPv6PDxVWE6gqj0xjo6Nj3jaTkVeEfyfzGvjg9sVqaUzfejvoJtNHIWXxSWh7KmDQgHpfaEZgEKR009ILynrP/6bt/hTqqHLiQVPwZfYNf/poww7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/e1j78x8DnTHLwy7Pu175bwhakDAYhYMhsY9IbqTR8=;
 b=g1g+aBA/kkmivGXErvnTbGu0NldEt7WMB572Oh9QSBEQrQJCCJbX+6xoycxyp3Sr2p8eCXZAScTCplJn1uKIsJKQ81dAaSeI93ugPyhGlcTNxpWyA8oObzwBwkULzFPFnJAbO0Iki4EQnMIDPD9amaMIldhnyJa3w4QHYoJk616rfy4vgcAheUSaEeoIZWZbfO8Y7tcgsK9Fqr75e6L7MfpiE5oKEzDzoVTP3iFT7+0LjTySG5141frvwPDD3ojbPz8QEWXF6RaeuRqB0JTnX8RLLFccEtRramQbS30UpiM6UNUTPi13CndQzOPIUpdH/5r0qmpJ8j0+5393nqG7fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/e1j78x8DnTHLwy7Pu175bwhakDAYhYMhsY9IbqTR8=;
 b=fMdAw+VDWAgnDt9cnBxzptwvxi5zgOnNvddpP/m1GrKPsMMoB1CHi8zQPJqTvodq8kDwNkOAwQS1x6XaEyL5uORVnY+0cWyPvuv8eJKF7R7PcD75ixgd53vCW5JrR7+OlC0Cn7Rze5EGLLa2dpPLwlC0Agql6u1SpQ2EGKvwfuc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB2390.namprd12.prod.outlook.com (2603:10b6:4:b5::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Mon, 24 Feb
 2020 18:47:05 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2750.021; Mon, 24 Feb
 2020 18:47:05 +0000
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
To:     =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= 
        <thomas_os@shipmail.org>, Daniel Vetter <daniel@ffwll.ch>
Cc:     intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20200217154509.2265-6-christian.koenig@amd.com>
 <20200217175518.GL2363188@phenom.ffwll.local>
 <f8ac7cbc-7c90-7119-735c-9f55adb6fa7f@shipmail.org>
 <CAKMK7uHG3EkEPbAQ3UEHHLcfmR+0NPq0wZuBX+s2-WCFdso8ew@mail.gmail.com>
 <79a0d79f-91bd-2481-740c-20e6c819c7c9@shipmail.org>
 <ee929c93-c9d7-7243-810e-94c6f0fc64b0@shipmail.org>
 <20200220180459.GS2363188@phenom.ffwll.local>
 <d1c37ec4-b63e-437a-a2be-80ba5192e048@shipmail.org>
 <20200220200831.GA2363188@phenom.ffwll.local>
 <501bf409-e4fe-a318-17b4-d5d050b09529@shipmail.org>
 <20200221171217.GD2363188@phenom.ffwll.local>
 <d9343617-9da8-5fea-a0f1-99db34a0cf2c@gmail.com>
 <8f29b152-9c7b-3427-efa2-4a39f0daced8@shipmail.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7d73bdfa-63d0-11af-7029-382ad1015c4c@amd.com>
Date:   Mon, 24 Feb 2020 19:46:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <8f29b152-9c7b-3427-efa2-4a39f0daced8@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0P190CA0028.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::38) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0P190CA0028.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend Transport; Mon, 24 Feb 2020 18:47:04 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 354434b7-738c-46c1-7712-08d7b959f1c8
X-MS-TrafficTypeDiagnostic: DM5PR12MB2390:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2390019DF35701672A67C92383EC0@DM5PR12MB2390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 032334F434
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(189003)(199004)(2906002)(36756003)(2616005)(110136005)(54906003)(8936002)(6486002)(8676002)(186003)(16526019)(6666004)(52116002)(316002)(53546011)(66574012)(66946007)(478600001)(4326008)(66476007)(66556008)(86362001)(5660300002)(81166006)(31696002)(81156014)(31686004);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB2390;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GWSgExHftnfyZZPtp9lYL6WkfNYNi+F3S3aDXrrEFYrvMOTnRuTN/TR0QARbywa/HsoxaX/bsxZ8k5O/iY9YyrKNwiyBBcdIg3TczJUXW79ZC8XiIaB26ed4xvHJgtB7gmiNcz95yteFZ1nTji6cdsKKDfORN4jqQn3GD0ODQ4rzrK0uaPjWYo2iPvg4hVZkC/8wq+ki76nFh6wDaKb9OIpS4QGn0hTl9QJ+TBz4uIIzkTJj7Ska/FWmcU3/GfoL8V9642eK56/KGAKcW76XPyQSmlYxhC9/XUCuMz4TbWuquI8ugKT49PIhHFIs3qzbx8y2RC9I2eRexXPxfu5rQOHKV6BtH5ohzTX4NWiN1sR58WDc1ZkqpLNQ5qoV3FzGnwe7QnUYhOI9PRDtUN69LMI+EBQbReJyTpVBodXTShnf9NmG+J5E1BcNpdJUfzwQ
X-MS-Exchange-AntiSpam-MessageData: pi6RaS2yFkp+sAsZ1onCJOWiHLxEkDqIcVTkuiQZH7VFgoLJMzst1RUniNh4pmjO2T9gLWahxplOyeYE4kxr9D7h30mXAloBW+SrTvUSMOCQgAfax8R326nzX8SJIy/LnMdp1s9mtqQr64FxgqxcrGWI7SacXM0sAEEe2wFt5XYa8jGq6HUltfKCmVAOy5GhSA1+xPElRQhDO1RuviJECA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354434b7-738c-46c1-7712-08d7b959f1c8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2020 18:47:05.8238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVEEG7FP/TFOil6QVLlsiJGm7mT15EdTe1pWERInHWsSj6ECNFOeVzNFUf/4qmxj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2390
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 23.02.20 um 17:54 schrieb Thomas Hellström (VMware):
> On 2/23/20 4:45 PM, Christian König wrote:
>> Am 21.02.20 um 18:12 schrieb Daniel Vetter:
>>> [SNIP]
>>> Yeah the Great Plan (tm) is to fully rely on ww_mutex slowly 
>>> degenerating
>>> into essentially a global lock. But only when there's actual contention
>>> and thrashing.
>>
>> Yes exactly. A really big problem in TTM is currently that we drop 
>> the lock after evicting BOs because they tend to move in again 
>> directly after that.
>>
>> From practice I can also confirm that there is exactly zero benefit 
>> from dropping locks early and reacquire them for example for the VM 
>> page tables. That's just makes it more likely that somebody needs to 
>> roll back and this is what we need to avoid in the first place.
>
> If you have a benchmarking setup available it would be very 
> interesting for future reference to see how changing from WD to WW 
> mutexes affects the roll back frequency. WW is known to cause 
> rollbacks much less frequently but there is more work associated with 
> each rollback.

Not of hand. To be honest I still have a hard time to get a grip on the 
difference between WD and WW from the algorithm point of view. So I 
can't judge that difference at all.

>> Contention on BO locks during command submission is perfectly fine as 
>> long as this is as lightweight as possible while we don't have 
>> trashing. When we have trashing multi submission performance is best 
>> archived to just favor a single process to finish its business and 
>> block everybody else.
>
> Hmm. Sounds like we need a per-manager ww_rwsem protecting manager 
> allocation, taken in write-mode then there's thrashing. In read-mode 
> otherwise. That would limit the amount of "unnecessary" locks we'd 
> have to keep and reduce unwanted side-effects, (see below):

Well per-manager (you mean per domain here don't you?) doesn't sound 
like that useful because we rarely use only one domain, but I'm actually 
questioning for quite a while if the per BO lock scheme was the right 
approach.

See from the performance aspect the closest to ideal solution I can 
think of would be a ww_rwsem per user of a resource.

In other words we don't lock BOs, but instead a list of all their users 
and when you want to evict a BO you need to walk that list and inform 
all users that the BO will be moving.

During command submission you then have the fast path which rather just 
grabs the read side of the user lock and check if all BOs are still in 
the expected place.

If some BOs were evicted you back off and start the slow path, e.g. 
maybe even copy additional data from userspace then grab the write side 
of the lock etc.. etc...

That approach is similar to what we use in amdgpu with the per-VM BOs, 
but goes a step further. Problem is that we are so used to per BO locks 
in the kernel that this is probably not doable any more.

>> Because of this I would actually vote for forbidding to release 
>> individual ww_mutex() locks in a context.
>
> Yes, I see the problem.
>
> But my first reaction is that this might have undersirable 
> side-effects. Let's say somebody wanted to swap the evicted BOs out?

Please explain further, I off hand don't see the problem here.

In general I actually wanted to re-work TTM in a way that BOs in the 
SYSTEM/SWAPABLE domain are always backed by a shmem file instead of the 
struct page array we currently have.

> Or cpu-writes to them causing faults, that might also block the 
> mm_sem, which in turn blocks hugepaged?

Mhm, I also only have a higher level view how hugepaged works so why 
does it grabs the mm_sem on the write side?

Thanks,
Christian.

>
> Still it's a fairly simple solution to a problem that seems otherwise 
> hard to solve efficiently.
>
> Thanks,
> Thomas
>
>
>>
>> Regards,
>> Christian.
>>
>>> -Daniel
>
>

