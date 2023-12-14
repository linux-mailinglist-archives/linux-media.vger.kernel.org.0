Return-Path: <linux-media+bounces-2427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E87028138DB
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 18:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7730DB21841
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 17:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E3A675C7;
	Thu, 14 Dec 2023 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ema1G668"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439C110A
	for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 09:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702575637; x=1734111637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IJ9o3HVM9BJlFZq075uiX/pLUV7kYnenwagLvGRiJMw=;
  b=Ema1G668DftJIXvQvW7jTk/OOM0EahlUKV4kD+TqEG8ucrb81A647ceU
   FhOhVkIT7rvNCkpHtmztE/rHRDZtSxKtChIa5vV2Mdart3b3g9GuBOj9e
   3pMgPGsOI1DCq9TS1Z3FyXnPrEPj4xem6L9YbjE+FgAO6oVigJCNZHpuf
   MpxUxwLnDkkD4G/2abviuIxVXXtrVjXg+HVykBCVpnklSB2qZyBglqQrh
   FaBefpLJdpCMWDdwf4dbsxiTSA5IsMw7dzPjpilVuDwl6igVcx1CA8A9s
   AKePsXFwxuQvKQ14exsfGFM/s+aSrCEgnbRj5qIfM1UMqlPuCaheW7Bu8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="374664022"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="374664022"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 09:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="777967133"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="777967133"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Dec 2023 09:40:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDphH-000MQx-2e;
	Thu, 14 Dec 2023 17:40:31 +0000
Date: Fri, 15 Dec 2023 01:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yunke Cao <yunkec@google.com>, Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	Yunke Cao <yunkec@google.com>
Subject: Re: [PATCH v14 06/11] v4l2-ctrls: add support for
 V4L2_CTRL_WHICH_MIN/MAX_VAL
Message-ID: <202312150147.Kl7pyrrG-lkp@intel.com>
References: <20231201071907.3080126-7-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201071907.3080126-7-yunkec@google.com>

Hi Yunke,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.7-rc5 next-20231214]
[cannot apply to media-tree/master linuxtv-media-stage/master sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunke-Cao/media-v4l2_ctrl-Add-V4L2_CTRL_TYPE_RECT/20231201-152501
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231201071907.3080126-7-yunkec%40google.com
patch subject: [PATCH v14 06/11] v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
config: alpha-randconfig-r122-20231202 (https://download.01.org/0day-ci/archive/20231215/202312150147.Kl7pyrrG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231215/202312150147.Kl7pyrrG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150147.Kl7pyrrG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:309:6: sparse: sparse: symbol 'v4l2_ctrl_type_op_minimum' was not declared. Should it be static?
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:315:6: sparse: sparse: symbol 'v4l2_ctrl_type_op_maximum' was not declared. Should it be static?
   drivers/media/v4l2-core/v4l2-ctrls-core.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/v4l2_ctrl_type_op_minimum +309 drivers/media/v4l2-core/v4l2-ctrls-core.c

   308	
 > 309	void v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 from_idx,
   310				       union v4l2_ctrl_ptr ptr)
   311	{
   312		__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MIN_VAL, ptr);
   313	}
   314	
 > 315	void v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 from_idx,
   316				       union v4l2_ctrl_ptr ptr)
   317	{
   318		__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MAX_VAL, ptr);
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

