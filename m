Return-Path: <linux-media+bounces-27970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D727A59A4A
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 16:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEE243A66B8
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 15:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B202226CFA;
	Mon, 10 Mar 2025 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RxrP5QSH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37E11DFF0
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 15:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741621619; cv=none; b=BzF1ZSoPKP9DfmIWqBma/m1S6GbiO7ePDPzMydIsEt2+iuFQ3pDc7X1OlyxIRRLkeJDLkwPfxuHyIkB/GCAH/4QNCdcsAzg+uj8A4KatcVHt1rHzPV3vWrTQYm69LY8jUDw3e0Qo7rSKa4+fBqJ3ClBKVQYNm8o2kZTYSnLWOh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741621619; c=relaxed/simple;
	bh=FBgwY36HDCOGShWtd98nUyKOeQn3V3CPBD96iQp7bC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rdXxENJaVT0iHTNAp76IKHs2ZphcwDDxY8UwqxslOH9vE02HXk6obVuTbBBuJyjp4elmX12+MZYYOCuqcmXeUt9PlJdtEd/DK6XnqpKg0D6TSweUrw4n55H1ft4O2SsPIA4PgS0a6GttzK91RxTMHI5Cz/ZP3wGQeY472Ky5/Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RxrP5QSH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741621618; x=1773157618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FBgwY36HDCOGShWtd98nUyKOeQn3V3CPBD96iQp7bC0=;
  b=RxrP5QSHcdboIjQb/si7giAu9o5nZbp8h9YGuOcKgU9vYA8OOiIAw96e
   XUaKWenzcYKRuva69EYykOLJfMkne8QMEYt3XKxIogjrh9XBC0B0qFLW7
   pr0y72e7ALVWmk2byAFH0bYYl5bEBo7Yf3DK64oEaFFCj6U38Umyb8cOt
   x9/90buQtvpLWZG6xDrYWenuwi/YK6bLlTcMf7byJ67q5VDwSZ/ESn64F
   mb1vL6z1ETREqI0cZaHM29KKdv6v6vrmklXITical7RzpkEK85xjA33tf
   v2PHHeSOrfn/Rm8mrl+qFJX2tBuQp4F1PrHgL44g6V/drUq1foJc7nvs7
   Q==;
X-CSE-ConnectionGUID: U1PUJVN8ROGDyc6U4UpdBQ==
X-CSE-MsgGUID: N/11VVF1TMaNR85r2VH0Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42503677"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="42503677"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 08:46:57 -0700
X-CSE-ConnectionGUID: 970ODgy7RY6vUYtdemQNiA==
X-CSE-MsgGUID: 1ROdfxaZTbGfPIzbUQPmGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="119866069"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 10 Mar 2025 08:46:56 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trfLC-0004PI-09;
	Mon, 10 Mar 2025 15:46:54 +0000
Date: Mon, 10 Mar 2025 23:46:28 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:devel 23/23]
 drivers/media/platform/st/stm32/stm32-dcmi.c:1685:28: error: implicit
 declaration of function 'devm_kmemdup_array'; did you mean
 'devm_kmalloc_array'?
Message-ID: <202503102326.NA0KFO8t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git devel
head:   07e07f2cd3ebb7e8b62ccb8f22a16032b599c9e2
commit: 07e07f2cd3ebb7e8b62ccb8f22a16032b599c9e2 [23/23] media: stm32-dcmi: use devm_kmemdup_array()
config: sparc-randconfig-001-20250310 (https://download.01.org/0day-ci/archive/20250310/202503102326.NA0KFO8t-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503102326.NA0KFO8t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503102326.NA0KFO8t-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/st/stm32/stm32-dcmi.c: In function 'dcmi_formats_init':
>> drivers/media/platform/st/stm32/stm32-dcmi.c:1685:28: error: implicit declaration of function 'devm_kmemdup_array'; did you mean 'devm_kmalloc_array'? [-Wimplicit-function-declaration]
    1685 |         dcmi->sd_formats = devm_kmemdup_array(dcmi->dev, sd_fmts, num_fmts,
         |                            ^~~~~~~~~~~~~~~~~~
         |                            devm_kmalloc_array
>> drivers/media/platform/st/stm32/stm32-dcmi.c:1685:26: error: assignment to 'const struct dcmi_format **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1685 |         dcmi->sd_formats = devm_kmemdup_array(dcmi->dev, sd_fmts, num_fmts,
         |                          ^


vim +1685 drivers/media/platform/st/stm32/stm32-dcmi.c

  1639	
  1640	static int dcmi_formats_init(struct stm32_dcmi *dcmi)
  1641	{
  1642		const struct dcmi_format *sd_fmts[ARRAY_SIZE(dcmi_formats)];
  1643		unsigned int num_fmts = 0, i, j;
  1644		struct v4l2_subdev *subdev = dcmi->source;
  1645		struct v4l2_subdev_mbus_code_enum mbus_code = {
  1646			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
  1647		};
  1648	
  1649		while (!v4l2_subdev_call(subdev, pad, enum_mbus_code,
  1650					 NULL, &mbus_code)) {
  1651			for (i = 0; i < ARRAY_SIZE(dcmi_formats); i++) {
  1652				if (dcmi_formats[i].mbus_code != mbus_code.code)
  1653					continue;
  1654	
  1655				/* Exclude JPEG if BT656 bus is selected */
  1656				if (dcmi_formats[i].fourcc == V4L2_PIX_FMT_JPEG &&
  1657				    dcmi->bus_type == V4L2_MBUS_BT656)
  1658					continue;
  1659	
  1660				/* Code supported, have we got this fourcc yet? */
  1661				for (j = 0; j < num_fmts; j++)
  1662					if (sd_fmts[j]->fourcc ==
  1663							dcmi_formats[i].fourcc) {
  1664						/* Already available */
  1665						dev_dbg(dcmi->dev, "Skipping fourcc/code: %4.4s/0x%x\n",
  1666							(char *)&sd_fmts[j]->fourcc,
  1667							mbus_code.code);
  1668						break;
  1669					}
  1670				if (j == num_fmts) {
  1671					/* New */
  1672					sd_fmts[num_fmts++] = dcmi_formats + i;
  1673					dev_dbg(dcmi->dev, "Supported fourcc/code: %4.4s/0x%x\n",
  1674						(char *)&sd_fmts[num_fmts - 1]->fourcc,
  1675						sd_fmts[num_fmts - 1]->mbus_code);
  1676				}
  1677			}
  1678			mbus_code.index++;
  1679		}
  1680	
  1681		if (!num_fmts)
  1682			return -ENXIO;
  1683	
  1684		dcmi->num_of_sd_formats = num_fmts;
> 1685		dcmi->sd_formats = devm_kmemdup_array(dcmi->dev, sd_fmts, num_fmts,
  1686						      sizeof(sd_fmts[0]), GFP_KERNEL);
  1687		if (!dcmi->sd_formats) {
  1688			dev_err(dcmi->dev, "Could not allocate memory\n");
  1689			return -ENOMEM;
  1690		}
  1691	
  1692		dcmi->sd_format = dcmi->sd_formats[0];
  1693		return 0;
  1694	}
  1695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

