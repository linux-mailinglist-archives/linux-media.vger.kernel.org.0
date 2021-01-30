Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0592930982D
	for <lists+linux-media@lfdr.de>; Sat, 30 Jan 2021 21:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbhA3UIg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jan 2021 15:08:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:49454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231969AbhA3UIf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jan 2021 15:08:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 011D664E0A;
        Sat, 30 Jan 2021 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612037273;
        bh=x8Crvp4hO+MM9PupNownbjZAszD9knrYm8r8VHGpIyg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bO70FB5lVgx3qlTuLEPcVZgMlgcS6RPoLGDL4So53PwufFvm0JIYhxds04lQcg532
         +Lw9bpsuOtw51MkSml+oVgkYw3kmrKmspB4x8bwjcXoBu18E6/ZfBiqMB2zQDrE0zX
         ozOiPMKmVugPc5jjJNA5tyNJflctqdtRK5YHnbPhQz/LyZXazwJVstnLItyZnRK3dG
         HsNn/rfTZSwSH1T7X3YKnn9AKII6mIgugXNprZ68U6UAUFr6J7pFl6to88UvfbUVyy
         CoB9H0Yq8jA/GcR8ddROnJ5hA89MySyEnZ7jIRoAAw6nvxe93Ip/QWv8p2wHJI7hPp
         EuybGWY1ZRPrQ==
Date:   Sat, 30 Jan 2021 13:07:51 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Helen Koike <helen.koike@collabora.com>, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from
 `drivers/media/platform/rockchip/rkisp1/rkisp1-capture.o' being placed in
 section `.eh_frame'
Message-ID: <20210130200751.GA2853543@localhost>
References: <202101310313.LdtIZjU6-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202101310313.LdtIZjU6-lkp@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jan 31, 2021 at 03:52:15AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0e9bcda5d286f4a26a5407bb38f55c55b453ecfb
> commit: e6938cc1cb7763a363f62b78147f1f2fb972f49c media: rockchip: rkisp1: destage Rockchip ISP1 driver
> date:   3 months ago
> config: arm64-randconfig-r013-20210130 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 275c6af7d7f1ed63a03d05b4484413e447133269)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e6938cc1cb7763a363f62b78147f1f2fb972f49c
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout e6938cc1cb7763a363f62b78147f1f2fb972f49c
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `drivers/input/input.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `drivers/input/input-compat.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `drivers/input/input-mt.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `drivers/input/input-poller.o' being placed in section `.eh_frame'

https://lore.kernel.org/lkml/20210130004650.2682422-1-nathan@kernel.org/

Cheers,
Nathan
