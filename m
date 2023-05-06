Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0836F9225
	for <lists+linux-media@lfdr.de>; Sat,  6 May 2023 14:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbjEFMzT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 May 2023 08:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231892AbjEFMzS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 May 2023 08:55:18 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B35D1816F;
        Sat,  6 May 2023 05:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683377717; x=1714913717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NQ6wCfyoHyDNspXQ5XCpgLu3HkADePGJt66eht8gTUY=;
  b=YeDdrkpw+Li+Qxl6EOjOS9sODJuz4tNSj7JVPPsjgTTLPx3zewCVHbgB
   yv72oSHDDkiaHPMGyvsStl9A8CG1mIYHdwfFnNXUlPZvkeioetqi6zmJQ
   lgwJFkO1qgwV640mMAiYuS+OGKryGw0LGd2egRValrVwJfqm8h6HYYaY8
   h+sLBuDm/8oRLswTryrR96Daqkun2cTuVAAeBLq6GxyNDM1oBkeO9RH1q
   djpGgEgQKu3MJhd984ZdRg3cRQfxAJCtWTx1Gcv/Jo/vAzXS4r55vZW57
   94dhXaILGlFQT1fCERG2ZLr0bjFg2SiT8Q2bLKmuAG5zmLBSxR8wunjdB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="352434738"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="352434738"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 05:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="692031101"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="692031101"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 May 2023 05:55:16 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pvHRT-0000JF-1H;
        Sat, 06 May 2023 12:55:15 +0000
Date:   Sat, 6 May 2023 20:54:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [sailus-media-tree:metadata 10/11] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-fmt-flag-meta-line-based (if the link has no caption the label must
 precede a section header)
Message-ID: <202305062027.tzv2gT5B-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   edce6cf3cf2b2adb0c7717bb918cd84c5f2b4810
commit: 26aac41bc63221fb4bc8cca72ae53da3a3d443e1 [10/11] media: v4l: Support line-based metadata capture
reproduce:
        git remote add sailus-media-tree git://linuxtv.org/sailus/media_tree.git
        git fetch --no-tags sailus-media-tree metadata
        git checkout 26aac41bc63221fb4bc8cca72ae53da3a3d443e1
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305062027.tzv2gT5B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-fmt-flag-meta-line-based (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
