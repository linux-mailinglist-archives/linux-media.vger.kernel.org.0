Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E612A71E67
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 20:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391357AbfGWR7j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 13:59:39 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:39825 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391348AbfGWR7g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 13:59:36 -0400
Received: by mail-qk1-f202.google.com with SMTP id x1so37084490qkn.6
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 10:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bNeVrTrPvpjyJWHVtXYqgQlj6F1/0IzkZ0bc3aEFST0=;
        b=uWaCwrDkBN5GRSLhaw7WQwMKcK3AhPqO/fzElVN3JcPy98UFLj7JeXsg8P+SLlr/8N
         uTaOa6VggUuncDHcvq/dm+VjbWoXQVCEMVj3yqEv0lzhkp6ZqhxIJZIXWJox0QqwZPpw
         oblQlXNCYt4tHVrvlJypYdteLVvehIkVLfAlFHjgdjHvnPpCAD6GJOEurxmklM0IOqwa
         r3we5GB8/FJKwWzwzqUCJtO6E9+uXUbwxjMkihzlNrMKNzLhjZggf+0ZB/LMAafHfS91
         EJUlnCmBt8+isj3aFtdbAWI7Fy268Gzi52Ek2+IZaH/c0AJ5vAsChMY+9qCOx6dYD5bK
         14lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bNeVrTrPvpjyJWHVtXYqgQlj6F1/0IzkZ0bc3aEFST0=;
        b=IOeP+N8earB7LMFlqNPuRFgnsEp2dfYbDVa0SX04ceySDupAWcSVP2FFrsOZ9HkkLK
         VTsP6f4RYDC6K6LEh7cUJlTNI3SraAIAa7IY9Y8bBHUsTrvTifwFV53KH4euHTRBu12S
         0/OsQPMWKlHXLcGRh8IUxZ5oAK0muVMCd6wAISeVTx2PuwwhXbSQ7WGGpTXnmQRPZwFC
         ogmOsDnzncfT0DJ4mcpYRfWszNGueFV+ZPQGm1AChWhp/C8TCAFcne1BSkKi17kck/QM
         iQxy2SHVvKBJ0y+kV7klK86nXdr7sizmyTnJRTxLyhlrt0AWhGaVadzRbo42Ts0HH0NV
         PCLA==
X-Gm-Message-State: APjAAAXZ9yT+nybgOR5isUoD3Xw+XXwJW8iy9mmhDAaJ4/dfM2mLc/14
        iapqB+zpBw+z7egWAaNrME9AnORu5VvenXEd
X-Google-Smtp-Source: APXvYqyRt/sslYOExeWvOFH4KfKnKxW+V8w8qG436u1Li2H+fm4BIS46hHRf2O8j3VSTAztC1lSBD2N1vfHNfs72
X-Received: by 2002:a05:620a:522:: with SMTP id h2mr54247961qkh.329.1563904775319;
 Tue, 23 Jul 2019 10:59:35 -0700 (PDT)
Date:   Tue, 23 Jul 2019 19:58:46 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <d684e1df08f2ecb6bc292e222b64fa9efbc26e69.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 09/15] drm/amdgpu: untag user pointers
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

In amdgpu_gem_userptr_ioctl() and amdgpu_amdkfd_gpuvm.c/init_user_pages()
an MMU notifier is set up with a (tagged) userspace pointer. The untagged
address should be used so that MMU notifiers for the untagged address get
correctly matched up with the right BO. This patch untag user pointers in
amdgpu_gem_userptr_ioctl() for the GEM case and in amdgpu_amdkfd_gpuvm_
alloc_memory_of_gpu() for the KFD case. This also makes sure that an
untagged pointer is passed to amdgpu_ttm_tt_get_user_pages(), which uses
it for vma lookups.

Reviewed-by: Kees Cook <keescook@chromium.org>
Suggested-by: Felix Kuehling <Felix.Kuehling@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 1d3ee9c42f7e..00468ebf8b76 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1103,7 +1103,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		alloc_flags = 0;
 		if (!offset || !*offset)
 			return -EINVAL;
-		user_addr = *offset;
+		user_addr = untagged_addr(*offset);
 	} else if (flags & (ALLOC_MEM_FLAGS_DOORBELL |
 			ALLOC_MEM_FLAGS_MMIO_REMAP)) {
 		domain = AMDGPU_GEM_DOMAIN_GTT;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 939f8305511b..d7855842fd51 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -291,6 +291,8 @@ int amdgpu_gem_userptr_ioctl(struct drm_device *dev, void *data,
 	uint32_t handle;
 	int r;
 
+	args->addr = untagged_addr(args->addr);
+
 	if (offset_in_page(args->addr | args->size))
 		return -EINVAL;
 
-- 
2.22.0.709.g102302147b-goog

