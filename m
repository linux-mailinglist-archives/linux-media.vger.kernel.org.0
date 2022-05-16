Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBE4852854F
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 15:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241026AbiEPN1O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 09:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236627AbiEPN1H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 09:27:07 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED00828720
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 06:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652707616; x=1684243616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lur/3NOqlYo8OA4XcGOZZynoHlfOsUsH13GiiFM9Bx8=;
  b=BYoYP44onQAPWvvU4pWWymLFnOCP+PbIfw0/mGPx/5H5cGg+VjQ5udr5
   /L9zct0CA2ruMSj/DJHE+jPn5fgW1Oq0l5dplWk+YFUHEKorjQwQIqQgw
   VP61KHchEcEsRGRZ0qqKUTgHaAEJx7ZjLbQVn4y7CZqtlpqh90iBAZLY/
   wIytDRz+wuVhNzM7JFLF7fNyZLNVFtAG/h0XVNWv6yx0iW/dTqeP4SbBL
   UtMMOcvg0vb/nxQEQ9xB1z5gbHTzK7pN8cyJaiKmHl2Kvj7cJHkKgVrnE
   c7ecHCbUIBStXZqCCti7Uhqi6k7a77AIE8YeAUFEvuZX/JxAsIuGHdfTf
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="357239048"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="357239048"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 06:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="604854114"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 May 2022 06:26:28 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nqak0-00002b-1p;
        Mon, 16 May 2022 13:26:28 +0000
Date:   Mon, 16 May 2022 21:25:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Yunke Cao <yunkec@google.com>, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Subject: Re: [PATCH v1 5/6] media: uvcvideo: Initialize roi to default value
Message-ID: <202205162134.uZvFM4c1-lkp@intel.com>
References: <20220516092209.1801656-6-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516092209.1801656-6-yunkec@google.com>
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v5.18-rc7 next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunke-Cao/media-Implement-UVC-v1-5-ROI/20220516-172509
base:   git://linuxtv.org/media_tree.git master
config: i386-buildonly-randconfig-r002-20220516 (https://download.01.org/0day-ci/archive/20220516/202205162134.uZvFM4c1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/453e68b0e012e424659c3fd4c4c7824ad768f440
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yunke-Cao/media-Implement-UVC-v1-5-ROI/20220516-172509
        git checkout 453e68b0e012e424659c3fd4c4c7824ad768f440
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/usb/uvc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/usb/uvc/uvc_ctrl.c:2587:44: error: use of undeclared identifier 'camera_entity'
                               uvc_entity_match_guid(ctrl->entity, camera_entity))
                                                                   ^
   1 error generated.


vim +/camera_entity +2587 drivers/media/usb/uvc/uvc_ctrl.c

  2551	
  2552	/*
  2553	 * Add control information and hardcoded stock control mappings to the given
  2554	 * device.
  2555	 */
  2556	static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
  2557				       struct uvc_control *ctrl)
  2558	{
  2559		const struct uvc_control_info *info = uvc_ctrls;
  2560		const struct uvc_control_info *iend = info + ARRAY_SIZE(uvc_ctrls);
  2561		const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
  2562		const struct uvc_control_mapping *mend =
  2563			mapping + ARRAY_SIZE(uvc_ctrl_mappings);
  2564	
  2565		/* XU controls initialization requires querying the device for control
  2566		 * information. As some buggy UVC devices will crash when queried
  2567		 * repeatedly in a tight loop, delay XU controls initialization until
  2568		 * first use.
  2569		 */
  2570		if (UVC_ENTITY_TYPE(ctrl->entity) == UVC_VC_EXTENSION_UNIT)
  2571			return;
  2572	
  2573		for (; info < iend; ++info) {
  2574			if (uvc_entity_match_guid(ctrl->entity, info->entity) &&
  2575			    ctrl->index == info->index) {
  2576				uvc_ctrl_add_info(chain->dev, ctrl, info);
  2577				/*
  2578				 * Retrieve control flags from the device. Ignore errors
  2579				 * and work with default flag values from the uvc_ctrl
  2580				 * array when the device doesn't properly implement
  2581				 * GET_INFO on standard controls.
  2582				 */
  2583				uvc_ctrl_get_flags(chain->dev, ctrl, &ctrl->info);
  2584	
  2585				if (ctrl->info.selector ==
  2586					UVC_CT_REGION_OF_INTEREST_CONTROL &&
> 2587				    uvc_entity_match_guid(ctrl->entity, camera_entity))
  2588					uvc_ctrl_init_roi(chain->dev, ctrl);
  2589				break;
  2590			 }
  2591		}
  2592	
  2593		if (!ctrl->initialized)
  2594			return;
  2595	
  2596		for (; mapping < mend; ++mapping) {
  2597			if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
  2598			    ctrl->info.selector == mapping->selector)
  2599				__uvc_ctrl_add_mapping(chain, ctrl, mapping);
  2600		}
  2601	}
  2602	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
