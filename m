Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADB93C7F1
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 12:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404337AbfFKKAQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 06:00:16 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41729 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727734AbfFKKAQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 06:00:16 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190611100014euoutp01a3825e92d3b75ebf91badc57b37e93b7~nHJNOX4CO1883418834euoutp01h
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 10:00:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190611100014euoutp01a3825e92d3b75ebf91badc57b37e93b7~nHJNOX4CO1883418834euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1560247214;
        bh=DMPZzqhNW3jYYvKP6v+4Dy8sFNdg4mhxn6oDisfjVQo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=uqZUZ9SU93FvDAQ0o7qA5I3rromxhI2tQ8Nka49GYTSVFXkxxUAFCcH5eS4PzpZBX
         Q5Qa+sUrdWFJGDoWJvTtnjPrq6hAsdMjSTkvi8qj//mF5WT0uPR8nZ2dozik3sdV8J
         PTkz/SAms/WODXYuIvDFyMnKg6m6387Kw4Tg5Tfc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190611100014eucas1p18496883ad65b7a14cdd78354288264d7~nHJMrmuz93238632386eucas1p1f;
        Tue, 11 Jun 2019 10:00:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id E6.BF.04377.DAB7FFC5; Tue, 11
        Jun 2019 11:00:14 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190611100013eucas1p229fae8dc62aac7cc8619c0bcf1740c2b~nHJL4x-hP0704907049eucas1p2B;
        Tue, 11 Jun 2019 10:00:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190611100013eusmtrp10efc8e1d221b5c24a34ec203fac56a4f~nHJLpMg1f1968119681eusmtrp15;
        Tue, 11 Jun 2019 10:00:13 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-cf-5cff7bad6a7d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 76.61.04140.DAB7FFC5; Tue, 11
        Jun 2019 11:00:13 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190611100012eusmtip1d4dfa66a3c18f04d01ffd9351727b6e2~nHJKy4XE50583705837eusmtip1F;
        Tue, 11 Jun 2019 10:00:12 +0000 (GMT)
Subject: Re: [PATCH] MAINTAINERS: media: Add Tomasz Figa as a videobuf2
 reviewer
To:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?B?UGF3ZcWCIE/Fm2NpYWs=?= <posciak@chromium.org>,
        Pawel Osciak <pawel@osciak.com>,
        Kyungmin Park <kyungmin.park@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <4acd9745-216b-8cd4-9f6f-bbfc870a6c0d@samsung.com>
Date:   Tue, 11 Jun 2019 12:00:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607083518.90078-1-tfiga@chromium.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju2zk7O4qz47zsRSNjVGCSZhc4YJmSwX4ERj+idJhTDyq5KZvT
        1B8Ns7Ils1Qq18AMMhVvLNtMw1LRpeJIzTIvlDYUw4HkZWm2cjta/nve5708zwMviQlMXH8y
        TZ7FKOTSdBHhjht71yyHG/P/SI4sFGJ0f9kshx4sWODRI216gi5ufsmlqw0bHLrctsajmyf7
        CHrppoOIJMWP1UO42FB3hxB/W58nxNqWOiReMuwV968s8c4Tse4nk5n0tGxGERqR4J7aNDOB
        ZdqJa/0ljRw1GuRqkBsJ1HGova3maJA7KaBqEHxsNnLZYhlB4Vg5xhZLCFZfvUDbKxOldpxt
        PEeg7X2wNWVDMDpf6TrsTV2ASe0oz4l9qCjobZp2iWDUOoKpyQbC2SCoMNDYNC7MpyLAWF/t
        WsCpA6Bvr3cd8qUksPJmFGNnvKCvwoo7sRtFw+znIo4TY1QgmGx6jMVCGLdWusSA6uBBaX8T
        j/UdDT8/fMJY7A3fzS1b/B4YKCvG2YUbCKYtDTy2KEYwUvBoK3U4dJuHNi2RmxJB0NQWytJR
        cL+nFXPSQHnCmM2LNeEJpcaHWzQfim4J2OmDoDM3/pPtfD+M3UMi3Y5ouh1xdDvi6P7rPkF4
        HRIyKqUshVEelTM5IUqpTKmSp4QkZcgMaPOdBhzm5VbUtpHYhSgSiTz4l+IcEgFXmq3MlXUh
        IDGRD19j36T4ydLcPEaRcUWhSmeUXSiAxEVCfv6ur3ECKkWaxVxlmExGsd3lkG7+auSXoy8+
        kVZgTggPXE17dn24IjnSEVpNdyfZ875gBnvFZY92VdW4xW/mbM3CXNK67XTrXbeK4H3vfvl2
        PAtQz60tDiVOTQfFWOOfWnbXXQzuGRE6ot/+eC2yW7hnYntjsjJNQ/FrJadmTSnaxf1SbWeI
        pBaY3+dUxzix1ka/5SoRrkyVhh3CFErpXxNNGN5KAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsVy+t/xu7prq//HGOybx25xavIzJouzTW/Y
        LS7vmsNm0bNhK6vFsk1/mCymvP3JbrHhzkk2i8+t/9gcODxmN1xk8di0qpPN4/Gvl2wefVtW
        MXp83iTncerrZ/YAtig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TU
        nMyy1CJ9uwS9jPWPbjMXfGerONW/jqmB8SxrFyMnh4SAicTtSd9Zuhi5OIQEljJKfNx0ESoh
        I3FyWgOULSzx51oXG0TRa0aJBzf/MoEkhAWCJO70XWUHsUUEHCWOrX/IBFLELPCLUWLzwYtQ
        Y7sZJSb+/ALWwSZgKNH1FmQUJwevgJ3EtjXLwLpZBFQl5uxeA7ZOVCBGoq9xBQtEjaDEyZlP
        wGxOAQuJZzc7wOYwC5hJzNv8kBnClpfY/nYOlC0ucevJfKYJjEKzkLTPQtIyC0nLLCQtCxhZ
        VjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgRG47ZjP7fsYOx6F3yIUYCDUYmHNyL6X4wQa2JZ
        cWXuIUYJDmYlEd6u70Ah3pTEyqrUovz4otKc1OJDjKZAz01klhJNzgcmirySeENTQ3MLS0Nz
        Y3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYyle48Kb52X1JEmtUlz2UmHmQ9S68qe
        z5hXavdfd620RJCt6NQWm/VPLyy/cnnxl2cTpfKeffOOU5DZoNRQtOppmmM40/bbbKyvE3j+
        a3T0NPgl1n2s8WTMTbu6M5v5WsNZphP3JaQzfjOfuM14spRDdof2g9dyPRuqjHNWGp5YW9Ey
        +8KX71uUWIozEg21mIuKEwHxnlQe3AIAAA==
X-CMS-MailID: 20190611100013eucas1p229fae8dc62aac7cc8619c0bcf1740c2b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190607083531epcas3p48cf46e033280d7e86ed1029707f2f373
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607083531epcas3p48cf46e033280d7e86ed1029707f2f373
References: <CGME20190607083531epcas3p48cf46e033280d7e86ed1029707f2f373@epcas3p4.samsung.com>
        <20190607083518.90078-1-tfiga@chromium.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2019-06-07 10:35, Tomasz Figa wrote:
> I tend to review most of the vb2 patches anyway and we need some active
> reviewers, so let add me to the MAINTAINERS file as such.
>
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 98cd84977350..b5f65f61becb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16758,6 +16758,7 @@ VIDEOBUF2 FRAMEWORK
>   M:	Pawel Osciak <pawel@osciak.com>
>   M:	Marek Szyprowski <m.szyprowski@samsung.com>
>   M:	Kyungmin Park <kyungmin.park@samsung.com>
> +R:	Tomasz Figa <tfiga@chromium.org>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   F:	drivers/media/common/videobuf2/*

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

