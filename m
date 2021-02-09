Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 832F2314E18
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 12:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhBILRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 06:17:25 -0500
Received: from mail-mw2nam10on2058.outbound.protection.outlook.com ([40.107.94.58]:32096
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229935AbhBILQH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 06:16:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inDZRq6KtawTkQWwJKVly04Pi52kT6TTdP7rGupIzEcqmN8fjlkKAo005w/i+7FpKY5WwE+0ewshvVxhzD7SKDv9Em90cuIaLb/SA9+Q6u4o8/5jJTuYbG4OMv288XuRKs/mug21fJeTyilQt4fC4SS+iJgbwc29NgmoyqAmbv+Q+KPFqWp2HWzyHDC0BjGFiv4WYcEfq5nW/glH46lZt5KNvwFIwDYMEF1mlkthj7NPeAdUstd/7ZDl7ikrV9yVO5TKlqu0u3Ur1UYLUuDWpDtHO0Ka4OijBLhS87Zy/7AjhVmszkfZ1Gm7+5qHYNv0SX2kWQz/65X7LZhJJpQwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCRH1dCTEQ2z53kMwRYUYU7Zgv8AL4xaJ+B3apxQkx4=;
 b=n1tP+0BJG6NS7BQgFzOBGoqlLc2z/PiYOCnBCBkBB2pqr5+eTzic5RjYKOdcxF62vHv4Nae1HdcEM83xrDEpfLljuqyXrER4+IEBDfh2NPAbHIvknaMpfg2ZTqbD/QXnQsJqRXK80kjmDytGBTrtYvDFPPsJrYJySwVP4cp/GJH4K+nkvl6ec8a0oahU0A/228t3rYL1vtEehByvsL/9LCNIZ8MjTkZNSxDPe1eSg5j+XvXODrvNqsDMbKgqDY/JDYSjWuhU5B61vsKPWKGXLXeweQvzL00I3NL3Z0J0QWPxsTpYh6M2QlGz9gYong7aQ9JdV2NWxkkIQCue8mGrYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCRH1dCTEQ2z53kMwRYUYU7Zgv8AL4xaJ+B3apxQkx4=;
 b=dnOEh27CStl+1PHBUNMQ9CiKWmbFLbgQsgqwDfmUquxLsajgOsN2YUrLghRNsakj9WSNGIHrbLaRyysdDBs8T2jPaLIoKTLAtrXg9dBQsTp/r/JJaZH8l5VCUaQIs/7tDw9H7aKiiGiMh4EJb9Zb24uiUTQAeTmNN3uN4EZF80Y=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4868.namprd12.prod.outlook.com (2603:10b6:208:1c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Tue, 9 Feb
 2021 11:15:11 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%8]) with mapi id 15.20.3784.022; Tue, 9 Feb 2021
 11:15:11 +0000
Subject: Re: [Linaro-mm-sig] [PATCH] RFC: dma-fence: Document recoverable page
 fault implications
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc:     "Koenig, Christian" <christian.koenig@amd.com>,
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
From:   Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <d08c9a4c-e054-0f05-ebaf-94e05d98b798@amd.com>
Date:   Tue, 9 Feb 2021 06:15:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uFwdmV007YhCF8ZDkzNFT71RapLPL5zHgjjsFd9huoUEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YTOPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::22) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by YTOPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Tue, 9 Feb 2021 11:15:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f4907078-f703-4804-c119-08d8ccebf782
X-MS-TrafficTypeDiagnostic: BL0PR12MB4868:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4868F0AAAB3B8C62AD261BEA928E9@BL0PR12MB4868.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QbV9kQ3w+ws5fLzNj7MY/oGjk8Rm2HrXvGrV+uWTDCOaqCeKwxMMQ5rtFHQ2Tvnn1XNlr+xMBB0RWWZYdT02kW+lPM9VqFWGaeIcNvlMtbesqrj4rdrGeN6D64OWJjpEoEygsojYI6HrbvMDTg2Hz8QlqnYNheEJpT5o/MWYgi23i3HLTuVF8UDgiAW9OyCr/T4FVdVJXBZmv1emXNjf6yv4OQQS9+jxLa5uNkdXXsCvdxKjo5dPn+AVzZ6CRfPSD3DZ7GwQCrJ8zFnhfx3dltL948rfe2He0UqVNhyhPOsfZA7ju8RGP2FKz3s2L0F/07+9wS4ZvPK3VT8nYih3JFKoYNvdfjjgzVzXCqUsb2HZYLsIlFS1+gmgpNr0v0PBSAHFDZuAPThIYw3WuHTHUmmqbycSgPwEpj00nqi7SeJZDc1566lO7ENySOWB4N/0eq17o4/j0MyT18fOq4eD6W5nj7EqqhwFxH3WIQ6kzfFIzLoAsTGDUV6Q5PQI1i9hRP1wsbfYBRn+2hP0SSHffmw4btJyULNHj1TZCPRnVeI+Dme68yRjxGtIygDwXRGyxad1CgTs9zggqvboPcHCEBwwTVBK46A8IqYZndBTdkv7DAHy56/2oYjfxVZ3LoSpZAVJiILvRUZPxsjowQ0S7rwP5xnV2AYfoYXK9oRsJW2VLQKnrZ1afa4HwCntHGwx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4948.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(66946007)(16526019)(478600001)(4326008)(66476007)(66556008)(30864003)(186003)(52116002)(8676002)(86362001)(8936002)(966005)(316002)(26005)(2616005)(31686004)(956004)(54906003)(5660300002)(83380400001)(2906002)(53546011)(44832011)(36756003)(66574015)(110136005)(6486002)(16576012)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ty96Z2Q5RXU5R25yMGw2aThkY0xjVW52Qk8yeGcxSW1DOXR0NmZ3UzFwck10?=
 =?utf-8?B?QnN1QStBUW9KdzlkNWc5bUV2MnBvMVlFb0JPTE85RlhhaTdLb2NmVVpkb0xY?=
 =?utf-8?B?TXovOTI0dnBweUhqU0ZJSmlSaUJmU3NSdEthN2hua1VNbktGVjJNTG1iVTlN?=
 =?utf-8?B?VGZtQ0xBUmtZMEFJb0hqcXZDVWZJU0laZEV4c0lhdWlRZ3F6UXZBNWc3bS80?=
 =?utf-8?B?NVBPNk1wR3FPK09wTHErUGl3UjdPY0hDemVBUjBhUGdpbGJhVlZtUUFWOENE?=
 =?utf-8?B?RDVNTjIxRmVCdnB3T2M0YnduNmoyRkJ2TlRIcG5ISlNHV0FKNlVzY2NhMit0?=
 =?utf-8?B?Q0hZcGxoR2tEcHAzclQ1dTZnYm0rbUpXWkwxNmg0VmU1V0t2allzcXlNclc3?=
 =?utf-8?B?aFVLMVhWbUxnNGpEcGZyV0ZLeFpGY2VGU1llMWR1eUNSd3huS2hHN05qOGhm?=
 =?utf-8?B?VzN5NWd4Z1dqNnpUdEtQT2VjallzUzREV0QvSnBXQVV5d3pTc1M3OEhJTUEw?=
 =?utf-8?B?bE5jcml1V3czTXVIckFvbGxmWEYrK3lCRmhvZ1ZCamhFTkRJVDVrS3d1emp4?=
 =?utf-8?B?RGZ4WVhQc3NsVmJWYnFqQStnV0djN1Z0V0hyN2lYNDYyeHcyVktDQmx0bFBs?=
 =?utf-8?B?VkpkMzhWT09wSXppeDdzL2RvSGZqWW95YmVBWGd0aVQzQS9ZNzZXc2hmUFVK?=
 =?utf-8?B?ajZNMDZIVDdXTWtiRkFHYk8vZnFZK2xtaFFpcEhqVGpObkFZbEd1UjdYaUNW?=
 =?utf-8?B?a1dsbmYxTFh0UjVQQWZjTVQwTEkwbDBrZHdtU0s5czYwbjhQZEVZQ0hvcThs?=
 =?utf-8?B?VnkyTDk5NzBiWFlZUWd3RVAwc25XZ0VJTXJWQ3hTZHNQbVRaMHBkUWZJSCtU?=
 =?utf-8?B?V1NuYTd4WlRxNWRDbjdhUTdlU05acGU0Qm51WElxNUkzb0NyTTU3MFViYXNY?=
 =?utf-8?B?VTlFN2QzNW41Q2l2WWhkRGk1Y016MWhNRE5OdFFjU2pPRGM3VDgwMHlaQWI5?=
 =?utf-8?B?Q0ZLbU1Wc2pQWUZ2cjVXZFFaSFBsMmZTMG9TNFNyMW1QVklObGZPckNPQjBV?=
 =?utf-8?B?MThpWVc5UW9hbTVqV1JBdHNiZzVLSHpjSjVFNUN3UHI2RFVjdnpWRlkzc05q?=
 =?utf-8?B?U1FDZzNSbXRqc2lQRDNOYWJRMmwxT2FPY3J1RXNpcTNyZUEyNllJTndDRVlI?=
 =?utf-8?B?RE0vMWllMnZoL21LdzJiaEVDZFpVN3V3ZHRJcGlPYXk5U1NhL0RRakxwZDJr?=
 =?utf-8?B?b2lrL0dpVUdFdTdLUFhlVm0zWmwvYU9laTBCejlhWWt5WklFS0FndjdaN0VY?=
 =?utf-8?B?NmNaMHpPYi9Nb1loNHdraWpMMW1HZ0NROFlDY2NocFZMeUMxQ3JuRko2Q2dT?=
 =?utf-8?B?cGhBbklPOU42MzZhMnFPdnJjWHRBMlFmUUtDTUYrNXYycVNZcTJYUVJKS05U?=
 =?utf-8?B?b2JvekdkWm9KV1FNN2pscnNGN1pXV1ZicDYwVGNsQ1lQRGFRZ3FEcW5HQXdq?=
 =?utf-8?B?SUR2VC80MDN2SGNGSmM4RVVNem5OdEJ4SS9OYTVLZnZjZTI5LzB3ZTVKak9S?=
 =?utf-8?B?Uk5scVdOK0tsdkVmWEgxUExmOEtXYTNLbjhEeFRzOWRXN0dvaXRFSUo1WEJj?=
 =?utf-8?B?Y0h5L1NZVjNkYXVtdU1PZVpYSGc4QVRMS2VlSVM5bmw5Z0ZkZ1pIaXZHdWJX?=
 =?utf-8?B?cHByK2ZWa0Z6TE5LUXNGWlpGOUFjK29IUSsyZm9yalZwYXFVUG9WY2FQb3RW?=
 =?utf-8?B?bDlxVTJEdTlaRkxGZHZ2U2Q2NW5admVXNllXZXAzenA3RlBRbWFjM3lkYlJt?=
 =?utf-8?B?S0d2SkNSRFQxczVia05ZQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4907078-f703-4804-c119-08d8ccebf782
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 11:15:11.6749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJDEMKmkHTibsFKtkm3xh9Xn6OvdeeXLLpLYcj6Tk47yJB7dRAz2s2ygTQE3KvC4llurRFUcWlFjDY0En1zdSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4868
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Am 2021-02-09 um 1:37 a.m. schrieb Daniel Vetter:
> On Tue, Feb 9, 2021 at 4:13 AM Bas Nieuwenhuizen
> <bas@basnieuwenhuizen.nl> wrote:
>> On Thu, Jan 28, 2021 at 4:40 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
>>> Am 2021-01-28 um 2:39 a.m. schrieb Christian König:
>>>> Am 27.01.21 um 23:00 schrieb Felix Kuehling:
>>>>> Am 2021-01-27 um 7:16 a.m. schrieb Christian König:
>>>>>> Am 27.01.21 um 13:11 schrieb Maarten Lankhorst:
>>>>>>> Op 27-01-2021 om 01:22 schreef Felix Kuehling:
>>>>>>>> Am 2021-01-21 um 2:40 p.m. schrieb Daniel Vetter:
>>>>>>>>> Recently there was a fairly long thread about recoreable hardware
>>>>>>>>> page
>>>>>>>>> faults, how they can deadlock, and what to do about that.
>>>>>>>>>
>>>>>>>>> While the discussion is still fresh I figured good time to try and
>>>>>>>>> document the conclusions a bit.
>>>>>>>>>
>>>>>>>>> References:
>>>>>>>>> https://lore.kernel.org/dri-devel/20210107030127.20393-1-Felix.Kuehling@amd.com/
>>>>>>>>>
>>>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>>>> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
>>>>>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>>>>>> Cc: Jerome Glisse <jglisse@redhat.com>
>>>>>>>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>>>>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>>>>>> Cc: linux-media@vger.kernel.org
>>>>>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>>>>>> --
>>>>>>>>> I'll be away next week, but figured I'll type this up quickly for
>>>>>>>>> some
>>>>>>>>> comments and to check whether I got this all roughly right.
>>>>>>>>>
>>>>>>>>> Critique very much wanted on this, so that we can make sure hw which
>>>>>>>>> can't preempt (with pagefaults pending) like gfx10 has a clear
>>>>>>>>> path to
>>>>>>>>> support page faults in upstream. So anything I missed, got wrong or
>>>>>>>>> like that would be good.
>>>>>>>>> -Daniel
>>>>>>>>> ---
>>>>>>>>>    Documentation/driver-api/dma-buf.rst | 66
>>>>>>>>> ++++++++++++++++++++++++++++
>>>>>>>>>    1 file changed, 66 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/Documentation/driver-api/dma-buf.rst
>>>>>>>>> b/Documentation/driver-api/dma-buf.rst
>>>>>>>>> index a2133d69872c..e924c1e4f7a3 100644
>>>>>>>>> --- a/Documentation/driver-api/dma-buf.rst
>>>>>>>>> +++ b/Documentation/driver-api/dma-buf.rst
>>>>>>>>> @@ -257,3 +257,69 @@ fences in the kernel. This means:
>>>>>>>>>      userspace is allowed to use userspace fencing or long running
>>>>>>>>> compute
>>>>>>>>>      workloads. This also means no implicit fencing for shared
>>>>>>>>> buffers in these
>>>>>>>>>      cases.
>>>>>>>>> +
>>>>>>>>> +Recoverable Hardware Page Faults Implications
>>>>>>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>>>>> +
>>>>>>>>> +Modern hardware supports recoverable page faults, which has a
>>>>>>>>> lot of
>>>>>>>>> +implications for DMA fences.
>>>>>>>>> +
>>>>>>>>> +First, a pending page fault obviously holds up the work that's
>>>>>>>>> running on the
>>>>>>>>> +accelerator and a memory allocation is usually required to resolve
>>>>>>>>> the fault.
>>>>>>>>> +But memory allocations are not allowed to gate completion of DMA
>>>>>>>>> fences, which
>>>>>>>>> +means any workload using recoverable page faults cannot use DMA
>>>>>>>>> fences for
>>>>>>>>> +synchronization. Synchronization fences controlled by userspace
>>>>>>>>> must be used
>>>>>>>>> +instead.
>>>>>>>>> +
>>>>>>>>> +On GPUs this poses a problem, because current desktop compositor
>>>>>>>>> protocols on
>>>>>>>>> +Linus rely on DMA fences, which means without an entirely new
>>>>>>>>> userspace stack
>>>>>>>>> +built on top of userspace fences, they cannot benefit from
>>>>>>>>> recoverable page
>>>>>>>>> +faults. The exception is when page faults are only used as
>>>>>>>>> migration hints and
>>>>>>>>> +never to on-demand fill a memory request. For now this means
>>>>>>>>> recoverable page
>>>>>>>>> +faults on GPUs are limited to pure compute workloads.
>>>>>>>>> +
>>>>>>>>> +Furthermore GPUs usually have shared resources between the 3D
>>>>>>>>> rendering and
>>>>>>>>> +compute side, like compute units or command submission engines. If
>>>>>>>>> both a 3D
>>>>>>>>> +job with a DMA fence and a compute workload using recoverable page
>>>>>>>>> faults are
>>>>>>>>> +pending they could deadlock:
>>>>>>>>> +
>>>>>>>>> +- The 3D workload might need to wait for the compute job to finish
>>>>>>>>> and release
>>>>>>>>> +  hardware resources first.
>>>>>>>>> +
>>>>>>>>> +- The compute workload might be stuck in a page fault, because the
>>>>>>>>> memory
>>>>>>>>> +  allocation is waiting for the DMA fence of the 3D workload to
>>>>>>>>> complete.
>>>>>>>>> +
>>>>>>>>> +There are a few ways to prevent this problem:
>>>>>>>>> +
>>>>>>>>> +- Compute workloads can always be preempted, even when a page
>>>>>>>>> fault is pending
>>>>>>>>> +  and not yet repaired. Not all hardware supports this.
>>>>>>>>> +
>>>>>>>>> +- DMA fence workloads and workloads which need page fault handling
>>>>>>>>> have
>>>>>>>>> +  independent hardware resources to guarantee forward progress.
>>>>>>>>> This could be
>>>>>>>>> +  achieved through e.g. through dedicated engines and minimal
>>>>>>>>> compute unit
>>>>>>>>> +  reservations for DMA fence workloads.
>>>>>>>>> +
>>>>>>>>> +- The reservation approach could be further refined by only
>>>>>>>>> reserving the
>>>>>>>>> +  hardware resources for DMA fence workloads when they are
>>>>>>>>> in-flight. This must
>>>>>>>>> +  cover the time from when the DMA fence is visible to other
>>>>>>>>> threads up to
>>>>>>>>> +  moment when fence is completed through dma_fence_signal().
>>>>>>>>> +
>>>>>>>>> +- As a last resort, if the hardware provides no useful reservation
>>>>>>>>> mechanics,
>>>>>>>>> +  all workloads must be flushed from the GPU when switching
>>>>>>>>> between jobs
>>>>>>>>> +  requiring DMA fences or jobs requiring page fault handling: This
>>>>>>>>> means all DMA
>>>>>>>>> +  fences must complete before a compute job with page fault
>>>>>>>>> handling can be
>>>>>>>>> +  inserted into the scheduler queue. And vice versa, before a DMA
>>>>>>>>> fence can be
>>>>>>>>> +  made visible anywhere in the system, all compute workloads must
>>>>>>>>> be preempted
>>>>>>>>> +  to guarantee all pending GPU page faults are flushed.
>>>>>>>> I thought of another possible workaround:
>>>>>>>>
>>>>>>>>     * Partition the memory. Servicing of page faults will use a
>>>>>>>> separate
>>>>>>>>       memory pool that can always be allocated from without
>>>>>>>> waiting for
>>>>>>>>       fences. This includes memory for page tables and memory for
>>>>>>>>       migrating data to. You may steal memory from other processes
>>>>>>>> that
>>>>>>>>       can page fault, so no fence waiting is necessary. Being able to
>>>>>>>>       steal memory at any time also means there are basically no
>>>>>>>>       out-of-memory situations you need to worry about. Even page
>>>>>>>> tables
>>>>>>>>       (except the root page directory of each process) can be
>>>>>>>> stolen in
>>>>>>>>       the worst case.
>>>>>>> I think 'overcommit' would be a nice way to describe this. But I'm not
>>>>>>> sure how easy this is to implement in practice. You would basically
>>>>>>> need
>>>>>>> to create your own memory manager for this.
>>>>>> Well you would need a completely separate pool for both device as well
>>>>>> as system memory.
>>>>>>
>>>>>> E.g. on boot we say we steal X GB system memory only for HMM.
>>>>> Why? The GPU driver doesn't need to allocate system memory for HMM.
>>>>> Migrations to system memory are handled by the kernel's handle_mm_fault
>>>>> and page allocator and swap logic.
>>>> And that one depends on dma_fence completion because you can easily
>>>> need to wait for an MMU notifier callback.
>>> I see, the GFX MMU notifier for userpointers in amdgpu currently waits
>>> for fences. For the KFD MMU notifier I am planning to fix this by
>>> causing GPU page faults instead of preempting the queues. Can we limit
>>> userptrs in amdgpu to engines that can page fault. Basically make it
>>> illegal to attach userptr BOs to graphics CS BO lists, so they can only
>>> be used in user mode command submissions, which can page fault. Then the
>>> GFX MMU notifier could invalidate PTEs and would not have to wait for
>>> fences.
>> sadly graphics + userptr is already exposed via Mesa.
> This is not about userptr, we fake userptr entirely in software. It's
> about exposing recoverable gpu page faults (which would make userptr
> maybe more efficient since we could do on-demand paging). userptr
> itself isn't a problem, but it is part of the reasons why this is
> tricky.
>
> Christian/Felix, I think for kernel folks this is clear enough that I
> don't need to clarify this in the text?

Yeah, it's clear to me. Anyway, your latest text doesn't reference
userptr directly and keeps the discussion at a fairly abstract level. So
I think it's fine. It's the practical details of the proposed
workarounds where it feel like walking through a mirror cabinet, bumping
into unexpected obstacles with every other step.

Regards,
  Felix


> -Daniel
>
>>>
>>>> As Maarten wrote when you want to go down this route you need a
>>>> complete separate memory management parallel to the one of the kernel.
>>> Not really. I'm trying to make the GPU memory management more similar to
>>> what the kernel does for system memory.
>>>
>>> I understood Maarten's comment as "I'm creating a new memory manager and
>>> not using TTM any more". This is true. The idea is that this portion of
>>> VRAM would be managed more like system memory.
>>>
>>> Regards,
>>>   Felix
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>   It doesn't depend on any fences, so
>>>>> it cannot deadlock with any GPU driver-managed memory. The GPU driver
>>>>> gets involved in the MMU notifier to invalidate device page tables. But
>>>>> that also doesn't need to wait for any fences.
>>>>>
>>>>> And if the kernel runs out of pageable memory, you're in trouble anyway.
>>>>> The OOM killer will step in, nothing new there.
>>>>>
>>>>> Regards,
>>>>>    Felix
>>>>>
>>>>>
>>>>>>> But from a design point of view, definitely a valid solution.
>>>>>> I think the restriction above makes it pretty much unusable.
>>>>>>
>>>>>>> But this looks good, those solutions are definitely the valid
>>>>>>> options we
>>>>>>> can choose from.
>>>>>> It's certainly worth noting, yes. And just to make sure that nobody
>>>>>> has the idea to reserve only device memory.
>>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>> ~Maarten
>>>>>>>
>>>>> _______________________________________________
>>>>> Linaro-mm-sig mailing list
>>>>> Linaro-mm-sig@lists.linaro.org
>>>>> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig
>>>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
