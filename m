Return-Path: <linux-media+bounces-45318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E113ABFE26E
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 22:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B187F1A082DF
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 20:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CCB2FB09E;
	Wed, 22 Oct 2025 20:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NblNpqAl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839262FAC0A;
	Wed, 22 Oct 2025 20:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761164662; cv=none; b=MKRBBAdar+koMIPdc/pZuwS9WnQAtY0ljN5zpxTdmN8iYRAD7ueyfYMa2G39YLRHPOrXRPy0Crx+B3jzFLU7vTT5DDbsGTER5ertK7ts82BuBaUqQ/pBtfOd9Px4iezuNpnPp3gS1JY7znzrxH9RXH3hKKIjCkIAs/RMgMnbx6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761164662; c=relaxed/simple;
	bh=/29y36gsV1TiadjcFWyffNJHdhWqvc81cPPVdLkzjVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBWCQTe2f6dnPxkBxEFPbZ/8OQIRq3HPeVCvHoMAa6YUs0Emes/YuXXGoYvaLkiCMGXdJXmZkH63OL8GHqGOYEt2cKdQVbDRGlDQhyAcMyiRg++OPBSbwwmzjgqrxk5VyGqOcKDCnhBSPqZl1CPmMC6tcttAjZl1wpLGVpmaMu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NblNpqAl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761164661; x=1792700661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/29y36gsV1TiadjcFWyffNJHdhWqvc81cPPVdLkzjVw=;
  b=NblNpqAlmc23fyuDGA5aujJMJHuYE23peQnYKqT0n+A0B8K8xFlrPdAp
   GFbCMRoTN2iaR8QI6UZAboFWu8C5I/ascoP9R3E1TZsVsE2oHX+NWclVP
   GhAx1U9pr4N19OKZhsKltWAIcidDCDPELq6vYBe79CxYcs5gBdQMdh5MM
   8icYoBtdIjgwRhK76oT8C5KZrI6AUlN6tc12O/iK4ph0PdUyAkky93Aeo
   U92VcOnXBhVr7knPG1r6rgOobwgSxNXn50wD14zusWrtbXPtd99TbpVx7
   vzXlDjh0yE+jxxyL2nPw2bIfbfYN2l2kqGYSp5jJ/w3PkxdbopgqiunSm
   g==;
X-CSE-ConnectionGUID: vceb0yE8Q4ehGjUgRqW1Cg==
X-CSE-MsgGUID: oTgbHW5fThW8Y2n5qXQhjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50902560"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="50902560"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 13:24:20 -0700
X-CSE-ConnectionGUID: 0lC9f6hTQqe217GyqchCwg==
X-CSE-MsgGUID: GcqEz40bSKmDS/AQ36mebA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="184742672"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Oct 2025 13:24:14 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBfNU-000ChR-00;
	Wed, 22 Oct 2025 20:24:12 +0000
Date: Thu, 23 Oct 2025 04:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: Biancaa Ramesh <biancaa2210329@ssn.edu.in>, linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	awalls@md.metrocast.net, mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Biancaa Ramesh <biancaa2210329@ssn.edu.in>
Subject: Re: [PATCH] pcmcia/parport_cs: Refactor probe function and improve
 error logging
Message-ID: <202510230450.v2a33A8Z-lkp@intel.com>
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
[also build test ERROR on linus/master sailus-media-tree/streams v6.18-rc2 next-20251022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biancaa-Ramesh/pcmcia-parport_cs-Refactor-probe-function-and-improve-error-logging/20251022-030324
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20251021190021.173748-1-biancaa2210329%40ssn.edu.in
patch subject: [PATCH] pcmcia/parport_cs: Refactor probe function and improve error logging
config: x86_64-buildonly-randconfig-001-20251022 (https://download.01.org/0day-ci/archive/20251023/202510230450.v2a33A8Z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230450.v2a33A8Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230450.v2a33A8Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/parport/parport_cs.c:137:21: warning: unused variable 'info' [-Wunused-variable]
     137 |     parport_info_t *info = link->priv;
         |                     ^~~~
>> drivers/parport/parport_cs.c:148:11: error: use of undeclared label 'failed'
     148 |             goto failed;
         |                  ^
>> drivers/parport/parport_cs.c:169:5: error: unknown type name 'p'
     169 |     p->modes |= PARPORT_MODE_PCSPP;
         |     ^
>> drivers/parport/parport_cs.c:169:6: error: expected identifier or '('
     169 |     p->modes |= PARPORT_MODE_PCSPP;
         |      ^
   drivers/parport/parport_cs.c:170:5: error: expected identifier or '('
     170 |     if (epp_mode)
         |     ^
>> drivers/parport/parport_cs.c:172:5: error: unknown type name 'info'
     172 |     info->ndev = 1;
         |     ^
   drivers/parport/parport_cs.c:172:9: error: expected identifier or '('
     172 |     info->ndev = 1;
         |         ^
   drivers/parport/parport_cs.c:173:5: error: unknown type name 'info'
     173 |     info->port = p;
         |     ^
   drivers/parport/parport_cs.c:173:9: error: expected identifier or '('
     173 |     info->port = p;
         |         ^
   drivers/parport/parport_cs.c:175:5: error: expected identifier or '('
     175 |     return 0;
         |     ^
>> drivers/parport/parport_cs.c:177:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     177 | failed:
         | ^
         | int
>> drivers/parport/parport_cs.c:177:7: error: expected ';' after top level declarator
     177 | failed:
         |       ^
         |       ;
   drivers/parport/parport_cs.c:178:2: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     178 |         parport_cs_release(link);
         |         ^
         |         int
>> drivers/parport/parport_cs.c:178:21: error: a parameter list without types is only allowed in a function definition
     178 |         parport_cs_release(link);
         |                            ^
>> drivers/parport/parport_cs.c:179:8: error: unknown type name 'link'
     179 |         kfree(link->priv);
         |               ^
>> drivers/parport/parport_cs.c:179:12: error: expected ')'
     179 |         kfree(link->priv);
         |                   ^
   drivers/parport/parport_cs.c:179:7: note: to match this '('
     179 |         kfree(link->priv);
         |              ^
   drivers/parport/parport_cs.c:179:2: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     179 |         kfree(link->priv);
         |         ^
         |         int
   drivers/parport/parport_cs.c:180:5: error: unknown type name 'link'
     180 |     link->priv = NULL;
         |     ^
   drivers/parport/parport_cs.c:180:9: error: expected identifier or '('
     180 |     link->priv = NULL;
         |         ^
   drivers/parport/parport_cs.c:181:2: error: expected identifier or '('
     181 |         return -ENODEV;
         |         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +/failed +148 drivers/parport/parport_cs.c

84e2d34004dcd0 Dominik Brodowski 2008-07-29  134  
15b99ac1729503 Dominik Brodowski 2006-03-31  135  static int parport_config(struct pcmcia_device *link)
^1da177e4c3f41 Linus Torvalds    2005-04-16  136  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  137      parport_info_t *info = link->priv;
^1da177e4c3f41 Linus Torvalds    2005-04-16  138      struct parport *p;
9b44de2015ff4a Dominik Brodowski 2009-10-24  139      int ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16  140  
9b44de2015ff4a Dominik Brodowski 2009-10-24  141      dev_dbg(&link->dev, "parport_config\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  142  
00990e7ce0b0e5 Dominik Brodowski 2010-07-30  143      if (epp_mode)
00990e7ce0b0e5 Dominik Brodowski 2010-07-30  144  	    link->config_index |= FORCE_EPP_MODE;
00990e7ce0b0e5 Dominik Brodowski 2010-07-30  145  
9b44de2015ff4a Dominik Brodowski 2009-10-24  146      ret = pcmcia_loop_config(link, parport_config_check, NULL);
9b44de2015ff4a Dominik Brodowski 2009-10-24  147      if (ret)
84e2d34004dcd0 Dominik Brodowski 2008-07-29 @148  	    goto failed;
^1da177e4c3f41 Linus Torvalds    2005-04-16  149  
eb14120f743d29 Dominik Brodowski 2010-03-07  150      if (!link->irq)
9b44de2015ff4a Dominik Brodowski 2009-10-24  151  	    goto failed;
1ac71e5a35eebe Dominik Brodowski 2010-07-29  152      ret = pcmcia_enable_device(link);
9b44de2015ff4a Dominik Brodowski 2009-10-24  153      if (ret)
9b44de2015ff4a Dominik Brodowski 2009-10-24  154  	    goto failed;
^1da177e4c3f41 Linus Torvalds    2005-04-16  155  
9a017a910346af Dominik Brodowski 2010-07-24  156      p = parport_pc_probe_port(link->resource[0]->start,
9a017a910346af Dominik Brodowski 2010-07-24  157  			      link->resource[1]->start,
eb14120f743d29 Dominik Brodowski 2010-03-07  158  			      link->irq, PARPORT_DMA_NONE,
51dcdfec6a274a Alan Cox          2009-04-07  159  			      &link->dev, IRQF_SHARED);
fac3d7d7b11c82 Biancaa Ramesh    2025-10-22  160      if (!p) {
fac3d7d7b11c82 Biancaa Ramesh    2025-10-22  161          dev_err(&link->dev,
fac3d7d7b11c82 Biancaa Ramesh    2025-10-22  162              "parport_pc_probe_port() failed at 0x%03x, irq %u\n",
decf26f6ec25da Joe Perches       2020-04-03  163              (unsigned int)link->resource[0]->start, link->irq);
^1da177e4c3f41 Linus Torvalds    2005-04-16  164          goto failed;
^1da177e4c3f41 Linus Torvalds    2005-04-16  165      }   
^1da177e4c3f41 Linus Torvalds    2005-04-16  166  
fac3d7d7b11c82 Biancaa Ramesh    2025-10-22  167      }
fac3d7d7b11c82 Biancaa Ramesh    2025-10-22  168  
^1da177e4c3f41 Linus Torvalds    2005-04-16 @169      p->modes |= PARPORT_MODE_PCSPP;
^1da177e4c3f41 Linus Torvalds    2005-04-16  170      if (epp_mode)
^1da177e4c3f41 Linus Torvalds    2005-04-16  171  	p->modes |= PARPORT_MODE_TRISTATE | PARPORT_MODE_EPP;
^1da177e4c3f41 Linus Torvalds    2005-04-16 @172      info->ndev = 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  173      info->port = p;
^1da177e4c3f41 Linus Torvalds    2005-04-16  174  
15b99ac1729503 Dominik Brodowski 2006-03-31  175      return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  176  
^1da177e4c3f41 Linus Torvalds    2005-04-16 @177  failed:
^1da177e4c3f41 Linus Torvalds    2005-04-16 @178  	parport_cs_release(link);
21c75ad65f8e52 YueHaibing        2019-03-21 @179  	kfree(link->priv);
fac3d7d7b11c82 Biancaa Ramesh    2025-10-22  180      link->priv = NULL;
15b99ac1729503 Dominik Brodowski 2006-03-31  181  	return -ENODEV;
^1da177e4c3f41 Linus Torvalds    2005-04-16  182  } /* parport_config */
^1da177e4c3f41 Linus Torvalds    2005-04-16  183  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

