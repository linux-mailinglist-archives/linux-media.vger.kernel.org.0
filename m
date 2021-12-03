Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4584673C1
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 10:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351336AbhLCJRp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 04:17:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351331AbhLCJRo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 04:17:44 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0832C06173E
        for <linux-media@vger.kernel.org>; Fri,  3 Dec 2021 01:14:20 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id z7so4917370lfi.11
        for <linux-media@vger.kernel.org>; Fri, 03 Dec 2021 01:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vlaokSU11QeztC2IBRA0QL462RhmwYG+JcCrMe58v9k=;
        b=ObQApRcEkbgHHagvei37q/OQSmcQADMwNcOFb7MDQTza6oEcS5b+D5irkN6lRZF22t
         Z0nXYDOnnAnwR8VoIW5t0xpAv2nMrp3hlth3de0nDEw1EEmsqRqEtVCYpxZ+iggrmhRv
         HMSINNkuUDx0aEtvFBtaupq9v0NbE9yqmX/kfa2YF4+iMEY5t+zsnGNZPMs3cwbzeW+c
         wLjtEP0VRBGCBhdC1kWAH0eNTZWiaRSpwxCjlh9Ee9RpGNX/94UteLIa2r6R6due26sZ
         lktAWgbExB8R1OdZwdCXU/1Px3NpK0PwfdDYKz8d7KpMxwAmI3+TQU1YstvI009/hyLj
         9CNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vlaokSU11QeztC2IBRA0QL462RhmwYG+JcCrMe58v9k=;
        b=4DOyvMdeGx6d1skix2nAZKKZJxdUsUudEVP+duJjclI8lwtpF3DlfGLBa0c5j7DstE
         xH0j2Jp95c5+a5Q8Ulfv+itw7F9MBNR5F5/6Ejv/1vHMkyuLiHb8ebpuIIz6YffCT+dM
         8mig/dXWzZ5Nnn6fWRdvGE+X7GMkho+jG2CQ0bOyVvKdv/6U6SkjsiLVALUMzqmbyN6B
         OYzHDNYAkTN081VYzgBo9vz8dU81GPdtfm4R1bJX6DhjqyBnzr7Gwofsh6h3eGSxFB7d
         6mfcEiPPyTOiPo9Vm6QtmT1mjcjozdmlOvQ0xh+C3oItr+GjO/OSF4sIiYgHxwG72Joy
         9y0g==
X-Gm-Message-State: AOAM533uzfkbGTDYWYmGfcuIdeXDicx1XiCX3G22Ic0Bl68phnclWOPH
        7ZhhJVFo/X6IABi6g4L6U9+tGQ==
X-Google-Smtp-Source: ABdhPJyMHRRvRKDFHk0kZzh4RAXCtE+j87OCEQVCaKgQ31GUh5kTeSLWKyjMh3r57VelKr/fzZxH1w==
X-Received: by 2002:a05:6512:3a8d:: with SMTP id q13mr16094678lfu.73.1638522859082;
        Fri, 03 Dec 2021 01:14:19 -0800 (PST)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id h14sm294267lfr.69.2021.12.03.01.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 01:14:18 -0800 (PST)
Date:   Fri, 3 Dec 2021 10:14:17 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master 925/4921] ERROR: modpost:
 "v4l2_async_register_subdev" [drivers/staging/media/max96712/max96712.ko]
 undefined!
Message-ID: <Yanf6WzF9cLPCfW7@oden.dyn.berto.se>
References: <202112031447.GpyZHoNB-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202112031447.GpyZHoNB-lkp@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Could you pickup [1] so we can solve this?

1. https://patchwork.linuxtv.org/project/linux-media/patch/20211126080623.1587610-1-sakari.ailus@linux.intel.com/

On 2021-12-03 14:18:41 +0800, kernel test robot wrote:
> Hi Niklas,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9606f9efb1cec7f8f5912326f182fbfbcad34382
> commit: 5814f32fef137e34577c4f053272c53e7ca33cd9 [925/4921] media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer
> config: arc-randconfig-r023-20211202 (https://download.01.org/0day-ci/archive/20211203/202112031447.GpyZHoNB-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5814f32fef137e34577c4f053272c53e7ca33cd9
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 5814f32fef137e34577c4f053272c53e7ca33cd9
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "v4l2_async_register_subdev" [drivers/staging/media/max96712/max96712.ko] undefined!
> >> ERROR: modpost: "v4l2_ctrl_handler_free" [drivers/staging/media/max96712/max96712.ko] undefined!
> >> ERROR: modpost: "v4l2_ctrl_new_std_menu_items" [drivers/staging/media/max96712/max96712.ko] undefined!
> >> ERROR: modpost: "v4l2_ctrl_new_std" [drivers/staging/media/max96712/max96712.ko] undefined!
> >> ERROR: modpost: "v4l2_ctrl_handler_init_class" [drivers/staging/media/max96712/max96712.ko] undefined!
> >> ERROR: modpost: "v4l2_fwnode_endpoint_parse" [drivers/staging/media/max96712/max96712.ko] undefined!
> >> ERROR: modpost: "v4l2_async_unregister_subdev" [drivers/staging/media/max96712/max96712.ko] undefined!
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
>    Depends on MEDIA_SUPPORT && VIDEO_DEV && MEDIA_CONTROLLER
>    Selected by
>    - VIDEO_MAX96712 && STAGING && STAGING_MEDIA && MEDIA_SUPPORT && I2C && OF_GPIO
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

-- 
Kind Regards,
Niklas Söderlund
