Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88FC55E771B
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 11:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbiIWJ2y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Sep 2022 05:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbiIWJ2A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Sep 2022 05:28:00 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30CD9EE676
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 02:27:46 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20220923092739euoutp01f3af0534f9d1192ef393a77de91d6414~XczUaAk4Z0777707777euoutp01s
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 09:27:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20220923092739euoutp01f3af0534f9d1192ef393a77de91d6414~XczUaAk4Z0777707777euoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1663925259;
        bh=82EQ6GPHeu6LPnChCSOgTByDLw/uWQknxhbPMUSanbg=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=jB7tzzG0yVBNYUEN4O2P0F7WE5kbbL1j2XjwVHxC/szWVAZwgwcyhDMehXgVPXEgf
         LEVLFavbb9fmYMwkddnpy66sOWbAN4YaZFdC3QVmh85FS3B5CicyXmgkSFeAkrU1nZ
         xl14ZE7gJzcoCJOJr10JB9TPP/Of6A4E0LPvYxS0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220923092738eucas1p1b16a992ec7a180343730c91c2d2783bd~XczT9cakd2061520615eucas1p1V;
        Fri, 23 Sep 2022 09:27:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id AB.7D.29727.A0C7D236; Fri, 23
        Sep 2022 10:27:38 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220923092738eucas1p2941e4f4018d2060859e276faeb660e86~XczTeAvKt1248612486eucas1p2J;
        Fri, 23 Sep 2022 09:27:38 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220923092738eusmtrp2893d1c72242e2a7fe9ab2a1e3e69e8fa~XczTdSESj1401814018eusmtrp2G;
        Fri, 23 Sep 2022 09:27:38 +0000 (GMT)
X-AuditID: cbfec7f2-205ff7000001741f-54-632d7c0a193c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 80.2D.07473.A0C7D236; Fri, 23
        Sep 2022 10:27:38 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220923092737eusmtip149fd76318d9722f218ab08479476898b~XczS18eqX0481904819eusmtip1h;
        Fri, 23 Sep 2022 09:27:37 +0000 (GMT)
Message-ID: <bb0400d3-0018-0d2f-6631-127effc2e380@samsung.com>
Date:   Fri, 23 Sep 2022 11:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] media: v4l2-async: Use endpoints in
 __v4l2_async_nf_add_fwnode_remote()
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <5764c9f8-c335-9c73-07fb-f44def8a0be8@gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djP87pcNbrJBgcvqVlsO/yO1eLu8xZG
        i22nf7NaTGy6w2LROXEJu0XPhq2sFjPO72OyOD6tj9Xi8Jt2Vosz+1eyOXB57Jx1l91jdsdM
        Vo/DXxeyePy/8YjZ4/nl72wefVtWMXp83iQXwB7FZZOSmpNZllqkb5fAlfHrpEJBg0LFluaV
        LA2M86W6GDk5JARMJO6938PcxcjFISSwglFizcSbLBDOF0aJ7ttboZzPjBIzn/9gh2n5vWop
        O0RiOaNEy7TLrBDOR0aJA08vsoFU8QrYSdy61w5mswioSrRuesYIEReUODnzCQuILSqQLDHr
        2DGwuLBAnMTj7h1gG5gFxCVuPZnP1MXIwSEi4C3xbmImyHxmgTnMEoffTALrZRMwlOh62wU2
        n1PAVmLh/EOMEL3yEs1bZ4M9JCHQzikx9cgjqLNdJObMPcYEYQtLvDq+BSouI/F/J8gysAZG
        iQW/70M5ExglGp7fYoSospa4c+4XG8hJzAKaEut36UOEHSV2LznDChKWEOCTuPFWEOIIPolJ
        26YzQ4R5JTrahCCq1SRmHV8Ht/bghUvMExiVZiEFyywk789C8s4shL0LGFlWMYqnlhbnpqcW
        G+allusVJ+YWl+al6yXn525iBKat0/+Of9rBOPfVR71DjEwcjIcYJTiYlUR4Z9/RTBbiTUms
        rEotyo8vKs1JLT7EKM3BoiTOyzZDK1lIID2xJDU7NbUgtQgmy8TBKdXAFLT63JU/J4v/ym7+
        fPHP1STN3aZ7l3x+f2b+6hQJub+1vyUkGLL+nPh2T+ncvuer525Ym73wdw6/lNVHjakH60WC
        tosp3JL4X6Rh9EfxzuZ1mWqG2hsrklkcHX5P8jl/pHLb5tIvv9jUmlJPKwldn9mXkV0kl7G8
        e9rR3oWc33M61B3v+rWtZFA8r6Xd8Wffqvrk6ieV9gs/a4mdfrmieLrY+RtaNXcFv6mtT9Xf
        LFC2coNd97rXrtKXZ1zVuGY1P4vh1+dri6TE106LXay+duUca9ZJq2bdMwg5cnr/poWnNaxu
        exTtu7Xr8JqS+LUW/lyGCbxLDr8V+H73TWvzv+5jX942HUxgZHNbFu+f3TVNiaU4I9FQi7mo
        OBEAE4V8E8oDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsVy+t/xu7pcNbrJBpNXcFpsO/yO1eLu8xZG
        i22nf7NaTGy6w2LROXEJu0XPhq2sFjPO72OyOD6tj9Xi8Jt2Vosz+1eyOXB57Jx1l91jdsdM
        Vo/DXxeyePy/8YjZ4/nl72wefVtWMXp83iQXwB6lZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdk
        YqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl/HrpEJBg0LFluaVLA2M86W6GDk5JARMJH6vWsre
        xcjFISSwlFHix5vp7BAJGYmT0xpYIWxhiT/Xutggit4zSkxt2c8IkuAVsJO4da+dDcRmEVCV
        aN30DCouKHFy5hMWEFtUIFliScN9sEHCAnESj7t3gC1gFhCXuPVkPlMXIweHiIC3xLuJmSDz
        mQXmMUtcnX2REWLZOiaJp2f7wZrZBAwlut52gS3jFLCVWDj/ECPEIDOJrq1dULa8RPPW2cwT
        GIVmIbljFpJ9s5C0zELSsoCRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgnG479nPzDsZ5
        rz7qHWJk4mA8xCjBwawkwjv7jmayEG9KYmVValF+fFFpTmrxIUZTYGBMZJYSTc4HJoq8knhD
        MwNTQxMzSwNTSzNjJXFez4KORCGB9MSS1OzU1ILUIpg+Jg5OqQYmq4m9IY9OfLZKL36gwL1h
        e9Dpre67rhU63eXY+jlXauu5F4uXiea72P+b05T6/enKCbsW1BR7PeKQ3Oj6gWnmpNkbFVY7
        PsuReHzhr2Ok1NJmobsHbU1KnuyZ0Cm26NLj5Nx2pfmbQq69C2ku/fJl+71Cq9c7/9y+eUjK
        IfHdvqT2mf9XWn79wvBEqNZYPPrxp7v3Dj5uqtHWUhf5f2f2ocNipcs/vZJfl3Dl435ll08u
        U+97rvp7qctrCjc3Q3PWlGuHXlzjaXe8xcZ1TX2/Z6VvSpD+xsfujHbHNlzSm2F4qPRpsESh
        /QVvdaEVqsnv2p+9Mvy77vK9nWvfTTV42qVZyOZ06HCu9cen3q/FvP4rsRRnJBpqMRcVJwIA
        gg7FsVwDAAA=
X-CMS-MailID: 20220923092738eucas1p2941e4f4018d2060859e276faeb660e86
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220922140658eucas1p29f9d609e795ed064e51694c0e7be80d3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220922140658eucas1p29f9d609e795ed064e51694c0e7be80d3
References: <20220321145134.29820-1-laurent.pinchart@ideasonboard.com>
        <CGME20220922140658eucas1p29f9d609e795ed064e51694c0e7be80d3@eucas1p2.samsung.com>
        <083edac1-8a8f-d842-e496-b657b4e4014e@samsung.com>
        <YyzmPWQ7vtigUxBI@valkosipuli.retiisi.eu>
        <5764c9f8-c335-9c73-07fb-f44def8a0be8@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On 23.09.2022 01:19, Daniel Scally wrote:
> On 22/09/2022 23:48, Sakari Ailus wrote:
>> Good to hear from you! And it's so nice you're testing the Samsung 
>> Exynos
>> drivers! :-)
>>
>> On Thu, Sep 22, 2022 at 04:06:58PM +0200, Marek Szyprowski wrote:
>>> On 21.03.2022 15:51, Laurent Pinchart wrote:
>>>> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>>
>>>> Matching on device fwnode handles is deprecated in favour of endpoint
>>>> fwnode handles. Switch the __v4l2_async_nf_add_fwnode_remote() 
>>>> function
>>>> to use the latter. The match code handles backward compatibility by
>>>> falling by to the device fwnode handle, so this shouldn't introduce 
>>>> any
>>>> regression.
>>>>
>>>> Signed-off-by: Laurent Pinchart 
>>>> <laurent.pinchart+renesas@ideasonboard.com>
>>> I love the last sentence of the patch description. :)
>>>
>>> Unfortunately, recently I found that this patch breaks Exynos4 IS 
>>> (FIMC)
>>> driver operation on Trats2 board (exynos4412-trats2.dts). After merging
>>> this patch I see the following errors related to the camera sensors:
>>>
>>> [   16.038705] S5C73M3: S5C73M3 SPI probed successfully
>>> [   16.097399] S5C73M3: Sensor type: CML0801-M017, FW version: GDFD01
>>> [   16.106842] S5C73M3 0-003c: Consider updating driver S5C73M3 to 
>>> match
>>> on endpoints
>>> [   16.298323] S5C73M3: probe of 0-003c failed with error -22
>>> [   16.343173] S5K6A3 15-0010: Consider updating driver S5K6A3 to match
>>> on endpoints
>>> [   16.434968] S5K6A3: probe of 15-0010 failed with error -22
>> Have you checked what exactly caused the probe to fail? Laurent's patch
>> changes how matching works but if that fails, the result should be a 
>> bunch
>> of waiting async sub-devices and notifier(s), not a failure on probe.
>
>
> Might be some other effects too...I can't test it but in 
> subdev_notifier_bound() in 
> drivers/media/platform/samsung/exynos4-is/media-dev.c there's the 
> following check:
>
>
>     /* Find platform data for this sensor subdev */
>     for (i = 0; i < ARRAY_SIZE(fmd->sensor); i++)
>         if (fmd->sensor[i].asd &&
>             fmd->sensor[i].asd->match.fwnode ==
>             of_fwnode_handle(subdev->dev->of_node))
>             si = &fmd->sensor[i];
>
>     if (si == NULL)
>         return -EINVAL;
>
>
> And I think following that patch of Laurent's asd->match.fwnode will 
> never be the dev->of_node anymore, because it's now the endpoint 
> that's assigned as asd->match.fwnode rather than that of the device. 
> That will return -EINVAL for the notifier's .bound() callback...I'm 
> not sure if that would cause the whole probe to fail, but thought it 
> might be worth mentioning :)

Good catch, thanks!

I have no idea why that loop compared the asd->match.fwnode and 
subdev->dev->of_node, maybe it some kind of historical left-over or 
cargo-cult. The asd pointer is already available there and can be used 
to find the proper sensor. This loop works both with the new and old 
version:

         /* Find platform data for this sensor subdev */
         for (i = 0; i < ARRAY_SIZE(fmd->sensor); i++)
                 if (fmd->sensor[i].asd == asd)
                         si = &fmd->sensor[i];

I will prepare a patch in a few minutes.

>>> I'm a bit puzzled, because I don't see anything related to endpoint
>>> matching in the sensor drivers. Instead I only found that
>>> v4l2_async_nf_add_fwnode_remote() function (which is modified by this
>>> patch) is called from the
>>> drivers/media/platform/samsung/exynos4-is/media-dev.c code. Do you have
>>> any idea what is broken after this change? Could you help fixing 
>>> this issue?
>> You can assign the endpoint node to subdev->fwnode instead of the device
>> fwnode. No regular sensor driver appears to be doing that though.
>>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

