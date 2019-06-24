Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22D1750E3D
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 16:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729866AbfFXOdw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 10:33:52 -0400
Received: from mail-vs1-f74.google.com ([209.85.217.74]:41418 "EHLO
        mail-vs1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729836AbfFXOdv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 10:33:51 -0400
Received: by mail-vs1-f74.google.com with SMTP id a200so3919687vsd.8
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2019 07:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=/YALAWfXM1Ec4B1lOAT/D+NA+cyFiVncn64tZ/r98OM=;
        b=Ql48XStLri/shxEZnh2m2bPKZuWW0LbLVZb7Ke39XzoW6tnlHJqvY/w3tAOiQXd+HY
         +m0w0vy4Nc92IOCtwaAefDtVWKaMPae0qEokqCFh/15Etg3mPj9l+0y/QojMsq+32GDL
         FCc4x1guuctj7Dh9w2rpqoJJMnqXSJhRdYAnuBaH1m5ApCPzHjNZOJsEgqVYOMqcq1IK
         z4bmcgqikB0YNciNmYj3+oZnFq+Z3IRAKc7+MbjrKJ0m2yo/N7qQZlR4Wduu+I3SYaAM
         An3oELmPbKJBGAW9gnsznPT0Ku3QQIngN9+ygpAFQEEHuUfYflrAf46HUzwiWP0xvwhX
         EWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=/YALAWfXM1Ec4B1lOAT/D+NA+cyFiVncn64tZ/r98OM=;
        b=pNinrmD7t/Ri5zgfeU+NnOZ0uKL+NYLWYkNMeyvs5DC3GdcA0sIXCArjNpU/cA3eFI
         Nl8X8yzqJeK7xj+baoL23T859Cp78jOqyRVyfXPqh7r7uk+T2bgwTWIMLfw4/WeSEDXf
         E2I7yDfXCv2Y7cVPCZPJjnq7oi415iY37ISXf+lv4FP2kWbhh1evlQlLy6MOJcEzL9nz
         MjkRAaw/tRku3xe3/QU4CeWgGuQ5jLT4OSINNv4ytNNfplFrdtTVH3CeBrEZwYkMEuZz
         IPd6kI6s7r0en+mIzYYZpDgwTb3pnHjMyZo90356XGuOkbTMqg+trnyysmSsJ43c3LoI
         cE1Q==
X-Gm-Message-State: APjAAAXsMAAiEZRSL0fw2DPh/fvRt6CRpr1aaTK7/o2pgtIICorCySQA
        RwxoxCxOp3QWDg3Uktxr4qU5s/sEtoP6ykoE
X-Google-Smtp-Source: APXvYqzcPL+MfuI0G9Nd/HSZW5720Hxob5Qe3sb32I8/yavc0Ub0kNUbvXmDnUxRuwL2tRyo+O0TaelZxw+BF2mv
X-Received: by 2002:a1f:7dc2:: with SMTP id y185mr1688822vkc.51.1561386830607;
 Mon, 24 Jun 2019 07:33:50 -0700 (PDT)
Date:   Mon, 24 Jun 2019 16:32:59 +0200
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
Message-Id: <125994bfab8f29da8f58c8fcd0d94ef4bf55b3ea.1561386715.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v18 14/15] vfio/type1: untag user pointers in vaddr_get_pfn
From:   Andrey Konovalov <andreyknvl@google.com>
To:     linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Leon Romanovsky <leon@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Khalid Aziz <khalid.aziz@oracle.com>, enh <enh@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is a part of a series that extends kernel ABI to allow to pass
tagged user pointers (with the top byte set to something else other than
0x00) as syscall arguments.

vaddr_get_pfn() uses provided user pointers for vma lookups, which can
only by done with untagged pointers.

Untag user pointers in this function.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/vfio/vfio_iommu_type1.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index add34adfadc7..7b8283e33d10 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -381,6 +381,8 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
 
 	down_read(&mm->mmap_sem);
 
+	vaddr = untagged_addr(vaddr);
+
 	vma = find_vma_intersection(mm, vaddr, vaddr + 1);
 
 	if (vma && vma->vm_flags & VM_PFNMAP) {
-- 
2.22.0.410.gd8fdbe21b5-goog

