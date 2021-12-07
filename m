Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6860246B34D
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 07:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhLGHA5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 02:00:57 -0500
Received: from mga09.intel.com ([134.134.136.24]:10333 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhLGHA5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Dec 2021 02:00:57 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237321593"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="237321593"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2021 22:56:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; 
   d="scan'208";a="611563789"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 06 Dec 2021 22:56:49 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1muUPA-000MHM-FC; Tue, 07 Dec 2021 06:56:48 +0000
Date:   Tue, 7 Dec 2021 14:56:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v7 14/14] media: ipu3-cio2: Add support for instantiating
 i2c-clients for VCMs
Message-ID: <202112071424.x9BP4OXf-lkp@intel.com>
References: <20211203102857.44539-15-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203102857.44539-15-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on wsa/i2c/for-next broonie-regulator/for-next clk/clk-next linus/master v5.16-rc4 next-20211206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hans-de-Goede/Add-support-for-X86-ACPI-camera-sensor-PMIC-setup-with-clk-and-regulator-platform-data/20211203-183202
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-a003-20211207 (https://download.01.org/0day-ci/archive/20211207/202112071424.x9BP4OXf-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/82c6f06c3746e7a9b2f95bf534d633b66ae89b97
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hans-de-Goede/Add-support-for-X86-ACPI-camera-sensor-PMIC-setup-with-clk-and-regulator-platform-data/20211203-183202
        git checkout 82c6f06c3746e7a9b2f95bf534d633b66ae89b97
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/media/pci/intel/ipu3/cio2-bridge.c: In function 'cio2_bridge_unregister_sensors':
>> drivers/media/pci/intel/ipu3/cio2-bridge.c:254:3: error: implicit declaration of function 'i2c_unregister_device'; did you mean 'spi_unregister_device'? [-Werror=implicit-function-declaration]
     254 |   i2c_unregister_device(sensor->vcm_i2c_client);
         |   ^~~~~~~~~~~~~~~~~~~~~
         |   spi_unregister_device
   cc1: some warnings being treated as errors


vim +254 drivers/media/pci/intel/ipu3/cio2-bridge.c

   243	
   244	static void cio2_bridge_unregister_sensors(struct cio2_bridge *bridge)
   245	{
   246		struct cio2_sensor *sensor;
   247		unsigned int i;
   248	
   249		for (i = 0; i < bridge->n_sensors; i++) {
   250			sensor = &bridge->sensors[i];
   251			software_node_unregister_nodes(sensor->swnodes);
   252			ACPI_FREE(sensor->pld);
   253			acpi_dev_put(sensor->adev);
 > 254			i2c_unregister_device(sensor->vcm_i2c_client);
   255		}
   256	}
   257	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
