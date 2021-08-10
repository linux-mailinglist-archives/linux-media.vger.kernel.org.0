Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB2FC3E54EC
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 10:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234780AbhHJIPm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 04:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbhHJIPm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 04:15:42 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1717CC0613D3
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 01:15:20 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id h17so16453077ljh.13
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 01:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hTjnJdFQvO4ui/jyq6IbbI6nlacVzKGNGC5xjCkuqE8=;
        b=fZIhlIMToPuHULlJAtDAslWMIW3oerTim7lmhyhXhgc/3nRUrKzTlsdbJps0G77VSQ
         ieAxJqUWR9sztQigpr3hZ6MYdg9tCzWY3A6PRJ+9AInnY+Eukautaj6N/TCQKEmk9Eoo
         loH5X5P1cL7PbV+XjPbKcV3dN7LWL2vSy/Zp8nyVXsfrf+F3g2SojsBthymXVReDRFFY
         13wp3bFITVLZdbJ3yfn/1sVFECsS9PQ+Cmp21kAiZaA/XYBRiMcQrSNBURcH8bZpWU7z
         vJe4TeLfUkuIgsS9nUNiQleFo2Fwrm4GbZWIj+Z/KNndolnPHSUIv88n2wSsXhiot7P2
         xAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hTjnJdFQvO4ui/jyq6IbbI6nlacVzKGNGC5xjCkuqE8=;
        b=dU5f7qkeAg63CXQqr6COhM380BqJQlV4+VAQO4Gf8ojK/2FUO/2wcGHcfeocgfgjKm
         moAy+7/1b+ACCEug2V+Qlvb/ZpuOA78lD459xvJMra88WCUPHB8uNWallZW5j5O+DNXo
         JWDhMoeZgoXOjMxfjiAVYG0fJ/yIxFi3MUMybbquOs4hQiRIV9L7wTEVnfTldEnu2QU9
         OSDPDXpVkatLGAXdL2NYYenggGBvdaGwVRNqek/mumU4SaqZeTzuFBl86xqupiMaydOT
         28yjnPKMbkA8egrS8rhUo33xVFuHUgjPykTxzccrmMJDoLHCBQEfCTQB5O2oLc7UckVx
         4BGw==
X-Gm-Message-State: AOAM530GoioEnNoxOwpX1U4o+0jKp70oLxSQyN7UJZJh4SsoJhPqMCWI
        0KjOObbqyS/dQnjKkM77souAHIC/nC+FRA==
X-Google-Smtp-Source: ABdhPJx2i4Qsx6WaHW0hgYDO9dkpUizWPQoU746eti19P+W1eNfsJwXyUmNWaPsWheDWfucmBxbrIg==
X-Received: by 2002:a2e:9d47:: with SMTP id y7mr18657630ljj.408.1628583318371;
        Tue, 10 Aug 2021 01:15:18 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id x26sm1832031lfu.206.2021.08.10.01.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 01:15:17 -0700 (PDT)
Date:   Tue, 10 Aug 2021 10:15:17 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [linux-next:master 5146/6223]
 drivers/media/platform/rcar-vin/rcar-core.c:220:18: warning: Same value in
 both branches of ternary operator. [duplicateValueTernary]
Message-ID: <YRI1leVKPliWDaFr@oden.dyn.berto.se>
References: <202108101353.VuDfxbHo-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202108101353.VuDfxbHo-lkp@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I had a look and this is the intended behavior. The macros is defined in 
rcar-vin.h as,

enum rvin_csi_id {
        RVIN_CSI20,
        RVIN_CSI21,
        RVIN_CSI40,
        RVIN_CSI41,
        RVIN_CSI_MAX,
};

enum rvin_isp_id {
        RVIN_ISP0,
        RVIN_ISP1,
        RVIN_ISP2,
        RVIN_ISP4,
        RVIN_ISP_MAX,
};

#define RVIN_REMOTES_MAX \
        (((unsigned int)RVIN_CSI_MAX) > ((unsigned int)RVIN_ISP_MAX) ? \
         RVIN_CSI_MAX : RVIN_ISP_MAX)

The idea is to always have RVIN_REMOTES_MAX be the max number of remotes 
in either the CSI-2 or ISP remote use-cases. The warning is generated 
now as currently both use-cases have a maximum of 4 remotes. In future 
this may change and I wanted this to be descibed and addressed by code 
instead by a comment to remmeber to increment RVIN_REMOTES_MAX if one of 
the use-cases are expanded.

On 2021-08-10 13:42:04 +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   da454ebf578f6c542ba9f5b3ddb98db3ede109c1
> commit: 0c56f9597adc870e6761822668868fe2930f08bd [5146/6223] media: rcar-vin: Add r8a779a0 support
> compiler: riscv64-linux-gcc (GCC) 10.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> 
> cppcheck warnings: (new ones prefixed by >>)
> >> drivers/media/platform/rcar-vin/rcar-core.c:220:18: warning: Same value in both branches of ternary operator. [duplicateValueTernary]
>     for (i = 0; i < RVIN_REMOTES_MAX; i++)
>                     ^
> 
> vim +220 drivers/media/platform/rcar-vin/rcar-core.c
> 
> 3bb4c3bc85bf77 Niklas Söderlund 2018-04-14  210  
> 87932605cce9cd Niklas Söderlund 2021-07-09  211  /* group lock should be held when calling this function. */
> 87932605cce9cd Niklas Söderlund 2021-07-09  212  static int rvin_group_entity_to_remote_id(struct rvin_group *group,
> 87932605cce9cd Niklas Söderlund 2021-07-09  213  					  struct media_entity *entity)
> 87932605cce9cd Niklas Söderlund 2021-07-09  214  {
> 87932605cce9cd Niklas Söderlund 2021-07-09  215  	struct v4l2_subdev *sd;
> 87932605cce9cd Niklas Söderlund 2021-07-09  216  	unsigned int i;
> 87932605cce9cd Niklas Söderlund 2021-07-09  217  
> 87932605cce9cd Niklas Söderlund 2021-07-09  218  	sd = media_entity_to_v4l2_subdev(entity);
> 87932605cce9cd Niklas Söderlund 2021-07-09  219  
> 87932605cce9cd Niklas Söderlund 2021-07-09 @220  	for (i = 0; i < RVIN_REMOTES_MAX; i++)
> 87932605cce9cd Niklas Söderlund 2021-07-09  221  		if (group->remotes[i].subdev == sd)
> 87932605cce9cd Niklas Söderlund 2021-07-09  222  			return i;
> 87932605cce9cd Niklas Söderlund 2021-07-09  223  
> 87932605cce9cd Niklas Söderlund 2021-07-09  224  	return -ENODEV;
> 87932605cce9cd Niklas Söderlund 2021-07-09  225  }
> 87932605cce9cd Niklas Söderlund 2021-07-09  226  
> 
> :::::: The code at line 220 was first introduced by commit
> :::::: 87932605cce9cd2a7c986abcbf73666855a2ebc7 media: rcar-vin: Move and rename CSI-2 link notifications
> 
> :::::: TO: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> :::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

-- 
Regards,
Niklas Söderlund
