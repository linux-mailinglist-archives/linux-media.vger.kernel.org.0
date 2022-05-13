Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 517D2525AE5
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 06:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376995AbiEMEkr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 00:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352463AbiEMEkq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 00:40:46 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CDA2DF1
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 21:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652416843; x=1683952843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wafAMVd9V6pZ0GkQwZ6/wrpZZJxXOng6XrsIv0iCdl0=;
  b=MZindAi+MKOmZXXAfLV10sHF8K2FzoYC0xqR3ztOQcUOtNuLBKI6502b
   jqK8sXjhMsrUcIi4FgKNV9P70YkJLsRbJ9yS7/d5l+Lktav/AijzqtQ24
   n4kgxWO1J9lPcgFQuRILY3khu5WK5pShNMwdIqXMxMN/refWGDT+T+QMG
   CJb4zPjaIw+eOHt0lrqJSAsHjfUBpuNTS46wbTH89EEumxT1C5QnaYajC
   obTGFSW+o9wUMSUkDmoucj3ZldLW9JKOsrdOvcNkL4LhhLVLad4mptz+g
   vmwD2YCBPrlJ5HdaVIlSTAbuRvQ+96USYJdQG1IWUkyhsZyu2ZN98HzN+
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="270149165"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="270149165"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 21:40:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="712249858"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 May 2022 21:40:41 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1npN6W-000LK8-FQ;
        Fri, 13 May 2022 04:40:40 +0000
Date:   Fri, 13 May 2022 12:40:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Oliver Neukum <oneukum@suse.com>, linux-media@vger.kernel.org,
        mchehab@kernel.org, sean@mess.org
Cc:     kbuild-all@lists.01.org, Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] imon_raw: respect DMA coherency
Message-ID: <202205131229.FeABo9N9-lkp@intel.com>
References: <20220512130321.30599-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220512130321.30599-1-oneukum@suse.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Oliver,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc6 next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/imon_raw-respect-DMA-coherency/20220512-210422
base:   git://linuxtv.org/media_tree.git master
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20220513/202205131229.FeABo9N9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/5e1a1b1e9c8288033f5f1f1d70a3d7506114fad3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oliver-Neukum/imon_raw-respect-DMA-coherency/20220512-210422
        git checkout 5e1a1b1e9c8288033f5f1f1d70a3d7506114fad3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sh SHELL=/bin/bash drivers/media/rc/ drivers/platform/mellanox/ net/rxrpc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/media/rc/imon_raw.c:32:20: sparse: sparse: cast to restricted __be64
>> drivers/media/rc/imon_raw.c:32:20: sparse: sparse: cast to restricted __be64
>> drivers/media/rc/imon_raw.c:32:20: sparse: sparse: cast to restricted __be64
>> drivers/media/rc/imon_raw.c:32:20: sparse: sparse: cast to restricted __be64
>> drivers/media/rc/imon_raw.c:32:20: sparse: sparse: cast to restricted __be64
>> drivers/media/rc/imon_raw.c:32:20: sparse: sparse: cast to restricted __be64
>> drivers/media/rc/imon_raw.c:32:20: sparse: sparse: cast to restricted __be64
>> drivers/media/rc/imon_raw.c:32:20: sparse: sparse: cast to restricted __be64
>> drivers/media/rc/imon_raw.c:32:20: sparse: sparse: cast to restricted __be64
>> drivers/media/rc/imon_raw.c:32:20: sparse: sparse: cast to restricted __be64
>> drivers/media/rc/imon_raw.c:32:20: sparse: sparse: non size-preserving pointer to integer cast

vim +32 drivers/media/rc/imon_raw.c

8a4e8f8dfc6994 Sean Young 2018-01-05  20  
8a4e8f8dfc6994 Sean Young 2018-01-05  21  /*
8d023a5787775c Sean Young 2018-10-18  22   * The first 5 bytes of data represent IR pulse or space. Each bit, starting
8d023a5787775c Sean Young 2018-10-18  23   * from highest bit in the first byte, represents 250µs of data. It is 1
8d023a5787775c Sean Young 2018-10-18  24   * for space and 0 for pulse.
8d023a5787775c Sean Young 2018-10-18  25   *
8d023a5787775c Sean Young 2018-10-18  26   * The station sends 10 packets, and the 7th byte will be number 1 to 10, so
8d023a5787775c Sean Young 2018-10-18  27   * when we receive 10 we assume all the data has arrived.
8a4e8f8dfc6994 Sean Young 2018-01-05  28   */
8a4e8f8dfc6994 Sean Young 2018-01-05  29  static void imon_ir_data(struct imon *imon)
8a4e8f8dfc6994 Sean Young 2018-01-05  30  {
183e19f5b9ee18 Sean Young 2018-08-21  31  	struct ir_raw_event rawir = {};
e70d13f7ac061d Sean Young 2019-08-09 @32  	u64 data = be64_to_cpu(imon->ir_buf);
e70d13f7ac061d Sean Young 2019-08-09  33  	u8 packet_no = data & 0xff;
8d023a5787775c Sean Young 2018-10-18  34  	int offset = 40;
8a4e8f8dfc6994 Sean Young 2018-01-05  35  	int bit;
8a4e8f8dfc6994 Sean Young 2018-01-05  36  
e70d13f7ac061d Sean Young 2019-08-09  37  	if (packet_no == 0xff)
e70d13f7ac061d Sean Young 2019-08-09  38  		return;
e70d13f7ac061d Sean Young 2019-08-09  39  
e70d13f7ac061d Sean Young 2019-08-09  40  	dev_dbg(imon->dev, "data: %*ph", 8, &imon->ir_buf);
e70d13f7ac061d Sean Young 2019-08-09  41  
e70d13f7ac061d Sean Young 2019-08-09  42  	/*
e70d13f7ac061d Sean Young 2019-08-09  43  	 * Only the first 5 bytes contain IR data. Right shift so we move
e70d13f7ac061d Sean Young 2019-08-09  44  	 * the IR bits to the lower 40 bits.
e70d13f7ac061d Sean Young 2019-08-09  45  	 */
e70d13f7ac061d Sean Young 2019-08-09  46  	data >>= 24;
8a4e8f8dfc6994 Sean Young 2018-01-05  47  
8d023a5787775c Sean Young 2018-10-18  48  	do {
e70d13f7ac061d Sean Young 2019-08-09  49  		/*
e70d13f7ac061d Sean Young 2019-08-09  50  		 * Find highest set bit which is less or equal to offset
e70d13f7ac061d Sean Young 2019-08-09  51  		 *
e70d13f7ac061d Sean Young 2019-08-09  52  		 * offset is the bit above (base 0) where we start looking.
e70d13f7ac061d Sean Young 2019-08-09  53  		 *
e70d13f7ac061d Sean Young 2019-08-09  54  		 * data & (BIT_ULL(offset) - 1) masks off any unwanted bits,
e70d13f7ac061d Sean Young 2019-08-09  55  		 * so we have just bits less than offset.
e70d13f7ac061d Sean Young 2019-08-09  56  		 *
e70d13f7ac061d Sean Young 2019-08-09  57  		 * fls will tell us the highest bit set plus 1 (or 0 if no
e70d13f7ac061d Sean Young 2019-08-09  58  		 * bits are set).
e70d13f7ac061d Sean Young 2019-08-09  59  		 */
d587cdb2a5f570 Sean Young 2019-10-07  60  		rawir.pulse = !rawir.pulse;
e70d13f7ac061d Sean Young 2019-08-09  61  		bit = fls64(data & (BIT_ULL(offset) - 1));
8d023a5787775c Sean Young 2018-10-18  62  		if (bit < offset) {
d587cdb2a5f570 Sean Young 2019-10-07  63  			dev_dbg(imon->dev, "%s: %d bits",
d587cdb2a5f570 Sean Young 2019-10-07  64  				rawir.pulse ? "pulse" : "space", offset - bit);
8d023a5787775c Sean Young 2018-10-18  65  			rawir.duration = (offset - bit) * BIT_DURATION;
8a4e8f8dfc6994 Sean Young 2018-01-05  66  			ir_raw_event_store_with_filter(imon->rcdev, &rawir);
8a4e8f8dfc6994 Sean Young 2018-01-05  67  
8a4e8f8dfc6994 Sean Young 2018-01-05  68  			offset = bit;
8d023a5787775c Sean Young 2018-10-18  69  		}
8d023a5787775c Sean Young 2018-10-18  70  
d587cdb2a5f570 Sean Young 2019-10-07  71  		data = ~data;
8d023a5787775c Sean Young 2018-10-18  72  	} while (offset > 0);
8a4e8f8dfc6994 Sean Young 2018-01-05  73  
494fce160f2dac Sean Young 2019-08-09  74  	if (packet_no == 0x0a && !imon->rcdev->idle) {
8a4e8f8dfc6994 Sean Young 2018-01-05  75  		ir_raw_event_set_idle(imon->rcdev, true);
8a4e8f8dfc6994 Sean Young 2018-01-05  76  		ir_raw_event_handle(imon->rcdev);
8a4e8f8dfc6994 Sean Young 2018-01-05  77  	}
8a4e8f8dfc6994 Sean Young 2018-01-05  78  }
8a4e8f8dfc6994 Sean Young 2018-01-05  79  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
