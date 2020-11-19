Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE4A02B9DF9
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 00:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgKSXL0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 18:11:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgKSXL0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 18:11:26 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8529C0613CF;
        Thu, 19 Nov 2020 15:11:25 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id r9so10733326lfn.11;
        Thu, 19 Nov 2020 15:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IZJpc9/yiilNlO3Wp2U49y4i9y+aV9CcSLtIgmIWN7g=;
        b=CDrfVyxKz7srH3JwiY/DD+imxYEHxs9SKJ0rG3nobAC1Rs0gz36u0c7/Hhe/Dx4EnO
         jPgx/XLUQQuEWJGE5OO/fht4Q5IAyYUVznnhU1W55vvzRu5Bp7TnNSLHXgDPytfTg9bn
         o/EiczAStsYUjjYNP5d0tC3IdYuDrJ7VAMHt2JH3fepmQWfkJ4Iq6jv51zUIpjX4w30o
         7IwWnveoaKleaymKWZ545rcalL6XlaRZhg3CCKO8R/74SDg2Nb7/RpYieET+a+ah/MIA
         IeFVOcxyuEGHkqY+7/tgAe3kYUVbKAEaX/bna9e+gvQ5Q1tjgbOmgWOkpuxDiQv5byzS
         fjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IZJpc9/yiilNlO3Wp2U49y4i9y+aV9CcSLtIgmIWN7g=;
        b=qObTWBRSIHLST5SXTRBiUv5Afb6emLIQSO7/q/udzQFkHmokMbv9g/I/0EyvjlFxQY
         A+MG3B6V/VA3E4ken6K0BqovpesYk8lw5w4h6Hr+1ACfeT43CYShljhReT947YtA9NIY
         gGnjRVBAjVhSvMCPEH5LnKBZKjZcinaKdfeILGgAzM+fP6CYrYM6JuJOlq+hb88liZY6
         xmbWjhOTALP9LPjdMuwoPf3MuooBnCGdLq2k27fcSSCePnTIRlL6TewZJEnCSckMtWC+
         czQXXFrgFTj0CMUxMI3RG/ORNjZXQoY3YUNqKAAlkRV9WQQj+EDmAxSU3CLJrKkpeldM
         KiFw==
X-Gm-Message-State: AOAM53365rLEtOLYWONPzsHMm6h8D1AXs4o4jY+Z9ijjhMTELYVLPMUY
        HiexO5/z2dkjk7haL+4Qp28esmnDoq21Q+Vr1DQ=
X-Google-Smtp-Source: ABdhPJwIRSmUcpwrq3NINK7N5H2tik3PMWy3u6pMvfI4vDhVxQ0l7/qQwICQWRaiFESrvThmZ6iqs8FqPQMwIw3960g=
X-Received: by 2002:a19:207:: with SMTP id 7mr7287040lfc.251.1605827484098;
 Thu, 19 Nov 2020 15:11:24 -0800 (PST)
MIME-Version: 1.0
References: <202011190936.brIiila6-lkp@intel.com>
In-Reply-To: <202011190936.brIiila6-lkp@intel.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 19 Nov 2020 20:11:12 -0300
Message-ID: <CAOMZO5CJb_8AoaEPG67tVTV=dB3m7C+zX=Ka7mvPv2Xb4OF73g@mail.gmail.com>
Subject: Re: drivers/media/platform/fsl-viu.c:253:2: error: implicit
 declaration of function 'out_be32'
To:     kernel test robot <lkp@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     kbuild-all@lists.01.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 18, 2020 at 10:15 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Fabio,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   c2e7554e1b85935d962127efa3c2a76483b0b3b6
> commit: 17621758e53f0e6bf1ac469cca2a59fa6457d205 media: fsl-viu: Do not redefine out_be32()/in_be32() for CONFIG_M68K
> date:   3 months ago
> config: m68k-randconfig-r013-20201118 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=17621758e53f0e6bf1ac469cca2a59fa6457d205
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 17621758e53f0e6bf1ac469cca2a59fa6457d205
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/media/platform/fsl-viu.c: In function 'viu_start_dma':
> >> drivers/media/platform/fsl-viu.c:253:2: error: implicit declaration of function 'out_be32' [-Werror=implicit-function-declaration]
>      253 |  out_be32(&vr->status_cfg, SOFT_RST);
>          |  ^~~~~~~~
>    drivers/media/platform/fsl-viu.c: In function 'viu_stop_dma':
> >> drivers/media/platform/fsl-viu.c:266:15: error: implicit declaration of function 'in_be32' [-Werror=implicit-function-declaration]
>      266 |  status_cfg = in_be32(&vr->status_cfg);
>          |               ^~~~~~~
>    cc1: some warnings being treated as errors

It seems that Geert has submitted a proper fix a long time ago:
https://lkml.org/lkml/2020/8/17/2376
