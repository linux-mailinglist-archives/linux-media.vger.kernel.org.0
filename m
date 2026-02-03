Return-Path: <linux-media+bounces-52074-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGN4OQmYgWl/HAMAu9opvQ
	(envelope-from <linux-media+bounces-52074-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 07:39:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DCAD55E3
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 07:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61F3830414D7
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 06:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2CF37F8C2;
	Tue,  3 Feb 2026 06:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxdJG8UM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5973037F736
	for <linux-media@vger.kernel.org>; Tue,  3 Feb 2026 06:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770100375; cv=none; b=OQ7xQ/Fro0UfB9XXyiWm/FQc+PeQkFFnHhRsCu8rBLs1KVhj9ffuous9EDgSBo9sD/d4CtPUPFL0IuYiXPPq0hae1Nr01uyOoNLPbgibaDeuEhJhuQyfXewWB1UZLNocfJH1vRrX6cQsPeEyOpWbEfzImJuZFaYwGe+TBOClyH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770100375; c=relaxed/simple;
	bh=dMKe25fzE9CiDCqS/4d/lX4jKHP3taTEZegImZXrpDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbFjsJo61kox+tSiIS0/5xrEGIyOe+J8AvQNHxvgu1jUHagP2idZKy71XX0V+OXOtkL3LSuqWFIok2ChwEmKCPjiM2q71GnxThh8IzdrrULp9KeuTEYPzVpIhUetvQEg7XMQqEVaoUc8e74o/63n7Lv+fi8/jDCBfzpW3x0BewU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxdJG8UM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770100373; x=1801636373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dMKe25fzE9CiDCqS/4d/lX4jKHP3taTEZegImZXrpDg=;
  b=BxdJG8UMnnIJsnCKNFZPnRDd9RPHTot+s4uqrxOYaILvm2nkmcogunMv
   eB7dPYldLz5sxWxTiDCg+0JAG9h0rH0wAgmJbWV29TxKNrNfQpVvtSzXX
   XSC/JJiHbiOp4PUfCbWmYsVlFkBAK/EpxhHkSH5d32uCq/aKPMYDSqJbt
   qKn/9vWAZJ1f+GnmE6AWTcSMZdiqetP2hPE7tnXfm3bqCBo26C+IIZvAn
   zq8yczDnCw0I8O6TTuncS9hRg69YwV6QId8T3s8AICYszNEsKAzRA8cAa
   Ob8kAXrT5jhrZXkeCYClnoHJ57AnTsulsjfClxx2t61hH8m4bmFA/yhFb
   g==;
X-CSE-ConnectionGUID: KC7PNlTiQa6VXDhTtAE5pg==
X-CSE-MsgGUID: Nk+jhksjSS6psWvI52OC+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="73861095"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="73861095"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 22:32:52 -0800
X-CSE-ConnectionGUID: vjJVegRrTVu2MW4my0qypg==
X-CSE-MsgGUID: a0JWM/USR+mA+gkLoArtYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="214289265"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Feb 2026 22:32:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vn9xw-00000000gLY-0PL9;
	Tue, 03 Feb 2026 06:32:48 +0000
Date: Tue, 3 Feb 2026 14:32:40 +0800
From: kernel test robot <lkp@intel.com>
To: Faizel K B <faizel.kb@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	libcamera-devel@lists.libcamera.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: Re: [PATCH v2 2/3] media: vimc: sensor: Add pixel_rate,vblank and
 hblank configuration
Message-ID: <202602031452.JzAaJ8BU-lkp@intel.com>
References: <20260202194645.1287757-3-faizel.kb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202194645.1287757-3-faizel.kb@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,lists.libcamera.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,ideasonboard.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52074-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: 93DCAD55E3
X-Rspamd-Action: no action

Hi Faizel,

kernel test robot noticed the following build errors:

[auto build test ERROR on c824345288d11e269ce41b36c105715bc2286050]

url:    https://github.com/intel-lab-lkp/linux/commits/Faizel-K-B/media-vimc-sensor-Move-vimc_sensor_device-to-common-header/20260203-035653
base:   c824345288d11e269ce41b36c105715bc2286050
patch link:    https://lore.kernel.org/r/20260202194645.1287757-3-faizel.kb%40gmail.com
patch subject: [PATCH v2 2/3] media: vimc: sensor: Add pixel_rate,vblank and hblank configuration
config: m68k-randconfig-r054-20260203 (https://download.01.org/0day-ci/archive/20260203/202602031452.JzAaJ8BU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602031452.JzAaJ8BU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031452.JzAaJ8BU-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/net/phy/air_en8811h.o: in function `en8811h_resume':
   drivers/net/phy/air_en8811h.c:1175:(.text+0x722): undefined reference to `clk_restore_context'
   m68k-linux-ld: drivers/net/phy/air_en8811h.o: in function `en8811h_suspend':
   drivers/net/phy/air_en8811h.c:1182:(.text+0x73a): undefined reference to `clk_save_context'
   m68k-linux-ld: drivers/media/test-drivers/vimc/vimc-sensor.o: in function `vimc_calc_vblank':
>> drivers/media/test-drivers/vimc/vimc-sensor.c:144:(.text+0x376): undefined reference to `__divdi3'


vim +144 drivers/media/test-drivers/vimc/vimc-sensor.c

   135	
   136	static u32 vimc_calc_vblank(u32 width, u32 height,
   137				    s64 pixel_rate, s32 hblank)
   138	{
   139		u32 hts = width + hblank;
   140		u32 target_fps;
   141		u32 vblank_def;
   142	
   143		target_fps = (width * height <= VIMC_PIXELS_THRESHOLD_30FPS) ? 30 : 10;
 > 144		vblank_def = (pixel_rate / (target_fps * hts)) - height;
   145		return clamp(vblank_def, VIMC_VBLANK_MIN, VIMC_VBLANK_MAX);
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

