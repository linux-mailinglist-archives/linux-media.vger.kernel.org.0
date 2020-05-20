Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E64B1DAE6E
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 11:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgETJNZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 05:13:25 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50156 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbgETJNZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 05:13:25 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200520091323euoutp0289c8404c62be641eebdc90e2a4be3c67~Qsaf6PRlj0219702197euoutp02p
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 09:13:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200520091323euoutp0289c8404c62be641eebdc90e2a4be3c67~Qsaf6PRlj0219702197euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589966003;
        bh=zKIt7u/0rAs99XRPQyVYsmOQfQ0cl7ec+gn6DdbpLZg=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=GTA/cyBm/oZGZ9GGttyzmJV5TLeM2LGRW0/yeH11sJlQ5crXx1GNFeCu5lZBrYX3m
         J1KYjAPBsHDX9locRgdqULWRyCRblUUGRcNo+KYJXcN7OIUsxbFMqDpfH3lcY5K2hj
         8F0fOHhD5yzs/pif/40vkqTKDomPCnOZHcim2wyw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200520091323eucas1p185d118f24324566fe0f670992c225a1d~Qsafr35SK2310423104eucas1p1K;
        Wed, 20 May 2020 09:13:23 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 50.84.60679.3B4F4CE5; Wed, 20
        May 2020 10:13:23 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200520091322eucas1p2f3daf532612298c8e3c021b3b5bb6aeb~QsafSyouA0174501745eucas1p2b;
        Wed, 20 May 2020 09:13:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200520091322eusmtrp14425a0f1677f58b46fce826100dca726~QsafSGf930816408164eusmtrp1C;
        Wed, 20 May 2020 09:13:22 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-18-5ec4f4b32873
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id C6.D8.07950.2B4F4CE5; Wed, 20
        May 2020 10:13:22 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200520091322eusmtip15595a0d43401377b0785f03d06d5d0ff~Qsae7odaS2699126991eusmtip1D;
        Wed, 20 May 2020 09:13:22 +0000 (GMT)
Subject: Re: Bad kfree of dma_parms in v5.7-rc5
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <e9674719-0c86-63be-04a3-ee98bd884901@samsung.com>
Date:   Wed, 20 May 2020 11:13:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a9df7155-dd7a-752b-6d1c-3426837756b1@ti.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsWy7djPc7qbvxyJM3jRy21xedccNoueDVtZ
        LZZt+sNksX7+LTaL42vDHVg9Nq3qZPO4c20Pm8fxG9uZPD5vkgtgieKySUnNySxLLdK3S+DK
        aJ0/g7HgBHfF9U6vBsZDnF2MnBwSAiYShxaeZeli5OIQEljBKNH2chobhPOFUeLL5qVQmc+M
        Eo+udrDBtLy8N5kVIrGcUaJ3/Tp2COc9o8TvtstAVRwcwgL6Emdn2IPERQTuMkocXH+JHaSb
        TcBQouttF9gkXgE7iVlbl7CD1LMIqEr83OsCEhYViJU4vXgzI0SJoMTJmU9YQGxOASuJL/cO
        M4PYzALyEs1bZ0PZ4hK3nsxnAtklIdDNLvH/6gOoS10k1j7pY4KwhSVeHd/CDmHLSJye3MMC
        0dDMKPHw3Fp2CKeHUeJy0wxGiCpriTvnfoF9wyygKbF+lz5E2FFi4tn5YEdLCPBJ3HgrCHEE
        n8SkbdOZIcK8Eh1tQhDVahKzjq+DW3vwwiVmCNtDouneTtYJjIqzkLw5C8lrs5C8NgvhhgWM
        LKsYxVNLi3PTU4uN8lLL9YoTc4tL89L1kvNzNzECU8zpf8e/7GDc9SfpEKMAB6MSD6/BnsNx
        QqyJZcWVuYcYJTiYlUR4J7w4FCfEm5JYWZValB9fVJqTWnyIUZqDRUmc13jRy1ghgfTEktTs
        1NSC1CKYLBMHp1QDo6Au65JFLnfn8b480F14yl1xz2U5h5kWx8WPz1MRXNg1zVpOh3PddWH2
        Y/NMmAr3yN7UO9vqJrPA7v1BweTrGdo1Ae9bzmTz2BR0FbzdGMez2td9uVLFWy+mOQf3v9Cs
        vc2c1tixvsBt2rUJZyfMFXdewbn5fM3EzeZMAg3TqiMnzPW5HDe7WYmlOCPRUIu5qDgRAJKQ
        okUtAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsVy+t/xu7qbvhyJM/h6Vs/i8q45bBY9G7ay
        Wizb9IfJYv38W2wWx9eGO7B6bFrVyeZx59oeNo/jN7YzeXzeJBfAEqVnU5RfWpKqkJFfXGKr
        FG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX0Tp/BmPBCe6K651eDYyHOLsY
        OTkkBEwkXt6bzNrFyMUhJLCUUeLa529MEAkZiZPTGlghbGGJP9e62CCK3jJKTDt6A8jh4BAW
        0Jc4O8MepEZE4D6jxNvTJhA1vYwSc/+vZAdJsAkYSnS9BWnm5OAVsJOYtXUJO0gvi4CqxM+9
        LiBhUYFYidXXWhkhSgQlTs58wgJicwpYSXy5d5gZxGYWMJOYt/khlC0v0bx1NpQtLnHryXym
        CYyCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIERs62Yz+37GDs
        ehd8iFGAg1GJh9dgz+E4IdbEsuLK3EOMEhzMSiK8E14cihPiTUmsrEotyo8vKs1JLT7EaAr0
        20RmKdHkfGBU55XEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYDTa
        8nvCK7EW3omBLycU3ngrozvRS0xX7Hb/2tWfZJ37Ei3f1ruZp6pa1kZtknddwJ8cv/3udcWt
        1kHTkoru8i1Lrr1tlnXm1nnXWYU/1xVeVZ9WP+mzxtOUqorFgbU3FssxG+XXvWfI077fecVm
        8aSXmnG13dLfJBc+f3O7MnFudWOwX4/pBSWW4oxEQy3mouJEAMD9JleyAgAA
X-CMS-MailID: 20200520091322eucas1p2f3daf532612298c8e3c021b3b5bb6aeb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200520090109eucas1p17270805f81f6958cd5084a7b910efc6c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200520090109eucas1p17270805f81f6958cd5084a7b910efc6c
References: <CGME20200520090109eucas1p17270805f81f6958cd5084a7b910efc6c@eucas1p1.samsung.com>
        <a9df7155-dd7a-752b-6d1c-3426837756b1@ti.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On 20.05.2020 11:00, Tomi Valkeinen wrote:
> Commit 9495b7e92f716ab2bd6814fab5e97ab4a39adfdd ("driver core: 
> platform: Initialize dma_parms for platform devices") v5.7-rc5 causes 
> at least some v4l2 platform drivers to break when freeing resources.
>
> E.g. drivers/media/platform/ti-vpe/cal.c uses 
> vb2_dma_contig_set_max_seg_size() and 
> vb2_dma_contig_clear_max_seg_size() to manage the dma_params, and 
> similar pattern is seen in other drivers too.
>
> After 9495b7e92f716ab2, vb2_dma_contig_set_max_seg_size() will not 
> allocate anything, but vb2_dma_contig_clear_max_seg_size() will still 
> kfree the dma_params.
>
> I'm not sure what's the proper fix here. A flag somewhere to indicate 
> that vb2_dma_contig_set_max_seg_size() did allocate, and thus 
> vb2_dma_contig_clear_max_seg_size() must free?
>
> Or drop the kzalloc and kfree totally, if dma_params is now supposed 
> to always be there?

Thanks for reporting this issue!

Once the mentioned commit has been merged, the code should assume that 
the platform devices does have a struct dma_params allocated, so the 
proper fix is to alloc dma_params only if the bus is not a platform bus:

if (!dev_is_platform(dev) && !dev->dma_parms) {
     dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);

same check for the free path.

Would you like to send a patch for that?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

