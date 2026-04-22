Return-Path: <linux-media+bounces-59322-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJgaM/W66GkHPgIAu9opvQ
	(envelope-from <linux-media+bounces-59322-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:11:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35115445BC5
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66D71303CE89
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB3B35F60F;
	Wed, 22 Apr 2026 12:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nlPBnlWB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D95B3CFF79;
	Wed, 22 Apr 2026 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859789; cv=none; b=sPm62NXfzMSOoOlK9/PZJ4g2YLnEAGVihe3zW5JRzyMWSth6Wf3HqL2b27RGrLDMcvfwvsbEXTCcf/rBEdCZ0hh/GI0LWA/D8NCpC8j3TiCEc/bmGmT70XG7PnNOle4z2//VV9YQTx4pL0GzCIYyGcIge2SJCbQxeruCQ4F1YKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859789; c=relaxed/simple;
	bh=bhwSG5VPmGAfBqUodcRjmwWLk0f8ADERTHFd1AcXWf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtnN8woY/xQl9jY7pHT7t8gv46sLdbz17dOnlAB5ZojafAiZNAitKKRKmtSyfDWWdWXcMN4M9TRzrs4AaY32j8MBM6l+196drEVEaPBhR14XazPBd3ZUL+UIBq+5rV4WZjRF/D9IflbRdeFt+JMbgXACI+PGdUkl70Q2n0Dp4rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nlPBnlWB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776859787; x=1808395787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bhwSG5VPmGAfBqUodcRjmwWLk0f8ADERTHFd1AcXWf8=;
  b=nlPBnlWBtluQrqgSMQGR+XH3BfXm9KqADUSe/eLNOB3aLd4/1OyR8Zx+
   hSvuiHcrGZJ/PquV46w55pMSykc3aCeSONYJLlkP2ffiLiFUX15ta+On1
   S/xWe6VSnyDl2qItj1rWTTMRvdBEVa/F2/hpltTLtAX0LO1NyTNbsGXkJ
   1FqBWBShl/Al6i6ieRvaccuEHVjpJaXbLztdKE0xOxtJdq1FSMJC3+5E2
   lv8Gu1kn+KoYN28EJ/cblTFBywsx2qVhZcXkD59yNEJqHK+NfbtmA1O6K
   EDcO+yDG7HS7Eg53nSU56P3Y167Ql4BHize7nm+QwXq6POF9H5MWVERB/
   g==;
X-CSE-ConnectionGUID: CtNQUeUSQJOAudF9pAfA3Q==
X-CSE-MsgGUID: Ety+VVJ2R2SX9lkXSRXmMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="76971803"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="76971803"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 05:09:47 -0700
X-CSE-ConnectionGUID: +fbxvhKlQXugR9WMdW43Vg==
X-CSE-MsgGUID: RFof08oZQISyGa+8GE72vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="255819306"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Apr 2026 05:09:43 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFWOi-000000000eH-38qo;
	Wed, 22 Apr 2026 12:09:40 +0000
Date: Wed, 22 Apr 2026 20:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Mast <rn.mast@zonnet.nl>, hdegoede@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, andy@kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, Robert Mast <rmast@live.nl>
Subject: Re: [PATCH 1/1] media: atomisp: mt9m114: Graceful teardown atomisp
 and mt9m114
Message-ID: <202604222059.KIHN4WAF-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59322-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,linux.intel.com,vger.kernel.org,linuxfoundation.org,ideasonboard.com,live.nl];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[zonnet.nl,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,intel.com:email,intel.com:dkim,intel.com:mid,01.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 35115445BC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Robert,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.0]
[cannot apply to staging/staging-testing staging/staging-next staging/staging-linus linuxtv-media-pending/master sailus-media-tree/master linus/master sailus-media-tree/streams next-20260421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Mast/media-atomisp-mt9m114-Graceful-teardown-atomisp-and-mt9m114/20260421-171953
base:   v7.0
patch link:    https://lore.kernel.org/r/20260418092651.7873-2-rn.mast%40zonnet.nl
patch subject: [PATCH 1/1] media: atomisp: mt9m114: Graceful teardown atomisp and mt9m114
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260422/202604222059.KIHN4WAF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604222059.KIHN4WAF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604222059.KIHN4WAF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/mt9m114.c: In function 'mt9m114_parse_dt':
>> drivers/media/i2c/mt9m114.c:2554:1: warning: label 'read_slew_rate' defined but not used [-Wunused-label]
    2554 | read_slew_rate:
         | ^~~~~~~~~~~~~~


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

