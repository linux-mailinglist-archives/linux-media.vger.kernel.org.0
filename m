Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C644426B7F5
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 02:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgIPAdB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 20:33:01 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47057 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgIONnK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 09:43:10 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200915133308euoutp02adc1398ed3f553c4f584bcb8d43c82c1~0_E_yyNfM1387513875euoutp02N
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2020 13:33:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200915133308euoutp02adc1398ed3f553c4f584bcb8d43c82c1~0_E_yyNfM1387513875euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600176788;
        bh=aCmn9Ak4bEbvr1/sdV2tQtGRlMYwWNIVBMKU464Jy4g=;
        h=From:To:Cc:Subject:Date:References:From;
        b=bggXbn95koPqKmlSb4pd5swQOP38tckH4pfQMBtQRbK/GPEUMAG45wrm9FVm2seEx
         uGbdjjdKHoa4ZJhEXml7WjObV5IEcU1tiRrIwIcIEMgVccXKHXk6h4V6QpVz1OuYqR
         5EqORQ8nBbmrywfD4ifddy63dmhVichGXCpiL4Zo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200915133308eucas1p1152bdf446eb089d21d0cf1f47f1bbae5~0_E_nzvwV0214102141eucas1p1b;
        Tue, 15 Sep 2020 13:33:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 58.11.05997.492C06F5; Tue, 15
        Sep 2020 14:33:08 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200915133308eucas1p2a9a4354abbe3af95f9978b7e6adbe3a1~0_E_RC9AT1220112201eucas1p2v;
        Tue, 15 Sep 2020 13:33:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200915133308eusmtrp17ffc2f06c7fc963e53c3f244c90cd876~0_E_QV8B70801708017eusmtrp1S;
        Tue, 15 Sep 2020 13:33:08 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-8d-5f60c29445f6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 40.EF.06017.492C06F5; Tue, 15
        Sep 2020 14:33:08 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200915133307eusmtip246487716a187a2d20bb45e049285b3b9~0_E91QGUQ0270202702eusmtip26;
        Tue, 15 Sep 2020 13:33:07 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 0/2] Exynos4-IS: adapt for the planned ARM IOMMU-DMA changes
Date:   Tue, 15 Sep 2020 15:32:54 +0200
Message-Id: <20200915133256.1210-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRmVeSWpSXmKPExsWy7djP87pTDiXEG1zuUrLYOGM9q8X58xvY
        LXo2bGW1mHF+H5PF2iN32S2WbfrDZHHwwxNWi/anL5kdODzWzFvD6LFpVSebR9+WVYwenzfJ
        BbBEcdmkpOZklqUW6dslcGXsPbSUpWAFZ8W9dQdZGhifs3cxcnJICJhIbJ61g62LkYtDSGAF
        o8TqyS9YIZwvjBJTWg+zQzifGSXmr3/OCNPy9dktqKrljBIb9z5ih2vpeDWRBaSKTcBQoutt
        FxuILSLgJLFw1l+wImaBPiaJK/MWs4IkhAV8JCaeewVmswioSqzdsh6omYODV8BGov9fHcQ2
        eYnVGw4wg/RKCNxmk/i8ZisLRMJFYs+zVqgvhCVeHd8CZctInJ7cwwLR0Mwo8fDcWnYIp4dR
        4nLTDKgnrCXunPvFBrKNWUBTYv0ufYiwo8TcA+vZQcISAnwSN94KgoSZgcxJ26YzQ4R5JTra
        hCCq1SRmHV8Ht/bghUvMELaHRPOhDUwgtpBArMS9nedYJzDKzULYtYCRcRWjeGppcW56arFR
        Xmq5XnFibnFpXrpecn7uJkZgOjj97/iXHYy7/iQdYhTgYFTi4U0oj48XYk0sK67MPcQowcGs
        JMLrdPZ0nBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe40UvY4UE0hNLUrNTUwtSi2CyTBycUg2M
        wue9xa/q9kvqxKq55L5TW3Rq+wnJRZXm75qzVd7/sDwY53jvV4tWPnfIj+v7ObY98jPgvmy6
        NbpIm2v+9+q1pp4Tz3x2nDzr6NVfywODNc5MnZA6wUWqR5Ej/U7efYfks7+5yjeu3hVZrm68
        ZO0yDuYVrtM90neY/9CKVL9ff0507tdsSZM9SizFGYmGWsxFxYkA5OGh0AMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKLMWRmVeSWpSXmKPExsVy+t/xe7pTDiXEGyz4wmmxccZ6Vovz5zew
        W/Rs2MpqMeP8PiaLtUfuslss2/SHyeLghyesFu1PXzI7cHismbeG0WPTqk42j74tqxg9Pm+S
        C2CJ0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MvY
        e2gpS8EKzop76w6yNDA+Z+9i5OSQEDCR+PrsFmsXIxeHkMBSRonfd36yQSRkJE5Oa2CFsIUl
        /lzrYoMo+sQo8WvKcbAiNgFDia63XWC2iICLxP49T5lBipgFJjFJ/O7fzgiSEBbwkZh47hXY
        JBYBVYm1W9azdDFycPAK2Ej0/6uDWCAvsXrDAeYJjDwLGBlWMYqklhbnpucWG+kVJ+YWl+al
        6yXn525iBAbhtmM/t+xg7HoXfIhRgINRiYc3oTw+Xog1say4MvcQowQHs5IIr9PZ03FCvCmJ
        lVWpRfnxRaU5qcWHGE2Bdk9klhJNzgdGSF5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU
        7NTUgtQimD4mDk6pBkbVP1Z/Psxw/Z25wYZnjXrsbzZW5g/rlHo2L3l86v9s9yO2iQEf+4Ne
        5iV2163zspLbs9ZOKfL+yp27bydc+nBE72XBcuV6gx8hr3Zk/+Pv7tv555htphn/rGmB0brZ
        f/d3i6iJLYzI2LpNg+fN8hkuEuvzzhTP21/FpXly+/Gda2xWL92zvuirEktxRqKhFnNRcSIA
        Wsg61lgCAAA=
X-CMS-MailID: 20200915133308eucas1p2a9a4354abbe3af95f9978b7e6adbe3a1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200915133308eucas1p2a9a4354abbe3af95f9978b7e6adbe3a1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200915133308eucas1p2a9a4354abbe3af95f9978b7e6adbe3a1
References: <CGME20200915133308eucas1p2a9a4354abbe3af95f9978b7e6adbe3a1@eucas1p2.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This patchset updates Exynos4-IS driver for the planned kernel changes in
the area of ARM DMA-mapping and IOMMU integration [1].

Best regards,
Marek Szyprowski


References:

[1] https://lore.kernel.org/lkml/cover.1597931875.git.robin.murphy@arm.com/


Patch summary:

Marek Szyprowski (2):
  media: platform: exynos4-is: remove all references to physicall
    addresses
  media: platform: exynos4-is: add support for generic IOMMU-DMA glue
    code

 .../media/platform/exynos4-is/fimc-capture.c  |  6 +-
 drivers/media/platform/exynos4-is/fimc-core.c | 28 +++---
 drivers/media/platform/exynos4-is/fimc-core.h | 18 ++--
 drivers/media/platform/exynos4-is/fimc-is.c   | 95 ++++++++++++++++---
 drivers/media/platform/exynos4-is/fimc-is.h   | 10 +-
 .../media/platform/exynos4-is/fimc-lite-reg.c |  4 +-
 drivers/media/platform/exynos4-is/fimc-lite.c |  2 +-
 drivers/media/platform/exynos4-is/fimc-lite.h |  4 +-
 drivers/media/platform/exynos4-is/fimc-m2m.c  |  8 +-
 drivers/media/platform/exynos4-is/fimc-reg.c  | 18 ++--
 drivers/media/platform/exynos4-is/fimc-reg.h  |  4 +-
 11 files changed, 135 insertions(+), 62 deletions(-)

-- 
2.17.1

