Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 582C7521117
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 11:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238981AbiEJJlV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 05:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238997AbiEJJlU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 05:41:20 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34815F31
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 02:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652175444; x=1683711444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RPe5edJtDaKBmXKqcAj4YG/kAg1R+o5DVVgpgCIN+Jc=;
  b=mXlBNrdG6J/EU5HkTUgdorqss+acD+dacD6NysNy6KtrvbHCCdXZE3DN
   804P7zMTJ5EL2+dT2PRS7sXoWrFAWpIijur0DrGoYrQI2I96pJhbtZEdZ
   T+pNYlFyULUNPC9NFwm+dxGCrx7Aub3CCBrGttwy3wN4il8Kke+uJYvgj
   cDkMpXpfs/wK6axSXkaTspdmIl0dq8e9qRfwZpabdRAFqp4tPO6nlLrqg
   yy6mbzaRY40RNleIUlhDHyA+e/4P1VGU2O7A31sZVEIpNnbTUimXCDivN
   a66Smml5oZ6mxoQqjiPbjPXtxpRUci4k0PtumFta42lbd0N74ehAZfUJT
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="256858321"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="256858321"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 02:37:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="696998414"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 May 2022 02:37:21 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1noMIz-000HeK-3i;
        Tue, 10 May 2022 09:37:21 +0000
Date:   Tue, 10 May 2022 17:36:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jimmy Su <jimmy.su@intel.com>, linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org, sakari.ailus@linux.intel.com,
        andy.yeh@intel.com, jimmy.su@intel.com, yhuang@ovt.com,
        akeem.chen@ovt.com
Subject: Re: [PATCH v1] UPSTREAM: media: ov8856: skip OTP read in non-zero
 ACPI D state
Message-ID: <202205101712.zAVVObID-lkp@intel.com>
References: <20220510080850.4306-1-jimmy.su@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510080850.4306-1-jimmy.su@intel.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jimmy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc6 next-20220509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jimmy-Su/UPSTREAM-media-ov8856-skip-OTP-read-in-non-zero-ACPI-D-state/20220510-161148
base:   git://linuxtv.org/media_tree.git master
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220510/202205101712.zAVVObID-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7c73f80b49c8ffc328209b21fa3c85ac8b9295d2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jimmy-Su/UPSTREAM-media-ov8856-skip-OTP-read-in-non-zero-ACPI-D-state/20220510-161148
        git checkout 7c73f80b49c8ffc328209b21fa3c85ac8b9295d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/i2c/ov8856.c: In function 'ov8856_identify_module':
>> drivers/media/i2c/ov8856.c:1715:44: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
    1715 |         if (ov8856->acpi_skip_otp & (width == 3280 | width == 1640))
         |                                      ~~~~~~^~~~~~~


vim +1715 drivers/media/i2c/ov8856.c

  1693	
  1694	static int ov8856_identify_module(struct ov8856 *ov8856)
  1695	{
  1696		struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
  1697		int ret;
  1698		u32 val, width;
  1699	
  1700		if (ov8856->identified)
  1701			return 0;
  1702	
  1703		ret = ov8856_read_reg(ov8856, OV8856_REG_CHIP_ID,
  1704				      OV8856_REG_VALUE_24BIT, &val);
  1705		if (ret)
  1706			return ret;
  1707	
  1708		if (val != OV8856_CHIP_ID) {
  1709			dev_err(&client->dev, "chip id mismatch: %x!=%x",
  1710				OV8856_CHIP_ID, val);
  1711			return -ENXIO;
  1712		}
  1713	
  1714		width = ov8856->cur_mode->width;
> 1715		if (ov8856->acpi_skip_otp & (width == 3280 | width == 1640))
  1716			goto otp_skip;
  1717	
  1718		ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
  1719				       OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
  1720		if (ret)
  1721			return ret;
  1722	
  1723		ret = ov8856_write_reg(ov8856, OV8856_OTP_MODE_CTRL,
  1724				       OV8856_REG_VALUE_08BIT, OV8856_OTP_MODE_AUTO);
  1725		if (ret) {
  1726			dev_err(&client->dev, "failed to set otp mode");
  1727			return ret;
  1728		}
  1729	
  1730		ret = ov8856_write_reg(ov8856, OV8856_OTP_LOAD_CTRL,
  1731				       OV8856_REG_VALUE_08BIT,
  1732				       OV8856_OTP_LOAD_CTRL_ENABLE);
  1733		if (ret) {
  1734			dev_err(&client->dev, "failed to enable load control");
  1735			return ret;
  1736		}
  1737	
  1738		ret = ov8856_read_reg(ov8856, OV8856_MODULE_REVISION,
  1739				      OV8856_REG_VALUE_08BIT, &val);
  1740		if (ret) {
  1741			dev_err(&client->dev, "failed to read module revision");
  1742			return ret;
  1743		}
  1744	
  1745		dev_info(&client->dev, "OV8856 revision %x (%s) at address 0x%02x\n",
  1746			 val,
  1747			 val == OV8856_2A_MODULE ? "2A" :
  1748			 val == OV8856_1B_MODULE ? "1B" : "unknown revision",
  1749			 client->addr);
  1750	
  1751		ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
  1752				       OV8856_REG_VALUE_08BIT, OV8856_MODE_STANDBY);
  1753		if (ret) {
  1754			dev_err(&client->dev, "failed to exit streaming mode");
  1755			return ret;
  1756		}
  1757	
  1758		ov8856->identified = true;
  1759	
  1760		return 0;
  1761	
  1762	otp_skip:
  1763		ov8856->identified = true;
  1764	
  1765		return 0;
  1766	}
  1767	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
