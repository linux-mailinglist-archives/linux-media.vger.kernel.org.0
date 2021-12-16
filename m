Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B98A476FD2
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 12:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236570AbhLPLOx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 06:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236690AbhLPLOn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 06:14:43 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42CFC061785
        for <linux-media@vger.kernel.org>; Thu, 16 Dec 2021 03:14:38 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id n14-20020a7bcbce000000b00332f4abf43fso1230459wmi.0
        for <linux-media@vger.kernel.org>; Thu, 16 Dec 2021 03:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=R2P5SbvHWGoTsxNtYXEi10Ks7r/T0PX45WZ+b50xuqA=;
        b=Q/sYXNrzRzCd+QDMU83vvuw4wRd0FhYaDpOYmxQZSeEoTCIBk9p1j7QVYJMAOJdzDW
         8axAPZcvaFqlBaA9cQ6QNCiEBKNpLpyoG/kKtyHvyeylFrNq4IVsUO2+Lr+QcD2kGNm8
         tilfwdMpsJ4inn7+TxZ9Dybc9OUMw41ACVDx7Fhx+rci56hLosZsyHfYDko+twr4ySdm
         0L6R8rCyXHQPulnNCOq5XmeNiH0uh1Hx7vsRetOely3J1CfBaRRAtcI0m3WQdas5BXhi
         kAP24UP1OPzZhlkusStpA56XeDgevy61wpyOLLuXB43qWaX4oGmaAGcGcdyp+/moW3ks
         rkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=R2P5SbvHWGoTsxNtYXEi10Ks7r/T0PX45WZ+b50xuqA=;
        b=P/8uA4kgc5s26d2YVVK2k6H5sEjF3uDDeIrDf1ZfvN+VHm2+qiy2o2MQOLC8uOoFXl
         s6W7I87LYYiMHTDgE+SyPvWxuBLDJ/RRSTK+iaeUYA8GifWfWrbylvZvE/e9CVNiu37V
         gCkT42iI2KtFROwzSk00u/lrBO+j6Qum1Rqo/EEjR/HHBG8xielB95GzDqe8IrzH8rvc
         5cAgYIIBYS0tlKa8EB8bDzQj05NBuR8q6r8U4xXb7+C8aMxmERQLxPlaXvCnFZBXwO/n
         cAta7+OXyZs+3YRZKHCs4IiTLhPOLnbiTVJLR0Jt6fKLOiteYgLZJ/ULFESZu7qD/1is
         K1Mw==
X-Gm-Message-State: AOAM531d4TD2VwtE0eOny9kyJlRd4JCwZzqd5z8PYwZkKCASUQ+d3vlW
        hJPnX/ABMjiWRqjBhiTBaQ0=
X-Google-Smtp-Source: ABdhPJyNqwmvRxxXHOZ8zm2W6GRQWF01Og1R4QWBD4C+kwLKdsrJzmOCw0W2JnQiFJ9CMmtzKzxqww==
X-Received: by 2002:a05:600c:3787:: with SMTP id o7mr4511708wmr.110.1639653277522;
        Thu, 16 Dec 2021 03:14:37 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r17sm4399204wmq.11.2021.12.16.03.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 03:14:37 -0800 (PST)
Subject: Re: [PATCH 5/5] media: v4l2-async: Create links during
 v4l2_async_match_notify()
To:     kernel test robot <lkp@intel.com>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20211213232849.40071-6-djrscally@gmail.com>
 <202112161906.gHHRLukN-lkp@intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <2808edaf-f397-fa23-de67-1022ddb8f447@gmail.com>
Date:   Thu, 16 Dec 2021 11:14:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <202112161906.gHHRLukN-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I guess this needs to be a no-op if the media controller API isn't
configured.

On 16/12/2021 11:10, kernel test robot wrote:
> Hi Daniel,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on media-tree/master]
> [also build test ERROR on v5.16-rc5 next-20211215]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Daniel-Scally/Introduce-ancillary-links/20211214-073020
> base:   git://linuxtv.org/media_tree.git master
> config: x86_64-randconfig-r015-20211216 (https://download.01.org/0day-ci/archive/20211216/202112161906.gHHRLukN-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/7e7fcd65e8144f3ffa337760c26fb786f4028466
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Daniel-Scally/Introduce-ancillary-links/20211214-073020
>         git checkout 7e7fcd65e8144f3ffa337760c26fb786f4028466
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/v4l2-core/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> drivers/media/v4l2-core/v4l2-async.c:284:10: error: no member named 'entity' in 'struct v4l2_subdev'
>            if (sd->entity.function != MEDIA_ENT_F_LENS &&
>                ~~  ^
>    drivers/media/v4l2-core/v4l2-async.c:285:10: error: no member named 'entity' in 'struct v4l2_subdev'
>                sd->entity.function != MEDIA_ENT_F_FLASH)
>                ~~  ^
>    drivers/media/v4l2-core/v4l2-async.c:288:52: error: no member named 'entity' in 'struct v4l2_subdev'
>            link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity,
>                                                ~~~~~~~~~~~~  ^
>    drivers/media/v4l2-core/v4l2-async.c:288:65: error: no member named 'entity' in 'struct v4l2_subdev'
>            link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity,
>                                                                       ~~  ^
>    drivers/media/v4l2-core/v4l2-async.c:309:24: error: no member named 'entity' in 'struct v4l2_subdev'
>            switch (notifier->sd->entity.function) {
>                    ~~~~~~~~~~~~  ^
>    5 errors generated.
>
>
> vim +284 drivers/media/v4l2-core/v4l2-async.c
>
>    277	
>    278	static int
>    279	__v4l2_async_create_ancillary_link(struct v4l2_async_notifier *notifier,
>    280					   struct v4l2_subdev *sd)
>    281	{
>    282		struct media_link *link;
>    283	
>  > 284		if (sd->entity.function != MEDIA_ENT_F_LENS &&
>    285		    sd->entity.function != MEDIA_ENT_F_FLASH)
>    286			return -EINVAL;
>    287	
>    288		link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity,
>    289						   MEDIA_LNK_FL_ENABLED |
>    290						   MEDIA_LNK_FL_IMMUTABLE);
>    291	
>    292		return IS_ERR(link) ? PTR_ERR(link) : 0;
>    293	}
>    294	
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
