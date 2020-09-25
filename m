Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7898F278AA3
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 16:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbgIYONG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 10:13:06 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48831 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728802AbgIYOMf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 10:12:35 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200925141232euoutp028b6b225cc12ab5f800fba3ab09e8a59a~4DEPT7gxe0567505675euoutp02K
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 14:12:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200925141232euoutp028b6b225cc12ab5f800fba3ab09e8a59a~4DEPT7gxe0567505675euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601043153;
        bh=3ltQiItP68nXp8N3IBI3XXVcqofC79een0tYDl29GjA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vVRMoukXJ5HNYLbm748H4LiTBAJa0ousS/FoLUWf49ulTtpogh7VHSSK3dIhd5Y2V
         9mYe8/JrMzg0FIIi+EZJCIn5ASUj6MS8mjwrPnLhHzvnDvdzcRoSJxeWkcBD61Zr/s
         Snm7LpQRmyKDSeQ5vzQrKAmPHgNEbu04gon+RrQk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200925141232eucas1p10fb238168f0c99e32b62d941069b65fe~4DEPB2K6q1940819408eucas1p1n;
        Fri, 25 Sep 2020 14:12:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 7E.E4.06456.0DAFD6F5; Fri, 25
        Sep 2020 15:12:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200925141232eucas1p1c021913b0c2505e6c77e5078cf2be74f~4DEOvTZXi1940419404eucas1p1a;
        Fri, 25 Sep 2020 14:12:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200925141232eusmtrp284b523f34bd8d1593911fae5fa0c6843~4DEOumih02568825688eusmtrp2H;
        Fri, 25 Sep 2020 14:12:32 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-64-5f6dfad09031
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 01.49.06314.0DAFD6F5; Fri, 25
        Sep 2020 15:12:32 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200925141231eusmtip14a76b08e359f1b36da078e53a06d6557~4DEOMkMY61699716997eusmtip1l;
        Fri, 25 Sep 2020 14:12:31 +0000 (GMT)
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
Subject: [PATCH 3/8] iommu: iova: add support for 'first-fit' algorithm
Date:   Fri, 25 Sep 2020 16:12:13 +0200
Message-Id: <20200925141218.13550-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925141218.13550-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsWy7djP87oXfuXGG9yfp2axccZ6VouVq48y
        WSzYb23ROXsDu8X580Di8q45bBY9G7ayWsw4v4/JYu2Ru+wWBz88YbVof/qS2eJz6z82Bx6P
        JwfnMXmsmbeG0WN2w0UWj02rOtk8Jt9Yzuix+2YDm0ffllWMHp83yQVwRHHZpKTmZJalFunb
        JXBl7Dv2hLXgnWzF/OvzmRoYj0p0MXJwSAiYSNxsLOpi5OIQEljBKNG1/iorhPOFUWJp60Nm
        COczo8S/rn1sMB0vO0Ih4ssZJY5OuckM13HrdR9LFyMnB5uAoUTX2y6wBhGBEollJ/hAapgF
        njBJ7Pm7kAkkLizgLtH/qxCknEVAVWL3/YlgrbwCthJ7e84ygtgSAvISqzccYAaxOQXsJB5e
        PMAIMkdCYB27xPSuJhaIIheJ11c3sUPYwhKvjm+BsmUk/u+czwTR0Mwo8fDcWnYIp4dR4nLT
        DKgV1hJ3zv0Cu5RZQFNi/S59iLCjxN9ji5ggPuaTuPFWECTMDGRO2jadGSLMK9HRJgRRrSYx
        6/g6uLUHL1yCKvGQmL3JBhI8ExklOvs3MU1glJ+FsGsBI+MqRvHU0uLc9NRiw7zUcr3ixNzi
        0rx0veT83E2MwHRz+t/xTzsYv15KOsQowMGoxMN74lFuvBBrYllxZe4hRgkOZiURXqezp+OE
        eFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkrJJCeWJKanZpakFoEk2Xi4JRqYJy7ZvOClsNV
        Xy6GWE9L0O1YN8v0XsDZ6EteN4s+lLSr6Xc/07G1/OO5ViQ3RFr8/zpnlz/7fv4Jq8/iCzUN
        XZ1XH1n86ubSRzuctA/pzDN8VcnXKBh2K6yGv/DI5iXyuU9ffDSXiI1L71adEfWb8fz2k31C
        Na/L9Xy+vPuXu/Sr4cEnvzasSlViKc5INNRiLipOBAAjRxZMMwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42I5/e/4Xd0Lv3LjDQ7eFLbYOGM9q8XK1UeZ
        LBbst7bonL2B3eL8eSBxedccNoueDVtZLWac38dksfbIXXaLgx+esFq0P33JbPG59R+bA4/H
        k4PzmDzWzFvD6DG74SKLx6ZVnWwek28sZ/TYfbOBzaNvyypGj8+b5AI4ovRsivJLS1IVMvKL
        S2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQy9h17wlrwTrZi/vX5TA2M
        RyW6GDk4JARMJF52hHYxcnIICSxllNj7UxLElhCQkTg5rYEVwhaW+HOti62LkQuo5hOjxOqz
        19hBEmwChhJdb0ESnBwiAmUSHVe2MoMUMQu8YZK4++oHO8gCYQF3if5fhSA1LAKqErvvT2QB
        sXkFbCX29pxlhFggL7F6wwFmEJtTwE7i4cUDjCCtQkA1+x86TWDkW8DIsIpRJLW0ODc9t9hQ
        rzgxt7g0L10vOT93EyMw+Lcd+7l5B+OljcGHGAU4GJV4eE88yo0XYk0sK67MPcQowcGsJMLr
        dPZ0nBBvSmJlVWpRfnxRaU5q8SFGU6CbJjJLiSbnAyMzryTe0NTQ3MLS0NzY3NjMQkmct0Pg
        YIyQQHpiSWp2ampBahFMHxMHp1QDY5CPwBnv7NDUstnPZp7Q9bpVMj323tcLUbFXJzlmf2o2
        vPd12tcL70u+Nr4IjV9q5Gun4vhfa18mx8o1njtYj9nmFqXPCzhsy/1+3+RYNe7tPw7xcfap
        +n/79Pcpw7a5JWVTghOPdFVpvDjVwn2Xsc8nmSmtVr6Cv2J7+bd1By88DH+/7V7WOyWW4oxE
        Qy3mouJEAI9Y0oSUAgAA
X-CMS-MailID: 20200925141232eucas1p1c021913b0c2505e6c77e5078cf2be74f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200925141232eucas1p1c021913b0c2505e6c77e5078cf2be74f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200925141232eucas1p1c021913b0c2505e6c77e5078cf2be74f
References: <20200925141218.13550-1-m.szyprowski@samsung.com>
        <CGME20200925141232eucas1p1c021913b0c2505e6c77e5078cf2be74f@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the 'first-fit' allocation algorithm. It will be used for
the special case of implementing DMA_ATTR_LOW_ADDRESS, so this path
doesn't use IOVA cache.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/iommu/iova.c | 78 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/iova.h |  2 ++
 2 files changed, 80 insertions(+)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 87555ed1737a..0911d36f7ee5 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -227,6 +227,59 @@ static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
 	return -ENOMEM;
 }
 
+static unsigned long
+__iova_get_aligned_start(unsigned long start, unsigned long size)
+{
+	unsigned long mask = __roundup_pow_of_two(size) - 1;
+
+	return (start + mask) & ~mask;
+}
+
+static int __alloc_and_insert_iova_range_forward(struct iova_domain *iovad,
+			unsigned long size, unsigned long limit_pfn,
+			struct iova *new)
+{
+	struct rb_node *curr;
+	unsigned long flags;
+	unsigned long start, limit;
+
+	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
+
+	curr = rb_first(&iovad->rbroot);
+	limit = limit_pfn;
+	start = __iova_get_aligned_start(iovad->start_pfn, size);
+
+	while (curr) {
+		struct iova *curr_iova = rb_entry(curr, struct iova, node);
+		struct rb_node *next = rb_next(curr);
+
+		start = __iova_get_aligned_start(curr_iova->pfn_hi + 1, size);
+		if (next) {
+			struct iova *next_iova = rb_entry(next, struct iova, node);
+			limit = next_iova->pfn_lo - 1;
+		} else {
+			limit = limit_pfn;
+		}
+
+		if ((start + size) <= limit)
+			break;	/* found a free slot */
+		curr = next;
+	}
+
+	if (!curr && start + size > limit) {
+		spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
+		return -ENOMEM;
+	}
+
+	new->pfn_lo = start;
+	new->pfn_hi = new->pfn_lo + size - 1;
+	iova_insert_rbtree(&iovad->rbroot, new, curr);
+
+	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
+
+	return 0;
+}
+
 static struct kmem_cache *iova_cache;
 static unsigned int iova_cache_users;
 static DEFINE_MUTEX(iova_cache_mutex);
@@ -398,6 +451,31 @@ free_iova(struct iova_domain *iovad, unsigned long pfn)
 }
 EXPORT_SYMBOL_GPL(free_iova);
 
+/**
+ * alloc_iova_first_fit - allocates an iova from the beginning of address space
+ * @iovad: - iova domain in question
+ * @size: - size of page frames to allocate
+ * @limit_pfn: - max limit address
+ * Returns a pfn the allocated iova starts at or IOVA_BAD_ADDR in the case
+ * of a failure.
+*/
+unsigned long
+alloc_iova_first_fit(struct iova_domain *iovad, unsigned long size,
+		     unsigned long limit_pfn)
+{
+	struct iova *new_iova = alloc_iova_mem();
+
+	if (!new_iova)
+		return IOVA_BAD_ADDR;
+
+	if (__alloc_and_insert_iova_range_forward(iovad, size, limit_pfn, new_iova)) {
+		free_iova_mem(new_iova);
+		return IOVA_BAD_ADDR;
+	}
+	return new_iova->pfn_lo;
+}
+EXPORT_SYMBOL_GPL(alloc_iova_first_fit);
+
 /**
  * alloc_iova_fast - allocates an iova from rcache
  * @iovad: - iova domain in question
diff --git a/include/linux/iova.h b/include/linux/iova.h
index 69737e6bcef6..01c29044488c 100644
--- a/include/linux/iova.h
+++ b/include/linux/iova.h
@@ -152,6 +152,8 @@ void queue_iova(struct iova_domain *iovad,
 		unsigned long data);
 unsigned long alloc_iova_fast(struct iova_domain *iovad, unsigned long size,
 			      unsigned long limit_pfn, bool flush_rcache);
+unsigned long alloc_iova_first_fit(struct iova_domain *iovad, unsigned long size,
+				   unsigned long limit_pfn);
 struct iova *reserve_iova(struct iova_domain *iovad, unsigned long pfn_lo,
 	unsigned long pfn_hi);
 void copy_reserved_iova(struct iova_domain *from, struct iova_domain *to);
-- 
2.17.1

