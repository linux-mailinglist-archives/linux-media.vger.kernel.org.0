Return-Path: <linux-media+bounces-21227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 383B29C3398
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 16:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F177E28160E
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 15:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DD513213E;
	Sun, 10 Nov 2024 15:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEDqGYFC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A7D762F7;
	Sun, 10 Nov 2024 15:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731254001; cv=none; b=aKQ77hgwxGPmiQu3aBMr9kbo84WNhHZYHFYSofC6+f+4Xasun4AbaKPwgHLh9avzcC9deNI0gTW4qi/k5DGNIgN0nBoKckvJ/P3+/otjAkc01s1QpXd8fkyMJfhDPnbNcwmo99Als8DA0eNNAfocgNUGm1BvEmsELQZ7hgyaVpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731254001; c=relaxed/simple;
	bh=jvD2CCTe+oFNrodgQj6jd2E9spr6i3/DFNz2P5FA7lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KheI1w7tu4rqVZRjqpR7KlVutv891J2j2AoK0u3MMINtHGfBqsDPquKBtojuEcLdyvb2CgEOBZQZ90bnvisDkDZsnI6N/mKWsMDs6C2y6iLkPNN+TClHtcam66S481PIPqvoySA3sES/OqyxeF20w6/HvOytO09allgZY68JBvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEDqGYFC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731253999; x=1762789999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jvD2CCTe+oFNrodgQj6jd2E9spr6i3/DFNz2P5FA7lc=;
  b=YEDqGYFCDUuYhSQbYRS+z/zZXYhpXiXlFMqID5wr6CO3SG7J24Hv58pv
   RDAD5dTM3IofNqQOG9V18uhdq/nCU5qEX9d7nKXHte2xodQndQ2TYhfx2
   qJUO5MyU2QKDUo89dgn19+K3yjlz8yzxpcQ5ON+6Iy29P6J9+3TwpcMSe
   AuiN9oMFESDdKkINgBX4AD9E11/MBxgoOVKvoXZ57Iym7uF18HbeepkmJ
   EmWHahWPoPJukTc7H04uGYEUVWRgjIORh/vGwHOFITjawZubPLJbuDDi6
   JQY2tf66esvICa42HtwGQYt99FC1SfzznjOb/Ehm8JBcSEAeSbLngPF0F
   g==;
X-CSE-ConnectionGUID: XIEc5d66QEytCrjBRfjzUQ==
X-CSE-MsgGUID: Tip5aJ2hT0yWpj2ajCwl5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="41697749"
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="41697749"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 07:53:19 -0800
X-CSE-ConnectionGUID: yGlTB8FqT9qEoPc4TbJENA==
X-CSE-MsgGUID: LDhMPhzvTGeSkyRgbqxGtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="117333324"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2024 07:53:17 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAAFV-0000DV-2r;
	Sun, 10 Nov 2024 15:53:13 +0000
Date: Sun, 10 Nov 2024 23:52:34 +0800
From: kernel test robot <lkp@intel.com>
To: Karol Przybylski <karprzy7@gmail.com>, hverkuil@xs4all.nl,
	mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Karol Przybylski <karprzy7@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] media: cec: extron-da-hd-4k-plus: add return check for
 wait_for_completion*()
Message-ID: <202411102341.VuOHMHGh-lkp@intel.com>
References: <20241110125814.1899076-1-karprzy7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241110125814.1899076-1-karprzy7@gmail.com>

Hi Karol,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-stage/master]
[also build test ERROR on linus/master v6.12-rc6 next-20241108]
[cannot apply to media-tree/master sailus-media-tree/streams sailus-media-tree/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karol-Przybylski/media-cec-extron-da-hd-4k-plus-add-return-check-for-wait_for_completion/20241110-210018
base:   https://git.linuxtv.org/media_stage.git master
patch link:    https://lore.kernel.org/r/20241110125814.1899076-1-karprzy7%40gmail.com
patch subject: [PATCH] media: cec: extron-da-hd-4k-plus: add return check for wait_for_completion*()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241110/202411102341.VuOHMHGh-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411102341.VuOHMHGh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411102341.VuOHMHGh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c: In function 'extron_read_edid':
>> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:563:17: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     563 |                 ret = wait_for_completion_killable_timeout(&extron->edid_completion,
         |                 ^~~
         |                 net
   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:563:17: note: each undeclared identifier is reported only once for each function it appears in


vim +563 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c

   540	
   541	static void extron_read_edid(struct extron_port *port)
   542	{
   543		struct extron *extron = port->extron;
   544		char cmd[10], reply[10];
   545		unsigned int idx;
   546	
   547		idx = port->port.port + (port->is_input ? 0 : extron->num_in_ports);
   548		snprintf(cmd, sizeof(cmd), "WR%uEDID", idx);
   549		snprintf(reply, sizeof(reply), "EdidR%u", idx);
   550		if (mutex_lock_interruptible(&extron->edid_lock))
   551			return;
   552		if (port->read_edid)
   553			goto unlock;
   554		extron->edid_bytes_read = 0;
   555		extron->edid_port = port;
   556		port->edid_blocks = 0;
   557		if (!port->has_edid)
   558			goto no_edid;
   559	
   560		extron->edid_reading = true;
   561	
   562		if (!extron_send_and_wait(extron, port, cmd, reply)) {
 > 563			ret = wait_for_completion_killable_timeout(&extron->edid_completion,
   564							     msecs_to_jiffies(1000));
   565			if (ret < 0)
   566				goto unlock;
   567		}
   568		if (port->edid_blocks) {
   569			extron_parse_edid(port);
   570			port->read_edid = true;
   571			if (!port->is_input)
   572				v4l2_ctrl_s_ctrl(port->ctrl_tx_edid_present, 1);
   573		}
   574	no_edid:
   575		extron->edid_reading = false;
   576	unlock:
   577		mutex_unlock(&extron->edid_lock);
   578		cancel_delayed_work_sync(&extron->work_update_edid);
   579		if (manufacturer_name[0])
   580			schedule_delayed_work(&extron->work_update_edid,
   581					      msecs_to_jiffies(1000));
   582	}
   583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

