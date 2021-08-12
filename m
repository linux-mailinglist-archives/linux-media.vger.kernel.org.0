Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F913E9F8B
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 09:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234829AbhHLHlF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 03:41:05 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30883 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234835AbhHLHlC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 03:41:02 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210812074035euoutp01232f38091ed5ca62d80e768a4e11b1b3~afyqHfppN1528815288euoutp01X
        for <linux-media@vger.kernel.org>; Thu, 12 Aug 2021 07:40:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210812074035euoutp01232f38091ed5ca62d80e768a4e11b1b3~afyqHfppN1528815288euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1628754035;
        bh=fVknA03gNmeAJpmTPams6tLJ6o3sYX2Td79X/9jTxZs=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ZfzM4y5eiDx9pNN+RAavirc7No4b0uJ46VhPWprKml04tJya7PDCsVu6gIZKu6KoP
         sVM4asGoGx+zCFQMz6Yx0XElLewUmi4UISvmPKyFMgl1rSmX8uXXgHrJQXBgdU8Lw0
         LSfLODPxXHuagrRhrAvewzsQKQp+NbV4YSAQePBM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210812074035eucas1p12b447b59def0ce7f422d6583cc3cd702~afypsCcWt2921529215eucas1p1a;
        Thu, 12 Aug 2021 07:40:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id A4.6E.56448.370D4116; Thu, 12
        Aug 2021 08:40:35 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210812074034eucas1p14c128074be6bd68e745f780d4d8c2d06~afypC3yGL3125031250eucas1p1d;
        Thu, 12 Aug 2021 07:40:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210812074034eusmtrp2d35ec58eaa0efa07eb5ed3c5d0f589f7~afypCHpSJ1159111591eusmtrp2H;
        Thu, 12 Aug 2021 07:40:34 +0000 (GMT)
X-AuditID: cbfec7f5-d3bff7000002dc80-f3-6114d0732860
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 90.2A.20981.270D4116; Thu, 12
        Aug 2021 08:40:34 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210812074033eusmtip1b7915168387c51bc70a9a72e6a1edbf2~afyoN3v7-2365123651eusmtip1k;
        Thu, 12 Aug 2021 07:40:33 +0000 (GMT)
Subject: Re: [PATCH v1] media: camss: vfe: Don't use vfe->base before it's
 assigned
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Kernel Functional Testing <lkft@linaro.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <de1df486-255f-6405-5ea9-4dddd5507006@samsung.com>
Date:   Thu, 12 Aug 2021 09:40:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFytOQQBnnJQU9qDdQedrrcPz=SQPeXHX1HJQ8c5U94feCg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKKsWRmVeSWpSXmKPExsWy7djPc7rFF0QSDY5eEbc49/g3i8Xp/e9Y
        LC7OvMticWryMyaLifvPsltc3jWHzaJnw1ZWi68HuCyWbfrDZHHrE7/Fp1kPmS0OTZnG5sDj
        sXPWXXaPTas62TzuXNvD5vF5k5zHqa+f2QNYo7hsUlJzMstSi/TtErgydk1ZxFqwWbTiYutN
        pgbG84JdjJwcEgImEv1nDzN2MXJxCAmsYJRYvOwzC4TzhVHi85nrTBDOZ0aJDb3zWGBazn9/
        ygyRWM4oMalvAZTzkVHi8rPrjCBVwgKhEjcWTWIHsUUENCSOP34EtoRZ4DKzxPpt61lBEmwC
        hhJdb7vYuhg5OHgF7CQ+7QULswioStw42Q9miwokS0x8MgnM5hUQlDg58wnYFZwCgRJ3Lm0B
        28UsIC+x/e0cZghbXOLWk/lgZ0sINHNKPOndxw5xtovEhDOzWCFsYYlXx7dAxWUk/u+Ea2CU
        eHhuLTuE0wP0TtMMRogqa4k7536BXcosoCmxfpc+iCkh4Chx66ochMknceOtIMQNfBKTtk1n
        hgjzSnS0CUHMUJOYdXwd3NaDFy4xT2BUmoXks1lIvpmF5JtZCGsXMLKsYhRPLS3OTU8tNs5L
        LdcrTswtLs1L10vOz93ECExZp/8d/7qDccWrj3qHGJk4GA8xSnAwK4nw7pQTShTiTUmsrEot
        yo8vKs1JLT7EKM3BoiTOu2vrmnghgfTEktTs1NSC1CKYLBMHp1QDk+iZWUcdBQvrlzh/nKXG
        czJnuepjLu2PE7Q/6x/puvh1us+jqggpi/sPuSe0Lv1rk+n558IpY5/2oBsBJWXhvx4p3Jl4
        /9c1lif/kgJMu3a6cFR0Rb5aN3fb9Mk/jboyNZeom8psC1uguOyhj8Dq/BUe+94ERAR90Dp0
        ZM9hnz2J/9o2pU34LP8zb7qV+CwuptKzdQyub69nproGXVL7+0o/Puxg066e2coz7nod51wj
        8zb1L59P02rOq3deHny1sPHLi1kacqlHHdf2FUr+n2IW/XQ320c5/jUnVSwkS/7tPqWe8t33
        TkmE8noBL+ltFn/iat7Wiq84cujyh2ksOVVZVWwH5H3eiW76GuaTlK/EUpyRaKjFXFScCAAz
        Am9hyAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsVy+t/xu7pFF0QSDR6sULU49/g3i8Xp/e9Y
        LC7OvMticWryMyaLifvPsltc3jWHzaJnw1ZWi68HuCyWbfrDZHHrE7/Fp1kPmS0OTZnG5sDj
        sXPWXXaPTas62TzuXNvD5vF5k5zHqa+f2QNYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws
        9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQydk1ZxFqwWbTiYutNpgbG84JdjJwcEgImEue/P2Xu
        YuTiEBJYyiixfNtkJoiEjMTJaQ2sELawxJ9rXWwQRe8ZJf7/e8oGkhAWCJW4sWgSO4gtIqAh
        cfzxI0aQImaB68wSDcsboMZeZpJY97IfrIpNwFCi6y3IKA4OXgE7iU97wTawCKhK3DjZD2aL
        CiRLfDi9FMzmFRCUODnzCQuIzSkQKHHn0hZGEJtZwExi3uaHzBC2vMT2t3OgbHGJW0/mM01g
        FJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzBKtx37uWUH48pX
        H/UOMTJxMB5ilOBgVhLh3SknlCjEm5JYWZValB9fVJqTWnyI0RTon4nMUqLJ+cA0kVcSb2hm
        YGpoYmZpYGppZqwkzmtyZE28kEB6YklqdmpqQWoRTB8TB6dUA5P+u+pFlZ0bzr/etza1b/28
        l8wRyWH/fWdMvnfYVcj217pXReFvOeovM9y0zZyYUbUodmqnU3B8u00zMGm0371dsKzqz9Kv
        HzmeRqpGGXz9Y3KVY96ao1aad1/G6tX+Cpyw5xB3s89B3c3fn9dJVbeLRoqmpX6ZplmY07kq
        6O3civjFOwwmZs+b/iVwnmiAEo/XjemXNtUK9WwNY/pnf85k4n/VzYpcN74q8h00Mqxf0rbx
        2tOFbTkRZddnbJVminQ5MJeJ8/i/ut1rNlhV5vHM056q7v9/+i173lyJFwGB3l6LTr0RMLL+
        Z3pZ2urA3PXJl7dufuqm6nLXj3XW/vDIi3ZveTrmC78OPzPnSbUSS3FGoqEWc1FxIgAVokWA
        WwMAAA==
X-CMS-MailID: 20210812074034eucas1p14c128074be6bd68e745f780d4d8c2d06
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210811074838eucas1p2a0e8625af27c10209d9bcfc732254ae7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210811074838eucas1p2a0e8625af27c10209d9bcfc732254ae7
References: <CGME20210811074838eucas1p2a0e8625af27c10209d9bcfc732254ae7@eucas1p2.samsung.com>
        <20210810103336.114077-1-robert.foss@linaro.org>
        <0b694e24-5cc8-4944-d3a2-115306ae7b89@samsung.com>
        <CAG3jFys+ch86Y7338-DH1+8Q4w5eK83revVsNwoVCugwXeqjmQ@mail.gmail.com>
        <CAG3jFytOQQBnnJQU9qDdQedrrcPz=SQPeXHX1HJQ8c5U94feCg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On 11.08.2021 15:42, Robert Foss wrote:
> On Wed, 11 Aug 2021 at 11:41, Robert Foss <robert.foss@linaro.org> wrote:
>> Hey Marek,
>>
>> Thanks for testing this.
>>
>> On Wed, 11 Aug 2021 at 09:48, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>> On 10.08.2021 12:33, Robert Foss wrote:
>>>> vfe->ops->hw_version(vfe) being called before vfe->base has been assigned
>>>> is incorrect and causes crashes.
>>>>
>>>> Fixes: b10b5334528a9 ("media: camss: vfe: Don't read hardware version needlessly")
>>>>
>>>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>>> Signed-off-by: Robert Foss <robert.foss@linaro.org>
>>> With this patch applied on top of linux next-20210810 instead of the
>>> NULL pointer dereference I get following error on DragonBoard410c while
>>> loading kernel modules:
>>>
>>> [   18.480608] qcom-venus 1d00000.video-codec: Adding to iommu group 1
>>> [   18.536167] qcom-camss 1b0ac00.camss: Adding to iommu group 2
>>> [   18.600373] Internal error: synchronous external abort: 96000010 [#1]
>>> PREEMPT SMP
> After testing this patch + linux-next[1] I'm not able to replicate the
> 'Internal error' above on the db410c. And I don't think it is related
> to this patch.
>
> Are you seeing the same error on [1]? And are you seeing it before the
> b10b5334528a9 ("media: camss: vfe: Don't read hardware version
> needlessly") patch?

I've checked once again on your branch. Yes, it is fully reproducible on 
my DragonBoard410c. On your branch I get the above synchronous external 
abort, while without your last patch I get Null ptr dereference.

Are you sure you have deployed the kernel modules for doing the test? 
This issue happens when udev triggers loading kernel modules for the 
detected hardware.

Here is the kernel configuration used for my tests on ARM64 based board:

# make ARCH=arm64 defconfig && ./scripts/config --set-val 
CMA_SIZE_MBYTES 96 -e PROVE_LOCKING -e DEBUG_ATOMIC_SLEEP -e PM_DEBUG -e 
PM_ADVANCED_DEBUG -d ARCH_SUNXI -d ARCH_ALPINE -d DRM_NOUVEAU -d 
ARCH_BCM_IPROC -d ARCH_BERLIN -d ARCH_BRCMSTB -d ARCH_LAYERSCAPE -d 
ARCH_LG1K -d ARCH_HISI -d ARCH_MEDIATEK -d ARCH_MVEBU -d ARCH_ROCKCHIP 
-d ARCH_SEATTLE -d ARCH_SYNQUACER -d ARCH_RENESAS -d ARCH_STRATIX10 -d 
ARCH_TEGRA -d ARCH_SPRD -d ARCH_THUNDER -d ARCH_THUNDER2 -d 
ARCH_UNIPHIER -d ARCH_XGENE -d ARCH_ZX -d ARCH_ZYNQMP -d HIBERNATION -d 
CLK_SUNXI -e BLK_DEV_RAM --set-val BLK_DEV_RAM_COUNT 4 --set-val 
BLK_DEV_RAM_SIZE 65536 -d CONFIG_EFI -d CONFIG_TEE

Comparing to the arm64's defconfig, I've enabled some debugging options 
and disabled some unused boards.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

