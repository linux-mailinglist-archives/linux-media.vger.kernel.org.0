Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 583B7EDB81
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 10:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbfKDJSR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 04:18:17 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:43725 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbfKDJSQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 04:18:16 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191104091813euoutp02094c05823b3bee24aef553288c2433c9~T6wMxh2nP1366713667euoutp02A
        for <linux-media@vger.kernel.org>; Mon,  4 Nov 2019 09:18:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191104091813euoutp02094c05823b3bee24aef553288c2433c9~T6wMxh2nP1366713667euoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1572859093;
        bh=XaX9T477Gykmou4U+0wO1VDWcRASPonroFzAOLtMk+g=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=KQWoM9HbHG+2Bud/puWLVuL89PlaViUQB43idN5NsjLYboVXO3XIaWWjhCZP8ZBX0
         gYB3KnFPInRdD2pmtjKn2QXyi0xWhg+jokT1ATJ+ygIJVNVpXgKrcNj52D7W35d6QB
         PYMChsH7k1jXFgb5vYu82+bPD5l03KHThhp2yogM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191104091813eucas1p22cae6df30ac7dfd064909cb0635a227f~T6wMhuLXv1921519215eucas1p2w;
        Mon,  4 Nov 2019 09:18:13 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 7F.E6.04374.5DCEFBD5; Mon,  4
        Nov 2019 09:18:13 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191104091813eucas1p2452dd973a4b935b3b43059fe122ca084~T6wMNyfCo1470514705eucas1p2H;
        Mon,  4 Nov 2019 09:18:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191104091813eusmtrp110d71bd6a269545066b063cac3f0231a~T6wMNO1452204422044eusmtrp1P;
        Mon,  4 Nov 2019 09:18:13 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-1b-5dbfecd5150a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 5A.39.04166.5DCEFBD5; Mon,  4
        Nov 2019 09:18:13 +0000 (GMT)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191104091812eusmtip2c5e71223c8b4a254a90af7c1dd01301a~T6wL8xeIV0750307503eusmtip2l;
        Mon,  4 Nov 2019 09:18:12 +0000 (GMT)
Subject: Re: [PATCH] media: exynos4-is: fix wrong mdev and v4l2 dev order in
 error path
To:     Seung-Woo Kim <sw0312.kim@samsung.com>, linux-media@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org, mchehab@kernel.org,
        krzk@kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <fdd591ce-f0b3-8737-bd1f-27645035ce7e@samsung.com>
Date:   Mon, 4 Nov 2019 10:18:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571623084-2705-1-git-send-email-sw0312.kim@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djPc7pX3+yPNViyQ8bi/PkN7BY9G7ay
        Wsw4v4/JYtmmP0wWMya/ZHNg9di0qpPNo2/LKkaPz5vkApijuGxSUnMyy1KL9O0SuDJ6JrUx
        FXzirJi14j57A+NKji5GTg4JAROJlhOrWbsYuTiEBFYwSjza08wE4XxhlFh5/wuU85lRYvGu
        1ywwLa3nzjNCJJYzSlxY/Rqq/y2Q09LIDFIlLBApMffmGjYQW0TAXaL3zDt2EJtZwEuiY/cP
        MJtNwFCi92gf0CQODl4BO4m7X9NBwiwCKhKTvs9jAQmLCkRInP6aCBLmFRCUODnzCdgNnAJu
        EpPmT2WDmCgu0fRlJSuELS+x/e0cZpBzJASms0vsubuQFeJoF4nTrx8zQ9jCEq+Ob2GHsGUk
        Tk/uYYFoaGaU6Nl9mx3CmcAocf/4AkaIKmuJw8cvsoJcxCygKbF+lz5E2FHi8J+bYPdLCPBJ
        3HgrCHEEn8SkbdOZIcK8Eh1tQhDVKhK/V01ngrClJLqf/GeZwKg0C8lrs5C8MwvJO7MQ9i5g
        ZFnFKJ5aWpybnlpsnJdarlecmFtcmpeul5yfu4kRmFpO/zv+dQfjvj9JhxgFOBiVeHgdePbH
        CrEmlhVX5h5ilOBgVhLhvThjb6wQb0piZVVqUX58UWlOavEhRmkOFiVx3mqGB9FCAumJJanZ
        qakFqUUwWSYOTqkGRje5dTu5Duyo1rc/vJt5v63hpzPrV694IRpYGM5+KaavXzj/zLbEpLrM
        Cvt7W5USdRNz3ONdSgJj2iaU2epvXlLRrfzQQkiv03BNjlvewe2Tvlo/Yz+hL/lOVOZG8+ZV
        DTPCGLSCnq17wdC1fJL67ZiiKadiXsuk8rC/PrU3+M6+vDDdVi93JZbijERDLeai4kQAw6jd
        ZikDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xe7pX3+yPNTjXxGNx/vwGdoueDVtZ
        LWac38dksWzTHyaLGZNfsjmwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehk9k9qYCj5xVsxacZ+9gXElRxcjJ4eE
        gIlE67nzjF2MXBxCAksZJVb86mDvYuQASkhJzG9RgqgRlvhzrYsNouY1o8TjQwuYQBLCApES
        c2+uYQOxRQTcJXrPvGOHKJrJKHHt/FN2kASzgJdEx+4fYDabgKFE79E+RpAFvAJ2Ene/poOE
        WQRUJCZ9n8cCYosKREg8336DEcTmFRCUODnzCVicU8BNYtL8qWwQI9Ul/sy7xAxhi0s0fVnJ
        CmHLS2x/O4d5AqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucWGesWJucWleel6yfm5mxiB
        sbTt2M/NOxgvbQw+xCjAwajEw/uCc3+sEGtiWXFl7iFGCQ5mJRHeizP2xgrxpiRWVqUW5ccX
        leakFh9iNAV6biKzlGhyPjDO80riDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB
        9DFxcEo1MCZXMepPYM+7wsa0S+fQXpFP9Svtpr5brF+x1dtr7+xzwmZ6QS3NvMz9Vu4XlWef
        X/JzCtcURYv5Biv77Ku03x5dw6vG9Wi2gVpljtzd3UlX395o+mHK9frfxdDMG5bBUx+IKJ9u
        PlayuiBf4vnW/d3rrbUDs1dsk8kPWVcReP2r6ftJviUJTUosxRmJhlrMRcWJAOn78Ae7AgAA
X-CMS-MailID: 20191104091813eucas1p2452dd973a4b935b3b43059fe122ca084
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191021015536epcas1p3d9dc18f8f4e4a98de0dc7a9a84525cd1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191021015536epcas1p3d9dc18f8f4e4a98de0dc7a9a84525cd1
References: <CGME20191021015536epcas1p3d9dc18f8f4e4a98de0dc7a9a84525cd1@epcas1p3.samsung.com>
        <1571623084-2705-1-git-send-email-sw0312.kim@samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Seung-Woo,

On 10/21/19 03:58, Seung-Woo Kim wrote:
> When driver is built as module and probe during insmod is deferred
> because of sensor subdevs, there is NULL pointer deference because
> mdev is cleaned up and then access it from v4l2_device_unregister().
> Fix the wrong mdev and v4l2 dev odder in error path of probe.

> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>

The patch looks good, however we need to also call media_device_cleanup()
when v4l2_device_register() fails.

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> ---
>  drivers/media/platform/exynos4-is/media-dev.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index a838189..3685c91e6 100644
> --- a/drivers/media/platform/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/exynos4-is/media-dev.c
> @@ -1520,8 +1520,8 @@ static int fimc_md_probe(struct platform_device *pdev)
>  err_clk:
>  	fimc_md_put_clocks(fmd);
>  err_md:
> -	media_device_cleanup(&fmd->media_dev);
>  	v4l2_device_unregister(&fmd->v4l2_dev);
> +	media_device_cleanup(&fmd->media_dev);
>  	return ret;
>  }

-- 
Thanks,
Sylwester
