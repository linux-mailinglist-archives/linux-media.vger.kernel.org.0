Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE0A4F9F4B
	for <lists+linux-media@lfdr.de>; Fri,  8 Apr 2022 23:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234456AbiDHVqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Apr 2022 17:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232842AbiDHVqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Apr 2022 17:46:06 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0F9B6448
        for <linux-media@vger.kernel.org>; Fri,  8 Apr 2022 14:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649454240; x=1680990240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pjq25C9eg6tmA6P/DdSQAF13FJ0sCKoVAUZRUL+PQnI=;
  b=NYJjcyAoLPBtb2vI1d/8ne+ymd93I55ec++29KanzSdovEIbnW7mZVnT
   nuO4oNosrkvaGPBFJxF72JI+RZMB8x47Cte3Pp7Y5Y89NbG9LFe+o5pq9
   K6x2VlvKn5w/ILcr2jAf3wikDymc4nfu+t88OyCB6ioKy9KOFupYA28Dk
   uQktgFrmbK1/axif/l/CMpgEOTm6EkK8KiPsfDI9rhzy4oeeJs1Iykzne
   Se5g7KnKjYiRMeHqo7iyk9oSYQBTicZELkXwykbrjo9ASfa+wrKITT+R3
   CTDLl/hJ5XLfXuJBgPXTxFkggAgrsMfkULxdVFuIhobQbGrII5/i7LZWn
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="324851668"
X-IronPort-AV: E=Sophos;i="5.90,246,1643702400"; 
   d="scan'208";a="324851668"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP; 08 Apr 2022 14:44:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,246,1643702400"; 
   d="scan'208";a="643048093"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 14:43:59 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 5CA292030F;
        Sat,  9 Apr 2022 00:43:57 +0300 (EEST)
Date:   Sat, 9 Apr 2022 00:43:57 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [sailus-media-tree:master 28/30]
 drivers/media/v4l2-core/v4l2-subdev.c:342:1: error: implicit declaration of
 function 'v4l2_subdev_lock_and_get_active_state' is invalid in C99
Message-ID: <YlCsnbp3oftzLyfz@paasikivi.fi.intel.com>
References: <202204090350.ZbhpomcE-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202204090350.ZbhpomcE-lkp@intel.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Sat, Apr 09, 2022 at 04:09:35AM +0800, kernel test robot wrote:
> tree:   git://linuxtv.org/sailus/media_tree.git master
> head:   bd1d801f302289ddbf86ff6c38fcc91aef8e7609
> commit: 3f1a6a471c6a8b5ba772cb82538ad03fa0255e7c [28/30] media: subdev: add locking wrappers to subdev op wrappers
> config: arm-randconfig-r022-20220408 (https://download.01.org/0day-ci/archive/20220409/202204090350.ZbhpomcE-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51b3a257908aebc01cd7c4655665db317d66)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         git remote add sailus-media-tree git://linuxtv.org/sailus/media_tree.git
>         git fetch --no-tags sailus-media-tree master
>         git checkout 3f1a6a471c6a8b5ba772cb82538ad03fa0255e7c
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/v4l2-core/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All error/warnings (new ones prefixed by >>):
> 
> >> drivers/media/v4l2-core/v4l2-subdev.c:342:1: error: implicit declaration of function 'v4l2_subdev_lock_and_get_active_state' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>    DEFINE_STATE_WRAPPER(get_fmt, struct v4l2_subdev_format);
>    ^
>    drivers/media/v4l2-core/v4l2-subdev.c:335:12: note: expanded from macro 'DEFINE_STATE_WRAPPER'
>                            state = v4l2_subdev_lock_and_get_active_state(sd); \

I guess this happens if MC is disabled? Maybe something else, too?

-- 
Sakari Ailus
