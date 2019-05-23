Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7CBD28C59
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2019 23:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387725AbfEWVbU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 17:31:20 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44542 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387832AbfEWVbT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 17:31:19 -0400
Received: by mail-pf1-f193.google.com with SMTP id g9so3944447pfo.11
        for <linux-media@vger.kernel.org>; Thu, 23 May 2019 14:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RooTx4nZ0Zm8m1fxzq6UPxwDmwN2R9frxfJHiTxcRUE=;
        b=SXshT/JWt4/VxFaxzUCPBis/uU7CKJhnvqILKuBvKuHgZM/0X3lQPlS9BrcA9GPwgN
         mNP52DBHjW70HoXLGw3kCTAML6GHF8r2zv6T7pohAbgiWS2GBzlP+CcIwmEuaO+qZxq4
         C2Jko0HEb2Ra0I9vlZLyIy+YOud56hz3nr/kE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RooTx4nZ0Zm8m1fxzq6UPxwDmwN2R9frxfJHiTxcRUE=;
        b=LNjqWlh7VZ/g6e2BWDkKfJe9TMWXdzuWDao/u8VfZOr6BxBq2ZtgleF7QxaV9wz6kp
         IKE+RCTW5BermHQkie9KpqZV5Ucfs5Uipwb9eQ6TOE3eoMjcboLdoilaB4jXb6DSxa1M
         BcrHGI+9amUh0AO1P+LXwdpMIVp0KE3XSnYzUlMcncl8O0o2CHyyxXeUINF+HpmYkDBX
         nRbjS/c+BqSA7ikICdEZ9kQQ80sfJ3/ZpTEVXD//CRAUucrmeU7CAOVM+A4cuCFP1LWG
         Jknrhitse1EPndOeVkRM1izB9KIdIhB6XA6xpbVX63TuL0/8LOE8z/2l1S8FuD846rAM
         NmzQ==
X-Gm-Message-State: APjAAAWny5GVEvZWDwECcgdBpNYENssY09wZBrpgYOi6qh5KJ233rwwp
        AqvuroT7zfCTtcG2zU8itaTy3Q==
X-Google-Smtp-Source: APXvYqw6NOt/dAzFGypTG6hDOH9RhK81m8D3qkjrLvBMN1nJLO77YhSc++d1DOA7/Z/CI2DiFH6JYA==
X-Received: by 2002:a63:2226:: with SMTP id i38mr5980879pgi.403.1558647079048;
        Thu, 23 May 2019 14:31:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f186sm406654pfb.5.2019.05.23.14.31.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 14:31:17 -0700 (PDT)
Date:   Thu, 23 May 2019 14:31:16 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     enh <enh@google.com>, Evgenii Stepanov <eugenis@google.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
        kvm@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <201905231327.77CA8D0A36@keescook>
References: <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <20190522101110.m2stmpaj7seezveq@mbp>
 <CAJgzZoosKBwqXRyA6fb8QQSZXFqfHqe9qO9je5TogHhzuoGXJQ@mail.gmail.com>
 <20190522163527.rnnc6t4tll7tk5zw@mbp>
 <201905221316.865581CF@keescook>
 <20190523144449.waam2mkyzhjpqpur@mbp>
 <201905230917.DEE7A75EF0@keescook>
 <20190523174345.6sv3kcipkvlwfmox@mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523174345.6sv3kcipkvlwfmox@mbp>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 23, 2019 at 06:43:46PM +0100, Catalin Marinas wrote:
> On Thu, May 23, 2019 at 09:38:19AM -0700, Kees Cook wrote:
> > What on this front would you be comfortable with? Given it's a new
> > feature isn't it sufficient to have a CONFIG (and/or boot option)?
> 
> I'd rather avoid re-building kernels. A boot option would do, unless we
> see value in a per-process (inherited) personality or prctl. The

I think I've convinced myself that the normal<->TBI ABI control should
be a boot parameter. More below...

> > What about testing tools that intentionally insert high bits for syscalls
> > and are _expecting_ them to fail? It seems the TBI series will break them?
> > In that case, do we need to opt into TBI as well?
> 
> If there are such tools, then we may need a per-process control. It's
> basically an ABI change.

syzkaller already attempts to randomly inject non-canonical and
0xFFFF....FFFF addresses for user pointers in syscalls in an effort to
find bugs like CVE-2017-5123 where waitid() via unchecked put_user() was
able to write directly to kernel memory[1].

It seems that using TBI by default and not allowing a switch back to
"normal" ABI without a reboot actually means that userspace cannot inject
kernel pointers into syscalls any more, since they'll get universally
stripped now. Is my understanding correct, here? i.e. exploiting
CVE-2017-5123 would be impossible under TBI?

If so, then I think we should commit to the TBI ABI and have a boot
flag to disable it, but NOT have a process flag, as that would allow
attackers to bypass the masking. The only flag should be "TBI or MTE".

If so, can I get top byte masking for other architectures too? Like,
just to strip high bits off userspace addresses? ;)

(Oh, in looking I see this is implemented with sign-extension... why
not just a mask? So it'll either be valid userspace address or forced
into the non-canonical range?)

[1] https://salls.github.io/Linux-Kernel-CVE-2017-5123/

> > Alright, the tl;dr appears to be:
> > - you want more assurances that we can find __user stripping in the
> >   kernel more easily. (But this seems like a parallel problem.)
> 
> Yes, and that we found all (most) cases now. The reason I don't see it
> as a parallel problem is that, as maintainer, I promise an ABI to user
> and I'd rather stick to it. I don't want, for example, ncurses to stop
> working because of some ioctl() rejecting tagged pointers.

But this is what I don't understand: it would need to be ncurses _using
TBI_, that would stop working (having started to work before, but then
regress due to a newly added one-off bug). Regular ncurses will be fine
because it's not using TBI. So The Golden Rule isn't violated, and by
definition, it's a specific regression caused by some bug (since TBI
would have had to have worked _before_ in the situation to be considered
a regression now). Which describes the normal path for kernel
development... add feature, find corner cases where it doesn't work,
fix them, encounter new regressions, fix those, repeat forever.

> If it's just the occasional one-off bug I'm fine to deal with it. But
> no-one convinced me yet that this is the case.

You believe there still to be some systemic cases that haven't been
found yet? And even if so -- isn't it better to work on that
incrementally?

> As for the generic driver code (filesystems or other subsystems),
> without some clear direction for developers, together with static
> checking/sparse, on how user pointers are cast to longs (one example),
> it would become my responsibility to identify and fix them up with any
> kernel release. This series is not providing such guidance, just adding
> untagged_addr() in some places that we think matter.

What about adding a nice bit of .rst documentation that describes the
situation and shows how to use untagged_addr(). This is the kind of
kernel-wide change that "everyone" needs to know about, and shouldn't
be the arch maintainer's sole responsibility to fix.

> > - we might need to opt in to TBI with a prctl()
> 
> Yes, although still up for discussion.

I think I've talked myself out of it. I say boot param only! :)


So what do you say to these next steps:

- change untagged_addr() to use a static branch that is controlled with
  a boot parameter.
- add, say, Documentation/core-api/user-addresses.rst to describe
  proper care and handling of user space pointers with untagged_addr(),
  with examples based on all the cases seen so far in this series.
- continue work to improve static analysis.

Thanks for wading through this with me! :)

-- 
Kees Cook
