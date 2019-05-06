Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5CC15169
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 18:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbfEFQbz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 12:31:55 -0400
Received: from mail-ua1-f73.google.com ([209.85.222.73]:49577 "EHLO
        mail-ua1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727368AbfEFQby (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 May 2019 12:31:54 -0400
Received: by mail-ua1-f73.google.com with SMTP id j43so429501uae.16
        for <linux-media@vger.kernel.org>; Mon, 06 May 2019 09:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=E5WO9ODhUeb7gchIl3e11LSllsWmM1E2YpuEe+KMyVo=;
        b=ZAV3tC6ygeuQpYDYrKMnamvWU4Ola27jwmOvJT0NrB9zkA9/9VwZpqZILeD/kCkNoz
         2YieZRVMa/AXiEzwBIxCU1l+GEYmKclsxxyQTiWJfi3V4eZQV5Ty6cVbJ946qs6vtwua
         FnVZYy8h8LlcT9zEGoHGJFhxw76fNhlXkwiMMdgNAFJQ0fdrxIy60WNM3Dx5/MSJjbMm
         JoRnUusKGOL9DOHOG1d4lxStTE2KnFUHyp2053KQyza8HaWrD88UcCSEHERhBeycqSfG
         PaS1O1Y2zDlyyujLwl9tuNkVlIoFOsc0GRtgaeegMD911ZalfKNXqOUfZljQAA2/cuom
         1W3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=E5WO9ODhUeb7gchIl3e11LSllsWmM1E2YpuEe+KMyVo=;
        b=MkRH+8U0794upa7Y18Nbia4YIWta1K1X8wtm+H2gq0hE6E1KISqadBEXFQKec4UhvU
         m4TlaliIVlfM83E+m49RQqsMdclodPeB+xWb9gcZp8D5HXAkJqYt2wVmrO7hWdJDuFeH
         YTqJhlQ8lHcqLgiPRRCoH7QAv5FHUVuxY4zRVGsp6Mx1i4YRDfJUKYEdifI9oPZP6CQA
         hieu+CNdvvNm3/VjUpAuoP93U/UNSCKOwMyZAEhDOZKRZyZRubqRQ5uD/VQqqYaRCpw3
         V4EGQw9MUsX2cJ+KCA/ltUymBV+tsvJQabjKfe+PrD6m9e0ZkrXkqxWN5XQ2htca69gu
         5Ndw==
X-Gm-Message-State: APjAAAVhnZ+kDwXdsgI/+C2IVPmH5bvx8Jc9GANsROadCwFqIE4pfHtL
        YLu7vF991XPzNEOjtU5v4VS825ri5nI4Tjoh
X-Google-Smtp-Source: APXvYqw1xOoCnPO8YfwpZ5nRgaPpPr24xspNBV17LLiBFtD2eWt0/j9p08QSESkEcGjJ9SGNKNyhv8KaV3q9K4HX
X-Received: by 2002:a67:efcc:: with SMTP id s12mr4512139vsp.120.1557160313543;
 Mon, 06 May 2019 09:31:53 -0700 (PDT)
Date:   Mon,  6 May 2019 18:31:01 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <cdf0b98edefa9227db4a3d1fb6e3c7bc5a6a6215.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 15/17] tee, arm64: untag user pointers in tee_shm_register
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
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

tee_shm_register()->optee_shm_unregister()->check_mem_type() uses provided
user pointers for vma lookups (via __check_mem_type()), which can only by
done with untagged pointers.

Untag user pointers in this function.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/tee/tee_shm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 0b9ab1d0dd45..8e7b52ab6c63 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -263,6 +263,7 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
 	shm->teedev = teedev;
 	shm->ctx = ctx;
 	shm->id = -1;
+	addr = untagged_addr(addr);
 	start = rounddown(addr, PAGE_SIZE);
 	shm->offset = addr - start;
 	shm->size = length;
-- 
2.21.0.1020.gf2820cf01a-goog

