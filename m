Return-Path: <linux-media+bounces-49580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85981CDEFD4
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 21:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E047530065BE
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 20:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4462FB093;
	Fri, 26 Dec 2025 20:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jThOXULy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251EF2F6918;
	Fri, 26 Dec 2025 20:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766781693; cv=none; b=fuBJsV2FS0uLippSvhPeHzrr4edGJsDNnbyVHhaEbeMqkQQHjArAotPptweVy7ycb2R0Vdc9ABo95HP2cgwSbR10xftDQpUl223UgSu6vm3XkGQep7Qqu4IWh0NXwKEQxcQ02JpPqaMFJ62fC9Zr4yKA1ILMC53D66dLEkAtjuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766781693; c=relaxed/simple;
	bh=PyFxoXyQpqjaFoS+Oep2NkkcIARWnKpl4IWfANJTiVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIZ8xTxMGHdUEJgvhYRnnAoL71mN/7w24wqt5qoGtXY9wHtnb9tVPXF1VCLoK2ypnomtKI2b1utQ8+zo4q9S6XH0fPLj0WYsdqqlBfNNoJpCG/zfTBDE+ei0ot33FuRVmTkV0nugzWNokneXmnPEHwwXhJ0+8t/JFhUgv3YR598=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jThOXULy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766781691; x=1798317691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PyFxoXyQpqjaFoS+Oep2NkkcIARWnKpl4IWfANJTiVU=;
  b=jThOXULy4fNb/mFfwTC/NDrrjvYKpIEfYUsYMDmaJ5ptwO/Uj9Mb3kQO
   sXpanaQ8P8FSp34rMWJifPtb1QQM6TE9HEskGusBh4ntyEUDRRfVkyojp
   FEbeo1B1QlVulFioU3Pa7wzImhwV07SuKQXNd2w0EkJfA3cWNJ26kiG2l
   X8AfFmN8t9IPer/MhxnZjlRqi5QK+O0ejFcLrgn1B4K3Th/uAc+TFchDi
   5ApN8d+quwTorFYLCyuOTmEDGxrTiNzw4El/YG41mMryMwPMvLI42WyhZ
   MbiGyGBNh2RX2TsvcaJFYPg54MUx8fBTXSWvkEMLKxLYcA2TTjqKWPMWu
   Q==;
X-CSE-ConnectionGUID: hXO3z4vWQrONacpPTttlxw==
X-CSE-MsgGUID: td5AoPM9T2aYpY0XAIuqaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68458814"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68458814"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 12:41:31 -0800
X-CSE-ConnectionGUID: XYSpYpMjS8W4LFkqruQfjQ==
X-CSE-MsgGUID: VZOYvB9xSwWguOa+bU8EcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="223928692"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 26 Dec 2025 12:41:28 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZEcn-000000005LN-0zFH;
	Fri, 26 Dec 2025 20:41:25 +0000
Date: Sat, 27 Dec 2025 04:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>, sakari.ailus@linux.intel.com,
	dave.stevenson@raspberrypi.com, jacopo@jmondi.org,
	mchehab@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org,
	johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
	jai.luthra@ideasonboard.com
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: ov5647: Convert to CCI register access
 helpers
Message-ID: <202512270443.nNMHyu7p-lkp@intel.com>
References: <20251226031311.2068414-2-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226031311.2068414-2-xiaolei.wang@windriver.com>

Hi Xiaolei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sailus-media-tree/master]
[also build test WARNING on linus/master v6.19-rc2 next-20251219]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaolei-Wang/media-i2c-ov5647-Convert-to-CCI-register-access-helpers/20251226-115543
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20251226031311.2068414-2-xiaolei.wang%40windriver.com
patch subject: [PATCH 1/2] media: i2c: ov5647: Convert to CCI register access helpers
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251227/202512270443.nNMHyu7p-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512270443.nNMHyu7p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512270443.nNMHyu7p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/ov5647.c: In function 'ov5647_sensor_set_register':
>> drivers/media/i2c/ov5647.c:790:13: warning: unused variable 'ret' [-Wunused-variable]
     790 |         int ret;
         |             ^~~


vim +/ret +790 drivers/media/i2c/ov5647.c

   785	
   786	static int ov5647_sensor_set_register(struct v4l2_subdev *sd,
   787					      const struct v4l2_dbg_register *reg)
   788	{
   789		struct ov5647 *sensor = to_sensor(sd);
 > 790		int ret;
   791	
   792		return cci_write(sensor->regmap, reg->reg & 0xff, reg->val & 0xff, NULL);
   793	}
   794	#endif
   795	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

