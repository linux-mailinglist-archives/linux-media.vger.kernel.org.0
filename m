Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23BE250E45
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 16:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729779AbfFXOdt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 10:33:49 -0400
Received: from mail-vs1-f74.google.com ([209.85.217.74]:49499 "EHLO
        mail-vs1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729737AbfFXOds (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 10:33:48 -0400
Received: by mail-vs1-f74.google.com with SMTP id b19so1895163vsq.16
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2019 07:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=cqAi+OvlHabK4r0DKR/uDYr47zBS8kkFmriW/t8FK6c=;
        b=lXHRsLKGuntJdIfx4IktI470fGbyq/kS83cL/1CQ6KcaqQfI5cgbGIOLx+on2O/XRl
         TyhQq0vCGRVG2NDDFcvggYJ0wxa3AKn2CR+yK/03NNoH4bycNdBR8ox3sdPwTeSrQLuo
         rHeW6O5U9Mg0jIkwq44zjpbQCUdfc3U4ayQ8Dr3awwdf8ADrTM4zsPAD1J2Hva/3oEGx
         iuAfMdkeDB0VVqrLEmMomvjY9gvAQgEF5ueMNKjNbD3E+c53zhezKvbXOoKR1nLLue5p
         C6JfI9UG0Qq2Dtp4qvSg2UI+NSz05kgH40lBS5dNGwoMFiWCdzLiE4V8NQ/k/pPRpCug
         2y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=cqAi+OvlHabK4r0DKR/uDYr47zBS8kkFmriW/t8FK6c=;
        b=Ihcz2UWzBeBRHJcsmNFRtLnMRze5ZeB3pMBBcMEtEifsv+ZnQme0ed+mDJaSyV8+AB
         1VkQ8P7Ng1AMcorE8Kq8Ni+JUI1BxXTKIglrVBun5IeDNfPpttVDMP6TiaGkbPFP2oGC
         KVUO+EzcYhR4q7wIFMusSakS57VWC0ZKNi5F6SuK61w2+pDkXDn73Zx5n1RfJab1b1PS
         Dw6AtVy9bpHyf11fcjhEfw3s4mqEGDy40TMiZCJUbSzbauoAIonIzzPB9cwicDHeqwzP
         5GERL+ZC9j9x+MmktFYEki1iLY+HKSiHN2PJ2ej2NqrsKyQewtINbDz8uaLLBwe40HOg
         vKzw==
X-Gm-Message-State: APjAAAX5EwmdN+3r27y9cyQje7xzBpff3EBCQIpl2So9x38yZ/51W7L9
        i1hiNa9vq5yVNdkrUjI/H2hm2pTqSK/mfPOQ
X-Google-Smtp-Source: APXvYqzY+u8RznlTrOWrBgn25HhvDfTMe7SZyf9e34JUgJZBNd08PatZvu4lGf3zfqdvX7DoXuI91wYnbBpoYfQ0
X-Received: by 2002:ab0:7848:: with SMTP id y8mr60797129uaq.58.1561386827462;
 Mon, 24 Jun 2019 07:33:47 -0700 (PDT)
Date:   Mon, 24 Jun 2019 16:32:58 +0200
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
Message-Id: <280ca5496fe82873caac306ca76fb40d702979ff.1561386715.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v18 13/15] tee/shm: untag user pointers in tee_shm_register
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
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is a part of a series that extends kernel ABI to allow to pass
tagged user pointers (with the top byte set to something else other than
0x00) as syscall arguments.

tee_shm_register()->optee_shm_unregister()->check_mem_type() uses provided
user pointers for vma lookups (via __check_mem_type()), which can only by
done with untagged pointers.

Untag user pointers in this function.

Reviewed-by: Kees Cook <keescook@chromium.org>
Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/tee/tee_shm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 2da026fd12c9..09ddcd06c715 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -254,6 +254,7 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
 	shm->teedev = teedev;
 	shm->ctx = ctx;
 	shm->id = -1;
+	addr = untagged_addr(addr);
 	start = rounddown(addr, PAGE_SIZE);
 	shm->offset = addr - start;
 	shm->size = length;
-- 
2.22.0.410.gd8fdbe21b5-goog

