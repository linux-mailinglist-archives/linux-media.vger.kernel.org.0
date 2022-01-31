Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9318C4A4B29
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 17:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349518AbiAaQBm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jan 2022 11:01:42 -0500
Received: from mga01.intel.com ([192.55.52.88]:11219 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231828AbiAaQBm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jan 2022 11:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643644902; x=1675180902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TicKd4P+h5PhqRQkwsLkviKMfF72vF63G9NpY9Gv5HY=;
  b=iaKTjOqqndvNIsW/QkUAm9MLYiad1xRGzEyC1DdIQACiC30iacoQ7vth
   zD1uLiBbp2OlI5MIFdzGrndKKBmp978gmutRnEv5B/EZOgzCe/SBePHm0
   eDNdvbcCUXKWPoO02xFIQUYYvs8cAhjjHtWjQQQB+MV+KymuG8aasQJF5
   bKSrOZ1bWfh4H1HLZ/bl1HfjDbIPUCPaSstBie5Ca1VkOn707/uRbKsGM
   MsKVIeoNBx8kOMpOyYuLs42PlwtbMHyC7SiDD6CMmdUarQAbT1me4MFU6
   WSFNTO2+Uf+xveJodTo8E72Fwk+Et3CoGF/tMoLhUPzCWr1kpAIF6OfEY
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="271957012"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="271957012"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 08:01:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="565164185"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 Jan 2022 08:01:37 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nEZ7Z-000S7H-B4; Mon, 31 Jan 2022 16:01:37 +0000
Date:   Tue, 1 Feb 2022 00:00:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Cc:     kbuild-all@lists.01.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH v2 5/6] media: entity: Add support for ancillary links
Message-ID: <202201312326.TkliJ318-lkp@intel.com>
References: <20220130235821.48076-6-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130235821.48076-6-djrscally@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.17-rc2 next-20220131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Scally/Introduce-ancillary-links/20220131-080041
base:   git://linuxtv.org/media_tree.git master
reproduce: make htmldocs

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> include/media/media-entity.h:1126: warning: expecting prototype for media_entity_call(). Prototype was for media_create_ancillary_link() instead

vim +1126 include/media/media-entity.h

  1094	
  1095	/**
  1096	 * media_entity_call - Calls a struct media_entity_operations operation on
  1097	 *	an entity
  1098	 *
  1099	 * @entity: entity where the @operation will be called
  1100	 * @operation: type of the operation. Should be the name of a member of
  1101	 *	struct &media_entity_operations.
  1102	 *
  1103	 * This helper function will check if @operation is not %NULL. On such case,
  1104	 * it will issue a call to @operation\(@entity, @args\).
  1105	 */
  1106	
  1107	/**
  1108	 * media_create_ancillary_link() - create an ancillary link between two
  1109	 *				   instances of &media_entity
  1110	 *
  1111	 * @primary:	pointer to the primary &media_entity
  1112	 * @ancillary:	pointer to the ancillary &media_entity
  1113	 *
  1114	 * Create an ancillary link between two entities, indicating that they
  1115	 * represent two connected pieces of hardware that form a single logical unit.
  1116	 * A typical example is a camera lens being linked to the sensor that it is
  1117	 * supporting.
  1118	 *
  1119	 * The function sets both MEDIA_LNK_FL_ENABLED and MEDIA_LNK_FL_IMMUTABLE for
  1120	 * the new link. This behaviour may be subject to change in the future, so
  1121	 * userspace applications using ancillary links should ensure that ancillary
  1122	 * links are enabled when in use.
  1123	 */
  1124	struct media_link *
  1125	media_create_ancillary_link(struct media_entity *primary,
> 1126				    struct media_entity *ancillary);
  1127	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
