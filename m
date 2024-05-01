Return-Path: <linux-media+bounces-10514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A51B8B8597
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 08:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A63B51C221A3
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 06:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F85F2C853;
	Wed,  1 May 2024 06:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgqyxJ+C"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C099A41
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 06:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714545196; cv=none; b=qk6kvusGcF76AKcEofNVpUbhcpA+NUVvZbEuHKT8G6lUzr/4B7qjBYHGHA0qy3PlBiOl330+89iadMSEhfqzS52cG0/2PzVu4XtwJDhv+dbw/crDO61XfqSxZC/KJ6TGjpQbTAboNjzqbVhHB9Wz5w+WEKq9Arro4T11RbsZpxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714545196; c=relaxed/simple;
	bh=jQO/TmwWk2dCVpYwFd2oHA4m0GWO86c+24N3JtCnV8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TzcjzQVAfURIzZin4fKF3H9DQvnJIPupCDjwBaXiIbfmVUWXAyWqhUcvA/S/eW1LrVvJ0+Q3is6cY9uYuTWsPWNJaT0AbKP5Y0xo3GO49GuXxh+QPvjuKmwbguCWKK677e1zzbRwr8FGV1zfu32pjmKIOyl4r7P2lT/EfCNX0kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BgqyxJ+C; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714545195; x=1746081195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jQO/TmwWk2dCVpYwFd2oHA4m0GWO86c+24N3JtCnV8w=;
  b=BgqyxJ+CWODiTELxkmSesJQ9xkAlDppW7bkN9uTWm950fJMoGVQBI74M
   48Q1Jw8D3iwqR88TkNybPDBosaJL+pSTDMGxH/4V3NTl5t/gchQNDKtUR
   Xj06dxKjb2wzDAQbN6kSTnjjb+eLfROUa52PwbHjIhXikQqd3pNGErajk
   srCiE35UILxi0EbPtfsiPOOFiPaASD26qpWDBlt8c/4aXNdejNoVXCWWl
   YYAe16HnpQcbeD8BTgyrKWwXLQQPGSgcXgI3jAJ4cHexS205hfbPtA2vT
   kCl3yuMsK6JrvsOpMz/MV9jmYy0sJ6qWrorlInIG+M6R418SLyH3xLgBF
   Q==;
X-CSE-ConnectionGUID: YfCEerW8Sh6Ud9hwwoO0Qg==
X-CSE-MsgGUID: 2ziQrUydQvmEoG6NtFBeZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14050420"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="14050420"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 23:33:15 -0700
X-CSE-ConnectionGUID: WqKJG/dVT2OYyLwsfXxpzg==
X-CSE-MsgGUID: ptQHL7/oQWe5AvIOz4ZygQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="31414414"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Apr 2024 23:33:14 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s23Wh-0008zg-0n;
	Wed, 01 May 2024 06:33:11 +0000
Date: Wed, 1 May 2024 14:32:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6 40/50]
 drivers/media/v4l2-core/v4l2-common.c:512:23: error: implicit declaration of
 function 'v4l2_subdev_call_op'; did you mean 'v4l2_subdev_has_op'?
Message-ID: <202405011421.mkr5FHdn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git ipu6
head:   308898eb3af1c6530b122a01a5c4b38931717e70
commit: 68213f72d8c806ff6968fb30c4bf61fd1257c4a3 [40/50] media: v4l: Support obtaining link frequency via get_mbus_config
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240501/202405011421.mkr5FHdn-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405011421.mkr5FHdn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405011421.mkr5FHdn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-common.c: In function '__v4l2_get_link_freq':
>> drivers/media/v4l2-core/v4l2-common.c:512:23: error: implicit declaration of function 'v4l2_subdev_call_op'; did you mean 'v4l2_subdev_has_op'? [-Werror=implicit-function-declaration]
     512 |                 ret = v4l2_subdev_call_op(sd, pad, get_mbus_config,
         |                       ^~~~~~~~~~~~~~~~~~~
         |                       v4l2_subdev_has_op
>> drivers/media/v4l2-core/v4l2-common.c:512:47: error: 'pad' undeclared (first use in this function); did you mean 'pid'?
     512 |                 ret = v4l2_subdev_call_op(sd, pad, get_mbus_config,
         |                                               ^~~
         |                                               pid
   drivers/media/v4l2-core/v4l2-common.c:512:47: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/media/v4l2-core/v4l2-common.c:512:52: error: 'get_mbus_config' undeclared (first use in this function); did you mean 'mbus_config'?
     512 |                 ret = v4l2_subdev_call_op(sd, pad, get_mbus_config,
         |                                                    ^~~~~~~~~~~~~~~
         |                                                    mbus_config
   In file included from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/media/v4l2-core/v4l2-common.c:37:
   drivers/media/v4l2-core/v4l2-common.c: At top level:
   drivers/media/v4l2-core/v4l2-common.c:522:19: error: 'v4l2_get_link_freq' undeclared here (not in a function)
     522 | EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:23: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c:522:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     522 | EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
         | ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +512 drivers/media/v4l2-core/v4l2-common.c

   466	
   467	s64 __v4l2_get_link_freq(struct v4l2_subdev *sd,
   468				 struct v4l2_ctrl_handler *handler, unsigned int mul,
   469				 unsigned int div)
   470	{
   471		struct v4l2_ctrl *ctrl;
   472		s64 freq;
   473	
   474		if (!handler && sd)
   475			handler = sd->ctrl_handler;
   476	
   477		ctrl = v4l2_ctrl_find(handler, V4L2_CID_LINK_FREQ);
   478		if (ctrl) {
   479			struct v4l2_querymenu qm = { .id = V4L2_CID_LINK_FREQ };
   480			int ret;
   481	
   482			if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64)
   483				return v4l2_ctrl_g_ctrl_int64(ctrl);
   484	
   485			qm.index = v4l2_ctrl_g_ctrl(ctrl);
   486	
   487			ret = v4l2_querymenu(handler, &qm);
   488			if (ret)
   489				return -ENOENT;
   490	
   491			freq = qm.value;
   492		} else {
   493			if (!mul || !div)
   494				return -ENOENT;
   495	
   496			ctrl = v4l2_ctrl_find(handler, V4L2_CID_PIXEL_RATE);
   497			if (!ctrl)
   498				return -ENOENT;
   499	
   500			freq = div_u64(v4l2_ctrl_g_ctrl_int64(ctrl) * mul, div);
   501	
   502			pr_warn("%s: Link frequency estimated using pixel rate: result might be inaccurate\n",
   503				__func__);
   504			pr_warn("%s: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver\n",
   505				__func__);
   506		}
   507	
   508		if (freq <= 0 && sd) {
   509			struct v4l2_mbus_config mbus_config = {};
   510			int ret;
   511	
 > 512			ret = v4l2_subdev_call_op(sd, pad, get_mbus_config,
   513						  &mbus_config);
   514			if (ret < 0)
   515				return ret;
   516	
   517			return mbus_config.link_freq;
   518		}
   519	
   520		return freq > 0 ? freq : -EINVAL;
   521	}
   522	EXPORT_SYMBOL_GPL(v4l2_get_link_freq);
   523	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

