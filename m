Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8715DF9DE
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 15:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbfD3NZ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 09:25:29 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:32905 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728098AbfD3NZ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 09:25:28 -0400
Received: by mail-pf1-f202.google.com with SMTP id i23so9103533pfa.0
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2019 06:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=IkuD9zPPDPrNqKOg+1EuZo5HlTMskU88lY/hO73XGBQ=;
        b=cjAZo1bevEgDG9f0Gp0lCqBUDVGf7WH9HfahHvPYK3yXKOMpkTJl6c0Qs/+BaViS4F
         SVbEHv0pbmF0M0fXn45Xz+XZ5NA51A6Q84gce81tqYq+4vQ4fSd4Vfr74XM9VMTqpEUn
         hpbIVHi0Y6E4lGzikQQHuG5LSWrNkshsuGLGjPRywGWJWT4PFmQUF2llhQi6ncC/Vlfh
         XyXZ2xzPVmh+mASSDoCOMBPHpUNh2v+x16jbihEdr4DI6v1V/jUL7ilAE/v54hqYIVN8
         AFB4b6bLnE3ptsM0NTOpxh1giv5Af/8Vei/jZ/b9XgJhABJa8DnBXyZnippbFF98erxD
         64TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=IkuD9zPPDPrNqKOg+1EuZo5HlTMskU88lY/hO73XGBQ=;
        b=iMX/B5fmWIyVD7HiJ4Wv4o+j/sepsQrZu53mZ3fneJ54NlL0XKraRfKLsu5A5lxy8p
         U2nVdL3ofwBvpNYrc0aocG0dVizi9KxARdHBG1C5Jnwpj9uZ6ERm8QHX/hLUP2C0k5vX
         akwzIbPArvs7rP22nMrvVv4zHljGTfolKRqEHDliG8Ro1MMTDzIZcVG+I6slV2CSvztm
         plP0jitxOMtg5F1zZz97wImdd72Jl4SoPgaazDr70ikc+VUmZinz6xsYWrKSz6GU1Z0D
         QS5Da+UicwEsDLNa50CHyQLDRmJ+H+e78Hyl69UYVQNabHO0VYBTpdfECL7pKRXBe8Qf
         xaMQ==
X-Gm-Message-State: APjAAAUUqVW7eDhNjDH/DEpkES9VM1PTVVI/xPxslX6Grpi+8vNp1str
        7l0zft5AfTN4yR6tw9ForPT/o5mp3yCrU4gV
X-Google-Smtp-Source: APXvYqxwzeO4aaEq5t7dlXsyLEMZLxNA1xUAM/PWlhFhSshLHzTvKlXrQBr9Il+4R5AJQuOw/QR46XMvR3q8fhhC
X-Received: by 2002:a65:534b:: with SMTP id w11mr7522791pgr.210.1556630723459;
 Tue, 30 Apr 2019 06:25:23 -0700 (PDT)
Date:   Tue, 30 Apr 2019 15:24:58 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <29b7234f48a282037bdfc23e07ff167756fca0df.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 02/17] arm64: untag user pointers in access_ok and __uaccess_mask_ptr
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

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/uaccess.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index e5d5f31c6d36..9164ecb5feca 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -94,7 +94,7 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
 	return ret;
 }
 
-#define access_ok(addr, size)	__range_ok(addr, size)
+#define access_ok(addr, size)	__range_ok(untagged_addr(addr), size)
 #define user_addr_max			get_fs
 
 #define _ASM_EXTABLE(from, to)						\
@@ -226,7 +226,8 @@ static inline void uaccess_enable_not_uao(void)
 
 /*
  * Sanitise a uaccess pointer such that it becomes NULL if above the
- * current addr_limit.
+ * current addr_limit. In case the pointer is tagged (has the top byte set),
+ * untag the pointer before checking.
  */
 #define uaccess_mask_ptr(ptr) (__typeof__(ptr))__uaccess_mask_ptr(ptr)
 static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
@@ -234,10 +235,11 @@ static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
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
2.21.0.593.g511ec345e18-goog

