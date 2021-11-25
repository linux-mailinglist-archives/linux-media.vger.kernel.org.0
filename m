Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43BB545E299
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 22:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233676AbhKYVic (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 16:38:32 -0500
Received: from mga05.intel.com ([192.55.52.43]:55972 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234234AbhKYVgb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 16:36:31 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="321804748"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="321804748"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 13:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="498192040"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Nov 2021 13:31:52 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mqMLP-0006wt-Tm; Thu, 25 Nov 2021 21:31:51 +0000
Date:   Fri, 26 Nov 2021 05:31:21 +0800
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
Subject: Re: [PATCH v6 13/15] media: ipu3-cio2: Defer probing until the PMIC
 is fully setup
Message-ID: <202111260530.KpKC5Rrw-lkp@intel.com>
References: <20211125165412.535063-14-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125165412.535063-14-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on wsa/i2c/for-next broonie-regulator/for-next linus/master v5.16-rc2 next-20211125]
[cannot apply to clk/clk-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hans-de-Goede/Add-support-for-X86-ACPI-camera-sensor-PMIC-setup-with-clk-and-regulator-platform-data/20211126-005917
base:   git://linuxtv.org/media_tree.git master
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20211126/202111260530.KpKC5Rrw-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/e5cd2c79411cf24a2cabc5c7d2a222c1a3557460
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hans-de-Goede/Add-support-for-X86-ACPI-camera-sensor-PMIC-setup-with-clk-and-regulator-platform-data/20211126-005917
        git checkout e5cd2c79411cf24a2cabc5c7d2a222c1a3557460
        # save the config file to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu3/cio2-bridge.c:321:5: warning: no previous prototype for 'cio2_bridge_sensors_are_ready' [-Wmissing-prototypes]
     321 | int cio2_bridge_sensors_are_ready(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cio2_bridge_sensors_are_ready +321 drivers/media/pci/intel/ipu3/cio2-bridge.c

   308	
   309	/*
   310	 * The VCM cannot be probed until the PMIC is completely setup. We cannot rely
   311	 * on -EPROBE_DEFER for this, since the consumer<->supplier relations between
   312	 * the VCM and regulators/clks are not described in ACPI, instead they are
   313	 * passed as board-data to the PMIC drivers. Since -PROBE_DEFER does not work
   314	 * for the clks/regulators the VCM i2c-clients must not be instantiated until
   315	 * the PMIC is fully setup.
   316	 *
   317	 * The sensor/VCM ACPI device has an ACPI _DEP on the PMIC, check this using the
   318	 * acpi_dev_ready_for_enumeration() helper, like the i2c-core-acpi code does
   319	 * for the sensors.
   320	 */
 > 321	int cio2_bridge_sensors_are_ready(void)
   322	{
   323		struct acpi_device *adev;
   324		bool ready = true;
   325		unsigned int i;
   326	
   327		for (i = 0; i < ARRAY_SIZE(cio2_supported_sensors); i++) {
   328			const struct cio2_sensor_config *cfg =
   329				&cio2_supported_sensors[i];
   330	
   331			for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
   332				if (!adev->status.enabled)
   333					continue;
   334	
   335				if (!acpi_dev_ready_for_enumeration(adev))
   336					ready = false;
   337			}
   338		}
   339	
   340		return ready;
   341	}
   342	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
