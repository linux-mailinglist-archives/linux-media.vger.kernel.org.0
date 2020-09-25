Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81172278A91
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 16:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgIYOMj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 10:12:39 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50650 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729076AbgIYOMh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 10:12:37 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200925141235euoutp01f6253d84cd6f3227cffa97f254e8dac6~4DERtnYgM1102011020euoutp01u
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 14:12:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200925141235euoutp01f6253d84cd6f3227cffa97f254e8dac6~4DERtnYgM1102011020euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601043155;
        bh=WyoHT5SEz9Amsu38i1vI5h0g/DzRPuCz+HV37m4rE/0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JHN70VRT6Annnh4FHxUM8nafCP6lnQCa3ucMIgkZCJiDVhGld7mIeMMcnOos4NrBP
         qCO+EJYbPfApiSqfykrvKyRcXKn0Tuz72jtgXeG6xm8u9paS/1kVrtUmYsCzb6fXSH
         ZlLgl0g0fmlNqR+7lHm+P3wS/EtF3wDZT+VHNquo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200925141234eucas1p1385edc8c0b11f161b65e63baa9eaf358~4DERJ5gUu1940419404eucas1p1e;
        Fri, 25 Sep 2020 14:12:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id CC.49.05997.2DAFD6F5; Fri, 25
        Sep 2020 15:12:34 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200925141234eucas1p2876321230b7f0910242e0e28b3a8388b~4DEQzM1ze3255932559eucas1p2q;
        Fri, 25 Sep 2020 14:12:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200925141234eusmtrp139714b168f691a2ededd30a7ff7f959e~4DEQyhqQz1719217192eusmtrp1F;
        Fri, 25 Sep 2020 14:12:34 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-07-5f6dfad2266a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 1F.7B.06017.2DAFD6F5; Fri, 25
        Sep 2020 15:12:34 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200925141234eusmtip1cfb375be450a315315d51288ee078386~4DEQQ1Wta1699416994eusmtip1l;
        Fri, 25 Sep 2020 14:12:33 +0000 (GMT)
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
Subject: [PATCH 7/8] media: platform: exynos4-is: use DMA_ATTR_LOW_ADDRESS
Date:   Fri, 25 Sep 2020 16:12:17 +0200
Message-Id: <20200925141218.13550-8-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925141218.13550-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsWy7djP87qXfuXGG+y+Y2yxccZ6VouVq48y
        WSzYb23ROXsDu8X580Di8q45bBY9G7ayWsw4v4/JYu2Ru+wWBz88YbVof/qS2eJz6z82Bx6P
        JwfnMXmsmbeG0WN2w0UWj02rOtk8Jt9Yzuix+2YDm0ffllWMHp83yQVwRHHZpKTmZJalFunb
        JXBl3Ll0ja3gFWfFrO1bmBsYZ3F0MXJySAiYSKzp2MTYxcjFISSwglHi95EbzBDOF0aJ9d9P
        QDmfGSWeLt3JDNPS+fMaO0RiOaPEzI1nGeFaXn/byghSxSZgKNH1touti5GDQ0SgRGLZCT6Q
        GmaBJ0wSe/4uZAKpERbwkvj2ZA0LiM0ioCqx/sRTNhCbV8BWYvb9iVDb5CVWbzgAZnMK2Ek8
        vHgAbJmEwCp2iYYH09lBFkgIuEhc2RUIUS8s8er4FnYIW0bi9OQeFoj6ZkaJh+fWskM4PYwS
        l5tmMEJUWUvcOfcL7FJmAU2J9bv0IcKOEpdPXoKazydx460gSJgZyJy0bTozRJhXoqNNCKJa
        TWLW8XVwaw9euAR1vofE444TbJDwmcgocWH5RpYJjPKzEJYtYGRcxSieWlqcm55abJSXWq5X
        nJhbXJqXrpecn7uJEZh0Tv87/mUH464/SYcYBTgYlXh4FZ7mxguxJpYVV+YeYpTgYFYS4XU6
        ezpOiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/xopexQgLpiSWp2ampBalFMFkmDk6pBsa5sVHO
        Pwrsjrj8vRe94OOhsIub8iRTLsUsslKwbt81NVXnZKscZ83/4+vnLl/8fcrilAX8TF5rTrZq
        7unNu/hO8/BR7XXaM5aaero/d+Yy5v05zbZ2d26B4tx7vls/n9GfynEt0fujYYJWWOeDpppz
        n6t3hO/xSZr0Tf7Wx0ePt27K/qORvGe+EktxRqKhFnNRcSIAyQ4cADYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42I5/e/4Xd1Lv3LjDXZfkbfYOGM9q8XK1UeZ
        LBbst7bonL2B3eL8eSBxedccNoueDVtZLWac38dksfbIXXaLgx+esFq0P33JbPG59R+bA4/H
        k4PzmDzWzFvD6DG74SKLx6ZVnWwek28sZ/TYfbOBzaNvyypGj8+b5AI4ovRsivJLS1IVMvKL
        S2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQy7ly6xlbwirNi1vYtzA2M
        szi6GDk5JARMJDp/XmPvYuTiEBJYyijxrG0aM0RCRuLktAZWCFtY4s+1LjaIok+MEpsnbWYH
        SbAJGEp0vQVJcHKICJRJdFzZygxSxCzwhkni7qsfYEXCAl4S356sYQGxWQRUJdafeArWwCtg
        KzH7/kSobfISqzccALM5BewkHl48wNjFyAG0zVZi/0OnCYx8CxgZVjGKpJYW56bnFhvpFSfm
        Fpfmpesl5+duYgTGwLZjP7fsYOx6F3yIUYCDUYmHV+FpbrwQa2JZcWXuIUYJDmYlEV6ns6fj
        hHhTEiurUovy44tKc1KLDzGaAt00kVlKNDkfGJ95JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE
        0hNLUrNTUwtSi2D6mDg4pRoYd//1tj5fwVt/puPJkz9F6vv+3lj38k/HTxvXZB6XOSq9/Apl
        j3J0X+6QUKpu/vJP9efphzs+Hbw5O83haFbYZZ96p+oZjZs/q2iX3p3ar7/rR66wQ9kbs7kn
        RQrD9mvMUhLUOVx/w7FGKWLKGfFA9yRjMTsbJ6Fvk0Q0313Ju5pwZIpQttIcJZbijERDLeai
        4kQAELzNQ5cCAAA=
X-CMS-MailID: 20200925141234eucas1p2876321230b7f0910242e0e28b3a8388b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200925141234eucas1p2876321230b7f0910242e0e28b3a8388b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200925141234eucas1p2876321230b7f0910242e0e28b3a8388b
References: <20200925141218.13550-1-m.szyprowski@samsung.com>
        <CGME20200925141234eucas1p2876321230b7f0910242e0e28b3a8388b@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Exynos4-IS driver relied on the way the ARM DMA-IOMMU glue code worked -
mainly it relied on the fact that the allocator used first-fit algorithm
and the first allocated buffer were at 0x0 DMA/IOVA address. This is not
true for the generic IOMMU-DMA glue code that will be used for ARM
architecture soon, so add the needed DMA attribute to force such behavior
of the DMA-mapping code.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/exynos4-is/fimc-is.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index 41b841a96338..9d3556eae5d3 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/exynos4-is/fimc-is.c
@@ -335,8 +335,9 @@ static int fimc_is_alloc_cpu_memory(struct fimc_is *is)
 {
 	struct device *dev = &is->pdev->dev;
 
-	is->memory.vaddr = dma_alloc_coherent(dev, FIMC_IS_CPU_MEM_SIZE,
-					      &is->memory.addr, GFP_KERNEL);
+	is->memory.vaddr = dma_alloc_attrs(dev, FIMC_IS_CPU_MEM_SIZE,
+					   &is->memory.addr, GFP_KERNEL,
+					   DMA_ATTR_LOW_ADDRESS);
 	if (is->memory.vaddr == NULL)
 		return -ENOMEM;
 
-- 
2.17.1

