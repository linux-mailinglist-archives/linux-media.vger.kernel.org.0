Return-Path: <linux-media+bounces-22319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6235C9DC262
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 11:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2AADB20F6C
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DF919884C;
	Fri, 29 Nov 2024 10:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XW61T5cf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0409189BB5
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732877334; cv=none; b=qJiId3TpMTVHfNCY5mMY2+mHBayyYz/P/8TTIO/B5+5sKA83rtPdnhZjkfipkb7AltxnCLIsMWqY1M1FlPwMXgxhyw9bDp6lln9onW8/IGtNc0mvvctg6sYKJWinvIc2DKUr8ShgRBH3I+WSqjXp9GiljwCvrjPFNvkX+2vmhnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732877334; c=relaxed/simple;
	bh=/GABF2MiOK0kW6LUFjm6Qy2y3lClI0kCBc2Ss9OARLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rflQmfFuq75E+Wz3qyYPOkdu6E+2RUT2umObodWFbbX2WgTsdZp6F5LcPPH0MgPZ5ZajuYO5gbX3k4YHeft0m8BmEt8coqxWm9gBjWqDDoLxJ/8ZWh5pqwH4U9av0piXE+hYNuPs6i8c/H+c7gUKfX3dFh5HJnozerZ43CAHEVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XW61T5cf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732877332; x=1764413332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/GABF2MiOK0kW6LUFjm6Qy2y3lClI0kCBc2Ss9OARLQ=;
  b=XW61T5cfG8Al1v6bZKyHHiD9TKDq8y++Gz5U6d9+mLHadAHk4uHmarO/
   48NhCnKXkYcMY0rSDgkfTw4hN2FrlGnFO3NV8f0FqOganaYRo1IwFkiNg
   pcHFfuEEkxkIS5fROEbx+l54gLQU5+XPyncxMXbS7UEiVyFmDHSmVD8a8
   vp1IZ7cgtb1gqF/euVuhtJgr/oVj4uDFJkvjwEE7YUK83rlfL/xw8p1Gj
   AQFBFEtntA6kO17+AqO3SVJpIKu60GdMt3o7Oxn95bd98ZcT+9K0cLeEd
   /seTAORiZoZq48K48YbgBnlHP4oM1ikgHUCKY+CRKNPWuYH4PW7QSezWU
   w==;
X-CSE-ConnectionGUID: kb979L+jTiaOVxB9MPxU4Q==
X-CSE-MsgGUID: VSd2fIbtRziYqKW+BwBcdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43728279"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="43728279"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 02:48:51 -0800
X-CSE-ConnectionGUID: LLfZkoMtQLOu4MnLtz6HOQ==
X-CSE-MsgGUID: OFWRJCphS1CgghsPtC9AGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="96538299"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Nov 2024 02:48:47 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGyYH-0000FD-1p;
	Fri, 29 Nov 2024 10:48:45 +0000
Date: Fri, 29 Nov 2024 18:48:10 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl, ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, daxing.li@intel.com,
	dongcheng.yan@linux.intel.com, ong.hock.yu@intel.com,
	balamurugan.c@intel.com, wei.a.fu@intel.com
Subject: Re: [PATCH v4] media: i2c: add lt6911uxe hdmi bridge driver
Message-ID: <202411291849.IwaKiYhE-lkp@intel.com>
References: <20241129061546.2237511-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129061546.2237511-1-dongcheng.yan@intel.com>

Hi Dongcheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongcheng-Yan/media-i2c-add-lt6911uxe-hdmi-bridge-driver/20241129-141630
base:   2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
patch link:    https://lore.kernel.org/r/20241129061546.2237511-1-dongcheng.yan%40intel.com
patch subject: [PATCH v4] media: i2c: add lt6911uxe hdmi bridge driver
config: i386-kismet-CONFIG_V4L2_CCI_I2C-CONFIG_VIDEO_LT6911UXE-0-0 (https://download.01.org/0day-ci/archive/20241129/202411291849.IwaKiYhE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241129/202411291849.IwaKiYhE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291849.IwaKiYhE-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for V4L2_CCI_I2C when selected by VIDEO_LT6911UXE
   WARNING: unmet direct dependencies detected for V4L2_CCI_I2C
     Depends on [n]: MEDIA_SUPPORT [=y] && I2C [=n]
     Selected by [y]:
     - VIDEO_LT6911UXE [=y] && MEDIA_SUPPORT [=y] && ACPI [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

