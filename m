Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86BF13BE780
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 13:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhGGMAU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 08:00:20 -0400
Received: from mail-dm6nam08on2087.outbound.protection.outlook.com ([40.107.102.87]:34273
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231358AbhGGMAU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Jul 2021 08:00:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmqMshXIodsbVG00PS6TRDG++tMI93aH3Uj8R7AOuglegPoL9nHkF/GWE1a5NgI0vBsURLYd0MWWIWwuNs2rDnUAqAQh8azDz2QyU2uXCWuvfD4VeZ7SvO7AA60tmQOk7Ykvv/UCQZEO+RTgQLsFyZzvhJJau4W/tI05U6rizcbBxR+bJfcEC9LguqU1iwvK+GtSTXGzgGbfAZklx3Jp6DC6DQA2LGvPJxfwS5+fj5qu5+ueUiM+f00sp6j4fTrYzhIbZJuo1q9tJ8aVLeNQUeOj51U7b/ZsHIFET1l1rigLB11Lj833kPPD4ZFzcN9D1SmKC4rETt9SPnX/Gz0LQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keLnihlH2eSGjN8M4mdPZTstEitViITySJ7RS5w9fo0=;
 b=nxWSldqprZxdH8MN2N2PDmDCYd035F/D6+r1B9LX3QeeM+BDWbfjsMRVJzjfE5LQlmA/rI7+SGCz7mjebD37WjvrYzTu2r5yHGqRHVgebOJbbIcdz83118j8GWk2JE2AuEJ/uamtdTmFmRegvSPoHEuhkg5Qehgi3amAFitEErxNtwYUQF6WEQ/xnX4SUmccuYxq90JpKHXF4o6Rf7qlZ1dHrlBaWuUkv48HK1UGNKRw2sne2dGVtMBZfRqYcGLvav/7tniRkAWBnZ1tYYsLCwl6UqbEDhGo1rRH01x+nkUdXWwNtgba30/4IWpxUDvxrPedtZ7Xn4nlAUlhYtnzGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=keLnihlH2eSGjN8M4mdPZTstEitViITySJ7RS5w9fo0=;
 b=q/vGDeFdBDZO4dpUVO9s0OpA4c8vgiVGgEXKZGAx9CSigoolvy7mU9fL27vCZMOJqmWnCfMMEjrUUsLNRXBTRm1C3qLBViIexECcIxV1z5edMefCYpnV7defZyOSVyRpatAK3SUw0YXaOx6Hjqu3771ZH0jix5xxYvMnZLIVng4=
Authentication-Results: anholt.net; dkim=none (message not signed)
 header.d=none;anholt.net; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3952.namprd12.prod.outlook.com (2603:10b6:208:164::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 11:57:32 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 11:57:31 +0000
Subject: Re: [PATCH v2 01/11] drm/sched: Split drm_sched_job_init
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Steven Price <steven.price@arm.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Qiang Yu <yuq825@gmail.com>, Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Adam Borowski <kilobyte@angband.pl>,
        Nick Terrell <terrelln@fb.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Sami Tolvanen <samitolvanen@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Dave Airlie <airlied@redhat.com>,
        Nirmoy Das <nirmoy.das@amd.com>,
        Deepak R Varma <mh12gx2825@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Kevin Wang <kevin1.wang@amd.com>,
        Chen Li <chenli@uniontech.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
        Dennis Li <Dennis.Li@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Sonny Jiang <sonny.jiang@amd.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        lima@lists.freedesktop.org,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Emma Anholt <emma@anholt.net>
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
 <20210702213815.2249499-2-daniel.vetter@ffwll.ch>
 <a5c5647e-e0ce-cc6d-c473-685679739051@amd.com>
 <CAKMK7uGTSe9FZCup=6D2G3MWGuxoUiV3Qjau-pQyaqOAX8OTug@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8387b5f8-a5f6-fc2d-48e6-4bb0768ac642@amd.com>
Date:   Wed, 7 Jul 2021 13:57:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uGTSe9FZCup=6D2G3MWGuxoUiV3Qjau-pQyaqOAX8OTug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0074.eurprd07.prod.outlook.com
 (2603:10a6:207:4::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7671:3328:2129:96b5] (2a02:908:1252:fb60:7671:3328:2129:96b5) by AM3PR07CA0074.eurprd07.prod.outlook.com (2603:10a6:207:4::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend Transport; Wed, 7 Jul 2021 11:57:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca5ad3b9-2894-471e-4a63-08d9413e665c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3952:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3952ACD1E4D711296D48ED3D831A9@MN2PR12MB3952.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9WnVOBIo8dfB7pWLVN9Rzxycn3zx+C9eh0bVDeIbjUkVlX6Waj9AE0FrZfwD0C1dBn9PSsGpeRjKqKPlClDFh8liZf3vhcoGabywMggrSqKai8FFgx1LjnOhcEDPN8rL0BeUUJX4m7WzmaqTWFLR7deb0Powd8o4xreL9xRNCUAeYWaL/8Wl6e5kvTrLBoauiH/20d558VQovDXNlnkgjv/aXWQfvRYVQBKwvE2cObBYMFR08muQGWk/lMYx6vFqspc57x0KouZF2XuqO5BvtoqOJGLKfX2APqPVSYaQGtormVX2dVYU+PZytgaqgOYrSSYlnt2rOO3K62ynq/Atq8tmLUfpgG3yhtZjeG9yYukGUli19pLW/K9H94RSs6KRPXBNVRGeeZf1NzAzMFk5bU2N6VhbjN2HjeuGCYFoWxx6YNLdB8x2vSHEXc9JxvprTOLV9WS2EYVDEUwCy/A7gX99mVUiOmqPyKAUWb+SUGDrftJGRIz/cu/b3gddaFbp5/j5e0PtQz5XPNiI6TdIcJVq6oM8sizn0n/S1u+i5edBd+o7I6sLPW5bYij/3Su7q9N5mcjSBwF0gXyHQHJrR28Flovr2suiC8MCZQJQ13ANovlBfE2duHEqsrx9L3FNyxjFU6+eUTLbaHBaJIT4r9BlEHw7K6XPgRC+mUic8Vm6cQNGpCA9400XR+1ytiECYKb28AJyUOTf6vl5uEUKtg0+J3wcxxguF+gLhLHltCA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(30864003)(6916009)(66476007)(66946007)(8936002)(36756003)(4326008)(478600001)(66574015)(6486002)(83380400001)(38100700002)(316002)(8676002)(54906003)(5660300002)(186003)(2906002)(53546011)(66556008)(86362001)(31696002)(7406005)(31686004)(2616005)(6666004)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlBqTTJaQ2V4d2tCQWhGWUthSy9IaWh2dlFpNHpmYm1LK3pYa2wyZTdSU3kz?=
 =?utf-8?B?YVlMamVLZWh6M0h3UFF0VXRSSU9idzFyR0lVcld4aGNIbTFZYXhpWXZ5ZG9X?=
 =?utf-8?B?bVRBT1ZWMWxscU45eXVXUGQyeER6RnZ5ZUplUW9CTE16dXpVd1d0aHBUVUN4?=
 =?utf-8?B?Rk1lcFJ4amhFNTBSaFRYbXdCUGY3aVpKL0hvR1lFM21PUWZWKzQ0SUIrWGZ5?=
 =?utf-8?B?aURKUVJwMkkxcUtTRGpjM2U5eER1QkpRamtRL3Z5THRsL3VBQW9sMmhGckFk?=
 =?utf-8?B?NWVEMVAxYVNYN0tpY0VpTE5wUXpWN2Y0WUJqOFhUeVRtOERDNlNkYUMvSDdq?=
 =?utf-8?B?Yjk1bnZkZXVNb1RIS3g1eERjdzVoQXhhSWlNVTRKYUxPMEZBUFozM3F4cGp6?=
 =?utf-8?B?WFhER1NENTFnYUpDZTJaelF0ekFHNVZWaVJOM1V5eXJ5RUZiVlRNRGxDVGN5?=
 =?utf-8?B?UE1hdUZmUXJpN1NCTDc0ZnZEVDJyOFlYaWdGaWhYazFhczRHQ3VJL21pN3lT?=
 =?utf-8?B?KzhIN0N4NkxaTGtkU1J4emFJSTgvUXFYMHg1SW5say9sM1NZUTFpVmdiNFJI?=
 =?utf-8?B?NU80aDYzaG05b245RnlMeTdjZ3VhTFk5ZWpMZ0t6UG50VG1kSHZMWXdBcExh?=
 =?utf-8?B?V1Z6RlFQamw1dlN6Y09sQTlvSDlpN1BUUFRwN1d2NEFXWUdEVXcyOWZ6NmE0?=
 =?utf-8?B?elBYU1MvZHg3RmNJSDJtbWh5ME0yNUJNT0NNT25TUURZcm1YODNGLzNZU1Qr?=
 =?utf-8?B?S2xNQTl6ZUc3Nk95enpndXdmYk9CbTR3R2RrNVJlYjhJcFMwdVBCYW9kNzRS?=
 =?utf-8?B?N2p5ekJtQkZ1R0lhaWFzaFlSbVNFUmxOUFp6eFVQK3ZXYWY0d2diREVCczc3?=
 =?utf-8?B?YndTUlBXdnRBU3lsaCtoajRpd1BRZEZqZWJOQkZvSEtXSkNsajA0QlhYZTBO?=
 =?utf-8?B?MVNkTGJLcmJoczNZSVcvTUpVWDVrL2pVS0k2N1RpRFBITU54bWhBWlZlTFZq?=
 =?utf-8?B?dHlCTTE2RjRUajZnZGxERkZrNTU5Tis3V2ZiYk1QY01wSktPUFN2bDJ5ejQx?=
 =?utf-8?B?eUV6cUI1NGlBdWFsamZ1VENRV2Nla3FndVVrZkc0ZlVLU1FITlJXUHRxQzVY?=
 =?utf-8?B?aDZHb1BNejRLeFo2NGJwNVNXQ0lhZHlneWw5SVpPK3B5WFJkM29raVlTSlR4?=
 =?utf-8?B?QSsxWHVNbEx5Zk5XaVMrYVErdkRxTDZxVXVkNm1ycHkva2tzVXJzNTVTZnhJ?=
 =?utf-8?B?QnVLYXh6VUpid3A3SGxOQk9TN3VNTHdGM29aSXhlT3lzaHp4bG03R21WUVIy?=
 =?utf-8?B?UmUyM3lzWWdlbXpFbFdjczI2ZzZGMElKczgvRGpFVTFGQjFBY3JpZjI0RFRv?=
 =?utf-8?B?a3krMWphMno5M1FlbFIyTGRMcTFxTDFSWW9rZVBrNjd6QmhpYk9YZDVtcHRF?=
 =?utf-8?B?RDYweXF2VERFb3loM1MyYTBwZVFZNHNyK1NtNks0M1hPTmhlQU9HdW82cHlu?=
 =?utf-8?B?Z29vTit4RXZvbXUxc1dwVysxM29CdndEZm1PNGVUUzJSeXhweFNrQ2RpUEdT?=
 =?utf-8?B?ZEh1T3B3UmxqLzMxTzJ6YVEvOGx1cDZjcjd4dHk5UEIrcEN1NDJRMjI1MHFj?=
 =?utf-8?B?Q0txU1RGRkN0VzF1MmJ6MHJ6bHNaL3Z4WnBLbXgvWW9WM2kxVkZVV1VyMW5j?=
 =?utf-8?B?WGt6RVhXdnVPTmFsc3ZxTzZPaUVkb2ZRUmxzQ3RjWDhkUnhHRTRVUGpVQ09o?=
 =?utf-8?B?ay9NT3RKdGVoY0xCczJ3aUV6Y3BrZG1ZalJUQjVTUmxISEFjS3dsNHNvOWtN?=
 =?utf-8?B?blNZdWRBL1V2L2Fsc2g5Z211MVQrRnY0QVpXSXlQUS9EcE1Ca0ZQazMzTkds?=
 =?utf-8?Q?v1AowPpscksNP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5ad3b9-2894-471e-4a63-08d9413e665c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 11:57:31.3736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2kDNYrsBBJXsMnJ1giovG9EEnlNyIipP3psntgBN0gFNBi6TS/aNaEPCbOqb/XE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3952
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 07.07.21 um 13:14 schrieb Daniel Vetter:
> On Wed, Jul 7, 2021 at 11:30 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 02.07.21 um 23:38 schrieb Daniel Vetter:
>>> This is a very confusingly named function, because not just does it
>>> init an object, it arms it and provides a point of no return for
>>> pushing a job into the scheduler. It would be nice if that's a bit
>>> clearer in the interface.
>>>
>>> But the real reason is that I want to push the dependency tracking
>>> helpers into the scheduler code, and that means drm_sched_job_init
>>> must be called a lot earlier, without arming the job.
>>>
>>> v2:
>>> - don't change .gitignore (Steven)
>>> - don't forget v3d (Emma)
>>>
>>> v3: Emma noticed that I leak the memory allocated in
>>> drm_sched_job_init if we bail out before the point of no return in
>>> subsequent driver patches. To be able to fix this change
>>> drm_sched_job_cleanup() so it can handle being called both before and
>>> after drm_sched_job_arm().
>> Thinking more about this, I'm not sure if this really works.
>>
>> See drm_sched_job_init() was also calling drm_sched_entity_select_rq()
>> to update the entity->rq association.
>>
>> And that can only be done later on when we arm the fence as well.
> Hm yeah, but that's a bug in the existing code I think: We already
> fail to clean up if we fail to allocate the fences. So I think the
> right thing to do here is to split the checks into job_init, and do
> the actual arming/rq selection in job_arm? I'm not entirely sure
> what's all going on there, the first check looks a bit like trying to
> schedule before the entity is set up, which is a driver bug and should
> have a WARN_ON?

No you misunderstood me, the problem is something else.

You asked previously why the call to drm_sched_job_init() was so late in 
the CS.

The reason for this was not alone the scheduler fence init, but also the 
call to drm_sched_entity_select_rq().

> The 2nd check around last_scheduled I have honeslty no idea what it's
> even trying to do.

You mean that here?

         fence = READ_ONCE(entity->last_scheduled);
         if (fence && !dma_fence_is_signaled(fence))
                 return;

This makes sure that load balancing is not moving the entity to a 
different scheduler while there are still jobs running from this entity 
on the hardware,

Regards
Christian.

> -Daniel
>
>> Christian.
>>
>>> Also improve the kerneldoc for this.
>>>
>>> Acked-by: Steven Price <steven.price@arm.com> (v2)
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
>>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>>> Cc: Qiang Yu <yuq825@gmail.com>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>> Cc: Steven Price <steven.price@arm.com>
>>> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>> Cc: Kees Cook <keescook@chromium.org>
>>> Cc: Adam Borowski <kilobyte@angband.pl>
>>> Cc: Nick Terrell <terrelln@fb.com>
>>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
>>> Cc: Sami Tolvanen <samitolvanen@google.com>
>>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Nirmoy Das <nirmoy.das@amd.com>
>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
>>> Cc: Lee Jones <lee.jones@linaro.org>
>>> Cc: Kevin Wang <kevin1.wang@amd.com>
>>> Cc: Chen Li <chenli@uniontech.com>
>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>> Cc: "Marek Olšák" <marek.olsak@amd.com>
>>> Cc: Dennis Li <Dennis.Li@amd.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Cc: Sonny Jiang <sonny.jiang@amd.com>
>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>> Cc: Tian Tao <tiantao6@hisilicon.com>
>>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
>>> Cc: etnaviv@lists.freedesktop.org
>>> Cc: lima@lists.freedesktop.org
>>> Cc: linux-media@vger.kernel.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> Cc: Emma Anholt <emma@anholt.net>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
>>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
>>>    drivers/gpu/drm/lima/lima_sched.c        |  2 ++
>>>    drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
>>>    drivers/gpu/drm/scheduler/sched_entity.c |  6 ++--
>>>    drivers/gpu/drm/scheduler/sched_fence.c  | 17 +++++----
>>>    drivers/gpu/drm/scheduler/sched_main.c   | 46 +++++++++++++++++++++---
>>>    drivers/gpu/drm/v3d/v3d_gem.c            |  2 ++
>>>    include/drm/gpu_scheduler.h              |  7 +++-
>>>    10 files changed, 74 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index c5386d13eb4a..a4ec092af9a7 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>>        if (r)
>>>                goto error_unlock;
>>>
>>> +     drm_sched_job_arm(&job->base);
>>> +
>>>        /* No memory allocation is allowed while holding the notifier lock.
>>>         * The lock is held until amdgpu_cs_submit is finished and fence is
>>>         * added to BOs.
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index d33e6d97cc89..5ddb955d2315 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
>>>        if (r)
>>>                return r;
>>>
>>> +     drm_sched_job_arm(&job->base);
>>> +
>>>        *f = dma_fence_get(&job->base.s_fence->finished);
>>>        amdgpu_job_free_resources(job);
>>>        drm_sched_entity_push_job(&job->base, entity);
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> index feb6da1b6ceb..05f412204118 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
>>>        if (ret)
>>>                goto out_unlock;
>>>
>>> +     drm_sched_job_arm(&submit->sched_job);
>>> +
>>>        submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
>>>        submit->out_fence_id = idr_alloc_cyclic(&submit->gpu->fence_idr,
>>>                                                submit->out_fence, 0,
>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>> index dba8329937a3..38f755580507 100644
>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>> @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *task,
>>>                return err;
>>>        }
>>>
>>> +     drm_sched_job_arm(&task->base);
>>> +
>>>        task->num_bos = num_bos;
>>>        task->vm = lima_vm_get(vm);
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> index 71a72fb50e6b..2992dc85325f 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> @@ -288,6 +288,8 @@ int panfrost_job_push(struct panfrost_job *job)
>>>                goto unlock;
>>>        }
>>>
>>> +     drm_sched_job_arm(&job->base);
>>> +
>>>        job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>
>>>        ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 79554aa4dbb1..f7347c284886 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>     * @sched_job: job to submit
>>>     * @entity: scheduler entity
>>>     *
>>> - * Note: To guarantee that the order of insertion to queue matches
>>> - * the job's fence sequence number this function should be
>>> - * called with drm_sched_job_init under common lock.
>>> + * Note: To guarantee that the order of insertion to queue matches the job's
>>> + * fence sequence number this function should be called with drm_sched_job_arm()
>>> + * under common lock.
>>>     *
>>>     * Returns 0 for success, negative error code otherwise.
>>>     */
>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>> index 69de2c76731f..c451ee9a30d7 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>> @@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>>>     *
>>>     * Free up the fence memory after the RCU grace period.
>>>     */
>>> -static void drm_sched_fence_free(struct rcu_head *rcu)
>>> +void drm_sched_fence_free(struct rcu_head *rcu)
>>>    {
>>>        struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
>>>        struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>> @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>>>    }
>>>    EXPORT_SYMBOL(to_drm_sched_fence);
>>>
>>> -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>>> -                                            void *owner)
>>> +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>> +                                           void *owner)
>>>    {
>>>        struct drm_sched_fence *fence = NULL;
>>> -     unsigned seq;
>>>
>>>        fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
>>>        if (fence == NULL)
>>> @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>>>        fence->sched = entity->rq->sched;
>>>        spin_lock_init(&fence->lock);
>>>
>>> +     return fence;
>>> +}
>>> +
>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>> +                       struct drm_sched_entity *entity)
>>> +{
>>> +     unsigned seq;
>>> +
>>>        seq = atomic_inc_return(&entity->fence_seq);
>>>        dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>>                       &fence->lock, entity->fence_context, seq);
>>>        dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>>>                       &fence->lock, entity->fence_context + 1, seq);
>>> -
>>> -     return fence;
>>>    }
>>>
>>>    module_init(drm_sched_fence_slab_init);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 33c414d55fab..5e84e1500c32 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -48,9 +48,11 @@
>>>    #include <linux/wait.h>
>>>    #include <linux/sched.h>
>>>    #include <linux/completion.h>
>>> +#include <linux/dma-resv.h>
>>>    #include <uapi/linux/sched/types.h>
>>>
>>>    #include <drm/drm_print.h>
>>> +#include <drm/drm_gem.h>
>>>    #include <drm/gpu_scheduler.h>
>>>    #include <drm/spsc_queue.h>
>>>
>>> @@ -569,7 +571,6 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>>>
>>>    /**
>>>     * drm_sched_job_init - init a scheduler job
>>> - *
>>>     * @job: scheduler job to init
>>>     * @entity: scheduler entity to use
>>>     * @owner: job owner for debugging
>>> @@ -577,6 +578,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>>>     * Refer to drm_sched_entity_push_job() documentation
>>>     * for locking considerations.
>>>     *
>>> + * Drivers must make sure drm_sched_job_cleanup() if this function returns
>>> + * successfully, even when @job is aborted before drm_sched_job_arm() is called.
>>> + *
>>>     * Returns 0 for success, negative error code otherwise.
>>>     */
>>>    int drm_sched_job_init(struct drm_sched_job *job,
>>> @@ -594,7 +598,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>        job->sched = sched;
>>>        job->entity = entity;
>>>        job->s_priority = entity->rq - sched->sched_rq;
>>> -     job->s_fence = drm_sched_fence_create(entity, owner);
>>> +     job->s_fence = drm_sched_fence_alloc(entity, owner);
>>>        if (!job->s_fence)
>>>                return -ENOMEM;
>>>        job->id = atomic64_inc_return(&sched->job_id_count);
>>> @@ -606,13 +610,47 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>    EXPORT_SYMBOL(drm_sched_job_init);
>>>
>>>    /**
>>> - * drm_sched_job_cleanup - clean up scheduler job resources
>>> + * drm_sched_job_arm - arm a scheduler job for execution
>>> + * @job: scheduler job to arm
>>> + *
>>> + * This arms a scheduler job for execution. Specifically it initializes the
>>> + * &drm_sched_job.s_fence of @job, so that it can be attached to struct dma_resv
>>> + * or other places that need to track the completion of this job.
>>> + *
>>> + * Refer to drm_sched_entity_push_job() documentation for locking
>>> + * considerations.
>>>     *
>>> + * This can only be called if drm_sched_job_init() succeeded.
>>> + */
>>> +void drm_sched_job_arm(struct drm_sched_job *job)
>>> +{
>>> +     drm_sched_fence_init(job->s_fence, job->entity);
>>> +}
>>> +EXPORT_SYMBOL(drm_sched_job_arm);
>>> +
>>> +/**
>>> + * drm_sched_job_cleanup - clean up scheduler job resources
>>>     * @job: scheduler job to clean up
>>> + *
>>> + * Cleans up the resources allocated with drm_sched_job_init().
>>> + *
>>> + * Drivers should call this from their error unwind code if @job is aborted
>>> + * before drm_sched_job_arm() is called.
>>> + *
>>> + * After that point of no return @job is committed to be executed by the
>>> + * scheduler, and this function should be called from the
>>> + * &drm_sched_backend_ops.free_job callback.
>>>     */
>>>    void drm_sched_job_cleanup(struct drm_sched_job *job)
>>>    {
>>> -     dma_fence_put(&job->s_fence->finished);
>>> +     if (!kref_read(&job->s_fence->finished.refcount)) {
>>> +             /* drm_sched_job_arm() has been called */
>>> +             dma_fence_put(&job->s_fence->finished);
>>> +     } else {
>>> +             /* aborted job before committing to run it */
>>> +             drm_sched_fence_free(&job->s_fence->finished.rcu);
>>> +     }
>>> +
>>>        job->s_fence = NULL;
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_job_cleanup);
>>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
>>> index 4eb354226972..5c3a99027ecd 100644
>>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>>> @@ -475,6 +475,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
>>>        if (ret)
>>>                return ret;
>>>
>>> +     drm_sched_job_arm(&job->base);
>>> +
>>>        job->done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>
>>>        /* put by scheduler job completion */
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 88ae7f331bb1..83afc3aa8e2f 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -348,6 +348,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
>>>    int drm_sched_job_init(struct drm_sched_job *job,
>>>                       struct drm_sched_entity *entity,
>>>                       void *owner);
>>> +void drm_sched_job_arm(struct drm_sched_job *job);
>>>    void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>                                    struct drm_gpu_scheduler **sched_list,
>>>                                       unsigned int num_sched_list);
>>> @@ -387,8 +388,12 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>>                                   enum drm_sched_priority priority);
>>>    bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>>>
>>> -struct drm_sched_fence *drm_sched_fence_create(
>>> +struct drm_sched_fence *drm_sched_fence_alloc(
>>>        struct drm_sched_entity *s_entity, void *owner);
>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>> +                       struct drm_sched_entity *entity);
>>> +void drm_sched_fence_free(struct rcu_head *rcu);
>>> +
>>>    void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>>>    void drm_sched_fence_finished(struct drm_sched_fence *fence);
>>>
>

