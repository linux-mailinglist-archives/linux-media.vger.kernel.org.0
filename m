Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E20363428A
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 18:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234510AbiKVReC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 12:34:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234516AbiKVRdr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 12:33:47 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB351809B0
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 09:33:37 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id d8so10732062qki.13
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 09:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y0TG7RSDJLBsFmv13T+kVLFnKE/Gs/+y0yFrl/WZR6s=;
        b=L0dZyDnVDHFIaOItmPGH7qgeLVW0usPCwRH/4nTimj8Xh9l2UXEZKNFm/ei9gDcq24
         Pk3u7Gq7lJi0kmr8z8NjnWgqP5s/GTGAjlS5nF3Rg8c28BPysVoaAoT/SPX3zkQcRIfE
         uip9ptnbHvWOX/Zei2bksChNqBhHUUkmXbxVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0TG7RSDJLBsFmv13T+kVLFnKE/Gs/+y0yFrl/WZR6s=;
        b=BIQqTBwJFhq2QXLk6nzMHadBGSJ0OF7Zy4QL69/us6V4RA0BY9kvOru175tZm9A6eV
         gcnhKXmQlyz+ZFpbFjPACT2AFQcW1xF373UXfitvcVX5LbrQwWjzHB8vnk2QRnJR5pbC
         r8FV+X0CUGFFsuis6GtM4PK0szEFvXTqWXPFVb+BbK+poy3ZR5uDVcCckeBvwAE3TwPN
         R+JjD8xqHZkAbrJORCUrTXZ9rYJg9upn6E77Kl9YnPABx4ZiYsHDabxHjkPWFegBNYsW
         dBwtwHHHNWq4TKyF8SBzTBb/fZ4pWgumgCUZ0q27gYgycqrsbudsdrksobNH3AKWeSxk
         Jddg==
X-Gm-Message-State: ANoB5pldxKZnYbpcAn8XsNixuRiw2BuPMnVkqI3G/m9WJrSon1Bi5T2n
        5FaapF/h3gZFsQ2fqid139hQf0WKpojarw==
X-Google-Smtp-Source: AA0mqf4UKt+kj6KbhJx26znP3sFIZTK70G0jF51GMJIGU5yFRVWIg+KwaDiv20Rckioz9CIcvYe1Gw==
X-Received: by 2002:a05:620a:15ea:b0:6f9:d799:3840 with SMTP id p10-20020a05620a15ea00b006f9d7993840mr21453582qkm.783.1669138416541;
        Tue, 22 Nov 2022 09:33:36 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id bq40-20020a05620a46a800b006fb7c42e73asm10543890qkb.21.2022.11.22.09.33.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 09:33:33 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id 8so10773317qka.1
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 09:33:32 -0800 (PST)
X-Received: by 2002:a05:620a:1fa:b0:6ee:24d5:b8fc with SMTP id
 x26-20020a05620a01fa00b006ee24d5b8fcmr21656006qkn.336.1669138412298; Tue, 22
 Nov 2022 09:33:32 -0800 (PST)
MIME-Version: 1.0
References: <20221107161740.144456-1-david@redhat.com> <20221107161740.144456-17-david@redhat.com>
 <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com> <6175d780-3307-854c-448a-8e6c7ad0772c@xs4all.nl>
In-Reply-To: <6175d780-3307-854c-448a-8e6c7ad0772c@xs4all.nl>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 22 Nov 2022 09:33:16 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh0nuSn=zYB1z9bHXJRPi33mmbpv-Z6z7ARkHQupbQ3fQ@mail.gmail.com>
Message-ID: <CAHk-=wh0nuSn=zYB1z9bHXJRPi33mmbpv-Z6z7ARkHQupbQ3fQ@mail.gmail.com>
Subject: Re: [PATCH RFC 16/19] mm/frame-vector: remove FOLL_FORCE usage
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        David Hildenbrand <david@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Matthew Wilcox <willy@infradead.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        David Airlie <airlied@gmail.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 22, 2022 at 4:25 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> I tracked the use of 'force' all the way back to the first git commit
> (2.6.12-rc1) in the very old video-buf.c. So it is very, very old and the
> reason is lost in the mists of time.

Well, not entirely.

For archaeology reasons, I went back to the old BK history, which
exists as a git conversion in

    https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/

and there you can actually find it.

Not with a lot of explanations, though - it's commit b7649ef789
("[PATCH] videobuf update"):

    This updates the video-buf.c module (helper module for video buffer
    management).  Some memory management fixes, also some adaptions to the
    final v4l2 api.

but it went from

         err = get_user_pages(current,current->mm,
-                            data, dma->nr_pages,
-                            rw == READ, 0, /* don't force */
+                            data & PAGE_MASK, dma->nr_pages,
+                            rw == READ, 1, /* force */
                             dma->pages, NULL);

in that commit.

So it goes back to October 2002.

> Looking at this old LWN article https://lwn.net/Articles/28548/ suggests
> that it might be related to calling get_user_pages for write buffers

The timing roughly matches.

> I assume that removing FOLL_FORCE from 'FOLL_FORCE|FOLL_WRITE' will still
> allow drivers to read from the buffer?

The issue with some of the driver hacks has been that

 - they only want to read, and the buffer may be read-only

 - they then used FOLL_WRITE despite that, because they want to break
COW (due to the issue that David is now fixing with his series)

 - but that means that the VM layer says "nope, you can't write to
this read-only user mapping"

 - ... and then they use FOLL_FORCE to say "yes, I can".

iOW, the FOLL_FORCE may be entirely due to an (incorrect, but
historically needed) FOLL_WRITE.

             Linus
