Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D29637445C8
	for <lists+linux-media@lfdr.de>; Sat,  1 Jul 2023 03:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjGABLx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 21:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjGABLw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 21:11:52 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1132D63;
        Fri, 30 Jun 2023 18:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688173911; x=1719709911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x9ZaQO5NnrgahINNKMNn+BHcwWxUER7/Hx8AwMHcro4=;
  b=CpIpjst8kif7PALgswE+/ys+7fAVyHS3lxTWkgtUbrgfmnRcis/oc8MX
   2YWQK4q+K3wTAyUf+msKdfp+duja1IkpU4zvF7MZzteC+/LgqckKbvcUn
   mtQyOdWsheqnVn+2kUntYI8FOEJ8aq1Z34Tg0FWm8CrvHMDYdJI9NDrEX
   UZlElepWXX1iIjW00/KPLXde4W0A4VJNn3inzedD7NZ+ByjBh5NJPRoOL
   Xi4qa4QULIgtle2PuzEjd8k4P8c7MtAb8PYqNFVjcVQIXnxk06y/B629d
   NC7GDSiH8rbcUsJI6wN30mtj2ElVwRzcp1L5j+dylQyVk89F2Dpq1nS6x
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="352354126"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="352354126"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 18:11:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="721146895"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="721146895"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jun 2023 18:11:49 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qFP9Q-000FWX-2Y;
        Sat, 01 Jul 2023 01:11:48 +0000
Date:   Sat, 1 Jul 2023 09:11:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [sailus-media-tree:metadata 2/7] htmldocs:
 Documentation/userspace-api/media/mediactl/media-types.rst:379: WARNING:
 Inline literal start-string without end-string.
Message-ID: <202307010949.G2WKDFxB-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   acd95717f9d98767ad03e91b1b171352f9bcbaf9
commit: ddc2319ca1f78e14505d93d17298b951c52b3c4b [2/7] media: mc: Add INTERNAL pad flag
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307010949.G2WKDFxB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307010949.G2WKDFxB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/userspace-api/media/mediactl/media-types.rst:379: WARNING: Inline literal start-string without end-string.
>> Documentation/userspace-api/media/glossary.rst:117: WARNING: term not in glossary: v4l2 api
>> Documentation/userspace-api/media/glossary.rst:130: WARNING: term not in glossary: v4l2 hardware
>> Documentation/userspace-api/media/glossary.rst:207: WARNING: term not in glossary: v4l2 sub-device

vim +379 Documentation/userspace-api/media/mediactl/media-types.rst

   365	
   366	.. flat-table:: Media pad flags
   367	    :header-rows:  0
   368	    :stub-columns: 0
   369	
   370	    *  -  ``MEDIA_PAD_FL_SINK``
   371	       -  Input pad, relative to the entity. Input pads sink data and are
   372		  targets of links.
   373	
   374	    *  -  ``MEDIA_PAD_FL_SOURCE``
   375	       -  Output pad, relative to the entity. Output pads source data and
   376		  are origins of links.
   377	
   378	    *  -  ``MEDIA_PAD_FL_MUST_CONNECT``
 > 379	       -  If this flag is set and the pad is linked to any other pad, then at
   380		  least one of those links must be enabled for the entity to be able to
   381		  :ref:``stream <media-glossary-stream>. There could be temporary
   382		  reasons (e.g. device configuration dependent) for the pad to need
   383		  enabled links even when this flag isn't set; the absence of the flag
   384		  doesn't imply there is none.
   385	
   386	    *  -  ``MEDIA_PAD_FL_INTERNAL``
   387	       -  The internal flag indicates an internal pad that has no external
   388		  connections. Such a pad shall not be connected with a link. The
   389		  internal flag indicates that the stream either starts or ends in the
   390		  entity. For a given pad, the presence of the internal flag
   391		  necessitates the presence of either ``MEDIA_PAD_FL_SINK`` or
   392		  ``MEDIA_PAD_FL_SOURCE`` flag.
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
