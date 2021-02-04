Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 914CD30EE1E
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 09:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbhBDIOQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 03:14:16 -0500
Received: from mail-eopbgr680082.outbound.protection.outlook.com ([40.107.68.82]:40974
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230252AbhBDIOM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Feb 2021 03:14:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncHSS6DIfj8JdSMWwvrNGqxgggctMk+IF5g4H1mwDFquKEp+6rD0tEXKPKKErVZEt3CyBr2i9QIYhc40HtkcTMVON6Jnw2unHI1ZeYVNpaeas37Wc4NfnIs0sY4692OYeO5YW9h4fkv0ngY5dyaDeUxID6t18WCjGU13o9t/ZbzraXm/GPvP3F8zvkZiOs80osZgr/nP+hVOGENsve/rZQk5TNKcrgFu/Ovl71216CNl6nrO7+tZ/S4Is1qmEVv+POHox7MV96g0zldIb5z63+7AbZ+Wmm/NeQ1csKkX6ftBa6HIW9DT3y+VFQrJWThzaBTNluIZ6xLVKCitMgHFlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9ogDFnLdEyi0OjS9eVVZEDsOyrAP2KPUA4tvI42bks=;
 b=hnwNjjQYgNhu/dkYPneS9FSwxzcDJXn2N8oDFTyq+siG0JbmvoxQhj6q8fP752hSWVc6ndNAyjGh11X/z5JACoyqQXeesO2F4IwoLlsIf12e/NkmNp1aT7zIVtfKKCRZkiFXIlqtG3sgp7Elv1TVkg8e1o5Agj9RsjYG09XCmbhng/woXb6wU6q8LI7YIuDYLcVkjmXYjMJT92Irx8V/2qGsmFW8CrtqnLHxV1cqfJXiBP7nM7MRC9rgawgir6U1+CaoGMMWheS9SE7Ftz77hNPxo2v+Z/n8GaNw6AXC2uB/MsmIqM57hvK59iFwj4uPm7wHEd75MCNePHmOpCbcRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9ogDFnLdEyi0OjS9eVVZEDsOyrAP2KPUA4tvI42bks=;
 b=gta/v56bs7iSVjl0QCmEi2FJnnGwYd0BVYJIDqbk3ci0md1B0ynt15jEqTmWHh/ofKS6anT4NXNNES5mbUGA0MwiPSMJoJY2nqWXg6mPYCfq5JCo+muRNVWVREaU5GkBkVeDuD0Kjcf2H5c1spg0CiY4Cl4iPdhHESkxVTV3NaM=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4659.namprd12.prod.outlook.com (2603:10b6:207:1d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Thu, 4 Feb
 2021 08:13:23 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3805.024; Thu, 4 Feb 2021
 08:13:22 +0000
Subject: Re: [Linaro-mm-sig] [PATCH v3] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
To:     Hridya Valsaraju <hridya@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        kernel test robot <lkp@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        Hyesoo Yu <hyesoo.yu@samsung.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>
References: <20210126204240.418297-1-hridya@google.com>
 <YBFXPbePURupbe+y@kroah.com>
 <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com>
 <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com>
 <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
 <CAKMK7uEwm5tLT3fo_+QtzUthht3JLkhCpZ+6yJ2XSB6U4Qp5wg@mail.gmail.com>
 <CA+wgaPPmTQ2x37rMVsEW=D-adHHyp12sTAh-Gfq3Fn0rOBBHQA@mail.gmail.com>
 <YBp6LJhg6mTN1U5G@phenom.ffwll.local>
 <CA+wgaPN-e1h8OHAJ4y9Cj+hoiWeOz2gizMAvoSnBQKvexi8ayQ@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3a5e5164-e6d5-c487-71d8-910f943aee1a@amd.com>
Date:   Thu, 4 Feb 2021 09:13:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CA+wgaPN-e1h8OHAJ4y9Cj+hoiWeOz2gizMAvoSnBQKvexi8ayQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR03CA0013.eurprd03.prod.outlook.com
 (2603:10a6:208:14::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR03CA0013.eurprd03.prod.outlook.com (2603:10a6:208:14::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Thu, 4 Feb 2021 08:13:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: adaafa9b-6953-4a75-c039-08d8c8e4bcae
X-MS-TrafficTypeDiagnostic: BL0PR12MB4659:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4659D1CB885BAFC7E0AA9EC183B39@BL0PR12MB4659.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tw6aRVHP1KFhRTNLzanvoR/PQ4u55xSXhD2z+BmCYQ9GVxGIdIOuNhvliYf1b/UTwC714cEMtajRufjX+rFRt8xjL+hGfWtNJKhGoqAvEPKn8h2ME7EK2rDjfLAgod1PdO8GiwQmKe4nlpxF46kvLGQnIVWnlFrpU5wAlY7XjuCRkaCQW6JVNDTUmAowLQLzOQq/4Ua+zBzV2LhC4aieqNJmCTPfqSn9/IowyU7cNgLNfNXEeLgURW2SUhTgxCua13dc7+GevVki3z8Ijte8i+mx4bszjR9MMr0tOmGkkeGZeADP+qUPc09q0wNnxogZv+Y7dTxUgMlPOFfm/vuSvfO/xVYEoW6nqoe6d0oB9YULkwORNBjOofEwRqPcYw0cY4jANFK8iOJ6bjudk+gkl0rwWNknzwNJysqEMFU51UVQr+PtrC8iP7ipPH0AG1aH86g7bEYRAJsuvLZfR6lNcDafwJJJS+in+i+Qmk3o8KtHFRRrT7l4pI4fFpZe+CKppfPwY4FriiOQEGzWi11lHfLd0MnYtilc/QWH4uAE5Rg88Y+RfGg/1LfTs9gKfrFRkypXon49RF/NjgkT9N4J5vT7Lh0rTc3CLCmMuYti/IJkNr4qCL0jBTw/cNkBbxxnMXv0wBKg+PLEQF6AWqJqeDb9zf3e7+dBg/whM5cLlQ/iBiMN+y7Qpcofi04SRjJ3x44v9stm5HWMrRVbZadKww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(36756003)(52116002)(7416002)(4326008)(110136005)(66574015)(83380400001)(66946007)(8676002)(31696002)(921005)(316002)(53546011)(31686004)(86362001)(8936002)(2906002)(5660300002)(6666004)(6486002)(2616005)(66476007)(186003)(66556008)(966005)(16526019)(478600001)(45080400002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OVE3RklETkg5TnNFalJ6bjlySjRxU1dvbHBQOUdraXRFalFmUDZ6b3ZPMFFB?=
 =?utf-8?B?WHRoSTlqRytENHg2MmpqbFNtc2J2cFRySnBlT0FCdTRKNjZnUmwxSzlGY2JT?=
 =?utf-8?B?ekZIM1dQQjNUWXhyZjhZbmp0WThpRFpNNDBLNC9pZG9NRmwrSkxZcmNUdFRY?=
 =?utf-8?B?c0lXQTltUzI1WjJSTlBBZXQ4UkpJUVYxMXBUejVWOW5OcVdmTGFSQWpZRWRU?=
 =?utf-8?B?YXJzUk9JTmpSUGhqTXMzSUpoZ04rTXkvNWsvTHIvQ2xCdmZXOGVjRmltZ21P?=
 =?utf-8?B?SFhYSGRiaVk4dUNIeVNlekc4YjNxMFJOT3dUb2x5OWNWbUZvS1RqZ05mblBR?=
 =?utf-8?B?RTN5QVFhN0Y3cU5RUWg2UXhCcWZtbzc5NFpacm5pbVJMamlJRW9IQjVnMEpv?=
 =?utf-8?B?N09JQW1paUJPNHh5c1IwbXpQdXJpUFVaUkh1dlpKaHhPS01JOHNIWXlyaFUw?=
 =?utf-8?B?UDdybk9sM3NxUGwxZ0VJRkc1ZVIyUTI0TkJSLytRWjFEcEllNlhJdForWGdM?=
 =?utf-8?B?Q3FwK0dEV29nWWlGZURLMSttTWJUMWxWOFlzMXFYQ29WL0lrdUJOWXAxYUEw?=
 =?utf-8?B?Wmp0cnRwVnNmWlg5cDFWOUJrNDFhUUdoR25mYWhNbUVlVU5sSGdheFRSNGRi?=
 =?utf-8?B?bVRodDRxZ3VzNm1wUzN5ZW9EcGEyeWJNclluVXVtQnVUNTkwVW16eE4vN0dV?=
 =?utf-8?B?TTdQNG4wRU1yNlUvcFY5QVRZR0F4anoySCtsT0VpcWxzN0RjUEtyQUdubHFI?=
 =?utf-8?B?alpDOXFybGpZTktaQk44ZzZwczVNR3NsdXZzUDhJa2hWcm1nYWs2SCt0cXBr?=
 =?utf-8?B?THVyRWtNZ3p0R3hndktmak1YL0FoUGR1b3hvSVk2UmlRTktLSE91aStRbk0z?=
 =?utf-8?B?RFkwNzR0ZVdnRlFYdGVETXJoRFd3ZGFDNXRFbDk1d1ZqUnc4RlJMcGlaWlBt?=
 =?utf-8?B?SHFaNHJ4dUMreVphQ2s2MS84U3RxcE9HRmJxOEk4UVZnMUZOMkVIZytpNkEx?=
 =?utf-8?B?Rzd5d2lVOWpqeXZJbFJEMjdUVFpTbDRmTGJZekpHL2dIN1ZQR1hzdXhQTnB4?=
 =?utf-8?B?bzM3d2QzaUduUnlJREsyWXpHR2NHL2kvUTB1c0l6VEVEUEZrL3g1b2V3R2J2?=
 =?utf-8?B?NndOeFBlcjg4Z2t3MGQxTVcvd2RsSHZwQlNmMXpBSHhnbjRjV1oyaS9hNmlj?=
 =?utf-8?B?di9LQmhOYTBCUGV6MmkxSnh0SDNwcWFsU21ZQlZrNWw4L0k1eDNsTW9QZU1z?=
 =?utf-8?B?eXBiUlp6dTJSNFYrbzJPcGlJU1RncG1DVFNUWmZld3R5SjZPNE9Sb0hXN3NU?=
 =?utf-8?B?RnRyK2hmRGp4aHJSMXdZTGkwTkU5UkZ3b2pYUkpnVzZ6Sk53d29zb2NOaU1C?=
 =?utf-8?B?RDNiM04rc1dldCtSKzZRbVRIREZkVnVFSjl3cFNsTzdGZi92RS9ZWmFpWDlH?=
 =?utf-8?B?S0Zhc0tid0x6c21IaW9LbW0rcmk5M0FxbTI2WElSdGttd2hhM1Y2eUpLR0gz?=
 =?utf-8?B?RG5HaWVLQWFwdktMRm5VMmVqMkpsR0dlTjNZN25FWTBwMHM0SXBEenNjQk4x?=
 =?utf-8?B?WHg5R1JRVS9uNWF5c0xQRjNtOVp6cUtLN1dnMXdxb1VseEVzaWxBaDMvT1pa?=
 =?utf-8?B?aHVxRjM2WnRBTFFwUjVIVm8vMUNYZjRCRjF4VFV4eW5DdWxXbDlDQ2hEdlIr?=
 =?utf-8?B?U09vanJjdGxtSFZVSzhCaFhNbTBnTUw5N0xqZnpBT3I3OEZMaVhuYnhzR25R?=
 =?utf-8?B?a3phNmlsM2RUeTFUSkFTRkg2OUJYakRock4yVm93Vi9hY3RBSU1WbjlXeVBj?=
 =?utf-8?B?REUvVEM1R09URHllMnhLYktRY1dYdEJDZTBOWkZ0VVcrOE1JUERlUHdsd094?=
 =?utf-8?Q?mdIyYCPUBJcBE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adaafa9b-6953-4a75-c039-08d8c8e4bcae
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 08:13:22.4878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vs5HdKvX3xQj2MRiXzzfEBorA9RTuxQpBfHP4z9Murx8vwR4AJPjCEQ3hOkn9lWh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4659
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 03.02.21 um 21:14 schrieb Hridya Valsaraju:
> On Wed, Feb 3, 2021 at 2:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Mon, Feb 01, 2021 at 01:02:30PM -0800, Hridya Valsaraju wrote:
>>> On Mon, Feb 1, 2021 at 10:37 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>> On Thu, Jan 28, 2021 at 1:03 PM Sumit Semwal <sumit.semwal@linaro.org> wrote:
>>>>> On Thu, 28 Jan 2021 at 17:23, Christian König
>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>> Am 28.01.21 um 12:00 schrieb Sumit Semwal:
>>>>>>> Hi Hridya,
>>>>>>>
>>>>>>> On Wed, 27 Jan 2021 at 17:36, Greg KH <gregkh@linuxfoundation.org> wrote:
>>>>>>>> On Tue, Jan 26, 2021 at 12:42:36PM -0800, Hridya Valsaraju wrote:
>>>>>>>>> This patch allows statistics to be enabled for each DMA-BUF in
>>>>>>>>> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
>>>>>>>>>
>>>>>>>>> The following stats will be exposed by the interface:
>>>>>>>>>
>>>>>>>>> /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
>>>>>>>>> /sys/kernel/dmabuf/buffers/<inode_number>/size
>>>>>>>>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/device
>>>>>>>>> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/map_counter
>>>>>>>>>
>>>>>>>>> The inode_number is unique for each DMA-BUF and was added earlier [1]
>>>>>>>>> in order to allow userspace to track DMA-BUF usage across different
>>>>>>>>> processes.
>>>>>>>>>
>>>>>>>>> Currently, this information is exposed in
>>>>>>>>> /sys/kernel/debug/dma_buf/bufinfo.
>>>>>>>>> However, since debugfs is considered unsafe to be mounted in production,
>>>>>>>>> it is being duplicated in sysfs.
>>>>>>>>>
>>>>>>>>> This information will be used to derive DMA-BUF
>>>>>>>>> per-exporter stats and per-device usage stats for Android Bug reports.
>>>>>>>>> The corresponding userspace changes can be found at [2].
>>>>>>>>> Telemetry tools will also capture this information(along with other
>>>>>>>>> memory metrics) periodically as well as on important events like a
>>>>>>>>> foreground app kill (which might have been triggered by Low Memory
>>>>>>>>> Killer). It will also contribute to provide a snapshot of the system
>>>>>>>>> memory usage on other events such as OOM kills and Application Not
>>>>>>>>> Responding events.
>>>>>>>>>
>>>>>>>>> A shell script that can be run on a classic Linux environment to read
>>>>>>>>> out the DMA-BUF statistics can be found at [3](suggested by John
>>>>>>>>> Stultz).
>>>>>>>>>
>>>>>>>>> The patch contains the following improvements over the previous version:
>>>>>>>>> 1) Each attachment is represented by its own directory to allow creating
>>>>>>>>> a symlink to the importing device and to also provide room for future
>>>>>>>>> expansion.
>>>>>>>>> 2) The number of distinct mappings of each attachment is exposed in a
>>>>>>>>> separate file.
>>>>>>>>> 3) The per-buffer statistics are now in /sys/kernel/dmabuf/buffers
>>>>>>>>> inorder to make the interface expandable in future.
>>>>>>>>>
>>>>>>>>> All of the improvements above are based on suggestions/feedback from
>>>>>>>>> Daniel Vetter and Christian König.
>>>>>>>>>
>>>>>>>>> [1]: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1088791%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C32ff828b838e44b1de6f08d8c8805913%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637479800886768855%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=imVoJbadV221%2F6u32diSyEICLk7WUNakz8G742RPSaA%3D&amp;reserved=0
>>>>>>>>> [2]: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fandroid-review.googlesource.com%2Fq%2Ftopic%3A%2522dmabuf-sysfs%2522&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C32ff828b838e44b1de6f08d8c8805913%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637479800886778838%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=X78MH6IvdcE1mGMngrVdBYooi93vpjvfLU9kQHjZyKo%3D&amp;reserved=0+(status:open%20OR%20status:merged)
>>>>>>>>> [3]: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fandroid-review.googlesource.com%2Fc%2Fplatform%2Fsystem%2Fmemory%2Flibmeminfo%2F%2B%2F1549734&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C32ff828b838e44b1de6f08d8c8805913%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637479800886778838%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=JH7m5yspXKDqVX5DB380cnU4kWNSyh6ctDaphJvOyw8%3D&amp;reserved=0
>>>>>>>>>
>>>>>>>>> Signed-off-by: Hridya Valsaraju <hridya@google.com>
>>>>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>>> Thanks for the patch!
>>>>>>>
>>>>>>> Christian: If you're satisfied with the explanation around not
>>>>>>> directly embedding kobjects into the dma_buf and dma_buf_attachment
>>>>>>> structs, then with Greg's r-b from sysfs PoV, I think we can merge it.
>>>>>>> Please let me know if you feel otherwise!
>>>>>>   From the technical side it looks clean to me, feel free to add my
>>>>>> acked-by while pushing.
>>>>>>
>>>>>> But I would at least try to convince Daniel on the design. At least some
>>>>>> of his concerns seems to be valid and keep in mind that we need to
>>>>>> support this interface forever.
>>>>> Naturally.
>>>>>
>>>>> Since he didn't comment over Hridya's last clarification about the
>>>>> tracepoints to track total GPU memory allocations being orthogonal to
>>>>> this series, I assumed he agreed with it.
>>>> The tracepoint being orthogonal didn't really look convincing to me,
>>>> since I do expect we'll need that at a much more generic level, at
>>>> allocators. Whether that's dma-buf heaps or in drm or wherever. And we
>>>> probably also need that to somehow align with cgroups accounting.
>>>>
>>>> But I guess for this it should be easy to extend however we see fit,
>>>> so retrofitting allocator sources and anything else we want/need for
>>>> the overall gpu memory account shouldn't be a problem. Also, it's
>>>> first, so the proof for showing it all works together is more on the
>>>> tracepoints :-)
>>>>
>>>>> Daniel, do you still have objections around adding this patch in?
>>>> Needs docs (especially the uapi I think would be useful to document),
>>>> igt tests, that kind of stuff still I think? It's meant to be generic
>>>> uapi across drivers, generally we're a pile stricter for that (and yes
>>>> dma-buf heaps I think didn't do all that, so maybe there's an argument
>>>> for doing this a bit more sloppy or at least "the testsuite is
>>>> somewhere else").
>>> Thank you for taking another look Daniel!
>>>
>>> I will try adding an IGT test for the sysfs files. Other than the
>>> documentation in
>>> Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers(included in the
>>> patch), is there another place you would like to see the documentation
>>> copied to?
>> So just read the other thread, and sounds like Christian König brought up
>> a solid concern with dma-buf fds generally not staying around for much.
> Thank you for the reply Daniel! Could you please elaborate on the
> connection with the other thread you mentioned? I am a little confused
> since this patch does not deal with tracking DMA-BUF fds.

In general DMA-buf fd are meant to be a temporary transport vehicle to 
interchange the data between processes.

This here sounds like Android is using them as a long term reference. 
That is not necessary a good idea and causes multiple issues.

On of those issues you try to address here, but Daniel is question now 
why do you have this problem in the first place?

Regards,
Christian.

>
> Regards,
> Hridya
>
>> So I'm leaning more towards "this sounds like it's going to be useful for
>> Android only, nothing else" concern.
>> -Daniel
>>

