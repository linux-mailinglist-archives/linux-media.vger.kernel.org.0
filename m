Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 917A374478B
	for <lists+linux-media@lfdr.de>; Sat,  1 Jul 2023 09:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbjGAHJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jul 2023 03:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjGAHIr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jul 2023 03:08:47 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480066EA1;
        Sat,  1 Jul 2023 00:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688194999; x=1719730999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b2tdZDijpkNbhOaoKT4z5wlvbzHwp1PIa7BELo0bGqo=;
  b=arv7jGevgPjUvK6DAIWBDHDJw7Po3JJWEgYN6hOITuiOr5DgutyqJ9t+
   3NKN4Pfjw5U/owjAtpDhj9tdmKfeGP0aBZE4yeLqGr4nl6V+G16d3GYq4
   /Lvp/fcvb2WtCfHUHwelPNmInaSzOWlSIwgg2G0DF4ZIj3KHlafKdbmfN
   SiFidcH8i5iOvoeSj/xngvnICU4crCyR5gLVZjOHphw2FJB9FNWv/NZYY
   uOeLFRMiTW4v86soHnVkGl1IhoLbPIkReImSWMQGlWp/3h8vb3vdKiWfa
   W78BvUZdTcoYBuBRCNe/O1YyJxVKWQ+FsWTFlyNGp3ivaAVO9Z8QlCZAj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="360040594"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="360040594"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 00:02:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="783313192"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="783313192"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Jul 2023 00:02:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qFUcJ-000Fn3-31;
        Sat, 01 Jul 2023 07:01:59 +0000
Date:   Sat, 1 Jul 2023 15:01:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [sailus-media-tree:metadata 7/7] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-fmt-flag-meta-line-based (if the link has no caption the label must
 precede a section header)
Message-ID: <202307011445.xI9djX6d-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   acd95717f9d98767ad03e91b1b171352f9bcbaf9
commit: 028cb656529e4cd7e40b21b97b078d5fb7809eed [7/7] media: v4l: Support line-based metadata capture
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307011445.xI9djX6d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307011445.xI9djX6d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-fmt-flag-meta-line-based (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
