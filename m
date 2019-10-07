Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8237ECE9D2
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 18:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbfJGQtG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 12:49:06 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:63063 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728139AbfJGQtG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 12:49:06 -0400
X-Greylist: delayed 45485 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Oct 2019 12:49:04 EDT
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x97GmZqd019698;
        Tue, 8 Oct 2019 01:48:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x97GmZqd019698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570466916;
        bh=y8kJOcEkslZAk6vscewNCsiqfVNW7HLOUn33XrjSX/8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aXYdfkT/lgvsiWWfLjWAPX0ggr0leZTUeugZDoWrJ3v1WO1pQggaUnuJJxxqDD33P
         akR1Nz+raADcws3tEpXHnNGRGt21pZLBFZ6wNWsc31Wx/kMBfuDfUflzUJfMtG7v6Q
         I1enx8WdkLA1WKIhMd04HK7MThbk932x/DBZOT4r3ynbjvMpb6iflWIWFJz/gpnwCZ
         7sXW6tj0+SZ0R1Ir26uyUZ3zGsACkW54cZN0Hm1L+uQzk2o+PQ/BgxUyIqrg9047bF
         rwmVM6HLM13vfjOTKLXQs797gmP3pgikdlUBuefD80ZBe0Pj1usplMjlHYtByqD3OZ
         vW9bSR2haFsuQ==
X-Nifty-SrcIP: [209.85.221.171]
Received: by mail-vk1-f171.google.com with SMTP id f1so3117312vkh.9;
        Mon, 07 Oct 2019 09:48:35 -0700 (PDT)
X-Gm-Message-State: APjAAAWUIg6L5+ycpHtZOrB28TMHIaZQPFZfEM9k2l6fmFU+Zumacbtl
        otGyje+3sZ5Ql/MsrHwSidZaiZQLT+pQWPKQDWI=
X-Google-Smtp-Source: APXvYqz7ukzVlMcJueOvYoOURcSnxC1SoQJMDggO8QxxUau2yVIUqwN1Rp39wa8jRdIxVVo8igICcocuPeFehW+TIOc=
X-Received: by 2002:a1f:5243:: with SMTP id g64mr14817662vkb.26.1570466914476;
 Mon, 07 Oct 2019 09:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191007040935.23436-1-yamada.masahiro@socionext.com> <CAK8P3a0g5iEtbFGk2BE6x3GrE5=zXngecLFUVFPWFqL3NZUwhg@mail.gmail.com>
In-Reply-To: <CAK8P3a0g5iEtbFGk2BE6x3GrE5=zXngecLFUVFPWFqL3NZUwhg@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 8 Oct 2019 01:47:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNASQ32R1-tqGDjnGYwMuOo=+SZMhzb7T39F-nKzr+=NaNQ@mail.gmail.com>
Message-ID: <CAK7LNASQ32R1-tqGDjnGYwMuOo=+SZMhzb7T39F-nKzr+=NaNQ@mail.gmail.com>
Subject: Re: [RFC PATCH] media: videodev2.h: include <linux/time.h> instead of <sys/time.h>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On Tue, Oct 8, 2019 at 12:26 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Oct 7, 2019 at 6:10 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Currently, linux/videodev.h is excluded from the UAPI header test since
> > it is not self-contained. Building it for user-space would fail.
> >
>
> >
> > Replacing <sys/time.h> with <linux/time.h> solves it, and allow more
> > headers to join the UAPI header test.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> > I am not 100% sure about the compatibility
> > between <sys/time.h> and <linux/time.h>, hence RFC.
> >
> > But, if they were not compatible,
> > I guess it would have broken already.
> >
> > I CCed Arnd Bergmann, who might have a better insight.
> >
> > A related comment is here:
> > https://lkml.org/lkml/2019/6/4/1046
>
> I don't think this can work, there are multiple problems here:
>
> * linux/time.h is still incompatible with sys/time.h, so any application
>   tries to include both sys/time.h and linux/videodev2.h now also
>   gets the compile-time error.

You are right.
I am so stupidly screwed up. Palm face...

Please ignore this patch,
and thank you for your expert comments!


>
> * The definition of 'struct timespec' in the kernel headers may in
>   fact be different from the one in the libc, and we do want to use
>   the one from the C library here, otherwise different parts of the
>   application may use incompatible struct layouts.
>
> Fixing this correctly depends on one of the remaining y2038
> patches that we still have to revisit. There are two aspects that
> we should address:
>
> 1. The v4l subsystem needs to be changed to handle both the
>     old and the new 32-bit layout for timespec (and timeval). Both
>     Hans and I have created patches for this in the past, but they
>     were never completed and merged.
>
> 2. The definition of 'struct timespec' in the kernel headers needs
>    to be removed after every user of this struct is gone from
>    the kernel. In internal kernel code, the replacement is
>    timespec64 or ktime_t, and in user space interfaces, the
>    correct replacement is one of __kernel_timespec (the 64-bit
>    version), __kernel_old_timespec (the traditional layout) or
>    timespec (from the libc headers).
>
>         Arnd



--
Best Regards

Masahiro Yamada
