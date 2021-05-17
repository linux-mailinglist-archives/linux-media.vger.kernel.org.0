Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D625B382D78
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 15:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237363AbhEQNdM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 09:33:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:55352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236025AbhEQNdM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 09:33:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD32661059;
        Mon, 17 May 2021 13:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621258315;
        bh=f+QsKFpxulTiJEqPxtn7sYDkXgFKYgNnRUsGMn1mb58=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hsg6M6X04FjNFZ+/YsrJdxpOtthHLbBtmgVtLmUp8OkIhVYtxRaNqYIjFmoBeNWS0
         vTZoAEDlkNQQSKxbQTosRDhOWAWhBgbff8NYiCpN4+7QA8eB19Wu6UrLTT8ozJsOe4
         MEH78DVJl6SHRa1d7pslgs3q0zPDt4VPctEiOoOsdEDzBY+FiOoACpCY8nxP2JKIQQ
         YibFOyHTOhJjpIGQcZiv+f3O885CPZKBafWnX28IMT8ZN6YrGAnMIUooBK1ff/J+NO
         BcI5bl2O0zmJ0/A2wBs2aPJ/QVPfOU7E+6qQo+bcoTAHeOJce34LFH1XNOBK8aVA4x
         zls6b4+PItSCg==
Received: by mail-wm1-f43.google.com with SMTP id 62so2568138wmb.3;
        Mon, 17 May 2021 06:31:55 -0700 (PDT)
X-Gm-Message-State: AOAM531uHLg7A2V2SWvChiQKOcQbJ1doaEdD6hbyA2ZNxZk5fQIER5Vz
        afEWRo5pTa4GDopmXdyVD+xAfnyVQ7EO/5/HqNM=
X-Google-Smtp-Source: ABdhPJyPXQZMnaKFMh5PmyX9H7NAS3ax3YjYJW/PrEHu7/bA3wMQGIFnlkko69IUjvAWYWCFEorh1WK5xXdpRvvSLRk=
X-Received: by 2002:a7b:c446:: with SMTP id l6mr7405175wmi.75.1621258314423;
 Mon, 17 May 2021 06:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210516204818.2967910-1-arnd@kernel.org> <20210517130852.GA18985@lst.de>
In-Reply-To: <20210517130852.GA18985@lst.de>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 17 May 2021 15:30:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0b+OAJgwpa0-nYGPgDttzZ=Epg5p46OY0ZWea5sp0Tzw@mail.gmail.com>
Message-ID: <CAK8P3a0b+OAJgwpa0-nYGPgDttzZ=Epg5p46OY0ZWea5sp0Tzw@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: remove compat_ioctl32 code
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 17, 2021 at 3:08 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sun, May 16, 2021 at 10:47:43PM +0200, Arnd Bergmann wrote:
> > This is one of the last remaining users of compat_alloc_user_space()
> > and copy_in_user(), which are in the process of getting removed.
>
> Are you also going to resend the other compat_alloc_user_space removal
> patches?  It would be great to see it buried ASAP.

Yes, I'm in the middle of rebasing and fixing that. I sent this one as it
was on the bottom of the branch and with no other dependencies. The
other bits are:

- kexec and numa syscalls, currently build testing after gcc-11 pointed out
  a typo in the previous version.
- rewrite of socket/device compat ioctl handling, previous version had a
  build failure and some minor checkpatch.pl issues
- overhaul of netdev ndo_do_ioctl, not strictly related but helps to prove
  that the compat ioctl changes are correct and is probably a good idea
  regardless, this needed a number of changes for bits I had missed the
  first time around.
- a simple patch to remove the now obsolete helper functions,
  needed a rebase for 5.13-rc1. If everything else gets merged for 5.14
  this might be something that Andrew can pick up for sending late
  in the merge window, or I'll send it for 5.15 through the asm-generic
  tree.

I pushed it all for reference to

https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
compat-alloc-user-space-9

I should be able to patch-bomb everyone tomorrow unless the build bots
find more issues.

         Arnd
