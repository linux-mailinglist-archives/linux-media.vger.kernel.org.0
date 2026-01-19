Return-Path: <linux-media+bounces-51068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAF5D3B041
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 17:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 333D730194D3
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 16:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766E22DC78D;
	Mon, 19 Jan 2026 16:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mz/hCNh4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0120E1F3BA2
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 16:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839480; cv=none; b=uAhVH2uOvb9Q8DsmsIg7FAG5su+uPXiER/iB+C8KGe473d/y4xwigMok3b6ZnDqFa6+XifTVsjTlcLyB3XvSGRj1W2MJSn52u07HYDIO5wwO2IhlTsg6sythpwE4lPXBShn9FTK16N8onVJP3d3lNNx4DtnBXnWbvDhKGmoMFGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839480; c=relaxed/simple;
	bh=ZyyCSvAHsQZEnq3v70lc44LdXO7guHq1mCT0tNZVoTw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RW+MPsXi6AUdGzQQlfMlyx+XFdV7iu4IGllr5M/Q6bEwK9hOZK7I5gIDpigJg9AQE5568DhNtjlquEq22f7iftaKbY1lCUYlWHqSbweDHmb16HZWJgEc/+EQdbywEsnxdzgiaSvRCekr/5ADbODJ8l6iiynAPBGcM9vBiS1q0As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mz/hCNh4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768839478; x=1800375478;
  h=date:from:to:cc:subject:message-id;
  bh=ZyyCSvAHsQZEnq3v70lc44LdXO7guHq1mCT0tNZVoTw=;
  b=Mz/hCNh4XkqdD46s+yGlfh1caIV+fRKjIYRF0BnUU0iwq+TXFnBoXjEE
   aRg2smysjsGqXmIyZOJUlEs7RccvJe8DqRJHAgfCo3vR57Md7FunonexM
   gM71qxDueZUujw8FWjmOUnIlvu4Rt36NcsOeQOhC0gkY44by2Q1AygFfY
   m5fBmVo4sXnX96L7f2TOxxkz6uaA+7LkJUh+JefpvCtaYIRfGW1tyJb08
   oA03AkrrkFcPx9TttcXK9lxvZpZAoTYFbJ03/iF5RV3tnoLMKRLLMUXYD
   Ds7bems3BRpdyuIyveQbN/HJNwM9aiU6xsN/6udRdAwl0SQBkqPmqgzMW
   w==;
X-CSE-ConnectionGUID: tIvPjlZiTQ6B4Hb98VgmLw==
X-CSE-MsgGUID: vWaNg3ARR8G7hD2EpV58og==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69253696"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="69253696"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:17:58 -0800
X-CSE-ConnectionGUID: pYus70LYSfe3NfvzXXWH/Q==
X-CSE-MsgGUID: FhsUkY/BSzOvp+cPOs481Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jan 2026 08:17:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhrwv-00000000O1p-0QU5;
	Mon, 19 Jan 2026 16:17:53 +0000
Date: Tue, 20 Jan 2026 00:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 90/113]
 drivers/media/v4l2-core/v4l2-subdev.c:2675:55: warning: overlapping
 comparisons always evaluate to true
Message-ID: <202601200019.peMSxK0X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   55ba38aaeb6e07cbbbe550578fa4737b05de1d00
commit: 50fcff1c16cac7152a1b5b56a71656e97d276857 [90/113] media: v4l2-subdev: Introduce v4l2_subdev_get_frame_desc()
config: sparc64-randconfig-r071-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200019.peMSxK0X-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200019.peMSxK0X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200019.peMSxK0X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-subdev.c:2675:55: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]
    2675 |         if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
    2676 |             desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +2675 drivers/media/v4l2-core/v4l2-subdev.c

  2659	
  2660	int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
  2661				       struct v4l2_mbus_frame_desc *desc)
  2662	{
  2663		if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
  2664			unsigned int type = desc->type;
  2665			int ret;
  2666	
  2667			ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
  2668	
  2669			if (desc->type != type)
  2670				return -EINVAL;
  2671	
  2672			return ret;
  2673		}
  2674	
> 2675		if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ||

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

