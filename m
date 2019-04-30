Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1043F8DE
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 14:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbfD3M3u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 08:29:50 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48799 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfD3M3t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 08:29:49 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190430122947euoutp02b3a9025d392440720fc48d085fb2e7f9~aQFynwMjr2462824628euoutp02R
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2019 12:29:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190430122947euoutp02b3a9025d392440720fc48d085fb2e7f9~aQFynwMjr2462824628euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1556627387;
        bh=MvFQNAheRDuG4SZO4t5huET3oBpZqeYExbaD3PYBCXU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=XDkOQkdt9HR4FlCwh6jvIMvgIQOAQX4jC6v7u2uqIH9NLagaW5hcWacKfaje28J9f
         AfwScYKPJDdNSYUSTtv5DfWLKDoI/8CnHcIBm+SMWx7tcwM9NPEMvSKPT0XdPluDRr
         QcW3iLFk1WGdFujQF2m5+l+5aRquR+VC9YzpuWJY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190430122947eucas1p2b28d8b4bd2096a1a40dcc7c4ecc68575~aQFx8TR_K0642106421eucas1p2r;
        Tue, 30 Apr 2019 12:29:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id C0.FE.04298.ABF38CC5; Tue, 30
        Apr 2019 13:29:46 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190430122946eucas1p1224ab2219b528621239cd4fbd595117c~aQFxKS0gz2403424034eucas1p1S;
        Tue, 30 Apr 2019 12:29:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190430122946eusmtrp15ed9a6bccdeb3999365c119781c74777~aQFw4AnUO3224332243eusmtrp1A;
        Tue, 30 Apr 2019 12:29:46 +0000 (GMT)
X-AuditID: cbfec7f2-3615e9c0000010ca-07-5cc83fba6fcf
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 57.40.04140.9BF38CC5; Tue, 30
        Apr 2019 13:29:45 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190430122945eusmtip2133db4c2adb3f70d17506ee3ceecbd71~aQFwUh-Fy3142831428eusmtip2H;
        Tue, 30 Apr 2019 12:29:45 +0000 (GMT)
Subject: Re: [PATCH v3 1/2] media: exynos4-is: Properly report _MPLANE caps
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, kernel@collabora.com,
        Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <8c13d322-26c3-0efa-f5db-99092ac249ca@samsung.com>
Date:   Tue, 30 Apr 2019 14:29:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418223518.GI4794@pendragon.ideasonboard.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjuO7cdh6vPWfqiXWjUIElTKjxRWUHQgYKCCioHNeugltPaUbvY
        j3X3GuYMa0WY2Kp185LXSEPT2bSVdtNKFJShliVu0tWV2zHy3/N+7/N8z/PAy5LKbjqIjU9M
        FvSJ2gQVI6cqm3/YQ2vXtGjCLd+Xc61tNoIr/lFLcCOFezmb0UFw5fZsmsu4UCzjsksqaM5c
        9pvgRm01JNdWf5vhLhkHGc55xs2s9eWvGNopPv9XKc1Xdxcj/kr6ZZpvHLtO8WWWDIYvH8gi
        +fMPLYh3ls3lbWNO2Rb5LvmqfUJCfKqgXxK1Rx53/VUmOlhCH7Hb3jIGZKYykQ8LeBm0m/qI
        TCRnlfgWgpPudJk0uBC42r5NbpwIHte+lv2T9D69QEuLmwjaHGOMNAwjeJPX5GX5441Qaaoj
        PHgm5iCnqAB5SCQuIuG7weglMTgCcprOIw9W4Cj4+s7sFVB4IQzkdns5s/AO6GkuoSWOHzy7
        3O9N7oPXwPteg1dL4kA46bpNS3geVA1fJT1mgMdlUFVUPll1PbgdUiLA/jBkfTjZZza0GrMp
        SXAKQfajDzJpyEXQYy1EEmslNFrbJyzYCYtF8KB2iQcCXged17ZLcDp0DvtJGaZDXmUBKT0r
        IP2sUvpjAfyyFEwmCIKs/j9ULlKZpjQzTWljmtLG9N+2EFEWFCikiLpYQYxIFA6HiVqdmJIY
        G7Y3SVeGJo6u1W0drUZjHTENCLNI5avgvzRrlLQ2VTyqa0DAkqqZCt7apFEq9mmPHhP0Sbv1
        KQmC2ICCWUoVqEib1hutxLHaZOGAIBwU9P+2BOsTZEDBGMLV4/kNpTVx1+4PdnVdiofNfZt6
        dB9jOiL3H797etXOxReTKd/+ljsrGivvJZ2InvEy7fPqlsjyF3kVN85s/hnw/Jt+dUchTb/r
        nC/3Dyc39D755NoWbT7UqBZOR+/2d9SdU+fb/aiQIHd91tJWQi2rC9N03xqZs7UmtG8ooEpF
        iXHaiBBSL2r/AgYrdy1wAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRmVeSWpSXmKPExsVy+t/xe7o77U/EGFyfZ2lx+swpJoslP3cx
        WXxYkGxxavIzJovN53pYLTonLmG36NmwldVi2aY/TBafTu1ktjizfyWbxYzJL9ksPrf+Y3Pg
        8ZjdcJHFY8rvjaweO+4uYfSY3TGT1ePw14UsHptWdbJ5bH7RzezRt2UVo8fnTXIep75+Zg/g
        itKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLWHi5
        i7FgA2vFuVPX2BoYl7F0MXJySAiYSDw4MpG1i5GLQ0hgKaPEnLtXmLoYOYASUhLzW5QgaoQl
        /lzrYoOoec0o8WTGPCaQhLCAt8S2WfvAbBEBC4neRdMZQWxmgWXMEvMXe4HYQgIvmCTOf80H
        sdkEDCV6j/aB1fAK2Em8v74MrJdFQFXixYS77CC2qECExJn3K1ggagQlTs58AmZzCthL3HrQ
        ADVfXeLPvEvMELa4RNOXlawQtrzE9rdzmCcwCs1C0j4LScssJC2zkLQsYGRZxSiSWlqcm55b
        bKRXnJhbXJqXrpecn7uJERjV24793LKDsetd8CFGAQ5GJR5ej3fHYoRYE8uKK3MPMUpwMCuJ
        8HocPxojxJuSWFmVWpQfX1Sak1p8iNEU6LmJzFKiyfnAhJNXEm9oamhuYWlobmxubGahJM7b
        IXAwRkggPbEkNTs1tSC1CKaPiYNTqoGRZ+qdz+dDcnZpqh7ev+5uzMrmSzGBB8Qs7GMWqXAr
        avvtm+pTpL7S15rPSXLnryOO4ge649OfZc8+umkn/0T++Vy6Kic+yT25/7HydvnCpR/+nHms
        89ZarMdB7P27vKgLd7+/a87pvSG4eqpbWmzzzxXZVlpnKmwLAu+/dV2+MiDGkMH2W4G7Ektx
        RqKhFnNRcSIAqh2IHgADAAA=
X-CMS-MailID: 20190430122946eucas1p1224ab2219b528621239cd4fbd595117c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190412092035epcas1p43412936a0fba75b1c548904e785fe23d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190412092035epcas1p43412936a0fba75b1c548904e785fe23d
References: <CGME20190412092035epcas1p43412936a0fba75b1c548904e785fe23d@epcas1p4.samsung.com>
        <20190412092027.20410-1-boris.brezillon@collabora.com>
        <c1faa661-6631-00ae-836b-4f24b1ee408e@samsung.com>
        <1c4fc9c3-4c9e-475a-262a-1479f77e267b@xs4all.nl>
        <512d5fd1-e4d3-c074-1b13-886747e8db97@samsung.com>
        <20190418223518.GI4794@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 4/19/19 00:35, Laurent Pinchart wrote:
> As this driver is quite old I assume there's little interest in
> investing in it, but is there any chance Samsung would be interested in
> contributing to libcamera for newer generations ? :-)

I'm not aware of such plans at the moment, I assume the prerequisite
would be mainline drivers for the camera subsystem which in turn requires
whole SoC support in the mainline tree. And there have been quite a few
newer Exynos SoC released for which I haven't seen efforts of adding
mainline support. Of course things may change any time and I may not know
everything so nothing is impossible.

-- 
Regards,
Sylwester
