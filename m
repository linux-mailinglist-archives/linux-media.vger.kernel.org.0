Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 102F41518E
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 18:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbfEFQb2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 12:31:28 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:34211 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbfEFQb0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 May 2019 12:31:26 -0400
Received: by mail-vk1-f202.google.com with SMTP id y82so6164385vkd.1
        for <linux-media@vger.kernel.org>; Mon, 06 May 2019 09:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ngD1QIqwofb3Y9K5MW1PYIryx3q7PiTEQfc6RhUnaA4=;
        b=MxkQGAhZKcdMVO3IoBudATPab8TcsjZXX55HRiAN6IeYJiwC1j+iSqld+LLo8qyTyU
         J83cHqvwCOHlnCBK8LZqFG9H1aqF9NgW/OCa1+Ffyx8ZPU7n9taYd+4siYtOtJGSGqfL
         2bs1HGMZCs+84KfkjQ03uml4i8KyBdYF3wjbHGyt6HNd/mpMm+1Qp1No+KcUfeHVzCH2
         4161opexQWrAtxUlTCrivmQSMNxZ99d5aHCBZ5OmsHW7nAo6evlOzv9F19PFlipvMxI4
         C4R/T1FLs15dBoQSeJwhzGqmh+Swz0oYJVhSbKReuunpnwRMPL8ZC0ZS5QHAp3xWLkRd
         Hr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ngD1QIqwofb3Y9K5MW1PYIryx3q7PiTEQfc6RhUnaA4=;
        b=OJ9uTOh9jUkqm9iS1hIS0K5/iJJQ9hJKfPhHkl2wMhxS+aCsZ6foHHJdBZloRLnDAt
         gbHBA1lGkkW7/iHnMbKoHMpzVrb4icnuiG29eU9Uo8Hh/4KhZDANh9i0vfblTv66Zb8k
         kEUnM/gpoXIfQLf32dopduaw/spCOAGqxfqvwwEl6WMDtkQ3ETNPmxmQ5o8OQbZvJSWm
         9zgKx82Gm7r3RBqBNdwde2wgEnqW6ppEx2tdw8hH3FHqKZ0qXJGEdHGHiTul2UP9uv9N
         ViY4ocEBITORAFOGeAAyE2z2ejspzUuMfsYm06rqSaGj9PGT6rQ9mD3MP7lgkwSGJOIy
         ai4g==
X-Gm-Message-State: APjAAAXJI+AchbRFhEPukmHCDzsbBg46UnTB5jHk/FnJIo5tPhmme5CZ
        p56htIbWXpS2mr3FYNMFqYlcMtVMnZjpdxyG
X-Google-Smtp-Source: APXvYqwpCSWnm5qxXyuaWGAqRu95+6gB9zDmbHbxq+0Vb45FEs/ziN6+T3PbyTnxcvdIphfk21MnSe6Qp4R1y+WG
X-Received: by 2002:a1f:b45:: with SMTP id 66mr13881567vkl.38.1557160285529;
 Mon, 06 May 2019 09:31:25 -0700 (PDT)
Date:   Mon,  6 May 2019 18:30:52 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <474b3c113edae1f2fa679dc7237ec070ff4efb70.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 06/17] mm: untag user pointers in do_pages_move
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

do_pages_move() is used in the implementation of the move_pages syscall.

Untag user pointers in this function.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/migrate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/migrate.c b/mm/migrate.c
index 663a5449367a..c014a07135f0 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1617,6 +1617,7 @@ static int do_pages_move(struct mm_struct *mm, nodemask_t task_nodes,
 		if (get_user(node, nodes + i))
 			goto out_flush;
 		addr = (unsigned long)p;
+		addr = untagged_addr(addr);
 
 		err = -ENODEV;
 		if (node < 0 || node >= MAX_NUMNODES)
-- 
2.21.0.1020.gf2820cf01a-goog

