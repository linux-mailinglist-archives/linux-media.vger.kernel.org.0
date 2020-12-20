Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E98792DF544
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 12:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbgLTLhV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 06:37:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:42626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727120AbgLTLhU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 06:37:20 -0500
X-Gm-Message-State: AOAM531cS4pL7B+Y7xIYEIiMEbP1bqHaupqQF2+30V8EFMUPRvQsIRBb
        JZe71yiVP6g248IeGycDsa/5NyYznLHwpfzm94E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608464200;
        bh=nKz7HqIQdf6MYcrqYLwcQ/mev6+3vH5Cp9thnoTcihY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cBlmCFcA9T6oyZ+6fTE+/gRz92K53w5qFPiomHC0ybUFQnZEg8LSWK2019Eujk1HT
         tw/MttEHdUdhsm2o+52fWrEcRRWVNSp2ONJTFnBO/KQkrpV7WDbD407SJZP8xiUQUt
         l8FK3JNRCCHRC2CwYXdb6/w7f0hLS+bn465MT4/BB8qapBmJVwgzSQGvZWUsbdXrou
         goR0h4Nb2O0PvPr9WuWObS5WUVOnsCMglfSFkik09ZBXMNFLDLvnxccaGQBZRc73oo
         b3qbSENMTU/WSJQD+/4zBSlBkSKw2wKK9QyF2kNPCmfT1FXI8ot/5ee34CC+J/gVK7
         oRPR6Ggj1eGDA==
X-Google-Smtp-Source: ABdhPJxPJ15QqaIEYK32bS57mk4izTUt5SyVPFmCD3lQcwsTeV2SPi9UopKjt0p8NNSC5XBahe1u62sw+fV7vsSTTrg=
X-Received: by 2002:a4a:2cc9:: with SMTP id o192mr6769657ooo.66.1608464199562;
 Sun, 20 Dec 2020 03:36:39 -0800 (PST)
MIME-Version: 1.0
References: <20201220110651.13432-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20201220110651.13432-1-sakari.ailus@linux.intel.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Sun, 20 Dec 2020 12:36:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3s=yU=PW7zLc4M83DksxAsb=v8r4U6aAySj2-nmeczjA@mail.gmail.com>
Message-ID: <CAK8P3a3s=yU=PW7zLc4M83DksxAsb=v8r4U6aAySj2-nmeczjA@mail.gmail.com>
Subject: Re: [PATCH 1/1] v4l: ioctl: Fix memory leak in video_usercopy
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        syzbot <syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Dec 20, 2020 at 12:06 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> When an IOCTL with argument size larger than 128 that also used array
> arguments were handled, two memory allocations were made but alas, only
> the latter one of them was released. This happened because there was only
> a single local variable to hold such a temporary allocation.
>
> Fix this by adding separate variables to hold the pointers to the
> temporary allocations.
>
> Reported-by: Arnd Bergmann <arnd@kernel.org>
> Reported-by: syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com
> Fixes: d14e6d76ebf7 ("[media] v4l: Add multi-planar ioctl handling code")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

>  out:
> +       kvfree(array_buf);
>         kvfree(mbuf);

I think it would make sense to change mbuf back to kzalloc()/kfree
after this, since the size of the ioctl argument has an upper bound
of 2^_IOC_SIZEBITS (16KB), which does not need the vmalloc
path, unlike the array args.

        Arnd
