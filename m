Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB95071E5C
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 20:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388684AbfGWSAK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 14:00:10 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:45241 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391398AbfGWR7t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 13:59:49 -0400
Received: by mail-qt1-f202.google.com with SMTP id l9so39007781qtu.12
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 10:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=IHvI+dZahLSsu4iMw8K110v852ALNB6rzz3nOC21G6Y=;
        b=mF8OyWPtPa27KaGkiSCnss6c8b+Y3jxSBp/iDga+MY7c9cKbX9nGHJwK2xlzSk0dvM
         46/b1IA06ke81wJzctvuMT0KvjYlT0hkwU/YFyMD3O3ZkppaxsJ6Qh96lV4fTWRGdGnB
         ViGf78WRhfhot+50mrRcEJP8ehDMTkQZYjXXgXUH6rOFs4T1KVaDzPVU6ktcbKr8zaRJ
         i3A/F+iOLc+6M6QJ7QteIj4THksgVZVnbx5C2fEtCjTVS1TOypq05pLtbtct8EtWO8pG
         Q61f0pOK8VaMaWwFM4favMJo4cb+2j4wmdeEX5CGZBr0ScIwqtpQSHdV7dFwlIUR9Dz4
         yLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=IHvI+dZahLSsu4iMw8K110v852ALNB6rzz3nOC21G6Y=;
        b=H4DavhNZrFxTZweLd/EPHYpetbAHBOk/sOp+SDKElJ+3W70sMbd5HRRR2a0od1DIcD
         KoXtDhTXPJw/N0WjLVc6Z3imzkPP7aj9pjMzxx4gKOghouHmLDmDXh7+BFDA6mFaIiuo
         W2EvqhOQ+O7SA9tzKH4DSkG2QlNi6RoyvxyR5KZxNNbC0xKj6FwodCTzBTgmHu1WzKZ0
         t+dtZJNERtpqVQRWGSaOAG89oQqXb0oyCfoQtKab+k00awuaepH49qE5g5+j4ebiwZN7
         PB51mJNALAJUHWOm5wLj/hhs+wVAx6d/0E78LLJAep1mCicp7NWPYfaivyh0BsZ8l4kM
         eCvg==
X-Gm-Message-State: APjAAAWG9xn0ypOzcZQeZdHgDIZgE3kvps1xzVr3kCU+2PD0tlI1Ax3D
        +lAhMD8PJzu3qk5+hMWVIORGw1Hk9VLsXtI9
X-Google-Smtp-Source: APXvYqzRyHp7WBTqlPGt29onShJXh3Cp/pE5/lej0P3nE1XW0gw1bUQxpG45N1NN4OdbAYc7oUndTzJUESDpF144
X-Received: by 2002:a0c:ffc5:: with SMTP id h5mr55634338qvv.43.1563904788555;
 Tue, 23 Jul 2019 10:59:48 -0700 (PDT)
Date:   Tue, 23 Jul 2019 19:58:50 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <4b993f33196b3566ac81285ff8453219e2079b45.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 13/15] tee/shm: untag user pointers in tee_shm_register
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
2.22.0.709.g102302147b-goog

