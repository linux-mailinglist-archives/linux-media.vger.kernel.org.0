Return-Path: <linux-media+bounces-4202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EED4883D614
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 10:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A61B128AF95
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 09:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B9A1CFAD;
	Fri, 26 Jan 2024 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCdjqrgs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC3613AF0
	for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 08:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706258863; cv=none; b=Uo0oXbF+2N6pLP9uHecAgcJCIWn1RnfLpj1I99UsDE4caNWNMSiaWb0kJhTFIPMnTuMzbXyIy5EJz/7P5Fs6mjBUhmSwiVMJJXCJv0vKihLucJ5bpMnjpRJ1xq0wFZR6PeXg25RcH8tOpHK1dIbx4YaU6VL8RMsYdO3EhA05b2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706258863; c=relaxed/simple;
	bh=GwRZaaw3NyWFd5uN+V2xFfKA+ax5+ZRg2Cx/yrStlJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dlg0Ir5ehpJDhX+9XHiHLRiry74M4vb/6Fw6X9YiwKmdRhvk5sxzLhRYRutuknD911hl9EqE2Z/nHRIF90NHNUqoPwh++mblO3v1Bn2fluO2jfEdP6LMB1MPsL6bckvzRMgJ1envGaSgZIwGQnaZYpFEmsAGwG7AKt+2vB3LIZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCdjqrgs; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706258861; x=1737794861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GwRZaaw3NyWFd5uN+V2xFfKA+ax5+ZRg2Cx/yrStlJY=;
  b=KCdjqrgs/dqY0pIWUlYTT5vtM43q+Zs7vpGE6fboiJ56u0uFeM99QBBQ
   45wQO5IsIuBR29TMQnuu1y3nDrx+smDXRvlht9upTlsuGVqdkEKcgJEt6
   fpw1tXiI6ZwEJBCmRbro2p8yhR/lBK12Igt8vPI0VPuxO+ghVsC2WLBBw
   9W9Io8F8y4x9armwJRl621ufPs6NqZ+GUDs3knqIh8D34ystCCEOc0ITi
   L+Zox2odM4mVlDwSV82J+i31wH2YtsiDGRdBylWNS5Gfog9qvu05Go1Sl
   U+gn8yMn4Q9GBpwXrBlGh8v50209a5SSvKoMkrZ9v/83DMMs6RbKL6uXM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="466698485"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="466698485"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 00:47:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="960153671"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="960153671"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Jan 2024 00:47:39 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTHs9-0000rg-0b;
	Fri, 26 Jan 2024 08:47:37 +0000
Date: Fri, 26 Jan 2024 16:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Chen <jason.z.chen@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [sailus-media-tree:master 18/18]
 drivers/media/i2c/ov08x40.c:1783:23: error: no member named 'exposure_shift'
 in 'struct ov08x40_mode'
Message-ID: <202401261628.dWEtdXLE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   f76be7216c3df5f563353bd7a6aaf5076b118943
commit: f76be7216c3df5f563353bd7a6aaf5076b118943 [18/18] media: ov08x40: Reduce start streaming time
config: i386-randconfig-003-20240126 (https://download.01.org/0day-ci/archive/20240126/202401261628.dWEtdXLE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401261628.dWEtdXLE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401261628.dWEtdXLE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ov08x40.c:1783:23: error: no member named 'exposure_shift' in 'struct ov08x40_mode'
    1783 |         if (ov08x->cur_mode->exposure_shift == 1) {
         |             ~~~~~~~~~~~~~~~  ^
   1 error generated.


vim +1783 drivers/media/i2c/ov08x40.c

  1749	
  1750	static int ov08x40_start_streaming(struct ov08x40 *ov08x)
  1751	{
  1752		struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
  1753		const struct ov08x40_reg_list *reg_list;
  1754		int ret, link_freq_index;
  1755	
  1756		/* Get out of from software reset */
  1757		ret = ov08x40_write_reg(ov08x, OV08X40_REG_SOFTWARE_RST,
  1758					OV08X40_REG_VALUE_08BIT, OV08X40_SOFTWARE_RST);
  1759		if (ret) {
  1760			dev_err(&client->dev, "%s failed to set powerup registers\n",
  1761				__func__);
  1762			return ret;
  1763		}
  1764	
  1765		link_freq_index = ov08x->cur_mode->link_freq_index;
  1766		reg_list = &link_freq_configs[link_freq_index].reg_list;
  1767	
  1768		ret = ov08x40_write_reg_list(ov08x, reg_list);
  1769		if (ret) {
  1770			dev_err(&client->dev, "%s failed to set plls\n", __func__);
  1771			return ret;
  1772		}
  1773	
  1774		/* Apply default values of current mode */
  1775		reg_list = &ov08x->cur_mode->reg_list;
  1776		ret = ov08x40_write_reg_list(ov08x, reg_list);
  1777		if (ret) {
  1778			dev_err(&client->dev, "%s failed to set mode\n", __func__);
  1779			return ret;
  1780		}
  1781	
  1782		/* Use i2c burst to write register on full size registers */
> 1783		if (ov08x->cur_mode->exposure_shift == 1) {
  1784			ret = ov08x40_burst_fill_regs(ov08x, OV08X40_REG_XTALK_FIRST_A,
  1785						      OV08X40_REG_XTALK_LAST_A, 0x75);
  1786			if (ret == 0)
  1787				ret = ov08x40_burst_fill_regs(ov08x,
  1788							      OV08X40_REG_XTALK_FIRST_B,
  1789							      OV08X40_REG_XTALK_LAST_B,
  1790							      0x75);
  1791		}
  1792	
  1793		if (ret) {
  1794			dev_err(&client->dev, "%s failed to set regs\n", __func__);
  1795			return ret;
  1796		}
  1797	
  1798		/* Apply customized values from user */
  1799		ret =  __v4l2_ctrl_handler_setup(ov08x->sd.ctrl_handler);
  1800		if (ret)
  1801			return ret;
  1802	
  1803		return ov08x40_write_reg(ov08x, OV08X40_REG_MODE_SELECT,
  1804					 OV08X40_REG_VALUE_08BIT,
  1805					 OV08X40_MODE_STREAMING);
  1806	}
  1807	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

