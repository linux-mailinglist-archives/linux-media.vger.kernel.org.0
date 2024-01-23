Return-Path: <linux-media+bounces-4107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB84839831
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 19:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44660B254ED
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 18:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D0482D7A;
	Tue, 23 Jan 2024 18:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMkqonBJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956DF85C76
	for <linux-media@vger.kernel.org>; Tue, 23 Jan 2024 18:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706035597; cv=none; b=c5cNsWbq4RQObwx0vY6bBGrKKWper+mYOPrdMLNbNBF4Th6Lycq8J3BVxlx1lBsTo0LYSwrqrBAo6ZVS0sYPy34sY+JVrj9u8J3umxIZHc3SV6Rfp6P0P6g4ZMQIJnRjbmYMYoLcdR7WR4J6JEZwe9kzLddqkvtFER1MLrEeNfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706035597; c=relaxed/simple;
	bh=n28Ln+/x2ea0OMkeW4AV4fhxF0cv6+x4Q8B/idBEcRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZxoDnAHGaB7M5nyIR8UT2dS0Yoyc4miQvvfmfv/528S+40+ELR1HA2/Nc6CGZOEZSUiJAFXsZ0Gbg33HkP8WFED3asPlKF5uimR74CfLtLlzRbAoaukEPjc+jHLchwX+Mneg7nsAm0ul5VEKTUSJTlHcZcS8KuGfdxw9r+ikLoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMkqonBJ; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706035594; x=1737571594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n28Ln+/x2ea0OMkeW4AV4fhxF0cv6+x4Q8B/idBEcRY=;
  b=TMkqonBJWUKG/iO1EeqfxrN2MijGCSOSk0wYmVm7fhWUPexq2w76FyVH
   JtVD8P/h3T6iPALO2Am6Zlqu50FwHwplVe/sIEXmwU9pU4jSfLFf3qv9L
   pjoT9bBDlW8HdzwRI2SlH/xV40QbgjV8DW99LaPCejrfu9C9fKrlloobc
   hfqu1ZzxxVASiDI89J7EVtpRMqVeHKqvjS+VHTPpCbn0z4KWV7PRZ4FJ4
   WJ0OxENdJf6V4iS9u4Dc4AlTtbwHvHIRyloVO70Nk3FfjrdMROezt96zf
   hh5tScNdcNAQmKNm7SRTSexeREdJmEIQWGrXoKCspsTRQhLWDne144kjH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401274170"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="401274170"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:46:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="905339034"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="905339034"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2024 10:46:32 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSLn4-0007bv-1T;
	Tue, 23 Jan 2024 18:46:30 +0000
Date: Wed, 24 Jan 2024 02:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref 38/39]
 drivers/media/pci/intel/ipu3/ipu3-cio2.c:1686:13: warning:
 'cio2_media_release' defined but not used
Message-ID: <202401240244.gFeVPHsb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git media-ref
head:   a31f71a73822ffd82d3595f199a57894097bc98e
commit: e41a37177548289f04defb2d473b62392bae0d42 [38/39] test
config: i386-buildonly-randconfig-004-20240123 (https://download.01.org/0day-ci/archive/20240124/202401240244.gFeVPHsb-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401240244.gFeVPHsb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401240244.gFeVPHsb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu3/ipu3-cio2.c:1686:13: warning: 'cio2_media_release' defined but not used [-Wunused-function]
    1686 | static void cio2_media_release(struct media_device *mdev)
         |             ^~~~~~~~~~~~~~~~~~


vim +/cio2_media_release +1686 drivers/media/pci/intel/ipu3/ipu3-cio2.c

803abec64ef9d3 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Daniel Scally 2021-01-07  1685  
a42031c1c78258 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20 @1686  static void cio2_media_release(struct media_device *mdev)
a42031c1c78258 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1687  {
a42031c1c78258 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1688  	struct cio2_device *cio2 =
a42031c1c78258 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1689  		container_of(mdev, struct cio2_device, media_dev);
a42031c1c78258 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1690  
ccf99d37ece499 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2023-10-05  1691  	printk("cio2 media release\n");
ccf99d37ece499 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2023-10-05  1692  
a42031c1c78258 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1693  	v4l2_async_nf_cleanup(&cio2->notifier);
a42031c1c78258 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1694  	cio2_queues_exit(cio2);
a42031c1c78258 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1695  	cio2_fbpt_exit_dummy(cio2);
a42031c1c78258 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1696  	mutex_destroy(&cio2->lock);
a42031c1c78258 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1697  
a42031c1c78258 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1698  	kfree(cio2);
a42031c1c78258 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1699  }
a42031c1c78258 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus  2022-12-20  1700  

:::::: The code at line 1686 was first introduced by commit
:::::: a42031c1c782585594774333337fd9dd73a6014b media: ipu3-cio2: Release the cio2 device context by media device callback

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

