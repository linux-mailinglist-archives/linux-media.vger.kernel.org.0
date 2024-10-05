Return-Path: <linux-media+bounces-19130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4130E991B78
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2024 02:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 795E61C2130E
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2024 00:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2442016191E;
	Sun,  6 Oct 2024 00:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7Q9W/NJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7544714A4C7;
	Sun,  6 Oct 2024 00:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728172836; cv=none; b=WCocqcaS+aMS+nvWNA7d9cLHECeZV2+/debmYzryLA8lk19VWngKpIZNRnedBGPGwJkWgnJRYtP+biiwyfE4qCKE1x2F1AhoelrWBcFuxPxvK1uens2arX8gqsi08eJZWyTWTstJ2Gdd3ITYYBFdYA2YJDbOMRzJY2mhJCnaHOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728172836; c=relaxed/simple;
	bh=Ft3LL+wdKU04UatgGFJbXK4DYo5bqn4YMXzhNK3e5Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RM/J93miRjND6gNwwKWF9Xqe3XoxBJGwfmun4z0bQI+b/R0JwWfKvFvgDWBVBocyHoqID1HeaZ7mWICEEoTbgW2n2ekQ1Dc3h3gzFjajyQ1zvFDNKHqO4ILQQM/h6iv7wz9lQIfPvYZbsBrh7ck5VHEGVoQNFvClJIvDIJqedsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7Q9W/NJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728172834; x=1759708834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ft3LL+wdKU04UatgGFJbXK4DYo5bqn4YMXzhNK3e5Vs=;
  b=a7Q9W/NJTUcCdPowC4PMWVp72oX8UcXXVH+KVF0zAFFZTfxZ4LSkDep4
   C0R3QD4er+DW7Bgw7pb5PPg4Qns01WcyUPG6GPVL3nTqJS+jQsQNcIovL
   ofl4H4EUS4vvzCs/ArL+qz/igf9ij/RS7qZCWPMqPR9Wi34apT1fAUvLw
   g2mRM+muVwNI9XVeNbaicKa/4NdrEFTojPVS+/8dUUgoPIINO+yg7g/0j
   YuFSgBL1GpUCDm37G1W8GkxOE1YZqoPFUerY+LYIQ8DJBVgz4oXDLvD/k
   Dz6rUP/JG3UbLhXlPOMb5Y8eAP0Z8/j/Ql0HDz07jPuIn8y4/bm9jj6aF
   w==;
X-CSE-ConnectionGUID: 06X+ql1oTHioTJhN7Ef+Jw==
X-CSE-MsgGUID: 6gG5nMniSMyJS34RVBfOdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="26823621"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="26823621"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 17:00:34 -0700
X-CSE-ConnectionGUID: oKwqKvbfTzWlDrwYog1H5Q==
X-CSE-MsgGUID: 1HmDh7qfRPqoe5LgdGtmmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="74657740"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Oct 2024 17:00:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxEhI-0003T0-2a;
	Sun, 06 Oct 2024 00:00:28 +0000
Date: Sun, 6 Oct 2024 07:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] v4l2-subdev: Return -EOPNOTSUPP for unsupported pad type
 in call_get_frame_desc()
Message-ID: <202410060640.ykY9JvqZ-lkp@intel.com>
References: <20240930074602.500968-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930074602.500968-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on sailus-media-tree/master linus/master v6.12-rc1 next-20241004]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/v4l2-subdev-Return-EOPNOTSUPP-for-unsupported-pad-type-in-call_get_frame_desc/20240930-154811
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240930074602.500968-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH] v4l2-subdev: Return -EOPNOTSUPP for unsupported pad type in call_get_frame_desc()
config: x86_64-randconfig-003-20241002 (https://download.01.org/0day-ci/archive/20241006/202410060640.ykY9JvqZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060640.ykY9JvqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060640.ykY9JvqZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-subdev.c:337:12: error: no member named 'entity' in 'struct v4l2_subdev'
     337 |         if (!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE))
         |               ~~  ^
   1 error generated.


vim +337 drivers/media/v4l2-core/v4l2-subdev.c

   330	
   331	static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
   332				       struct v4l2_mbus_frame_desc *fd)
   333	{
   334		unsigned int i;
   335		int ret;
   336	
 > 337		if (!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE))
   338			return -EOPNOTSUPP;
   339	
   340		memset(fd, 0, sizeof(*fd));
   341	
   342		ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
   343		if (ret)
   344			return ret;
   345	
   346		dev_dbg(sd->dev, "Frame descriptor on pad %u, type %s\n", pad,
   347			fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
   348			fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" :
   349			"unknown");
   350	
   351		for (i = 0; i < fd->num_entries; i++) {
   352			struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[i];
   353			char buf[20] = "";
   354	
   355			if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
   356				WARN_ON(snprintf(buf, sizeof(buf),
   357						 ", vc %u, dt 0x%02x",
   358						 entry->bus.csi2.vc,
   359						 entry->bus.csi2.dt) >= sizeof(buf));
   360	
   361			dev_dbg(sd->dev,
   362				"\tstream %u, code 0x%04x, length %u, flags 0x%04x%s\n",
   363				entry->stream, entry->pixelcode, entry->length,
   364				entry->flags, buf);
   365		}
   366	
   367		return 0;
   368	}
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

