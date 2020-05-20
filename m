Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A531D1DB505
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 15:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgETNa1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 09:30:27 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35117 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgETNa0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 09:30:26 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200520133025euoutp02bb60a75092ee536cc1bb18d112de6057~Qv668BiPj0845208452euoutp02O
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 13:30:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200520133025euoutp02bb60a75092ee536cc1bb18d112de6057~Qv668BiPj0845208452euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589981425;
        bh=4/UF8o+qe9FL65I4+IaNyRsam28B7RD7AW5dBESBSjI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=TUOJcnndEl6wkVZcE3RAe8iHXnhUX81NZo7FDy6LoD4l2PyPiJ490etN+t+i85AAJ
         2v1/SE7qZO7qlRxMUGIn1xfAotpDJdGplD3JDdRoY7b+8Kv295Vj9zYDF4tPlKgEf5
         iA85aXrAdAiU4eJb3n6YTrWMWhf0ylQ3Yf6IFmGQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200520133025eucas1p2241756af2dc10f422ced9ed8458453f4~Qv66v3h5d0434304343eucas1p2W;
        Wed, 20 May 2020 13:30:25 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 7A.DE.60698.1F035CE5; Wed, 20
        May 2020 14:30:25 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200520133024eucas1p2a72160b9d7d319b689010a7f25823627~Qv66MdZx92235322353eucas1p2T;
        Wed, 20 May 2020 13:30:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200520133024eusmtrp29f989412c7a0585daf5ece7e13c43c9c~Qv66L1R0a0497304973eusmtrp24;
        Wed, 20 May 2020 13:30:24 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-8d-5ec530f1abb9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 9E.50.07950.0F035CE5; Wed, 20
        May 2020 14:30:24 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200520133024eusmtip18777fdf60238afc2729db24c3482635a~Qv65ys4vm2732527325eusmtip1O;
        Wed, 20 May 2020 13:30:24 +0000 (GMT)
Subject: Re: [PATCH] media: videobuf2-dma-contig: fix bad kfree in
 vb2_dma_contig_clear_max_seg_size
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <063afbd8-544c-c8c1-c9a0-4e8fe0d5800a@samsung.com>
Date:   Wed, 20 May 2020 15:30:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520131558.23009-1-tomi.valkeinen@ti.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjtvdvurqOt16n5YLHRoMTIL+zHSLEEyf3LXxmC1srrNPdhm1oK
        gS2QnCJmja1hWEqZzi9WbmaxcujWMpyklQ6lIksNRMqKEs223Sz/nfec8zznOfBSLGEzJ4Yq
        VpfRWrVcKSF5bLv711j8l6SR/KSf3hjpxGAzKa3v6+dI79rWCGlvi5+UerpzjnBkts5aUjbz
        +jEp80w5CNmKTZTNzuWlFdDK4gpam5h+ilc0/rGRKJ2NvLA8b+FWo85wAwqjAB+Ed29spAHx
        KCG+h8DhM6GgIMTfEBhdVYywgqCv9hNnc+LZ22E2I7QjqGvVc5jHMoKar+0hVwQuBEfv85AQ
        iQcQzNa6Q3tZOBbszsmQicTJYFgykEHMx+lg6/Gzg5iN90LLzcaQPwrnwWjbfcR4wsF7Yy7k
        CcOp0GM0ksxOMTiWmlkMjgb/XAsRDAZs4sLQUyvJ3J0JU3qmHOAI+Ox5wGXwbth4uDlwGcH7
        sW4u86hHMKE3/51IhZmx1cAmKhARB72DiQydAZes3ShIAxbA1FI4c4QAmuwmFkPz4UqNkHHv
        A4un51/s0PhLViOSWLZUs2ypY9lSx/I/9xZid6JoulynUtC6FDV9PkEnV+nK1YqEMxqVDQX+
        zOhvz/cB5Fw77UKYQpLt/D7+SL6QI6/QVapcCCiWJJJ/e0eA4hfIK6toreaktlxJ61xoF8WW
        RPNTWhfzhFghL6NLaLqU1m6qBBUWU42SUwjvot8vmj9Usn6tCi8WTHg76EyxtXVnxmRuf/71
        FxzNcAMnLSfOuKA4kS4SdKxHDR0wT4sFZvHqo4tE1pNtr+KPwkJWgs9sctYpun44leGi41dj
        z7mrY838Y/ZU6Ld+KBnXHt5TqCHc3oENVvaG3tclPuu7Uznd1tAkYeuK5Mn7WVqd/A+4bmWW
        LwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xu7ofDI7GGUx5qmtxedccNoueDVtZ
        LZZt+sNksX7+LTaL42vDHVg9Nq3qZPO4c20Pm8fxG9uZPD5vkgtgidKzKcovLUlVyMgvLrFV
        ija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLuPB0AlPBXZGK989nsTcwrhLs
        YuTkkBAwkThx/whLFyMXh5DAUkaJZZ3fWCASMhInpzWwQtjCEn+udbFBFL1llLi5cRYbSEJY
        IE1i+/pTrCAJEYFdjBKLbl8ESzALqEts23eFFaKjj1Fife80ZpAEm4ChRNfbLrAiXgE7iU3r
        boGtYxFQlZg/dwIjiC0qECux+lorI0SNoMTJmU/AajgFrCXWTZ0KtcBMYt7mh8wQtrzE9rdz
        oGxxiVtP5jNNYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMw
        srYd+7llB2PXu+BDjAIcjEo8vBwCR+OEWBPLiitzDzFKcDArifAu5AcK8aYkVlalFuXHF5Xm
        pBYfYjQFem4is5Rocj4w6vNK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQx
        cXBKNTDKFth7P8mKCrA92eDLN/tJ/BH+P689Yz+tiq7Zvnf6j5Pcuu+yJTmzt7D+eMJx9sgl
        1znvC1PjLu2uqndlEC1U6vFhrkjIvy5rdkyzrGy6zaGVi3Qre243ikSaqp9rjp18tLxAdkl2
        +3mzp3POzr+nFFZ4L2a7d4jcibtnZKXfzCjr7rrNXanEUpyRaKjFXFScCABIh5HnwgIAAA==
X-CMS-MailID: 20200520133024eucas1p2a72160b9d7d319b689010a7f25823627
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200520131624eucas1p131198f592ee1009a78e321955c8cae19
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200520131624eucas1p131198f592ee1009a78e321955c8cae19
References: <CGME20200520131624eucas1p131198f592ee1009a78e321955c8cae19@eucas1p1.samsung.com>
        <20200520131558.23009-1-tomi.valkeinen@ti.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On 20.05.2020 15:15, Tomi Valkeinen wrote:
> Commit 9495b7e92f716ab2bd6814fab5e97ab4a39adfdd ("driver core: platform:
> Initialize dma_parms for platform devices") in v5.7-rc5 causes
> vb2_dma_contig_clear_max_seg_size() to kfree memory that was not
> allocated by vb2_dma_contig_set_max_seg_size().
>
> The assumption in vb2_dma_contig_set_max_seg_size() seems to be that
> dev->dma_parms is always NULL when the driver is probed, and the case
> where dev->dma_parms has bee initialized by someone else than the driver
> (by calling vb2_dma_contig_set_max_seg_size) will cause a failure.
>
> All the current users of these functions are platform devices, which now
> always have dma_parms set by the driver core. To fix the issue for v5.7,
> make vb2_dma_contig_set_max_seg_size() return an error if dma_parms is
> NULL to be on the safe side, and remove the kfree code from
> vb2_dma_contig_clear_max_seg_size().
>
> For v5.8 we should remove the two functions and move the
> dma_set_max_seg_size() calls into the drivers.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>
> Note: I have only fully tested this on linux-next, as the capture driver
> I use doesn't support unloading modules in v5.7.
>
>   drivers/media/common/videobuf2/videobuf2-dma-contig.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index d3a3ee5b597b..24f80b62ef94 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -726,9 +726,8 @@ EXPORT_SYMBOL_GPL(vb2_dma_contig_memops);
>   int vb2_dma_contig_set_max_seg_size(struct device *dev, unsigned int size)
>   {
>   	if (!dev->dma_parms) {
> -		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
> -		if (!dev->dma_parms)
> -			return -ENOMEM;
> +		dev_err(dev, "Failed to set max_seg_size: dma_parms is NULL\n");
> +		return -ENODEV;
>   	}
>   	if (dma_get_max_seg_size(dev) < size)
>   		return dma_set_max_seg_size(dev, size);
> @@ -747,8 +746,6 @@ EXPORT_SYMBOL_GPL(vb2_dma_contig_set_max_seg_size);
>    */
>   void vb2_dma_contig_clear_max_seg_size(struct device *dev)
>   {
> -	kfree(dev->dma_parms);
> -	dev->dma_parms = NULL;
>   }
>   EXPORT_SYMBOL_GPL(vb2_dma_contig_clear_max_seg_size);

We don't need to export empty function imho. It can be made an empty 
static inline in include/media/videobuf2-dma-contig.h.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

