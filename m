Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD4B5A6F08
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 23:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbiH3VSh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 17:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbiH3VSf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 17:18:35 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AE8883D2
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 14:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661894314; x=1693430314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F8S7iEhk8r1GIMqtyp9BqUTHYbzu3YMzB7OfgBdIeuI=;
  b=Bd4UjBaK1YSaxtxw0d/AFm0Nhf9I/3TnkqbNJEp7djOzPZKCs2krIpdZ
   Q7UbVj+nhs7hsCV0m7pjwq3oxhI5IzWgR+VDFsULQM9XnOXUrCccRk5cj
   Q3gpJH1MP3sDLM4ahpsRBVTixfFUiPfdXRmYi/7bAZjjmTJ8B6RdjqEhc
   nvy8vP3GvHIxO51m3PL1J5cyQnt9qWWeExdtLBznaSDgIIHJeSA4OSveA
   v/mgZLMd62aX1ZpKjg4cadNK9QNsx0TfUxZO1fYWGv1Hoxcvt+CD0Dvs5
   xbN8W+O9SNadWhS4YcUNMeQHvjK9REOPfSwQ4lzGi03PqAHWIusHXPFXn
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="282274746"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="282274746"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 14:18:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="940195086"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2022 14:18:32 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oT8cx-0000bz-1C;
        Tue, 30 Aug 2022 21:18:31 +0000
Date:   Wed, 31 Aug 2022 05:17:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: Re: [PATCH v4 3/4] media: dt-bindings: media: i2c: Add ST VGXY61
 camera sensor binding
Message-ID: <202208310510.mzI5O33r-lkp@intel.com>
References: <20220830121608.12047-4-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830121608.12047-4-benjamin.mugnier@foss.st.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc3 next-20220830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Mugnier/media-Add-ST-VGXY61-camera-sensor-driver/20220830-201917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dcf8e5633e2e69ad60b730ab5905608b756a032f
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/c2d5a76662181ace9dd54e8fea5589fa3a35621b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Mugnier/media-Add-ST-VGXY61-camera-sensor-driver/20220830-201917
        git checkout c2d5a76662181ace9dd54e8fea5589fa3a35621b
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.txt

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
