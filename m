Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60A1DFA49
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 15:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbfD3NZW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 09:25:22 -0400
Received: from mail-yw1-f73.google.com ([209.85.161.73]:40541 "EHLO
        mail-yw1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbfD3NZV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 09:25:21 -0400
Received: by mail-yw1-f73.google.com with SMTP id y66so624046ywy.7
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2019 06:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Yt+PWI13/w7NMYz3zwPrNGqq+ReXtpTWddPqmKmBKgk=;
        b=jG67MQO6uSTq+PQJ7NLS3u3pGPqYxBD6j6Z7zSYau7uP7jvgt3bFEq3faUxv1qOiIb
         Lhjg89Y6A0R/eNow3E4oC26RwU4x5nya0AVoMdWDIBSbYBBhFLCViwOATovkHqYFgw83
         hOVUMM4j6unbJMoC5S4qfPmdZGJuwasxoQN5pLBzNoODYCmMWIdN+DK/0OhTFTFrX99t
         6EDwehqEld5biejrj0QAkLSZAfR6m8nobezuReC4ugk/eXbqiTH4l+ivloQAzM7wUwIe
         NZAar432hbtNkfGtL2tuOjYFn681Ww9UC8SmNz4UpJpUm1tSs7E6peMLsrX4yxW2SbA8
         caHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Yt+PWI13/w7NMYz3zwPrNGqq+ReXtpTWddPqmKmBKgk=;
        b=bUlfp9ofAtvBD3KoDv8chdLtMs8T4CuERcCfMxfeq+O+1vlOATRiUPI896Skr2lSi+
         tWjat+/jLrbhs4xWbwoHzpvYbQQj3x850rdNhT5Jn4zmFnfEt7k5RUrqX/E8drhLTf8I
         2dN/Y5CvTnuR4Ny1OBjaiK+oH1bbuk/BLqST+26//6H4v9iOTAKhXxFI1wJm/9EDRxfv
         cKQBcfi5o3U0stZRt/tq0bkXvkdm2pD1q81w2MyDqnRhOBsa7GddpJSAZpb5TKO3SkO7
         EZkBTszzWJvfqNWJfGom5JrkK0i+vrvl992ZvRIs4SmFdEez32qI0bx+Zm7A4Dc51idD
         Hhug==
X-Gm-Message-State: APjAAAUYJF9TPJGM+FDrLPPOgDQRsiJFViFH6ArPg7vhOlvJnN9sNGbK
        qkhYGUr+j5U6Y3rpe2cK9yhUAk2h7wGkI7ST
X-Google-Smtp-Source: APXvYqzn+VCXcz3/MPYUKI1STEW4oOzSku7o6dMmFF+1zuaxsiuVuMrbdGrvK+1IRDapYK9+TGfb+TbRJGhClYr2
X-Received: by 2002:a81:3d51:: with SMTP id k78mr56599045ywa.106.1556630720203;
 Tue, 30 Apr 2019 06:25:20 -0700 (PDT)
Date:   Tue, 30 Apr 2019 15:24:57 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <c66c15554ff43b09aa97595907d4231be3fb7b31.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 01/17] uaccess: add untagged_addr definition for other arches
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
        Yishai Hadas <yishaih@mellanox.com>, Kuehling@google.com,
        Felix <Felix.Kuehling@amd.com>, Deucher@google.com,
        Alexander <Alexander.Deucher@amd.com>, Koenig@google.com,
        Christian <Christian.Koenig@amd.com>,
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
        Chintan Pandya <cpandya@codeaurora.org>,
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

To allow arm64 syscalls to accept tagged pointers from userspace, we must
untag them when they are passed to the kernel. Since untagging is done in
generic parts of the kernel, the untagged_addr macro needs to be defined
for all architectures.

Define it as a noop for architectures other than arm64.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 include/linux/mm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6b10c21630f5..44041df804a6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -99,6 +99,10 @@ extern int mmap_rnd_compat_bits __read_mostly;
 #include <asm/pgtable.h>
 #include <asm/processor.h>
 
+#ifndef untagged_addr
+#define untagged_addr(addr) (addr)
+#endif
+
 #ifndef __pa_symbol
 #define __pa_symbol(x)  __pa(RELOC_HIDE((unsigned long)(x), 0))
 #endif
-- 
2.21.0.593.g511ec345e18-goog

