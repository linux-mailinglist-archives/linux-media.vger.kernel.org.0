Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56C1F24780A
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 22:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgHQUSs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 16:18:48 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40123 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgHQUSp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 16:18:45 -0400
Received: by mail-ot1-f65.google.com with SMTP id h16so14467381oti.7;
        Mon, 17 Aug 2020 13:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8fJC9UFW+gDhKkGJlnq8tYL/hhtE98vgO7P0bnTQ1M=;
        b=qqeSE5Za5/30/WJGXvJEK9+94AS5BBGWmdYx2AkxPPAc780OKbPA2jBYHGamTzZKtP
         /S5Q1NY7EpyqnuQtmGyteYR+Vad5A2AAWC9OU2wzmvNyOP5uYl4+L1rlx4Fe/EH4D+Nw
         Ojj1mwGClrychu4i7LU8U5v6cDPKMv1CHeVJB3SdTXgZSEc1goXoRCEf8nq6QZWMNKoy
         zeGRk6bKgCMvh+qDB74AIwqOrcUINlGFXb1ejk4r0QYp28c02nhVIxOorD7rm7/DvziN
         NvcEv84Ns9N2cgd6xaVNiy4EA419NnGNNXkpeLzMnlrod05brFIb+NlsNRr5jMDKJ2XK
         YC+w==
X-Gm-Message-State: AOAM533osh//F0p/WblbcvfIytmIoyyopTNit6Egho4GOGMSgBoCOzZU
        m8WGuDtZ0Qm3qi6sYo50mWAzV1+IaeKdfRDua2k=
X-Google-Smtp-Source: ABdhPJyP2t3ptdX9ajliOwPSmixn53N3tcagdfS0vTKBqGq1kZ+iE5n/OLcnjQq+uY7hewdd1gEv6hDB4/NeEsVn/M4=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr12261426otl.145.1597695524287;
 Mon, 17 Aug 2020 13:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <202008172354.zWuvIIj7%lkp@intel.com>
In-Reply-To: <202008172354.zWuvIIj7%lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Aug 2020 22:18:33 +0200
Message-ID: <CAMuHMdX4jA1UAhu=odCFHgj4adL3T5hEDoqgqnrFw3L492g+QA@mail.gmail.com>
Subject: Re: drivers/media/platform/fsl-viu.c:36: warning: "out_be32" redefined
To:     kernel test robot <lkp@intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        kbuild-all@lists.01.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 17, 2020 at 9:32 PM kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9123e3a74ec7b934a4a099e98af6a61c2f80bbf5
> commit: a19f228b8dd9a67e8de4ebd4eac8a4c94ec39d1a media: Kconfig: not all V4L2 platform drivers are for camera
> date:   4 months ago
> config: m68k-randconfig-r021-20200817 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout a19f228b8dd9a67e8de4ebd4eac8a4c94ec39d1a
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

>    drivers/media/platform/fsl-viu.c: At top level:
> >> drivers/media/platform/fsl-viu.c:36: warning: "out_be32" redefined
>       36 | #define out_be32(v, a) iowrite32be(a, (void __iomem *)v)
>          |
>    In file included from arch/m68k/include/asm/io_mm.h:25,
>                     from arch/m68k/include/asm/io.h:8,
>                     from include/linux/io.h:13,
>                     from include/linux/irq.h:20,
>                     from include/asm-generic/hardirq.h:13,
>                     from ./arch/m68k/include/generated/asm/hardirq.h:1,
>                     from include/linux/hardirq.h:9,
>                     from include/linux/interrupt.h:11,
>                     from drivers/media/platform/fsl-viu.c:17:
>    arch/m68k/include/asm/raw_io.h:32: note: this is the location of the previous definition
>       32 | #define out_be32(addr,l) (void)((*(__force volatile u32 *) (addr)) = (l))
>          |
> >> drivers/media/platform/fsl-viu.c:37: warning: "in_be32" redefined
>       37 | #define in_be32(a) ioread32be((void __iomem *)a)
>          |
>    In file included from arch/m68k/include/asm/io_mm.h:25,
>                     from arch/m68k/include/asm/io.h:8,
>                     from include/linux/io.h:13,
>                     from include/linux/irq.h:20,
>                     from include/asm-generic/hardirq.h:13,
>                     from ./arch/m68k/include/generated/asm/hardirq.h:1,
>                     from include/linux/hardirq.h:9,
>                     from include/linux/interrupt.h:11,
>                     from drivers/media/platform/fsl-viu.c:17:
>    arch/m68k/include/asm/raw_io.h:23: note: this is the location of the previous definition
>       23 | #define in_be32(addr) \
>          |

Fix available for +2 years

[PATCH] media: fsl-viu: Use proper check for presence of {out,in}_be32()
https://lore.kernel.org/linux-media/1528451328-21316-1-git-send-email-geert@linux-m68k.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
