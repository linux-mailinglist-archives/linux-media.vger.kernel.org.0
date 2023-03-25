Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFBB6C8CC7
	for <lists+linux-media@lfdr.de>; Sat, 25 Mar 2023 09:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbjCYIsC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Mar 2023 04:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbjCYIsA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Mar 2023 04:48:00 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A74DBF4
        for <linux-media@vger.kernel.org>; Sat, 25 Mar 2023 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679734078; x=1711270078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NcHFcqwXTycpuEKFSID3iofuj7JtaA9K366UVtHEpt0=;
  b=md7NvM/zr4rziuoj9hdth75ZH7M+PCyiwPsGfz7LYQE8cWppSma151nH
   sw7TjwbHcp5K/bcxfOz2uu7Ao540Vj3woSCEEIgwr3bkASCb0yJWfyaPz
   lActKNVjqz0A5xLlkwUpRmfZ0wRdNBsTVvIOAo4u3KQ2/8MKrdOFt5+x3
   jfO9dOieD/fLlv1Ep1AvDOW5pLyIGg3GyGFvzYijhwfD2x76btwFEN6B/
   hDwEF0fgJ2Hvp7zFV3sC6Gguc0uXex4ouovAyt3WLOyGQJxpqL191rPXw
   5wc0Qm6lkOPSdzi/7Zn540/QYyzCzaUmTVno2bHiz66MFZEQi2NomSIpt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="323837065"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="323837065"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 01:47:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="793722501"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="793722501"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Mar 2023 01:47:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pfzZ5-000G7r-0B;
        Sat, 25 Mar 2023 08:47:55 +0000
Date:   Sat, 25 Mar 2023 16:47:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Stefan Herdler <herdler@nurfuerspam.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>
Subject: Re: [PATCH] Legacy DVB API: completion of documentation
Message-ID: <202303251637.x35nzuXi-lkp@intel.com>
References: <50f69514-abbb-2dfb-6060-889aa2c6e02c@nurfuerspam.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50f69514-abbb-2dfb-6060-889aa2c6e02c@nurfuerspam.de>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.3-rc3 next-20230324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Herdler/Legacy-DVB-API-completion-of-documentation/20230325-094623
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/50f69514-abbb-2dfb-6060-889aa2c6e02c%40nurfuerspam.de
patch subject: [PATCH] Legacy DVB API: completion of documentation
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/1dee8a08e2a818066aa1453a7370685deb3a5786
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stefan-Herdler/Legacy-DVB-API-completion-of-documentation/20230325-094623
        git checkout 1dee8a08e2a818066aa1453a7370685deb3a5786
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303251637.x35nzuXi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst:155: WARNING: Error in "cpp:function" directive:
>> Documentation/userspace-api/media/dvb/legacy_dvb_osd.rst:399: WARNING: Error in "cpp:function" directive:

vim +155 Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst

   154	
 > 155	.. cpp:function:: int ioctl(int fd, int request = AUDIO_STOP)
   156	   :name: LEGACY_DVB_AUDIO_STOP
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
