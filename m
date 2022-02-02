Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10CF54A7B74
	for <lists+linux-media@lfdr.de>; Thu,  3 Feb 2022 00:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347999AbiBBXGf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 18:06:35 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:21550 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238854AbiBBXGd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 18:06:33 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20220202230631euoutp0230542b0c31ed04e9c440d9186873cae6~QGqxtLzH_3186731867euoutp02S
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 23:06:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20220202230631euoutp0230542b0c31ed04e9c440d9186873cae6~QGqxtLzH_3186731867euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1643843191;
        bh=oI6rA4dWwd/CR2IxUjBGN/DOwLIbzh3/ZIZp+dIPzMU=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=C4JYXpQmrAAn1hYow1+HsGQhjP7cWnrmMzvvvlPEQb1qFmEHoaZtGS8fqTJ9JK8Zb
         DT9+H5VcDcWiMiiT88vpYzolMScNbhcSDWVyABU2fIY3XN4DHIu4WcsZqawRY+avka
         UInC2EEwPBa2JuU5mVYDnfXqERHM0BesTZjjG6Vk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220202230631eucas1p1b7c5f38441aeb5400a8e027e086e7bc8~QGqxYlEGh2765427654eucas1p1g;
        Wed,  2 Feb 2022 23:06:31 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 80.17.09887.77E0BF16; Wed,  2
        Feb 2022 23:06:31 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220202230630eucas1p26dac8edc8ee041c7b19eb6d4fc77798c~QGqwBleqH1639116391eucas1p23;
        Wed,  2 Feb 2022 23:06:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220202230630eusmtrp13a21c892cbe8cb79ff4946c0b23fb2b5~QGqwA2Lbq1254812548eusmtrp1M;
        Wed,  2 Feb 2022 23:06:30 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-a7-61fb0e773215
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id B3.3F.09404.57E0BF16; Wed,  2
        Feb 2022 23:06:29 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220202230629eusmtip2785025a18fcb9826c752c75d51023ebd~QGqvb-35i1591715917eusmtip2I;
        Wed,  2 Feb 2022 23:06:29 +0000 (GMT)
Message-ID: <dbdcba1a-3913-49e1-660c-784f450acd66@samsung.com>
Date:   Thu, 3 Feb 2022 00:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v2 0/4] Exynos4 media drivers: adapt for the planned ARM
 IOMMU-DMA changes
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <aed1f16a-4b28-8da9-728a-3151a75b1f5f@xs4all.nl>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsWy7djPc7rlfL8TDV6tELE4NfkZk8X58xvY
        LXo2bGW1mHF+H5PFsk1/mCwOfnjCatH+9CWzxefWf2wOHB5r5q1h9JjdcJHFY9OqTjaPz5vk
        PE59/cwewBrFZZOSmpNZllqkb5fAlXFh3nXmgm+sFXt2dbM1MF5h6WLk5JAQMJH4ueARexcj
        F4eQwApGiakbl7FAOF8YJSZ+3soI4XxmlNiw/hITTEvX6maoxHJGiV9Hb7BCOB8ZJToOLgHq
        5+DgFbCTuDNRGqSBRUBFYvvHFrBmXgFBiZMzn4DtFhVIkrjcc5wRxBYWSJC4POkBmM0sIC5x
        68l8sHoRgXSJE90HoeLNTBJv/4LF2QQMJbredrGB2JwCthL3O1YxQ9TIS2x/O4cZ4tAvHBIr
        FphD2C4SU3a8g/pZWOLV8S3sELaMxOnJPWAvSwg0M0o8PLeWHcLpYZS43DSDEaLKWuLOuV9s
        II8xC2hKrN+lDxF2lJh07SjYvxICfBI33gpC3MAnMWnbdGaIMK9ER5sQRLWaxKzj6+DWHrxw
        iXkCo9IspFCZheT7WUi+mYWwdwEjyypG8dTS4tz01GKjvNRyveLE3OLSvHS95PzcTYzAZHT6
        3/EvOxiXv/qod4iRiYPxEKMEB7OSCO/ehd8ThXhTEiurUovy44tKc1KLDzFKc7AoifMmZ25I
        FBJITyxJzU5NLUgtgskycXBKNTCtlKmrTX7hwGB55+K3/hMXeo888ZTzfy1UcWinhW+hbKmx
        xt2r4uEyPHrtd542zrlm3Lughis659QR5+WPFixdq2m5I7ZKrmf6Dt/r4tw/JebMC/7g4PHj
        7R73NPXzwuf+RHTlnYmV+ObuY1VybsbHuznX6vKCHXO/VYblLPOY+uXXxrqmHS1eG9+4fr25
        v5dZx85JQe6apHSi3Uaen9+KZ71b8ubb8StbX9oq7VW+d7ti++NUi+vbOjbvaBf08tY6pc60
        Q/NMRMvvTapBKYFPLzkvXRVbre596mlTIkeRkEug2f3t69wXrd27IvqFwPEb+24+tb7xefoz
        qX5Oy91B0WE8/J5SnClBO5bWmiYpsRRnJBpqMRcVJwIAfZwc/rUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsVy+t/xe7qlfL8TDS6uNrfYOGM9q8Wpyc+Y
        LM6f38Bu0bNhK6vFjPP7mCyWbfrDZHHwwxNWi/anL5ktPrf+Y3Pg9Fgzbw2jx+yGiywem1Z1
        snn0bVnF6PF5k5zHqa+f2QPYovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV
        9O1sUlJzMstSi/TtEvQyLsy7zlzwjbViz65utgbGKyxdjJwcEgImEl2rmxm7GLk4hASWMkps
        2/yPCSIhI3FyWgMrhC0s8edaFxtE0XtGicm7FwN1c3DwCthJ3JkoDVLDIqAisf1jC1gvr4Cg
        xMmZT8AWiAokSTxc/I4NxBYWSJC4POkBI4jNLCAucevJfLB6EYF0iVmP9oEdwSzQzCQxp+cv
        O8SyI4wSSxoug01iEzCU6HrbBTaJU8BW4n7HKmaISWYSXVu7oKbKS2x/O4d5AqPQLCSHzEKy
        cBaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjMptx35u2cG48tVHvUOMTByM
        hxglOJiVRHj3LvyeKMSbklhZlVqUH19UmpNafIjRFBgaE5mlRJPzgWkhryTe0MzA1NDEzNLA
        1NLMWEmc17OgI1FIID2xJDU7NbUgtQimj4mDU6qBafqr1ZuOhV9WiZp3afqBvz8dfZ+eWHLM
        e/2nh3Eq5xrnv/YUbxE+w2lVG3bRcG/mVrHki/1KQeZfvK9N9qpgu6y/q0g8cKrz7MLlkd02
        GquU3sk90GaJ032585Dft+BIrrbpMaWXmissHIt2fuHyMz/q8OW+tNOFqpQDSgkm4tVZIhGH
        7l7403l+vpb7+5m+/x+Hfr/PwNPEke/0kv0TY+9Ftu1LVjTvnVYhb+9iuO/d4hWxKiL/stz0
        rziLKOdXs8vtWqckxLgzK7e3zjfz1lMe08MrH6k6n3CQ/Zj+o3Tu25xTEuYxa7IDbO7L24ic
        OljWn7a67EvcFcUfcXu266T/OuH9QzzXiqtB+jGfEktxRqKhFnNRcSIA6EDhtVMDAAA=
X-CMS-MailID: 20220202230630eucas1p26dac8edc8ee041c7b19eb6d4fc77798c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200918144852eucas1p2cd6ec1d5fb76d5c472a7ff966e0c3e8e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200918144852eucas1p2cd6ec1d5fb76d5c472a7ff966e0c3e8e
References: <CGME20200918144852eucas1p2cd6ec1d5fb76d5c472a7ff966e0c3e8e@eucas1p2.samsung.com>
        <20200918144833.14618-1-m.szyprowski@samsung.com>
        <aed1f16a-4b28-8da9-728a-3151a75b1f5f@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28.01.2022 11:07, Hans Verkuil wrote:
> Hi Marek,
>
> I'm going through a bunch of (very) old patches in my patchwork TODO list
> that for one reason or another I never processed. This series is one of them.
> Patch 1/4 has been accepted, but not the other three.
>
> Patches 2-4 still apply without problems, so is it OK if I apply them?
> Better late than never...

Well, there is no hurry ;) Patches which switch ARM 32bit architecture 
to DMA-IOMMU framework still didn't reach mainline, so this patchset is 
not really needed yet. I will check them soon (there have been some 
changes in the IOMMU framework last year) and resend also with some 
typos fixed.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

