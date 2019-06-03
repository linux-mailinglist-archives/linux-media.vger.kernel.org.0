Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76311335B9
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 18:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729560AbfFCQzo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 12:55:44 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:33681 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729548AbfFCQzn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 12:55:43 -0400
Received: by mail-qk1-f201.google.com with SMTP id t196so1012416qke.0
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2019 09:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=8pgHCk5wEiyaTFCxwJKfncM1f+2WF9g+TqLFqNfWufQ=;
        b=eM3yvxS7rzZ2nnFYrRtwMpVwIimBA7OeBVGUKG05qqQOYpi+Zis4iOHoCqOn+3sjDh
         2SabES8eFCAsnon36EZg8qxjmj+CW/08eSPui+O8M8q9qj9EihXzk/kg7mFnv1ofmO2L
         6gdrPpvdTVeWEXirSohkSFcGd3CTquZjzaE1d3uIrVhOjCiqBdkigRuAKI8/ID1Mi6ud
         zk8tRRsd3G4px7QGEmRqWs1oq4KZBZQ84TPIW2/PRqcP/P9TeozrBt0HPw3seUNx6jqU
         wgzokqzg3Z9TB08A/q6k7ggwnJy6GtgW83uc4Qh4qCVWwdITo0WCqdd0x9WCtndSuvUL
         /u8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=8pgHCk5wEiyaTFCxwJKfncM1f+2WF9g+TqLFqNfWufQ=;
        b=J47dKucrxA/2MY28xmHFkdFq1hQXhiQQyEocPsSilgFLcr1YqbUV4xXhEn6UzY658I
         GITYjzoCFH5UrMH9Ut7iiKi2jtO+FCghDJHVk9DHYAaBoFKWD2qivecUHM4wPbyPn6lQ
         MaXMShDQIvbTNhPgpn/zKHqMO4XevVuJnqo7VPtYz4GTpsHAZv1jz0QZeB4uTMcQr1Si
         yCB0hpfKmX+ibmi3E/VXmeH5kwoJahWidb4AwjVOWEbdMmF/CYuRPdQ+QGAhe8fQQ2OJ
         pxKrkXEk+aupEmiyJFwibahmgqYNqMoemr6gwia6JgupyZV4nHBZ0W/FJqpmHVqUr5kg
         wVLA==
X-Gm-Message-State: APjAAAVrMUQAlVsKjOcfKnEqWVvM1YlBYHfL+TYLgVmqCfjou89uiQoL
        5YUhm/UfHT7WzmjOdyPe3zW35iVTluHdTSn7
X-Google-Smtp-Source: APXvYqyNatgo8rHVRn4VlhemarHIUF3AdcvyBy1EVpeL8RHKUhqmEsOqMc7TMbe6ArCDJ95BM6gVWf7qKnPTt9YN
X-Received: by 2002:a0c:9233:: with SMTP id a48mr6236042qva.66.1559580942841;
 Mon, 03 Jun 2019 09:55:42 -0700 (PDT)
Date:   Mon,  3 Jun 2019 18:55:08 +0200
In-Reply-To: <cover.1559580831.git.andreyknvl@google.com>
Message-Id: <e1f6d268135f683fd70c2af27e75f694d7ffaf48.1559580831.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1559580831.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
Subject: [PATCH v16 06/16] mm, arm64: untag user pointers in mm/gup.c
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

mm/gup.c provides a kernel interface that accepts user addresses and
manipulates user pages directly (for example get_user_pages, that is used
by the futex syscall). Since a user can provided tagged addresses, we need
to handle this case.

Add untagging to gup.c functions that use user addresses for vma lookups.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/gup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index ddde097cf9e4..c37df3d455a2 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -802,6 +802,8 @@ static long __get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
 	if (!nr_pages)
 		return 0;
 
+	start = untagged_addr(start);
+
 	VM_BUG_ON(!!pages != !!(gup_flags & FOLL_GET));
 
 	/*
@@ -964,6 +966,8 @@ int fixup_user_fault(struct task_struct *tsk, struct mm_struct *mm,
 	struct vm_area_struct *vma;
 	vm_fault_t ret, major = 0;
 
+	address = untagged_addr(address);
+
 	if (unlocked)
 		fault_flags |= FAULT_FLAG_ALLOW_RETRY;
 
-- 
2.22.0.rc1.311.g5d7573a151-goog

