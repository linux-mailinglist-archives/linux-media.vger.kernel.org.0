Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93B3B15151
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 18:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbfEFQbd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 12:31:33 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:56095 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbfEFQbc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 May 2019 12:31:32 -0400
Received: by mail-qk1-f202.google.com with SMTP id l4so14914893qke.22
        for <linux-media@vger.kernel.org>; Mon, 06 May 2019 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=9noxdAH/DJOJ2FYayyiyYQz8DnKHvszaUU/XpncZrgo=;
        b=Gh9uHUEwhI8X3KH3oum4TP3+K5YcLVeFgNxy28sxooe9hD0KxqO+/9bu9ASe+gwO9m
         +npnzk9MzBx/G95AnHz8npJA2JLqfUYczohkOpf1cDAEGWB/X7jH7ATuoeQyoUMeyaJE
         M+s2UJpwoXBo6kJQ8MvPZRd/OM9IAl3ZUMX+L/PvePvsqcjFIcb/KoU1n2dvqK/g4dyS
         WX9LAM4MfJzSphXX3HTjOHZ2WfucwXBSdBhXaGaeltxjREoqu7g25XXVhrt4uPYNQRup
         Pi925C63hraEJZZpZwP5S6UZPdegfoPkW1yuXxVcy9QEkU3hg9EUu8QmKcerWhcvmd7i
         pz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=9noxdAH/DJOJ2FYayyiyYQz8DnKHvszaUU/XpncZrgo=;
        b=ZB1RPrXRFdEN2YKnZW4KVTCSQZkprVlS1wZqniQIC2ml5mySSqAXf6RyiWh5IZA2lp
         ymGO1UtnGn4pJNtzzQJAM1Zx8ERKWo6dh//dn5FjUKPUhPiBSg+pOd3b1NemAL3i/7Ne
         rUi8rDMY7U2gZyzZfIa2s5oRXgCUX+lMLCZBFmNUcIBea0OhULpCJ0guUUfRSwxuy89o
         bSq6x1i6PsgaC9En6atnv0Qk1AYirJot5lifAp5swC+RVxEkKXSLWatMwtIwM+3hxhKJ
         FHHV0HSnc4p/NwPahOHivPDOgCEzLbfaD+T15PmkoCgrUJuSyPDHDI2VdsWPGryGeWTo
         B1EA==
X-Gm-Message-State: APjAAAXh1eVRvG89ibNHSu+3VNtL+79l/5jRCKiNvJKpggIoiD11E/tM
        sAIhq1Qk5czl7LNxei6D16/fE40QGYBdbGdV
X-Google-Smtp-Source: APXvYqxoF+XMyoqlEFPsaust8CXG+VIOr8CluDz21rRB5hrxS5C2Phu1lQB5er/vngGdw0Qf3GTM8MJuymHjvFcO
X-Received: by 2002:ad4:540b:: with SMTP id f11mr5876305qvt.42.1557160291702;
 Mon, 06 May 2019 09:31:31 -0700 (PDT)
Date:   Mon,  6 May 2019 18:30:54 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <b658f78360e65a7045e4f071b29f921885e72048.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 08/17] mm, arm64: untag user pointers in get_vaddr_frames
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
2.21.0.1020.gf2820cf01a-goog

