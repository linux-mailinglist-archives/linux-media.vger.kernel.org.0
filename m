Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12196FA36
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 15:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728489AbfD3N1u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 09:27:50 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:44081 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728213AbfD3NZe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 09:25:34 -0400
Received: by mail-qt1-f201.google.com with SMTP id q57so13353106qtf.11
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2019 06:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=sP41vSza+MgZL4E9JOHZR6SNiiwo3z4wqXp2POej+GY=;
        b=sj70XUZyY78fBBLRN0Y0ejY13Ah+DWSq5MZvdtC4oy13cP3DTQDgLFkcENh07spfmR
         23eMW0ICrpgPZePCfs+0BA1gHPdG5T6uXrEWd81Tbha8dBRDM5Df4bgp8ypNTHmZGxhB
         zSa9r+Rp6W+STnkRdeIoDVRh7qzf6mRVz3aHnzxLBAlwWCR6kWuFgAJ4CJMcjRmxd08s
         WnsYITF9lzQXqyZYteDI696ABzkYAJcaC1sR3amNrgXWNyCgGFhtLoxDguJqocrpZ4Uy
         mOYkJ3BstUbrdtjiLHmZC47MGFm370/x5FYq0YwcLbrA00fWtbMhOMLHm2kOb5VLfvHU
         R2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=sP41vSza+MgZL4E9JOHZR6SNiiwo3z4wqXp2POej+GY=;
        b=Gf6Nlp8i+lXy+8Pb9XhjLpsVWtWDSo4UaSeNf7yslhMdYXRW1wUKk0gqkp+CuMuR5i
         JL24TTyaQD7Vp87L+/ko8g61eghYqBJruArBWW2KYfWlD4Q4KZl7uoDCHGDtz/laqkZ4
         nen6fHHlqEEJ7y4tBLKW5pjo0GHOlkzOexEsR06lTtXLr6yf2kMInFs0A/Jc9z7zFl9X
         76JkoIHM2525dbTHNZYXBIZfzVtYO1m50yAMI/CbB3MQr72Wv7dnh67JPgr2vntVLn66
         Vx5YmntBTYpkPEx3WRjIn2i4s7Xi7KsWqAyDmxmc5u09xgHMrZsY3qGSt0qWUsf6oPex
         dI5g==
X-Gm-Message-State: APjAAAX5w5dQ0nW9aMhGXUL+I6G1ndeCgznmg8BoCKJBIcDnIaFcutew
        3DK5Xny0n2fMU6uUfkFHljx/nYRGB+w4Imnu
X-Google-Smtp-Source: APXvYqwOIvRkWypSUt5RnFMU33k3VTnn9YbxJDW32+qwnbYJck7Qr3YzoF+bGVldwhSnM3lKHenrz7Th7S5LU/LL
X-Received: by 2002:ac8:186e:: with SMTP id n43mr29405979qtk.69.1556630732994;
 Tue, 30 Apr 2019 06:25:32 -0700 (PDT)
Date:   Tue, 30 Apr 2019 15:25:01 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <9b9c21f2895b1dfd7079572ea6d9d4fd6b5bbc55.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 05/17] arms64: untag user pointers passed to memory syscalls
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

This patch allows tagged pointers to be passed to the following memory
syscalls: brk, get_mempolicy, madvise, mbind, mincore, mlock, mlock2,
mmap, mmap_pgoff, mprotect, mremap, msync, munlock, munmap,
remap_file_pages, shmat and shmdt.

This is done by untagging pointers passed to these syscalls in the
prologues of their handlers.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/kernel/sys.c | 128 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 127 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/sys.c b/arch/arm64/kernel/sys.c
index b44065fb1616..933bb9f3d6ec 100644
--- a/arch/arm64/kernel/sys.c
+++ b/arch/arm64/kernel/sys.c
@@ -35,10 +35,33 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len,
 {
 	if (offset_in_page(off) != 0)
 		return -EINVAL;
-
+	addr = untagged_addr(addr);
 	return ksys_mmap_pgoff(addr, len, prot, flags, fd, off >> PAGE_SHIFT);
 }
 
+SYSCALL_DEFINE6(arm64_mmap_pgoff, unsigned long, addr, unsigned long, len,
+		unsigned long, prot, unsigned long, flags,
+		unsigned long, fd, unsigned long, pgoff)
+{
+	addr = untagged_addr(addr);
+	return ksys_mmap_pgoff(addr, len, prot, flags, fd, pgoff);
+}
+
+SYSCALL_DEFINE5(arm64_mremap, unsigned long, addr, unsigned long, old_len,
+		unsigned long, new_len, unsigned long, flags,
+		unsigned long, new_addr)
+{
+	addr = untagged_addr(addr);
+	new_addr = untagged_addr(new_addr);
+	return ksys_mremap(addr, old_len, new_len, flags, new_addr);
+}
+
+SYSCALL_DEFINE2(arm64_munmap, unsigned long, addr, size_t, len)
+{
+	addr = untagged_addr(addr);
+	return ksys_munmap(addr, len);
+}
+
 SYSCALL_DEFINE1(arm64_personality, unsigned int, personality)
 {
 	if (personality(personality) == PER_LINUX32 &&
@@ -47,10 +70,113 @@ SYSCALL_DEFINE1(arm64_personality, unsigned int, personality)
 	return ksys_personality(personality);
 }
 
+SYSCALL_DEFINE1(arm64_brk, unsigned long, brk)
+{
+	brk = untagged_addr(brk);
+	return ksys_brk(brk);
+}
+
+SYSCALL_DEFINE5(arm64_get_mempolicy, int __user *, policy,
+		unsigned long __user *, nmask, unsigned long, maxnode,
+		unsigned long, addr, unsigned long, flags)
+{
+	addr = untagged_addr(addr);
+	return ksys_get_mempolicy(policy, nmask, maxnode, addr, flags);
+}
+
+SYSCALL_DEFINE3(arm64_madvise, unsigned long, start,
+		size_t, len_in, int, behavior)
+{
+	start = untagged_addr(start);
+	return ksys_madvise(start, len_in, behavior);
+}
+
+SYSCALL_DEFINE6(arm64_mbind, unsigned long, start, unsigned long, len,
+		unsigned long, mode, const unsigned long __user *, nmask,
+		unsigned long, maxnode, unsigned int, flags)
+{
+	start = untagged_addr(start);
+	return ksys_mbind(start, len, mode, nmask, maxnode, flags);
+}
+
+SYSCALL_DEFINE2(arm64_mlock, unsigned long, start, size_t, len)
+{
+	start = untagged_addr(start);
+	return ksys_mlock(start, len, VM_LOCKED);
+}
+
+SYSCALL_DEFINE2(arm64_mlock2, unsigned long, start, size_t, len)
+{
+	start = untagged_addr(start);
+	return ksys_mlock(start, len, VM_LOCKED);
+}
+
+SYSCALL_DEFINE2(arm64_munlock, unsigned long, start, size_t, len)
+{
+	start = untagged_addr(start);
+	return ksys_munlock(start, len);
+}
+
+SYSCALL_DEFINE3(arm64_mprotect, unsigned long, start, size_t, len,
+		unsigned long, prot)
+{
+	start = untagged_addr(start);
+	return ksys_mprotect_pkey(start, len, prot, -1);
+}
+
+SYSCALL_DEFINE3(arm64_msync, unsigned long, start, size_t, len, int, flags)
+{
+	start = untagged_addr(start);
+	return ksys_msync(start, len, flags);
+}
+
+SYSCALL_DEFINE3(arm64_mincore, unsigned long, start, size_t, len,
+		unsigned char __user *, vec)
+{
+	start = untagged_addr(start);
+	return ksys_mincore(start, len, vec);
+}
+
+SYSCALL_DEFINE5(arm64_remap_file_pages, unsigned long, start,
+		unsigned long, size, unsigned long, prot,
+		unsigned long, pgoff, unsigned long, flags)
+{
+	start = untagged_addr(start);
+	return ksys_remap_file_pages(start, size, prot, pgoff, flags);
+}
+
+SYSCALL_DEFINE3(arm64_shmat, int, shmid, char __user *, shmaddr, int, shmflg)
+{
+	shmaddr = untagged_addr(shmaddr);
+	return ksys_shmat(shmid, shmaddr, shmflg);
+}
+
+SYSCALL_DEFINE1(arm64_shmdt, char __user *, shmaddr)
+{
+	shmaddr = untagged_addr(shmaddr);
+	return ksys_shmdt(shmaddr);
+}
+
 /*
  * Wrappers to pass the pt_regs argument.
  */
 #define sys_personality		sys_arm64_personality
+#define sys_mmap_pgoff		sys_arm64_mmap_pgoff
+#define sys_mremap		sys_arm64_mremap
+#define sys_munmap		sys_arm64_munmap
+#define sys_brk			sys_arm64_brk
+#define sys_get_mempolicy	sys_arm64_get_mempolicy
+#define sys_madvise		sys_arm64_madvise
+#define sys_mbind		sys_arm64_mbind
+#define sys_mlock		sys_arm64_mlock
+#define sys_mlock2		sys_arm64_mlock2
+#define sys_munlock		sys_arm64_munlock
+#define sys_mprotect		sys_arm64_mprotect
+#define sys_msync		sys_arm64_msync
+#define sys_mincore		sys_arm64_mincore
+#define sys_remap_file_pages	sys_arm64_remap_file_pages
+#define sys_shmat		sys_arm64_shmat
+#define sys_shmdt		sys_arm64_shmdt
 
 asmlinkage long sys_ni_syscall(const struct pt_regs *);
 #define __arm64_sys_ni_syscall	sys_ni_syscall
-- 
2.21.0.593.g511ec345e18-goog

