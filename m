Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFF404C93ED
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 20:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiCATID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 14:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbiCATIC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 14:08:02 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4428866CA8
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 11:07:20 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id v22so23171398ljh.7
        for <linux-media@vger.kernel.org>; Tue, 01 Mar 2022 11:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+FYbGAw6yxU17iUDUp61Ry7f+ZSO9wN0ehJ+hGfk2DQ=;
        b=NEmpYuhxkY3jphhiKwB9rL7CFHETV0OarciDwH/Y25b8gogpFDGLbcsm2Hp5JlhbRM
         fgLdNaX0z1k1bpDTdAa2T+xhPoQGBlkWInAyVtxomjmoWydKKz6S1Vw5P8QyPxUNcXPG
         O8s4ZVUjpR1ZVkG2oqZOMI9ApgRXI/RsyC5iE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+FYbGAw6yxU17iUDUp61Ry7f+ZSO9wN0ehJ+hGfk2DQ=;
        b=jh7HWdDt7mnrkTFDpCZJ74NnQg6a7CxKOausUtxRoQ8tSfcrv5lvNf+Fpitt2GhdRJ
         F6ztCwaqLBQz67npYyHeXh9d9uvZnP/F04Ual75p4ovrBHvT5gU+YvIAi5hLr6Z1K4X8
         HpRnACeeOXHiSr5vjGA9CD7qR2aC/h3PFgqCxLyy17xBCcpKbXFHjwjhjyyH28IAbL1+
         WysNHgvAfD7mkO0VJkvYNIIxDQvYv2w67ZL39Y6pDOlhl9ay4GaXbBIOU+AwDvdDomZN
         AFLDwk0LyE+RuVJaCPjXnZWn6CFRsMgoDfjNZvv23waqCN5MHGUZTJRi3e7/6vX7jdkt
         VXqg==
X-Gm-Message-State: AOAM5336fC1l0lX/Xu7Tf6oDKoVaRT+mBJ1cViTYpgzVTh1//QiMqDCn
        KivNgPjVUnjn0gyEfUjdgGs2ztQ1TPJxTDa2D2s=
X-Google-Smtp-Source: ABdhPJxwpfUgvbH+VnY1dffRYxRI/6W6vcMaf0ZAEAnhyuj3F36GOeFk3KpK/2K0bcR/5eQTGhveWw==
X-Received: by 2002:a2e:155d:0:b0:246:c5c:84d4 with SMTP id 29-20020a2e155d000000b002460c5c84d4mr18508097ljv.150.1646161638343;
        Tue, 01 Mar 2022 11:07:18 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id s6-20020ac25fa6000000b0044313e88020sm1622222lfe.202.2022.03.01.11.07.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 11:07:15 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id b11so28474295lfb.12
        for <linux-media@vger.kernel.org>; Tue, 01 Mar 2022 11:07:13 -0800 (PST)
X-Received: by 2002:a2e:3013:0:b0:246:2ca9:365e with SMTP id
 w19-20020a2e3013000000b002462ca9365emr17902580ljw.291.1646161622598; Tue, 01
 Mar 2022 11:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com> <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com> <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org> <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
In-Reply-To: <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 1 Mar 2022 11:06:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
Message-ID: <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To:     James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Mike Rapoport <rppt@kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Jakob Koschel <jakobkoschel@gmail.com>,
        alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        samba-technical@lists.samba.org,
        linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
        linux-arch <linux-arch@vger.kernel.org>,
        CIFS <linux-cifs@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        intel-wired-lan@lists.osuosl.org,
        kgdb-bugreport@lists.sourceforge.net,
        bcm-kernel-feedback-list@broadcom.com,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Arnd Bergman <arnd@arndb.de>,
        Linux PM <linux-pm@vger.kernel.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        v9fs-developer@lists.sourceforge.net,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sgx@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
        linux-wireless <linux-wireless@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux F2FS Dev Mailing List 
        <linux-f2fs-devel@lists.sourceforge.net>,
        tipc-discussion@lists.sourceforge.net,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        dma <dmaengine@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 28, 2022 at 2:29 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> However, if the desire is really to poison the loop variable then we
> can do
>
> #define list_for_each_entry(pos, head, member)                          \
>         for (pos = list_first_entry(head, typeof(*pos), member);        \
>              !list_entry_is_head(pos, head, member) && ((pos = NULL) == NULL;                   \
>              pos = list_next_entry(pos, member))
>
> Which would at least set pos to NULL when the loop completes.

That would actually have been excellent if we had done that
originally. It would not only avoid the stale and incorrectly typed
head entry left-over turd, it would also have made it very easy to
test for "did I find an entry in the loop".

But I don't much like it in the situation we are now.

Why? Mainly because it basically changes the semantics of the loop
_without_ any warnings about it.  And we don't actually get the
advantage of the nicer semantics, because we can't actually make code
do

        list_for_each_entry(entry, ....) {
                ..
        }
        if (!entry)
                return -ESRCH;
        .. use the entry we found ..

because that would be a disaster for back-porting, plus it would be a
flag-day issue (ie we'd have to change the semantics of the loop at
the same time we change every single user).

So instead of that simple "if (!entry)", we'd effectively have to
continue to use something that still works with the old world order
(ie that "if (list_entry_is_head())" model).

So we couldn't really take _advantage_ of the nicer semantics, and
we'd not even get a warning if somebody does it wrong - the code would
just silently do the wrong thing.

IOW: I don't think you are wrong about that patch: it would solve the
problem that Jakob wants to solve, and it would have absolutely been
much better if we had done this from the beginning. But I think that
in our current situation, it's actually a really fragile solution to
the "don't do that then" problem we have.

              Linus
