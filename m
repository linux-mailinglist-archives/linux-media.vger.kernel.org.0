Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99566CE763
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbfJGP0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:26:08 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:39737 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbfJGP0I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 11:26:08 -0400
Received: by mail-qk1-f195.google.com with SMTP id 4so12955364qki.6;
        Mon, 07 Oct 2019 08:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hRmOGZNk0NYT+fMDvkYsRiFnwMnhVC+gnIUxAp3rxvA=;
        b=cEa/slRgbL1KiavJbV3A2W5023VI3OILGpSU7kVa2yCrB+n9XKv4hBVTvZb4t2qfn9
         nUZukODprRWZiJe8L5Shkd/LVcvf8tfKG3y7sKbQOgr9eKJoRSx+yX2Snf1Cejx9ionu
         7Vxgp3ZEZ6nHMupqlIZBMXmZpBjN1f+Tzqc+kJrcftVmbdeHYh2l5d0/e5ACSQxCZbRK
         ry2ydqN0E/v5d+HhBG3xUXWkTxYYfDRd+0xAQApm31Ue4TWgSMkWPVTl9BepxxX4YbDV
         E3qPufOqyWd4Mc3cPerOTcar7M9Ohth0Xjow7vFKBf4FcNctd91lS53+KHanXpKh/Hjh
         Cu8A==
X-Gm-Message-State: APjAAAUf2UAHwmkI6l5jtiai4Ne56GRRtxRFnheN14hiXRxX1hBw0BBp
        1MAqOwdlPmABcSv/B5JUXUEogs2YnuLnBufoTS8=
X-Google-Smtp-Source: APXvYqx8CqljIh59ZpHzfr7qLshwyG8IAhJfuGpUA+FlV2i2zLh2cOLP3/3M60nyXKm3gmOxZ8L1hPEVku4m2H6b2Kk=
X-Received: by 2002:ae9:c110:: with SMTP id z16mr24108618qki.352.1570461967381;
 Mon, 07 Oct 2019 08:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191007040935.23436-1-yamada.masahiro@socionext.com>
In-Reply-To: <20191007040935.23436-1-yamada.masahiro@socionext.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 7 Oct 2019 17:25:51 +0200
Message-ID: <CAK8P3a0g5iEtbFGk2BE6x3GrE5=zXngecLFUVFPWFqL3NZUwhg@mail.gmail.com>
Subject: Re: [RFC PATCH] media: videodev2.h: include <linux/time.h> instead of <sys/time.h>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
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

On Mon, Oct 7, 2019 at 6:10 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Currently, linux/videodev.h is excluded from the UAPI header test since
> it is not self-contained. Building it for user-space would fail.
>

>
> Replacing <sys/time.h> with <linux/time.h> solves it, and allow more
> headers to join the UAPI header test.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> I am not 100% sure about the compatibility
> between <sys/time.h> and <linux/time.h>, hence RFC.
>
> But, if they were not compatible,
> I guess it would have broken already.
>
> I CCed Arnd Bergmann, who might have a better insight.
>
> A related comment is here:
> https://lkml.org/lkml/2019/6/4/1046

I don't think this can work, there are multiple problems here:

* linux/time.h is still incompatible with sys/time.h, so any application
  tries to include both sys/time.h and linux/videodev2.h now also
  gets the compile-time error.

* The definition of 'struct timespec' in the kernel headers may in
  fact be different from the one in the libc, and we do want to use
  the one from the C library here, otherwise different parts of the
  application may use incompatible struct layouts.

Fixing this correctly depends on one of the remaining y2038
patches that we still have to revisit. There are two aspects that
we should address:

1. The v4l subsystem needs to be changed to handle both the
    old and the new 32-bit layout for timespec (and timeval). Both
    Hans and I have created patches for this in the past, but they
    were never completed and merged.

2. The definition of 'struct timespec' in the kernel headers needs
   to be removed after every user of this struct is gone from
   the kernel. In internal kernel code, the replacement is
   timespec64 or ktime_t, and in user space interfaces, the
   correct replacement is one of __kernel_timespec (the 64-bit
   version), __kernel_old_timespec (the traditional layout) or
   timespec (from the libc headers).

        Arnd
