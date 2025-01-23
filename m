Return-Path: <linux-media+bounces-25190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D805A19FA7
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 09:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EE9D3A494F
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 08:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D290920C03B;
	Thu, 23 Jan 2025 08:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/61JET5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B245B20C02A;
	Thu, 23 Jan 2025 08:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737620063; cv=none; b=CNJlfXMcl9PA4yNqTq5dDScLt9fvvdeAmMnhCuXHrML9r+VJAuaP4aSRTJQ1aXHJtQnJWRh71axGhjPD6ifVunsmaIPk/yYvw2Z1422jRaxxUhrbYz2lwy8BGrze62/LFx7I2jjCeLjX5S1MnGHPMx/yc8dDoBq0OqUQRdvWWmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737620063; c=relaxed/simple;
	bh=Xuy3qbHB3sw8R+Jh7KRvHoJgq1glUuFH3XMy62O3dxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eo7CPJ+e8W7ytasjE5m+6Ov6Pb4UGVcC+nlB9gOVIdSWiK6rRAKW+kwfmg042qmqyR3lQNiPamCqchf7xR028XR/yxQuT+NzQ4BLZidg9hSzbqZm6Gr3rmI87Mz1bgk+W9fGHvNSBYdE6laJOGPCe5HPRGb3L+CLP9dtF+6Pl78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/61JET5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737620062; x=1769156062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xuy3qbHB3sw8R+Jh7KRvHoJgq1glUuFH3XMy62O3dxw=;
  b=Q/61JET5QBiKvIj8gr46lK9V8vJoNTdzN8kBqIZfPhvb52l+0SyFWpYX
   SR1PDAjioRsSHO9TQEGW5mtj6yS3qXoDesAEnkV3MKAxBLJZIjyxLPj1y
   TfRS/9M/e/KHsW+ddON0lH4LrtEwDXW5Kn5Fu1WEQy/dPqOBUy7u6Jy32
   dC8+Nxsn5xIypUxExJOrDZNxEJPItcFVmVDVxH9oCIFA1XSNzkE3fyMyI
   0NHH/dUoy9ea/W2y7Tg5hRtFLkafZ3Vxo8Pp8LJbGE553nCJ9jUxa1Vdr
   i6oy6BrboFyFnaZHNMo1uiMWONm46jmy+ieupHjlGCZDGaWrwdAeo5WxG
   g==;
X-CSE-ConnectionGUID: MAUJRhzCSCOIlnOuLvezaQ==
X-CSE-MsgGUID: kmiJAQiBTHaj4uEdbsOO3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38357980"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="38357980"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 00:14:21 -0800
X-CSE-ConnectionGUID: I4tsmMi4THu3i3gRwrpYQg==
X-CSE-MsgGUID: 5ZwRz80JQ+SXs2WeGYkVDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112036974"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2025 00:14:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tasLv-000av5-0f;
	Thu, 23 Jan 2025 08:14:15 +0000
Date: Thu, 23 Jan 2025 16:13:19 +0800
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
Message-ID: <202501231812.7cbb4jOV-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Courbot/media-add-virtio-media-driver/20250123-085559
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250123-virtio-media-v1-1-81e2549b86b9%40gmail.com
patch subject: [PATCH] media: add virtio-media driver
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231812.7cbb4jOV-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/virtio/protocol.h: linux/videodev2.h is included more than once.
--
>> drivers/media/virtio/scatterlist_builder.c: linux/videodev2.h is included more than once.

vim +12 drivers/media/virtio/protocol.h

    11	
  > 12	#include "linux/videodev2.h"
  > 13	#include <linux/videodev2.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

