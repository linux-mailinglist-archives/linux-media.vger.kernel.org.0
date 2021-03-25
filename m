Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42A17348B8C
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 09:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhCYI3j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 04:29:39 -0400
Received: from mail-bn8nam12on2046.outbound.protection.outlook.com ([40.107.237.46]:52161
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229461AbhCYI30 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 04:29:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msbekGDg2PMPLPBBUa/Hid8HAr81JN5i6eAzaZ5lz+IMpROBKXH+IB/mRHevc8q5+xf/UA59xE4TDZ0yoew8XD+RRkcZMwNjnf6R/3cGsaxrvN86JuiTMRibCe5UUOTAA76dYivI59nKwPnnmgFgAuquI5cKg0zAyn6mNbnnRkSi3Ubq43GrEtsft2n7qeFqnG5LKh7lPeBf0LOxfyX3VXmYCY2z+RMnbQsYKBDJzDOclqtY7toweGLlzf6lg3rN3SBjCpKV7RXoVshwpGKHkTubiSK8e1AtjkE3PqCuGG6JjHKoB/bV+OvG2DWCdnEE1O9IXCntWIWvH4vZtiodiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQADfMG9L4DRjM7zdiyF5jOvoDbbqYmiyt4LEyx9myE=;
 b=d0gYOP10SgHuUZRgQCqo3RMPSkid0UDLlfNdobC4lfw+7HM3Kug7SHIQVkS5Pb0j33EVSyjs/n5Wx5J8Rq43T3Hl4DCYjIN/a78ZOj0EcDbJhXCm/Dq3al4d0AHbYsxA5IGcJYh2pjrmQw2pt0yiI7r3PR/iBzFk41iyh0D6qCKz4aoYzu/mLhyFwXaat6GIYA128gvDcWFQfnKw3j8lwEJfy74F7PFj4B2S8bUog1cL/m0pNZPEk+yYI1CzdD62k3KP7bdiSJrUzJh8Cgmh9mQdfO0IyaVTNjV0LCrv4+EuJC7BvfT3redxzcR47eeUcCApAJyhN4td9FaNpzCnkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQADfMG9L4DRjM7zdiyF5jOvoDbbqYmiyt4LEyx9myE=;
 b=xnSbkyLocqts78eJohgIWd3PTLrO3MOZalN0MKqQ9XpnXX50UGvEzk0tC0CpLMqSpFyYMpg53gAphIr/QLWNbb5g/szfFxuHKWRIMCqPBKw1jMW2KyUbCnjXdwzHvciSSDuqFgcKIjULxk/+p+7CQIRpuw8EWO07KvDsC/uK110=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4157.namprd12.prod.outlook.com (2603:10b6:208:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Thu, 25 Mar
 2021 08:29:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 08:29:24 +0000
Subject: Re: WARNING: AMDGPU DRM warning in 5.11.9
To:     Oleksandr Natalenko <oleksandr@natalenko.name>,
        linux-kernel@vger.kernel.org
Cc:     Ilkka Prusi <ilkka.prusi@pp.inet.fi>,
        Chris Rankin <rankincj@gmail.com>,
        Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <CAK2bqVJ+=nHTK-hnUC=qL1mcOvHWTCwDMYPBKJp77QCbBvBGGw@mail.gmail.com>
 <a38a3c04-4ac8-01a6-da69-a2bdaa54f61d@pp.inet.fi>
 <20210325081702.5kdzp7moqhcox65b@spock.localdomain>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5eb58748-72e0-3eb4-593a-6e482133af17@amd.com>
Date:   Thu, 25 Mar 2021 09:29:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210325081702.5kdzp7moqhcox65b@spock.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:a792:596e:3412:8626]
X-ClientProxiedBy: AM0PR02CA0163.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:a792:596e:3412:8626] (2a02:908:1252:fb60:a792:596e:3412:8626) by AM0PR02CA0163.eurprd02.prod.outlook.com (2603:10a6:20b:28d::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Thu, 25 Mar 2021 08:29:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0241856a-1f4c-42d0-64bf-08d8ef6818aa
X-MS-TrafficTypeDiagnostic: MN2PR12MB4157:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4157FB835A0CBD6BF666E7A983629@MN2PR12MB4157.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: povz0XsZi1pQLbfguMWDr/66CjOXdIA2CZJtdpSkW3zldXXPsDoCiHyqeHCx5oFEk2elgSoa6gG1CxN7gajlzl514mM5cKPqlDw3gHL8XJz2PigP1uKCp5p0Hh+OO9gxrrWOSyV+uIIAVDBUccmqUXW9pBvG6upMRWJaFD/ciC2bmYDjDbwGNVTNyut/nvxiyzhDzw7qyYXQp0cxRbKLMo7W+i9wRET8ZmAj/jRinWZ3C2l2GfHrjBPfBrl/Yo2+QFRVP2c0IlEMNJDp/jAbcUFQM+RhSvBadpLNAUwRpGUsbqWT3kzHIhzZJLqMUE9Gx4MgWg4czq2QPZBgjfWu46WDaHPvy2NJN+Vh8uY8KBzh22VaYOzJqtrcCTAzT7BoG0jZvCr7lKWiIM2JksEwxgtZZRaozHaqZdfe9AbP0T+hZPN2rRgHAX+ci3wWzkrdaj1YWyKzEoCiVxj7YtRWHT1xRsmIeGX0z4K0UC2z4/ge49UqGPA8O+xfEnj/C1auq2kxrXcYnm7gRINLwG15ljqfk17+zvDWXnf+1irLSZGb42Vwr7/aQWOjzuQhcv/9AkiSB/x1zPkNtJFvlXxLaDF1ClXhxN/e8xPa7ztlhHf2vaSvGKrQkRbM9dwksUoxyn/69TTUOzE2CvfYNGDnHuriyApdrVgnLSZ8TdKVV5INN5rSFIkXv7TIeE8mk7WJyIEkxXoDj5dnGNltdlFerzontpTO0lLHNTumfux7Qwk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(31696002)(38100700001)(52116002)(6486002)(86362001)(316002)(36756003)(54906003)(8676002)(478600001)(83380400001)(31686004)(8936002)(2616005)(45080400002)(186003)(66476007)(7416002)(6666004)(16526019)(66946007)(5660300002)(66556008)(2906002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L2l2T2VGd1F4SlJPdnBLQTdKYXBHdTFLK0ZwOGNybTBDQUNnYUhPV2I3QzRN?=
 =?utf-8?B?c09GTzdScHZDT1N2WWtpeEI1ZVpuc1Z5RHZmSXk1M1dSbkExQWpHZGpJSk02?=
 =?utf-8?B?RjBMblpVQjFBNXd1a3lrNVlJMHpiRGdKSWxOYmpDNjBES2NCSi91VnpVcUhk?=
 =?utf-8?B?ekNPYkk5M0tSQTI4enc2UFlUVXhrK01BYWRYaFVQVmg5TWpnQkpzaFBpdEcw?=
 =?utf-8?B?VG0yNFk4UHlkRGgwWmJwdTc5bTB2WXU4NWFPa2dWTzhwQzhJNUlzN2lNTDRU?=
 =?utf-8?B?eGxkWmhJSkpTQjljMWlaenF3UUQrMzhtMENVcmlGRXJMSFlhYTdOaXNWYTdB?=
 =?utf-8?B?dEMzeHBlcGhpRi94ZUorSkRlR2lZVmFTOXp5ZS8xVEkyUTlFT210S2NuYjdE?=
 =?utf-8?B?K0hPTzNIdjg1T3JNQzhqRXdCNXlFaTZNRmxJQ1I1cmhQNG9URUowUDFGZ3pU?=
 =?utf-8?B?OXZRbFR1dy9vckJNZEl5L1VQSjV3U1J2bnJJVFZzOWZQcXJVOG1vMmt6aUhl?=
 =?utf-8?B?WFp6bFg1RU1qMjNSdldmL3RLNS9iSXYxejB3TVNQcGNtcDBmbG1OQUxnZGV3?=
 =?utf-8?B?aTY1dTRBejVWYXh1Z1RjRzROK0NleDJEZWc2T1pNeUxOS1JZTFgyMjU5Rms0?=
 =?utf-8?B?ZjRoSnlVd3BrMmpIRjBsbWlYOXg1THpuUXlBTUdGMUZjcE5EUlYydkNKQ0V2?=
 =?utf-8?B?Z3duN0I4WUFyR1JhcWFXN2E5dDNTWEtDOG1OZlUyTW4vZ1FlcEZ6cG5BbmJU?=
 =?utf-8?B?VWZ3R3huTEJtRSs1NTdhQnZoZjFGcEkvMitoYU1DUzlhWUM2WmdOOUJFRjZU?=
 =?utf-8?B?U0YwN1RFZjFjYjg3alRkOVNhcFo5K0h5dVp3ZzYrZTVoaThKQnY3K0MrZ0JB?=
 =?utf-8?B?SW5BUW1OOGtaM2x5R3h5RVg1WjhRSUUwVU1Nd2l0SnJvUzYwMlExc3dHM0JW?=
 =?utf-8?B?NUl1Sm1ldXVicFZqbUJDNUxoM2VreUN6QU1iVlJPa202anlBMG11bHVydm1l?=
 =?utf-8?B?SUZYMXJzR291LzZRSmpLb1lsYlh5OFZaUU9CaHNRdnhDb29XRHVSSFArMjlm?=
 =?utf-8?B?ektyNHdNeGlnZW11UzhJaXBERFVsdEZwcjkyM2c3clJJS2duNEVvd0FZaVZr?=
 =?utf-8?B?SEJQV2hQdUpTY0p4ZklJVkd1SzB3bUxWVkFxN0txWEo2RDZESjJlSWZzczhq?=
 =?utf-8?B?aXMxNnJ5c0kweVMvazI3QmdscEN3amx2b1Q3RGZBUXhVc2g0NjgzcUtuZUI2?=
 =?utf-8?B?YXB5UE1CelNzTWNKNkRGQlhheFlzWXpKeUszc1Y5SDdSSzgxaWIyY3BKejl6?=
 =?utf-8?B?eE5PRzFYR09jODlBVU10K0o0QS8yK1dpU3lXMENMNTQ3cTAzK2lyTzh0bnRh?=
 =?utf-8?B?alAwVU1YRGFEQndJendybnc0S2hSUEpVOEdJTm5aY215OXQwaUJ2ZEM1WTIv?=
 =?utf-8?B?K24xc3pJa2pTeWJLK0RwUGJyclBMQVhLaGcvaG40blNiNGhUMnJSRHNCWHVO?=
 =?utf-8?B?Wk1mSzkxQ3Q3WGMwbDc1V2FjRmhWSjRYTlBtdHhqMG1XNW1PTjN0TlZIR2Ri?=
 =?utf-8?B?dVZYdG0zajB4bVZLRmc1RWZzRHVSUnBTdzFTZlRJR2U1UkRCYmlJTEdGTDVZ?=
 =?utf-8?B?YUpXLzF3dFlwa0o2Ti9jdWFIQyttc0dMRHJnNHE2enBCcHgxZjZvUTBXa0tX?=
 =?utf-8?B?eFM2WmIwM0twbG56cEtuckxRdytvYW9VTEEzbkh0cnpNaUx2dFhGME5CZDNZ?=
 =?utf-8?B?Z21taUhpREdMYnR5dlR0SlFiUHVnTWViZjJxZXJHWWVycWY5MHJlSTdaN3VF?=
 =?utf-8?B?K0RHUTFjRkROemVtb0k4Qm1jTFhJOXpGM2hXRW0zYnlmQmlIZU5rdjhYWGNY?=
 =?utf-8?Q?B3YAPimJbuzIP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0241856a-1f4c-42d0-64bf-08d8ef6818aa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 08:29:24.3421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGVvnDJaoyKDwod0ad5ZWCZs9YJRjIzBm4H3exq6eWZREe2K3kogYefMrXOBmi7j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Am 25.03.21 um 09:17 schrieb Oleksandr Natalenko:
> Hello.
>
> On Thu, Mar 25, 2021 at 07:57:33AM +0200, Ilkka Prusi wrote:
>> On 24.3.2021 16.16, Chris Rankin wrote:
>>> Hi,
>>>
>>> Theee warnings ares not present in my dmesg log from 5.11.8:
>>>
>>> [   43.390159] ------------[ cut here ]------------
>>> [   43.393574] WARNING: CPU: 2 PID: 1268 at
>>> drivers/gpu/drm/ttm/ttm_bo.c:517 ttm_bo_release+0x172/0x282 [ttm]
>>> [   43.401940] Modules linked in: nf_nat_ftp nf_conntrack_ftp cfg80211
>> Changing WARN_ON to WARN_ON_ONCE in drivers/gpu/drm/ttm/ttm_bo.c
>> ttm_bo_release() reduces the flood of messages into single splat.
>>
>> This warning appears to come from 57fcd550eb15bce ("drm/ttm: Warn on pinning
>> without holding a reference)" and reverting it might be one choice.
>>
>>
>>> There are others, but I am assuming there is a common cause here.
>>>
>>> Cheers,
>>> Chris
>>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index a76eb2c14e8c..50b53355b265 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -514,7 +514,7 @@ static void ttm_bo_release(struct kref *kref)
>>                   * shrinkers, now that they are queued for
>>                   * destruction.
>>                   */
>> -               if (WARN_ON(bo->pin_count)) {
>> +               if (WARN_ON_ONCE(bo->pin_count)) {
>>                          bo->pin_count = 0;
>>                          ttm_bo_del_from_lru(bo);
>>                          ttm_bo_add_mem_to_lru(bo, &bo->mem);
>>
>>
>>
>> --
>>   - Ilkka
>>
> WARN_ON_ONCE() will just hide the underlying problem. Do we know why
> this happens at all?

The patch was incorrectly back ported to 5.11 without also porting the 
driver changes to not trigger this warning back as well.

We are probably going to revert it for 5.11.10.

Regards,
Christian.

>
> Same for me, BTW, with v5.11.9:
>
> ```
> [~]> lspci | grep VGA
> 0a:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Lexa PRO [Radeon 540/540X/550/550X / RX 540X/550/550X] (rev c7)
>
> [ 3676.033140] ------------[ cut here ]------------
> [ 3676.033153] WARNING: CPU: 7 PID: 1318 at drivers/gpu/drm/ttm/ttm_bo.c:517 ttm_bo_release+0x375/0x500 [ttm]
> …
> [ 3676.033340] Hardware name: ASUS System Product Name/Pro WS X570-ACE, BIOS 3302 03/05/2021
> …
> [ 3676.033469] Call Trace:
> [ 3676.033473]  ttm_bo_move_accel_cleanup+0x1ab/0x3a0 [ttm]
> [ 3676.033478]  amdgpu_bo_move+0x334/0x860 [amdgpu]
> [ 3676.033580]  ttm_bo_validate+0x1f1/0x2d0 [ttm]
> [ 3676.033585]  amdgpu_cs_bo_validate+0x9b/0x1c0 [amdgpu]
> [ 3676.033665]  amdgpu_cs_list_validate+0x115/0x150 [amdgpu]
> [ 3676.033743]  amdgpu_cs_ioctl+0x873/0x20a0 [amdgpu]
> [ 3676.033960]  drm_ioctl_kernel+0xb8/0x140 [drm]
> [ 3676.033977]  drm_ioctl+0x222/0x3c0 [drm]
> [ 3676.034071]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
> [ 3676.034145]  __x64_sys_ioctl+0x83/0xb0
> [ 3676.034149]  do_syscall_64+0x33/0x40
> …
> [ 3676.034171] ---[ end trace 66e9865b027112f3 ]---
> ```
>
> Thanks.
>

