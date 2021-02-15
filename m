Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B4E31B8B0
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 13:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhBOMFx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 07:05:53 -0500
Received: from mail-bn8nam12on2075.outbound.protection.outlook.com ([40.107.237.75]:17222
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230105AbhBOMFp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 07:05:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITbkyHhIzObkx/Bi+tWJfLeaM/QvWN43Fz7EGDR36F0rZzeZvuB467BZ2XjxM/Fk8b6zJ0KSHGekjnT2uBFyfH/bM3WbPtj4bm45/FNbxUmSd4IdksTp25nh+E0UK9iV1ANjsPb6Yeq14buQ7k5YjVBCe3HR+Q8f+by3qoOjDuCYkC1xtJeoJLMbsv4Q0m+yZ4EHzr03ZQmk769yPvZeusTM5J7EW7FNIf/PBW3jPpQ0S3Liu2GYE3qk1x1EQwFvCg1YKzRIDte+ujJTUAgmWVfM5OuTe8X2WM0y28BVkdGNmGT8AW1I/DGxz617/fNdP8N8EI+B0ENM23XkOKNzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kpz8EctCPkZPhLO4zbMPwOKN9Afn9IDqMtHwqnFZM98=;
 b=A7PD094s5jWZY2PiNZx7eWe+EPjyRuvMd3D0kl0A38oVfK1pYFOW6p+kksqJIDX0ZNHyHjYD/jn4gmOysTgVLEcHofuDI+Qq7VkmlHkq6BLuf9/YkvLZ8p0LG8zjZTOnYKMEbAiBT3PYkUc8bNKQB8NDQVUeSnHmq5/oNcl4PS/NuwDNOG6vd9tbZ9y0AbsgjWf7/xFxREhGwjUx7QamZ0dr9yzGjDvZaq1b7nsECdRD4uex3pCYI61AVOGv58HyDmxkJNLuc7ZLkW4yGCzbKfldDB6FCLei5YLd7oC9yWsPMYNtWg0wG1YJfGMbn6BbeB1vq1sMIDkDd4/mBm9j9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kpz8EctCPkZPhLO4zbMPwOKN9Afn9IDqMtHwqnFZM98=;
 b=MtzTVVz5EWwjzmeXXh3IOL1Y0E8KKhgyfjwHU6Pb+gu0SvE7tdCUZVIP3kjrVfQgoPRelhKm4wZBzwshZ5F/PC2XRyu5ZOOJ82EBB9mS60VE7pdvKvhQA6QjLUHGbjB1qsn/xLSRnZKmODYFcwkhBkuY8m4jXP4Aghl+lB7cpHE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4551.namprd12.prod.outlook.com (2603:10b6:208:263::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Mon, 15 Feb
 2021 12:04:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.038; Mon, 15 Feb 2021
 12:04:39 +0000
Subject: Re: DMA-buf and uncached system memory
To:     Lucas Stach <l.stach@pengutronix.de>,
        Simon Ser <contact@emersion.fr>
Cc:     linaro-mm-sig@lists.linaro.org,
        "Sharma, Shashank" <Shashank.Sharma@amd.com>,
        lkml <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <GUuZYSQk2hxgykDhSxfB2GWo47lQlVrKBtWMwQUG7Ar2GAag5WQDxBI0zq6nDTooPBzTktyRpnu25Ju1UKE3FYD9yHbkNMAHcmSI96hoJhA=@emersion.fr>
 <da9edfa0-8a18-44a2-fa79-83b4177afd8e@amd.com>
 <8d23f1ca6fe76d8971365bf54ca71ba71698980d.camel@pengutronix.de>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7ecf008d-a1f5-ddff-c8ac-8e7bfaf9c680@amd.com>
Date:   Mon, 15 Feb 2021 13:04:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <8d23f1ca6fe76d8971365bf54ca71ba71698980d.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3e90:5494:cc4a:73e5]
X-ClientProxiedBy: AM8P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::13) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e90:5494:cc4a:73e5] (2a02:908:1252:fb60:3e90:5494:cc4a:73e5) by AM8P189CA0008.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend Transport; Mon, 15 Feb 2021 12:04:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: afeea6be-3805-4bae-058a-08d8d1a9def9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB45515D53ADED924BE96103AD83889@MN2PR12MB4551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dClTd0xUhNQjRRs+G4mNpjaikB3QMcN4y3+7nLDEWseCLmDgxvzMto7/NeahQUmDy3pJ0xT/w+VDSKyKFhIZRBoLtU+QwSfe0C22QjCuthHY7lWm5+dmK+71DoUeF/VE8V1VWH5dFiCcG/cPYvBNZYrWR2mNDINamH2qcYqMGeJ7u3gvTbPx/0qQSkYlgE5zX42aSYSb46b3P6rGYC4XkVNlhxFyJFEOCrF2XPalgnSVgxgLc5nMoiVfgccPYvrC7H/FKtPQa1c7X//O1Q061h1/Z5Rfvv4q2tnHb5yuNRbqnXiFYoO+l7wOM0Jy9pMrBaEJz/GJkbbVeo+2SBcmg/zBt7OlIFmtWX+jlD2uBNs1dKNEG32bIwnOQQ4oWOefIoGgcCOqjyERVapQzDA4SQOH0i170JTLjNtg5GgAjSkzMzc4qtbgUy4b8sePnSy85o/eyVHBWNN/E4LeoS0aENFfMoZDj30PxQZp8TU9GfFpIejcEoBcqYvXOlluTf6/DQFFDXKMAyiJem6lrmjQeqUJ61WUsAvaWHnpis1z+10gFGIi7xPjglKjJjNSAKwGTKka6W+kWvbBrBEwyyDeliF+quSFdEDoxmgzAGSOb5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(66556008)(2906002)(31686004)(110136005)(6486002)(8936002)(66476007)(6666004)(8676002)(66946007)(52116002)(4326008)(36756003)(5660300002)(83380400001)(316002)(86362001)(2616005)(16526019)(31696002)(478600001)(66574015)(186003)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZnhUZG81akhYK1phdVVWRDE4L1BEQlBubXp3bmRxcWFmSHJuRHE4NEhRK3h5?=
 =?utf-8?B?Y01SejNramR1M1A5VUNOOWxaZHBzelFab3h0dy9HTkhHOERxUlFyYy9hdXl5?=
 =?utf-8?B?Z3BPSTV5ZklNeTRhNTNTeGNVNjMvTGhsL2hvWFRSWkVjblZKM0NPNWxvVkt0?=
 =?utf-8?B?eFR2Rm02MWY2MmZMSEFHd0NnNnNMM1FHcTF5TVdZaVlsV2tlNmdFMFRqb3BX?=
 =?utf-8?B?NkMyOGI2ZDZ4cGZ3N3J0cU96TFFZNnhMZ0VMVHNkTXkyWTVlT0pURVdQQktJ?=
 =?utf-8?B?b05CakRIZDBYcU44VllhWVNaN29WeUw2ZDdJQ1hmMHNOOXBSOGxPY05oTWNO?=
 =?utf-8?B?UlNxT05xWENrck1GcElmVCsyb2dvTjg3SXRCUzkzWTJTV1ZSVDQ0MW5hNlkr?=
 =?utf-8?B?RW9VMGFsUHE2aGdqOGE0WmJJRy9hKzZteCtnVGNVYlBML1J6aDEzRDZwd25U?=
 =?utf-8?B?VnNJeEhGY1cwdUNWTWVnNlNqK2J0eXlzTUd2L21uRDhmODU5Q00yaUJWMmJD?=
 =?utf-8?B?Z1loSUZQSDd1SDk3MnFmWlBDOTJ4UE5vbU81emt5U1UwbUwzYnFTUndublJX?=
 =?utf-8?B?Q0hqSXhqRS9FemMrcThtQjlaUVZEUEdTazUyblMzTXMrVDQ2L2dtdHFPNVJC?=
 =?utf-8?B?SDNJdmlRWmRYR0EyUm5QbGdTSVlVdVNNYWZrdE9MWVhSNTdyV1krVzBaRjdF?=
 =?utf-8?B?VHBWeFdHa0pSNXU2S3dhci90emFJYXlVT0wvbTNGd21UQ1E3dFEwbnNKSEVV?=
 =?utf-8?B?L0grcndlL0QwRzA2OTd0RUs2RDZOdy92bGpjeGhzd0U1Q0djbjRGOWVwWUhM?=
 =?utf-8?B?WWlkd3JhZzc2SFF5bTZzMnAwMElWYWE4WWlpYXluZEM3RjJCKzJhNENiQ2Ft?=
 =?utf-8?B?Qm16aHEvL1N3UGVNSjVEMVVXSVMvN2phTG55WWN2N3A3N0NiM2NBanRIWElu?=
 =?utf-8?B?eUNXQkpkbk5pUW1hN1plN3ZPRUprYkF6UGJUd05Ua2I2RUEvOTJWTlpUQjlW?=
 =?utf-8?B?TmRyRzF4UXQ5T3JweThVS3dTSHp0cEt0NWFlM2JhckZPM0dVb3YwczNuOTNh?=
 =?utf-8?B?UVc0RjNyc0VMQjNjRWNNUDBSd2pqUHZDMk9PTmd1QkduRVBkbk5NRWlsbU1N?=
 =?utf-8?B?aU82eG42SE1JeDEyY1JaWFBtcEJGQ2RncElxd1RFc3dnMy9vNjNiNEl1dHJC?=
 =?utf-8?B?aXlNNzZkYU9SVlQwaE9UVmZWUENFYTZqTC9mL3Jtd1hFRVpkU29yLzRPL2NN?=
 =?utf-8?B?bDA0MVVNaUYrU0pDWVFJQktxQWRwMDRGUnNhN1BhR1MxeTViRDgxZmpld2dR?=
 =?utf-8?B?enpUR1RQSmhRdk5RbXEvVlFZTXpwaGJrWkNacUZIQXdmVGpwdE5QZkxvbTlQ?=
 =?utf-8?B?THNNaG9zeUh5dTg3a1NtVzRpY3BRY2hIRGNqalMxNTlQNWxZekYzYWo3SExk?=
 =?utf-8?B?TWJIOUdOcmJRUmVJdXlTU0xLbnpoRGFTNFBCeEJtcmtqNGhJS3NrVG9TV1Y3?=
 =?utf-8?B?NjR1eWZ2MjgwYWdpcjVPbVg5Uk1oemJZL3BENEdNbkJkdmJ4VEFEOFJ3Ymh1?=
 =?utf-8?B?ZmxCckw5S2w5WDBKVVFRRkg3ZTk4T25aMjJXVVBHRHFBWndZMnVYT1plSkM0?=
 =?utf-8?B?QVdtaDdhNVVRME45MTYvbnM4RERzZDdyTml2T0ZlUXJZcjZoT1p6Z1c1TTNB?=
 =?utf-8?B?ZGhuWVVtU2FaNEVqQ3pjUDN0OHFIZ3RVeUhLdUw2WDdlWFVQNUJTZzFJelhT?=
 =?utf-8?B?N0JuVEpxS1FLWmg1NDc2Zlc0SS9UeHhBSWc0NFQ4ekN4ZU5NVFR4MFUrMTBK?=
 =?utf-8?B?azhIR3pMWVdGNGhkN25sVFJXVjArNVBnN3lLanBycUE5RDFweVpXOUdHQVZz?=
 =?utf-8?Q?axPYSqXsXGxLm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afeea6be-3805-4bae-058a-08d8d1a9def9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 12:04:39.4734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtKS31DBpn5i8URs0cZjcmWrQxjJNQ6h5n9C4qT8ixf8abvpI4wkYLY/DGi3Ksol
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 15.02.21 um 12:53 schrieb Lucas Stach:
> Am Montag, dem 15.02.2021 um 10:34 +0100 schrieb Christian König:
>> Am 15.02.21 um 10:06 schrieb Simon Ser:
>>> On Monday, February 15th, 2021 at 9:58 AM, Christian König <christian.koenig@amd.com> wrote:
>>>
>>>> we are currently working an Freesync and direct scan out from system
>>>> memory on AMD APUs in A+A laptops.
>>>>
>>>> On problem we stumbled over is that our display hardware needs to scan
>>>> out from uncached system memory and we currently don't have a way to
>>>> communicate that through DMA-buf.
>>>>
>>>> For our specific use case at hand we are going to implement something
>>>> driver specific, but the question is should we have something more
>>>> generic for this?
>>>>
>>>> After all the system memory access pattern is a PCIe extension and as
>>>> such something generic.
>>> Intel also needs uncached system memory if I'm not mistaken?
>> No idea, that's why I'm asking. Could be that this is also interesting
>> for I+A systems.
>>
>>> Where are the buffers allocated? If GBM, then it needs to allocate memory that
>>> can be scanned out if the USE_SCANOUT flag is set or if a scanout-capable
>>> modifier is picked.
>>>
>>> If this is about communicating buffer constraints between different components
>>> of the stack, there were a few proposals about it. The most recent one is [1].
>> Well the problem here is on a different level of the stack.
>>
>> See resolution, pitch etc:.. can easily communicated in userspace
>> without involvement of the kernel. The worst thing which can happen is
>> that you draw garbage into your own application window.
>>
>> But if you get the caching attributes in the page tables (both CPU as
>> well as IOMMU, device etc...) wrong then ARM for example has the
>> tendency to just spontaneously reboot
>>
>> X86 is fortunately a bit more gracefully and you only end up with random
>> data corruption, but that is only marginally better.
>>
>> So to sum it up that is not something which we can leave in the hands of
>> userspace.
>>
>> I think that exporters in the DMA-buf framework should have the ability
>> to tell importers if the system memory snooping is necessary or not.
> There is already a coarse-grained way to do so: the dma_coherent
> property in struct device, which you can check at dmabuf attach time.
>
> However it may not be enough for the requirements of a GPU where the
> engines could differ in their dma coherency requirements. For that you
> need to either have fake struct devices for the individual engines or
> come up with a more fine-grained way to communicate those requirements.

Yeah, that won't work. We need this on a per buffer level.

>> Userspace components can then of course tell the exporter what the
>> importer needs, but validation if that stuff is correct and doesn't
>> crash the system must happen in the kernel.
> What exactly do you mean by "scanout requires non-coherent memory"?
> Does the scanout requestor always set the no-snoop PCI flag, so you get
> garbage if some writes to memory are still stuck in the caches, or is
> it some other requirement?

Snooping the CPU caches introduces some extra latency, so what can 
happen is that the response to the PCIe read comes to late for the 
scanout. The result is an underflow and flickering whenever something is 
in the cache which needs to be flushed first.

On the other hand when the don't snoop the CPU caches we at least get 
garbage/stale data on the screen. That wouldn't be that worse, but the 
big problem is that we have also seen machine check exceptions when 
don't snoop and the cache is dirty.

So this should better be coherent or you can crash the box. ARM seems to 
be really susceptible for this, x86 is fortunately much more graceful 
and I'm not sure about other architectures.

Regards,
Christian.

>
> Regards,
> Lucas
>

