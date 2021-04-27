Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 096C936C59A
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 13:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237061AbhD0Lvd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 07:51:33 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:25445 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235443AbhD0Lvb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 07:51:31 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210427115046euoutp024f80b70eab902de1adacc28dd8bd290c~5tLjOksVB1659416594euoutp02N
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 11:50:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210427115046euoutp024f80b70eab902de1adacc28dd8bd290c~5tLjOksVB1659416594euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1619524246;
        bh=UO1dMcdSXAEl4nrOCrzKqU/g4oobdVaFvyoCv16LG8c=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=eGZNgVq5fnE7nMAHpDFjjFFXh2UelzaPC0uQzJpdKwqHGGccpKi3mHLgAH6aLwaft
         IiafuHQH77P5amcK2XUd/Q3O73AZngket9JRtsgwzOrUwuN+ymJUymudiLALdiyBPt
         7ftSQQ7mS9JSbXg/NCCLz98NeHVnEcQ3U98a8FJc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210427115046eucas1p17691dc61986249cbaf34eb0e5f754683~5tLi2ZABM2021820218eucas1p17;
        Tue, 27 Apr 2021 11:50:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 5F.8E.09444.69AF7806; Tue, 27
        Apr 2021 12:50:46 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210427115045eucas1p23bff0f9ec1887dfe81be7fe05b2a7c41~5tLiUW9ZZ0672806728eucas1p2v;
        Tue, 27 Apr 2021 11:50:45 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210427115045eusmtrp128e5cd9b8110334e7f866064d34ae956~5tLiTh_-X0367503675eusmtrp15;
        Tue, 27 Apr 2021 11:50:45 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-0c-6087fa966cfe
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 56.1A.08705.59AF7806; Tue, 27
        Apr 2021 12:50:45 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210427115045eusmtip1040b1157583ded2ca21e782098052c4d~5tLhpLILu0264402644eusmtip10;
        Tue, 27 Apr 2021 11:50:45 +0000 (GMT)
Subject: Re: [PATCH 58/78] media: exynos-gsc: use
 pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <5f6088c7-c839-f097-737f-b4234c413eac@samsung.com>
Date:   Tue, 27 Apr 2021 13:50:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427114235.45a7b2a4@coco.lan>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BMYRjG5zvn7C22Oa3YV27Nat1mbIpyZsgww8wyY1zGjKnQ7nIk2rC7
        US4J2ZSwI4pkukwjmrCO2lZJ5LIRLbqrVGoallzadUlIu4fRf7/3eZ/39s3Hx0XFHC9+RJSO
        1kQpIyVcN8L0sN86M+1HomJWm0VE3TQ6eNTzc20EZbUaeRTT1cChakszuVSKsZhDnbXexqh7
        159glD67lkt1nq9H1EXmJ7ZwhNzclofkCfd7OXKmIIkrv5F3QG5nJsoff7HzVnJD3OZvoiMj
        dtEa3wUKty1Ztgp8R9H4mA7jDTwepYmTkYAP5Bz4+sqKOVlEXkKgL5cnI7chdiA4k9TPZRN2
        BB+61/4r+NbDYKwpH0H9s0KcDT4jyKl6QThdo8gVwHT1cJzsSQZAsy3JNQInX2Pw1DDByVzS
        D44/OIGcLCQXQEPuL5efIKWgr2h19RlNbgRrVz2P9XjAo3PdLl1A+oLZ1Mhje4rhZXfW3/6T
        oKQ307UQkIkCKL+XymHXXgx575pxlkeBzVLEY3k8VKemEGzBYQQpZS08NjAgaLdkI9Y1D1pr
        fgw9Bn9oxHS4VurLyotAb0jlOWUg3aGp14Ndwh1OmdJxVhbCUb2IdfvAQEE6xrIXHOseJAxI
        kjHstIxh52QMOyfj/9xsRBQgMR2tVYfTWv8oerdMq1Rro6PCZRu3qxk09LOqf1scZpRv+yyr
        RBgfVSLg4xJPIbf0iEIk3KSM3UNrtodpoiNpbSUaxyckYqGqqDBMRIYrdfQ2mt5Ba/5lMb7A
        Kx6bGRxaoPI3ZHvZpY/LmLurHokbF/W9kJagkFulb/tHPgi5XLi0Iya2Ig6pQ/oqTtAN5bp2
        Kub0mDt9+xPsOql7x/sIVaguf+zg7C9vvGenmRcaqg62fJIG9T7c0FzXmDvtatG+y/4flzYv
        X985+WSCyaLQl6+9MhjWIvTRn6pb134ptDjn/LXnwYvbd77tHB2/dYlHkGnXxTgmKCBRstmW
        5aGuD9R8mHp3IFlsNnpKvCN6MqtleY5a3afW6ODcuLJY1d5MJXXo+1OBu/rk/Q1Zilvpy34d
        r5u7pipg9e+mkpu6IG9hqrH148imfQN79Koz7/36p7ySBTpMkc/qaoIDqy7USAjtFqXfDFyj
        Vf4Bt2bmC8gDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsVy+t/xu7pTf7UnGMy9p2exc8MXdouLM++y
        WJw/v4HdYtPja6wWl3fNYbPo2bCV1WLG+X1MFoc3nmGyaFtwmc3i4eyrjBbLNv1hcuD22HF3
        CaNHy5G3rB6bVnWyeWxeUu/xeZOcx6mvn9kD2KL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxM
        LPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mua/2s9csEWm4sGGzcwNjNPEuxg5OSQETCS+P9vE
        1MXIxSEksJRRYsGJzexdjBxACSmJ+S1KEDXCEn+udbFB1LxnlNiz+wYjSEJYwFfiY+sPVhBb
        RMBU4uarTrBBzALPmCQWXdwB1fGYSeLVswfsIFVsAoYSvUf7wLp5Bewkri36C9bNIqAq0bb/
        DguILSqQLLH692ZWiBpBiZMzn4DFOQX0JXZsuw42h1lAXeLPvEvMELa4xK0n85kgbHmJ7W/n
        ME9gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzBOtx37uXkH
        47xXH/UOMTJxMB5ilOBgVhLhZdvVmiDEm5JYWZValB9fVJqTWnyI0RTon4nMUqLJ+cBEkVcS
        b2hmYGpoYmZpYGppZqwkzrt17pp4IYH0xJLU7NTUgtQimD4mDk6pBqbSrxmvf6fPnLWNo3L7
        1r1RMjbzjETutNX3GIo9XBN7IuRCZoNUgrhweIaVy9nzr3RlSqJnP798t9BXX3XKLesvbjwZ
        Std0RP8LxZ/7qv3p+weXnVaf3il8bMyY6l234tclx4MShSJ7j2qbfPkVrib77ZBzXkyNi7nq
        q7uWEmuiODXu6GVsf8QuYCBzfn1JGovlg3PzBaZIse29lLk5L3bGplOr1pv3RFxxKOooTFnz
        iqtWZ0l4vIu8FUP3hnD20LpZloIlcyLcpxpmvdA7Un2JLfff86PB+Yr7clqkX32WXHi1VOrz
        lPX136OXu72rWica9jFwwVzhI1efZFYzVk/bsWxx3QnNqUfbn2u8fKLEUpyRaKjFXFScCAAV
        8rrkXAMAAA==
X-CMS-MailID: 20210427115045eucas1p23bff0f9ec1887dfe81be7fe05b2a7c41
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210424064556eucas1p1e89378837c377168c9782b4172e70482
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210424064556eucas1p1e89378837c377168c9782b4172e70482
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <CGME20210424064556eucas1p1e89378837c377168c9782b4172e70482@eucas1p1.samsung.com>
        <9c7d683907b9f9cf4a99f57f978671ec7f5a1dbc.1619191723.git.mchehab+huawei@kernel.org>
        <ee7b580a-d5bc-bdbf-3efc-c9d8f43316db@samsung.com>
        <20210427113055.745d0560@coco.lan> <20210427114235.45a7b2a4@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27.04.2021 11:42, Mauro Carvalho Chehab wrote:
> Em Tue, 27 Apr 2021 11:30:55 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
>> Em Tue, 27 Apr 2021 10:18:12 +0200
>> Sylwester Nawrocki <s.nawrocki@samsung.com> escreveu:
>>
>>> On 24.04.2021 08:45, Mauro Carvalho Chehab wrote:  
>>>> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
>>>> added pm_runtime_resume_and_get() in order to automatically handle
>>>> dev->power.usage_count decrement on errors.
>>>>
>>>> Use the new API, in order to cleanup the error check logic.
>>>>
>>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>>> ---
>>>>  drivers/media/platform/exynos-gsc/gsc-core.c | 3 +--
>>>>  drivers/media/platform/exynos-gsc/gsc-m2m.c  | 2 +-
>>>>  2 files changed, 2 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
>>>> index 9f41c2e7097a..9d5841194f6b 100644
>>>> --- a/drivers/media/platform/exynos-gsc/gsc-core.c
>>>> +++ b/drivers/media/platform/exynos-gsc/gsc-core.c
>>>> @@ -1210,7 +1210,7 @@ static int gsc_remove(struct platform_device *pdev)
>>>>  	struct gsc_dev *gsc = platform_get_drvdata(pdev);
>>>>  	int i;
>>>>  
>>>> -	pm_runtime_get_sync(&pdev->dev);
>>>> +	pm_runtime_resume_and_get(&pdev->dev);
>>>>  
>>>>  	gsc_unregister_m2m_device(gsc);
>>>>  	v4l2_device_unregister(&gsc->v4l2_dev);
>>>> @@ -1219,7 +1219,6 @@ static int gsc_remove(struct platform_device *pdev)
>>>>  	for (i = 0; i < gsc->num_clocks; i++)
>>>>  		clk_disable_unprepare(gsc->clock[i]);
>>>>  
>>>> -	pm_runtime_put_noidle(&pdev->dev);    
>>>
>>> If we do this then the device usage count will not get decremented
>>> after the pm_runtime_resume_and_get() call above and after driver
>>> unload/load cycle it will not be possible to suspend the device.
>>> I wouldn't be changing anything in gsc_remove(), pm_runtime_get_sync()
>>> works better in that case.  
>>
>> Good point.
>>
>> Actually, I don't see any reason why to call a PM resume
>> function - either being pm_runtime_get_sync() or
>> pm_runtime_resume_and_get().
>>
>> The code there could simply be:
>>
>>     static int gsc_remove(struct platform_device *pdev)
>>     {
>>         struct gsc_dev *gsc = platform_get_drvdata(pdev);
>>         int i;
>>
>>         gsc_unregister_m2m_device(gsc);
>>         v4l2_device_unregister(&gsc->v4l2_dev);
>>
>>         vb2_dma_contig_clear_max_seg_size(&pdev->dev);
>>         for (i = 0; i < gsc->num_clocks; i++)
>>                 clk_disable_unprepare(gsc->clock[i]);
>>
>>         pm_runtime_disable(&pdev->dev);
>>
>>         dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
>>         return 0;
>>     }
>>
>> Eventually also adding:
>> 	pm_runtime_suspended(&pdev->dev);
> 
> In time: I actually meant:
> 
> 	pm_runtime_set_suspended(&pdev->dev);
> 
> but after double-checking the PM runtime code, it sounds to me that
> just calling pm_runtime_disable() would be enough. Not 100% sure
> here. Btw, some media drivers call it after pm_runtime_disable(),
> while others don't do.

I think if the device is brought into suspended state (e.g. by
disabling clocks as above) the pm_runtime_set_suspended() call
should be there. IOW a following sequence: 

	pm_runtime_disable(dev);
	if (!pm_runtime_status_suspended(dev))
		/* put device into suspended state (disable clocks, 
		  voltage regulators, assert GPIOs, etc. */
	pm_runtime_set_suspended(dev);

--
Regards,
Sylwester
