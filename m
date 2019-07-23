Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F208A71E31
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 19:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391230AbfGWR7L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 13:59:11 -0400
Received: from mail-yb1-f201.google.com ([209.85.219.201]:52030 "EHLO
        mail-yb1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391169AbfGWR7K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 13:59:10 -0400
Received: by mail-yb1-f201.google.com with SMTP id l2so22163911ybl.18
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 10:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=uxuxpoqA/C7rk06bc2rM9al5Hb55km4kp2za7lpV0D8=;
        b=gvBkOkwzaYNLh+oGcJAVB7MjFm6ggJ16J7ZtFWSs5smrgxbyTgnFANakPKwfHBaKJo
         Z3AeBj5hFUm+GIYoHcLDXyEq448i3WGfVM80s/ZYt3Ff7Lnffb2whFy1iyiq0vNB8tme
         ZgEAhcj6PmMNwScnzwOlSrD9vrs9BWD5XfY+Jc7tfz6fIGBdIIOc361XhF1FnJ2J5gIc
         R3XqyRsgPc72AURET11IAyvFYp4TC8kAAhKarnjk3baGMHuxZXMV89tXjZO+C8I9PfEc
         YEGyFP+vd3pK7Yts8v+bEOrkzxv2fC0rSmwv0ECVx3Gypru+tBZwBnoAh4W0hQ7k4cn/
         8ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=uxuxpoqA/C7rk06bc2rM9al5Hb55km4kp2za7lpV0D8=;
        b=JQnX9vOtLpwlwmQNl5/wjV0WcYoX8kb8r/OLTZQUVHBaLcXzr3PBxkGEv7DYvZNaUE
         PHx7BKigie/e6bsVG4DgIi7oG6N4z7je2V1um3tq6cIRvOT/Rb4ubhGUTza3glT5qS/4
         C/EgiJriOH+e+7+nZh1OPC2Z3fN5raaLQ+0V9PWli0W0g79bz+0y0Vwlv6KUrb9oYJVr
         OJ3urCkXw+8r9UskyGpcLnyrlCxhImk+oeSn0hBvnZJSExGjW4hGXqiXfcPNk4BTE0qP
         92EEWlyWd1d5BXrRi++4Isxy8c/7QZ6Yd9bJ2iysOjdmrMkkx54zft/DEJw7HJx0Dbs+
         TUCA==
X-Gm-Message-State: APjAAAUVO0RT29/ltcQqGLOVgWq0Up8wSmNM18R4dHEvbJ/res7kp/FO
        3RvcQyB9T9B91+tCfOhEC6VmVJuFZHjjXQTN
X-Google-Smtp-Source: APXvYqw9DwaHVI19t/YbteMrcIZMKltNbSnI88dDsWcfp8XIUhxn9zscDjBOZxYqaezV+ZapgNfd0Az5q5SxMU+h
X-Received: by 2002:a5b:951:: with SMTP id x17mr48178059ybq.511.1563904749116;
 Tue, 23 Jul 2019 10:59:09 -0700 (PDT)
Date:   Tue, 23 Jul 2019 19:58:38 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <bc53284e2c95fd5b65809a1fb8169d4c1618c61b.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 01/15] arm64: untag user pointers in access_ok and __uaccess_mask_ptr
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

copy_from_user (and a few other similar functions) are used to copy data
from user memory into the kernel memory or vice versa. Since a user can
provided a tagged pointer to one of the syscalls that use copy_from_user,
we need to correctly handle such pointers.

Do this by untagging user pointers in access_ok and in __uaccess_mask_ptr,
before performing access validity checks.

Note, that this patch only temporarily untags the pointers to perform the
checks, but then passes them as is into the kernel internals.

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/uaccess.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 5a1c32260c1f..a138e3b4f717 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -62,6 +62,8 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
 {
 	unsigned long ret, limit = current_thread_info()->addr_limit;
 
+	addr = untagged_addr(addr);
+
 	__chk_user_ptr(addr);
 	asm volatile(
 	// A + B <= C + 1 for all A,B,C, in four easy steps:
@@ -215,7 +217,8 @@ static inline void uaccess_enable_not_uao(void)
 
 /*
  * Sanitise a uaccess pointer such that it becomes NULL if above the
- * current addr_limit.
+ * current addr_limit. In case the pointer is tagged (has the top byte set),
+ * untag the pointer before checking.
  */
 #define uaccess_mask_ptr(ptr) (__typeof__(ptr))__uaccess_mask_ptr(ptr)
 static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
@@ -223,10 +226,11 @@ static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
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
2.22.0.709.g102302147b-goog

