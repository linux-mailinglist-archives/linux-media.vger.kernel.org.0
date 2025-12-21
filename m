Return-Path: <linux-media+bounces-49268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE89CD464E
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 23:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 915C93006604
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 22:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F2E234966;
	Sun, 21 Dec 2025 22:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2u5tljV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6611F09A5
	for <linux-media@vger.kernel.org>; Sun, 21 Dec 2025 22:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766357305; cv=none; b=QaQq97c9x4e0gCAg1ni6WM34nxsjpvaxZYOJuSXPmJT2+HzmRPD8W/W2J0+VU3kXdw3N44WxE6yNPpbo+J+OGRox1PChVW8EDVf0dzvMBCHU/1HmcQf8izncZHXxaw7q/CI0vvJsyn58VvmX8/XuUxnjII1iL/MtJ5nn5frXyzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766357305; c=relaxed/simple;
	bh=gwNtwzbfk3ilrx18MzeaOFOVVXPqll0tpDxe9KR0gOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i52gsO7CK4eQ6XHWsdwrvgQNTkWdjZGke/HkbKD9qvKq+Y48abkYFOZRdttzdEYCUK0YZ0Z6a21HeaKLKbVOXlUr8gUH6two2oHCAwHXCTujyXn54yUb3MhXzZqAkjTjzZYcCczbTrojk65BUFTWKsk9nzspaLyZTwjUvYDkWsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2u5tljV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766357303; x=1797893303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gwNtwzbfk3ilrx18MzeaOFOVVXPqll0tpDxe9KR0gOU=;
  b=L2u5tljVB4U9fDa2WbP4Nk/diX7XzBN3VE3MiZ39lzIZBq4uOpQQVsa9
   31/pGUNUnPLcjpKChtNiiUwhrXEbhBY8/9GQAVhiAZaqGXRaAYejo/gOS
   BQEwtCUACUVV7/2sC7LNY1flPr4/0yqyrKCDQheTfEEJR9FteYwyh1dTU
   djQM9lwxIPkOeD0JVrkU0DGVb0mPPipPVDE+h5BhZ23Ob4ZrUbof8nlhs
   /AD3QGdDaGrzjXuepQVAfzMq3Ad6TLSTXWsWIlxrsm5klNNSiUFpgDZ0c
   f17k+KkijMO++m7BkAla4EgnGtPqjqkX69S1yRdB+BN7+/+Ddmz7bsq+2
   A==;
X-CSE-ConnectionGUID: CDiscUCKR+WEVdje49J2MA==
X-CSE-MsgGUID: orjznegURLKUUdnHYjZCmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78938942"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78938942"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 14:48:23 -0800
X-CSE-ConnectionGUID: D5VjtRPHR/+D5/u7GJPdkA==
X-CSE-MsgGUID: PukYKP5VQ6m1+nzOdrxrmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="198532541"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2025 14:48:21 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXSDp-000000000G9-3voY;
	Sun, 21 Dec 2025 22:48:17 +0000
Date: Mon, 22 Dec 2025 06:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: Re: [PATCH 12/13] media: ipu6: Drop custom functions to obtain sd
 state information
Message-ID: <202512220626.VOKkPjwN-lkp@intel.com>
References: <20251219095829.2830843-13-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219095829.2830843-13-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on media-tree/master sailus-media-tree/master linus/master v6.19-rc1 next-20251219]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-ipu6-Ensure-stream_mutex-is-acquired-when-dealing-with-node-list/20251219-180136
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20251219095829.2830843-13-sakari.ailus%40linux.intel.com
patch subject: [PATCH 12/13] media: ipu6: Drop custom functions to obtain sd state information
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251222/202512220626.VOKkPjwN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220626.VOKkPjwN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220626.VOKkPjwN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:449:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     449 |         if (ret) {
         |             ^~~
   drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:433:9: note: initialize the variable 'ret' to silence this warning
     433 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +449 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c

3c1dfb5a69cf836 Bingbu Cao   2024-01-31  423  
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  424  static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  425  {
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  426  	struct v4l2_mbus_framefmt format;
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  427  	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  428  	struct device *dev = &av->isys->adev->auxdev.dev;
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  429  	struct media_pad *remote_pad =
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  430  		media_pad_remote_pad_first(av->vdev.entity.pads);
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  431  	struct v4l2_subdev *sd;
d3bd039cd2a0098 Bingbu Cao   2024-01-31  432  	u32 r_stream, code;
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  433  	int ret;
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  434  
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  435  	if (!remote_pad)
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  436  		return -ENOTCONN;
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  437  
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  438  	sd = media_entity_to_v4l2_subdev(remote_pad->entity);
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  439  	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, remote_pad->index);
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  440  
627086672dc7e15 Sakari Ailus 2025-12-19  441  	struct v4l2_subdev_state *state =
627086672dc7e15 Sakari Ailus 2025-12-19  442  		v4l2_subdev_lock_and_get_active_state(sd);
627086672dc7e15 Sakari Ailus 2025-12-19  443  
627086672dc7e15 Sakari Ailus 2025-12-19  444  	format = *v4l2_subdev_state_get_format(state, remote_pad->index,
627086672dc7e15 Sakari Ailus 2025-12-19  445  					       r_stream);
627086672dc7e15 Sakari Ailus 2025-12-19  446  
627086672dc7e15 Sakari Ailus 2025-12-19  447  	v4l2_subdev_unlock_state(state);
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  448  
3c1dfb5a69cf836 Bingbu Cao   2024-01-31 @449  	if (ret) {
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  450  		dev_dbg(dev, "failed to get %s: pad %d, stream:%d format\n",
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  451  			sd->entity.name, remote_pad->index, r_stream);
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  452  		return ret;
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  453  	}
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  454  
d3bd039cd2a0098 Bingbu Cao   2024-01-31  455  	if (format.width != ipu6_isys_get_frame_width(av) ||
d3bd039cd2a0098 Bingbu Cao   2024-01-31  456  	    format.height != ipu6_isys_get_frame_height(av)) {
4ff61c4ce93677c Sakari Ailus 2024-05-02  457  		dev_dbg(dev, "wrong width or height %ux%u (%ux%u expected)\n",
d3bd039cd2a0098 Bingbu Cao   2024-01-31  458  			ipu6_isys_get_frame_width(av),
d3bd039cd2a0098 Bingbu Cao   2024-01-31  459  			ipu6_isys_get_frame_height(av), format.width,
d3bd039cd2a0098 Bingbu Cao   2024-01-31  460  			format.height);
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  461  		return -EINVAL;
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  462  	}
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  463  
d3bd039cd2a0098 Bingbu Cao   2024-01-31  464  	code = ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0)->code;
d3bd039cd2a0098 Bingbu Cao   2024-01-31  465  	if (format.code != code) {
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  466  		dev_dbg(dev, "wrong mbus code 0x%8.8x (0x%8.8x expected)\n",
d3bd039cd2a0098 Bingbu Cao   2024-01-31  467  			code, format.code);
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  468  		return -EINVAL;
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  469  	}
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  470  
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  471  	return 0;
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  472  }
3c1dfb5a69cf836 Bingbu Cao   2024-01-31  473  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

