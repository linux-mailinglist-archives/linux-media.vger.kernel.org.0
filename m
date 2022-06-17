Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B48015500B9
	for <lists+linux-media@lfdr.de>; Sat, 18 Jun 2022 01:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383683AbiFQX0D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 19:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383669AbiFQX0C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 19:26:02 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E3C6622D
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 16:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655508361; x=1687044361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FvZECAsT8L9fLf2qEejwprREeqWGPJAPAqXcUjZsAQo=;
  b=Ud6Cly4hz61cRLIiAAQS+59HmqnMgFz3kRUShZVHAvPmPzMfHaKiheTt
   T1R4XxsrTX8GJS1hylvIuqmNAHE1kOo6QB8Pqm1O07Xj/aK4mqiKBhCBu
   HFoamY3/JEkspmx5yVwiJz4qjkUvMfHsm+K0B0094usgiolRvcDaFhWDI
   G6xlkhYIMnutfol6bpXmVu9AmW240JrESaP6ahpLNcJNmTAlsISfgebcX
   HHZw/fhfvzDK5LKpPLBeVCcZKhxWqLObp2TTdoMLLFnTlk/GW+IAioao+
   mmH+TRDfZXHIW1m0J7eW6Rlic3SyLpnfGsjKCVhcKXWdFZF25xqzJEvFM
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="279639944"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="279639944"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 16:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="613715267"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 17 Jun 2022 16:25:59 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o2LLi-000PqV-B8;
        Fri, 17 Jun 2022 23:25:58 +0000
Date:   Sat, 18 Jun 2022 07:25:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        kbuild-all@lists.01.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: Replace dependency on VIDEO_V4L2_SUBDEV_API with
 select
Message-ID: <202206180756.PjHKYkkX-lkp@intel.com>
References: <20220616163632.13562-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616163632.13562-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/media-Replace-dependency-on-VIDEO_V4L2_SUBDEV_API-with-select/20220617-003721
base:   git://linuxtv.org/media_tree.git master
config: (https://download.01.org/0day-ci/archive/20220618/202206180756.PjHKYkkX-lkp@intel.com/config)
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/efc926771b1dc55aaa144308fd649aa1bc6e69ba
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Laurent-Pinchart/media-Replace-dependency-on-VIDEO_V4L2_SUBDEV_API-with-select/20220617-003721
        git checkout efc926771b1dc55aaa144308fd649aa1bc6e69ba
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_VIDEO_V4L2_SUBDEV_API --selectors CONFIG_VIDEO_ATMEL_XISC -a=x86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=x86_64 olddefconfig

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API when selected by VIDEO_ATMEL_XISC
   
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
     Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && MEDIA_CONTROLLER [=n]
     Selected by [y]:
     - VIDEO_ATMEL_XISC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && VIDEO_DEV [=y] && COMMON_CLK [=y] && (ARCH_AT91 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
