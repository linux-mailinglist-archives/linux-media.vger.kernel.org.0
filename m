Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8DF54FD0D
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 20:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbiFQSs4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 14:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiFQSs4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 14:48:56 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7BE3D4BF
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 11:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655491735; x=1687027735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+JJmTa95IQJI57c1saPaWd+EH0RgxhtzxGpAHl0cnNs=;
  b=BOeo3iHDJqtLOytc3hA3SvpbgF938snDA87jjimDG7l/RX8ZZmnBBgxC
   K3v3WQQeQJJRitY3otSddB1ItKHGTqACIDDlgpsSpjIZqtU/Cjf5lRjEl
   N6eyRm2tQaJdE2Nhvk/2n43ojbVEf8YBg5WmwA5FdVwbbu9vZsNrz1kYK
   u11GSIOKeHCVbw81F81sryFz7rUFrLIopj04achewQfIjYa/kbWyTMtnq
   SndzXvxYE+KFQtLn1C8ULcdhb8kJ6h9OwswZo7om1VU5kdfAByZqdFbPp
   QJn0NfvoWPo58v1C3gaj/VhxnieMYByGlrsJm3wCLhxhWkyxejDoe72+u
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268279823"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="268279823"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 11:48:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="536920759"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Jun 2022 11:48:52 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o2H1X-000Pfp-V9;
        Fri, 17 Jun 2022 18:48:51 +0000
Date:   Sat, 18 Jun 2022 02:48:11 +0800
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
Message-ID: <202206180224.IQyAlsqP-lkp@intel.com>
References: <20220616163632.13562-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616163632.13562-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
config: (https://download.01.org/0day-ci/archive/20220618/202206180224.IQyAlsqP-lkp@intel.com/config)
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/efc926771b1dc55aaa144308fd649aa1bc6e69ba
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Laurent-Pinchart/media-Replace-dependency-on-VIDEO_V4L2_SUBDEV_API-with-select/20220617-003721
        git checkout efc926771b1dc55aaa144308fd649aa1bc6e69ba
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_VIDEO_V4L2_SUBDEV_API --selectors CONFIG_V4L2_FLASH_LED_CLASS -a=x86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=x86_64 olddefconfig

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API when selected by V4L2_FLASH_LED_CLASS
   
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
     Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && MEDIA_CONTROLLER [=n]
     Selected by [y]:
     - V4L2_FLASH_LED_CLASS [=y] && MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && LEDS_CLASS_FLASH [=y]

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
