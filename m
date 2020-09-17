Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C53626D455
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 09:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgIQHLp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 03:11:45 -0400
Received: from mail-bn8nam11on2079.outbound.protection.outlook.com ([40.107.236.79]:45697
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726178AbgIQHLo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 03:11:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVHj8vEsJHBO/qVrtBBHrJum0cbSthCMGWqLh2rxzLPEWrDWfdACtII4HWtFy1FPefFhw+oJ6OaFHosjLYFvzaju5farh5uJcSRHtuOR8ZhEV8cR7OCULh2etZJg3gG0ISVF4ovYygMluCUyQtqX10WLkF/Yard16HFER5lsZ601IhqsFDHsvIN6jWi/B7je6gnuQWWE9GNlftNvaxalBhIeSmdiiuP+cjmfGgpLG+9qyahTD3CjXbBRxLMaQasZt//Wp+l5guvJjagtcRL7UZwiSHuMRM9uHTBRNxdsRSlStbwMf9UvhKETiujXGygXb1OgiX0QVSh/ERLZvCKyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oDqHcZy0WFDS771oSIjH7NkcOzAyAYevGyeSRicsOA=;
 b=DsLGNPkJuS6KjhDndG2oT+i4wzLh7NOzujRzPm5viqkl+RvE3IpUjfe4xq9/42tUevW2DYCbqfh/K1ID+8dV/q6UEPmOJgXw0fAZrYlRMo8SCAUGAhQRJ9/Q15/MGGKwI68BdqzrrOkFJoFEaHTKEnGDf54CbLT/8zGGWshsg0zemXk6/Q+rxw4iMLi6EV0Be5CScQUEf8YUNQchahXLhw/xxgdpmtqxBx/uInXlI9pF+G7kXsGzUpFiUlPbVnfRmN7VmHGmiyi8nlA/A0eObhmTEfT/DpoaQzvNjkVlNLYePWLXudhox3gEyGGH1EpLH9NgomTHKO3sx14vaGV61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1oDqHcZy0WFDS771oSIjH7NkcOzAyAYevGyeSRicsOA=;
 b=Hhm2x0K98rEkGlCQVmHK1fnitvCUiq5XtdSCNTUjJGXoQwSSeMaS9Ld2blgp9nF6LvDjTUKQWSr6hDq9LIPZ/xQvt2B9kHO9edq8xianbAWlaTMmNeVYnx5/XGX+v+BKnkVo0vmfiEyIDANYVtv4hgtBn+V6ojwWM3Jtq4zhSmc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2483.namprd12.prod.outlook.com (2603:10b6:207:4c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 17 Sep
 2020 07:11:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 07:11:38 +0000
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
 <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
 <20200916095359.GD438822@phenom.ffwll.local> <20200916140710.GA8409@ziepe.ca>
 <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
Date:   Thu, 17 Sep 2020 09:11:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0103.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::44) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR06CA0103.eurprd06.prod.outlook.com (2603:10a6:208:fa::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend Transport; Thu, 17 Sep 2020 07:11:37 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 75e717d0-6a78-462f-9bf6-08d85ad8eb6e
X-MS-TrafficTypeDiagnostic: BL0PR12MB2483:
X-Microsoft-Antispam-PRVS: <BL0PR12MB248313738E1792CBE67061CF833E0@BL0PR12MB2483.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B+upB1Nv1U0ubfNHJkIHBxpCTg3r8ay9Bz4OQZiPloAvulJUFyNGxQsfror+JZdIxd92k0RZNNGiSt8OBt+NOtFRLym4rNq6Oo0xuCSDh5jl7jb98qVJVVGQbzOZvv/Qv9optN0mFlZJ+ZpT4pA+gLOs81OKckl+fDeadoBYtrZPIFVdVwtwbRxrvAMk12LsIj7AXoGUEnrmqrWx2f57sXQRqB3G2fB5U9S7PeAZxkJNNZyaHZleDG4nZkQTMqKOlSFRtEaT2k9TGFRp6TaWZpqdnEQ79GDlx1ST4yBDtVqJaOQQ16Ngacb6hxGAPcejwQMggVQRqnv6lNQrpCwdbrY3wnuJ79ZvTuWlOzmuUvxQUZRPGwL1O90fe3ODxVs6K7PzbwNtwYaA2sW+BtnHvrPEcU01OErV85o5pDOSFbu9EaVM16gugP5ugjMo47SJUM4FprAeRWg13oSQFzfwug==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(8676002)(8936002)(36756003)(966005)(4326008)(31686004)(2906002)(5660300002)(66946007)(66556008)(66476007)(86362001)(6486002)(83380400001)(52116002)(31696002)(478600001)(54906003)(186003)(45080400002)(53546011)(2616005)(316002)(6916009)(66574015)(16526019)(6666004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: +DWDHXmtkgVi8tv9p3COQzpTTvdclLg8LwDJU65pKucAcpkJ2Jt1CR34NdBHLLDtTPszcmtC+xoXRkraEm7VlWx7hIaQ6ynzLM+OToyPra0iH0rE1+pY9ubBUDQkKV4KUWza/YsqP32fT44/kVj3EPofoR9fFIBrg7BRaLRFlgJwncZRfxepj8d/OsMbQWDiHEK5IlxFOc882JCn+GWHLRXMe2RNvMAxtALrUSPUbr9YH8N3NTyf80CaYkD+0PW2ikO2kAZG7/nhwfKeiw15m/Ny6d5tcCLAGWBuj2hFu6f1XvYRfIYQP/phCDtHLuhPSgLz4bbwk30oNgRQxU6YRTNfmoxNR22we06lOePDjflb5g0/vjKixTgO9ytlzJyoUdZ2TBZpTOnQ7Szqu4gKppFBNSwM6SwIj91StukGs/9U+rdnLSxc3N6u4vr94LprsnREQbBusvJwEtjHtvMXOXcebUGwUf30iSR0MkARJKAH8HHpe2otfZixokhai8hCR/HvwkhuN9QDlZUcBmPlvRXhVAFVtuWK8v7YSMdUYADwNE9ugesTNUAXU2mNj0JiRul2nkOUMZdiKydMlR7KVa8Vt9+1yjyOaAqqRpbYnsuduFG+5t6zLH+LsBqTrYNEbAAinWtFP6oCBhI6nXuH6jq2I42xy0IYAE+QA636uBIYsY03ATO0Nsrwi/xE/qSmDHkZCe6TCutXp/dqixGhag==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e717d0-6a78-462f-9bf6-08d85ad8eb6e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 07:11:38.5303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVYhYOytaVsIknKIg9h2GXa0V6QHI2TN+3/1QjvxqEQYQ5VkuW4XsGGwCaOV8tBG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2483
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 17.09.20 um 08:23 schrieb Daniel Vetter:
> On Wed, Sep 16, 2020 at 5:31 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 16.09.20 um 17:24 schrieb Daniel Vetter:
>>> On Wed, Sep 16, 2020 at 4:14 PM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 16.09.20 um 16:07 schrieb Jason Gunthorpe:
>>>>> On Wed, Sep 16, 2020 at 11:53:59AM +0200, Daniel Vetter wrote:
>>>>>
>>>>>> But within the driver, we generally need thousands of these, and that
>>>>>> tends to bring fd exhaustion problems with it. That's why all the private
>>>>>> buffer objects which aren't shared with other process or other drivers are
>>>>>> handles only valid for a specific fd instance of the drm chardev (each
>>>>>> open gets their own namespace), and only for ioctls done on that chardev.
>>>>>> And for mmap we assign fake (but unique across all open fd on it) offsets
>>>>>> within the overall chardev. Hence all the pgoff mangling and re-mangling.
>>>>> Are they still unique struct files? Just without a fdno?
>>>> Yes, exactly.
>>> Not entirely, since dma-buf happened after drm chardev, so for that
>>> historical reason the underlying struct file is shared, since it's the
>>> drm chardev. But since that's per-device we don't have a problem in
>>> practice with different vm_ops, since those are also per-device. But
>>> yeah we could fish out some entirely hidden per-object struct file if
>>> that's required for some mm internal reasons.
>> Hui? Ok that is just the handling in i915, isn't it?
>>
>> As far as I know we create an unique struct file for each DMA-buf.
> Yes dma-buf, but that gets forwarded to the original drm chardev which
> originally exported the buffer. It's only there where the forwarding
> chain stops. The other thing is that iirc we have a singleton
> anon_inode behind all the dma-buf, so they'd share all the same
> address_space and so would all alias for unmap_mapping_range (I think
> at least).

Amdgpu works by using the address_space of the drm chardev into the 
struct file of DMA-buf instead.

I think that this is cleaner, but only by a little bit :)

Anyway I'm a bit concerned that we have so many different approaches for 
the same problem.

Christian.

> -Daniel
>
>> Regards,
>> Christian.
>>
>>
>>> -Daniel
>>>
>>>>>> Hence why we'd like to be able to forward aliasing mappings and adjust the
>>>>>> file and pgoff, while hopefully everything keeps working. I thought this
>>>>>> would work, but Christian noticed it doesn't really.
>>>>> It seems reasonable to me that the dma buf should be the owner of the
>>>>> VMA, otherwise like you say, there is a big mess attaching the custom
>>>>> vma ops and what not to the proper dma buf.
>>>>>
>>>>> I don't see anything obviously against this in mmap_region() - why did
>>>>> Chritian notice it doesn't really work?
>>>> To clarify I think this might work.
>>>>
>>>> I just had the same "Is that legal?", "What about security?", etc..
>>>> questions you raised as well.
>>>>
>>>> It seems like a source of trouble so I thought better ask somebody more
>>>> familiar with that.
>>>>
>>>> Christian.
>>>>
>>>>> Jason
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7Cf725d2eb6a5a49bd533f08d85ad23308%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637359206142262941&amp;sdata=qcLsl9R1gP%2FGY39ctsQkIzI99Bn%2F840YS17F4xudrAE%3D&amp;reserved=0
>>>
>

