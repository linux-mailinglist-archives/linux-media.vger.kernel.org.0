Return-Path: <linux-media+bounces-15121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B18934F6B
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 16:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA0101F211CF
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 14:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D02142E7C;
	Thu, 18 Jul 2024 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6TB+mcM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D3D13D62E;
	Thu, 18 Jul 2024 14:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721314429; cv=none; b=oseQYZ0zp/wL0dbrlPze4pRUMljvmXFa4cNZGZ6PnNydys6w/GaWMV/rPzzoJd+IM5f3kEnkqYWIk2IgHWXOhW9SapKjTHwv1gpLr7wExVLTQymLWQg2htNTQvWEt4HCIonSMlui8th0/L2HH4xPIllrwmGiBG8h2ESHo9HQQ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721314429; c=relaxed/simple;
	bh=x4Sq0r9Afmc9hWmlRXatcvm/sP1GaimK+RX0qgkI+QI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SrPo461nGrO0GI4VzBk1t/cUrOwD7Yvh4bXQCSh88B/U6pEFIk2XitYjsP975JHaVMa/8Q41W0MP8h18qZtQOVwe4gYlGq75n2UNI8o/Y75TwaOEzBTqrD1nX2lcbkGm0iSWpzoOxM7cOzcZPD6v3s6UxLZ+0bLzcKcRimLjDYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6TB+mcM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721314427; x=1752850427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x4Sq0r9Afmc9hWmlRXatcvm/sP1GaimK+RX0qgkI+QI=;
  b=I6TB+mcMbbT/1nRWf4DOFwu9M02SjouL85/Pa9hmY3gz55mKR/7cK6Kl
   xi/hPn+2E7nMKd/kNuDGEsSzdREnt/9L2yMAPtnVSpnSjCsm6OKP78QjN
   OTbHl3D5l6CMcKN0Nrz7JnRThngROUwsmIfRNs33e/sliiqaorcKmsMzE
   LRB6exkuNZ+EMlBVb5bAP813GVk43y0kxUogt1cb78eWBjAgL+fUqQCE4
   DbDWIJHzxvl0LT5mPTV4zD7YefQtjq2D3GQ584bTHZgiKWgLbZ8DjfAc2
   n1923IZ06PujJwHgBRJW3ou2Q002MCtYLrvIOKYwFcTPxxGxcGFRdVNSb
   w==;
X-CSE-ConnectionGUID: Dd0H9+eGS3OK4BlpXgp51A==
X-CSE-MsgGUID: vb9baTAETEK0lh0vqBV+wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18502718"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="18502718"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 07:53:46 -0700
X-CSE-ConnectionGUID: BP7QLhkNRx+DrVJnvJXtBg==
X-CSE-MsgGUID: rlPuAbT6QVmWq1X6wwK41g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="55086854"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jul 2024 07:53:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUSVo-000hLz-1A;
	Thu, 18 Jul 2024 14:53:40 +0000
Date: Thu, 18 Jul 2024 22:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Jayshri Pawar <jpawar@cadence.com>, Jai Luthra <j-luthra@ti.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/5] media: cadence: csi2rx: Support runtime PM
Message-ID: <202407182235.kxDoVX8T-lkp@intel.com>
References: <20240718032834.53876-2-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718032834.53876-2-changhuang.liang@starfivetech.com>

Hi Changhuang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.10 next-20240718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Changhuang-Liang/media-cadence-csi2rx-Support-runtime-PM/20240718-131216
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240718032834.53876-2-changhuang.liang%40starfivetech.com
patch subject: [PATCH v2 1/5] media: cadence: csi2rx: Support runtime PM
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240718/202407182235.kxDoVX8T-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407182235.kxDoVX8T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407182235.kxDoVX8T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/cadence/cdns-csi2rx.c:739:12: warning: 'csi2rx_runtime_resume' defined but not used [-Wunused-function]
     739 | static int csi2rx_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/cadence/cdns-csi2rx.c:720:12: warning: 'csi2rx_runtime_suspend' defined but not used [-Wunused-function]
     720 | static int csi2rx_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/csi2rx_runtime_resume +739 drivers/media/platform/cadence/cdns-csi2rx.c

   719	
 > 720	static int csi2rx_runtime_suspend(struct device *dev)
   721	{
   722		struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
   723		unsigned int i;
   724	
   725		reset_control_assert(csi2rx->sys_rst);
   726		clk_disable_unprepare(csi2rx->sys_clk);
   727	
   728		for (i = 0; i < csi2rx->max_streams; i++) {
   729			reset_control_assert(csi2rx->pixel_rst[i]);
   730			clk_disable_unprepare(csi2rx->pixel_clk[i]);
   731		}
   732	
   733		reset_control_assert(csi2rx->p_rst);
   734		clk_disable_unprepare(csi2rx->p_clk);
   735	
   736		return 0;
   737	}
   738	
 > 739	static int csi2rx_runtime_resume(struct device *dev)
   740	{
   741		struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
   742		unsigned int i;
   743		int ret;
   744	
   745		ret = clk_prepare_enable(csi2rx->p_clk);
   746		if (ret)
   747			return ret;
   748	
   749		reset_control_deassert(csi2rx->p_rst);
   750	
   751		for (i = 0; i < csi2rx->max_streams; i++) {
   752			ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
   753			if (ret)
   754				goto err_disable_pixclk;
   755	
   756			reset_control_deassert(csi2rx->pixel_rst[i]);
   757		}
   758	
   759		ret = clk_prepare_enable(csi2rx->sys_clk);
   760		if (ret)
   761			goto err_disable_pixclk;
   762	
   763		reset_control_deassert(csi2rx->sys_rst);
   764	
   765		return ret;
   766	
   767	err_disable_pixclk:
   768		for (; i > 0; i--) {
   769			reset_control_assert(csi2rx->pixel_rst[i - 1]);
   770			clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
   771		}
   772	
   773		reset_control_assert(csi2rx->p_rst);
   774		clk_disable_unprepare(csi2rx->p_clk);
   775	
   776		return ret;
   777	}
   778	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

