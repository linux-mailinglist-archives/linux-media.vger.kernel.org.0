Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E929DC2D1
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 12:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408215AbfJRKch (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 06:32:37 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41370 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729479AbfJRKch (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 06:32:37 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191018103235euoutp02536fe095af93bb36db7e44805d982060~OtzRQ1VuU0503905039euoutp028
        for <linux-media@vger.kernel.org>; Fri, 18 Oct 2019 10:32:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191018103235euoutp02536fe095af93bb36db7e44805d982060~OtzRQ1VuU0503905039euoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1571394755;
        bh=Ysrx07gQCp3rWiZMT5yZDjt62qpEUaWVhwuVePnhwVY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=tvVPQPIuCQEvZ4YIPfYVLFhFVmbtXsScB6GgdHCr3oTte5Sx+qXDGpmU2qgZbEBj5
         luPlyWKdbmNxxohNzvdTODFpFteX1m/dtNCUL1x+5NjW1DI6glp0BQTj1pUnyTYBTz
         IQl72zMiEKmD8xcRQbLW0FmXtP9rXeXBplQZxV9Q=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191018103235eucas1p24f7a0c0270c9c788ed7e6fb155c3ae6b~OtzRBdFRb1997219972eucas1p2C;
        Fri, 18 Oct 2019 10:32:35 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id AB.93.04374.2C499AD5; Fri, 18
        Oct 2019 11:32:35 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191018103234eucas1p1ca07b12d4ac2e934c8dc486c2998eef4~OtzQriZN_1739717397eucas1p1O;
        Fri, 18 Oct 2019 10:32:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191018103234eusmtrp1811badc5d6743e8dba86226eb6b7d460~OtzQq8dRP1051510515eusmtrp1j;
        Fri, 18 Oct 2019 10:32:34 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-fb-5da994c2cae4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 50.AE.04166.2C499AD5; Fri, 18
        Oct 2019 11:32:34 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191018103234eusmtip23193efe964e4c71a939cf28d160ae295~OtzQWlj_61038010380eusmtip2M;
        Fri, 18 Oct 2019 10:32:34 +0000 (GMT)
Subject: Re: [PATCH] media: exynos4-is: Fix recursive locking in
 isp_video_release()
To:     Seung-Woo Kim <sw0312.kim@samsung.com>, linux-media@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org, mchehab@kernel.org,
        krzk@kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <88842c64-7101-2ebd-201f-9975ab69b32d@samsung.com>
Date:   Fri, 18 Oct 2019 12:32:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571394052-24446-1-git-send-email-sw0312.kim@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7djP87qHp6yMNbh/hdHi/PkN7BY9G7ay
        Wsw4v4/JYtmmP0wWMya/ZHNg9di0qpPNo2/LKkaPz5vkApijuGxSUnMyy1KL9O0SuDK+TtrC
        VvCcuWJnz2PGBsaFzF2MnBwSAiYSd/8tZu1i5OIQEljBKLHl6ilGkISQwBdGibPXQiASnxkl
        7v09xtLFyAHWcXlKCUR8OaNE49dZzBDOW0aJrvYP7CDdwgJhEnPav7GB2CIC7hK9Z96BxZkF
        vCQ6dv8As9kEDCV6j/aBbeMVsJNY9v4tE4jNIqAq8W97HxvIMlGBCInTXxMhSgQlTs58wgJi
        cwKN/LzxDtRIcYmmLytZIWx5ie1v54DdIyEwmV3iwfXF7BBvukh0XJvJCmELS7w6vgUqLiNx
        enIPC0RDM6NEz+7b7BDOBEaJ+8cXMEJUWUscPn6RFeQiZgFNifW79CHCjhI/tq9gg4QKn8SN
        t4IQR/BJTNo2nRkizCvR0SYEUa0i8XvVdCYIW0qi+8l/lgmMSrOQvDYLyTuzkLwzC2HvAkaW
        VYziqaXFuempxcZ5qeV6xYm5xaV56XrJ+bmbGIGJ5fS/4193MO77k3SIUYCDUYmHd0fAilgh
        1sSy4srcQ4wSHMxKIrzB1itjhXhTEiurUovy44tKc1KLDzFKc7AoifNWMzyIFhJITyxJzU5N
        LUgtgskycXBKNTCG6nRc6j/Uy3LEzViwk1+m8tQ7q+UHZ3ufr5lYWfqpfDtPdabYvPfP0sqf
        L14esEK6KZbpVpXIrWYu6+gHUsKx7NfWJLInvz7Jdf+I8Y8of+YVSya4hspVMtbmcog0GE2z
        bZylWH1gvec9Pc4ZPxQinshMZP7a3tgQcjzTkD9w0xoVfam5hUosxRmJhlrMRcWJACgPX/Mo
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xe7qHpqyMNWh/pmJx/vwGdoueDVtZ
        LWac38dksWzTHyaLGZNfsjmwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehlfJ21hK3jOXLGz5zFjA+NC5i5GDg4J
        AROJy1NKuhi5OIQEljJKnFn5kA0iLiUxv0Wpi5ETyBSW+HOtiw3EFhJ4zSixrykRxBYWCJOY
        0/4NLC4i4C7Re+YdO8ScWYwS/yZuZAVJMAt4SXTs/sEOYrMJGEr0Hu1jBLF5Bewklr1/ywRi
        swioSvzb3gc2SFQgQuL59htQNYISJ2c+YQGxOYEWfN54hx1iprrEn3mXmCFscYmmLyuhdslL
        bH87h3kCo9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIGRtO3Y
        z807GC9tDD7EKMDBqMTDuyNgRawQa2JZcWXuIUYJDmYlEd5g65WxQrwpiZVVqUX58UWlOanF
        hxhNgZ6byCwlmpwPjPK8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TByc
        Ug2MAQsrJ6QbMYip7Hm+YM7eQ4mT5+9t/lkkcfINS0w09zr+YwHV5pblSc6Hil4/eq0593MD
        7w7xLzE2iyeaJRTckY2ILNGbeNR3wtnkuGxH5SsSEzSP6b976fR/3bli3djybjmPB0x+7/7c
        MrX8aKtwNEW5YJ/8oc4FCqt+iJXoe29tvbgyU9RJiaU4I9FQi7moOBEACf27w7oCAAA=
X-CMS-MailID: 20191018103234eucas1p1ca07b12d4ac2e934c8dc486c2998eef4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191018101825epcas1p3fc6c1d01b4d898ebd0db64527e17b536
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191018101825epcas1p3fc6c1d01b4d898ebd0db64527e17b536
References: <CGME20191018101825epcas1p3fc6c1d01b4d898ebd0db64527e17b536@epcas1p3.samsung.com>
        <1571394052-24446-1-git-send-email-sw0312.kim@samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/18/19 12:20, Seung-Woo Kim wrote:
>>From isp_video_release(), &isp->video_lock is held and subsequent
> vb2_fop_release() tries to lock vdev->lock which is same with the
> previous one. Replace vb2_fop_release() with _vb2_fop_release() to
> fix the recursive locking.
> 
> Fixes: 1380f5754cb0 ("[media] videobuf2: Add missing lock held on vb2_fop_release")
> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
