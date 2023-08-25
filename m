Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85A62788591
	for <lists+linux-media@lfdr.de>; Fri, 25 Aug 2023 13:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238029AbjHYLZT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Aug 2023 07:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240047AbjHYLZG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Aug 2023 07:25:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323A01FD7
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 04:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692962704; x=1724498704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=347L9KpD8ohvGW3aF3357c8O67AcBOurR+NDJNl8mzA=;
  b=fVWpvl3dUfdfKi/MVx7f+vfHQ907yACkw+ndhWq1Cbq2o95Pggc6BN35
   dRHFWxQU1wD36Z+qr6jZ7T+hLiO+FcyP4fP5BQ3BgXCG/vMXbiFNU32oZ
   6Ct3lTpbyZmxqEckknRWOrUw6vN7Wc9X5CFHWRNIVo4PJzL8rHLcRgfKy
   lF1V/fToi6Cy5PexiLb0r+WU9it7zIQitGkEVebjNjrYJzTJ/wZi8aap3
   BqVDl3IRMMwZWXX72BcrB4fEPKVzEXN15zvuYJhf5UTL/wS1Z2mNSmPyC
   a/GGkYruNozZ76zMDaF/sILRDEX0/JFGskd+sbXYMQqotQc7hDRwVVQaT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359690874"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="359690874"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 04:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="881148495"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 25 Aug 2023 04:25:05 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qZUvR-0003VU-26;
        Fri, 25 Aug 2023 11:24:37 +0000
Date:   Fri, 25 Aug 2023 19:23:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org
Cc:     oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
        Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/cec: add drm_dp_cec_attach() as the
 non-edid version of set edid
Message-ID: <202308251937.G5ETiCfF-lkp@intel.com>
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
config: nios2-randconfig-r036-20230824 (https://download.01.org/0day-ci/archive/20230825/202308251937.G5ETiCfF-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251937.G5ETiCfF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251937.G5ETiCfF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/display/drm_dp_cec.c: In function 'drm_dp_cec_attach':
>> drivers/gpu/drm/display/drm_dp_cec.c:342:41: error: 'adap' undeclared (first use in this function)
     342 |                         cec_s_phys_addr(adap, source_physical_address, false);
         |                                         ^~~~
   drivers/gpu/drm/display/drm_dp_cec.c:342:41: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/display/drm_dp_cec.c: In function 'drm_dp_cec_set_edid':
>> drivers/gpu/drm/display/drm_dp_cec.c:388:25: error: invalid use of undefined type 'const struct edid'
     388 |         if (edid && edid->extensions)
         |                         ^~
>> drivers/gpu/drm/display/drm_dp_cec.c:389:17: error: 'pa' undeclared (first use in this function)
     389 |                 pa = cec_get_edid_phys_addr((const u8 *)edid,
         |                 ^~
>> drivers/gpu/drm/display/drm_dp_cec.c:390:45: error: 'EDID_LENGTH' undeclared (first use in this function)
     390 |                                             EDID_LENGTH * (edid->extensions + 1), NULL);
         |                                             ^~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_cec.c:390:64: error: invalid use of undefined type 'const struct edid'
     390 |                                             EDID_LENGTH * (edid->extensions + 1), NULL);
         |                                                                ^~


vim +/adap +342 drivers/gpu/drm/display/drm_dp_cec.c

   293	
   294	/*
   295	 * A new EDID is set. If there is no CEC adapter, then create one. If
   296	 * there was a CEC adapter, then check if the CEC adapter properties
   297	 * were unchanged and just update the CEC physical address. Otherwise
   298	 * unregister the old CEC adapter and create a new one.
   299	 */
   300	void drm_dp_cec_attach(struct drm_dp_aux *aux, u16 source_physical_address)
   301	{
   302		struct drm_connector *connector = aux->cec.connector;
   303		u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
   304			       CEC_CAP_CONNECTOR_INFO;
   305		struct cec_connector_info conn_info;
   306		unsigned int num_las = 1;
   307		u8 cap;
   308	
   309		/* No transfer function was set, so not a DP connector */
   310		if (!aux->transfer)
   311			return;
   312	
   313	#ifndef CONFIG_MEDIA_CEC_RC
   314		/*
   315		 * CEC_CAP_RC is part of CEC_CAP_DEFAULTS, but it is stripped by
   316		 * cec_allocate_adapter() if CONFIG_MEDIA_CEC_RC is undefined.
   317		 *
   318		 * Do this here as well to ensure the tests against cec_caps are
   319		 * correct.
   320		 */
   321		cec_caps &= ~CEC_CAP_RC;
   322	#endif
   323		cancel_delayed_work_sync(&aux->cec.unregister_work);
   324	
   325		mutex_lock(&aux->cec.lock);
   326		if (!drm_dp_cec_cap(aux, &cap)) {
   327			/* CEC is not supported, unregister any existing adapter */
   328			cec_unregister_adapter(aux->cec.adap);
   329			aux->cec.adap = NULL;
   330			goto unlock;
   331		}
   332	
   333		if (cap & DP_CEC_SNOOPING_CAPABLE)
   334			cec_caps |= CEC_CAP_MONITOR_ALL;
   335		if (cap & DP_CEC_MULTIPLE_LA_CAPABLE)
   336			num_las = CEC_MAX_LOG_ADDRS;
   337	
   338		if (aux->cec.adap) {
   339			if (aux->cec.adap->capabilities == cec_caps &&
   340			    aux->cec.adap->available_log_addrs == num_las) {
   341				/* Unchanged, so just set the phys addr */
 > 342				cec_s_phys_addr(adap, source_physical_address, false);
   343				goto unlock;
   344			}
   345			/*
   346			 * The capabilities changed, so unregister the old
   347			 * adapter first.
   348			 */
   349			cec_unregister_adapter(aux->cec.adap);
   350		}
   351	
   352		/* Create a new adapter */
   353		aux->cec.adap = cec_allocate_adapter(&drm_dp_cec_adap_ops,
   354						     aux, connector->name, cec_caps,
   355						     num_las);
   356		if (IS_ERR(aux->cec.adap)) {
   357			aux->cec.adap = NULL;
   358			goto unlock;
   359		}
   360	
   361		cec_fill_conn_info_from_drm(&conn_info, connector);
   362		cec_s_conn_info(aux->cec.adap, &conn_info);
   363	
   364		if (cec_register_adapter(aux->cec.adap, connector->dev->dev)) {
   365			cec_delete_adapter(aux->cec.adap);
   366			aux->cec.adap = NULL;
   367		} else {
   368			/*
   369			 * Update the phys addr for the new CEC adapter. When called
   370			 * from drm_dp_cec_register_connector() edid == NULL, so in
   371			 * that case the phys addr is just invalidated.
   372			 */
   373			cec_s_phys_addr(adap, source_physical_address, false);
   374		}
   375	unlock:
   376		mutex_unlock(&aux->cec.lock);
   377	}
   378	EXPORT_SYMBOL(drm_dp_cec_attach);
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
 > 389			pa = cec_get_edid_phys_addr((const u8 *)edid,
 > 390						    EDID_LENGTH * (edid->extensions + 1), NULL);
   391	
   392		drm_dp_cec_attach(aux, source_physical_address);
   393	}
   394	EXPORT_SYMBOL(drm_dp_cec_set_edid);
   395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
