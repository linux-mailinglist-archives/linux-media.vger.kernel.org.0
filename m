Return-Path: <linux-media+bounces-45243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 722CFBFC7F4
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B11D962743F
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 14:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F2B26ED28;
	Wed, 22 Oct 2025 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giCjTQ5s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0524234A78C;
	Wed, 22 Oct 2025 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142584; cv=none; b=NhHGsv2/pSj2fm1wXu+SGoWGB06Vc3qaDn1L8YBdWm/x9d0jVjn1aVuX3JQZ/5n2goKDlURSfHjDESYB9Uae/xNxTc6jlVi/o56WIduLyNmLUip7fcuetlKKg7y29Y6zwf32A3RpTi9e1TJbdDSo3kBjWUcOnV3zKJpknuhtDAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142584; c=relaxed/simple;
	bh=WLIq3te9nq7A6J2hfe3bvnRM8WiFX1/q3SS62dWu5ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmK557s1P7W+/toG3A3Ipu1G54+dOImQ/YWG5ITZL9SEsEus/tXfvgNpT+lqQoR4Dx6W2yHMxrnpJFlxmM3dN4KY/RjQVzFPLwwXELiUfIIv0xsmgB6GN6FVqhO2MahjSBRr6j0Z4YDyTGF5/vAkecnYasEf3C3ujQSvjryyVXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giCjTQ5s; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761142584; x=1792678584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WLIq3te9nq7A6J2hfe3bvnRM8WiFX1/q3SS62dWu5ZE=;
  b=giCjTQ5sWvtZk8mzkX+i87XzHFiY1fDjsmpcdRBIb3UavEg1afghvF8o
   MyoO/OLNtid+4ZZI/PHGb/C70fBfBoTlWAZ7lBl4HPgUFiB/qeQKZ3hRE
   Xu79OwnLYe14P/uTcwXDd+c6HXrrtVoydOlfAYzK+ycg+UGZen1rbvmFI
   sfMmeeAa4pRVM7EeUipCD4U3IXIE/wNTYu4TDofr8XZl/jjNDs4BrpHd4
   OMMgAimfT3wbKgrK/W1IQV4YM8CxlTYSoqjXMfb4V3joCGbbm2P4E4xWi
   tdYQK5AD6jqe27dPWOqW+QYgsZjpsWY5gllTYhJn06PbBsGXwycpI21Uw
   w==;
X-CSE-ConnectionGUID: o69RZQJUQreA2nxtH+u0FQ==
X-CSE-MsgGUID: oLTWat13TmynZFf4k3ve9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63332323"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="63332323"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 07:16:23 -0700
X-CSE-ConnectionGUID: qaZ/8OfDSS6N/9RBj6haAg==
X-CSE-MsgGUID: axV8P9zZRx+GIM1oecSuHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="184368005"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Oct 2025 07:16:20 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBZbI-000CQ5-14;
	Wed, 22 Oct 2025 14:15:13 +0000
Date: Wed, 22 Oct 2025 22:09:20 +0800
From: kernel test robot <lkp@intel.com>
To: Biancaa Ramesh <biancaa2210329@ssn.edu.in>, linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, awalls@md.metrocast.net,
	mchehab@kernel.org, linux-kernel@vger.kernel.org,
	Biancaa Ramesh <biancaa2210329@ssn.edu.in>
Subject: Re: [PATCH] pcmcia/parport_cs: Refactor probe function and improve
 error logging
Message-ID: <202510222115.WBPLEBsN-lkp@intel.com>
References: <20251021190021.173748-1-biancaa2210329@ssn.edu.in>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021190021.173748-1-biancaa2210329@ssn.edu.in>

Hi Biancaa,

kernel test robot noticed the following build errors:

[auto build test ERROR on sailus-media-tree/master]
[also build test ERROR on linus/master v6.18-rc2 next-20251022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biancaa-Ramesh/pcmcia-parport_cs-Refactor-probe-function-and-improve-error-logging/20251022-030324
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20251021190021.173748-1-biancaa2210329%40ssn.edu.in
patch subject: [PATCH] pcmcia/parport_cs: Refactor probe function and improve error logging
config: x86_64-buildonly-randconfig-006-20251022 (https://download.01.org/0day-ci/archive/20251022/202510222115.WBPLEBsN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510222115.WBPLEBsN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510222115.WBPLEBsN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/parport/parport_cs.c: In function 'parport_config':
>> drivers/parport/parport_cs.c:164:9: error: label 'failed' used but not defined
     164 |         goto failed;
         |         ^~~~
>> drivers/parport/parport_cs.c:137:21: warning: unused variable 'info' [-Wunused-variable]
     137 |     parport_info_t *info = link->priv;
         |                     ^~~~
>> drivers/parport/parport_cs.c:167:5: warning: no return statement in function returning non-void [-Wreturn-type]
     167 |     }
         |     ^
   drivers/parport/parport_cs.c: At top level:
>> drivers/parport/parport_cs.c:169:6: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
     169 |     p->modes |= PARPORT_MODE_PCSPP;
         |      ^~
>> drivers/parport/parport_cs.c:170:5: error: expected identifier or '(' before 'if'
     170 |     if (epp_mode)
         |     ^~
   drivers/parport/parport_cs.c:172:9: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
     172 |     info->ndev = 1;
         |         ^~
   drivers/parport/parport_cs.c:173:9: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
     173 |     info->port = p;
         |         ^~
>> drivers/parport/parport_cs.c:175:5: error: expected identifier or '(' before 'return'
     175 |     return 0;
         |     ^~~~~~
>> drivers/parport/parport_cs.c:177:7: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
     177 | failed:
         |       ^
>> drivers/parport/parport_cs.c:179:19: error: expected ')' before '->' token
     179 |         kfree(link->priv);
         |                   ^~
         |                   )
   drivers/parport/parport_cs.c:180:9: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
     180 |     link->priv = NULL;
         |         ^~
   drivers/parport/parport_cs.c:181:9: error: expected identifier or '(' before 'return'
     181 |         return -ENODEV;
         |         ^~~~~~
>> drivers/parport/parport_cs.c:182:1: error: expected identifier or '(' before '}' token
     182 | } /* parport_config */
         | ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/failed +164 drivers/parport/parport_cs.c

84e2d34004dcd0c Dominik Brodowski 2008-07-29  134  
15b99ac1729503d Dominik Brodowski 2006-03-31  135  static int parport_config(struct pcmcia_device *link)
^1da177e4c3f415 Linus Torvalds    2005-04-16  136  {
^1da177e4c3f415 Linus Torvalds    2005-04-16 @137      parport_info_t *info = link->priv;
^1da177e4c3f415 Linus Torvalds    2005-04-16  138      struct parport *p;
9b44de2015ff4a2 Dominik Brodowski 2009-10-24  139      int ret;
^1da177e4c3f415 Linus Torvalds    2005-04-16  140  
9b44de2015ff4a2 Dominik Brodowski 2009-10-24  141      dev_dbg(&link->dev, "parport_config\n");
^1da177e4c3f415 Linus Torvalds    2005-04-16  142  
00990e7ce0b0e59 Dominik Brodowski 2010-07-30  143      if (epp_mode)
00990e7ce0b0e59 Dominik Brodowski 2010-07-30  144  	    link->config_index |= FORCE_EPP_MODE;
00990e7ce0b0e59 Dominik Brodowski 2010-07-30  145  
9b44de2015ff4a2 Dominik Brodowski 2009-10-24  146      ret = pcmcia_loop_config(link, parport_config_check, NULL);
9b44de2015ff4a2 Dominik Brodowski 2009-10-24  147      if (ret)
84e2d34004dcd0c Dominik Brodowski 2008-07-29  148  	    goto failed;
^1da177e4c3f415 Linus Torvalds    2005-04-16  149  
eb14120f743d297 Dominik Brodowski 2010-03-07  150      if (!link->irq)
9b44de2015ff4a2 Dominik Brodowski 2009-10-24  151  	    goto failed;
1ac71e5a35eebee Dominik Brodowski 2010-07-29  152      ret = pcmcia_enable_device(link);
9b44de2015ff4a2 Dominik Brodowski 2009-10-24  153      if (ret)
9b44de2015ff4a2 Dominik Brodowski 2009-10-24  154  	    goto failed;
^1da177e4c3f415 Linus Torvalds    2005-04-16  155  
9a017a910346afd Dominik Brodowski 2010-07-24  156      p = parport_pc_probe_port(link->resource[0]->start,
9a017a910346afd Dominik Brodowski 2010-07-24  157  			      link->resource[1]->start,
eb14120f743d297 Dominik Brodowski 2010-03-07  158  			      link->irq, PARPORT_DMA_NONE,
51dcdfec6a274af Alan Cox          2009-04-07  159  			      &link->dev, IRQF_SHARED);
fac3d7d7b11c825 Biancaa Ramesh    2025-10-22  160      if (!p) {
fac3d7d7b11c825 Biancaa Ramesh    2025-10-22  161          dev_err(&link->dev,
fac3d7d7b11c825 Biancaa Ramesh    2025-10-22  162              "parport_pc_probe_port() failed at 0x%03x, irq %u\n",
decf26f6ec25dac Joe Perches       2020-04-03  163              (unsigned int)link->resource[0]->start, link->irq);
^1da177e4c3f415 Linus Torvalds    2005-04-16 @164          goto failed;
^1da177e4c3f415 Linus Torvalds    2005-04-16  165      }   
^1da177e4c3f415 Linus Torvalds    2005-04-16  166  
fac3d7d7b11c825 Biancaa Ramesh    2025-10-22 @167      }
fac3d7d7b11c825 Biancaa Ramesh    2025-10-22  168  
^1da177e4c3f415 Linus Torvalds    2005-04-16 @169      p->modes |= PARPORT_MODE_PCSPP;
^1da177e4c3f415 Linus Torvalds    2005-04-16 @170      if (epp_mode)
^1da177e4c3f415 Linus Torvalds    2005-04-16  171  	p->modes |= PARPORT_MODE_TRISTATE | PARPORT_MODE_EPP;
^1da177e4c3f415 Linus Torvalds    2005-04-16  172      info->ndev = 1;
^1da177e4c3f415 Linus Torvalds    2005-04-16  173      info->port = p;
^1da177e4c3f415 Linus Torvalds    2005-04-16  174  
15b99ac1729503d Dominik Brodowski 2006-03-31 @175      return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  176  
^1da177e4c3f415 Linus Torvalds    2005-04-16 @177  failed:
^1da177e4c3f415 Linus Torvalds    2005-04-16  178  	parport_cs_release(link);
21c75ad65f8e521 YueHaibing        2019-03-21 @179  	kfree(link->priv);
fac3d7d7b11c825 Biancaa Ramesh    2025-10-22  180      link->priv = NULL;
15b99ac1729503d Dominik Brodowski 2006-03-31  181  	return -ENODEV;
^1da177e4c3f415 Linus Torvalds    2005-04-16 @182  } /* parport_config */
^1da177e4c3f415 Linus Torvalds    2005-04-16  183  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

