Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 615AC4331A4
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 10:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234777AbhJSI6P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 04:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhJSI6O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 04:58:14 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB4EC06161C
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 01:56:02 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id y7so17026055pfg.8
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 01:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z+hK2vHxJimvuS81efjInRFCiVYH3H9sgxFrDD0JWWk=;
        b=ilXuMmMjxCfm8EwaazyCuDXQAhRLCYsa62PksKURufiqHgMtB0axmghgn9h5UIhDYh
         /a9ZKrUelqpZCWHQ6BHeL2rpAtZ6joWICUFXJzaglDwoWO8qt9hTGhdIfNpNc06xu+jy
         /atpwJ85GD0fkGGRZ8Wo7zMxuuArQ9fOxbDdYPxCxIOhsJ6vQk/5+CepSLOvIT1qzGld
         sdgRIn/n/OqKmgQGRRjX7/HYAbdGWHRsguwLscexF7hjtR2WBEjdZ2fC9WbhjreH2bqC
         WiYx2ZbTKkHwS4Q0BbYU//9/n13cGaIFbbJ8PKjLIN0m8yDzKzMSSy1+72ejh7cJAm/x
         f+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z+hK2vHxJimvuS81efjInRFCiVYH3H9sgxFrDD0JWWk=;
        b=hWfFaUxNrReYWguaCTkT9yVX8mRLoqkHDwJOzDyVKQQH3bTYJ1qxMMlQaU0chCPm1R
         pglNIxnJVna4HDdzcILag/GmQTOm7wwXTJ0pFEEluYe24Qe3qYUYcYvGCR/Z7c1durC3
         Yfo9iyyi+bJDYB5gb2QrkQeWmzn27oW81S/16vjNQCli2u/RGFaAvWzkOs218qEPpfDT
         Xb6fjbN67va1JLGHQ5HMlrF03ZfYq1M5ustbZyO1cm0Sd52ym3hYNPQQQkv8NfuFVOQe
         XVOSRkaVh9J5enfsXSciKnW0oK6+3L0oerUpP8hlnRmPb5DW1azqfxrEcGHnGXOP2zA/
         +Pfg==
X-Gm-Message-State: AOAM532CHyqOss5+OsnRIOJNl917VR6Ky5QoRhYsfzhjxWaFm7maXfJX
        tLDItVV7DsK4KVw2QHVi97osq+IehsWbIedDWmCxgA==
X-Google-Smtp-Source: ABdhPJzLk1SNj1n3SK6HBgdgAoTXiE+yyJUyl3dRSY5JSIqSCwC8qbwa0j0xt0TKR46UEgTn2ZygUFhs9fsDpoLLag0=
X-Received: by 2002:a63:f84f:: with SMTP id v15mr28103028pgj.204.1634633761566;
 Tue, 19 Oct 2021 01:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <202110172146.wMBY6qzo-lkp@intel.com> <eb2b58dc-3600-70d3-147a-c356d24feabd@intel.com>
In-Reply-To: <eb2b58dc-3600-70d3-147a-c356d24feabd@intel.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Tue, 19 Oct 2021 16:55:50 +0800
Message-ID: <CA+Px+wX5NgbA_0VcS9pJ_L5=_znTca6LtsLYbCsh3ksro_2qzA@mail.gmail.com>
Subject: Re: [linux-next:master 4131/8410] drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c:133:18:
 warning: Value stored to 'pfb' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
To:     kernel test robot <yujie.liu@intel.com>
Cc:     Yunfei Dong <Yunfei.Dong@mediatek.com>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 19, 2021 at 9:40 AM kernel test robot <yujie.liu@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7c832d2f9b959e3181370c8b0dacaf9efe13fc05
> commit: 8cdc3794b2e34b3ee11ddfccf4af3f64344a1a75 [4131/8410] media: mtk-vcodec: vdec: support stateless API
> config: riscv-randconfig-c006-20211017 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 8ca4b3ef19fe82d7ad6a6e1515317dcc01b41515)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install riscv cross compiling tool for clang build
>          # apt-get install binutils-riscv64-linux-gnu
>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8cdc3794b2e34b3ee11ddfccf4af3f64344a1a75
>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>          git fetch --no-tags linux-next master
>          git checkout 8cdc3794b2e34b3ee11ddfccf4af3f64344a1a75
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> clang-analyzer warnings: (new ones prefixed by >>)
>
>  >> drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c:133:18: warning: Value stored to 'pfb' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
>             struct vdec_fb *pfb = &framebuf->frame_buffer;
>                             ^~~   ~~~~~~~~~~~~~~~~~~~~~~~

Proposed a fix:
https://patchwork.linuxtv.org/project/linux-media/patch/20211019085244.1403-1-tzungbi@google.com/
