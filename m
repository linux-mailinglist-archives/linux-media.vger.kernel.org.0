Return-Path: <linux-media+bounces-56302-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE4HGP2nu2mnmQIAu9opvQ
	(envelope-from <linux-media+bounces-56302-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 08:38:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6132C75E3
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 08:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3379E3084618
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F5B3A1692;
	Thu, 19 Mar 2026 07:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlBNNf+c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2183A0B11
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 07:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773905838; cv=none; b=KO84oHyw30Vevgenvfdt7uFrojoteR07YUmQKPydi7mzUs3+gx08ScdG7bpz3E2Z0UCL9pxEuskbT9USOjT8q0NTEUCNgmua4QQBEQL9mgZVrV2wxhv5RfOqNDGzRDw7t2LcoW8FfqT5gXK5BwGHPDuBGUNG8ZpmnbtmBvqnkc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773905838; c=relaxed/simple;
	bh=5GlKQPm6S7BT7ZpyaFyITs7NatqZk5qI94iTbqaqVys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rax2WbPBTIT5KbPnYnd8F8coX8lkxZFPy93QgtX2IhUt7LWMFBNnkmWqjRjgZrYCcp3Z2TxVGU4cy2wttcmDjhwLSloOKuoh/zEdWf9HIFtfgACNtr27AEUYG+2Rx64NUGPH7Wm8K4j0WoC5L0M4AJeIhux6lKV+/JVoq2C4Ghg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlBNNf+c; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773905837; x=1805441837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5GlKQPm6S7BT7ZpyaFyITs7NatqZk5qI94iTbqaqVys=;
  b=DlBNNf+cxTobim9+KTslwDeQ4Y2eNVfuRJ/fSCXZZA7XL7HSnPnpMUdc
   nMOGag0ZweDR/9RCkObRADOoyxfd4g8Xtaftcn6xahAdqxKn1LidGzucN
   yciYE8IkW9rDjWT9viZNX30o9IVT/Z2suB9a15MjHV9QRL+h0RpUHDrgl
   1KOcENQ5LxMMiQ/WBr+SdR5aioEAHLeImOqTMV78Z43/vsjvFZkfWmMS7
   ua46DrUjsGN1tIEtuoKPsqEAqnoKMZqMVl96GC8SP434UHGzq4Y4PmqVj
   K6I2XttfXEBAEn+8HMckTS2q/HT7vLUeFx3aXIoXzUTnbIMz8TZL0i9Dc
   g==;
X-CSE-ConnectionGUID: SCsHuGdoTHSYuaz4biDA3w==
X-CSE-MsgGUID: hdzOkmA6Q6Ory5eSXWP7mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85289464"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="85289464"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:37:17 -0700
X-CSE-ConnectionGUID: hTXmQQTHQe6ldpGx1GmUjA==
X-CSE-MsgGUID: pn68SoZEROG3KTRdJgQFzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="260779971"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2026 00:37:13 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w37vQ-000000000Ur-1qmr;
	Thu, 19 Mar 2026 07:36:43 +0000
Date: Thu, 19 Mar 2026 15:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: Bradford Love <brad@nextdimension.cc>, linux-media@vger.kernel.org,
	hverkuil+cisco@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bradford Love <brad@nextdimension.cc>
Subject: Re: [PATCH v2] media: au0828: Fix green screen in analog
Message-ID: <202603191517.dqbfX1as-lkp@intel.com>
References: <20260317172820.2959499-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317172820.2959499-1-brad@nextdimension.cc>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56302-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.977];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: CA6132C75E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bradford,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20260318-180458/Bradford-Love/si2157-Analog-format-fixes/20260314-162352
base:   the 5th patch of https://lore.kernel.org/r/20260312213532.2907276-6-brad%40nextdimension.cc
patch link:    https://lore.kernel.org/r/20260317172820.2959499-1-brad%40nextdimension.cc
patch subject: [PATCH v2] media: au0828: Fix green screen in analog
config: hexagon-randconfig-001-20260319 (https://download.01.org/0day-ci/archive/20260319/202603191517.dqbfX1as-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191517.dqbfX1as-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191517.dqbfX1as-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/usb/au0828/au0828-video.c:1676:23: warning: unused variable 'vdev' [-Wunused-variable]
    1676 |         struct video_device *vdev = video_devdata(file);
         |                              ^~~~
   1 warning generated.


vim +/vdev +1676 drivers/media/usb/au0828/au0828-video.c

  1673	
  1674	static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *b)
  1675	{
> 1676		struct video_device *vdev = video_devdata(file);
  1677		struct au0828_dev *dev = video_drvdata(file);
  1678		int rc;
  1679	
  1680		rc = check_dev(dev);
  1681		if (rc < 0)
  1682			return rc;
  1683	
  1684		/* Workaround for a bug in the au0828 hardware design that
  1685		 * sometimes results in the colorspace being inverted
  1686		 */
  1687		if (dev->greenscreen_detected == 1) {
  1688			dprintk(1, "Detected green frame.  Resetting stream...\n");
  1689			au0828_analog_stream_reset(dev);
  1690			dev->greenscreen_detected = 0;
  1691		}
  1692	
  1693		return vb2_ioctl_dqbuf(file, priv, b);
  1694	}
  1695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

