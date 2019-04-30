Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC308FA2B
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 15:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbfD3N11 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 09:27:27 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:51868 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbfD3NZn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 09:25:43 -0400
Received: by mail-vk1-f201.google.com with SMTP id r14so6299203vkd.18
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2019 06:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=4c/fu3qC3Skvw+ZZk7UHJQzalE9hfnOxHloiMgOUfYw=;
        b=wBxzW9uz5sqQEs2k0kS4yhvkUsLQPUol5yYuscC/EhJQq88IJKN51oJN9Ma9N+F87j
         0yaXqLxOKrSBWEzg6TAlDuogkZNA4XMbprAL12kWJ8MdNH7JIvTO8ZRXCqw/W9rKaVTK
         0th2TjbWtiytISvyVjLE74X1hS0zo7K7eSu+m53APk0oWFg+5hHivN//aHp583NOkYkp
         q/Xzdqo7lpDQuozd8M9soPmozGOH2C019sBJyK9gvXzEw1QU7pl845OD9URqwv3Lf0aM
         RmLDFBkc4rSunB/Q4UnHBTaxv0r2wOX1jQXVnW4MBVL+0daNYML4EK5a4hKos8NfLzsy
         dlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=4c/fu3qC3Skvw+ZZk7UHJQzalE9hfnOxHloiMgOUfYw=;
        b=FzrUNQVTLE++ehzMi6rCpncA+WaKKcLXJKKW3Zfj2OV75R9foUz+rSXW7Nw8WRbyFM
         hd8m4zG1aWZtKqyi0khSUG+dvSrp9gS6mhy2YVvbseADRWCoyzMxh4gkQmEiciNC467s
         tI40EhTBJ7CCoscpGzKI4+KIJuB8ZdelK/seXCIVLjG23z21ggtRzVYXPFC+FPRirt2c
         LX//Ar3kdTkVF1hnkRgL8Q3ZUF3LBXHkqcF3dGL0zj9xkw0n+7l58seeWZUe+5et9Ksn
         rbqsubHUSUyyav2paeCdp6WiV2eU+jzROoeelF21wlFYwmen7Az7NK1kbJohKJm8ycu3
         TP2g==
X-Gm-Message-State: APjAAAUo20M19bYK5iimv5NWDo7SP4DcN5VF+jKoOLmYu7B/ZjDkWkNo
        b5RNMHHfmYTzGjX8q31RUNlTReY1CyJJbPtd
X-Google-Smtp-Source: APXvYqx4TL4lB6fuuHN3vQZgSBJDs10/R98gvbNQDm51wxIVMnZyNgUuaizbdtdyYw1MeWbTLc+s/luHbNJTgZgZ
X-Received: by 2002:a67:8155:: with SMTP id c82mr6290812vsd.200.1556630742131;
 Tue, 30 Apr 2019 06:25:42 -0700 (PDT)
Date:   Tue, 30 Apr 2019 15:25:04 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <8e20df035de677029b3f970744ba2d35e2df1db3.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 08/17] mm, arm64: untag user pointers in get_vaddr_frames
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

get_vaddr_frames uses provided user pointers for vma lookups, which can
only by done with untagged pointers. Instead of locating and changing
all callers of this function, perform untagging in it.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/frame_vector.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/frame_vector.c b/mm/frame_vector.c
index c64dca6e27c2..c431ca81dad5 100644
--- a/mm/frame_vector.c
+++ b/mm/frame_vector.c
@@ -46,6 +46,8 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
 	if (WARN_ON_ONCE(nr_frames > vec->nr_allocated))
 		nr_frames = vec->nr_allocated;
 
+	start = untagged_addr(start);
+
 	down_read(&mm->mmap_sem);
 	locked = 1;
 	vma = find_vma_intersection(mm, start, start + 1);
-- 
2.21.0.593.g511ec345e18-goog

