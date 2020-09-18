Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D47270029
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 16:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbgIROs5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 10:48:57 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43897 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgIROs4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 10:48:56 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200918144854euoutp01ad97d555e0950b914a2e9375825219ef~16C-e8aAd1226312263euoutp01H
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2020 14:48:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200918144854euoutp01ad97d555e0950b914a2e9375825219ef~16C-e8aAd1226312263euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600440534;
        bh=IiawuiQon3bMj9SyrhlKvNiI0k+pbXtLPi/hSaefohU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hATTHYgMh3imV+3bwvMMAhduTGCmuogeli26zojVAwtxc7/GL8OhB6aL29CQxiazs
         gDMqq9tIqPoKB5sIiiSozYFJF2IEUN5753cUQF4/NEJjMA9jV7pGWI6nt6IwTpLfyN
         iWbfvKDjWZ90qYAAXwsa7YuqWSUgy/Or7qFWK7e0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200918144854eucas1p1298290dbd811fcf2d45b88241bba6aca~16C_0FF3p1092510925eucas1p1Y;
        Fri, 18 Sep 2020 14:48:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id AF.30.06456.6D8C46F5; Fri, 18
        Sep 2020 15:48:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200918144853eucas1p262f37bb7353e97bacfd2df2449622bef~16C_Yz5jl3250032500eucas1p2d;
        Fri, 18 Sep 2020 14:48:53 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200918144853eusmtrp118679cc76acb9f08e145fc11da5fb361~16C_YSjI31892418924eusmtrp1C;
        Fri, 18 Sep 2020 14:48:53 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-16-5f64c8d6ea73
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 39.2E.06314.5D8C46F5; Fri, 18
        Sep 2020 15:48:53 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200918144853eusmtip1568b4f3f1bf310b2acc54f09d1a59d19~16C94MclU1559115591eusmtip1b;
        Fri, 18 Sep 2020 14:48:53 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2 3/4] media: platform: s5p-mfc: properly assign device to
 both vb2 queues
Date:   Fri, 18 Sep 2020 16:48:32 +0200
Message-Id: <20200918144833.14618-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918144833.14618-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphleLIzCtJLcpLzFFi42LZduzned1rJ1LiDc5vZbfYOGM9q8X58xvY
        LXo2bGW1mHF+H5PF2iN32S2WbfrDZHHwwxNWi/anL5ktPrf+Y3Pg9Fgzbw2jx+yGiywem1Z1
        snn0bVnF6PF5k1wAaxSXTUpqTmZZapG+XQJXxuzLa1kK3nBUzFq2haWBcRd7FyMnh4SAicSx
        DzeYuhi5OIQEVjBKfJq6jBEkISTwhVFi2+VECPszo0TDFwOYhkmPPkA1LGeU2DPhBAuEA9Qw
        8+cTVpAqNgFDia63XWwgtoiAk8TCWX/ZQYqYBTYxSex6A9LOySEsECuxfcZRsHUsAqoSm8+/
        B4pzcPAK2ErsuScOsU1eYvWGA8wgYU4BO4mrTZYgYyQE/rNJdD7pZ4OocZGY+ushI4QtLPHq
        +Bao12QkTk/uYYFoaGaUeHhuLTuE08MocblpBlSHtcSdc7/YQDYwC2hKrN+lDxF2lPh6cjc7
        SFhCgE/ixltBkDAzkDlp23RmiDCvREebEES1msSs4+vg1h68cIkZwvaQ6D68ih0SPhMZJbq2
        9zNPYJSfhbBsASPjKkbx1NLi3PTUYsO81HK94sTc4tK8dL3k/NxNjMC0cfrf8U87GL9eSjrE
        KMDBqMTD+2NNSrwQa2JZcWXuIUYJDmYlEV6ns6fjhHhTEiurUovy44tKc1KLDzFKc7AoifMa
        L3oZKySQnliSmp2aWpBaBJNl4uCUamBc7dHbueze/hghBrHyhHmHam8+cVrXdkMlmmnh4n1P
        rmRvP2LsLHM4o9UwpPyuanpZ6KL2BsPlfjX7e51LemuSxfbffsi007r5rO+vi+cP/J0t9X7L
        7nbOa93tQRvtEzY5HNx06X9zWezlg/Em0ZVFgrteNgWGcu303l1mKa1d+SJVSTMtZYISS3FG
        oqEWc1FxIgDNdaa/FwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRmVeSWpSXmKPExsVy+t/xu7pXT6TEG0yZo2axccZ6Vovz5zew
        W/Rs2MpqMeP8PiaLtUfuslss2/SHyeLghyesFu1PXzJbfG79x+bA6bFm3hpGj9kNF1k8Nq3q
        ZPPo27KK0ePzJrkA1ig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TU
        nMyy1CJ9uwS9jNmX17IUvOGomLVsC0sD4y72LkZODgkBE4lJjz4wgdhCAksZJV6cF4SIy0ic
        nNbACmELS/y51sXWxcgFVPOJUeLb85dgDWwChhJdb0ESnBwiAi4S+/c8ZQYpYhbYxiTxa+si
        sCJhgWiJtT8+g21jEVCV2Hz+PVCcg4NXwFZizz1xiAXyEqs3HGAGCXMK2ElcbbKEuMdWonXJ
        ErYJjHwLGBlWMYqklhbnpucWG+oVJ+YWl+al6yXn525iBAbxtmM/N+9gvLQx+BCjAAejEg/v
        i3kp8UKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxKLcqPLyrNSS0+xGgKdNJEZinR5HxghOWV
        xBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamBUs0yeMjE37+dyzobq
        LO8py88uLFhxbavczNiwOHZJo20WXnbvXj5zfcDXLpV4J/tnjvvmIzk2R9fouGzMfNlWfOQ+
        x6NGh1kxLJKsK4X1j02f8De0IXb//Z1Hr9505Vr4+ZJVcvI+t4SwgqthYvuZnjU6WO09w8Z/
        xkI5eP66VbqPHlXorL6mxFKckWioxVxUnAgAaLvFgXgCAAA=
X-CMS-MailID: 20200918144853eucas1p262f37bb7353e97bacfd2df2449622bef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200918144853eucas1p262f37bb7353e97bacfd2df2449622bef
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200918144853eucas1p262f37bb7353e97bacfd2df2449622bef
References: <20200918144833.14618-1-m.szyprowski@samsung.com>
        <CGME20200918144853eucas1p262f37bb7353e97bacfd2df2449622bef@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Properly set device pointers in videobuf2 queues, so the videobuf2
debugging messages will be prefixed with the respective device name.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/s5p-mfc/s5p_mfc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
index eba2b9f040df..4e50c342b322 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -844,6 +844,7 @@ static int s5p_mfc_open(struct file *file)
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	q->drv_priv = &ctx->fh;
 	q->lock = &dev->mfc_mutex;
+	q->dev = &dev->plat_dev->dev;
 	if (vdev == dev->vfd_dec) {
 		q->io_modes = VB2_MMAP;
 		q->ops = get_dec_queue_ops();
@@ -871,6 +872,7 @@ static int s5p_mfc_open(struct file *file)
 	q->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 	q->drv_priv = &ctx->fh;
 	q->lock = &dev->mfc_mutex;
+	q->dev = &dev->plat_dev->dev;
 	if (vdev == dev->vfd_dec) {
 		q->io_modes = VB2_MMAP;
 		q->ops = get_dec_queue_ops();
-- 
2.17.1

