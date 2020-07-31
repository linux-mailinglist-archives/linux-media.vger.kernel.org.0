Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6AD8234371
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 11:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732267AbgGaJlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 05:41:37 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42067 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732253AbgGaJlg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 05:41:36 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200731094134euoutp02d4b1f4128c99bce9c3ffa3c4f2cd2bc7~mzPqdPSle1088110881euoutp02y
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2020 09:41:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200731094134euoutp02d4b1f4128c99bce9c3ffa3c4f2cd2bc7~mzPqdPSle1088110881euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1596188494;
        bh=GbJBbeJR03bXyFa1MMhre4R+cY8zmKVFAv+IxUgW3lY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=l3PHEQd9eAGlq79XPadT89u/Vlbzzk/feLp5HJ7p6Zoct5DKsYUmNObm8DuztaG1C
         vjw3eSlVxe4vF4vJkYUnLks5bwo/8JbHYyrfPQqT4FLDWjYFg1WF2zli8XCa+SCWLE
         9P8yYqlNVWgSyh42LDHSpwj1vgF9p1dk9bBE9rZw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200731094134eucas1p2cc877d2721c083b35afcf08b0326491e~mzPqOultR2742427424eucas1p2h;
        Fri, 31 Jul 2020 09:41:34 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 47.8F.06456.E47E32F5; Fri, 31
        Jul 2020 10:41:34 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200731094134eucas1p2901617e5a4bc391cde77db276f0e7e93~mzPp6TTi91805118051eucas1p24;
        Fri, 31 Jul 2020 09:41:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200731094134eusmtrp207c3fddb994001b6a01207e3f65e0546~mzPp5o89e0594305943eusmtrp2k;
        Fri, 31 Jul 2020 09:41:34 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-9d-5f23e74e7089
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 15.36.06314.D47E32F5; Fri, 31
        Jul 2020 10:41:34 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200731094133eusmtip26b9016d1143d62093808ba7eaa560dc5~mzPpK4WEH2703327033eusmtip2P;
        Fri, 31 Jul 2020 09:41:33 +0000 (GMT)
Subject: Re: [PATCH v2 04/11] media: exynos4-is: Correct missing entity
 function initialization
To:     Jonathan Bakker <xc-racer2@live.ca>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kyungmin.park@samsung.com, mchehab@kernel.org, kgene@kernel.org,
        krzk@kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <c1b7b54c-6c97-e430-daec-f7815b54a33e@samsung.com>
Date:   Fri, 31 Jul 2020 11:41:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB066098E34801126939AB0EF6A3710@BN6PR04MB0660.namprd04.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm2znbOa5m36bhq0nBsqAgzezHgUQsDPZDQoKCBC+nPKi0Tdu8
        9qehZt7TbuoUZ1oWa3lZTvNShqhDvJWWZF6iFDTNbtrFNM3tJPnveZ73eb73eeGjCdkzoRsd
        rY7jNGpWKReJyYaupf4DJ6Z3hx2sL3RlDB39Qubq5BzBDAzUUkxfykeKMU8OC5mh5lIRk1Nr
        ETJFA08FTJV5RcBcftJBMS8Kxkn/LQqzMVOkeHTnkqJi5BepyKs3IsWCeWeQMFjsG8EpoxM4
        jZdfuDjKUNlIxU4QSSuWJaEOZRJZyIEGfBhWxqtFWUhMy/B9BPkPqwU8WURg7X5A8GQBQWnr
        knAjont3k+QH9xB0FbcgnnxFcKvjisDmcsIsVI8t2ePOuAZB1fUv9ocJnI6g7I+OsrlE2Bty
        O/PW4zQtwX5w1xRkk0m8B5pGDaQNb8ehYLG+sj8qwVLoLp6y6w44BBqHFu2VCOwCb6YMAh7v
        gsb5UvtiwMMUtH7OF/C9A2ChcJzksRPMWuspHrvDWpNBwAdSEeS0jFI8yUfw1lqOeNcRGOv/
        LbI1JfA+qGn24uWj0LtYR9pkwI7wel7Kl3CEaw2FBC9LICNdxrs9YNlY+K+OG2RPrZH5SK7f
        dJp+0zn6Tefo/+8tR6QRuXDxWlUkp/VWc4meWlaljVdHep6LUZnR+r/qWbV+e4y+D55tR5hG
        8q2S8EF5mEzIJmiTVe0IaELuLDnW1xMqk0SwyRc5TUyYJl7JadvRDpqUu0h8Kj6EyHAkG8ed
        57hYTrMxFdAObjrkujx7OiUjLTDJXVzUM2NJmVBLR1yCVaYqY05e5d7ArEiTrCphzten7Xjm
        tln/luARU91t3Y9e73ZpebZbrvTkyvsSiyV9CBJXEwp8jJ9C2k4ta0rq6BnfrDKL+/TPQ2fm
        X95IXu5sTnMwKtmS5IALz1NlSo/dlN4vcJ52FQ/LSW0U672f0GjZv+Ozv2tTAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsVy+t/xe7p+z5XjDXrvMFrMP3KO1aL/8Wtm
        i/PnN7BbnG16w26x6fE1VovLu+awWfRs2MpqMeP8PiaLZZv+MFm07j3CbnFx4l0WB26PTas6
        2Tw2L6n3WHTzB4tH35ZVjB6fN8kFsEbp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvH
        WhmZKunb2aSk5mSWpRbp2yXoZcxfvJ294B5zxZ+tP1kbGDuZuxg5OSQETCQaHk5l6WLk4hAS
        WMoocefaG6AEB1BCSmJ+ixJEjbDEn2tdbBA17xklPrafYQVJCAskSqy78xNskIjAekaJAyfE
        QIqYBdoYJSZvnsQE0XEHqOPIbyaQKjYBQ4neo32MIBt4Bewklq4JAAmzCKhK7Lw9nwXEFhWI
        k3jc+x9sKK+AoMTJmU/A4pwCsRLbL38BW8wsoC7xZ94lZghbXOLWk/lMELa8xPa3c5gnMArN
        QtI+C0nLLCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iREYm9uO/dy8g/HSxuBD
        jAIcjEo8vAmXlOKFWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIjRFOi5icxS
        osn5wLSRVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qB0YDZbn3a
        zDkLJ2/4NTV1ff7a4mnLyidqn18Z5V6w6//BWxG8T8+m3Jj3o2WPon+8XM+0q8qc5rteKl5S
        2ZbRedh3Nee14IvRXpbm66NPbxCva/Q+rTfXZPHEqzM2uoUae1Zz3PXaPK9rzxGJt0r3v36e
        eG4Xp155sm/0Y3cX0dkWyco39MyiJyuxFGckGmoxFxUnAgAD3M8h4wIAAA==
X-CMS-MailID: 20200731094134eucas1p2901617e5a4bc391cde77db276f0e7e93
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200730230243eucas1p210d67c908a76e5fdfbb159e3179a7cec
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200730230243eucas1p210d67c908a76e5fdfbb159e3179a7cec
References: <20200730230114.8572-1-xc-racer2@live.ca>
        <CGME20200730230243eucas1p210d67c908a76e5fdfbb159e3179a7cec@eucas1p2.samsung.com>
        <BN6PR04MB066098E34801126939AB0EF6A3710@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31.07.2020 01:01, Jonathan Bakker wrote:
> Commit bae4500399c4 ("[media] exynos4-is: Add missing entity function
> initialization") tried to suppress the warnings such as
> 
> s5p-fimc-md camera: Entity type for entity FIMC.0 was not initialized!
> 
> However, this missed setting for the subdev.  Set it now to avoid the
> ugly warnings on boot.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

