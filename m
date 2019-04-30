Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E306F9F0
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 15:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728566AbfD3NZ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 09:25:56 -0400
Received: from mail-ua1-f73.google.com ([209.85.222.73]:39617 "EHLO
        mail-ua1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728549AbfD3NZz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 09:25:55 -0400
Received: by mail-ua1-f73.google.com with SMTP id v5so1911420ual.6
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2019 06:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=/erHdYVyxDvhPu3v7RMhd3dO9bpNIdyHyuRFKthPw/o=;
        b=eEiOGFetYWxih+SqIZFzGNfWcb2WG27fgr8umX6U99zGn9TVk7qoyvUJvyLbyO9646
         My6AFQXfx+E54pBbdCbbmUTy552nSiekbu8p+Z3EjOZkkRzKh6/KPKq2xMXR6PGCbeOC
         fF7Wnybo7p7oNGCxEtdGcC/SjUjb33krZmpxfplFBazN0BgfioX0FSzySTA4N97gTFrT
         W6ijBCliSwnkOOpdiWk5kSemwYixok6PKUQxZHW6VplcdEwGvrCZqCKdW+XjRywAL4b4
         tr3KgVn6nyJgYRcK+gwURasQznomoMLJd50NL8tFT/I0TUKbeATfwfeLLEXDX2wH0kWJ
         cXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=/erHdYVyxDvhPu3v7RMhd3dO9bpNIdyHyuRFKthPw/o=;
        b=iBPlyST3zyUh1UpQQwiEqjXsGITSKoKNbuYfzltx/V6SV68gOpqaMDoL0O9hS9RYiB
         4LN0MJfs1+BL1q2m/xkCljYxhk37DlM6lIApPYhcfv99gnHSOpxhJ0iFtHpV5WKxaYdF
         nmbblWqjMR44eVX0/9SC24CE1J7Y8AYYArh9CoyKlmLuDSjgC09xvrXgq27zqmPvXr81
         0xfm3GGdZ13Iq83p07GlFv6pVsh2ygnXxPw/8UETglHpyhSm7lAX3Nl2kAQd2mOUbJiJ
         SXI9bF1R0M3niBiKNAtfqARbkbb0nUBnrsmh0SxGYrk9qK5ZchbKlmOOMIYKBIbAzQ/o
         Cr4Q==
X-Gm-Message-State: APjAAAUQ63EUVKDKCMUrXMiQtn6IRwCJRlkzefSUQStqCL8jnzylknkC
        4cRz4UjAPRbeFtQlgwbmNq4l+YoDhQPgQC1i
X-Google-Smtp-Source: APXvYqz67px3tLUaZFP489IW2cHQSs+LvJjC7bfPcwFfPsiBelEm070ukqvUpFmAC3UEaQxQ+Sud/QNcvCPvUR/K
X-Received: by 2002:a67:82c8:: with SMTP id e191mr36596964vsd.24.1556630754448;
 Tue, 30 Apr 2019 06:25:54 -0700 (PDT)
Date:   Tue, 30 Apr 2019 15:25:08 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <9a50ef07d927cbccd9620894bda825e551168c3d.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 12/17] drm/radeon, arm64: untag user pointers
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

radeon_ttm_tt_pin_userptr() uses provided user pointers for vma
lookups, which can only by done with untagged pointers. This patch
untags user pointers when they are being set in
radeon_ttm_tt_pin_userptr().

In amdgpu_gem_userptr_ioctl() an MMU notifier is set up with a (tagged)
userspace pointer. The untagged address should be used so that MMU
notifiers for the untagged address get correctly matched up with the right
BO. This patch untags user pointers in radeon_gem_userptr_ioctl().

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/gpu/drm/radeon/radeon_gem.c | 2 ++
 drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 44617dec8183..90eb78fb5eb2 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -291,6 +291,8 @@ int radeon_gem_userptr_ioctl(struct drm_device *dev, void *data,
 	uint32_t handle;
 	int r;
 
+	args->addr = untagged_addr(args->addr);
+
 	if (offset_in_page(args->addr | args->size))
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 9920a6fc11bf..dce722c494c1 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -742,7 +742,7 @@ int radeon_ttm_tt_set_userptr(struct ttm_tt *ttm, uint64_t addr,
 	if (gtt == NULL)
 		return -EINVAL;
 
-	gtt->userptr = addr;
+	gtt->userptr = untagged_addr(addr);
 	gtt->usermm = current->mm;
 	gtt->userflags = flags;
 	return 0;
-- 
2.21.0.593.g511ec345e18-goog

