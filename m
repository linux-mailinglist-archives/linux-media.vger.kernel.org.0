Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5269E218B53
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 17:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730071AbgGHPee (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 11:34:34 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33710 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730076AbgGHPee (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 11:34:34 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200708153432euoutp02d4c7fedcb9c6e2b199a178e8891fbf86~f0ORyCSIA1662016620euoutp02a
        for <linux-media@vger.kernel.org>; Wed,  8 Jul 2020 15:34:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200708153432euoutp02d4c7fedcb9c6e2b199a178e8891fbf86~f0ORyCSIA1662016620euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594222472;
        bh=OCLKFrly7d36k58waRUojkkZYFe/5ehU83mgAj4X/cg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=r6NjhxoH4pz3VXafvQ6e92G7RuyEd11ZGHQ7TqnOnHWs1CHA7Oj8lMoVAmRRjWV6j
         FQqz2oxwKRNN7JRXnQdTuyJdVq2AH0xqhIZMKgu522oa7bv9xLkiZ8ITHWbMN+t/ej
         SdgBGIjkPG2sMZimnGoDr8JwNWBRwh2Gwavw3aJ8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200708153432eucas1p289172299f1a8c51b74300462fe081ec9~f0ORPko6y2760427604eucas1p2I;
        Wed,  8 Jul 2020 15:34:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 49.C9.06318.887E50F5; Wed,  8
        Jul 2020 16:34:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200708153431eucas1p2b49c4ebc46107dfa4052fbba81f8063b~f0OQxV2er1260312603eucas1p2L;
        Wed,  8 Jul 2020 15:34:31 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200708153431eusmtrp1ebd3ead96b36396cf0c2d631168cf94b~f0OQwrP6r1128811288eusmtrp1D;
        Wed,  8 Jul 2020 15:34:31 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-42-5f05e78830e5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 3C.E5.06017.787E50F5; Wed,  8
        Jul 2020 16:34:31 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200708153430eusmtip2839ff6f4274f3bdafafafdef908ca0b3~f0OP8RA242925229252eusmtip27;
        Wed,  8 Jul 2020 15:34:30 +0000 (GMT)
Subject: Re: [PATCH 04/11] media: exynos4-is: Correct missing entity
 function initialization
To:     Tomasz Figa <tfiga@chromium.org>,
        Jonathan Bakker <xc-racer2@live.ca>
Cc:     kyungmin.park@samsung.com, mchehab@kernel.org, kgene@kernel.org,
        krzk@kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <afe50670-2452-2fe6-d0cc-0e1f83497873@samsung.com>
Date:   Wed, 8 Jul 2020 17:34:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200707180917.GD2621465@chromium.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLKsWRmVeSWpSXmKPExsWy7djP87odz1njDX4/ZLLof/ya2eL8+Q3s
        Fmeb3rBbbHp8jdXi8q45bBY9G7ayWsw4v4/JYtmmP0wWn1v/sVlcnHiXxYHLY3bDRRaPTas6
        2Tw2L6n3WHTzB4tH35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZUx6U1ywUqji+q31zA2My/m7
        GDk5JARMJDaeOsrUxcjFISSwglHiX8NZdpCEkMAXRolZ7WEQ9mdGialvxGAaemdMYIZoWM4o
        8WLPFDYI5yOjxPU/h8G6hQXiJCafX8AEYosIeEpce9AG1sEscI9RYu/XNcwgCTYBQ4neo32M
        IDavgJ3En1X/WUBsFgEViQldX1lBbFGgQetfbmeCqBGUODnzCVgNJ9AZJ7/dAIszC4hL3Hoy
        H8qWl9j+dg7YMgmBU+wSX3YfY4K420XixMv/7BC2sMSr41ugbBmJ05N7WCAamhklenbfZodw
        JjBK3D++gBGiylrizrlfQI9yAK3QlFi/Sx8i7Cjxac9NZpCwhACfxI23ghBH8ElM2jYdKswr
        0dEmBFGtIvF71XSoc6Qkup/8Z5nAqDQLyWuzkLwzC8k7sxD2LmBkWcUonlpanJueWmycl1qu
        V5yYW1yal66XnJ+7iRGYqE7/O/51B+O+P0mHGAU4GJV4eF9sYo0XYk0sK67MPcQowcGsJMLr
        dPZ0nBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe40UvY4UE0hNLUrNTUwtSi2CyTBycUg2M3uvq
        Wrxy9A9s+cJ956tS6pRF9cejn2QcK6ltO7DWddI698V3d5bf+z73PE9M219zHx+mj0FdDb7L
        2c/Xz5u8/pZX5Hnt1qVXl6z6PG3qjxdankcSn18OqD2n7PNcuH1xwaashvNbq6MKbnV8sNmq
        td6Ur1JOVNJ00TvBj8sZ1hjwzjvPolaupsRSnJFoqMVcVJwIAID4XpFQAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsVy+t/xe7rtz1njDdY0KVv0P37NbHH+/AZ2
        i7NNb9gtNj2+xmpxedccNoueDVtZLWac38dksWzTHyaLz63/2CwuTrzL4sDlMbvhIovHplWd
        bB6bl9R7LLr5g8Wjb8sqRo/Pm+QC2KL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1j
        rYxMlfTtbFJSczLLUov07RL0Mia9KS5YKVRx/dZ65gbG5fxdjJwcEgImEr0zJjB3MXJxCAks
        ZZT4fmcOkMMBlJCSmN+iBFEjLPHnWhcbRM17RokDU86xgiSEBeIkfhy6zQJiiwh4Slx70AY2
        iFngHqPE0xkNUB3tTBKTb75iBqliEzCU6D3axwhi8wrYSfxZ9R+sm0VARWJC11ewqaJAU5dv
        mc8OUSMocXLmE7AaTqBTT367wQRiMwuoS/yZd4kZwhaXuPVkPlRcXmL72znMExiFZiFpn4Wk
        ZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjM1tx35u2cHY9S74EKMAB6MS
        D++LTazxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EaAr03ERmKdHkfGDa
        yCuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwOjepHayeGrVZEXB
        +FkawpGlXrrX41df7LxQYvL1CHNG+ceSL5bHm+w3RB5y5TzIc0Ppg4iid/gKvoW31KvC9wvM
        L15zfKIUqybThJx3L4tU1YIcP9jtf9ol2vua3erskZZtwuKvXr7oerzzqJ1hzM5TF/yNbwjO
        vvpUJsg37cqymjotUZlUJiWW4oxEQy3mouJEADj1A9/jAgAA
X-CMS-MailID: 20200708153431eucas1p2b49c4ebc46107dfa4052fbba81f8063b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200707180927eucas1p14bedf7f773c5e86c3e3234928ee347a4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200707180927eucas1p14bedf7f773c5e86c3e3234928ee347a4
References: <20200426022650.10355-1-xc-racer2@live.ca>
        <BN6PR04MB0660E680A4F69E3037D87E70A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
        <CGME20200707180927eucas1p14bedf7f773c5e86c3e3234928ee347a4@eucas1p1.samsung.com>
        <20200707180917.GD2621465@chromium.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 07.07.2020 20:09, Tomasz Figa wrote:
> On Sat, Apr 25, 2020 at 07:26:43PM -0700, Jonathan Bakker wrote:
>> Commit bae4500399c4 ("[media] exynos4-is: Add missing entity function
>> initialization") tried to suppress the warnings such as
>>
>> s5p-fimc-md camera: Entity type for entity FIMC.0 was not initialized!
>>
>> However, this didn't work in all cases.  Correct this by calling the set
>> function earlier.
>>
>> Fixes: bae4500399c4 ("exynos4-is: Add missing entity function initialization")
>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>> ---
>>  drivers/media/platform/exynos4-is/fimc-capture.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)

> Thank you for the patch. Please see my comments inline.

>> diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
>> index 705f182330ca..86c233e2f2c9 100644
>> --- a/drivers/media/platform/exynos4-is/fimc-capture.c
>> +++ b/drivers/media/platform/exynos4-is/fimc-capture.c
>> @@ -1799,7 +1799,6 @@ static int fimc_register_capture_device(struct fimc_dev *fimc,
>>  	vid_cap->wb_fmt.code = fmt->mbus_code;
>>  
>>  	vid_cap->vd_pad.flags = MEDIA_PAD_FL_SINK;
>> -	vfd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;

I think we should leave above line as is, or perhaps change the function
to MEDIA_ENT_F_PROC_VIDEO_COMPOSER and...

> Isn't vfd->entity above a different entity than sd->entity below? If so,
> this line must stay.
> 
>>  	ret = media_entity_pads_init(&vfd->entity, 1, &vid_cap->vd_pad);
>>  	if (ret)
>>  		goto err_free_ctx;
>> @@ -1898,6 +1897,7 @@ int fimc_initialize_capture_subdev(struct fimc_dev *fimc)
>>  		return ret;
>>  
>>  	sd->entity.ops = &fimc_sd_media_ops;
>> +	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;

...also add an assignment like this.

vfd->entity and sd->entity are different entities, vfd->entity corresponds to
the capture video node and sd->entity is the capture subdevice media entity. 

> My understanding is that this is the capture subdev and not the scaler.
> Looking at the other drivers, MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER
> could be the right function to use here.

Scaling can also be configured on that subdev, actually both functions would
be valid.

-- 
Regards,
Sylwester
