Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD067268C9
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 20:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbjFGSdE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 14:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbjFGSdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 14:33:03 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3E919AC
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 11:32:59 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-5ed99ebe076so75130996d6.2
        for <linux-media@vger.kernel.org>; Wed, 07 Jun 2023 11:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686162779; x=1688754779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4aYkPwG93MaBpVdHNNDtdgKkzDBNwCYxGwhoncTbnEw=;
        b=rJQaQ5H/qeY0ATSGXZ435aBiELRUvZmPVCjaSO8igdXknfmwU+kEvyq3FLFTqKtfkx
         JYTOP2qIc0o33Kix0J8X0AG8i3H69a9qUb0nelVi6dtfonqwoAq70yosJz4GHe15uhom
         EiXLBYYiz1UMifA+Uh8d8EAb8KLUdWqMSt7Jo4Vp0tG9uNNlpAeHtNoWQLptkeXyYanj
         zvz2ITcYL7NbZmrNpih5ekE9Ik9BgdU+blbLXz21YvoXoOsQtc7lE7OgaXs6LdqpvfBB
         KH1jZdsW4JUewegTr4KVMdhWf2sP7+uxmwHJszcHUbK+x2pFi7mCjBzwpLkIynpWnJbD
         MiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686162779; x=1688754779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aYkPwG93MaBpVdHNNDtdgKkzDBNwCYxGwhoncTbnEw=;
        b=ifH40M/OvoPUb5o7gtHS+MYEKMvWsuCEIs/wST5+h4QHIpMapg02eNVwHK0YKyv04e
         mwiZpdnm4YfL3deojcjSC6+J7KGGJmygofJZNT7ex9Vuqe9X8paI6n2nrbgucmY5X++6
         ohqpwYlCYh+lcqlXPVSCJwlxdo2oE041a8KjcCG+f+ipxM79fIsuna23ZZgg0CGN0Slh
         wjTDv9p2/vQX//nGziy22IqF+eZ36cszSuHhSNNv+ONp+B9Hy+u+74GWznaiASUUXyg9
         x/kBnsLZi1hbE/7SwAv5CBbNVPwRZU8t3N8mdIWROrKkqz3rfPBzK7o+CLPVbbIsFCy2
         270A==
X-Gm-Message-State: AC+VfDycekHqIlaRLc/lmOSEHtpVl2KBdSgj+pnHerz5/2Uuua1Hdf/l
        q8DgF5WeWHL9zAq0k9Ie6dIzgwJUhHkKQQuXPofRGg==
X-Google-Smtp-Source: ACHHUZ7gdTzPLDVkGAP4JYgD+4TeTk6a4JeMaNWpt1SjCij7Aj30LsuafUkmBCzVyz/XE6LqW2wRtGfEoWCEZNuVE30=
X-Received: by 2002:a05:6214:20cb:b0:628:8185:bd6e with SMTP id
 11-20020a05621420cb00b006288185bd6emr5430253qve.5.1686162778721; Wed, 07 Jun
 2023 11:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYs4JsmNxX4+W=wijfSPdDsOy=SWLBSitZper5ncPpdxqA@mail.gmail.com>
 <Y/T7unUf10Wis59a@smile.fi.intel.com> <Y/UFV2bgSyBI37vi@smile.fi.intel.com>
In-Reply-To: <Y/UFV2bgSyBI37vi@smile.fi.intel.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Wed, 7 Jun 2023 20:32:47 +0200
Message-ID: <CADYN=9KCvyakA_8hN1QvSEvurfuUYoEyB1X3T9eYn3K1u2WMNQ@mail.gmail.com>
Subject: Re: arm64: libgpiod: refcount_t: underflow; use-after-free.
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Ferry Toth <fntoth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>, warthog618@gmail.com,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 21 Feb 2023 at 18:54, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Feb 21, 2023 at 07:13:31PM +0200, Andy Shevchenko wrote:
> > On Mon, Feb 20, 2023 at 08:29:27PM +0530, Naresh Kamboju wrote:
> > > Following kernel warning notices on qemu-arm64, qemu-arm and also on devices
> > > running Linux version v6.2.0 while running libgpiod tests.
>
> ...
>
> > -             ACPI_COMPANION_SET(&pdev->dev, NULL);
>
> This line should stay otherwise it will remove the device that may share
> the fwnode with this newly created platform device.
>

I was this issue on todays next tag: next-20230607 too, when I ran
libgpiod v1.6.4, and I
trieed to apply your proposed patch, but it didn't solve the
"refcount_t: underflow; use-after-free.".

However, understand that I shouldn't run libgpiod v1.6.4, but I did by
accident. Not sure
that I think I should get a use-after-free if I run the wrong version
of the test-suite or?

Running with libgpiod v2.0.1 I do not see this use-after-free issue.

This is how I reproduced the issue on todays next tag next-20230607, I
use tuxmake [1] to build the kernel and tuxrun [2] to run test with
the booted kernel.
$git checkout next-20230607
$ tuxmake --runtime podman --target-arch arm64 --toolchain gcc-12
--kconfig defconfig --kconfig-add
https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft-crypto.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/distro-overrides.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/systemd.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/virtio.config
--kconfig-add CONFIG_ARM64_MODULE_PLTS=y --kconfig-add
CONFIG_SYN_COOKIES=y --kconfig-add CONFIG_SCHEDSTATS=y --kconfig-add
CONFIG_GPIOLIB=y --kconfig-add CONFIG_GPIO_CDEV=y --kconfig-add
CONFIG_GPIO_MOCKUP=m --kconfig-add CONFIG_GPIO_SIM=m --results-hook
'tuxrun --runtime podman --device qemu-arm64 --boot-args rw --tuxmake
./ --rootfs https://storage.tuxboot.com/debian/bookworm/arm64/rootfs.ext4.xz
--parameters SKIPFILE=skipfile-lkft.yaml --tests libgpiod --timeouts
boot=30 --overlay
https://storage.dev.tuxboot.com/overlays/debian/bookworm/arm64/libgpiod/v1.6.4/libgpiod.tar.xz
--save-output --log-file -'

Cheers,
Anders
[1] https://tuxmake.org/
[2] https://tuxrun.org/
