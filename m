Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2665E64B1
	for <lists+linux-media@lfdr.de>; Thu, 22 Sep 2022 16:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbiIVOHJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Sep 2022 10:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbiIVOHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Sep 2022 10:07:07 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E98F08B6
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 07:07:02 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20220922140659euoutp02b9aca2e6d76cbafdea123753d5eb9a33~XM97rUajd1454714547euoutp02Y
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 14:06:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20220922140659euoutp02b9aca2e6d76cbafdea123753d5eb9a33~XM97rUajd1454714547euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1663855619;
        bh=zgOYakY9X7QXYVyAON3xC+Ir9NSPjnhB79SwCxIEpUM=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=ciUpORwA79JZaL81b/0ob+IVmFLFFOvJML2p0N9ad3T7tlRfWGr285NLOV3gUHSx+
         g6BCjXgqAeCP/eO4mQLlxDm4rQOcMpbKcxL2O1WYW6Rkxek/KJvXpoBWOZFKAoTP3Z
         VcsccrFO30dBdssRRDP+ZqizdyWcvfA1i0MSnq14=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220922140659eucas1p1f43dd5272003cb5a0b5ea20246f86cbf~XM97R3CqI0178501785eucas1p1e;
        Thu, 22 Sep 2022 14:06:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id D4.EF.19378.30C6C236; Thu, 22
        Sep 2022 15:06:59 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220922140658eucas1p29f9d609e795ed064e51694c0e7be80d3~XM96zM0eE2266622666eucas1p2f;
        Thu, 22 Sep 2022 14:06:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220922140658eusmtrp1468cc2c290128b282655c3b6d7647c09~XM96ySpo51492014920eusmtrp1b;
        Thu, 22 Sep 2022 14:06:58 +0000 (GMT)
X-AuditID: cbfec7f5-a4dff70000014bb2-3f-632c6c03c4db
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id BE.65.10862.20C6C236; Thu, 22
        Sep 2022 15:06:58 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220922140658eusmtip270d085efe84005aa8d2d3aa427990353~XM96NY6SA1866318663eusmtip2L;
        Thu, 22 Sep 2022 14:06:58 +0000 (GMT)
Message-ID: <083edac1-8a8f-d842-e496-b657b4e4014e@samsung.com>
Date:   Thu, 22 Sep 2022 16:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] media: v4l2-async: Use endpoints in
 __v4l2_async_nf_add_fwnode_remote()
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220321145134.29820-1-laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djPc7rMOTrJBtO2CFncfd7CaLHt9G9W
        i4lNd1gsOicuYbfo2bCV1WLG+X1MFsen9bFaHH7TzmpxZv9KNgdOj9kdM1k9Dn9dyOLx/8Yj
        Zo/nl7+zefRtWcXo8XmTXABbFJdNSmpOZllqkb5dAlfGiQ9SBWt4K25M+sbewNjL3cXIySEh
        YCLxZtM2NhBbSGAFo8S54xxdjFxA9hdGidNrZ7NBOJ8ZJdZ/nAvkcIB1bHzMDRFfzigx6+9E
        ZgjnI6PEtfMrwUbxCthJXP51iRnEZhFQlfg04RI7RFxQ4uTMJywgtqhAssSsY8cYQWxhgTiJ
        x907wGqYBcQlbj2ZzwQyVERgEtCGk21QiQ1MEutux4PYbAKGEl1vu8CWcQq4S0w/d58NokZe
        onnrbGaI335wSJzemgdhu0g0PJzLBmELS7w6voUdwpaROD25hwVkmYRAO6PEgt/3mSCcCYwS
        Dc9vMUJUWUvcOfcL7H9mAU2J9bv0IcKOEruXnGGFBAufxI23ghA38ElM2jadGSLMK9HRJgRR
        rSYx6/g6uLUHL1xinsCoNAspWGYheX8Wkm9mIexdwMiyilE8tbQ4Nz212DgvtVyvODG3uDQv
        XS85P3cTIzA9nf53/OsOxhWvPuodYmTiYDzEKMHBrCTCO/uOZrIQb0piZVVqUX58UWlOavEh
        RmkOFiVxXrYZWslCAumJJanZqakFqUUwWSYOTqkGpvjvIWv9CmJ+uSZM3yE1bdFx4fSJ/VMd
        uZ6tWt5yf+ZCvXdSDybUR/gpvYquYH7F+a3SdnXFvuyr5ycvOfZip0Zm+qLinveSSVb1q1de
        mP/V1vO74turfVNtPZXXuZzQE/xUVvg2eMnu5pRLfenzWk5sX8LNbbhzhqXFx2l28Qc4GWfv
        u/ee+aFI/cNzBQf+tAXXyf5SXmpwd1H8vYnrd1xZ/H7XpffzruT6Hd0ZM3vJY3bJWrbjZ+4p
        mOWv3/d6s5NjGOO6PX2F/0o2rDppppt/9MKNFOt1qefTSiMXJzk4lFfvkHvy5/vM6557fH++
        T+NWVdFKEGu98P9e6XP7DftkmrvYztkZmHGwX9lxiz9DiaU4I9FQi7moOBEAAf4OW74DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRmVeSWpSXmKPExsVy+t/xe7pMOTrJBr2z9SzuPm9htNh2+jer
        xcSmOywWnROXsFv0bNjKajHj/D4mi+PT+lgtDr9pZ7U4s38lmwOnx+yOmaweh78uZPH4f+MR
        s8fzy9/ZPPq2rGL0+LxJLoAtSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ
        384mJTUnsyy1SN8uQS/jxAepgjW8FTcmfWNvYOzl7mLk4JAQMJHY+BjI5OQQEljKKHH+bhmI
        LSEgI3FyWgMrhC0s8edaF1sXIxdQzXtGiR/9TSwgCV4BO4nLvy4xg9gsAqoSnyZcYoeIC0qc
        nPkErEZUIFliScN9sEHCAnESj7t3gNUwC4hL3HoynwlkqIjAJEaJb+37WUAcZoENTBJfd51n
        hTjJTWLWmkVgk9gEDCW63oKcwcnBKeAuMf3cfTaISWYSXVu7GCFseYnmrbOZJzAKzUJyyCwk
        C2chaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwIjcduznlh2MK1991DvEyMTB
        eIhRgoNZSYR39h3NZCHelMTKqtSi/Pii0pzU4kOMpsDQmMgsJZqcD0wJeSXxhmYGpoYmZpYG
        ppZmxkrivJ4FHYlCAumJJanZqakFqUUwfUwcnFINTFuLfi6drRr4+9r/iV//nd/au7Pis8Cq
        rJuMBwQXrz6k9PXAmpf3XVfa5XbVaJ7/8W7C1ujA7ONFbJ3hc69fOD5DXKzo+AaLGJPJ4s/s
        Jhlus+Y6srnln/SBtuaMRbLfb66e/yY0xOewyfV1vMpW/56++HnofQCzwSdJ9ysbhNYXSQnu
        eDKz/sDM1de1GbNqIqS3crnrn14V8PWKJPO0grBTub1Ho9/Jc2QeW+kyxWX2LNZdrAdsuPaE
        WXJ4dgRv2ZPSyLcj89HjWa2F/A2s+d/kt/4oF9U8xFy67+d6meZlkY3zrT68TLpzrDvJUvb/
        0wwZ/9CS+uULvtQtv9XUOf1QaMa2mdEd6wKnnmJ4+366EktxRqKhFnNRcSIA85EmmlEDAAA=
X-CMS-MailID: 20220922140658eucas1p29f9d609e795ed064e51694c0e7be80d3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220922140658eucas1p29f9d609e795ed064e51694c0e7be80d3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220922140658eucas1p29f9d609e795ed064e51694c0e7be80d3
References: <20220321145134.29820-1-laurent.pinchart@ideasonboard.com>
        <CGME20220922140658eucas1p29f9d609e795ed064e51694c0e7be80d3@eucas1p2.samsung.com>
X-Spam-Status: No, score=-9.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 21.03.2022 15:51, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Matching on device fwnode handles is deprecated in favour of endpoint
> fwnode handles. Switch the __v4l2_async_nf_add_fwnode_remote() function
> to use the latter. The match code handles backward compatibility by
> falling by to the device fwnode handle, so this shouldn't introduce any
> regression.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I love the last sentence of the patch description. :)

Unfortunately, recently I found that this patch breaks Exynos4 IS (FIMC) 
driver operation on Trats2 board (exynos4412-trats2.dts). After merging 
this patch I see the following errors related to the camera sensors:

[   16.038705] S5C73M3: S5C73M3 SPI probed successfully
[   16.097399] S5C73M3: Sensor type: CML0801-M017, FW version: GDFD01
[   16.106842] S5C73M3 0-003c: Consider updating driver S5C73M3 to match 
on endpoints
[   16.298323] S5C73M3: probe of 0-003c failed with error -22
[   16.343173] S5K6A3 15-0010: Consider updating driver S5K6A3 to match 
on endpoints
[   16.434968] S5K6A3: probe of 15-0010 failed with error -22

I'm a bit puzzled, because I don't see anything related to endpoint 
matching in the sensor drivers. Instead I only found that 
v4l2_async_nf_add_fwnode_remote() function (which is modified by this 
patch) is called from the 
drivers/media/platform/samsung/exynos4-is/media-dev.c code. Do you have 
any idea what is broken after this change? Could you help fixing this issue?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

