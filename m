Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AEBE27009D
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 17:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgIRPN0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 11:13:26 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51768 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgIRPNZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 11:13:25 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200918151323euoutp0296ceef046561ccb592b7d84200301034~16YWzWKR31315713157euoutp02C
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2020 15:13:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200918151323euoutp0296ceef046561ccb592b7d84200301034~16YWzWKR31315713157euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600442003;
        bh=SZbHVV2JypCryt9GVj8eUqjOJnnk5VyYDZFqjnLzPdA=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=JTFat9C0WXn81ciROxXFIIcowHMhlvZRdjq59LEqVPJHlJZz/h+jE3sW8fhkbMUUf
         zrz9Lq5reWgDIi/o0d664y65AQWogMlifALxhxPMCvhVSbfYRh9JQ4atYBuv/9UA/K
         +7PD6bOm303iF+bVH3MJVI8bifoU8uAbpF63BJEU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200918151322eucas1p154435b3ed506dda02cbde20320f59e9d~16YWSYSP81330713307eucas1p1D;
        Fri, 18 Sep 2020 15:13:22 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id BE.94.06318.29EC46F5; Fri, 18
        Sep 2020 16:13:22 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200918151322eucas1p236126959c3cc725132450b228701ee72~16YV6FGzN2444524445eucas1p2S;
        Fri, 18 Sep 2020 15:13:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200918151322eusmtrp2fd051ad885278f61b4ae44c30dc2a27d~16YV49JF20618906189eusmtrp2S;
        Fri, 18 Sep 2020 15:13:22 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-d9-5f64ce927644
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 35.52.06017.19EC46F5; Fri, 18
        Sep 2020 16:13:21 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200918151320eusmtip2208d181453ed3ef09a4f43c068dcffaa~16YUdkdOB0469904699eusmtip24;
        Fri, 18 Sep 2020 15:13:20 +0000 (GMT)
Subject: Re: [PATCH 00/18] Convert arch/arm to use iommu-dma
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
        linux@armlinux.org.uk
Cc:     will@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, agross@kernel.org,
        bjorn.andersson@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, vdumpa@nvidia.com, digetx@gmail.com,
        matthias.bgg@gmail.com, yong.wu@mediatek.com,
        geert+renesas@glider.be, magnus.damm@gmail.com, t-kristo@ti.com,
        s-anna@ti.com, laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-ID: <693f4d91-7dd3-31e6-92b6-7ffa84dd3226@samsung.com>
Date:   Fri, 18 Sep 2020 17:13:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bf32cdea-ee5b-1431-3b97-c0889acdacc6@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0yTZxTG9373Emo+ipMzXNjWuCWaiCKavYmE3ZN3f5gsiybGRFi3fkEU
        KuknOuaWVcBJO0VbM8Ci1SDGDbwwLpV7Q7V2BSkCiuhgdcLmysRiwE1B3Ww/2Pjvd55znpzz
        vHkFWnOVixcyDTsko0GXpeWiGOflx/7lNr8+faXzQDz2j8wwuMt1n8HVD0YQvvYwxOFj5TaE
        f6j2UNgWOMTgE661uNBewWBzeQ2Pu/Pv8dhsreRx7cgAi62ubh73Nx/l8P6aBhb3F/QiXNbT
        TmHzlJ3D7u/aEL5dPc7h/MJk3DExyuK26XYWlx0OcrjytyIOP252MLi47WNcOLQGB2x1zNsJ
        ZLTDQZEzjjOI9A/00sTavZw02Yd5Ul50hCW1VWaODA20ciTwrZcidZVfk8ODpxFpuWniSKHP
        xZADBfc5UlxfhYh38AL1UcymqBS9lJW5UzKuSP0kakvD30tyQos+7+zrpUyoQ2NBKgHE1WCu
        LqEsKErQiN8jmLzxiFaKKQQB0wSjFJMIDpb8RM9ZJjpLZxunEYz1HJ21hBDM7B1hw1OxYgp4
        eu9GHJyYBJZxCxfmheJmmG58wocNtNjKgskWYMINtZgKp1pqIsyIr8Mvx5oi/KKYBpc778zO
        xIDvyOhzFgSV+Bb86IoOy7T4ChQ0lNMKx8Gt0eORQCCWqsC37xKrnP0+NJ5roBSOhTFvPa/w
        y/BP05yhAMGv/rO8UuxH0J9fhpSptTDkn+bCm2lxKZxvXqHI74BnuDUig7gABsdjlCMWgM1Z
        SiuyGoq+mX3sN8DuPfff2o6rffQhpLXPS2afF8c+L479/70nEFOF4qRcOTtDkpMN0q5EWZct
        5xoyEj/bnl2Lnv/zrmfeh42o/cmnbiQKSBut/sOhT9ewup1yXrYbgUBrF6rf7e5K06j1urwv
        JOP2dGNuliS70WKB0capkyuCmzVihm6HtE2SciTjXJcSVPEmpDrVZmi2rHd6Uto148OrdoXe
        vLd1z0FH13WNGzlbSOzJnoRLX+7WvSenvXY24avFVyouBH/PGby959WYnLtBhy9+Xf3G4zPr
        3Bf3Pc3c2JpXetL351ZPUmjpJHk0pR37C1le+rAuWPUB9BVbz6cyiSUbeJ+18oU1q/U3on+2
        ZdzEWMvIW3RJy2ijrPsX0InXyeMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe8/OOTtGi9Na9TK6cVIIoVOb6R5rmtWHTtCHLtSHrGy4w6yc
        k3NmZBTNHKGzJI3Ktlo3LdI+mJdM09YsMzMLM5aFaeEig7wUWXRBU1fgtx/P8/898MCfUajf
        UVpmT5pdlNJMqRw9lWwdae5eUvjMnLTs9GF41vubhFbfAAllX3oRvBwepOGCpxDBjbImAgp7
        TpJwybcSnO4rJOR6ypXQdvSzEnILipVQ0RugoMDXpoSOuvM0HC+vpqAjux1B0fN7BOR+c9PQ
        eLoBwbuyfhqOOqPAPxSkoOHXPQqKTn2iofhDDg0/67wk5DdsBmdXNPQUVpIJ84Wg30sIN703
        kdARaFcIBW1LhFr3W6XgyTlHCRWlubTQFainhZ68ZkKoLD4inOq8joS7rx204GzxkcKJ7AFa
        yK8qRUJzZw2xccZ23ijZMuziwhSbbI/jEnWg53WxwOuXx/K6KMPOFfpobmm80Sym7tkvSkvj
        d/Mp1T/C0wdnH3jyop1wIL/ahcIYzC7HQ0/Oki40lVGzJQg7L2crQou5uOWMgwrxTPwn4KJD
        oX6E60b6iPHFTNaIm9o/Tgg0q8Ou/vFQGKNhd+Jv18smWMHWU7ikXxuS7yN8dfTKhKxi43HJ
        3XJynEk2AndfqJ3gWewu/PR4Hx3KzMAt54Jjc4YJY1fhW75poZsx2Fv5XhHiBTi72vOP5+A3
        wYvESaR2T7LdkxT3JMU9SbmEyFKkETNkq8Uq63nZZJUz0ix8ss1agcbadfvRz6o7yDWwpRGx
        DOKmqfq85iQ1ZdovZ1obEWYUnEa1pq11l1plNmUeFCVbkpSRKsqNKHrstwKFdlaybayrafYk
        XbTOALE6Q5QhKga4Oaoc1r9DzVpMdnGfKKaL0n+PYMK0DrS4atHuZO4V72ww67v1XYPd0x8Y
        /X+k0b1r7eWRlhvVs0s9ZJ4U3HYm3JlXkxnewTpWboW5QwHNvPrECG1Wa+Kh4WtNceSUT/cj
        uc5lPz4WRaTHDA0/tGy2H6kZ3PT98Rrj+pIN7n1fdxxbN7ot/2Fn1peY1bUJI/m8hkjIYuIM
        HCmnmHSRCkk2/QUeyKrJcwMAAA==
X-CMS-MailID: 20200918151322eucas1p236126959c3cc725132450b228701ee72
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200820150857eucas1p18f5f2ad87703a68b6ed20a090f7c1c57
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200820150857eucas1p18f5f2ad87703a68b6ed20a090f7c1c57
References: <CGME20200820150857eucas1p18f5f2ad87703a68b6ed20a090f7c1c57@eucas1p1.samsung.com>
        <cover.1597931875.git.robin.murphy@arm.com>
        <bf32cdea-ee5b-1431-3b97-c0889acdacc6@samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

On 24.08.2020 13:40, Marek Szyprowski wrote:
> On 20.08.2020 17:08, Robin Murphy wrote:
>> After 5 years or so of intending to get round to this, finally the
>> time comes! The changes themselves actualy turn out to be relatively
>> mechanical; the bigger concern appears to be how to get everything
>> merged across about 5 diffferent trees given the dependencies.
>>
>> I've lightly boot-tested things on Rockchip RK3288 and Exynos 4412
>> (Odroid-U3), to the degree that their display drivers should be using
>> IOMMU-backed buffers and don't explode (the Odroid doesn't manage to
>> send a working HDMI signal to the one monitor I have that it actually
>> detects, but that's a pre-existing condition...) Confirmation that the
>> Mediatek, OMAP and Tegra changes work will be most welcome.
>>
>> Patches are based on 5.9-rc1, branch available here:
>>
>>    git://linux-arm.org/linux-rm arm/dma
>
> Well, my first proposal for the ARM and ARM64 DMA-mapping unification 
> has been posted long time ago: https://lkml.org/lkml/2016/2/19/79
>
> Thanks for resurrecting it! :)
>
> I've tested this patchset on various ARM32bit Exynos based boards (not 
> only Exynos4412) and most of them works fine after your conversion. 
> However there are issues you cannot learn from the code.
>
> Conversion of the Exynos DRM was straightforward (thanks!), but there 
> are other Exynos drivers that depends on the old ARM implementation. 
> The S5P-MFC (only for the v5 hardware) and Exynos4 FIMC-ISP drivers 
> depends on the first-fit IOVA allocation algorithm in the old ARM 
> DMA-mapping. This was the main reason I've didn't continue my initial 
> conversion attempt.
>
> Both drivers allocate a buffer for their firmware and then in the 
> hardware registers address video buffers as an offset from the 
> begginning of the firmware. This doesn't work when underlying 
> DMA-mapping allocates IOVA with the last-fit algorithm, what the 
> drivers/iommu/dma-iommu.c does. So far I didn't find a good solution 
> for that issue.
>
> I'm open for suggestions. One more limitation for the S5P-MFC driver 
> is that the hardware is capable only for addressing 128MiB. They will 
> probably need to call IOMMU API directly, but I would like to keep as 
> much from the IOMMU/DMA-mapping code as possible.

Just for the record. I've finally managed to add needed workarounds to 
the both problematic Exynos4 drivers, so they work fine with this 
patchset. It turned out that it wasn't that hard:

https://lore.kernel.org/linux-samsung-soc/20200918144833.14618-1-m.szyprowski@samsung.com/T/#t

So from my side you have a green light to go ahead and switch ARM 32bit 
to generic code. Time to say good bye to the one of my biggest 
architecture related things merged once to mainline Linux. ;)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

