Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F87442463
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 13:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438435AbfFLLoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 07:44:00 -0400
Received: from mail-oi1-f201.google.com ([209.85.167.201]:47491 "EHLO
        mail-oi1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438430AbfFLLn7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 07:43:59 -0400
Received: by mail-oi1-f201.google.com with SMTP id s197so4865993oih.14
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2019 04:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Q196Me2jAIDAnTBGiPK/Cxn0vMZ4fncAn8y7f8WRTyA=;
        b=crJJXXAC2Ku7R2O4W/i46T8MVMbfUT08MJ41XL5/hHP5V9FjHyo0Uen9LNxuGDN5Vy
         63AWsHkedb9O9JWDh7PX7+icF3+aQrjNm9LMqOxXKSXvWvA1aCADx8vQJIjHIcqFjNdS
         lYpx+uRnlnGYhTQ2lQa8QHdE77x+n4mpr2sUjGrEPZ8RUtGTjRZ6moY6dJvWWn+KRbsY
         dQnCJW3fkugzHDg7Z7YzCoAOi+mpWJRQPWYBzTyBpPkH9NOLOyHd9BCpw34BLqWhA4XL
         4AfxwDFDvKPDrbAnUzBzbdpr67Rfah4zZpcEFIF5+I68PhpwUQ4ynpp9B2e02i2b/LFy
         ttKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Q196Me2jAIDAnTBGiPK/Cxn0vMZ4fncAn8y7f8WRTyA=;
        b=CsAESowrqZ6ckJuThaXLBXi+MBMGdDMxV745d1jQo5v05uAcD3zWpxyjcaRYvyEseD
         3akSu/8J2YWENIoAexR8ZrzGviMcXUHfk7qDEQtYpUL0vywkfhYIYGAlk5LqxsNE1eJ2
         gEatlOzwB1BuyNfu8HGoJ+btkuMdc4ewnOTgLlDX99SX+AHqRoErEpjbnbW4k0YEHKjB
         15mSl4D14M45ZVqoUgmq9E948fIgNmCuJwNzZo4YKpI4FMPZzDhYl29kLRI1FOJNRdZ2
         t3od8mYrkPASQb/i9NIhAAB5PFQTXzUfbda64FYQxUE+hcwV3uUGBjXzfTipMzrUmIOa
         l3KQ==
X-Gm-Message-State: APjAAAV3gYHNUU53JdkM/RruSPpMfpNxP8sjX/65YIvWOmisl2db9nvY
        XYFxIvD5nA80dW1TfMuGMURmT074fAu8wTu5
X-Google-Smtp-Source: APXvYqzBV++HnsJqGVA3TkWLFAlh+OLmBH/rJ20EXP8gbe+qklBNVVp+IuIonV1uuXEIF8K1ppBAgAEKJRpWB8lr
X-Received: by 2002:aca:6c6:: with SMTP id 189mr17818209oig.167.1560339838959;
 Wed, 12 Jun 2019 04:43:58 -0700 (PDT)
Date:   Wed, 12 Jun 2019 13:43:24 +0200
In-Reply-To: <cover.1560339705.git.andreyknvl@google.com>
Message-Id: <4ed871e14cc265a519c6ba8660a1827844371791.1560339705.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v17 07/15] fs, arm64: untag user pointers in copy_mount_options
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

In copy_mount_options a user address is being subtracted from TASK_SIZE.
If the address is lower than TASK_SIZE, the size is calculated to not
allow the exact_copy_from_user() call to cross TASK_SIZE boundary.
However if the address is tagged, then the size will be calculated
incorrectly.

Untag the address before subtracting.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 fs/namespace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index b26778bdc236..2e85712a19ed 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -2993,7 +2993,7 @@ void *copy_mount_options(const void __user * data)
 	 * the remainder of the page.
 	 */
 	/* copy_from_user cannot cross TASK_SIZE ! */
-	size = TASK_SIZE - (unsigned long)data;
+	size = TASK_SIZE - (unsigned long)untagged_addr(data);
 	if (size > PAGE_SIZE)
 		size = PAGE_SIZE;
 
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

