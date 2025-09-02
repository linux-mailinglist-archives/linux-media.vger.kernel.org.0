Return-Path: <linux-media+bounces-41593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FB1B405BC
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 15:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F7E4202ACE
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 13:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E10532ED37;
	Tue,  2 Sep 2025 13:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xu+XyuDc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1460532C336
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756820825; cv=none; b=d0isYIi6MeSbABg/kZzqMMmLs5YAGZ9qcm6sn7SojGORDNvZJPlsiem/BsiNUyLsjn4pycA0wlzA6Tgx0Oa7O5ceuJBdoW+/9RJb/3uG7AwKWCDYVe4NgoPZ9LhseNigQNMtWaWJzef11kGVRPAgYDSaIMs6j6MCv3iUbTmyLUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756820825; c=relaxed/simple;
	bh=y8Aaks2rnTCouTsa1CsUny38MHkkSl/Alem6UcmdZag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fdmoahFseg5Ooo9qvC//YHC+KnG4nsx9t3mVWF9/YOK6b78zPH4yevXC3pd9tf5tJD3u59e5Czr3LT10lv1pBnhCc+bpIGiz96hwp2YZRbARezvMq1tz0+/GgEvU0tqA9dAlGN4fTsLSwOAxuKA0A1VzqyhqPhS+1E7NX7Etw/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xu+XyuDc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756820824; x=1788356824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y8Aaks2rnTCouTsa1CsUny38MHkkSl/Alem6UcmdZag=;
  b=Xu+XyuDc+Hf1BvSCEjHCfk35Kk1Wf2aALGfJ8InFhecpj/zHldrdQ25F
   QCmoBmkESt9gKFVyf7pVOc1WhSObzyatvTqW5ea5WFl8ZB835wuPVVI68
   GUahPX7ohOpOIZb6wRTyj/nPCWuhJtloIECgOkATCBJvZozWZjUbZyk2s
   2zFUcli1aVboQSPep3xmlMPKEsLafmx6JEO4iz+VwazXPGAOrLScWMh1n
   s7yk7ikRNtdAw7raJ+cXfIwdtWrN1QHVCdxXM5WglnPA5Kp+MbC0r/b2H
   45zoDzltOtsXJp4zcW4eKU27lTgfh9ZyC3mVqNbQ8f3ACBeK0AMX4unGb
   w==;
X-CSE-ConnectionGUID: HLJwoBr0T/WAgupAWAU2lw==
X-CSE-MsgGUID: JRp9uyAOReOvSUXXiA+LHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="61735146"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="61735146"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 06:47:02 -0700
X-CSE-ConnectionGUID: 9tLHy2i6ShyG+ghwcB79DQ==
X-CSE-MsgGUID: CRD0ITYQS9uyJcg6divbxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="175648257"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Sep 2025 06:47:01 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utRLe-0002TB-1S;
	Tue, 02 Sep 2025 13:46:58 +0000
Date: Tue, 2 Sep 2025 21:46:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 76/77]
 drivers/media/v4l2-core/v4l2-subdev.c:2292:14: warning: variable 'is_source'
 set but not used
Message-ID: <202509022128.hDkCkWCt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   dbb6c78ee163822abba87ee352b67b7cfec3a023
commit: df6177be8173130bd39345bb16da0bd2a8787470 [76/77] source
config: i386-buildonly-randconfig-003-20250902 (https://download.01.org/0day-ci/archive/20250902/202509022128.hDkCkWCt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509022128.hDkCkWCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509022128.hDkCkWCt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-subdev.c: In function 'v4l2_subdev_enable_streams':
>> drivers/media/v4l2-core/v4l2-subdev.c:2292:14: warning: variable 'is_source' set but not used [-Wunused-but-set-variable]
    2292 |         bool is_source = true;
         |              ^~~~~~~~~


vim +/is_source +2292 drivers/media/v4l2-core/v4l2-subdev.c

  2282	
  2283	int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
  2284				       u64 streams_mask)
  2285	{
  2286		struct device *dev = sd->entity.graph_obj.mdev->dev;
  2287		struct v4l2_subdev_state *state;
  2288		u64 enabled_streams;
  2289		u64 found_streams;
  2290		bool already_streaming;
  2291		bool use_s_stream;
> 2292		bool is_source = true;
  2293		int ret;
  2294	
  2295		dev_dbg(dev, "enable streams \"%s\":%u/%#llx\n", sd->entity.name, pad,
  2296			streams_mask);
  2297	
  2298		/* A few basic sanity checks first. */
  2299		if (pad >= sd->entity.num_pads)
  2300			return -EINVAL;
  2301	
  2302		if (!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE))
  2303			return -EOPNOTSUPP;
  2304	
  2305		/*
  2306		 * We use a 64-bit bitmask for tracking enabled pads, so only subdevices
  2307		 * with 64 pads or less can be supported.
  2308		 */
  2309		if (pad >= sizeof(sd->enabled_pads) * BITS_PER_BYTE)
  2310			return -EOPNOTSUPP;
  2311	
  2312		if (!streams_mask)
  2313			return 0;
  2314	
  2315		/* Fallback on .s_stream() if .enable_streams() isn't available. */
  2316		use_s_stream = !v4l2_subdev_has_op(sd, pad, enable_streams);
  2317	
  2318		/* Figure out if the sub-device is a source sub-device. */
  2319		for (unsigned int i = 0; i < sd->entity.num_pads; i++) {
  2320			if (!(sd->entity.pads[i].flags & MEDIA_PAD_FL_SINK))
  2321				continue;
  2322	
  2323			is_source = false;
  2324			break;
  2325		}
  2326	
  2327		if (!use_s_stream)
  2328			state = v4l2_subdev_lock_and_get_active_state(sd);
  2329		else
  2330			state = NULL;
  2331	
  2332		/*
  2333		 * Verify that the requested streams exist and that they are not
  2334		 * already enabled.
  2335		 */
  2336	
  2337		v4l2_subdev_collect_streams(sd, state, pad, streams_mask,
  2338					    &found_streams, &enabled_streams);
  2339	
  2340		if (found_streams != streams_mask) {
  2341			dev_dbg(dev, "streams 0x%llx not found on %s:%u\n",
  2342				streams_mask & ~found_streams, sd->entity.name, pad);
  2343			ret = -EINVAL;
  2344			goto done;
  2345		}
  2346	
  2347		if (enabled_streams) {
  2348			dev_dbg(dev, "streams 0x%llx already enabled on %s:%u\n",
  2349				enabled_streams, sd->entity.name, pad);
  2350			ret = -EALREADY;
  2351			goto done;
  2352		}
  2353	
  2354		already_streaming = v4l2_subdev_is_streaming(sd);
  2355	
  2356		if (!use_s_stream) {
  2357			/* Call the .enable_streams() operation. */
  2358			ret = v4l2_subdev_call(sd, pad, enable_streams, state, pad,
  2359					       streams_mask);
  2360		} else {
  2361			/* Start streaming when the first pad is enabled. */
  2362			if (!already_streaming)
  2363				ret = v4l2_subdev_call(sd, video, s_stream, 1);
  2364			else
  2365				ret = 0;
  2366		}
  2367	
  2368		if (ret) {
  2369			dev_dbg(dev, "enable streams %u:%#llx failed: %d\n", pad,
  2370				streams_mask, ret);
  2371			goto done;
  2372		}
  2373	
  2374		/* Mark the streams as enabled. */
  2375		v4l2_subdev_set_streams_enabled(sd, state, pad, streams_mask, true);
  2376	
  2377		/*
  2378		 * TODO: When all the drivers have been changed to use
  2379		 * v4l2_subdev_enable_streams() and v4l2_subdev_disable_streams(),
  2380		 * instead of calling .s_stream() operation directly, we can remove
  2381		 * the privacy LED handling from call_s_stream() and do it here
  2382		 * for all cases.
  2383		 */
  2384		if (!use_s_stream && !already_streaming)
  2385			v4l2_subdev_enable_privacy_led(sd);
  2386	
  2387	done:
  2388		if (!use_s_stream)
  2389			v4l2_subdev_unlock_state(state);
  2390	
  2391		return ret;
  2392	}
  2393	EXPORT_SYMBOL_GPL(v4l2_subdev_enable_streams);
  2394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

