Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49E904244A
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 13:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409075AbfFLLnl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 07:43:41 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:55593 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730909AbfFLLnl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 07:43:41 -0400
Received: by mail-qt1-f202.google.com with SMTP id l11so14375351qtp.22
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2019 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=pF1pY6g9sgHe6SSJdZReBxN/hHHz/1mBqQ4jLohhQOE=;
        b=iMRCrqRsfaLBvoWwOfr75mSJ/VPfvlbAFbDtrOANqSuL+z1aGCJpTI0vsQBJ49zvkV
         9E9fBJ+sa0296EIJ5umEi+BHGLGKU1WldUfLsc5lzjtqovn6xo5wnnj4Lmb0O9PgfLXm
         rcwLyJjNEekU9EtCutlVconxtA95VHk5TlDWuAVOA+JWDgv52TV4yWWRYEX7ZgqRnURM
         Eul1F8JBswSLtsZ6lUMRapd1H2weXhkqX5JahODOopa1MhAlxblNV2Op319cxPCbAAUf
         9L64VhEstL8JTyQhso+M/6lNjrHhHWa2qS+F7je7+fvMkiPQ8oGbPBPAqN2Cie9HgxaI
         uOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=pF1pY6g9sgHe6SSJdZReBxN/hHHz/1mBqQ4jLohhQOE=;
        b=Rq037BhG5ylwr6bBOP14HyJDFqbkpkBT2ilZuQoMkQ13i9j2CKElwVpCLj3Zv2ZbWn
         USlJunKANaoXHIUctQryOKd8e7Qa+71Rpms95Iwf86kuHRzkah64QMFOTzVPDkiwnMI7
         eUAfm9/KXqvxZG3zAgC7yJVvHrkEfOJjo6dAkIC4VhdqyjPCKVImeYR8icYLCnK/xcLo
         RmLqU3RcVZnd8qLQ1lrBRt2VrCnGc39sUjjAN4ev9UBY8uIMhKY0gJvZ/tB5X8JkvJIN
         RXstQ3lReYOK0t4TltSi7eElK7mvvQRu6p9BNowuK5BF+uIXHRC66XIy74Q1WOY+C6ux
         gdLw==
X-Gm-Message-State: APjAAAV6aKto3NpThq63Mr0rujXNcW2n1mHPmRW7Vi870Wr2vCih3foB
        RF/3jlQJUswpTzIwDAln2cK6fGqR1oakx6JQ
X-Google-Smtp-Source: APXvYqwDKTUvtDmA6SMmQkKz65W969SZufp61k02G9fCL+2/fp67qf94d2M1YkNH+hXtOrCQMRSpsi3TuTa5t/Fk
X-Received: by 2002:a37:6b42:: with SMTP id g63mr50597391qkc.80.1560339819968;
 Wed, 12 Jun 2019 04:43:39 -0700 (PDT)
Date:   Wed, 12 Jun 2019 13:43:18 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <9ed583c1a3acf014987e3aef12249506c1c69146.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 01/15] arm64: untag user pointers in access_ok and __uaccess_mask_ptr
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

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

copy_from_user (and a few other similar functions) are used to copy data
from user memory into the kernel memory or vice versa. Since a user can
provided a tagged pointer to one of the syscalls that use copy_from_user,
we need to correctly handle such pointers.

Do this by untagging user pointers in access_ok and in __uaccess_mask_ptr,
before performing access validity checks.

Note, that this patch only temporarily untags the pointers to perform the
checks, but then passes them as is into the kernel internals.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/uaccess.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index e5d5f31c6d36..df729afca0ba 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -73,6 +73,8 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
 {
 	unsigned long ret, limit = current_thread_info()->addr_limit;
 
+	addr = untagged_addr(addr);
+
 	__chk_user_ptr(addr);
 	asm volatile(
 	// A + B <= C + 1 for all A,B,C, in four easy steps:
@@ -226,7 +228,8 @@ static inline void uaccess_enable_not_uao(void)
 
 /*
  * Sanitise a uaccess pointer such that it becomes NULL if above the
- * current addr_limit.
+ * current addr_limit. In case the pointer is tagged (has the top byte set),
+ * untag the pointer before checking.
  */
 #define uaccess_mask_ptr(ptr) (__typeof__(ptr))__uaccess_mask_ptr(ptr)
 static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
@@ -234,10 +237,11 @@ static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
 	void __user *safe_ptr;
 
 	asm volatile(
-	"	bics	xzr, %1, %2\n"
+	"	bics	xzr, %3, %2\n"
 	"	csel	%0, %1, xzr, eq\n"
 	: "=&r" (safe_ptr)
-	: "r" (ptr), "r" (current_thread_info()->addr_limit)
+	: "r" (ptr), "r" (current_thread_info()->addr_limit),
+	  "r" (untagged_addr(ptr))
 	: "cc");
 
 	csdb();
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

