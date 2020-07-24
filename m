Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D56C22D262
	for <lists+linux-media@lfdr.de>; Sat, 25 Jul 2020 01:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgGXXqk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 19:46:40 -0400
Received: from mail-dm6nam12olkn2083.outbound.protection.outlook.com ([40.92.22.83]:49973
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726576AbgGXXqk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 19:46:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ff7aW+XsVFJmJF16OR3OjFsr63sKLpaaG+/C7LeoocBBAssIIsE97WTZLqYnbHp5kSFhfkfZinGeJhGDUTO1VebECz6yjYBYu/y6yLhlEiUlUzOUWuLRY3srSmKodYwrKMkPeSfFEzzzlsYh3MJwHxQ2TsgIBEUyoYpdBkfHcIXFBIbd5+aZ+nThMIEmf2QIiQsi06aaoty+Yqrm/c0CSmjiqHEIfJcorxrHbmotTGwl7jSlinZUcYHjqByfUbgr4AbIulZaFMq/pxaLGT5xK5qnAsiZAlMtvjymxB24mCAkQprBGQIdaH9Jkuq9IBO4lQz5WC5JqyDZalgg9tLEsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBMjidCdgUAOMvfklSoCOj2PF8cdnK6BjIJlGI0FxZw=;
 b=FoP2lIijApBdhFpP3TcYX8IK5EX0NzOxjSfjxkzFBBVtIsdNiHNs1VIN8EwyzFTExTujJA1R0jN8jKFdy62gUNMI37Q/0M8STesUIOGGH/7FJM/f8bBWiLd/UbT7rJ9+z8ubPU5a3c8lUHyKWuHDgXz7KXXsbmFwpdvIk/sXR3p8sT4K1LDRvzIRcJX8LyzPmjxZo3WchBmtzZLgiiTX12ZiVqD6/HAn8bisWkyeWRhqNZ3OOefH7/h978vBdYokhAYiw7WWAO1KsSDZ7JDmT8/3UJRTbA2YG++lnRb8QQX+/HcvEmGoU6wVzLqVzzwLCIcHvMBKQBwgmERDNJCxtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6NAM12FT003.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::44) by
 DM6NAM12HT167.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::259)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9; Fri, 24 Jul
 2020 23:46:36 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc64::50) by DM6NAM12FT003.mail.protection.outlook.com
 (2a01:111:e400:fc64::340) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9 via Frontend
 Transport; Fri, 24 Jul 2020 23:46:36 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:DDF661DEF79E94E3FEAD4D5DA24A1F95FFDD94F9BB24D37EDCC8567BA16217A6;UpperCasedChecksum:CC9EB053518F91407212838D37D0ED55BEC5C365D0D9078E7315E3939710445C;SizeAsReceived:9664;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3216.026; Fri, 24 Jul 2020
 23:46:36 +0000
Subject: Re: [PATCH 10/11] media: exynos4-is: Prevent duplicate call to
 media_pipeline_stop
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, kgene@kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB0660DB1C884EE9F9C7D94857A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <20200707184412.GJ2621465@chromium.org>
 <BN6PR04MB0660C1942C3738F9F9D1AAAFA3620@BN6PR04MB0660.namprd04.prod.outlook.com>
 <CAAFQd5ABvEnt7QQHmwwFyCqRLMabE=Vs_e7FrG3fMmrAWgD_bQ@mail.gmail.com>
From:   Jonathan Bakker <xc-racer2@live.ca>
Message-ID: <BN6PR04MB066075594507854A6619A3E3A3770@BN6PR04MB0660.namprd04.prod.outlook.com>
Date:   Fri, 24 Jul 2020 16:46:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAAFQd5ABvEnt7QQHmwwFyCqRLMabE=Vs_e7FrG3fMmrAWgD_bQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR12CA0036.namprd12.prod.outlook.com
 (2603:10b6:301:2::22) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <9ea3bcd8-4c90-da73-cfe6-29174f0b606d@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:569:fb68:9c00:8067:f823:1e15:7520] (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR12CA0036.namprd12.prod.outlook.com (2603:10b6:301:2::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend Transport; Fri, 24 Jul 2020 23:46:33 +0000
X-Microsoft-Original-Message-ID: <9ea3bcd8-4c90-da73-cfe6-29174f0b606d@live.ca>
X-TMN:  [dG2s/drn9GtH0bKXgn7kMSoyqN7lBPzgDjeKC4xYKpk1botLy1CnpWXUTuVmvjol]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: a6d0b4f5-3c6a-47c6-15e1-08d8302bcd07
X-MS-TrafficTypeDiagnostic: DM6NAM12HT167:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: POeiZwTO0qMsk0Zn9C+ItU+G8A/7cAYRKauXvZu5GaBPXcQVdoHA1JFaYJs2vhyyWWVkjsqnv1Rd7HX2C911X8AcTUIu454bbLMbOFB8B7p4cC6m/6pr5UVSyIxic69RgQ0bZq7zctgdUuAmnnw0QTao3YQjVdeoUOV0OFxVMqjZNuUfl7a+7wfUE4hLwwt9xFhoW1Nm0ceGwvSSol9SaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: +1i0z2IGxNW5wBqMn7CAUIAB7dr2TCaZYj/3uFj5bkE0HrelekTXHujrzTl9/oge5OlRKKRXgwcJ1eFkuJag5vdttP6QmPUAE/D8i+k51nLteuffCKXfZTctiANTZ1Nuh/NTrnV6fKmqJ98h3zTE31WLE4AtxqPxmtVTaq4spIpgEtGv3xxbnPm4//SNUwB7+oL7CgntQER87+zP149Ngg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d0b4f5-3c6a-47c6-15e1-08d8302bcd07
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 23:46:35.9093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT003.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT167
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 2020-07-20 6:10 a.m., Tomasz Figa wrote:
> On Sat, Jul 11, 2020 at 8:17 PM Jonathan Bakker <xc-racer2@live.ca> wrote:
>>
>> Hi Tomasz,
>>
>> On 2020-07-07 11:44 a.m., Tomasz Figa wrote:
>>> Hi Jonathan,
>>>
>>> On Sat, Apr 25, 2020 at 07:26:49PM -0700, Jonathan Bakker wrote:
>>>> media_pipeline_stop can be called from both release and streamoff,
>>>> so make sure they're both protected under the streaming flag and
>>>> not just one of them.
>>>
>>> First of all, thanks for the patch.
>>>
>>> Shouldn't it be that release calls streamoff, so that only streamoff
>>> is supposed to have the call to media_pipeline_stop()?
>>>
>>
>> I can't say that I understand the whole media subsystem enough to know :)
>> Since media_pipeline_start is called in streamon, it makes sense that streamoff
>> should have the media_pipeline_stop call.  However, even after removing the call
>> in fimc_capture_release I'm still getting a backtrace such as
>>
>> [   73.843117] ------------[ cut here ]------------
>> [   73.843251] WARNING: CPU: 0 PID: 1575 at drivers/media/mc/mc-entity.c:554 media_pipeline_stop+0x20/0x2c [mc]
>> [   73.843265] Modules linked in: s5p_fimc v4l2_fwnode exynos4_is_common videobuf2_dma_contig pvrsrvkm_s5pv210_sgx540_120 videobuf2_memops v4l2_mem2mem brcmfmac videobuf2_v4l2 videobuf2_common hci_uart sha256_generic libsha256 btbcm bluetooth cfg80211 brcmutil ecdh_generic ecc ce147 libaes s5ka3dfx videodev atmel_mxt_ts mc pwm_vibra rtc_max8998
>> [   73.843471] CPU: 0 PID: 1575 Comm: v4l2-ctl Not tainted 5.7.0-14534-g2b33418b254e-dirty #669
>> [   73.843487] Hardware name: Samsung S5PC110/S5PV210-based board
>> [   73.843562] [<c010c7c4>] (unwind_backtrace) from [<c010a120>] (show_stack+0x10/0x14)
>> [   73.843613] [<c010a120>] (show_stack) from [<c0117038>] (__warn+0xbc/0xd4)
>> [   73.843661] [<c0117038>] (__warn) from [<c01170b0>] (warn_slowpath_fmt+0x60/0xb8)
>> [   73.843734] [<c01170b0>] (warn_slowpath_fmt) from [<bf00c20c>] (media_pipeline_stop+0x20/0x2c [mc])
>> [   73.843867] [<bf00c20c>] (media_pipeline_stop [mc]) from [<bf145c48>] (fimc_cap_streamoff+0x38/0x48 [s5p_fimc])
>> [   73.844109] [<bf145c48>] (fimc_cap_streamoff [s5p_fimc]) from [<bf03cbf4>] (__video_do_ioctl+0x220/0x448 [videodev])
>> [   73.844308] [<bf03cbf4>] (__video_do_ioctl [videodev]) from [<bf03d600>] (video_usercopy+0x114/0x498 [videodev])
>> [   73.844438] [<bf03d600>] (video_usercopy [videodev]) from [<c0205024>] (ksys_ioctl+0x20c/0xa10)
>> [   73.844484] [<c0205024>] (ksys_ioctl) from [<c0100060>] (ret_fast_syscall+0x0/0x54)
>> [   73.844505] Exception stack(0xe5083fa8 to 0xe5083ff0)
>> [   73.844546] 3fa0:                   0049908d bef8f8c0 00000003 40045613 bef8d5ac 004c1d16
>> [   73.844590] 3fc0: 0049908d bef8f8c0 bef8f8c0 00000036 bef8d5ac 00000000 b6d6b320 bef8faf8
>> [   73.844620] 3fe0: 004e3ed4 bef8c718 004990bb b6f00d0a
>> [   73.844642] ---[ end trace e6a4a8b2f20addd4 ]---
>>
>> The command I'm using for testing is
>>
>> v4l2-ctl --verbose -d 1 --stream-mmap=3 --stream-skip=2 --stream-to=./test.yuv --stream-count=1
>>
>> Since I noticed that the streaming flag was being checked fimc_capture_release
>> but not in fimc_cap_streamoff, I assumed that it was simply a missed check.  Comparing
>> with other drivers, they seem to call media_pipeline_stop in their vb2_ops stop_streaming
>> callback.
> 
> vb2 does a lot of state handling internally and makes sure that driver
> ops are not called when unnecessary, preventing double calls for
> example. I suppose it could be a better place to stop the pipeline
> indeed. However, ...
> 
>>
>> I'm willing to test various options
>>
> 
> I think it could make sense to add something like WARN_ON(1) inside
> media_pipeline_stop() and then check where the first call came from.

Here's the results of that:

[   69.876823] ------------[ cut here ]------------
[   69.876962] WARNING: CPU: 0 PID: 1566 at drivers/media/mc/mc-entity.c:550 __media_pipeline_stop+0x24/0xfc [mc]
[   69.876976] Modules linked in: s5p_fimc v4l2_fwnode exynos4_is_common videobuf2_dma_contig videobuf2_memops v4l2_mem2mem brcmfmac videobuf2_v4l2 pvrsrvkm_s5pv210_sgx540_120 videobuf2_common hci_uart sha256_generic btbcm libsha256 bluetooth cfg80211 ce147 brcmutil s5ka3dfx ecdh_generic ecc libaes videodev atmel_mxt_ts mc pwm_vibra rtc_max8998
[   69.877182] CPU: 0 PID: 1566 Comm: v4l2-ctl Not tainted 5.7.0-14540-gb1220848c797-dirty #681
[   69.877198] Hardware name: Samsung S5PC110/S5PV210-based board
[   69.877274] [<c010c7c4>] (unwind_backtrace) from [<c010a120>] (show_stack+0x10/0x14)
[   69.877326] [<c010a120>] (show_stack) from [<c0117038>] (__warn+0xbc/0xd4)
[   69.877375] [<c0117038>] (__warn) from [<c01170b0>] (warn_slowpath_fmt+0x60/0xb8)
[   69.877448] [<c01170b0>] (warn_slowpath_fmt) from [<bf010130>] (__media_pipeline_stop+0x24/0xfc [mc])
[   69.877540] [<bf010130>] (__media_pipeline_stop [mc]) from [<bf010228>] (media_pipeline_stop+0x20/0x2c [mc])
[   69.877663] [<bf010228>] (media_pipeline_stop [mc]) from [<bf08fc48>] (fimc_cap_streamoff+0x38/0x48 [s5p_fimc])
[   69.877904] [<bf08fc48>] (fimc_cap_streamoff [s5p_fimc]) from [<bf040bf4>] (__video_do_ioctl+0x220/0x448 [videodev])
[   69.878105] [<bf040bf4>] (__video_do_ioctl [videodev]) from [<bf041600>] (video_usercopy+0x114/0x498 [videodev])
[   69.878234] [<bf041600>] (video_usercopy [videodev]) from [<c0205024>] (ksys_ioctl+0x20c/0xa10)
[   69.878281] [<c0205024>] (ksys_ioctl) from [<c0100060>] (ret_fast_syscall+0x0/0x54)
[   69.878301] Exception stack(0xe50c1fa8 to 0xe50c1ff0)
[   69.878342] 1fa0:                   004ef08d 00539d0c 00000003 40045613 bec1578c 00517d16
[   69.878386] 1fc0: 004ef08d 00539d0c bec188c0 00000036 bec165ac 00000000 b6def320 bec18af8
[   69.878415] 1fe0: 00539ed4 bec15730 004ef0bb b6f84d0a
[   69.878436] ---[ end trace d004ab573a72c329 ]---
[   69.879704] ------------[ cut here ]------------
[   69.879794] WARNING: CPU: 0 PID: 1566 at drivers/media/mc/mc-entity.c:550 __media_pipeline_stop+0x24/0xfc [mc]
[   69.879806] Modules linked in: s5p_fimc v4l2_fwnode exynos4_is_common videobuf2_dma_contig videobuf2_memops v4l2_mem2mem brcmfmac videobuf2_v4l2 pvrsrvkm_s5pv210_sgx540_120 videobuf2_common hci_uart sha256_generic btbcm libsha256 bluetooth cfg80211 ce147 brcmutil s5ka3dfx ecdh_generic ecc libaes videodev atmel_mxt_ts mc pwm_vibra rtc_max8998
[   69.880002] CPU: 0 PID: 1566 Comm: v4l2-ctl Tainted: G        W         5.7.0-14540-gb1220848c797-dirty #681
[   69.880016] Hardware name: Samsung S5PC110/S5PV210-based board
[   69.880071] [<c010c7c4>] (unwind_backtrace) from [<c010a120>] (show_stack+0x10/0x14)
[   69.880115] [<c010a120>] (show_stack) from [<c0117038>] (__warn+0xbc/0xd4)
[   69.880161] [<c0117038>] (__warn) from [<c01170b0>] (warn_slowpath_fmt+0x60/0xb8)
[   69.880231] [<c01170b0>] (warn_slowpath_fmt) from [<bf010130>] (__media_pipeline_stop+0x24/0xfc [mc])
[   69.880318] [<bf010130>] (__media_pipeline_stop [mc]) from [<bf010228>] (media_pipeline_stop+0x20/0x2c [mc])
[   69.880419] [<bf010228>] (media_pipeline_stop [mc]) from [<bf08fc48>] (fimc_cap_streamoff+0x38/0x48 [s5p_fimc])
[   69.880582] [<bf08fc48>] (fimc_cap_streamoff [s5p_fimc]) from [<bf040bf4>] (__video_do_ioctl+0x220/0x448 [videodev])
[   69.880776] [<bf040bf4>] (__video_do_ioctl [videodev]) from [<bf041600>] (video_usercopy+0x114/0x498 [videodev])
[   69.880895] [<bf041600>] (video_usercopy [videodev]) from [<c0205024>] (ksys_ioctl+0x20c/0xa10)
[   69.880939] [<c0205024>] (ksys_ioctl) from [<c0100060>] (ret_fast_syscall+0x0/0x54)
[   69.880958] Exception stack(0xe50c1fa8 to 0xe50c1ff0)
[   69.880997] 1fa0:                   004ef08d bec188c0 00000003 40045613 bec165ac 00517d16
[   69.881040] 1fc0: 004ef08d bec188c0 bec188c0 00000036 bec165ac 00000000 b6def320 bec18af8
[   69.881070] 1fe0: 00539ed4 bec15718 004ef0bb b6f84d0a
[   69.881089] ---[ end trace d004ab573a72c32a ]---
[   69.881102] ------------[ cut here ]------------
[   69.881163] WARNING: CPU: 0 PID: 1566 at drivers/media/mc/mc-entity.c:556 media_pipeline_stop+0x20/0x2c [mc]
[   69.881174] Modules linked in: s5p_fimc v4l2_fwnode exynos4_is_common videobuf2_dma_contig videobuf2_memops v4l2_mem2mem brcmfmac videobuf2_v4l2 pvrsrvkm_s5pv210_sgx540_120 videobuf2_common hci_uart sha256_generic btbcm libsha256 bluetooth cfg80211 ce147 brcmutil s5ka3dfx ecdh_generic ecc libaes videodev atmel_mxt_ts mc pwm_vibra rtc_max8998
[   69.881367] CPU: 0 PID: 1566 Comm: v4l2-ctl Tainted: G        W         5.7.0-14540-gb1220848c797-dirty #681
[   69.881381] Hardware name: Samsung S5PC110/S5PV210-based board
[   69.881424] [<c010c7c4>] (unwind_backtrace) from [<c010a120>] (show_stack+0x10/0x14)
[   69.881465] [<c010a120>] (show_stack) from [<c0117038>] (__warn+0xbc/0xd4)
[   69.881511] [<c0117038>] (__warn) from [<c01170b0>] (warn_slowpath_fmt+0x60/0xb8)
[   69.881580] [<c01170b0>] (warn_slowpath_fmt) from [<bf010228>] (media_pipeline_stop+0x20/0x2c [mc])
[   69.881683] [<bf010228>] (media_pipeline_stop [mc]) from [<bf08fc48>] (fimc_cap_streamoff+0x38/0x48 [s5p_fimc])
[   69.881834] [<bf08fc48>] (fimc_cap_streamoff [s5p_fimc]) from [<bf040bf4>] (__video_do_ioctl+0x220/0x448 [videodev])
[   69.882025] [<bf040bf4>] (__video_do_ioctl [videodev]) from [<bf041600>] (video_usercopy+0x114/0x498 [videodev])
[   69.882246] [<bf041600>] (video_usercopy [videodev]) from [<c0205024>] (ksys_ioctl+0x20c/0xa10)
[   69.882291] [<c0205024>] (ksys_ioctl) from [<c0100060>] (ret_fast_syscall+0x0/0x54)
[   69.882309] Exception stack(0xe50c1fa8 to 0xe50c1ff0)
[   69.882348] 1fa0:                   004ef08d bec188c0 00000003 40045613 bec165ac 00517d16
[   69.882391] 1fc0: 004ef08d bec188c0 bec188c0 00000036 bec165ac 00000000 b6def320 bec18af8
[   69.882420] 1fe0: 00539ed4 bec15718 004ef0bb b6f84d0a
[   69.882439] ---[ end trace d004ab573a72c32b ]---

With the final trace being the original one that I was having.

So it looks to me as if streamoff is being called twice.  Is this a possibility for all drivers
or is there a different bug that I should be trying to track down?  In any event, my patch does
prevent the warning (although my reasoning was wrong as I thought it was being stopped on the
call to release).

Thanks,
Jonathan

> 
> Best regards,
> Tomasz
> 
