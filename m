Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 712D6F9FD
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 15:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbfD3N0A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 09:26:00 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:44112 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728602AbfD3NZ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 09:25:59 -0400
Received: by mail-qk1-f202.google.com with SMTP id b67so11748656qkc.11
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2019 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=5l0a3uzMK38mxhU43HR3pLkdTsHYkFU/5p0+WtYx5vA=;
        b=g9CCdO8J183ztwieMKtxq5bQgdPwn8MyKUl5zlyySPt09tOB1Gypd0bdF1FTgPWg9U
         vgl3VSH+QbfWqwQxuQNAq18fHGv2grDucix13/YUy3bvOI1BB9BrzAgOyNFI+ychptbo
         BVp24qrS90whe3PqSvAaQ8Kncxvv8pqzjLbVvi9smoyLBamx2Dg/fg59oj/C1VgTZmLk
         po6sIoVdSb935f+/5YJnlpWSaOQYjK3//t7Ql3k3IgbH35nE1TWkeZ08/rMUWbwR2R7Q
         rNZsAyxKMZqUS4nVVdVnnh9Mowjk/e6QvbUTkAZYjeM7AIkIVd6G6w9+5n4IsjstGWE8
         jwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=5l0a3uzMK38mxhU43HR3pLkdTsHYkFU/5p0+WtYx5vA=;
        b=Q7QmygYFrjtrlCJv/ZHGJAyn6/XtZzRHjpSB0vhvwbUuUyTh3aUiJnRrIy/vwVPNJy
         GXqj4XhNUsDLkJhPSzQ1/6Y63p87sBx5tLENFkj4QXghWvt7nWV5J3QoYxYLGIqYbzjD
         Ud6yNb6Dqy0RZHmuq+n93E7/O3yAjSQB/BtNpkEWGZtD8rws3fjEMiDYz+3VkHvlD1XC
         +EPhy+jKXckE6lyADRhqQwMbc8wLNfFrc/PwUoYLgr/1ACA8AlWZgPNw/r87PiAUh3s8
         r9A4vEz/WLcTZ45/tBQpsd5OSuG4wsl8VdhA3Fg5kNfOBPMS/1T29KpdSsT0tiqVgeqN
         sLxg==
X-Gm-Message-State: APjAAAWu7dJzgXFDyEqTzsASR7p9w+nXf5Y0KRyp7MAm20X1E2Lp91C+
        fHTP4fpne6z/Wm9gcihmxVY+O0XfHg+qi5Mx
X-Google-Smtp-Source: APXvYqzcKJMSJm3saTG/Jy9RV9wnqiRL/1GQ7HSUwiNcvOVWaTtiFz1xHas1LLHxgSsag1rnBPh3sxDf1Qf0ekUW
X-Received: by 2002:a05:6214:18d:: with SMTP id q13mr1705396qvr.213.1556630757432;
 Tue, 30 Apr 2019 06:25:57 -0700 (PDT)
Date:   Tue, 30 Apr 2019 15:25:09 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <05c0c078b8b5984af4cc3b105a58c711dcd83342.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 13/17] IB/mlx4, arm64: untag user pointers in mlx4_get_umem_mr
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
        Andrey Konovalov <andreyknvl@google.com>,
        Leon Romanovsky <leonro@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

mlx4_get_umem_mr() uses provided user pointers for vma lookups, which can
only by done with untagged pointers.

Untag user pointers in this function.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
---
 drivers/infiniband/hw/mlx4/mr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/hw/mlx4/mr.c b/drivers/infiniband/hw/mlx4/mr.c
index 395379a480cb..9a35ed2c6a6f 100644
--- a/drivers/infiniband/hw/mlx4/mr.c
+++ b/drivers/infiniband/hw/mlx4/mr.c
@@ -378,6 +378,7 @@ static struct ib_umem *mlx4_get_umem_mr(struct ib_udata *udata, u64 start,
 	 * again
 	 */
 	if (!ib_access_writable(access_flags)) {
+		unsigned long untagged_start = untagged_addr(start);
 		struct vm_area_struct *vma;
 
 		down_read(&current->mm->mmap_sem);
@@ -386,9 +387,9 @@ static struct ib_umem *mlx4_get_umem_mr(struct ib_udata *udata, u64 start,
 		 * cover the memory, but for now it requires a single vma to
 		 * entirely cover the MR to support RO mappings.
 		 */
-		vma = find_vma(current->mm, start);
-		if (vma && vma->vm_end >= start + length &&
-		    vma->vm_start <= start) {
+		vma = find_vma(current->mm, untagged_start);
+		if (vma && vma->vm_end >= untagged_start + length &&
+		    vma->vm_start <= untagged_start) {
 			if (vma->vm_flags & VM_WRITE)
 				access_flags |= IB_ACCESS_LOCAL_WRITE;
 		} else {
-- 
2.21.0.593.g511ec345e18-goog

