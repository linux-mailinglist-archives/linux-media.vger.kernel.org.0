Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13F8661EF0B
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 10:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231781AbiKGJbS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 04:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbiKGJbO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 04:31:14 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D60175AD
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 01:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667813470; x=1699349470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5znuvfcRUx7KWtUAcWVSs6hlptb3yaNGKcMniRvX9II=;
  b=iaQUBScEOZP2KskksEYmwxrWuI7GLLp/HvNuf1UUWNW3ZCMhInSzGFd3
   nOGded1aZIDUzmLM11eXPRYUyiRnlyg27DsE2LAHx8Tkvp8ReQJvMLXk0
   AWTmFvYADAtfeDd2wpvyjDkTzON4SsEWy8Sd7KxJSv9oteaxHNAyRYbK6
   fFqYhOwVMR08suQJts0livG2FKI/iWqybNVRLx9cP68lCV7zMwMbQPSJB
   rqi2YRZ3lOzNLQwLE0E0R8As+gKvFRnqYMQYdfDGCCvNLbZS6GEsSTPye
   uf/8hP0s6STvp4ZnJUfFLwVKz8/mOP2e338YG1h3vjgIOtSYZQCVBuypn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="396666944"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="396666944"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 01:31:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="699404446"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="699404446"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 01:31:08 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 0D685201B6;
        Mon,  7 Nov 2022 11:31:06 +0200 (EET)
Date:   Mon, 7 Nov 2022 09:31:06 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [sailus-media-tree:master 43/47] drivers/clk/clk.c:1022:5:
 error: redefinition of 'clk_prepare'
Message-ID: <Y2jQWuZVkk9aInJe@paasikivi.fi.intel.com>
References: <202211031915.GxCDfpg5-lkp@intel.com>
 <20221103173016.a2stvc6jtprs3nzh@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103173016.a2stvc6jtprs3nzh@pengutronix.de>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Thu, Nov 03, 2022 at 06:30:16PM +0100, Marco Felsch wrote:
> Hi,
> 
> On 22-11-03, kernel test robot wrote:
> > tree:   git://linuxtv.org/sailus/media_tree.git master
> > head:   7336c54a562b479866d2de2abc61487a4e07b0b9
> > commit: 80a21da360516fa602f3a50eb9792f9dfbfb5fdb [43/47] media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver
> > config: sh-allmodconfig
> > compiler: sh4-linux-gcc (GCC) 12.1.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git remote add sailus-media-tree git://linuxtv.org/sailus/media_tree.git
> >         git fetch --no-tags sailus-media-tree master
> >         git checkout 80a21da360516fa602f3a50eb9792f9dfbfb5fdb
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> drivers/clk/clk.c:941:6: error: redefinition of 'clk_unprepare'
> >      941 | void clk_unprepare(struct clk *clk)
> >          |      ^~~~~~~~~~~~~
> >    In file included from drivers/clk/clk.c:9:
> >    include/linux/clk.h:303:20: note: previous definition of 'clk_unprepare' with type 'void(struct clk *)'
> >      303 | static inline void clk_unprepare(struct clk *clk)
> >          |                    ^~~~~~~~~~~~~
> > >> drivers/clk/clk.c:1022:5: error: redefinition of 'clk_prepare'
> >     1022 | int clk_prepare(struct clk *clk)
> >          |     ^~~~~~~~~~~
> >    include/linux/clk.h:271:19: note: previous definition of 'clk_prepare' with type 'int(struct clk *)'
> >      271 | static inline int clk_prepare(struct clk *clk)
> >          |                   ^~~~~~~~~~~
> > >> drivers/clk/clk.c:1268:6: error: redefinition of 'clk_is_enabled_when_prepared'
> >     1268 | bool clk_is_enabled_when_prepared(struct clk *clk)
> >          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/clk.h:284:20: note: previous definition of 'clk_is_enabled_when_prepared' with type 'bool(struct clk *)' {aka '_Bool(struct clk *)'}
> >      284 | static inline bool clk_is_enabled_when_prepared(struct clk *clk)
> >          |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Kconfig warnings: (for reference only)
> >    WARNING: unmet direct dependencies detected for COMMON_CLK
> >    Depends on [n]: !HAVE_LEGACY_CLK [=y]
> >    Selected by [m]:
> >    - VIDEO_TC358746 [=m] && MEDIA_SUPPORT [=m] && VIDEO_DEV [=m] && PM [=y] && I2C [=m]
> 
> Hm.. this is strange but my relate to the unmet dependency. I could add
> a depends on COMMON_CLK but this no i2c driver is doing that, just a few
> platform drivers.

I think you should drop the dependency (through select) altogether as you
(I expect) don't really need the common clock framework.

Could you send a patch?

-- 
Kind regards,

Sakari Ailus
