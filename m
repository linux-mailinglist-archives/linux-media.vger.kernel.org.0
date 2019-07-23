Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A060671E34
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 19:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391257AbfGWR7S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 13:59:18 -0400
Received: from mail-yb1-f201.google.com ([209.85.219.201]:47212 "EHLO
        mail-yb1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391252AbfGWR7R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 13:59:17 -0400
Received: by mail-yb1-f201.google.com with SMTP id a2so21039307ybb.14
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 10:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=JFgaWDMGqAls6G489iThigfOi0kr7eFjggN3NFe6qBQ=;
        b=bdR5/fk0JGKoW7w0SFkFyWDsbkS1I0veDFpzyivmTwHIiT1ZA97yr7ZNBj0H2AShr3
         pJNPC/lixw/WX323ImP4bsjq93mjJZOu3XmkpNpFXgCiVzkeEYaOnJlxDz/E8gDEr+0Z
         7c+WyXnemQpO1dfLw6iPwN48OpAMyrI2pHKz9BmhLCsXRKcJ8hMZ0q56McGVdIPQVUpC
         wU6S0XoQlY0qPAb6VoXtHP5wFmiEaCJNy21C3scQNSBD97gIywyYsw0LYzCg0A9GdhDR
         +widw+4UdtR8VyNJh7brTEfaRq+BSrao4/hRns/7LOx28RgrtCz6SeEtUQ8FFyTY31id
         9AMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=JFgaWDMGqAls6G489iThigfOi0kr7eFjggN3NFe6qBQ=;
        b=c69pbCqqAVHi0AJ9tdz5/gmq0yOjPbE22pVxsPz0AWMAlmnwwipCDIV1+sxy4fIkh5
         Vf3EGvdKNFB1Y7uXMB2tu1qXu0Ih4oZFW88Yp6tolsdWvCZ98MB6jogTU3xNY6VigEYU
         Gcril9C2CIsCSsoS7m5vDDq1r1FUJ7W/nAg8ESaGoVklQaJHl38G2GxSa6R3Hn45Hog3
         +mE6oFMHHxOoB64i3n547gG4NzkMA08Eq1BWwmEaxSMkdUIJZcDOjCnaFV6S5aoTmv1m
         VLcI1Su5OyHpt9EW7/t8TU5jC9kESe/HIrQ1VTD4qMKIWCvWURSuVSKLQrOYS8t2Axjp
         PxxQ==
X-Gm-Message-State: APjAAAVdHoyol2lmlNpiv5fO+J79FrNhspD01SqwiAB04lgUVxf2yWaA
        5k+snBaR0uU2U71DgtBWhuc9weX2nuFAbx2d
X-Google-Smtp-Source: APXvYqyP8TuTil7EZTQQhTgA2DwZYNvsIYk2hVJOr9gyh7gqwx0FC8mj4nBRBXxdbEE2muRKlx89y5GRj7Mj4rf4
X-Received: by 2002:a81:9c0b:: with SMTP id m11mr45173898ywa.3.1563904755656;
 Tue, 23 Jul 2019 10:59:15 -0700 (PDT)
Date:   Tue, 23 Jul 2019 19:58:40 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <c5a78bcad3e94d6cda71fcaa60a423231ae71e4c.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 03/15] lib: untag user pointers in strn*_user
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

strncpy_from_user and strnlen_user accept user addresses as arguments, and
do not go through the same path as copy_from_user and others, so here we
need to handle the case of tagged user addresses separately.

Untag user pointers passed to these functions.

Note, that this patch only temporarily untags the pointers to perform
validity checks, but then uses them as is to perform user memory accesses.

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>
Acked-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 lib/strncpy_from_user.c | 3 ++-
 lib/strnlen_user.c      | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
index 023ba9f3b99f..dccb95af6003 100644
--- a/lib/strncpy_from_user.c
+++ b/lib/strncpy_from_user.c
@@ -6,6 +6,7 @@
 #include <linux/uaccess.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
+#include <linux/mm.h>
 
 #include <asm/byteorder.h>
 #include <asm/word-at-a-time.h>
@@ -108,7 +109,7 @@ long strncpy_from_user(char *dst, const char __user *src, long count)
 		return 0;
 
 	max_addr = user_addr_max();
-	src_addr = (unsigned long)src;
+	src_addr = (unsigned long)untagged_addr(src);
 	if (likely(src_addr < max_addr)) {
 		unsigned long max = max_addr - src_addr;
 		long retval;
diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
index 7f2db3fe311f..28ff554a1be8 100644
--- a/lib/strnlen_user.c
+++ b/lib/strnlen_user.c
@@ -2,6 +2,7 @@
 #include <linux/kernel.h>
 #include <linux/export.h>
 #include <linux/uaccess.h>
+#include <linux/mm.h>
 
 #include <asm/word-at-a-time.h>
 
@@ -109,7 +110,7 @@ long strnlen_user(const char __user *str, long count)
 		return 0;
 
 	max_addr = user_addr_max();
-	src_addr = (unsigned long)str;
+	src_addr = (unsigned long)untagged_addr(str);
 	if (likely(src_addr < max_addr)) {
 		unsigned long max = max_addr - src_addr;
 		long retval;
-- 
2.22.0.709.g102302147b-goog

