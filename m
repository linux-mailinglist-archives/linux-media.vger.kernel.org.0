Return-Path: <linux-media+bounces-54751-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMxUI2+/qmlXWQEAu9opvQ
	(envelope-from <linux-media+bounces-54751-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 12:50:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCFF21FE1B
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 12:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC6E63071436
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 11:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456673644A5;
	Fri,  6 Mar 2026 11:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNhV/ZKG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BEC359A62
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 11:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772797662; cv=none; b=WDIknDMPTXTI1wUUoMBdbu2fJcTaNhdZUgH0hxXOOp5zl3xMyS/T1GjQVPZq258nuPc+2J6Pxparui02iU8y912IaYAr+a3dRqqsXdxwoK1Tzgy9kTrKG0uGpCpmbMmc2AfHlBBErMiTwhxRYV2y87i0AfrDvYGcrcA3vKg5atU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772797662; c=relaxed/simple;
	bh=ImS7bVrbEKywxEyQWl+G+Iwq1LpqY0keiwVTZO6pSQ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jqdAVJcZae/ZwhgTkOGobCL4lrVsRlGa4ExLYjbJZqPSVMQe6BHjzdwyLdeGOm1pOIPBHg4tw1P44yPfCOo+Gke4JYyST8Ktk6RqSWGpMi555PoamE7ZbD2bHDr1zxOpHucurUYrhnG5QMPioh1qi2bKGt5Xjy12cJnsNawEE9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNhV/ZKG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772797658; x=1804333658;
  h=date:from:to:cc:subject:message-id;
  bh=ImS7bVrbEKywxEyQWl+G+Iwq1LpqY0keiwVTZO6pSQ8=;
  b=QNhV/ZKGHxJchtZejpLesf/DHfLUn4uS5QU0+ewggsypDLz2lohrt5+v
   oZHljfnuqDWxPwCwaC2OJhj0M8CGTUi6biktBmVsLIvzMjvL/hN55dFO/
   HgvgALiR2JmhjdeJd9mTDnS/mprF++Lgr6XVi+1rmY/N+Ayq5tyqRYAeb
   qHCg5joqiqwu3QnhpHFT+AepwF9ju+XIZF2aPUNpc1GMJzE5Svjblksdx
   094pPzSNClqFNMksS+Tx4JGvmZmzMTvf/KIMbf4MwL5iss8SKbXrWANen
   JoS1Bz6dYaB214PW4wV1weJB/K05NbNrt088xmGi/hv+3CQv/gHstU21Z
   Q==;
X-CSE-ConnectionGUID: 97dhEgOBR4CW/PsCgYeUxg==
X-CSE-MsgGUID: S27/fAlaRz+CYNVE7JVw2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73095062"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73095062"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 03:47:37 -0800
X-CSE-ConnectionGUID: KCiUSjtKTwKTZbSxpQyntg==
X-CSE-MsgGUID: DxU5lWSISZGn2pWIgH5NCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218937725"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Mar 2026 03:47:34 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyTeV-000000000np-1EZz;
	Fri, 06 Mar 2026 11:47:31 +0000
Date: Fri, 06 Mar 2026 19:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tarang Raval <tarang.raval@siliconsignals.io>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [sailus-media-tree:cleanup 30/33]
 drivers/media/i2c/ov9282.c:557:2: error: a label can only be part of a
 statement and a declaration is not a statement
Message-ID: <202603061953.Dlyggyec-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 6FCFF21FE1B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54751-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url]
X-Rspamd-Action: no action

tree:   git://linuxtv.org/sailus/media_tree.git cleanup
head:   862cacec7d570b9f6c8d60d12b50a210aecd933e
commit: 1f01b1dc2c4922f684a5992e7542cfb03f90223c [30/33] media: i2c: ov9282: Convert to CCI register access helpers
config: microblaze-randconfig-r062-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061953.Dlyggyec-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061953.Dlyggyec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061953.Dlyggyec-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/ov9282.c: In function 'ov9282_update_exp_gain':
>> drivers/media/i2c/ov9282.c:557:2: error: a label can only be part of a statement and a declaration is not a statement
     int ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
     ^~~


vim +557 drivers/media/i2c/ov9282.c

   523	
   524	/**
   525	 * ov9282_update_exp_gain() - Set updated exposure and gain
   526	 * @ov9282: pointer to ov9282 device
   527	 * @exposure: updated exposure value
   528	 * @gain: updated analog gain value
   529	 *
   530	 * Return: 0 if successful, error code otherwise.
   531	 */
   532	static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
   533	{
   534		int ret;
   535		u32 exposure_us = ov9282_exposure_to_us(ov9282, exposure);
   536	
   537		dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
   538			exposure, exposure_us, gain);
   539	
   540		ret = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0x01, NULL);
   541		if (ret)
   542			return ret;
   543	
   544		ret = cci_write(ov9282->regmap, OV9282_REG_EXPOSURE, exposure << 4, NULL);
   545		if (ret)
   546			goto error_release_group_hold;
   547	
   548		ret = cci_write(ov9282->regmap, OV9282_REG_AGAIN, gain, NULL);
   549		if (ret)
   550			goto error_release_group_hold;
   551	
   552		ret = __v4l2_ctrl_modify_range(ov9282->flash_duration,
   553					       0, exposure_us, 1,
   554					       OV9282_STROBE_FRAME_SPAN_DEFAULT);
   555	
   556	error_release_group_hold:
 > 557		int ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
   558	
   559		return ret ? ret : ret_hold;
   560	}
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

