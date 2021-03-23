Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D017345D2A
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 12:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbhCWLlA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 07:41:00 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:12518 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhCWLki (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 07:40:38 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210323114036euoutp019ef770142e42ee9a78429e769be9ed18~u9drDUwzR2291622916euoutp01I
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 11:40:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210323114036euoutp019ef770142e42ee9a78429e769be9ed18~u9drDUwzR2291622916euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1616499636;
        bh=OILxuddhThLhFt2/fm8ty5r+hMGLsywOmTLZ8ywVzY0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=d+stTIS/KjPvhLghQ9t1URDj+tI0yBkqerm7PIjZdFfHQU5Foa6DxCkJuyu6LDBwx
         XKrthtGx2vJhkMCnvch0MAV34CJsbnrZXnG83MUI6ffRo9aJNkhwiVIXGH2vMmfPSx
         7f4yT5Ym6U7ZgY/qBYukPudyAaaVooiyyyYjFk4M=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210323114035eucas1p11f0756915d8e160c491482cd533cefcd~u9dqornt10538705387eucas1p1v;
        Tue, 23 Mar 2021 11:40:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 02.FB.09452.3B3D9506; Tue, 23
        Mar 2021 11:40:35 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210323114035eucas1p1adc19d3dbcba23ec3059a6c06021c6a0~u9dqKDYjd0538705387eucas1p1u;
        Tue, 23 Mar 2021 11:40:35 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210323114035eusmtrp219dcd49770759fd14636544ac294f667~u9dqJGpac1477214772eusmtrp2L;
        Tue, 23 Mar 2021 11:40:35 +0000 (GMT)
X-AuditID: cbfec7f2-ab7ff700000024ec-01-6059d3b3e13b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id EA.56.08705.3B3D9506; Tue, 23
        Mar 2021 11:40:35 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210323114034eusmtip12a4ef6c7346e858341ad47a4a0db03ce~u9dpwZT5d1114211142eusmtip1Q;
        Tue, 23 Mar 2021 11:40:34 +0000 (GMT)
Subject: Re: Can you fix these exynos4-is kernel-doc warnings?
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <3d4f2d3b-a26b-dca3-800e-5a9be11f33e0@samsung.com>
Date:   Tue, 23 Mar 2021 12:40:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <03cbcdc6-01b9-339e-c95c-c184a59d1aed@xs4all.nl>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduznOd3NlyMTDE5f1bQ4NfkZk0XPhq2s
        FmuP3GW3+Nz6j82BxWN2w0UWj74tqxg9Pm+S8zj19TN7AEsUl01Kak5mWWqRvl0CV8bJ1RtZ
        CzayVHz8MZuxgXEDcxcjB4eEgInE5GPyXYxcHEICKxglnjT9ZoZwvjBKzLm3FMr5zCgxuWcq
        excjJ1jH3l0fGEFsIYHljBI39jhCFH1klNgxYwHYWGEBO4ntJytAakQEVCVe7/oFNohZoJtR
        4l3PHjaQBJuAoUTv0T6wQbxA9b0zrjCD2CxADfvbV7GBzBEVSJLYcCgWokRQ4uTMJywgNqeA
        rUTTyRtgNrOAuMStJ/OZIGx5ie1v54DtkhA4wiFx7EITM8TRLhJPz6xnhbCFJV4d3wL1jIzE
        /50gzSANzYwSPbtvs0M4Exgl7h9fwAhRZS1x59wvsIuYBTQl1u/Shwg7SsxZdxoajnwSN94K
        QhzBJzFp23SoMK9ER5sQRLWKxO9V05kgbCmJ7if/WSYwKs1C8tosJO/MQvLOLIS9CxhZVjGK
        p5YW56anFhvmpZbrFSfmFpfmpesl5+duYgQmltP/jn/awTj31Ue9Q4xMHIyHGCU4mJVEeFvC
        IxKEeFMSK6tSi/Lji0pzUosPMUpzsCiJ866avSZeSCA9sSQ1OzW1ILUIJsvEwSnVwBS60sX+
        aHD0VsUHT9vuVuie/xWXZRen/nuJ1/ZrLfN2CXrWH9CveHWyvTO/72nZlHv6qm8nXU5eG94c
        eTT367QXRabpVcsXb362bLX83gPmRh9Kmp49zS1d2TenMPHA7lgFuTaHr/33HR/o78yaeth7
        Ueljq/IyufDHtWv4Xr3k6OfyuLZpiZTQavs3TSG589Z8vO3x9vv684cucu2Ovnc8Y8lvhmeG
        cyeHSXRu7bqWkzcj8m5yDNPWhcuXxIX8Y650C/9542K66v6S845i+/WlWGa4dvH1Muhvc1mo
        UfL2yxp+rsD/iTKz2measB+9euKlp8P8uoSAN9XM/y4sPa9lq5cTtrRNRmPmcu6EW/pKLMUZ
        iYZazEXFiQC5zD34mwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDIsWRmVeSWpSXmKPExsVy+t/xu7qbL0cmGLzr5bI4NfkZk0XPhq2s
        FmuP3GW3+Nz6j82BxWN2w0UWj74tqxg9Pm+S8zj19TN7AEuUnk1RfmlJqkJGfnGJrVK0oYWR
        nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbJ1RtZCzayVHz8MZuxgXEDcxcjJ4eE
        gInE3l0fGLsYuTiEBJYySsz+cpmpi5EDKCElMb9FCaJGWOLPtS42iJr3jBIrH/aA1QgL2Els
        P1kBUiMioCrxetcvZpAaZoFuRoklpy+yQjRMYJS4820VO0gVm4ChRO/RPkYQmxeouXfGFbAr
        WIC697evYgOxRQWSJC4vmcgKUSMocXLmExYQm1PAVqLp5A0wm1lAXeLPvEvMELa4xK0n85kg
        bHmJ7W/nME9gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzCa
        th37uXkH47xXH/UOMTJxMB5ilOBgVhLhbQmPSBDiTUmsrEotyo8vKs1JLT7EaAr0z0RmKdHk
        fGA855XEG5oZmBqamFkamFqaGSuJ826duyZeSCA9sSQ1OzW1ILUIpo+Jg1Oqgalh4ssXre6s
        63geZLnOPnqzKfyTXv26D++aL7U2BYUdn/vVzX6yhmjB0w+ffBI0QnWauOY1vtBIc94Q9vuS
        hYff+yq5Njf5mVP275kfbvIqc6NhqrJ4ZtKuh//0jhW85RbwurK124T3TM9y7dUfrsw4Hu3w
        /5baz7/z2NZ2F4l2++R4hjorMfWG/HggcWCtWtTfZ1/WX+5ZaBD/QIr7+XIHoR82n6c03zP0
        WXLl81rzSwyxx0+etpX50G//c9f2xR9qCvim7/urIMNl77n+6ofzR68eVYhO7T/1ZHdAyqKv
        UhOF5L78X7Yj8ZXIprCQhR5HwvekrQ56W3XFaYvrBfNtHpEHhd289T8Ie+17s7xDiaU4I9FQ
        i7moOBEAjGYnti8DAAA=
X-CMS-MailID: 20210323114035eucas1p1adc19d3dbcba23ec3059a6c06021c6a0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210323091746eucas1p12f2dd394222756da3a6a958b8b192b92
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210323091746eucas1p12f2dd394222756da3a6a958b8b192b92
References: <CGME20210323091746eucas1p12f2dd394222756da3a6a958b8b192b92@eucas1p1.samsung.com>
        <03cbcdc6-01b9-339e-c95c-c184a59d1aed@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23.03.2021 10:17, Hans Verkuil wrote:
> Hi all,
> 
> I've been cleaning up kernel-doc warnings in driver headers. Any issues are now
> reported by the daily build, but there are way too many, so this needs to be
> fixed.
> 
> I've been cleaning up most of the exynos4-is warnings, but the warnings from fimc-is.h
> require more in-depth knowledge.
> 
> Can one of you take a look at the following warnings?

Hi Hans,

Thank you for taking care of this, I will provide a patch for fimc-is.h until 
end of the week.

-- 
Regards,
Sylwester
