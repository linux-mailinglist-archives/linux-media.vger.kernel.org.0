Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6029E278AA5
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 16:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728997AbgIYOMd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 10:12:33 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50583 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728960AbgIYOMd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 10:12:33 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200925141232euoutp011aa9ca7927073af6db964376c58266b4~4DEOg5pCz1102011020euoutp01l
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 14:12:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200925141232euoutp011aa9ca7927073af6db964376c58266b4~4DEOg5pCz1102011020euoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601043152;
        bh=09pv1gfbrMxHYJO8AD2snW5aXubFJIYR4lyEPqOH5uU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VjaUG617xjpS25xHY+2VFzQl2odlMBm65cz5PGEeXU08wEE9pZ/qW13B0SPqT0kru
         G+jd1sq7hMKaX1w99LfqXun38Lh1Fnp3A82MAj4qwqJUiGuI63nRzS9JpZHSC3mlW+
         hNVAyJHqupO6778Su8pTHRaPVGYyTym+/3Zjkq1c=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200925141231eucas1p20d3233eb3232f4d36c19cfa361272ddf~4DEOAP91c3256732567eucas1p2i;
        Fri, 25 Sep 2020 14:12:31 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id CB.E4.06456.FCAFD6F5; Fri, 25
        Sep 2020 15:12:31 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200925141231eucas1p223c342cc989df23e4fc28d97fe3010c5~4DENtkpoZ3253732537eucas1p2z;
        Fri, 25 Sep 2020 14:12:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200925141231eusmtrp2883de88f9ea00225cba96e6eb43335bb~4DENs9Nam2598725987eusmtrp2i;
        Fri, 25 Sep 2020 14:12:31 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-5b-5f6dfacfef32
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id FE.39.06314.FCAFD6F5; Fri, 25
        Sep 2020 15:12:31 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200925141230eusmtip1b4b74b11e2277e18fef6a5019d2e2f2b~4DENMB_3U1229912299eusmtip1y;
        Fri, 25 Sep 2020 14:12:30 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     Linux IOMMU <iommu@lists.linux-foundation.org>,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Christoph Hellwig <hch@lst.de>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] dma-mapping: add DMA_ATTR_LOW_ADDRESS attribute
Date:   Fri, 25 Sep 2020 16:12:11 +0200
Message-Id: <20200925141218.13550-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925141218.13550-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSbUhTURjHObu7d3fD2W0KniwTBgUaqbOgC5ZYWtz6EFKSINS85UWtTWXz
        JQVrJL4NNU2wobZsOa053RLzZVq5ZToyNd9AwUBjFgZaqYGt1Dav2pfD7zzn9/yfw+HgiEiH
        +uLJKemMIoWWiTEBt73/9/DREadcGqKv9SNfaEwo+bzpHYesexNGFteYeeTIiGsZt9RiZIn5
        JUpqRl5zyOa+TzzS+sOBkoXzCwi5kr+BRXhQDquWQxm1RkDVqEa5VKuhGKMqpxoB1T2twqiy
        NgOgVloPRuNxgpMJjCw5k1EEh8cLkkz6ejRtiX970rbIU4FSXA34OCSOw8H3E5gaCHAR8QzA
        PKuVy25WAeyoesJxWyJiBUBbYehOh7OhgsdKjQC+qp/g7HaYR/sRt4UREqheVLtycdybSIcN
        dk+3gxAODuxZZ1O9iCj4p8nCdTOXOATtk28xNwuJU7D8wybKTvOHTeberUw+EQ7nRnuBOwgS
        Bh4sKp3nsVIUtGvyuSx7wW8Dbdv1A3Cz6zGHbcgDcG64mcduSgAcv6cBrBUGZ4adW1dFiABo
        sgS7ERKnoa4YY9ETTi3udcuICx+0P0TYshAWFYjYjMOweqBld6r14xjCMgWd6+Pb71MBYMHc
        GFYO/Kv/z6oDwAB8mAylPJFRSlKYrCAlLVdmpCQG3UiVtwLXzxncGFjuBL/GrtsAgQOxh9D+
        WS4VoXSmMltuAxBHxN7CM0OD10TCBDo7h1GkShUZMkZpA/txrthHeEy3cFVEJNLpzC2GSWMU
        O6ccnO+rAkVPRbP7JtaIjcrL2khkMPdCeKihz0+fUSMJqTQ6pg3GwLI7X+9Xe6/pogXxjm5H
        oFoR15JgydXHRlIr9BfZ7KW1mObZPTnxd6d7vms9TvycsbbNS8/ZV88uddou/s3MvlIVYfGi
        Olrab5pM0V0VsoD1LMOj82hIbMxy5pEhnZirTKIlgYhCSf8DmeqdJDUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42I5/e/4Xd3zv3LjDbpO8VpsnLGe1WLl6qNM
        Fgv2W1t0zt7AbnH+PJC4vGsOm0XPhq2sFjPO72OyWHvkLrvFwQ9PWC3an75ktvjc+o/Ngcfj
        ycF5TB5r5q1h9JjdcJHFY9OqTjaPyTeWM3rsvtnA5tG3ZRWjx+dNcgEcUXo2RfmlJakKGfnF
        JbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZ65cuYS14x1lx9dBb9gbG
        Xo4uRk4OCQETiV/LJrJ3MXJxCAksZZT4eOQcM0RCRuLktAZWCFtY4s+1LjaIok+MEls2HWUD
        SbAJGEp0ve0Cs0UEyiQ6rmxlBiliFnjDJHH31Q92kISwgIvE79W7WEBsFgFViRNXD4M18ArY
        Skw48x9qg7zE6g0HwDZzCthJPLx4gLGLkQNom63E/odOExj5FjAyrGIUSS0tzk3PLTbUK07M
        LS7NS9dLzs/dxAiMgW3Hfm7ewXhpY/AhRgEORiUe3hOPcuOFWBPLiitzDzFKcDArifA6nT0d
        J8SbklhZlVqUH19UmpNafIjRFOimicxSosn5wPjMK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMk
        kJ5YkpqdmlqQWgTTx8TBKdXA6PJgjXyaSIa8D9MpcVaDHQzdzz2OflwRwXT5okTF3V/fKqW0
        6grcMhmeie+crLN49dfZ7DOF/ZaKSbv0PA7Y2ONSY+1fdODhHPsQ+9JME/+5XwQ9Yw5cMNqj
        eHfaDe64e5tX9CamWEXPdV+pqRoWlDTrftmRxgfmEknsnDfnTFycrxtkZh2mxFKckWioxVxU
        nAgAEI6bVpcCAAA=
X-CMS-MailID: 20200925141231eucas1p223c342cc989df23e4fc28d97fe3010c5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200925141231eucas1p223c342cc989df23e4fc28d97fe3010c5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200925141231eucas1p223c342cc989df23e4fc28d97fe3010c5
References: <20200925141218.13550-1-m.szyprowski@samsung.com>
        <CGME20200925141231eucas1p223c342cc989df23e4fc28d97fe3010c5@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some devices require to allocate a special buffer (usually for the
firmware) just at the beginning of the address space to ensure that all
further allocations can be expressed as a positive offset from that
special buffer. When IOMMU is used for managing the DMA address space,
such requirement can be easily fulfilled, simply by enforcing the
'first-fit' IOVA allocation algorithm.

This patch adds a DMA attribute for such case.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 include/linux/dma-mapping.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index bb138ac6f5e6..c8c568ba375b 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -66,6 +66,12 @@
  * at least read-only at lesser-privileged levels).
  */
 #define DMA_ATTR_PRIVILEGED		(1UL << 9)
+/*
+ * DMA_ATTR_LOW_ADDRESS: used to indicate that the buffer should be allocated
+ * at the lowest possible DMA address, usually just at the beginning of the
+ * DMA/IOVA address space ('first-fit' allocation algorithm).
+ */
+#define DMA_ATTR_LOW_ADDRESS		(1UL << 10)
 
 /*
  * A dma_addr_t can hold any valid DMA or bus address for the platform.
-- 
2.17.1

