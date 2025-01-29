Return-Path: <linux-media+bounces-25394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE592A2180D
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 08:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DA55165D51
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 07:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D8B194C86;
	Wed, 29 Jan 2025 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+jlZ4/D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DDE185B5F;
	Wed, 29 Jan 2025 07:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738135535; cv=none; b=jCGMOallGVyoSfSnL3VmRpe8pWPDod31+RYfgT8WN7uDNE4lXeqeETmc860MUmw/WOsn9sLR57fN5YxJx7m/uzNpJUPehPGwDeQHZ7Z6Qk7/Fg88pOyYU7hABMtOdptXvegefv0Jqf2Vf/8VERcUOyxyQDO4IR5xfEhOd485GlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738135535; c=relaxed/simple;
	bh=4JhhaiOSfKv/9QtoX0GXdIoRjRjs5CHPfXgA4e217p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLOq31jXiwwInORcbtE3ZKWpMO6nRpKdS4yLHk+JaUQPklGFjzBUTaGrJYSiGgznumXTxcnmhcOTEVU3MVABlaVgngkm6rZ2PiTEIjaLDup+VEDYX6WCopaK4QYGb2sk3LSucp3TK6Qwn6qOzE27I61k6Zvzof61fl24yjHae10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+jlZ4/D; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738135533; x=1769671533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4JhhaiOSfKv/9QtoX0GXdIoRjRjs5CHPfXgA4e217p8=;
  b=J+jlZ4/DJAxZ4vYycJtT3pSTuOx3jTYGNOev7ij9keBmOFqs2RY0yBv2
   hVFn0bJJWxJTx/HhTwxF52YidnJmeuWKjOVZ88YgrK0PZXkML3y5Z97BK
   WWyGSliZNv1Lz02zG36FIvbxYJdKGPO1/jUXkhHgcwWfb+I/p4o3GNhRJ
   V5n2bTAtnrt/F2xRRE/mEDdmxV2Qp3Dp1tonK77Zgvsl/sp2Jy5bo27GJ
   PwJ6xBOnDLJ7U7uDcVmuM982zgJP9EFTEKRoPS86FjA6iL65zb25nuzUI
   fMeeB4q1yXzmkP2lqszi+/m30W8KRyNAFNqsfwtJXYzYl07josJ2XV62J
   w==;
X-CSE-ConnectionGUID: AXAx4KhgRuaS7YQuF3HHGg==
X-CSE-MsgGUID: 8igy0LQxQbqljSienceofw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49226125"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="49226125"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 23:25:32 -0800
X-CSE-ConnectionGUID: o78LRIskTwG0lZYErfUPjA==
X-CSE-MsgGUID: 7UJgoUlrQp2D2BjBlFvbYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="139845463"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jan 2025 23:25:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td2Ry-000iil-1L;
	Wed, 29 Jan 2025 07:25:26 +0000
Date: Wed, 29 Jan 2025 15:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <gnurou@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Albert Esteve <aesteve@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	gurchetansingh@google.com, daniel.almeida@collabora.com,
	changyeon@google.com, nicolas.dufresne@collabora.com,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	Alexandre Courbot <acourbot@google.com>
Subject: Re: [PATCH] media: add virtio-media driver
Message-ID: <202501291558.lEyjPgBm-lkp@intel.com>
References: <20250123-virtio-media-v1-1-81e2549b86b9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123-virtio-media-v1-1-81e2549b86b9@gmail.com>

Hi Alexandre,

kernel test robot noticed the following build errors:

[auto build test ERROR on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Courbot/media-add-virtio-media-driver/20250123-085559
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250123-virtio-media-v1-1-81e2549b86b9%40gmail.com
patch subject: [PATCH] media: add virtio-media driver
config: x86_64-randconfig-r071-20250126 (https://download.01.org/0day-ci/archive/20250129/202501291558.lEyjPgBm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501291558.lEyjPgBm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501291558.lEyjPgBm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/staging/gpib/agilent_82350b/agilent_82350b.o:drivers/staging/gpib/agilent_82350b/agilent_82350b.c:306: multiple definition of `driver_name'; drivers/media/virtio/virtio_media_driver.o:drivers/media/virtio/virtio_media_driver.c:50: first defined here

smatch warnings:
drivers/media/virtio/virtio_media_driver.c:896 virtio_media_probe() warn: missing unwind goto?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

