Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35171788599
	for <lists+linux-media@lfdr.de>; Fri, 25 Aug 2023 13:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241038AbjHYL0X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Aug 2023 07:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243439AbjHYL0V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Aug 2023 07:26:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30A31FDB
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 04:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692962779; x=1724498779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zgw4sLWDGWUm5qL+PZd4iP2mM4yO+1bqfsU+W9QJHiw=;
  b=EOt1n816vbAvByTzYRFfwFaRe8AVMtG2vk27ePEZLdcEhaNKEgii1+8E
   5OhjFvHYCUw3UNpXgtvr020Ca/4IoexUSxVhUQ2fe4QEFSIT21YBxNDif
   +GpDjU9KFihzWHeLGyUwCJ7+FNmN4DXjWqJ7obdAbBSFwZtsKRS/4qPac
   OgUFeQMdOU0WR7iblPT6R+9blZjKhU97lurSngT9wO8ZFX7LagTetaUEM
   uGC9IdjlznE+lCn+pVeBh3Lj6L6CH/dQyhsrqOq8oRInvMywe7MxbLjre
   5YBbxZfb5wa/ad33Ky5viRtrrW041bWeXTIGdtCKEf8pmKuEJSK9mPzgC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359690992"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="359690992"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 04:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="731036214"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="731036214"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Aug 2023 04:26:15 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qZUwp-0003Va-1w;
        Fri, 25 Aug 2023 11:26:00 +0000
Date:   Fri, 25 Aug 2023 19:23:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org
Cc:     oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
        Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/cec: add drm_dp_cec_attach() as the
 non-edid version of set edid
Message-ID: <202308251944.9tpk0wma-lkp@intel.com>
References: <f8ed9b38fd2ebcd8344a1889a6c0f288969454ea.1692884619.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8ed9b38fd2ebcd8344a1889a6c0f288969454ea.1692884619.git.jani.nikula@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm/drm-next next-20230825]
[cannot apply to drm-intel/for-linux-next-fixes drm-misc/drm-misc-next linus/master v6.5-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-edid-add-drm_edid_is_digital/20230824-220926
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/f8ed9b38fd2ebcd8344a1889a6c0f288969454ea.1692884619.git.jani.nikula%40intel.com
patch subject: [Intel-gfx] [PATCH 4/6] drm/cec: add drm_dp_cec_attach() as the non-edid version of set edid
config: i386-buildonly-randconfig-001-20230824 (https://download.01.org/0day-ci/archive/20230825/202308251944.9tpk0wma-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251944.9tpk0wma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251944.9tpk0wma-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/display/drm_dp_cec.c: In function 'drm_dp_cec_attach':
   drivers/gpu/drm/display/drm_dp_cec.c:342:20: error: 'adap' undeclared (first use in this function)
     342 |    cec_s_phys_addr(adap, source_physical_address, false);
         |                    ^~~~
   drivers/gpu/drm/display/drm_dp_cec.c:342:20: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/display/drm_dp_cec.c: In function 'drm_dp_cec_set_edid':
>> drivers/gpu/drm/display/drm_dp_cec.c:388:18: error: dereferencing pointer to incomplete type 'const struct edid'
     388 |  if (edid && edid->extensions)
         |                  ^~
   drivers/gpu/drm/display/drm_dp_cec.c:389:3: error: 'pa' undeclared (first use in this function)
     389 |   pa = cec_get_edid_phys_addr((const u8 *)edid,
         |   ^~
   drivers/gpu/drm/display/drm_dp_cec.c:390:10: error: 'EDID_LENGTH' undeclared (first use in this function)
     390 |          EDID_LENGTH * (edid->extensions + 1), NULL);
         |          ^~~~~~~~~~~


vim +388 drivers/gpu/drm/display/drm_dp_cec.c

   379	
   380	/*
   381	 * Note: Prefer calling drm_dp_cec_attach() with
   382	 * connector->display_info.source_physical_address if possible.
   383	 */
   384	void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
   385	{
   386		u16 source_physical_address = CEC_PHYS_ADDR_INVALID;
   387	
 > 388		if (edid && edid->extensions)
   389			pa = cec_get_edid_phys_addr((const u8 *)edid,
   390						    EDID_LENGTH * (edid->extensions + 1), NULL);
   391	
   392		drm_dp_cec_attach(aux, source_physical_address);
   393	}
   394	EXPORT_SYMBOL(drm_dp_cec_set_edid);
   395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
