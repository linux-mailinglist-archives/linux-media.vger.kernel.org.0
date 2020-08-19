Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0A124A65D
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 20:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgHSS4t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 14:56:49 -0400
Received: from mga14.intel.com ([192.55.52.115]:18338 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbgHSS4s (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 14:56:48 -0400
IronPort-SDR: BQ9FFDg6XTENZ1GN/KESNAsUtHSgr9gbOn2yfcqcuLa8zSTbSOJEULwlvgjHYUvIXLxxPMj3k7
 BxyjmcBC9qfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="154444203"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="154444203"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2020 11:56:47 -0700
IronPort-SDR: Jh+fFVgJecRZAvuuktI5nBGJaCuSb4PnfP7ICJ74i9f5Sq5miochaRVz2c0UQPtq1A+Tg2ur7g
 xpt0k0wt54ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="337053160"
Received: from lkp-server01.sh.intel.com (HELO 4cedd236b688) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Aug 2020 11:56:45 -0700
Received: from kbuild by 4cedd236b688 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k8TGP-0000Tm-2j; Wed, 19 Aug 2020 18:56:45 +0000
Date:   Thu, 20 Aug 2020 02:56:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: drivers/media/i2c/adv748x/adv748x-core.c:132:10: warning: Identical
 inner 'return' condition is always true.
Message-ID: <202008200212.kvDyjmew%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18445bf405cb331117bc98427b1ba6f12418ad17
commit: 32a363d0b0b142f35512848dc646ee53e0926723 media: Kconfig files: use select for V4L2 subdevs and MC
date:   4 months ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/media/i2c/adv748x/adv748x-core.c:132:10: warning: Identical inner 'return' condition is always true. [identicalInnerCondition]
     return *error;
            ^
   drivers/media/i2c/adv748x/adv748x-core.c:131:6: note: outer condition: *error
    if (*error)
        ^
   drivers/media/i2c/adv748x/adv748x-core.c:132:10: note: identical inner condition: *error
     return *error;
            ^
>> drivers/media/i2c/tda1997x.c:2108:6: warning: Variable 'reg' is reassigned a value before the old one has been used. [redundantAssignment]
    reg = io_read(sd, REG_CMTP_REG10);
        ^
   drivers/media/i2c/tda1997x.c:2106:6: note: Variable 'reg' is reassigned a value before the old one has been used.
    reg = io_read(sd, REG_VERSION);
        ^
   drivers/media/i2c/tda1997x.c:2108:6: note: Variable 'reg' is reassigned a value before the old one has been used.
    reg = io_read(sd, REG_CMTP_REG10);
        ^
   drivers/media/i2c/tda1997x.c:2176:6: warning: Variable 'reg' is reassigned a value before the old one has been used. [redundantAssignment]
    reg = HDMI_CTRL_MUTE_AUTO << HDMI_CTRL_MUTE_SHIFT;
        ^
   drivers/media/i2c/tda1997x.c:2108:6: note: Variable 'reg' is reassigned a value before the old one has been used.
    reg = io_read(sd, REG_CMTP_REG10);
        ^
   drivers/media/i2c/tda1997x.c:2176:6: note: Variable 'reg' is reassigned a value before the old one has been used.
    reg = HDMI_CTRL_MUTE_AUTO << HDMI_CTRL_MUTE_SHIFT;
        ^
>> drivers/media/i2c/tda1997x.c:2539:34: warning: Local variable pdata shadows outer variable [shadowVar]
     struct tda1997x_platform_data *pdata =
                                    ^
   drivers/media/i2c/tda1997x.c:2508:33: note: Shadowed declaration
    struct tda1997x_platform_data *pdata;
                                   ^
   drivers/media/i2c/tda1997x.c:2539:34: note: Shadow variable
     struct tda1997x_platform_data *pdata =
                                    ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=32a363d0b0b142f35512848dc646ee53e0926723
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
git fetch --no-tags linus master
git checkout 32a363d0b0b142f35512848dc646ee53e0926723
vim +/return +132 drivers/media/i2c/adv748x/adv748x-core.c

3e89586a64dfd2 Kieran Bingham   2017-07-06  127  
0ad5b80cff5093 Niklas Söderlund 2018-11-28  128  static int adv748x_write_check(struct adv748x_state *state, u8 page, u8 reg,
0ad5b80cff5093 Niklas Söderlund 2018-11-28  129  			       u8 value, int *error)
0ad5b80cff5093 Niklas Söderlund 2018-11-28  130  {
0ad5b80cff5093 Niklas Söderlund 2018-11-28  131  	if (*error)
0ad5b80cff5093 Niklas Söderlund 2018-11-28 @132  		return *error;
0ad5b80cff5093 Niklas Söderlund 2018-11-28  133  
0ad5b80cff5093 Niklas Söderlund 2018-11-28  134  	*error = adv748x_write(state, page, reg, value);
0ad5b80cff5093 Niklas Söderlund 2018-11-28  135  	return *error;
0ad5b80cff5093 Niklas Söderlund 2018-11-28  136  }
0ad5b80cff5093 Niklas Söderlund 2018-11-28  137  

:::::: The code at line 132 was first introduced by commit
:::::: 0ad5b80cff509360ef9953ac7ce5a56964210c30 media: i2c: adv748x: configure number of lanes used for TXA CSI-2 transmitter

:::::: TO: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
