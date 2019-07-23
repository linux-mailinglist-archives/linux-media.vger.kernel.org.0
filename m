Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86E6771E64
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 20:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391323AbfGWR7c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 13:59:32 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:47614 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391313AbfGWR7a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 13:59:30 -0400
Received: by mail-qk1-f201.google.com with SMTP id x17so37121675qkf.14
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=SnCe+Mtnf/4IPVX5vctz2kNHbLvxo+cXn+T1BQBMjSY=;
        b=H4TiQUgRdi4EHpYB8nTtg37yn9l3JyAu6VKcW2CQCTgny+vzJbtQEYhMy5VYJWq/CI
         KrIVgxdlW5aj4Az2DGaszv74HRn6o+lrlFDsTrBfmff9rY/9V5Ds2Mgw7VHb0yVnzniX
         zHDvZt7zGQFLcaS9bQ85+7iz8VxXg9au1eNOrVwptdD22wpczsG2wyPaMM6iHM1fn6oB
         qEapo2f+2AfPvvpteYPs6gKu7O45lNfI0gMeElG1uz04IPRB0pwyBE+bIPD+sqfvkwBv
         pd2Qci5+NW7JO2WHQGIVKZzYhqd9oRhn7n0TTqLXoH+DCmlggKEuaPlzaJC7NBCKpdOt
         X82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=SnCe+Mtnf/4IPVX5vctz2kNHbLvxo+cXn+T1BQBMjSY=;
        b=uB149A3GuiYONviUprUOYiiR0fUmAUamKe98ToZHWdkeAZ8Wv60S7PU+GV6e9x3oBL
         sZOirtpveMEjwtm2hhIH4liL+s+LmUuZ2MUon9jsJbDqdzPEQBPlWbCE1SKbtcJVk4uP
         M6d1Uf86qo0/JyQpXTtx/Qvog/oqMG1Ns+R6xIoyIxh2+1OtaKtu2YDJ4s4D9KQGHzfa
         YGID/tKjpj4plO4AQcrOAdtbreKLPxIRnjySG+DYjVqAD8bljkizuMPDjljbTABFyiJs
         N0nbhnnQZgWAzKKKxEPMuKSOjnTHrM9r+5CnfApCd14M7vdWtsva0IZEbSH55i+st8Ex
         vw9g==
X-Gm-Message-State: APjAAAWKQ1cng8NKpat3wbLSNQqu23LmqSQ+vB/BAXkHhnyPYG+KB2ZT
        W6NTz8kKy4uedi1lrYnq2+3dzS2LN/1Fu70k
X-Google-Smtp-Source: APXvYqysiVBCmSbfWLll2amFKEEXBGqGWfbcKcVshytrTMG9pLoartROQI2FKjRVOxEkpepSHwC8IxHzKKAn6one
X-Received: by 2002:ac8:66ce:: with SMTP id m14mr12433817qtp.206.1563904768802;
 Tue, 23 Jul 2019 10:59:28 -0700 (PDT)
Date:   Tue, 23 Jul 2019 19:58:44 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <1de225e4a54204bfd7f25dac2635e31aa4aa1d90.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 07/15] fs/namespace: untag user pointers in copy_mount_options
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

In copy_mount_options a user address is being subtracted from TASK_SIZE.
If the address is lower than TASK_SIZE, the size is calculated to not
allow the exact_copy_from_user() call to cross TASK_SIZE boundary.
However if the address is tagged, then the size will be calculated
incorrectly.

Untag the address before subtracting.

Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>
Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 fs/namespace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 6464ea4acba9..b32eb26af8bf 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -2994,7 +2994,7 @@ void *copy_mount_options(const void __user * data)
 	 * the remainder of the page.
 	 */
 	/* copy_from_user cannot cross TASK_SIZE ! */
-	size = TASK_SIZE - (unsigned long)data;
+	size = TASK_SIZE - (unsigned long)untagged_addr(data);
 	if (size > PAGE_SIZE)
 		size = PAGE_SIZE;
 
-- 
2.22.0.709.g102302147b-goog

