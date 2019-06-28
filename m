Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59C7059193
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 04:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727165AbfF1Cr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 22:47:56 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34319 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfF1Crz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 22:47:55 -0400
Received: by mail-pf1-f194.google.com with SMTP id c85so2202746pfc.1;
        Thu, 27 Jun 2019 19:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=6aVVFTG6J+mdEsYXUboxldScMRbRZCxioRYOiLEnKqo=;
        b=jkXS095oU0EJo69ErmIu2wtcYOP1wRsvlgLdQCfZ5Pv2Zh/7gShFRVIXqJcELmd9Qr
         1BTNahLebCv7Yp99CNXI3P0SNaADHCbW7EZBdeOYXI4hwsdlzEpp+QeEq9CEQ+0buno7
         Ewr3L3245KLVjBcBvkYSf9mxVdzetjaByD9iCF0rYL0qAwwNQFy3lASxtoMeC2QyrSUA
         zgDP4trJVupB4rSAy1wimgi6dvK0RW3lk8FmZeGCjhkPpEV6uVv6amT6NQkMX9Sv4z5f
         oCX0WCKLCsXkCR10WY55sfGOxFeUIUjx3e9IkITJ3vHuIlvwsFCiR9m3AUfzf0hSf+cT
         9lTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6aVVFTG6J+mdEsYXUboxldScMRbRZCxioRYOiLEnKqo=;
        b=NAsNGvkLf2GDdOYqR0dVVfikXxkquKQ6IPgqKso68qdbCbtuTXHXSxjc1pr8KVfxQX
         nh8+l6Z6VXm+T1IL4vGTZCI5hoAn3/CpcoSMpDgXzK+x6wbOtdGARzp8BeBjiDtWJEAr
         s24xG6+rvIC3ZHB8P2vBWIAU5V5CsgsNKU1nh/UV52N6AxyswvH2U5MYKk6YPDwPItoW
         JVBiatNcKcYLVa2Pth+LxrBTe7kdWQZtisr8Z/8eux7/VbU+SFVjX7L/Ba2oEZcY9cA6
         3eHWZXy+FbkPkCbE6Eqw9QsUe7+vkSjKA4BTZ6KMk/9h/Zf9Nk48hNImaAsR21TUXi+u
         iSKw==
X-Gm-Message-State: APjAAAUYanl2JvFUIUgjtqnrqUmb0ZSyDetsZyBMCCHkMWEAm6o0o1fw
        QqS2D/Z2eIYodzIqbMf0lqE=
X-Google-Smtp-Source: APXvYqztbcHxq0I2L5B3UFUCS5LeG8dAI4heG4E4Zv6OJyvw7TJjS519CqekfItIYensQjICjYysWA==
X-Received: by 2002:a63:a48:: with SMTP id z8mr6935646pgk.91.1561690075033;
        Thu, 27 Jun 2019 19:47:55 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id c130sm450104pfc.184.2019.06.27.19.47.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 19:47:54 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Fuqian Huang <huangfq.daxian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 11/27] media: remove memset after dma_alloc_coherent/pci_alloc_consistent
Date:   Fri, 28 Jun 2019 10:47:43 +0800
Message-Id: <20190628024744.15367-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pci_alloc_consistent calls dma_alloc_coherent directly.
In commit af7ddd8a627c
("Merge tag 'dma-mapping-4.21' of git://git.infradead.org/users/hch/dma-mapping"),
dma_alloc_coherent has already zeroed the memory.
So memset after these 2 functions is not needed.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/media/pci/ngene/ngene-core.c        | 4 ----
 drivers/media/platform/exynos4-is/fimc-is.c | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/media/pci/ngene/ngene-core.c b/drivers/media/pci/ngene/ngene-core.c
index b75ab7d29226..af15ca1c501b 100644
--- a/drivers/media/pci/ngene/ngene-core.c
+++ b/drivers/media/pci/ngene/ngene-core.c
@@ -854,8 +854,6 @@ static int create_ring_buffer(struct pci_dev *pci_dev,
 	if (!Head)
 		return -ENOMEM;
 
-	memset(Head, 0, MemSize);
-
 	PARingBufferCur = PARingBufferHead;
 	Cur = Head;
 
@@ -907,8 +905,6 @@ static int AllocateRingBuffers(struct pci_dev *pci_dev,
 	if (SCListMem == NULL)
 		return -ENOMEM;
 
-	memset(SCListMem, 0, SCListMemSize);
-
 	pRingBuffer->SCListMem = SCListMem;
 	pRingBuffer->PASCListMem = PASCListMem;
 	pRingBuffer->SCListMemSize = SCListMemSize;
diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index e043d55133a3..77633e356305 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/exynos4-is/fimc-is.c
@@ -341,7 +341,6 @@ static int fimc_is_alloc_cpu_memory(struct fimc_is *is)
 		return -ENOMEM;
 
 	is->memory.size = FIMC_IS_CPU_MEM_SIZE;
-	memset(is->memory.vaddr, 0, is->memory.size);
 
 	dev_info(dev, "FIMC-IS CPU memory base: %#x\n", (u32)is->memory.paddr);
 
-- 
2.11.0

