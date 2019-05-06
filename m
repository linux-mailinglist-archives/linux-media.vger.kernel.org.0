Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 871821519F
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 18:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfEFQdL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 12:33:11 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:56992 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbfEFQb3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 May 2019 12:31:29 -0400
Received: by mail-qt1-f201.google.com with SMTP id e7so8722816qtq.23
        for <linux-media@vger.kernel.org>; Mon, 06 May 2019 09:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=TZHV8An4OEXfkqFgrZuDjdlNeU7w3PdkPz1ZU4+cbAs=;
        b=lVlAxmmY4nFExOi7qcKMHLUyvk1dgMtcIDWsIxNnuOIKi7SENIWoorvqYx22FhFeiH
         qNv3aCOvVP2Cd8JsXC4f5fwupU4T2PFYzqayLiNCFI9HFlqX4lWPhufSiUZxYZlKJbSP
         xpayFPpaQpM+egkX1gh0HyRA3qPTTcL2EH50qtn8LLi1pPJilWqtH0/kYJiIyAq+8b8K
         r7XbnjhrPxJ/+aU0+7xAQJYRuQVqDAYCQIetrAi8pdeAX3hMSEX83RJtSz7KeAzNa4AL
         TEi4LWr1V919AH8PPG3nTQ8k7FsrBwYY7/UQoSLOaq/gIbNGSmHdWR4W58sdfzeJRSfR
         CtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=TZHV8An4OEXfkqFgrZuDjdlNeU7w3PdkPz1ZU4+cbAs=;
        b=Z+vMyt0nSoJwJOluUW3rfIA8Ek5zMkiuz2lAe9w+QmPoY22/UXqdjIs68ZPjNs34P8
         c/VUQus9XIJXWABns+QotnqsBYIZluzEq0Q0RWZMsitHc2UIC2C2ygxdKYsOIjVNIXiI
         u+8hpBqQsR0VtBifF8UZ4x8dcnILcxQg5dbegh/tHwDvUq2eWQm7g/AAUzayJplOcSq1
         nFMqdCOFBw0pmOfTbT4ZxQZpNtG7rTfuRdsrWa9Jg1RefK5ojjjq66JDrgmdUUfgVsl2
         pgbMoUBpyv1uqeD5WVozVHg8XDAkNCj4URWVQbITQkDFWyeCvYhMdBWjVGPeekJG6kyh
         4yIA==
X-Gm-Message-State: APjAAAVKvYEqImeMb9fbToyO2vHS+O8dGONnRjGf/7HlrZY1TyqFARzj
        IyYrOWLXwTuD7b/esEU1NpEAqER+eaETpSoD
X-Google-Smtp-Source: APXvYqzHIfoRqtGD9gbf6U+p/ZZcVtiOU3rLeCD3rrtZumSW95xfAvgD6n9pasKaBp9DQWdRwfRV+d2riHaf6boR
X-Received: by 2002:a0c:d449:: with SMTP id r9mr16625749qvh.223.1557160288557;
 Mon, 06 May 2019 09:31:28 -0700 (PDT)
Date:   Mon,  6 May 2019 18:30:53 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <d234cd71774f35229bdfc0a793c34d6712b73093.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 07/17] mm, arm64: untag user pointers in mm/gup.c
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

mm/gup.c provides a kernel interface that accepts user addresses and
manipulates user pages directly (for example get_user_pages, that is used
by the futex syscall). Since a user can provided tagged addresses, we need
to handle this case.

Add untagging to gup.c functions that use user addresses for vma lookups.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/gup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index 91819b8ad9cc..2f477a0a7180 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -696,6 +696,8 @@ static long __get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
 	if (!nr_pages)
 		return 0;
 
+	start = untagged_addr(start);
+
 	VM_BUG_ON(!!pages != !!(gup_flags & FOLL_GET));
 
 	/*
@@ -858,6 +860,8 @@ int fixup_user_fault(struct task_struct *tsk, struct mm_struct *mm,
 	struct vm_area_struct *vma;
 	vm_fault_t ret, major = 0;
 
+	address = untagged_addr(address);
+
 	if (unlocked)
 		fault_flags |= FAULT_FLAG_ALLOW_RETRY;
 
-- 
2.21.0.1020.gf2820cf01a-goog

