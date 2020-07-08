Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33867218ADC
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 17:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729988AbgGHPLv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 11:11:51 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55483 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729022AbgGHPLu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 11:11:50 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200708151148euoutp02ac3c17c99afa70b6635b55d818f6be46~fz6bjdHjf0232702327euoutp02c
        for <linux-media@vger.kernel.org>; Wed,  8 Jul 2020 15:11:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200708151148euoutp02ac3c17c99afa70b6635b55d818f6be46~fz6bjdHjf0232702327euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594221108;
        bh=1UyJZTxgyEjK49sDvXl9RzFJMxzSpHL6HWnLqW7SBNQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Sf7kFnkv50acmk8h9yb6LkZeoFUMr2hqHyMKAPHud+ChBsNdmAVB3PDk4D3So5kBb
         sqaG68Tt+1CAArBgd1CHVEJCWc+K5d7ufvUQHdBCQbgyFFlzJJpRhha6pBVGddaEEr
         AGe4IKXgl+Et/44WQ2ow3lViQLeYg+NfppGPJWcA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200708151148eucas1p2718f4e08ec88595dbf8dd6907dab2f5a~fz6bPGE4v3159931599eucas1p2a;
        Wed,  8 Jul 2020 15:11:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id A2.D4.06456.432E50F5; Wed,  8
        Jul 2020 16:11:48 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200708151147eucas1p2dbbcc778cc0b45bee92e8237461343cd~fz6avQcNu1203112031eucas1p2L;
        Wed,  8 Jul 2020 15:11:47 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200708151147eusmtrp20dad62aac2f9a9f4842bbda3814ff588~fz6am1xWB0501405014eusmtrp25;
        Wed,  8 Jul 2020 15:11:47 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-92-5f05e234a1f6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 18.04.06314.332E50F5; Wed,  8
        Jul 2020 16:11:47 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200708151146eusmtip1bd0892aef0aef3a0286b66bd9075bfdb~fz6Zs9ti00344003440eusmtip1f;
        Wed,  8 Jul 2020 15:11:46 +0000 (GMT)
Subject: Re: [PATCH 03/11] media: exynos4-is: Fix nullptr when no CSIS
 device present
To:     Tomasz Figa <tfiga@chromium.org>,
        Jonathan Bakker <xc-racer2@live.ca>
Cc:     kyungmin.park@samsung.com, mchehab@kernel.org, kgene@kernel.org,
        krzk@kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <854c0c60-b239-6626-2423-47058cb58feb@samsung.com>
Date:   Wed, 8 Jul 2020 17:11:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200707175517.GC2621465@chromium.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRmVeSWpSXmKPExsWy7djPc7omj1jjDVr+8ln0P37NbHH+/AZ2
        i7NNb9gtNj2+xmpxedccNoueDVtZLWac38dksWzTHyaLz63/2CwuTrzL4sDlMbvhIovHplWd
        bB6bl9R7LLr5g8Wjb8sqRo/Pm+QC2KK4bFJSczLLUov07RK4Mo6svMFSsEqmYvq+o+wNjA/F
        uhg5OSQETCROHlnB0sXIxSEksIJR4vOVNlaQhJDAF0aJrw9ZIRKfGSXu9X1kgek40X6cESKx
        nFFi/9T/zBDOR0aJ7lPXmUCqhAXCJa5v6wSzRQQ8Ja49aAMrYha4xyix9+saZpAEm4ChRO/R
        PkYQm1fATqJzxTSwFSwCKhIfl58DqxEViJNY/3I7E0SNoMTJmU/AajiBzri//wWYzSwgLnHr
        yXwmCFteYvvbOWDLJAQusUv0PdvKCnG3i0T31WWMELawxKvjW9ghbBmJ/ztBmkEamhklenbf
        ZodwJjBK3D++AKrDWuLOuV9sXYwcQCs0Jdbv0gcxJQQcJbo3V0GYfBI33gpC3MAnMWnbdGaI
        MK9ER5sQxAwVid+rpjNB2FIS3U/+s0xgVJqF5LNZSL6ZheSbWQhrFzCyrGIUTy0tzk1PLTbM
        Sy3XK07MLS7NS9dLzs/dxAhMVaf/Hf+0g/HrpaRDjAIcjEo8vBM2sMYLsSaWFVfmHmKU4GBW
        EuF1Ons6Tog3JbGyKrUoP76oNCe1+BCjNAeLkjiv8aKXsUIC6YklqdmpqQWpRTBZJg5OqQZG
        l0De9b/mHbzrUqn6tfZKtvmVhOTVJf9Xs5U9Ylq1TtrUbfaSkEvpYuerbrSf5b7+/L/ywZrP
        AVHcFZtKpx4LV/knJHY+PkbAp6va5+rTkB/O+1eduzdzXfnJNMe0fLFJM5Z8Xp84O0Zb5c9X
        U+69NZYbrWSTgz8zc1zf9lwu7ORDO5kTbeZtSizFGYmGWsxFxYkA8J2/tlEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsVy+t/xu7rGj1jjDX706ln0P37NbHH+/AZ2
        i7NNb9gtNj2+xmpxedccNoueDVtZLWac38dksWzTHyaLz63/2CwuTrzL4sDlMbvhIovHplWd
        bB6bl9R7LLr5g8Wjb8sqRo/Pm+QC2KL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1j
        rYxMlfTtbFJSczLLUov07RL0Mo6svMFSsEqmYvq+o+wNjA/Fuhg5OSQETCROtB9n7GLk4hAS
        WMoo8X7dESCHAyghJTG/RQmiRljiz7UuNoia94wSzzcfYwFJCAuES6y5+5kVxBYR8JS49qCN
        GaSIWeAeo8TTGQ1QHe1MEvuar7KDVLEJGEr0Hu1jBLF5BewkOldMA5vEIqAi8XH5OWYQW1Qg
        TmL5lvnsEDWCEidnPgGr4QQ69f7+F2A2s4C6xJ95l5ghbHGJW0/mM0HY8hLb385hnsAoNAtJ
        +ywkLbOQtMxC0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYHRuO/Zz8w7GSxuDDzEK
        cDAq8fC+2MQaL8SaWFZcmXuIUYKDWUmE1+ns6Tgh3pTEyqrUovz4otKc1OJDjKZAz01klhJN
        zgcmjrySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYyqqx+xfDy6
        6NvlKZHzHi078SZI9clajzczA0xi3vLYnYjd/H3pTL71u5JslJxrm9Yd3MRv99Znl0vPl1cq
        //L/7ftRpRe4SHjmCb3g6edvbHCb9+VC86ECz8oLe6+GJ9/nfqbM1bfo2fmkHxonp0pNPSCV
        fWlh65vVr5zOrPYJVZz/dSLzrayaAiWW4oxEQy3mouJEAA7zF97kAgAA
X-CMS-MailID: 20200708151147eucas1p2dbbcc778cc0b45bee92e8237461343cd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200707175524eucas1p29d92419590ac09cc48de3336b834e69b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200707175524eucas1p29d92419590ac09cc48de3336b834e69b
References: <20200426022650.10355-1-xc-racer2@live.ca>
        <BN6PR04MB0660EE7304C2BB2E603A8824A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
        <CGME20200707175524eucas1p29d92419590ac09cc48de3336b834e69b@eucas1p2.samsung.com>
        <20200707175517.GC2621465@chromium.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 07.07.2020 19:55, Tomasz Figa wrote:
> On Sat, Apr 25, 2020 at 07:26:42PM -0700, Jonathan Bakker wrote:
>> Not all devices use the CSIS device, some may use the FIMC directly in
>> which case the CSIS device isn't registered.  This leads to a nullptr
>> exception when starting the stream as the CSIS device is always
>> referenced.  Instead, if getting the CSIS device fails, try getting the
>> FIMC directly to check if we are using the subdev API
>>
>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>> ---
>>  drivers/media/platform/exynos4-is/media-dev.c | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)

> Thank you for the patch. Please see my comments inline.

>> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
>> index 9aaf3b8060d5..5c32abc7251b 100644
>> --- a/drivers/media/platform/exynos4-is/media-dev.c
>> +++ b/drivers/media/platform/exynos4-is/media-dev.c
>> @@ -289,11 +289,26 @@ static int __fimc_pipeline_s_stream(struct exynos_media_pipeline *ep, bool on)
>>  		{ IDX_CSIS, IDX_FLITE, IDX_FIMC, IDX_SENSOR, IDX_IS_ISP },
>>  	};
>>  	struct fimc_pipeline *p = to_fimc_pipeline(ep);
>> -	struct fimc_md *fmd = entity_to_fimc_mdev(&p->subdevs[IDX_CSIS]->entity);
>>  	enum fimc_subdev_index sd_id;
>>  	int i, ret = 0;
>>  
>>  	if (p->subdevs[IDX_SENSOR] == NULL) {
>> +		struct fimc_md *fmd;
>> +		struct v4l2_subdev *sd = p->subdevs[IDX_CSIS];
>> +
>> +		if (!sd)
>> +			sd = p->subdevs[IDX_FIMC];
>> +
>> +		if (!sd) {
>> +			/*
>> +			 * If neither CSIS nor FIMC was set up,
>> +			 * it's impossible to have any sensors
>> +			 */
>> +			return -ENODEV;
>> +		}
>> +
>> +		fmd = entity_to_fimc_mdev(&sd->entity);
>> +
> 
> Are you sure this is the correct thing to do here? In general, the media
> controller should be instantiated only if there are sensors in the system.

The code being changed is only about getting a pointer to the driver private 
data structure 'struct fimc_md', for that we need to get hold of a media 
entity that represents a subdev that is actually available in the pipeline.
In original code it is overlooked that there might camera pipelines without
the CSIS subdev. 

> What do you mean by using "the FIMC directly"? Do you mean using it only as
> an m2m image processor or with a sensor, but without the CSIS, which would
> be the case for parallel I/F sensors?

I think it is about a use case where the sensor is connected directly to the 
FIMC capture interface (parallel), without the MIPI-CSI2 receiverin between.

> Could you point me to the place where CSIS is always dereferenced? A quick
> look through the code only revealed that everywhere it seems to be guarded
> by a NULL check.

It's in this patch, above, the very first line that the patch removes.

> Another thought from looking at the implementation of
> __fimc_pipeline_s_stream() is that it probably shouldn't call s_stream on
> all the subdevices included in seq[], but only on those that are actually
> included as a part of the pipeline. It would be quite a waste of power to
> enable unnecessary hardware.

As we talked on IRC, only subdev in current active media pipeline will be
powered on/off. The p->subdevs[] array is sparsely populated and there is 
a test for NULL in __subdev_set_power(). Perhaps the test should be moved
to the caller instead (fimc_pipeline_s_power()), so we don't ignore any
ENXIO errors from the s_power v4l2_subdev_call. But is a material for 
a separate patch.

-- 
Regards,
Sylwester
