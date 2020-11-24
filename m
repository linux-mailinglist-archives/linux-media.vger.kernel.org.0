Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8D22C2044
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 09:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730785AbgKXImF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 03:42:05 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34310 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730763AbgKXImE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 03:42:04 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201124084151euoutp025228247cba93aee758f4d14f54247e9c~KZQo5qDfK2983629836euoutp02p
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 08:41:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201124084151euoutp025228247cba93aee758f4d14f54247e9c~KZQo5qDfK2983629836euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606207311;
        bh=BRDBz/1PXQEFYqUjnMgE/6S1ClYJEu5jXDZwdIJ0phs=;
        h=From:To:Cc:Subject:Date:References:From;
        b=SiGJWTBWDag0j6twfemfnPJItDPRhNUhKyPG8m6HUY9IFsBe91AAn8HEWjznK0bly
         Sm1QX5lp/qy/rb7dpQuJfkQ3PyYXtlbrnZoHjSOga3uhrrEt1Z4UsNHSmG/+uqeEv/
         4GceH6mPpaUM3yHoK7vbpiBpH9ZpWaRoL0PP6gyk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201124084151eucas1p18e310da7b81e8d84bf5303fc04860561~KZQoqfchb2223222232eucas1p18;
        Tue, 24 Nov 2020 08:41:51 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 78.55.45488.F47CCBF5; Tue, 24
        Nov 2020 08:41:51 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201124084151eucas1p1040de475ecccbe9bff2d6bcac17e000d~KZQoZ1RCJ0675406754eucas1p1N;
        Tue, 24 Nov 2020 08:41:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201124084151eusmtrp14f981bf0bc44bfc9f7a00f9dc614bf39~KZQoZNEyJ0767707677eusmtrp1j;
        Tue, 24 Nov 2020 08:41:51 +0000 (GMT)
X-AuditID: cbfec7f5-c5fff7000000b1b0-fc-5fbcc74f8307
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id C7.56.16282.F47CCBF5; Tue, 24
        Nov 2020 08:41:51 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201124084150eusmtip262a0ce7d0d58dbc8401cc7a27394253e~KZQn5Mopk2307123071eusmtip2i;
        Tue, 24 Nov 2020 08:41:50 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: platform: s5p-mfc: properly assign device to both
 vb2 queues
Date:   Tue, 24 Nov 2020 09:41:43 +0100
Message-Id: <20201124084143.12545-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsWy7djPc7r+x/fEG5z8L26xccZ6VotTk58x
        WZw/v4HdomfDVlaLGef3MVmsPXKX3WLZpj9MFu1PXzI7cHhsWtXJ5tG3ZRWjx+dNch6nvn5m
        D2CJ4rJJSc3JLEst0rdL4Mr48n0ie8Fl7orFv1YwNjC+4+xi5OSQEDCRuPH8PCOILSSwglHi
        xuQICPsLo8TRg/pdjFxA9mdGiZn3HrLANLTfa2WCSCxnlHh2+jsLhAPUsfTIAbAqNgFDia63
        XWwgtoiAk8TCWX/ZQYqYBXqYJDbd2QK2T1ggTOL9ys1gRSwCqhJH73UxdzFycPAK2Erc7JaA
        2CYvsXrDAWaQXgmBRg6JJbN/M0EkXCQW3j3KBmELS7w6voUdwpaROD25hwWioZlR4uG5tewQ
        Tg+jxOWmGYwQVdYSd879YgPZxiygKbF+lz5E2FHi8b+l7CBhCQE+iRtvBUHCzEDmpG3TmSHC
        vBIdbUIQ1WoSs46vg1t78MIlZgjbQ2L21MvMkGCMleg4f5ZpAqPcLIRdCxgZVzGKp5YW56an
        FhvnpZbrFSfmFpfmpesl5+duYgSmgtP/jn/dwbji1Ue9Q4xMHIyHGCU4mJVEeFvldsYL8aYk
        VlalFuXHF5XmpBYfYpTmYFES5921dU28kEB6YklqdmpqQWoRTJaJg1OqgSnGJGjNhLR6SZY9
        mfb/ozRFriWr3f35O/q5Se2D/KWbTgduura6LOjG2vUMJ44e2b1qW5VNzu+cT85fpfMUWTu/
        /85b1je9ZcadGo6d4ge7XZKf8JZqcXtWG5m/f7Ln67NPzmkNrY3ta8zLTySoPI29NiNqzeNj
        eiUPWdSf31fnXh+X0r6xoa4t7hfT1sl2i8z1/iYdNTuX7Bi84OSD7rc6mW55HGduJ+d5W54q
        XHXrFE+Cp3loa/NN0e/zdimUT+EzvH48LT7Geur0i1tnTXEzm8xZuvdSwKLGgIKaB47/nwqs
        stxmW31T9af/tZp7Nokfjq9dxlMlsU3geUFnZ61By79jyks1Hf4EVYY4aymxFGckGmoxFxUn
        AgDEELOldAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBLMWRmVeSWpSXmKPExsVy+t/xe7r+x/fEG2zbz2axccZ6VotTk58x
        WZw/v4HdomfDVlaLGef3MVmsPXKX3WLZpj9MFu1PXzI7cHhsWtXJ5tG3ZRWjx+dNch6nvn5m
        D2CJ0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mv4
        8n0ie8Fl7orFv1YwNjC+4+xi5OSQEDCRaL/XytTFyMUhJLCUUWLRv8UsEAkZiZPTGlghbGGJ
        P9e62CCKPjFK3H4zhwkkwSZgKNH1FiTBySEi4CKxf89TZpAiZoEJTBITVl1lBkkIC4RIbP+1
        C8xmEVCVOHqvC8jm4OAVsJW42S0BsUBeYvWGA8wTGHkWMDKsYhRJLS3OTc8tNtIrTswtLs1L
        10vOz93ECAzCbcd+btnBuPLVR71DjEwcjIcYJTiYlUR4W+V2xgvxpiRWVqUW5ccXleakFh9i
        NAVaN5FZSjQ5HxgHeSXxhmYGpoYmZpYGppZmxkrivCZH1sQLCaQnlqRmp6YWpBbB9DFxcEo1
        MHUunSa8cy3bu5YS4WWZhsGuV7Xkv+1/HHeJ3Ta+7nHw+pppvDsUNBc3i1zsn79pk7nTdhmD
        C4a/b7As+TzxUZTQUeO7HJVGtU//qOWY7D3dJ3xZYvvy607JOgxr6//83cJ379zGQwcd65f/
        SMtamC/WkyhivZPdW/KKbIfHm62TInLVVQTMPLm/q6jmfzjFemN7URvzi0yVNfP79yfUPT/x
        YvKenc/Krjg7zWXVPOcuFp1Q+OCPX3jZ3sdh2jMYd7TsXnNonVBodaOhLseZV3V/t28MMzFP
        So1g8BL5Yum8tzTf9Gf8nbBln9M9LpxPV5Y9aLPhhcILFz7D1C5zMf7fO9hf5dw/Kc+/bP7R
        NCWW4oxEQy3mouJEAFZtEGnLAgAA
X-CMS-MailID: 20201124084151eucas1p1040de475ecccbe9bff2d6bcac17e000d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201124084151eucas1p1040de475ecccbe9bff2d6bcac17e000d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201124084151eucas1p1040de475ecccbe9bff2d6bcac17e000d
References: <CGME20201124084151eucas1p1040de475ecccbe9bff2d6bcac17e000d@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Properly set device pointers in videobuf2 queues, so the videobuf2
debugging messages will be prefixed with the respective device name.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This patch was previously sent as part of "[PATCH v2 0/4] Exynos4 media
drivers: adapt for the planned ARM IOMMU-DMA changes" patchset:
https://lore.kernel.org/linux-samsung-soc/20200918144833.14618-1-m.szyprowski@samsung.com/
The IOMMU related changes are still under review, but this change is
unrelated and it makes sense to aplly it separately.
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

