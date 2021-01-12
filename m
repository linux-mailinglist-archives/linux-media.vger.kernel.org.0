Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 969FD2F3287
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 15:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728953AbhALODK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 09:03:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbhALODJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 09:03:09 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B972C061575;
        Tue, 12 Jan 2021 06:02:29 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 15so1506622pgx.7;
        Tue, 12 Jan 2021 06:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0buxRjdYD4f8cL7qow2W4WpAsmOr6gsWW/0sTs03Xnk=;
        b=m0sETLpDNbyN9tueISl+cM7CvSzSzYmByTddfxbFiMoebNN3LMAvH4FpFn6W9X1oKk
         cN9jv0TIeaKpUNH0OUzEESRSO0j7czCUKq2C38IsrtffkP5nRPnuIp/WQNr4/eDi1xx0
         SZ/EeFm4Zr32DGuDoZ4as/uC0YWerSkWka52L58p8p+pVDN3aUwiIjegJfCwEgrXtMrT
         BohMUgb/dDqGI4YSy6g3+KE/qd/UsPrcmgR6hDMVqpuhCSbnv+F99ilNPoAWy99aR6dT
         kk7MMsgyvwIn0sDiuY5oyXSZ+/QhJxaKPAMz6o4HWXjbuJdHd8ASj9Pv1IuCw3e2uFSy
         E9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0buxRjdYD4f8cL7qow2W4WpAsmOr6gsWW/0sTs03Xnk=;
        b=MZyKP8vyU85M71tZKY26BEW5kgvWKEVmVlF0y8S55ut3cT87ZN2cXZyh3/Ea5+6nnF
         s8OSyWSokAXxSRdIFYe8rZXR47FWCOoJRDuoxG5zKwZAK57PDnvbgu3pKwtffHgPoZB9
         GLCE2Nlk6k8SpQRKsHV2pdIJsYQSXNMEy/5DXGODgudjpO2XaDHGEHQZfde54zgDrazX
         ZsaTqW6jdvIiqg1J3+DJIjAgfTLtLt6ELn5kWyZmisZCwshc2pa9P0i6q2XbomchWoe/
         uL6ju+aFzxb4npnKOt8t0nBCuEdOUnEQvMm2WmihOcepAfhyLj+eBL+C6fUY9sOnGMAi
         WVwQ==
X-Gm-Message-State: AOAM530YxJXRxQLOe471DeEvZJWNs7DZQHk6+Pn7lUD6ZINJWaDl2Mpu
        zLW0XolytTWFIPXrSnbMzZCRteL3HjPEQpqSeRg=
X-Google-Smtp-Source: ABdhPJym52oUWBpQ+zduyu/fJy5AQTwkx/FJL8unVPx9Tix4Z4Jt545pwu/2wmRtGFmrJqYjrCtAh7+muMgsEBk8dYQ=
X-Received: by 2002:a62:5a86:0:b029:1ae:6b45:b6a9 with SMTP id
 o128-20020a625a860000b02901ae6b45b6a9mr4684461pfb.7.1610460148614; Tue, 12
 Jan 2021 06:02:28 -0800 (PST)
MIME-Version: 1.0
References: <202101122015.Umynt19J-lkp@intel.com>
In-Reply-To: <202101122015.Umynt19J-lkp@intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 12 Jan 2021 16:03:17 +0200
Message-ID: <CAHp75VdWzdjOuhamFSd5XUwnmuWF5gm=iQSXkDaWDFBtGNc-sQ@mail.gmail.com>
Subject: Re: drivers/media/pci/intel/ipu3/ipu3-cio2.c:163:63: sparse: sparse:
 cast truncates bits from constant value (20000 becomes 0)
To:     kernel test robot <lkp@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kbuild-all@lists.01.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 12, 2021 at 3:07 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   a0d54b4f5b219fb31f0776e9f53aa137e78ae431
> commit: 7b285f41f7376dc37e7fad1e803995fd39f42848 media: ipu3-cio2: Introduce CIO2_LOP_ENTRIES constant
> date:   4 months ago
> config: ia64-randconfig-s031-20210112 (attached as .config)
> compiler: ia64-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-208-g46a52ca4-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7b285f41f7376dc37e7fad1e803995fd39f42848
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 7b285f41f7376dc37e7fad1e803995fd39f42848
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=ia64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> "sparse warnings: (new ones prefixed by >>)"
> >> drivers/media/pci/intel/ipu3/ipu3-cio2.c:163:63: sparse: sparse: cast truncates bits from constant value (20000 becomes 0)

Patch should be somewhere on its way to upstream.

-- 
With Best Regards,
Andy Shevchenko
