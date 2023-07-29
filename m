Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60056767DA7
	for <lists+linux-media@lfdr.de>; Sat, 29 Jul 2023 11:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbjG2JcA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jul 2023 05:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjG2Jb7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jul 2023 05:31:59 -0400
Received: from mgamail.intel.com (unknown [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E076A3A99
        for <linux-media@vger.kernel.org>; Sat, 29 Jul 2023 02:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690623118; x=1722159118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9E5/hXQ/a43ajYHMI2GY6Ykrx/VZGK1+tUN3LvEjnJ0=;
  b=nqGDHKKeVr/sQ0Cx8CfjWypoa/2/3vLvSKbe9XaZbdL9ZtKY5JrccN7g
   bWWeV6WhzGcf/zQcdlVvNvmKuoHloKVFAx6ce18vfOIWzmSFjoV3Ri7Vk
   B7V0rsWkM8qK5R8XyNIfuyd+dyiuMBu47yqYDcPOgf85lqbfvpVKpI8vw
   HC824y22kRIfw89LiAWNzPYINuiHAFuJa6SNSvrjzaYhl53r+VUa/ZJsk
   sDts0xGt7N9EzVjUVl7j6SpOPyDoTt74Y/OajhNyW+x9BfeXlzxT2TRnm
   EZaPV7Nw3n6i/Psrb7sSWYwMi9+IMNIGHIE7zKsjBCwhcbeKnM+dqpSlz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="371445469"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="371445469"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 02:31:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="704849257"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="704849257"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 02:31:56 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 1EC4411F81F;
        Sat, 29 Jul 2023 12:31:54 +0300 (EEST)
Date:   Sat, 29 Jul 2023 09:31:54 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [sailus-media-tree:master 9/20]
 drivers/media/i2c/ov5693.c:1280:17: warning: incompatible integer to pointer
 conversion assigning to 'struct regmap *' from 'int'
Message-ID: <ZMTcirgM3W+C0rag@kekkonen.localdomain>
References: <202307271517.dPa1bTSi-lkp@intel.com>
 <8848c668-4736-a478-a277-e0cf1aa96ad4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8848c668-4736-a478-a277-e0cf1aa96ad4@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jul 27, 2023 at 10:57:15AM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 7/27/23 09:34, kernel test robot wrote:
> > tree:   git://linuxtv.org/sailus/media_tree.git master
> > head:   215e4463b11d94668b841368cb6882f3a2968148
> > commit: 6ca0d78da91133ec78ecfbdaa7d066849b1b0c0c [9/20] media: ov5693: Convert to new CCI register access helpers
> > config: arm-randconfig-r012-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271517.dPa1bTSi-lkp@intel.com/config)
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271517.dPa1bTSi-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202307271517.dPa1bTSi-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    drivers/media/i2c/ov5693.c:1280:19: error: implicit declaration of function 'devm_cci_regmap_init_i2c' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
> >            ov5693->regmap = devm_cci_regmap_init_i2c(client, 16);
> 
> This is caused by a mis-merge:
> 
> https://git.linuxtv.org/sailus/media_tree.git/commit/?id=6ca0d78da91133ec78ecfbdaa7d066849b1b0c0c
> 
> Shows that the "select V4L2_CCI_I2C" was added to the DW9768 Kconfig block instead of to the OV5693 block.

Oops. Probably a result of the automatic merge, as both mine and your
patches changed the surrounding lines. I'll send a patch to fix this as
well as the other issue. Thanks for pointing this out.

-- 
Kind regards,

Sakari Ailus
