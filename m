Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B23270023
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 16:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgIROsz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 10:48:55 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44479 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgIROsz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 10:48:55 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200918144853euoutp0292e3ba181ea1011c0f7647db85cbb40b~16C926xp12946929469euoutp02f
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2020 14:48:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200918144853euoutp0292e3ba181ea1011c0f7647db85cbb40b~16C926xp12946929469euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600440533;
        bh=KlhMUIQ5/bwiD7iSzIaRpEIKt/hwlmfb9lev76Lshro=;
        h=From:To:Cc:Subject:Date:References:From;
        b=FveesKjtcPr/FjhBwZAsY9iOG3qjaUiL2XvH/Tw6g5ENQK6jhdOwBbC2+VV/nwB0M
         P9/rh6ZtdvweL1aaEoKQbv3GCh6nPRahRG/I1aHCnIXVJ9sw8uzkCnHFwkgUSSxhEQ
         1zKuHXGQqAFp3/qUJZ7EdZSKQA8g1tIzC1D/KwGQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200918144852eucas1p17331733b574bd31b7e36a10a19a77b05~16C9mnJc62770527705eucas1p11;
        Fri, 18 Sep 2020 14:48:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 0E.30.06456.4D8C46F5; Fri, 18
        Sep 2020 15:48:52 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200918144852eucas1p2cd6ec1d5fb76d5c472a7ff966e0c3e8e~16C9IK_Ze1176911769eucas1p2P;
        Fri, 18 Sep 2020 14:48:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200918144852eusmtrp2ab6d2a34a8907d4836720cee400335a3~16C9He8dj2279922799eusmtrp2p;
        Fri, 18 Sep 2020 14:48:52 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-10-5f64c8d48053
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 5C.4F.06017.4D8C46F5; Fri, 18
        Sep 2020 15:48:52 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200918144851eusmtip15c5fbe68eafb4be84d0e675f166b5619~16C8l6l0G1559115591eusmtip1a;
        Fri, 18 Sep 2020 14:48:51 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2 0/4] Exynos4 media drivers: adapt for the planned ARM
 IOMMU-DMA changes
Date:   Fri, 18 Sep 2020 16:48:29 +0200
Message-Id: <20200918144833.14618-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOIsWRmVeSWpSXmKPExsWy7djPc7pXTqTEG8zcY2ixccZ6Vovz5zew
        W/Rs2MpqMeP8PiaLtUfuslss2/SHyeLghyesFu1PXzJbfG79x+bA6bFm3hpGj9kNF1k8Nq3q
        ZPPo27KK0ePzJrkA1igum5TUnMyy1CJ9uwSujBmnW5kK7vJVdHz3aWBcx9PFyMkhIWAi0Tep
        ha2LkYtDSGAFo8THBfugnC+MEr/+rWOCcD4zSly8fo25i5EDrOXRsmKI+HJGiUV3r7GAjALr
        6GngBLHZBAwlut52sYHYIgJOEgtn/WUHaWAW2MQksevNByaQhLBAjMTjrfPYQWwWAVWJjVM3
        MILYvAK2Ei8uzGKGuE9eYvWGA8wgzRICr9kkjj3awgSRcJFYtHIGG4QtLPHq+BZ2CFtG4v/O
        +UwQDc2MEg/PrWWHcHoYJS43zWCEqLKWuHPuFxvIP8wCmhLrd+lDhB0lJl07ygLxJp/EjbeC
        IGFmIHPStulQ3/NKdLQJQVSrScw6vg5u7cELl6Bu9pD4e2g2WLmQQKzEz/ueExjlZiGsWsDI
        uIpRPLW0ODc9tdgwL7Vcrzgxt7g0L10vOT93EyMwOZz+d/zTDsavl5IOMQpwMCrx8P5YkxIv
        xJpYVlyZe4hRgoNZSYTX6ezpOCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8xotexgoJpCeWpGan
        phakFsFkmTg4pRoYFzo23OBVU7S7zrll/1HXnXsrmFjk5pvdrLmlEjdpsVndzHcXD36+3yTN
        v5xP/SD/kU0nr9r1tp+KfCm+elZzdQvzkzVHjm5h5ld8K8N36fbdnpcXH4swzDfIlApru2i6
        8H/AgrKYY2cjGPICUlt2qMscW8/8edLesG+t2/LbtjY8ttHcumlnjxJLcUaioRZzUXEiAGuz
        0SoKAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHLMWRmVeSWpSXmKPExsVy+t/xu7pXTqTEG1xYJmixccZ6Vovz5zew
        W/Rs2MpqMeP8PiaLtUfuslss2/SHyeLghyesFu1PXzJbfG79x+bA6bFm3hpGj9kNF1k8Nq3q
        ZPPo27KK0ePzJrkA1ig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TU
        nMyy1CJ9uwS9jBmnW5kK7vJVdHz3aWBcx9PFyMEhIWAi8WhZcRcjF4eQwFJGienL77J2MXIC
        xWUkTk5rgLKFJf5c62KDKPrEKPG66xE7SIJNwFCi6y1IgpNDRMBFYv+ep8wgRcwC25gkfm1d
        xASSEBaIknj+ejJYA4uAqsTGqRsYQWxeAVuJFxdmMUNskJdYveEA8wRGngWMDKsYRVJLi3PT
        c4uN9IoTc4tL89L1kvNzNzECw3LbsZ9bdjB2vQs+xCjAwajEw/tiXkq8EGtiWXFl7iFGCQ5m
        JRFep7On44R4UxIrq1KL8uOLSnNSiw8xmgItn8gsJZqcD4yZvJJ4Q1NDcwtLQ3Njc2MzCyVx
        3g6BgzFCAumJJanZqakFqUUwfUwcnFLAwDrZculO6LtQmXuxK+YGGLkWWF3MtjzIfOYZ4/S2
        +eGiTdsk9s9zOHTzHteNgIoVyxrNnLd80Era+ffC42un62P8Drx4zL7vo+Smzettnq0oPrZ5
        4zZmliXuWcLH4o1fT7r1xkTjaleip8WK1QoRCTG3qxv/1ay222Iq3XrpRuvceUu6HVesmqHE
        UpyRaKjFXFScCADcuVVoYQIAAA==
X-CMS-MailID: 20200918144852eucas1p2cd6ec1d5fb76d5c472a7ff966e0c3e8e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200918144852eucas1p2cd6ec1d5fb76d5c472a7ff966e0c3e8e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200918144852eucas1p2cd6ec1d5fb76d5c472a7ff966e0c3e8e
References: <CGME20200918144852eucas1p2cd6ec1d5fb76d5c472a7ff966e0c3e8e@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This patchset updates Exynos4-IS and S5P-MFC drivers for the planned
kernel changes in the area of ARM DMA-mapping and IOMMU integration [1].
Those patches are intedependent, they can be applied separately from the
ARM DMA-mapping changes.

Best regards,
Marek Szyprowski


References:

[1] https://lore.kernel.org/lkml/cover.1597931875.git.robin.murphy@arm.com/


Changelog:

v2:
- added patch for S5P-MFC driver
- simplified code for Exynos4-IS (use the iommu_get_domain_for_dev()
  instead of creating a separate domain)

v1: https://lore.kernel.org/linux-samsung-soc/20200915133256.1210-1-m.szyprowski@samsung.com/T/#t
- initial version (only Exynos4-IS patch)

Patch summary:

Marek Szyprowski (4):
  media: platform: exynos4-is: remove all references to physicall
    addresses
  media: platform: exynos4-is: add support for generic IOMMU-DMA glue
    code
  media: platform: s5p-mfc: properly assign device to both vb2 queues
  media: platform: s5p-mfc: add support for generic DMA-IOMMU glue code

 .../media/platform/exynos4-is/fimc-capture.c  |  6 +-
 drivers/media/platform/exynos4-is/fimc-core.c | 28 ++++----
 drivers/media/platform/exynos4-is/fimc-core.h | 18 ++---
 drivers/media/platform/exynos4-is/fimc-is.c   | 72 +++++++++++++++----
 drivers/media/platform/exynos4-is/fimc-is.h   |  8 ++-
 .../media/platform/exynos4-is/fimc-lite-reg.c |  4 +-
 drivers/media/platform/exynos4-is/fimc-lite.c |  2 +-
 drivers/media/platform/exynos4-is/fimc-lite.h |  4 +-
 drivers/media/platform/exynos4-is/fimc-m2m.c  |  8 +--
 drivers/media/platform/exynos4-is/fimc-reg.c  | 18 ++---
 drivers/media/platform/exynos4-is/fimc-reg.h  |  4 +-
 drivers/media/platform/s5p-mfc/s5p_mfc.c      | 37 +++++++++-
 .../media/platform/s5p-mfc/s5p_mfc_common.h   |  2 +
 13 files changed, 148 insertions(+), 63 deletions(-)

-- 
2.17.1

