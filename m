Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3753E35331D
	for <lists+linux-media@lfdr.de>; Sat,  3 Apr 2021 10:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbhDCItx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Apr 2021 04:49:53 -0400
Received: from mail-dm6nam12on2075.outbound.protection.outlook.com ([40.107.243.75]:27744
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232157AbhDCItw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Apr 2021 04:49:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNISa81dIr1uRbr5ZfaAZFXL6l5QF3Moaq2iiChBkqAoxGz3ltmr2K/R6Uhc6DNc1Lx55eKrrbIVf+rUYuvbAujDTtJYQ3pXIrN8y3PH7uouqFYLAbH8HbM3xWdErAvjklbARcWAMnjC31dKAOFbWfNJFzylHgT82kFFL9eWavlkmP63YKBbfpFKcpm1KTIuf66jm7BCXVMSRyfR0j0tASrAeYXWog6R81qGKxWEo1l7BS3MYV6TkysZC3OD2FCoA40aqH8GmVCGvQfqMkJapUdgCPgIVfvGdDR+XwCQJ3IF/bjy5xrN0eyXB/c5YdGpreyLQAQ1EfAaGhYypyd2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SycBJaaY29NM9aFWP0Yzk2K2eCVln17uWfGBBNy8y9c=;
 b=Dvc8EFdI0po1d0r6hovCTjeuJjkOGFxnGApOg5N9fmWyV1SQc9i+sEkh46MyAcLR/BXNRt+ZQqKB3kRdHRiMbbbIZ82Ek/hEQRMNaN2lbH6KzTUQGAp9QBT8OfokMryy/yVw4KNHdOeKES/MuCFHJw+5FC6SJQOIGTgpAYV6YgpeAKNAH2Sy5a3wi96IrljvbWgrXnuBK8NNK3gnCFs13hHKN1J1kfCveoExLEiCrxOjmZfRruAfwR9COLUuKJQ8b7tO4uD01crDh1AkhjfRMKXkei3TXR4Zl3ZgbFCZduF2UNMcgO5MMLyQngFggsIYBKfENhfT01sjWzHNRsSLdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SycBJaaY29NM9aFWP0Yzk2K2eCVln17uWfGBBNy8y9c=;
 b=BB5kLRQ1HWnGS5Opb6+cbbr6vHyUA8IKifr70049nvxEVT9TcSgCSKGyhdfb1BsSLjQFazU0+SAVK5ImjduR3mThR5X1bNnz1gpBI16o/zO5Z9H4xbhP+/gq0K/r8sKkOo8LH/i4PAQDB26RGq1D+sp1Jd3SjnpBHCEVvBmnoCA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4550.namprd12.prod.outlook.com (2603:10b6:208:24e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Sat, 3 Apr
 2021 08:49:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3999.029; Sat, 3 Apr 2021
 08:49:45 +0000
Subject: Re: [PATCH] drm/amdgpu: Fix a potential sdma invalid access
To:     Qu Huang <jinsdb@126.com>, alexander.deucher@amd.com,
        airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
        airlied@redhat.com, ray.huang@amd.com, Mihir.Patel@amd.com,
        nirmoy.aiemd@gmail.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <1617333527-89782-1-git-send-email-jinsdb@126.com>
 <9b876791-7fa4-46da-7aec-1d1bfde83f4e@amd.com>
 <84619284-d401-f018-d627-8e5dfef1ff1f@126.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fc8cf44b-e952-1c48-137a-77c35bbfbb24@amd.com>
Date:   Sat, 3 Apr 2021 10:49:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <84619284-d401-f018-d627-8e5dfef1ff1f@126.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5018:dba8:82e3:cfb7]
X-ClientProxiedBy: ZR0P278CA0020.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::7) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5018:dba8:82e3:cfb7] (2a02:908:1252:fb60:5018:dba8:82e3:cfb7) by ZR0P278CA0020.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend Transport; Sat, 3 Apr 2021 08:49:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ea7429e-3911-4332-3c66-08d8f67d6e2e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4550:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4550012C1B078064BD278AF383799@MN2PR12MB4550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HfqgX39JzwZ65F6aN2jAJVcZN75DPjhCLmu4CxOgw1p4+RqG0aMa5OCeV1OkievNNkiczxDqQw183VEOPipO+NcSxhqu4eCQG8JCiixw/aq+/8ucD73TmjPkPEJwUjBxzNzAAb+lnEAJvYw7A1iVfynyPfe7W+HL/vn887WaY5qRZtCLn3/oiQH6Zl+Zpq7kmdL8uVYSufP6To282E5461f6MmJeTlBOahA3mXOuL4fBYAZClT6bxeVxF4a/125AgvUumQW374mXI1Jo57il2K4sr90zTYMV4o7Yhpc3khKXXd/61SjrT0aUoVjVfQXQeEXEJ3U/sg/Y9hbDwklaQd9OHbBUg+LQCGg6Sy4FmFwasfaXrchtreOoLn8QmKVnAWKe3vkciTgB1QYdSFukdYTE9iHx/jMDPhkeHeN9f18cqPsl1UAaRNRhq4U6wIS+YDW938NrJu6hPpUWbX804zzQkbx1utTw11Sk9GdehAWEog1SNnjXbrUrBjTDh8mUtWpLcdTDxKIGkTzPdoCicB9NSRUTiRQKzkkOP89XogIjyhjMXUTo3/CESGAc8ck/LHxWdxHNDhyb1T1ib5sPMW2xlL3bUuMuEPUNLPaLXpiGzAqhpcrFadVsOK5b92l/bMGg0h++lpD/doy88XAjPF40+4vV/ilJFLboDYcqLBnKJOkv+jVwkHEz8rD7NLCK5hjZrLMqclcYo1qb4mXbBBARmFNPcqJJdGnJH66Lj+hzz4uY+Ue7pxS6i6LLWvsh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(8936002)(66946007)(36756003)(86362001)(7416002)(4326008)(5660300002)(66476007)(31686004)(66556008)(478600001)(2616005)(186003)(38100700001)(66574015)(31696002)(52116002)(6666004)(16526019)(2906002)(53546011)(8676002)(83380400001)(6486002)(316002)(525324003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UTQ1OGRYNnhaTXhUNVZFZFdubERzY1IyK2FKUnJMMHQ0U2ZyME5BVFFIRTRF?=
 =?utf-8?B?WU5UK1hhOGFvZlYwQjBRbTROSkhxZTBydGRzaFlTdzdFdmhqUzVoRWxSNTE0?=
 =?utf-8?B?Q3FhRGptNERhT1F6b0dWSU9TVUpxb1hQSkRkOW9EdmgwMW5oRUVsdC9pRmUr?=
 =?utf-8?B?V3VNc2M5dEZXR3FvY1M4U0tHdWFuVmwyclR4clpnMmlzb2hBM0krd3lhQWY4?=
 =?utf-8?B?Z3FKSzRRUElnV1kxTzE1ekIzZXVGMFdCUkUyYW5kZ25WaEY5bEg4Rjc5bzNN?=
 =?utf-8?B?d0x1M0FwYzhTNnNmSlVYNnU0OXlYM0h0NWFkbTZiNWtoTTVzWDRMSmVGVmNT?=
 =?utf-8?B?VGR1MUM0MUJRQ1J4MnhlbkRhZldnNkpLQTl3Qnp0NXBZQWhWMmRKZE16Uis1?=
 =?utf-8?B?Vm5iZWJ5WVozOTJ1NkFGMmV3RW9kOWdYenNqWkhYWXNTVXFxd09XNUkwVzZW?=
 =?utf-8?B?Y0lIRXU0TGV1THY5UnJWZU5yQ0FPYlZMNXR5RlhPSWUvYUpmVksrVks1T3pJ?=
 =?utf-8?B?cXhLNEF2ZDdya2hLQXl6b2FObEMyMGxmcWR1QzQ1NC9CRUZ0VE9HdXU0OTFn?=
 =?utf-8?B?OVNCUS9kbVg2MndGbG9ycHhBYlo3U2dnKzRvR1FlWWhjM0FSZkZIcFRXc1FT?=
 =?utf-8?B?aFUvNGRINmQ1Uy9nemFKWXF2SFN5dzVCWTJZUXBPcFR2TlhzVkhvSnUrTnBx?=
 =?utf-8?B?UHFMUGFwem5pN0w4dVlkR3VndDJjVW1UdTBBMXBGMm02OHhRTW9xS0lPcXdN?=
 =?utf-8?B?NThNdVQxMVEwdWVDTlNNZnpjMU8vL2h4ell0Sk5JTnp6SEtKTG1hSVVDTUpS?=
 =?utf-8?B?dk15QmI3RE4zMlBpUkppYUJTbWdTVGtxWXV0SkpTbUVmdlE0SE0rUG9TY1pF?=
 =?utf-8?B?L3BmNVFEMTU4SlBCUFhiTU1ESnJMMCtKYkhrODFSZlIwRG9OL1NNeGxURHhF?=
 =?utf-8?B?R2pjeDFqR29ERCtsUnIrRDFHdTArN0x6L09RTW1xcWphajhqeERVZDJkVzN4?=
 =?utf-8?B?d05xT1YvSjJDSzJvMk8wOUMyc2JnT0pyaGxmcWxxZTFnYWp2b1BTeEZxWW15?=
 =?utf-8?B?YXBTQ1F6L2JDSDlZdUFQVVA1K2ZXZzdPUUxqUklJcDQybzhvblFTT3U0eHNt?=
 =?utf-8?B?bDhhUFphS0V5SVFxL0taMGRCNFhDWThadnpwTlYrbVF3aU1nTUhrVzVJNDNN?=
 =?utf-8?B?OEJlSWdCUEg2a01naFhXMEJFT3htQVNlcTh2U2RWVDAwaWVCLzBCamFjTk9R?=
 =?utf-8?B?eVMydGp4Z0YyN3B1NytHTWZXVlJxZDRvZkZqQXB4R2ljb3F4ZzhkY0tWSjFm?=
 =?utf-8?B?ODZHcVVmZkt4aXhQNm5uaWxDU1RuRG9LK2J0ZkNlaW5pTjFMVVB4Mld3NWM3?=
 =?utf-8?B?QmplZDRYTWVIYzlmVjV5MHZ0ejFDUm9kZ1c0WUdTN2pUQTJkd1BhN1k3WlFj?=
 =?utf-8?B?MnA0YUoxaWIrZDlzemNXNXpSajhTYVRWSWc0M252QlFTMWhhQjBWZmRmUHp3?=
 =?utf-8?B?ZVArUVUrOEs2SkpvSEhnYkpDTDR0NEJrdDdqakhiZDJRVC9DY3h3QVRER1ZR?=
 =?utf-8?B?dndxbE1HT1RsK1U4M3pmczFEZmpZalBMaUtuQy9KeW40M3hYVDZHWkVJZHE0?=
 =?utf-8?B?WG5NdTQ2ZFR5WEUyQ29ncnpJR01qMWxscGVCNXFWaHJqQW16OWZYci9Tajdu?=
 =?utf-8?B?cmorKytXbHJvOThJM1M0OTZ4SmttTkE4QjlibEhMU3p5UmV3OTVEVmFFc0R3?=
 =?utf-8?B?bVIxWEhuSm9BWDdzc2hMTlNSbWY3YXpDMEhHcUdyZmlSTFY0ZldhTEsyeVps?=
 =?utf-8?B?RGN0TjloR3htb2pRT2lBUi9qQjQ0eTBZNEp1SFlRalN6ZnBkcy9wU0tUSTA3?=
 =?utf-8?Q?vmFJgzT2Uug00?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea7429e-3911-4332-3c66-08d8f67d6e2e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2021 08:49:45.5462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZeiX1jLqUaoWwHsaHj7f1dptSeCCYR9FBblCxTGyMBssnXHNj6vMw75LwCnYz6W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4550
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Qu,

Am 03.04.21 um 07:08 schrieb Qu Huang:
> Hi Christian,
>
> On 2021/4/3 0:25, Christian König wrote:
>> Hi Qu,
>>
>> Am 02.04.21 um 05:18 schrieb Qu Huang:
>>> Before dma_resv_lock(bo->base.resv, NULL) in 
>>> amdgpu_bo_release_notify(),
>>> the bo->base.resv lock may be held by ttm_mem_evict_first(),
>>
>> That can't happen since when bo_release_notify is called the BO has not
>> more references and is therefore deleted.
>>
>> And we never evict a deleted BO, we just wait for it to become idle.
>>
> Yes, the bo reference counter return to zero will enter
> ttm_bo_release(),but notify bo release (call amdgpu_bo_release_notify())
> first happen, and then test if a reservation object's fences have been
> signaled, and then mark bo as deleted and remove bo from the LRU list.
>
> When ttm_bo_release() and ttm_mem_evict_first() is concurrent,
> the Bo has not been removed from the LRU list and is not marked as
> deleted, this will happen.

Not sure on which code base you are, but I don't see how this can happen.

ttm_mem_evict_first() calls ttm_bo_get_unless_zero() and 
ttm_bo_release() is only called when the BO reference count becomes zero.

So ttm_mem_evict_first() will see that this BO is about to be destroyed 
and skips it.

>
> As a test, when we use CPU memset instead of SDMA fill in
> amdgpu_bo_release_notify(), the result is page fault:
>
> PID: 5490   TASK: ffff8e8136e04100  CPU: 4   COMMAND: "gemmPerf"
>   #0 [ffff8e79eaa17970] machine_kexec at ffffffffb2863784
>   #1 [ffff8e79eaa179d0] __crash_kexec at ffffffffb291ce92
>   #2 [ffff8e79eaa17aa0] crash_kexec at ffffffffb291cf80
>   #3 [ffff8e79eaa17ab8] oops_end at ffffffffb2f6c768
>   #4 [ffff8e79eaa17ae0] no_context at ffffffffb2f5aaa6
>   #5 [ffff8e79eaa17b30] __bad_area_nosemaphore at ffffffffb2f5ab3d
>   #6 [ffff8e79eaa17b80] bad_area_nosemaphore at ffffffffb2f5acae
>   #7 [ffff8e79eaa17b90] __do_page_fault at ffffffffb2f6f6c0
>   #8 [ffff8e79eaa17c00] do_page_fault at ffffffffb2f6f925
>   #9 [ffff8e79eaa17c30] page_fault at ffffffffb2f6b758
>      [exception RIP: memset+31]
>      RIP: ffffffffb2b8668f  RSP: ffff8e79eaa17ce8  RFLAGS: 00010a17
>      RAX: bebebebebebebebe  RBX: ffff8e747bff10c0  RCX: 0000060b00200000
>      RDX: 0000000000000000  RSI: 00000000000000be  RDI: ffffab807f000000
>      RBP: ffff8e79eaa17d10   R8: ffff8e79eaa14000   R9: ffffab7c80000000
>      R10: 000000000000bcba  R11: 00000000000001ba  R12: ffff8e79ebaa4050
>      R13: ffffab7c80000000  R14: 0000000000022600  R15: ffff8e8136e04100
>      ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0018
> #10 [ffff8e79eaa17ce8] amdgpu_bo_release_notify at ffffffffc092f2d1 
> [amdgpu]
> #11 [ffff8e79eaa17d18] ttm_bo_release at ffffffffc08f39dd [amdttm]
> #12 [ffff8e79eaa17d58] amdttm_bo_put at ffffffffc08f3c8c [amdttm]
> #13 [ffff8e79eaa17d68] amdttm_bo_vm_close at ffffffffc08f7ac9 [amdttm]
> #14 [ffff8e79eaa17d80] remove_vma at ffffffffb29ef115
> #15 [ffff8e79eaa17da0] exit_mmap at ffffffffb29f2c64
> #16 [ffff8e79eaa17e58] mmput at ffffffffb28940c7
> #17 [ffff8e79eaa17e78] do_exit at ffffffffb289dc95
> #18 [ffff8e79eaa17f10] do_group_exit at ffffffffb289e4cf
> #19 [ffff8e79eaa17f40] sys_exit_group at ffffffffb289e544
> #20 [ffff8e79eaa17f50] system_call_fastpath at ffffffffb2f74ddb

Well that might be perfectly expected. VRAM is not necessarily CPU 
accessible.

Regards,
Christian.

>
> Regards,
> Qu.
>
>
>> Regards,
>> Christian.
>>
>>> and the VRAM mem will be evicted, mem region was replaced
>>> by Gtt mem region. amdgpu_bo_release_notify() will then
>>> hold the bo->base.resv lock, and SDMA will get an invalid
>>> address in amdgpu_fill_buffer(), resulting in a VMFAULT
>>> or memory corruption.
>>>
>>> To avoid it, we have to hold bo->base.resv lock first, and
>>> check whether the mem.mem_type is TTM_PL_VRAM.
>>>
>>> Signed-off-by: Qu Huang <jinsdb@126.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> index 4b29b82..8018574 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> @@ -1300,12 +1300,16 @@ void amdgpu_bo_release_notify(struct
>>> ttm_buffer_object *bo)
>>>       if (bo->base.resv == &bo->base._resv)
>>>           amdgpu_amdkfd_remove_fence_on_pt_pd_bos(abo);
>>>
>>> -    if (bo->mem.mem_type != TTM_PL_VRAM || !bo->mem.mm_node ||
>>> -        !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
>>> +    if (!(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE))
>>>           return;
>>>
>>>       dma_resv_lock(bo->base.resv, NULL);
>>>
>>> +    if (bo->mem.mem_type != TTM_PL_VRAM || !bo->mem.mm_node) {
>>> +        dma_resv_unlock(bo->base.resv);
>>> +        return;
>>> +    }
>>> +
>>>       r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, 
>>> &fence);
>>>       if (!WARN_ON(r)) {
>>>           amdgpu_bo_fence(abo, fence, false);
>>> -- 
>>> 1.8.3.1
>>>
>

