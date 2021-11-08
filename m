Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBA6F447BD2
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 09:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237994AbhKHIcf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 03:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237976AbhKHIce (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 03:32:34 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BFB7C061570
        for <linux-media@vger.kernel.org>; Mon,  8 Nov 2021 00:29:50 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id x27so34317073lfu.5
        for <linux-media@vger.kernel.org>; Mon, 08 Nov 2021 00:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=d648o/ymQsADPJXxT1AHceE8lNYT5k/nP2nn8VCfXJo=;
        b=mzgPee+XCGZ2v8j8Qa5N/OsHTZ8x7oC7OiWPb2S8HZGHKo3FyeynXxWiO/qu0GVE77
         CQntpxZTtpCtbaTtQ7aU9EdcrPUbhkckuRVEw/+dnRCN2E4DQLhSqH9ezrJL7tuyNe+E
         oVVwQd0gCCLcQg4161Kd/9qNMhev/Hqw+qVkASInjpfrxDBKTYD30TkLr4RgtMWRBG8y
         LB17756OzKtUvll9hNmi6ddnDnOb+b9A2TbZpUALnpsQ6AqE4f9GwHPDcaDlMwYdPcUO
         pkhhwVGrAuFbZxOBEwe+U1VpO+A3H0o3QJj+BlI3z+lM87QnIceMsEzQXQ6FwOQ/Ugww
         FR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=d648o/ymQsADPJXxT1AHceE8lNYT5k/nP2nn8VCfXJo=;
        b=V8F4ZxCTM6YiAwPoK7H5YczUpO58CVOSOM41JJR01jcOciDW2R2UvdCDRtqPzVqIgS
         yV/Y1OBFxK6cowvPX1c+j2RWKmwridArq2UWP17kOE9DnUTJEqoX68w8LfthbepFXa6S
         TNTu1/upSsvQIZSIih/xd8E+K0dKMNb40sMOxyCM0PGv39367vwvN21VSXtZ4LwC6cco
         tAjVpWMyGj1CABe3gvPo8Z2VuyzIVCUhSICHQ02qRhztlEyHFEEXv27LgbxssNwngn4s
         GkoxxcHFwcdtg+JC5UMgUcX35g5njvjfJtv0tKAk/QEl8Vx6RzTlGcQ2ghbLwvSKzapj
         hy7A==
X-Gm-Message-State: AOAM532kFglPnTjQBJS9eaRAdhXJPbbiJSIImkMzYS4SSdBZRBlpYy30
        2Eb7A5jpOyQKnBl3sm8UD4z+Mg==
X-Google-Smtp-Source: ABdhPJxz7Pmkoa/hf/9WbFeIRFWWOleSbyf+WxKk1w5rFWNl6CMbaE4wlXLptsnVm7U3l4Oe6TTnsA==
X-Received: by 2002:ac2:5d41:: with SMTP id w1mr56367206lfd.69.1636360188700;
        Mon, 08 Nov 2021 00:29:48 -0800 (PST)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id s14sm1461239lji.22.2021.11.08.00.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 00:29:48 -0800 (PST)
Date:   Mon, 8 Nov 2021 09:29:47 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [hverkuil-media-tree:zoran 37/59] csky-linux-ld:
 max96712.c:undefined reference to `v4l2_async_unregister_subdev'
Message-ID: <YYjf+4TqtqNw/i8Z@oden.dyn.berto.se>
References: <202111081406.hh6MQosj-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202111081406.hh6MQosj-lkp@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This is solved either by v4 of this MAX96712 patch (this is v3) or 
on-top by Sakari in '[1/1] max96712: Select VIDEO_V4L2'.

On 2021-11-08 14:06:14 +0800, kernel test robot wrote:
> tree:   git://linuxtv.org/hverkuil/media_tree.git zoran
> head:   7ce0d221dbb77d82ce789984dcee1fcc27d8f8f0
> commit: 118658ed37664dddbc8c0cd8006edc160528b6f7 [37/59] media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer
> config: csky-buildonly-randconfig-r005-20211104 (attached as .config)
> compiler: csky-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
>         git fetch --no-tags hverkuil-media-tree zoran
>         git checkout 118658ed37664dddbc8c0cd8006edc160528b6f7
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=csky SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    csky-linux-ld: drivers/staging/media/max96712/max96712.o: in function `max96712_remove':
>    max96712.c:(.text+0x2e): undefined reference to `v4l2_async_unregister_subdev'
> >> csky-linux-ld: max96712.c:(.text+0x40): undefined reference to `v4l2_async_unregister_subdev'
>    csky-linux-ld: drivers/staging/media/max96712/max96712.o: in function `max96712_probe':
>    max96712.c:(.text+0x144): undefined reference to `v4l2_fwnode_endpoint_parse'
> >> csky-linux-ld: max96712.c:(.text+0x2a8): undefined reference to `v4l2_fwnode_endpoint_parse'
> >> csky-linux-ld: max96712.c:(.text+0x3a2): undefined reference to `v4l2_ctrl_handler_init_class'
> >> csky-linux-ld: max96712.c:(.text+0x3d4): undefined reference to `v4l2_ctrl_new_std'
> >> csky-linux-ld: max96712.c:(.text+0x3f0): undefined reference to `v4l2_ctrl_new_std_menu_items'
> >> csky-linux-ld: max96712.c:(.text+0x422): undefined reference to `v4l2_async_register_subdev'
> >> csky-linux-ld: max96712.c:(.text+0x43a): undefined reference to `v4l2_ctrl_handler_free'
>    csky-linux-ld: max96712.c:(.text+0x480): undefined reference to `v4l2_ctrl_handler_init_class'
>    csky-linux-ld: max96712.c:(.text+0x488): undefined reference to `v4l2_ctrl_new_std'
>    csky-linux-ld: max96712.c:(.text+0x494): undefined reference to `v4l2_ctrl_new_std_menu_items'
>    csky-linux-ld: max96712.c:(.text+0x49c): undefined reference to `v4l2_async_register_subdev'
>    csky-linux-ld: max96712.c:(.text+0x4a4): undefined reference to `v4l2_ctrl_handler_free'
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
