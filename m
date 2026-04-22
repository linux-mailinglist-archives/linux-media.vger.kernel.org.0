Return-Path: <linux-media+bounces-59343-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOHkCs/d6GnOQwIAu9opvQ
	(envelope-from <linux-media+bounces-59343-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 16:40:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C7A4475A9
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 16:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C2053300B44B
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8582B3EE1FE;
	Wed, 22 Apr 2026 14:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMRqXCdu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDC93EDAAF;
	Wed, 22 Apr 2026 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776868675; cv=none; b=IcR2V/NP2c2DByXmwG0bvsNjVZhdbRdP5roVAdUmBjlY7wweNXEs65dqvx3sNkYHvEsYMa2U6MnWjZo5H58IpvOF5i7PFb9ZEOxogjjliMGLQhB+MUb2xXhlQ3yzOZJcwNKB8ZtlTixTfP1W73mwsfGRt5jE5uTAn8znPX2dTMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776868675; c=relaxed/simple;
	bh=Q+/Y3uof2gboc2NflIGcvS3qG5DN4A4q7ebVhP1HFAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hit52/u3GtAKfFd10GNIyGmvanR1XJ0SUFCQqk0iTA7fMGDou5x7kN7HDdFsiGVDQd/QOu9BsVPtLayzPHkcs4aIMpD3tM7S5YSV6uNMaXX3Yb4CS6SUazaWmPFMNgXYV/LYaIj3lYXyVl7R3yidryNiYpvbT//5n8N2PKtwnbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMRqXCdu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776868673; x=1808404673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q+/Y3uof2gboc2NflIGcvS3qG5DN4A4q7ebVhP1HFAM=;
  b=gMRqXCduoTjdrW2DuMMQFG1f46AQ8kwIP2kEr4FOWh6HM8otXkKe1n3I
   X0JBLPqyI2LJIT5+wcDTlYFloMaHleRXsmaylA+yjx0/XoQsiEISmNGR8
   23TKZsM7surL3c9TOJ2WEuPfJ19aUhntPk9ADZGqztHSR8Wv3JYzmzxgp
   DICsZiKyCwwN/uCQUzSyg5S5k8A7tZWqklR96Sb2gxP/v2XKOtwx5voVc
   vBL3Osl5wj1yslhI0eTBO5Q8ndQKMHqvKqt8Boh6JprVzkodibtk7XgLK
   QBp8khH/WZ3UZcdFMbZ7xLQN5M1n44/V55/qHM3aRLxxO/j+kfj7hM56b
   Q==;
X-CSE-ConnectionGUID: 9iRp8fRSRH+DulDG6yHKcA==
X-CSE-MsgGUID: CCxvdqWXRY+bXuj3iB+7MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="78008464"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="78008464"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 07:37:52 -0700
X-CSE-ConnectionGUID: arWDZk3mShGfbF0V6MIy8g==
X-CSE-MsgGUID: SxTQrCKxRMKEolEt1bqF5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="236366637"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Apr 2026 07:37:49 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFYi1-000000000jN-3gpb;
	Wed, 22 Apr 2026 14:37:45 +0000
Date: Wed, 22 Apr 2026 22:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Mast <rn.mast@zonnet.nl>, hdegoede@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, andy@kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, Robert Mast <rmast@live.nl>
Subject: Re: [PATCH 1/1] media: atomisp: mt9m114: Graceful teardown atomisp
 and mt9m114
Message-ID: <202604222246.sNhBwsBf-lkp@intel.com>
References: <20260418092651.7873-2-rn.mast@zonnet.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418092651.7873-2-rn.mast@zonnet.nl>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59343-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,linux.intel.com,vger.kernel.org,linuxfoundation.org,ideasonboard.com,live.nl];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[zonnet.nl,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:email,intel.com:dkim,intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,git-scm.com:url]
X-Rspamd-Queue-Id: 28C7A4475A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Robert,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.0]
[cannot apply to staging/staging-testing staging/staging-next staging/staging-linus linuxtv-media-pending/master sailus-media-tree/master linus/master sailus-media-tree/streams next-20260422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Mast/media-atomisp-mt9m114-Graceful-teardown-atomisp-and-mt9m114/20260421-171953
base:   v7.0
patch link:    https://lore.kernel.org/r/20260418092651.7873-2-rn.mast%40zonnet.nl
patch subject: [PATCH 1/1] media: atomisp: mt9m114: Graceful teardown atomisp and mt9m114
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260422/202604222246.sNhBwsBf-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604222246.sNhBwsBf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604222246.sNhBwsBf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/mt9m114.c:2554:1: warning: unused label 'read_slew_rate' [-Wunused-label]
    2554 | read_slew_rate:
         | ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/read_slew_rate +2554 drivers/media/i2c/mt9m114.c

  2497	
  2498	static int mt9m114_parse_dt(struct mt9m114 *sensor)
  2499	{
  2500		struct fwnode_handle *fwnode;
  2501		struct fwnode_handle *ep;
  2502		int ret;
  2503	
  2504	#if IS_ENABLED(CONFIG_ACPI)
  2505		if (has_acpi_companion(&sensor->client->dev)) {
  2506			/*
  2507			 * On some reload sequences a stale software-node graph can be
  2508			 * observed for this ACPI-enumerated sensor. Use the known safe
  2509			 * default bus configuration and skip endpoint graph parsing.
  2510			 */
  2511			memset(&sensor->bus_cfg, 0, sizeof(sensor->bus_cfg));
  2512			sensor->bus_cfg.bus_type = V4L2_MBUS_CSI2_DPHY;
  2513			sensor->bus_cfg.bus.mipi_csi2.num_data_lanes = 1;
  2514			goto read_slew_rate;
  2515		}
  2516	#endif
  2517		fwnode = dev_fwnode(&sensor->client->dev);
  2518	
  2519		/*
  2520		 * On ACPI systems the fwnode graph can be initialized by a bridge
  2521		 * driver, which may not have probed yet. Wait for this.
  2522		 *
  2523		 * TODO: Return an error once bridge driver code will have moved
  2524		 * to the ACPI core.
  2525		 */
  2526		ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
  2527		if (IS_ERR(ep))
  2528			return dev_err_probe(&sensor->client->dev, PTR_ERR(ep),
  2529					     "failed to get fwnode graph endpoint\n");
  2530		if (!ep)
  2531			return dev_err_probe(&sensor->client->dev, -EPROBE_DEFER,
  2532					     "waiting for fwnode graph endpoint\n");
  2533	
  2534		sensor->bus_cfg.bus_type = V4L2_MBUS_UNKNOWN;
  2535		ret = v4l2_fwnode_endpoint_alloc_parse(ep, &sensor->bus_cfg);
  2536		fwnode_handle_put(ep);
  2537		if (ret < 0) {
  2538			dev_err(&sensor->client->dev, "Failed to parse endpoint\n");
  2539			goto error;
  2540		}
  2541	
  2542		switch (sensor->bus_cfg.bus_type) {
  2543		case V4L2_MBUS_CSI2_DPHY:
  2544		case V4L2_MBUS_PARALLEL:
  2545			break;
  2546	
  2547		default:
  2548			dev_err(&sensor->client->dev, "unsupported bus type %u\n",
  2549				sensor->bus_cfg.bus_type);
  2550			ret = -EINVAL;
  2551			goto error;
  2552		}
  2553	
> 2554	read_slew_rate:
  2555		sensor->pad_slew_rate = MT9M114_PAD_SLEW_DEFAULT;
  2556		device_property_read_u32(&sensor->client->dev, "slew-rate",
  2557					 &sensor->pad_slew_rate);
  2558	
  2559		if (sensor->pad_slew_rate < MT9M114_PAD_SLEW_MIN ||
  2560		    sensor->pad_slew_rate > MT9M114_PAD_SLEW_MAX) {
  2561			dev_err(&sensor->client->dev, "Invalid slew-rate %u\n",
  2562				sensor->pad_slew_rate);
  2563			return -EINVAL;
  2564		}
  2565	
  2566		return 0;
  2567	
  2568	error:
  2569		v4l2_fwnode_endpoint_free(&sensor->bus_cfg);
  2570		return ret;
  2571	}
  2572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

