Return-Path: <linux-media+bounces-35265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C506AE0422
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 13:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBE783B39D0
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 11:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0A222A4FA;
	Thu, 19 Jun 2025 11:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZJK6xr7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF94221546
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333372; cv=none; b=oUA+R3e7Lh/5cbRbVtXhU2m1Y+zjRrZ/2cfrmsaaF/llVaGUHrjEoNIFVpdexdbZfQ0187ne7bIZWnFG0pbT1/FN8SAvP9nbPeqbFDw04k4w0ZLSQ+bCc0hwlRrhF084nX9chsG+cNCG36X0KdpH+GmVnktdwatNMboK1RVUjYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333372; c=relaxed/simple;
	bh=2ism8y0cRz7WJYenvmkZZDJKu1qgRT/2vxnWwJvHrQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXyJq/MY2FO07+0gTjolfietfG5J9O/8FXtG+bLfxMEzka1CIlEzZznlmVerz3v913y9X8r1Qgh1gMcsbWr2yQUQpblbHEOhiwvFARr0oeywWpVdJ/70JJjw+rhdaC2cuRQJRq1RBsRjcJYpeta8FCF82XvLrY1pOu4WegX1IVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZJK6xr7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750333371; x=1781869371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2ism8y0cRz7WJYenvmkZZDJKu1qgRT/2vxnWwJvHrQk=;
  b=lZJK6xr7h9vy122Z1PHyTo1u239rWYwa8JTY1xVBF7JGpREPVf4Bt6jH
   ccHMZRP4En/aD/C6brJz+vdbiOf5oOHDWdq3i/sFD+urHXXXEwN0tGWdc
   2GUIdDqBz66gMN4flNog6sZNVsFkKbTdVrG2PAe/hXDS02P9JTWB+iSwT
   duOltgIGdRIeaLWpxQumzlrqeCKHmNIZ/WQ4VX7eLdz6Q5+URU62yAiPH
   fbUvWyjlz4FwSaXI4rUNmeetuHVk06a8vzL7xpOsdxhYBGLNR1lCJIAlo
   WeKZtXh3K+ngYqIJXcmex35l1uEs6aSmD+IbnflWCzVCYuPTuKXzNl/9L
   g==;
X-CSE-ConnectionGUID: 9QR9tDyHQhqx9FZBYhMeqw==
X-CSE-MsgGUID: tyl4QxrpSjCYCbs2Dkp/9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52506612"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52506612"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:42:50 -0700
X-CSE-ConnectionGUID: agQUC5ZGR5i8jJeQKYG+PA==
X-CSE-MsgGUID: +cRIp3xeSQOWTmN35xDE7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="156114776"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jun 2025 04:42:48 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSDfJ-000Khi-2t;
	Thu, 19 Jun 2025 11:42:45 +0000
Date: Thu, 19 Jun 2025 19:42:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	bingbu.cao@linux.intel.com, stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com, tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 12/13] media: v4l2-mc: Introduce
 v4l2_mc_pipeline_enabled()
Message-ID: <202506191934.t9FEXlhl-lkp@intel.com>
References: <20250619081546.1582969-13-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619081546.1582969-13-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on linus/master media-tree/master v6.16-rc2 next-20250618]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-ipu6-Use-correct-pads-for-xlate_streams/20250619-161847
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250619081546.1582969-13-sakari.ailus%40linux.intel.com
patch subject: [PATCH 12/13] media: v4l2-mc: Introduce v4l2_mc_pipeline_enabled()
config: x86_64-buildonly-randconfig-003-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191934.t9FEXlhl-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191934.t9FEXlhl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191934.t9FEXlhl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-mc.c:622:6: warning: variable 'src_streams' set but not used [-Wunused-but-set-variable]
     622 |         u64 src_streams = 0, sink_streams = 0;
         |             ^
>> drivers/media/v4l2-core/v4l2-mc.c:732:44: warning: variable 'source_stream' is uninitialized when used here [-Wuninitialized]
     732 |         return v4l2_mc_downpath_enabled(sink_pad, source_stream, func,
         |                                                   ^~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-mc.c:671:19: note: initialize the variable 'source_stream' to silence this warning
     671 |         u32 source_stream;
         |                          ^
         |                           = 0
   2 warnings generated.


vim +/src_streams +622 drivers/media/v4l2-core/v4l2-mc.c

   615	
   616	static int
   617	__v4l2_mc_pipeline_enabled(struct v4l2_subdev_state *state,
   618				   struct media_pad *src_pad, u64 __src_streams,
   619				   struct media_pad **__sink_pad, u64 *__sink_streams)
   620	{
   621		struct v4l2_subdev_route *route;
 > 622		u64 src_streams = 0, sink_streams = 0;
   623		bool has_sink_pad = false;
   624		unsigned int sink_pad;
   625	
   626		dev_dbg(state->sd->dev, "%s: source enabled, pad/streams %u/%#llx\n",
   627			state->sd->entity.name, src_pad->index, __src_streams);
   628		for_each_active_route(&state->routing, route) {
   629			dev_dbg(state->sd->dev, "%s: %u/%u -> %u/%u, flags %x\n",
   630				state->sd->entity.name,
   631				route->sink_pad, route->sink_stream, route->source_pad,
   632				route->source_stream, route->flags);
   633			if (route->source_pad != src_pad->index)
   634				continue;
   635	
   636			if (!(BIT_ULL(route->source_stream) & __src_streams))
   637				continue;
   638	
   639			if (!has_sink_pad) {
   640				has_sink_pad = true;
   641				sink_pad = route->sink_pad;
   642			}
   643	
   644			if (route->sink_pad != sink_pad) {
   645				dev_dbg(state->sd->dev,
   646					"sink pads (%u vs. %u) differ\n",
   647					route->sink_pad, sink_pad);
   648				return -EMLINK;
   649			}
   650	
   651			sink_streams |= BIT_ULL(route->sink_stream);
   652			src_streams |= BIT_ULL(route->source_stream);
   653		}
   654	
   655		*__sink_pad = has_sink_pad ? &state->sd->entity.pads[sink_pad] : NULL;
   656		*__sink_streams = sink_streams;
   657	
   658		return 0;
   659	}
   660	
   661	static int v4l2_mc_downpath_enabled(struct media_pad *sink_pad,
   662					    unsigned int sink_stream,
   663					    bool (*func)(struct video_device *vdev),
   664					    struct media_pad **__sink_pad,
   665					    u64 *__sink_streams)
   666	{
   667		struct v4l2_subdev_state *state;
   668		struct v4l2_subdev_route *route;
   669		struct v4l2_subdev *sd;
   670		struct media_pad *source_pad, *tmp_pad;
   671		u32 source_stream;
   672	
   673		if (!is_media_entity_v4l2_subdev(sink_pad->entity))
   674			return -ENXIO;
   675	
   676		sd = media_entity_to_v4l2_subdev(sink_pad->entity);
   677		dev_dbg(sd->dev, "path_enabled: found sub-device %s\n",
   678			sd->entity.name);
   679	
   680		state = v4l2_subdev_lock_and_get_active_state(sd);
   681		route = v4l2_subdev_find_route(&state->routing, sink_pad->index,
   682					       sink_stream, true, 0);
   683		if (IS_ERR(route)) {
   684			v4l2_subdev_unlock_state(state);
   685			dev_dbg(sd->dev,
   686				"path_enabled: can't find opposite route for %s:%u/%u",
   687				sd->entity.name, sink_pad->index, sink_stream);
   688			return 2;
   689		}
   690	
   691		source_pad = &sd->entity.pads[route->source_pad];
   692		v4l2_subdev_unlock_state(state);
   693	
   694		tmp_pad = sink_pad;
   695		sink_pad = media_pad_remote_pad_unique(source_pad);
   696		if (IS_ERR(sink_pad)) {
   697			dev_dbg(sd->dev,
   698				"path_enabled: can't find remote source for %s:%u\n",
   699				source_pad->entity->name, source_pad->index);
   700			return PTR_ERR(sink_pad);
   701		}
   702	
   703		if (is_media_entity_v4l2_video_device(sink_pad->entity)) {
   704			struct video_device *vdev;
   705	
   706			vdev = media_entity_to_video_device(sink_pad->entity);
   707			if (!vdev)
   708				return -ENXIO;
   709	
   710			dev_dbg(vdev->dev_parent,
   711				"path_enabled: found video device %s\n",
   712				vdev->name);
   713	
   714			if (!*__sink_pad) {
   715				*__sink_pad = tmp_pad;
   716				dev_dbg(sd->dev, "path_enabled: sink %u/%u\n",
   717					tmp_pad->index, sink_stream);
   718			} else if (tmp_pad != *__sink_pad) {
   719				dev_dbg(sd->dev,
   720					"path_enabled: pads %s/%u and %s/%u differ\n",
   721					tmp_pad->entity->name, tmp_pad->index,
   722					(*__sink_pad)->entity->name,
   723					(*__sink_pad)->index);
   724				return -EXDEV;
   725			}
   726	
   727			*__sink_streams |= BIT_ULL(sink_stream);
   728	
   729			return func(vdev);
   730		}
   731	
 > 732		return v4l2_mc_downpath_enabled(sink_pad, source_stream, func,
   733						__sink_pad, __sink_streams);
   734	}
   735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

