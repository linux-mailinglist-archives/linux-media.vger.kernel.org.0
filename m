Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80BCF207E40
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 23:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390153AbgFXVOW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 17:14:22 -0400
Received: from mail-bn7nam10olkn2049.outbound.protection.outlook.com ([40.92.40.49]:6055
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389905AbgFXVOW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 17:14:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIxRBAycnrwj82FPmojwpgcyYfUtikpJhJ7ReMu+4guQn6jGk68/wALJFkHwklg6ZyEPjPOhCPxstlR98jnvWI503XNv2XiOxIDvafFLeCLhKlTG6JjOQcKYZY/Sc0WJpfnbhtb1gWHGIkBr2WC/jvOs2j1nb7p7BX4zMSic0WwAJWCwM8V/CN/7WMIIUO/UCaxEkVEjTBj/voTLB1LcMzV4YcQd7s204o29R/4CLxhS1SC1sKOP6aNht3fO5x1RXpGzlNVGzR9rPxgyeGN4CQK5YLsMzoAlRkuCulRWfdA0y4le0ZX7EJmCKtfBAge5cZuo5UFKmS2sJr8a+GvVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CrmGzPXzKI3jNbwSiL6uV8Tmje9ePu/xLdQI4zVnhw=;
 b=NSFsmqP011XsaH/QMsZIAsb6jPGsq/CQdFZFa7ch9pvEgHxTcBCsgr1zOXGxBdU2DxoAeoiq7oBnegWA1HknD/0f+ACV1fbAz/GmK8KtARmzgKmDgNp6P3c+JtEuBkHINaO+Glm0a9sJjxfK/NufsKZp78K+dYd3lWCYTHXJbcb4oNCWyYc0Q1BjVHyOL4iClkVfK/4KQkCjaiFNZ0ZHJpxhDX+MnGqzAkLRsFG5U+1rrDchSNpWqjKxmfe3JpLnTQLdhyxrU9OnUeA1vW4+vvTlALaro17Sr9EthuxurKTnDrz+BmVQeTfVQ93A/yVMCNIVWdrH5Lf+kFTXdpeEuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BN7NAM10FT054.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e8f::48) by
 BN7NAM10HT119.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e8f::463)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Wed, 24 Jun
 2020 21:14:19 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:7e8f::41) by BN7NAM10FT054.mail.protection.outlook.com
 (2a01:111:e400:7e8f::368) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Wed, 24 Jun 2020 21:14:19 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:8EAA0BA33DA596B0431D042A55E8E8F04DF3B3F9D273D3C0ADC17017CC8DE5B4;UpperCasedChecksum:1952420B62F245174FCDFD5DAAD7CC84C2AB14B2F50614CBD8980AFFFD81799B;SizeAsReceived:9609;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 21:14:19 +0000
Subject: Re: [PATCH 00/11] media: exynos4-is: Improve support for s5pv210 and
 parallel ports
To:     Tomasz Figa <tfiga@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, kgene@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <BN6PR04MB06602E7221CC7455F3142540A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <07fb9000-ae00-efcd-e91a-48765ff3d4bf@xs4all.nl> <20200624115419.GA20764@pi3>
 <CAAFQd5CW0CL-s6=UOPsm37Mg+kswM_DTXEEnQMHC3kc2LxAY5w@mail.gmail.com>
From:   Jonathan Bakker <xc-racer2@live.ca>
Message-ID: <BN6PR04MB0660566622FAB87ABE67A3C8A3950@BN6PR04MB0660.namprd04.prod.outlook.com>
Date:   Wed, 24 Jun 2020 14:14:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <CAAFQd5CW0CL-s6=UOPsm37Mg+kswM_DTXEEnQMHC3kc2LxAY5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:300:116::15) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <ee178243-b249-a047-a752-993dcf696b98@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:569:fb68:9c00:8067:f823:1e15:7520] (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR07CA0005.namprd07.prod.outlook.com (2603:10b6:300:116::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Wed, 24 Jun 2020 21:14:17 +0000
X-Microsoft-Original-Message-ID: <ee178243-b249-a047-a752-993dcf696b98@live.ca>
X-TMN:  [paftjWaebweO0jKyE2GK8Uv0cYFzShmKvoelg+gAQYGksWntRJ65SdnMpnLZQEx8]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: e0f0716d-a91a-4249-458e-08d818838eea
X-MS-TrafficTypeDiagnostic: BN7NAM10HT119:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HwXtJghjvTuAM9uJyjCbfjKIFVaLDGnuAmfc2c148lxHdF1BEjNMuXKzstJfRU9Z7bfn8lQeyXraxadsqI36EbBNCtQfTjVzI6jNv+nOOhXVdR9PKmcLUSYnV3vRpEhe4wRgRFatRtakRcIwWj7vPnZEyFz4vRN/e7IL5qttzvsp0UOXQui4dzAROxdNVCsZRz3niYiLqLglIZEUgtu3Jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 0LJhqkaMT4495vkSwNW8yuKx9A3HyALkJd8G8p8uyiFPYSO29zZNu9v6vYZy36adYP8WaZP2KVFA1zMRzwSjO1uWzRvfUM4SWiZlVknhp1lnhtX3+8jJuBO+su+myVa9SzG6lFAoYTyzgj6WzVvnSqmevfrRZ+tOS8vfXPCYGIOsTfOxIt1P9KVENNMk60dLoEOwcvJ8E1wp1F93fUN8qg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f0716d-a91a-4249-458e-08d818838eea
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 21:14:19.3903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT054.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7NAM10HT119
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 2020-06-24 4:58 a.m., Tomasz Figa wrote:
> On Wed, Jun 24, 2020 at 1:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Wed, Jun 24, 2020 at 01:39:50PM +0200, Hans Verkuil wrote:
>>> Can someone from Samsung or someone who knows this SoC take a look at this series?
>>>
>>> This series looks sane to me, so I'll probably merge this if nobody replies
>>> in the next two weeks or so.
>>
>> Unfortunately I don't know the media part on S5Pv210 at all so I cannot
>> provide any feedback. There are not many active users of these SoCs
>> nowadays. One of hem is Jonathan, so if he wants to change something he will
>> mostly break/affect his own setup. :) Therefore I think it is safe to merge.
> 
> I think this driver is also used on Exynos4210 and on some setups with
> 4412 where the ISP is not used.

Yes, this driver is also used by Exynos4210 and Exynos4412, notably by the Galaxy S3 series.
They don't use the parallel ports, but rather the CSIS.  I don't believe I've broken support
for that, but I don't have the hardware to test.

My other remaining concern is whether to adjust the camera port A/camera port B to match the
device tree documentation or to update the documentation to match the driver.  I decided to
update the driver in these patches, but it is much simpler to simply update the binding doc.
The only mainline user of the parallel ports is the Goni dev board which appears to be setup
for the driver way of numbering as opposed to the binding doc.  I have no strong preference
on which way to actually go.

> 
> I can't promise anything, but I'll try to do a high level review.
> Hopefully I still have some memory from the time I used to play with
> this hardware.

Thanks, that would be appreciated,
Jonathan

> 
> Best regards,
> Tomasz
> 
