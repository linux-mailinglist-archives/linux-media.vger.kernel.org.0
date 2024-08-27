Return-Path: <linux-media+bounces-16954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9931961A5A
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 01:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3ACB7B210BE
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 23:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0A91D4613;
	Tue, 27 Aug 2024 23:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGAbf8MZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6204512C475;
	Tue, 27 Aug 2024 23:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724800466; cv=none; b=fG2xHcyZyIUUhnEoJBzt3HHtHZ2apBmKngkAMHLx/x/tWoq6uyt7NGbbKGwbJlC1SVKAquW++A/oX2buVooFbQ+w/dNJG4NtWBx9F/oxCKjWjI3P/EA8dAC7Gp332xJdlC7G6gXL+SuTFO4wJt3b/HLkc7QgJffH3nO73z082fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724800466; c=relaxed/simple;
	bh=5tz1G93NRxsPIGpvobyXVbvfwx5sxEmuE1mv+e1eidg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mK0TEMwdrACocak/zjiD1DglkcgnEi9cyatAyrU3Bzuh/9h50SySpJ4S5V2XOWOwi4RQx4fc/zHhzPoM86dtZY7WleG2zahvgfZ/24vdZ4T8+kooGlKy+JWPA5+gC0WmhMTcg4mYNSpI99O9doEMP7YssUVcQiPZsWzAer+Iu7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGAbf8MZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724800464; x=1756336464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5tz1G93NRxsPIGpvobyXVbvfwx5sxEmuE1mv+e1eidg=;
  b=EGAbf8MZZF6pfqJwX8/+s+E3955D8aCfBjRoMSXg4PvhWlKf71D+hO3f
   WuEEWosSquNHnYAadMJezRmrEL5fbwmZqQhMDU1NTPUIxQzSeDC10ksPI
   Ye+kBu+kwyTjgtdH6GyFvGdNl62x62LexkavA44jpxWiN4WBzJqGKV0VW
   Uwu5YLdz1p2BWsEq5qd2nmGFEOB0S2ImyYQxFe16NISDHrUGATHWl1Qpw
   G0ETv/SR95SE3Fd5Wsbf4uLcYkaMjzB4cSskRxWSWivFUksDHCvjRPOcw
   WojENY7sW16u7fNErO04Z1OZulWS4U1CmWMDx6tNK+KmQB6zevUiayBjv
   A==;
X-CSE-ConnectionGUID: zxmPHjE3RaOBnM/PT9dutg==
X-CSE-MsgGUID: luhYohPCTY2+ea3siX60Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="48690608"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="48690608"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 16:14:23 -0700
X-CSE-ConnectionGUID: 33OTtixcRg67rLk17NupHQ==
X-CSE-MsgGUID: m8+QGGjbSweQHKL8zAVgQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="63541486"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Aug 2024 16:14:21 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj5OE-000KBA-19;
	Tue, 27 Aug 2024 23:14:18 +0000
Date: Wed, 28 Aug 2024 07:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Re: [PATCH v3 07/29] media: iris: implement video firmware
 load/unload
Message-ID: <202408280657.WziT1uXM-lkp@intel.com>
References: <20240827-iris_v3-v3-7-c5fdbbe65e70@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827-iris_v3-v3-7-c5fdbbe65e70@quicinc.com>

Hi Dikshita,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 31aaa7d95e09892c81df0d7c49ae85640fa4e202]

url:    https://github.com/intel-lab-lkp/linux/commits/Dikshita-Agarwal-via-B4-Relay/dt-bindings-media-Add-sm8550-dt-schema/20240827-181059
base:   31aaa7d95e09892c81df0d7c49ae85640fa4e202
patch link:    https://lore.kernel.org/r/20240827-iris_v3-v3-7-c5fdbbe65e70%40quicinc.com
patch subject: [PATCH v3 07/29] media: iris: implement video firmware load/unload
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240828/202408280657.WziT1uXM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280657.WziT1uXM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280657.WziT1uXM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/of_reserved_mem.h:5,
                    from drivers/media/platform/qcom/iris/iris_firmware.c:9:
   drivers/media/platform/qcom/iris/iris_firmware.c: In function 'iris_load_fw_to_memory':
>> drivers/media/platform/qcom/iris/iris_firmware.c:80:36: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'ssize_t' {aka 'int'} [-Wformat=]
      80 |                 dev_err(core->dev, "out of bound fw image fw size: %ld, res_size: %lu\n",
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/qcom/iris/iris_firmware.c:80:17: note: in expansion of macro 'dev_err'
      80 |                 dev_err(core->dev, "out of bound fw image fw size: %ld, res_size: %lu\n",
         |                 ^~~~~~~
   drivers/media/platform/qcom/iris/iris_firmware.c:80:70: note: format string is defined here
      80 |                 dev_err(core->dev, "out of bound fw image fw size: %ld, res_size: %lu\n",
         |                                                                    ~~^
         |                                                                      |
         |                                                                      long int
         |                                                                    %d
>> drivers/media/platform/qcom/iris/iris_firmware.c:80:36: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      80 |                 dev_err(core->dev, "out of bound fw image fw size: %ld, res_size: %lu\n",
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/qcom/iris/iris_firmware.c:80:17: note: in expansion of macro 'dev_err'
      80 |                 dev_err(core->dev, "out of bound fw image fw size: %ld, res_size: %lu\n",
         |                 ^~~~~~~
   drivers/media/platform/qcom/iris/iris_firmware.c:80:85: note: format string is defined here
      80 |                 dev_err(core->dev, "out of bound fw image fw size: %ld, res_size: %lu\n",
         |                                                                                   ~~^
         |                                                                                     |
         |                                                                                     long unsigned int
         |                                                                                   %u


vim +80 drivers/media/platform/qcom/iris/iris_firmware.c

   > 9	#include <linux/of_reserved_mem.h>
    10	#include <linux/soc/qcom/mdt_loader.h>
    11	
    12	#include "iris_core.h"
    13	#include "iris_firmware.h"
    14	
    15	#define MAX_FIRMWARE_NAME_SIZE	128
    16	
    17	static int iris_protect_cp_mem(struct iris_core *core)
    18	{
    19		struct tz_cp_config *cp_config;
    20		int ret;
    21	
    22		cp_config = core->iris_platform_data->tz_cp_config_data;
    23	
    24		ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
    25						     cp_config->cp_size,
    26						     cp_config->cp_nonpixel_start,
    27						     cp_config->cp_nonpixel_size);
    28		if (ret)
    29			dev_err(core->dev, "failed to protect memory(%d)\n", ret);
    30	
    31		return ret;
    32	}
    33	
    34	static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
    35	{
    36		const struct firmware *firmware = NULL;
    37		struct device_node *node = NULL;
    38		struct reserved_mem *rmem;
    39		phys_addr_t mem_phys = 0;
    40		void *mem_virt = NULL;
    41		size_t res_size = 0;
    42		ssize_t fw_size = 0;
    43		struct device *dev;
    44		int pas_id = 0;
    45		int ret;
    46	
    47		if (!fw_name || !(*fw_name) || !core)
    48			return -EINVAL;
    49	
    50		dev = core->dev;
    51	
    52		if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
    53			return -EINVAL;
    54	
    55		pas_id = core->iris_platform_data->pas_id;
    56	
    57		node = of_parse_phandle(dev->of_node, "memory-region", 0);
    58		if (!node)
    59			return -EINVAL;
    60	
    61		rmem = of_reserved_mem_lookup(node);
    62		if (!rmem) {
    63			ret = -EINVAL;
    64			goto err_put_node;
    65		}
    66	
    67		mem_phys = rmem->base;
    68		res_size = rmem->size;
    69	
    70		ret = request_firmware(&firmware, fw_name, dev);
    71		if (ret) {
    72			dev_err(core->dev, "failed to request fw \"%s\", error %d\n",
    73				fw_name, ret);
    74			goto err_put_node;
    75		}
    76	
    77		fw_size = qcom_mdt_get_size(firmware);
    78		if (fw_size < 0 || res_size < (size_t)fw_size) {
    79			ret = -EINVAL;
  > 80			dev_err(core->dev, "out of bound fw image fw size: %ld, res_size: %lu\n",
    81				fw_size, res_size);
    82			goto err_release_fw;
    83		}
    84	
    85		mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
    86		if (!mem_virt) {
    87			dev_err(core->dev, "failed to remap fw memory phys %pa[p]\n",
    88				&mem_phys);
    89			goto err_release_fw;
    90		}
    91	
    92		ret = qcom_mdt_load(dev, firmware, fw_name,
    93				    pas_id, mem_virt, mem_phys, res_size, NULL);
    94		if (ret) {
    95			dev_err(core->dev, "error %d loading fw \"%s\"\n",
    96				ret, fw_name);
    97			goto err_mem_unmap;
    98		}
    99		ret = qcom_scm_pas_auth_and_reset(pas_id);
   100		if (ret) {
   101			dev_err(core->dev, "error %d authenticating fw \"%s\"\n",
   102				ret, fw_name);
   103			goto err_mem_unmap;
   104		}
   105	
   106		return ret;
   107	
   108	err_mem_unmap:
   109		memunmap(mem_virt);
   110	err_release_fw:
   111		release_firmware(firmware);
   112	err_put_node:
   113		of_node_put(node);
   114		return ret;
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

