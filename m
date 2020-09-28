Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9420A27ACC5
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 13:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgI1Lcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 07:32:50 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48702 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgI1Lct (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 07:32:49 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200928113247euoutp02a03a00c7a4b80854b6d27c3899dd6cb3~470m4gC7l1230312303euoutp02i
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 11:32:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200928113247euoutp02a03a00c7a4b80854b6d27c3899dd6cb3~470m4gC7l1230312303euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601292767;
        bh=+uo/0vdDAtG25qGjp09xK2qh3VzfFRoNQyQxfRdW754=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=YpOdnes0Yjrqe/2nD9pUx4yDJsVEH06XpDI80qW/qBwE3rogv45G29fnEEVF+r6Ee
         yoyhQHwQ+nPLYtnMvvSJ5ZP53xf/vJXJlkXfIogmz0iAwvbvVdYHGzlvSDwdQqjAn5
         Z2XpcVUnqsiQu+/SqBz/eQq02REcXoh7I2FTCNF0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200928113246eucas1p202daf455573dc6614f1285c7fcca2757~470mZVS1T1751417514eucas1p2H;
        Mon, 28 Sep 2020 11:32:46 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id BC.8B.06318.ED9C17F5; Mon, 28
        Sep 2020 12:32:46 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200928113246eucas1p12a4b178ec04da6d0b1448d42861bf78c~470l1yIz31119311193eucas1p1z;
        Mon, 28 Sep 2020 11:32:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200928113246eusmtrp21d25f691a89ecf6d64b491f43a9cda3d~470l0uE8e1717117171eusmtrp2g;
        Mon, 28 Sep 2020 11:32:46 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-ae-5f71c9de010c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id FC.80.06314.ED9C17F5; Mon, 28
        Sep 2020 12:32:46 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200928113244eusmtip2fd0487d5ac28e35d0bf3f6adfb341026~470kVFgvX0454604546eusmtip2a;
        Mon, 28 Sep 2020 11:32:44 +0000 (GMT)
Subject: Re: [PATCH 05/18] ARM/dma-mapping: Switch to iommu_dma_ops
To:     Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
        linux@armlinux.org.uk
Cc:     will@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, agross@kernel.org,
        bjorn.andersson@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, vdumpa@nvidia.com, digetx@gmail.com,
        matthias.bgg@gmail.com, yong.wu@mediatek.com,
        geert+renesas@glider.be, magnus.damm@gmail.com, t-kristo@ti.com,
        s-anna@ti.com, laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <1d4c80ef-db03-3c31-a827-ab047fe9741f@samsung.com>
Date:   Mon, 28 Sep 2020 13:32:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4b51f1685a7ff88b673bf013ca6c27501e52f9b4.1597931876.git.robin.murphy@arm.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxTHeXpv7700ltwWDCeiaJppwhKlyMyexIX5sg832RIXzT6ovFj0
        Dhpo0RacMDc7IIYyRCgx4q0CaTAoRWUFVJAXaSYNLy0ohjHWrRtgCCBiIzph+NbebfLt9z/n
        f/Kc/8nDEEoPtYbR6rN5g16TqaJk5M2eRc/mP3qPpahfvtiKPRP/kLi/6wmJ7f4JhB8+n6fw
        JasF4av2exJs8ZWRuKZrOy4UbCQ2Wxtp7M5/TGNzeS2NHRMjUlze5abxcNtFCpc0tkjxcMF9
        hCsHOyXYvCBQ2HmuA+E/7XMUzi+Mx91PJ6W4Y6lTiisrpilc+6iIwottVSQu7diLC73bsM/S
        RO6I5ia7qyRcQ1UD4oZH7hNcuXsz1yr8TnPWogtSzlFvpjjvSDvF+X50Sbim2lNcxWgd4u78
        aqK4wt4ukjtT8ITiSpvrEecavSX5UnFA9skRPlN7nDfEJhySpc+3fHzUE3HCfjnChGoUxYhh
        gP0IvHe/KEYyRsleQTDgOisRxQKCvtlBqSieIXh6x/9OhAYnOhaWCLFRh2DQ5qZFMY/APXCP
        DLjC2d0wdn2aCHAEmwRLt5eDJoJtl4LJ4guaKDYOiueKqQDL2QQYr/LSASbZjWAt7w/WV7PJ
        0NM3TooeBfRemAxyKHsQZuouBZlg10NBi5UQORLGJqsl4qpnQ+Gnoe9F/gxsD81I5HCYcTXT
        Iq+FN63VwdDAFiD4y3ONFkUJguH8yn8ntoPXs0QFTkawMXCjLVYs74TWcQctXjIMRucU4g5h
        YLl5nhDLcig6rRTdm0BwXf//2e6hB0QZUgkrkgkr0ggr0gjv361BZD2K5HOMujTeGK/nv9li
        1OiMOfq0LYezdA707pf3v3Y9v406l1OdiGWQapVc7TyWopRqjhtzdU4EDKGKkO9y9ycr5Uc0
        uXm8ISvFkJPJG50oiiFVkfJ423SSkk3TZPMZPH+UN/zXlTCha0zoB/Wzb7UxsaZGx6mckyUl
        f+u+GzuoS7gyNduUsng4ujbxWp52/jfZocSMzyv8cr9sVWvZ1AtbzKvkhqivQr5W1PmifDs/
        aAjXx5V+ui5ssW99/b6hBPtdV8/u/esi92p/KfIvqF+GbNPcWo6e6syzhKSOxWjVvdnRwurG
        9g2x+OfZPSrSmK6J+5AwGDVvAb76VTLhAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+e0+NqPRdU38Ib1YDSJodn20Y9Z6EVyIoAeBPdSGXdRyLne3
        0giSKaHLxBmVbrbER5aLMs3evhYmOk3UECvTzAVZTo0ssBfpVuB/H875fjgc+EoI2QgVIklO
        NfKGVG2Kgl5Auv+0Da0dak+LX/fs9yJ4MfqTBHfTBAnOL6MIXn6bpOGqvRDBTWerCAqHC0go
        bYqGbFsZCbn2GjF0mcfFkGutEEPtaD8F1qYuMfQ9LqEhr6aegr6sHgRF3Y0iyJ220eC61IDg
        ndNLgzk7HFqmPBQ0/GikoOjiGA0VH3JomHnsICG/YS9kD0bCcGEduWUZ52lxiLhbjluI6+vv
        IThr11ruke2tmLPnFFNcbXUuzQ32P6W54fNtIq6u4ix3caAKcU9eZdJcdnsTyV3ImqC5/HvV
        iGsbeCDaHXhQtdGgNxn5FUl6wbhJcYiFMBUbBaqwiCgVG66O3RAWqQjVbDzKpySf5A2hmiOq
        pMl69YkX8nRnpTwTlQZaUIAEMxG4YfoHYUELJDKmEuGbX8y0f7EEt1/OpPy8GP/qt9D+kBfh
        /OYpcm6xmNmOX98eI+ZYzsTi6SqnTyaYpxSu9Ib4hUGEz30f8Ak0w2KL1+ILSRkNfu8YFM8x
        ySix3er2zYOYONyZ9/FfJhC3F3t8bgBzCH+qukr6D6zHjroRws/LcVa9/R8H49eea6ICJLPN
        023zFNs8xTZPKUVkNZLzJkGXqBNYlaDVCabURFWCXleLZut1//lM3UPUe3efCzESpFgoXedK
        i5dR2pNChs6FsIRQyKXbutxxMulRbcZp3qCPN5hSeMGFImefsxIhQQn62bKmGuPZSFYNUaw6
        XB2+HhTB0hym5bCMSdQa+eM8f4I3/PdEkoCQTFROTiVpgsnN5s4jaM99W4nhnnJlREbajes7
        xBr3KUZ5Xn979c6YvKDrFzpORX0OPfbmj6Sn+2wnnbDNMzK++ivV3FGz9P3Mw9itr4ralHxY
        nKj8gMf0s2XXqpcFea1lVZN3hjZ4oydSSAZqpWYZFTOyP2Zh/ZWp9DOtvcronc2UghSStOwa
        wiBo/wJinf+vdAMAAA==
X-CMS-MailID: 20200928113246eucas1p12a4b178ec04da6d0b1448d42861bf78c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200820150917eucas1p258445fb7b4aa1da9fa605d63423aed01
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200820150917eucas1p258445fb7b4aa1da9fa605d63423aed01
References: <cover.1597931875.git.robin.murphy@arm.com>
        <CGME20200820150917eucas1p258445fb7b4aa1da9fa605d63423aed01@eucas1p2.samsung.com>
        <4b51f1685a7ff88b673bf013ca6c27501e52f9b4.1597931876.git.robin.murphy@arm.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robin,

On 20.08.2020 17:08, Robin Murphy wrote:
> With the IOMMU ops now looking much the same shape as iommu_dma_ops,
> switch them out in favour of the iommu-dma library, currently enhanced
> with temporary workarounds that allow it to also sit underneath the
> arch-specific API. With that in place, we can now start converting the
> remaining IOMMU drivers and consumers to work with IOMMU API default
> domains instead.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

I've played a bit longer with this and found that reading the kernel 
virtual address of the buffers allocated via dma_alloc_attrs() from 
dma-iommu ops gives trashes from time to time. It took me a while to 
debug this...

Your conversion misses adding arch_dma_prep_coherent() to arch/arm, so 
the buffers are cleared by the mm allocator, but the caches are NOT 
flushed for the newly allocated buffers.

This fixes the issue:

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fec3e59215b8..8b60bcc5b14f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -2,6 +2,7 @@
  config ARM
         bool
         default y
+       select ARCH_HAS_DMA_PREP_COHERENT
         select ARCH_32BIT_OFF_T
         select ARCH_HAS_BINFMT_FLAT
         select ARCH_HAS_DEBUG_VIRTUAL if MMU
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index ff6c4962161a..6954681b73da 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -266,6 +266,20 @@ static void __dma_clear_buffer(struct page *page, 
size_t size, int coherent_flag
         }
  }

+void arch_dma_prep_coherent(struct page *page, size_t size)
+{
+
+       if (PageHighMem(page)) {
+               phys_addr_t base = __pfn_to_phys(page_to_pfn(page));
+               phys_addr_t end = base + size;
+               outer_flush_range(base, end);
+       } else {
+               void *ptr = page_address(page);
+               dmac_flush_range(ptr, ptr + size);
+               outer_flush_range(__pa(ptr), __pa(ptr) + size);
+       }
+}
+
  /*
   * Allocate a DMA buffer for 'dev' of size 'size' using the
   * specified gfp mask.  Note that 'size' must be page aligned.

I also wonder if it would be better to use per-arch __dma_clear_buffer() 
instead of setting __GFP_ZERO unconditionally in dma-iommu.c. This 
should be faster on ARM with highmem...

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

