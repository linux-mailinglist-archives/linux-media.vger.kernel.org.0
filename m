Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBE973163
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 16:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbfGXORC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 10:17:02 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39825 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfGXORB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 10:17:01 -0400
Received: by mail-pf1-f193.google.com with SMTP id f17so17039945pfn.6
        for <linux-media@vger.kernel.org>; Wed, 24 Jul 2019 07:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iVEa+BrbD+ybsnA2U1ljAFs3yPdamhmoGuSiTUjWPJ4=;
        b=DWU4WjGAtgl8VCFFOjc8wXQ0g23uMAUtJpd38Z3oaJgwn4NfatixOvhmdpOdL+fxhG
         e0wlc3X1shT5Iq30jjbbWGUReEBT4OBXlYiiQUhWx2Q7uiFMfOEneT8NH6f9J2qp0V5H
         uul5tf2SvUAF38K7907CwJA6dKexcEorDJsv/KoSqA3HSUAO6tsOMxjz0hFsJBWrp9kB
         d53dWGlSvFswyl6j+n5LUh4qGYRvo3+KwFNfAV8S+2jUqD0GvKKHxnABV1FWZ1+b1OBh
         oB2T3ZDN/Zfw5qlFjUWW5qYsM2z/YZXngByjiqcmIeT7gWGze9CMbYqnOAvNwjkoL4TA
         mEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iVEa+BrbD+ybsnA2U1ljAFs3yPdamhmoGuSiTUjWPJ4=;
        b=rZe4uL8QtnCNHbgUpmtwuucIBAhCF4s9ilZqsVyzeGz7c49cBqJo4RBm6qGWwvOfcw
         b1UzAznnE4JUswq3gctBseFiZCuWZJ9ctLjeo6gUwI6SuXMhYbbGBxrsQ6EWdHAsHKC2
         z7t/lb15qnsGkHwj/+1iqQ8rWl1+pS3td7dmmokqluJju/rVZo/Rw6aD6zi0y31ZPl/1
         hoscxbl4f8Xq/qsBb73cN7kvxlgr8Bumv4tUAvI4ghMUzQzNlYPnlYAdlK1qG2u7ZrNl
         Ml66mERSYMaPNYAPsH58ms4FXaypEYqy9VhFyGIjfxuzDBCdMkWpDyHQhS3eNCMfByKG
         MWqQ==
X-Gm-Message-State: APjAAAWSF+mMLz6m2sYG7RSV+Gs32/yjDID7qDXbeLh90qizP4MuqCL8
        FQIRKrAKVI0hNE/VXWM5tAAJv/VgB1xjozOBU4wp8w==
X-Google-Smtp-Source: APXvYqz2dMxGxnq2kAfIP49TpeG4FcaV+yTvRZ4CcUcR9QT0oeQ2GoQPtuki1B+xbKFnrASZfeBQUkyN7t1WRbfNCv8=
X-Received: by 2002:aa7:86c6:: with SMTP id h6mr11779914pfo.51.1563977820600;
 Wed, 24 Jul 2019 07:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com> <CAAeHK+yc0D_nd7nTRsY4=qcSx+eQR0VLut3uXMf4NEiE-VpeCw@mail.gmail.com>
 <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
In-Reply-To: <20190724140212.qzvbcx5j2gi5lcoj@willie-the-truck>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 24 Jul 2019 16:16:49 +0200
Message-ID: <CAAeHK+xXzdQHpVXL7f1T2Ef2P7GwFmDMSaBH4VG8fT3=c_OnjQ@mail.gmail.com>
Subject: Re: [PATCH v19 00/15] arm64: untag user pointers passed to the kernel
To:     Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        dri-devel@lists.freedesktop.org,
        Kostya Serebryany <kcc@google.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
        amd-gfx@lists.freedesktop.org,
        Christoph Hellwig <hch@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Dave Martin <Dave.Martin@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Lee Smith <Lee.Smith@arm.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        enh <enh@google.com>, Robin Murphy <robin.murphy@arm.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 24, 2019 at 4:02 PM Will Deacon <will@kernel.org> wrote:
>
> Hi Andrey,
>
> On Tue, Jul 23, 2019 at 08:03:29PM +0200, Andrey Konovalov wrote:
> > On Tue, Jul 23, 2019 at 7:59 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> > >
> > > === Overview
> > >
> > > arm64 has a feature called Top Byte Ignore, which allows to embed pointer
> > > tags into the top byte of each pointer. Userspace programs (such as
> > > HWASan, a memory debugging tool [1]) might use this feature and pass
> > > tagged user pointers to the kernel through syscalls or other interfaces.
> > >
> > > Right now the kernel is already able to handle user faults with tagged
> > > pointers, due to these patches:
> > >
> > > 1. 81cddd65 ("arm64: traps: fix userspace cache maintenance emulation on a
> > >              tagged pointer")
> > > 2. 7dcd9dd8 ("arm64: hw_breakpoint: fix watchpoint matching for tagged
> > >               pointers")
> > > 3. 276e9327 ("arm64: entry: improve data abort handling of tagged
> > >               pointers")
> > >
> > > This patchset extends tagged pointer support to syscall arguments.
>
> [...]
>
> > Do you think this is ready to be merged?
> >
> > Should this go through the mm or the arm tree?
>
> I would certainly prefer to take at least the arm64 bits via the arm64 tree
> (i.e. patches 1, 2 and 15). We also need a Documentation patch describing
> the new ABI.

Sounds good! Should I post those patches together with the
Documentation patches from Vincenzo as a separate patchset?

Vincenzo, could you share the last version of the Documentation patches?

Thanks!

>
> Will
