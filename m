Return-Path: <linux-media+bounces-38056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3014B0A0FC
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 12:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81E84A42F30
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 10:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ECAD2BE05A;
	Fri, 18 Jul 2025 10:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2H9IL4I"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7E32BDC39;
	Fri, 18 Jul 2025 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752835619; cv=none; b=WE6vAOjkXqiotvmmvN7CpTnU+r/ok/jGtuAxE4Gr3s6d5wtdGcek7MspgtA/5db7Uvi7dD/tw/KS5s/MzIcHCyWllwVWNn+Rgy3XIPr4SvV5idOs/yD8kLcGlfo6Zl3agMXcpKb96+kcCAz7E0IhxWfFfr6lU4WRYKKM5afR/2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752835619; c=relaxed/simple;
	bh=V2u/KOLyQYJm4zca8JKpQcxFVXvlEbSp6+XWI+QNO88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EebZNwu4JGTejjwV8xoNfPG5acOjBi4mpWX0O/TpXZ3TFvqArNnw9cwMY0QAMR0Kb7jkN2PyHspW/l6MvvxPWfDlcCaAvwJnn7+WqTPhkqEGZGkMV9IYN0ndR+xjSBkhzTUblo2Jcm7xuhT7a56iHq+OmhbULf0dLvI1mANEHHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2H9IL4I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752835618; x=1784371618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V2u/KOLyQYJm4zca8JKpQcxFVXvlEbSp6+XWI+QNO88=;
  b=Y2H9IL4ITz6JVXBXMrIyiME/vWYVerVgAp3FIHO1fdUoGtTUFgQvHFG8
   AZ6C4LbqZJrZvnsDkeb8LQyxegBQprY/Wtmv/PFkqLZ/v16+W/t6QMxrA
   WCtPG2sOiWPzhGMMb62zKQwPu1zMaE6XzZtMcinLRyYySMUZbCWVktjbX
   qbOTv/6JsmZtjGur8vPdorEfevCk3NRp2YwGm/pKullIo7rs+r52nJodE
   NDJUndwaFctdoIV8jgxgl3diGbPdh4qnDaTuIgYAtfBT9C/aLqqvFkjW/
   h4Sb/8kRD/sVlhWNgXKZgsihSTyq22eI6dmGmEXzkxGVEGw4T87x+xFmu
   g==;
X-CSE-ConnectionGUID: CSYQpD2QRzaPnTeYUsJ0OQ==
X-CSE-MsgGUID: iQabmfGLSKm+yY23//iN3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="58907347"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="58907347"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 03:46:57 -0700
X-CSE-ConnectionGUID: jXryNwtJR/GWJL+OfsXMZQ==
X-CSE-MsgGUID: pfmBAjN7RzKl19/gMU4R8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="195157709"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2025 03:46:53 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucic6-000EZ1-2I;
	Fri, 18 Jul 2025 10:46:50 +0000
Date: Fri, 18 Jul 2025 18:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 11/26] media: videobuf2-v4l2: Support vb2_queue embedded
 in a context
Message-ID: <202507181803.MKWlcVqu-lkp@intel.com>
References: <20250717-multicontext-mainline-2025-v1-11-81ac18979c03@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-multicontext-mainline-2025-v1-11-81ac18979c03@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build errors:

[auto build test ERROR on d968e50b5c26642754492dea23cbd3592bde62d8]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-mc-Add-per-file-handle-data-support/20250717-190546
base:   d968e50b5c26642754492dea23cbd3592bde62d8
patch link:    https://lore.kernel.org/r/20250717-multicontext-mainline-2025-v1-11-81ac18979c03%40ideasonboard.com
patch subject: [PATCH 11/26] media: videobuf2-v4l2: Support vb2_queue embedded in a context
config: x86_64-buildonly-randconfig-004-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181803.MKWlcVqu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181803.MKWlcVqu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181803.MKWlcVqu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/common/videobuf2/videobuf2-v4l2.c:1012:5: error: call to undeclared function 'video_device_context_from_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1012 |                                 video_device_context_from_file(file, vdev);
         |                                 ^
>> drivers/media/common/videobuf2/videobuf2-v4l2.c:1011:31: error: incompatible integer to pointer conversion initializing 'struct video_device_context *' with an expression of type 'int' [-Wint-conversion]
    1011 |         struct video_device_context *ctx =
         |                                      ^
    1012 |                                 video_device_context_from_file(file, vdev);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/common/videobuf2/videobuf2-v4l2.c:1014:19: error: incomplete definition of type 'struct video_device_context'
    1014 |         return ctx ? &ctx->queue
         |                       ~~~^
   include/media/v4l2-dev.h:288:9: note: forward declaration of 'struct video_device_context'
     288 |         struct video_device_context *default_context;
         |                ^
   drivers/media/common/videobuf2/videobuf2-v4l2.c:1015:54: error: incomplete definition of type 'struct video_device_context'
    1015 |                    : vdev->default_context ? &vdev->default_context->queue
         |                                               ~~~~~~~~~~~~~~~~~~~~~^
   include/media/v4l2-dev.h:288:9: note: forward declaration of 'struct video_device_context'
     288 |         struct video_device_context *default_context;
         |                ^
   4 errors generated.


vim +/video_device_context_from_file +1012 drivers/media/common/videobuf2/videobuf2-v4l2.c

   992	
   993	/*
   994	 * The following functions are not part of the vb2 core API, but are helper
   995	 * functions that plug into struct v4l2_ioctl_ops, struct v4l2_file_operations
   996	 * and struct vb2_ops.
   997	 * They contain boilerplate code that most if not all drivers have to do
   998	 * and so they simplify the driver code.
   999	 */
  1000	
  1001	/*
  1002	 * Helper to get the vb2 queue either from:
  1003	 * 1) The video context bound to the open file handle
  1004	 * 2) The default context for context-aware drivers if userspace has not bound
  1005	 *    a context to the file handle
  1006	 * 3) From the video device for non-context aware drivers
  1007	 */
  1008	static struct vb2_queue *get_vb2_queue(struct file *file,
  1009					       struct video_device *vdev)
  1010	{
> 1011		struct video_device_context *ctx =
> 1012					video_device_context_from_file(file, vdev);
  1013	
> 1014		return ctx ? &ctx->queue
  1015			   : vdev->default_context ? &vdev->default_context->queue
  1016			   : vdev->queue;
  1017	}
  1018	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

