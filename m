Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6365B9A95
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 14:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiIOMSK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 08:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbiIOMSJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 08:18:09 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23A599B76
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 05:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663244288; x=1694780288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qx8yq3NV5XPA7VYm/kQ3y1QxXfYlCZWki0tXd6MgZv4=;
  b=DzGLJiiMTGpxeAhRyhKRcW5b3VHCxjiW/3gioa2BPwDK9uHJoh8lDQFp
   4Ef6LdY/teKzOoegPkUBc1c4VeGVMmYDTt7RrX++L+yVteQHF84Wy2YO8
   7Ukzp2OcX/zQJ9Ml4P0kqfafIawtgz06zFYXErt7cNEEpEXNhNN95W0rl
   TWTlv0IuhkEZhgzFRBlOlncPZ6ps0oS8eX29G29iXVP+GhTtaOtHdBgf0
   ILDrC7ZhDbfGSWtbpjml8aqC4Hg8fCyTAo9o8suCLKVOJIn6FwZsqKJZu
   pWbL5pljI4qGnCMjRxT9ftPkTgGSKsfeMdHNJUeNdbDf/rqQe/zojlnqK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="281726504"
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="281726504"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 05:18:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="568407353"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Sep 2022 05:18:07 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oYnok-0000Wr-2n;
        Thu, 15 Sep 2022 12:18:06 +0000
Date:   Thu, 15 Sep 2022 20:17:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org
Subject: Re: [PATCH] media: admin-guide: cec.rst
Message-ID: <202209152039.46dZ0HIT-lkp@intel.com>
References: <020c8018-2e13-34a7-491c-299ed50836ef@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <020c8018-2e13-34a7-491c-299ed50836ef@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on sailus-media-tree/streams linus/master v6.0-rc5 next-20220914]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-Verkuil/media-admin-guide-cec-rst/20220914-212222
base:   git://linuxtv.org/media_tree.git master
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/c58e58b466fb4c61533c68f2eca2a9d851349513
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hans-Verkuil/media-admin-guide-cec-rst/20220914-212222
        git checkout c58e58b466fb4c61533c68f2eca2a9d851349513
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/admin-guide/media/pulse8-cec.rst
>> MAINTAINERS:36731: WARNING: unknown document: ../admin-guide/media/pulse8-cec

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
