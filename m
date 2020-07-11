Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47E421C53A
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2020 18:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728632AbgGKQ1P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Jul 2020 12:27:15 -0400
Received: from mail-dm6nam12olkn2043.outbound.protection.outlook.com ([40.92.22.43]:35236
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728412AbgGKQ1O (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Jul 2020 12:27:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mt3JvofXvuj5be12PTBZ6NiZWrk/MMcEF3wOba1hX02WfAdhckH8AHgHZ9Pw8oa3XNQJ5bQuUBx62lXEYkWo7PzU9aHLlJ4nYGyNKUwlWPKPgQCFP2V59MUV3ukRAym/bkaf8xRdA0MTco8onrjmJ1odSlPpm28SDYxC4CIZCjAcTaLYfi5zzShaumkUzXpWZPjhtNs8xaO/jgAVvapCvwGk7q134gTpPeM2VvXOomJvr1Itf586Kbnbs+tni28M+xAJ2JTSf9pFc5deUcrEyDkQ3R5dGoPZ17NLY0sjhJzYOTbIUQ/zpzghtBgBvLAam3b0YqMOwPGWg67ihXMARw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uubGPSYETsUg4q0kFNvlI49YgVnfc7+4KhScSvYe0tw=;
 b=bXWjaAcrDZVsn7El4aql/j5TQmHXRwqfNMHbbcLxmzOJ92tR32jR9oHzcjDlEVCOwdDLi+MX+wEapFaLi5aw/uraxFys1+afxq0XLC9Zr5cTf7WvWXz1Lht4wgJJYzFi+jA/s70SO7ipDA2L/i7sMwHWqZv3ZisU0AMHyGmdeZYkVe+59XXbPdReINtxfwQWI60Gfn7FoDU/8NHqAPLSux02PWp5DDNJWmEJpoD/uAWYKzOP3sEkM/zPqQVMwlaXg1st5nj0cQz132AOJMDfIKz5jamXdUSUYbly4SexCUPmmRsDIfuuF6k8/FDtRcPSSDHPhz/Tf/VYcsvEaHoyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6NAM12FT066.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::44) by
 DM6NAM12HT054.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::346)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9; Sat, 11 Jul
 2020 16:27:12 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc64::50) by DM6NAM12FT066.mail.protection.outlook.com
 (2a01:111:e400:fc64::145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9 via Frontend
 Transport; Sat, 11 Jul 2020 16:27:12 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:C1C49D248E2AF8A9AD6293D12AA0585306791E83F1D9C5DB09E5293FB27EB1D8;UpperCasedChecksum:E64BE3420F45827271391A211F559F316E8A4A2A7B681DABB558B44CD4EA3957;SizeAsReceived:9381;Count:49
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::b9c3:9bff:541d:f383%9]) with mapi id 15.20.3174.024; Sat, 11 Jul 2020
 16:27:12 +0000
Subject: Re: [PATCH 03/11] media: exynos4-is: Fix nullptr when no CSIS device
 present
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     kyungmin.park@samsung.com, mchehab@kernel.org, kgene@kernel.org,
        krzk@kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB0660EE7304C2BB2E603A8824A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <CGME20200707175524eucas1p29d92419590ac09cc48de3336b834e69b@eucas1p2.samsung.com>
 <20200707175517.GC2621465@chromium.org>
 <854c0c60-b239-6626-2423-47058cb58feb@samsung.com>
From:   Jonathan Bakker <xc-racer2@live.ca>
Message-ID: <BN6PR04MB066001C2B9BB205A634FC6A8A3620@BN6PR04MB0660.namprd04.prod.outlook.com>
Date:   Sat, 11 Jul 2020 09:27:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <854c0c60-b239-6626-2423-47058cb58feb@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:300:117::30) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <3295e113-d4d8-48ac-1cbd-16f83664bfd2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:569:fb68:9c00:8067:f823:1e15:7520] (2001:569:fb68:9c00:8067:f823:1e15:7520) by MWHPR03CA0020.namprd03.prod.outlook.com (2603:10b6:300:117::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22 via Frontend Transport; Sat, 11 Jul 2020 16:27:09 +0000
X-Microsoft-Original-Message-ID: <3295e113-d4d8-48ac-1cbd-16f83664bfd2@live.ca>
X-TMN:  [xYuddcOpSso6J53TnaWUTRPkvLdBPdM+G5R/Um0hdsgFZGjageBoL2UDGUuaFkwc]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 9a59b2b9-fdd5-4beb-9998-08d825b74320
X-MS-TrafficTypeDiagnostic: DM6NAM12HT054:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YG/GvzBloVMbTy1gwuItC2h7SMNnAQyFvK0z7mIBSoPPw22mKqYp/onL2xFpiWrJV28iOMPm6jdsV7n1PlvTyT66CqeARvF5f3vBpMbHukqzZKT+HzLSjIFYpoRIKI4CT9QNRokw1L0RZkoOjR1ec5/UACFium6JD4TraK3rz1YAjio1TNlu888OWrYhfxxOu2lBjvUTP0j7Q9Rt4cUt+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: LqC6jB3DD6XfXIThLqaAXmiAMUKtl98PU6Hli/zxU8xZVmagzYsUaM6w0DwXJAu7ghs6K15RFFl6L61RWFJcl/dVFwYDlXex6EeTNk/KSzx2JFCDI3noILvWXAVifPn2jwcbz/D6NuWDbbTjWxxLbP4y2J4WWylm8rF7lAty8fiS+cKXftsIA8F+1xbgytwBP3ncdP0v8qqxeGrcD912Lg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a59b2b9-fdd5-4beb-9998-08d825b74320
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2020 16:27:12.0992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT066.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT054
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sylwester and Tomasz,

On 2020-07-08 8:11 a.m., Sylwester Nawrocki wrote:
> Hi,
> 
> On 07.07.2020 19:55, Tomasz Figa wrote:
>> On Sat, Apr 25, 2020 at 07:26:42PM -0700, Jonathan Bakker wrote:
>>> Not all devices use the CSIS device, some may use the FIMC directly in
>>> which case the CSIS device isn't registered.  This leads to a nullptr
>>> exception when starting the stream as the CSIS device is always
>>> referenced.  Instead, if getting the CSIS device fails, try getting the
>>> FIMC directly to check if we are using the subdev API
>>>
>>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>>> ---
>>>  drivers/media/platform/exynos4-is/media-dev.c | 17 ++++++++++++++++-
>>>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
>> Thank you for the patch. Please see my comments inline.
> 

Thank you both for taking the time to review the patches.

>>> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
>>> index 9aaf3b8060d5..5c32abc7251b 100644
>>> --- a/drivers/media/platform/exynos4-is/media-dev.c
>>> +++ b/drivers/media/platform/exynos4-is/media-dev.c
>>> @@ -289,11 +289,26 @@ static int __fimc_pipeline_s_stream(struct exynos_media_pipeline *ep, bool on)
>>>  		{ IDX_CSIS, IDX_FLITE, IDX_FIMC, IDX_SENSOR, IDX_IS_ISP },
>>>  	};
>>>  	struct fimc_pipeline *p = to_fimc_pipeline(ep);
>>> -	struct fimc_md *fmd = entity_to_fimc_mdev(&p->subdevs[IDX_CSIS]->entity);
>>>  	enum fimc_subdev_index sd_id;
>>>  	int i, ret = 0;
>>>  
>>>  	if (p->subdevs[IDX_SENSOR] == NULL) {
>>> +		struct fimc_md *fmd;
>>> +		struct v4l2_subdev *sd = p->subdevs[IDX_CSIS];
>>> +
>>> +		if (!sd)
>>> +			sd = p->subdevs[IDX_FIMC];
>>> +
>>> +		if (!sd) {
>>> +			/*
>>> +			 * If neither CSIS nor FIMC was set up,
>>> +			 * it's impossible to have any sensors
>>> +			 */
>>> +			return -ENODEV;
>>> +		}
>>> +
>>> +		fmd = entity_to_fimc_mdev(&sd->entity);
>>> +
>>
>> Are you sure this is the correct thing to do here? In general, the media
>> controller should be instantiated only if there are sensors in the system.
> 
> The code being changed is only about getting a pointer to the driver private 
> data structure 'struct fimc_md', for that we need to get hold of a media 
> entity that represents a subdev that is actually available in the pipeline.
> In original code it is overlooked that there might camera pipelines without
> the CSIS subdev. 
> 
>> What do you mean by using "the FIMC directly"? Do you mean using it only as
>> an m2m image processor or with a sensor, but without the CSIS, which would
>> be the case for parallel I/F sensors?
> 
> I think it is about a use case where the sensor is connected directly to the 
> FIMC capture interface (parallel), without the MIPI-CSI2 receiverin between.
> 

Yep, that's exactly what I mean.  The device that I'm working with (first gen
Galaxy S) has two devices (S5KA3DFX and CE147) connected via parallel input
to Camera Port A (yes, both of them to the same port).

Is it more correct to say "using the parallel port instead of the CSIS device"?
I'm happy to reword the commit message if that is the case.  

>> Could you point me to the place where CSIS is always dereferenced? A quick
>> look through the code only revealed that everywhere it seems to be guarded
>> by a NULL check.
> 
> It's in this patch, above, the very first line that the patch removes.
> 

Exactly :)

>> Another thought from looking at the implementation of
>> __fimc_pipeline_s_stream() is that it probably shouldn't call s_stream on
>> all the subdevices included in seq[], but only on those that are actually
>> included as a part of the pipeline. It would be quite a waste of power to
>> enable unnecessary hardware.
> 
> As we talked on IRC, only subdev in current active media pipeline will be
> powered on/off. The p->subdevs[] array is sparsely populated and there is 
> a test for NULL in __subdev_set_power(). Perhaps the test should be moved
> to the caller instead (fimc_pipeline_s_power()), so we don't ignore any
> ENXIO errors from the s_power v4l2_subdev_call. But is a material for 
> a separate patch.
> 

Ok, I'll leave it be for now.

Thanks,
Jonathan
