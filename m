Return-Path: <linux-media+bounces-1054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF577F9689
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 00:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86684B20B2E
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 23:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F818171DD;
	Sun, 26 Nov 2023 23:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GeWv4p0B"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF2D8111
	for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 15:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701041539; x=1732577539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sX5xVwqRXIsF6CBEM3D5DwfYSIWpXhFypi7fVenWT6s=;
  b=GeWv4p0B05oYLKALOO7Ls9hOYac1Flyxz8mGxmCwQYlYsZkfi/Ko4oCV
   QFGmwQTeCIv69hTIYy3M3QgD+kJh2ZXT5QPgfAXFstNrO4pGIGXGqCj80
   enWalccsd3JcHQBGdMPjJlzOvfggca95hyGtnHtjbHtgN40g0E8Q91Q4i
   6e8pBDN5MtrI7ZMUEojA1Iw38mfWBCd8vp976C025642Bp7NpQYJsbO5w
   DZAOrOX3aUW+KPEseev6W8g63vlIC+31XIP/RCJLXdtc//HVvTpr364hX
   I3vQGeAM3pjxUqHkU79WGdawuVBvXYeXyovEZdqc+lN7ZrFvC7XcvlXEH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="372768310"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="372768310"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 15:32:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="858862275"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="858862275"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Nov 2023 15:32:17 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7Obn-0005d5-0p;
	Sun, 26 Nov 2023 23:32:15 +0000
Date: Mon, 27 Nov 2023 07:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:test 19/20]
 drivers/media/v4l2-core/v4l2-subdev.c:1473:6: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <202311270412.AMfCcbby-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git test
head:   1c12986c58defb1d262ac0fa851066fc724e617e
commit: 4c7fd566e013fd0ec5cfc3243b63bf2804c4e9fe [19/20] media: v4l2-subdev: Rename .init_cfg() operation to .init_state()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231127/202311270412.AMfCcbby-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311270412.AMfCcbby-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270412.AMfCcbby-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-subdev.c:1473:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
           if (ret < 0 && ret != -ENOIOCTLCMD)
               ^~~
   drivers/media/v4l2-core/v4l2-subdev.c:1439:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +/ret +1473 drivers/media/v4l2-core/v4l2-subdev.c

33c0ddbe56905c Tomi Valkeinen   2021-07-15  1433  
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1434  struct v4l2_subdev_state *
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1435  __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1436  			  struct lock_class_key *lock_key)
9b02cbb3ede89b Laurent Pinchart 2015-04-24  1437  {
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1438  	struct v4l2_subdev_state *state;
9b02cbb3ede89b Laurent Pinchart 2015-04-24  1439  	int ret;
9b02cbb3ede89b Laurent Pinchart 2015-04-24  1440  
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1441  	state = kzalloc(sizeof(*state), GFP_KERNEL);
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1442  	if (!state)
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1443  		return ERR_PTR(-ENOMEM);
9b02cbb3ede89b Laurent Pinchart 2015-04-24  1444  
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1445  	__mutex_init(&state->_lock, lock_name, lock_key);
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1446  	if (sd->state_lock)
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1447  		state->lock = sd->state_lock;
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1448  	else
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1449  		state->lock = &state->_lock;
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1450  
52c2575db8faa1 Sakari Ailus     2023-10-13  1451  	state->sd = sd;
52c2575db8faa1 Sakari Ailus     2023-10-13  1452  
2f91e10ee6fd4c Tomi Valkeinen   2021-12-21  1453  	/* Drivers that support streams do not need the legacy pad config */
2f91e10ee6fd4c Tomi Valkeinen   2021-12-21  1454  	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS) && sd->entity.num_pads) {
8af592e2ecbcd2 Hans Verkuil     2022-05-02  1455  		state->pads = kvcalloc(sd->entity.num_pads,
8af592e2ecbcd2 Hans Verkuil     2022-05-02  1456  				       sizeof(*state->pads), GFP_KERNEL);
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1457  		if (!state->pads) {
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1458  			ret = -ENOMEM;
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1459  			goto err;
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1460  		}
9b02cbb3ede89b Laurent Pinchart 2015-04-24  1461  	}
9b02cbb3ede89b Laurent Pinchart 2015-04-24  1462  
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1463  	/*
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1464  	 * There can be no race at this point, but we lock the state anyway to
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1465  	 * satisfy lockdep checks.
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1466  	 */
4c7fd566e013fd Laurent Pinchart 2023-11-26  1467  	if (sd->internal_ops && sd->internal_ops->init_state) {
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1468  		v4l2_subdev_lock_state(state);
4c7fd566e013fd Laurent Pinchart 2023-11-26  1469  		sd->internal_ops->init_state(sd, state);
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1470  		v4l2_subdev_unlock_state(state);
4c7fd566e013fd Laurent Pinchart 2023-11-26  1471  	}
ed647ea668fb27 Tomi Valkeinen   2022-04-12  1472  
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10 @1473  	if (ret < 0 && ret != -ENOIOCTLCMD)
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1474  		goto err;
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1475  
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1476  	return state;
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1477  
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1478  err:
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1479  	if (state && state->pads)
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1480  		kvfree(state->pads);
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1481  
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1482  	kfree(state);
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1483  
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  1484  	return ERR_PTR(ret);
9b02cbb3ede89b Laurent Pinchart 2015-04-24  1485  }
40aaab9d773b07 Tomi Valkeinen   2022-04-12  1486  EXPORT_SYMBOL_GPL(__v4l2_subdev_state_alloc);
9b02cbb3ede89b Laurent Pinchart 2015-04-24  1487  

:::::: The code at line 1473 was first introduced by commit
:::::: 0d346d2a6f54f06f36b224fd27cd6eafe8c83be9 media: v4l2-subdev: add subdev-wide state struct

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

