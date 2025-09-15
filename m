Return-Path: <linux-media+bounces-42562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE38B57D52
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 15:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBAB61889170
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 13:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC193315D47;
	Mon, 15 Sep 2025 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iP/hQB7Z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CFB313E39;
	Mon, 15 Sep 2025 13:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757943131; cv=none; b=rbb7g+sIJ9n6oUT4q0l/SNFNdnNdwOTfka2Q9CJ527GNpz7U/qHH8KwMRs/cIcwjsQgFzv+pVoxiqjpA/SFuCO6jM10OfX8dbyg4DjiCK+TpdCwE9jM68q2QVkLwAtLW7Xch85ML4sBbp3GGwQrMkeAcuR8QuijgG2qO4cyoUq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757943131; c=relaxed/simple;
	bh=k7APw+7V8PNd8IB0fAO6nOf+PeE0WSb2I+w3OW89x10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Is2/JXI8g/k8ULJvhLRvcVwg+5yrtoz1EPsQM8m7rhG+0dGIjMgWADUNwHPVUPyOMli+7QuajzRdhmIlo+77oqFRy+wuJbZkoqdDshz+hvf9btN5EWxD9UuOWbdFFZ0oYwxDcTIVune35HtHVP2nZMT+QFpyKvCSuA6Vov3H3uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iP/hQB7Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-56-182.net.vodafone.it [5.90.56.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5F748D4;
	Mon, 15 Sep 2025 15:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757943049;
	bh=k7APw+7V8PNd8IB0fAO6nOf+PeE0WSb2I+w3OW89x10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iP/hQB7Zutz0NwyinWcdTqovZFAdiTd98hd3Zh9P3IRrC7xx8nwYCjOdI8bmEneG+
	 6cd5+8mHWijpos30s62l1cJr9B+bTxhWdsZmfGHSTKZnQl0aSat3+tzpdr4u+BxcIr
	 utZhbyITMiYF7QCZRBecgNc27yhL+/kzxzzJtZd4=
Date: Mon, 15 Sep 2025 15:31:58 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: kernel test robot <lkp@intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 5/8] media: v4l2-core: Introduce v4l2-params.c
Message-ID: <jhynzoppwi22vnrdzrvqixsbvntsli7sj2vtsxrevtmxluveps@q6yzgvlqmxxb>
References: <20250820-extensible-parameters-validation-v4-5-30fe5a99cb1f@ideasonboard.com>
 <202508240704.AZwGXBaw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202508240704.AZwGXBaw-lkp@intel.com>

Question for media maintainers...

I'm not sure how I should better handle this one

On Sun, Aug 24, 2025 at 07:16:21AM +0800, kernel test robot wrote:
> Hi Jacopo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on a75b8d198c55e9eb5feb6f6e155496305caba2dc]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-uapi-Introduce-V4L2-extensible-params/20250820-210503
> base:   a75b8d198c55e9eb5feb6f6e155496305caba2dc
> patch link:    https://lore.kernel.org/r/20250820-extensible-parameters-validation-v4-5-30fe5a99cb1f%40ideasonboard.com
> patch subject: [PATCH v4 5/8] media: v4l2-core: Introduce v4l2-params.c
> config: nios2-randconfig-002-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240704.AZwGXBaw-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 9.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240704.AZwGXBaw-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508240704.AZwGXBaw-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    nios2-linux-ld: drivers/media/v4l2-core/v4l2-params.o: in function `v4l2_params_buffer_validate':
>    v4l2-params.c:(.text+0x124): undefined reference to `vb2_plane_vaddr'
> >> v4l2-params.c:(.text+0x124): relocation truncated to fit: R_NIOS2_CALL26 against `vb2_plane_vaddr'
>

Clearly v4l2-params.c (now v4l2-isp.c) depends on VIDEOBUF2_CORE

Right now v4l2-params.c gets compiled in as part of the
videodev-objs Makefile target. IOW is not gated by a KConfig option.

To select (or better, depend) on VIDEOBUF2_CORE I should guard
v4l2-params.c with a KConfig option so that I can 'depend on
VIDEOBUF2_CORE'. Drivers that use the v4l2-params.c helper would then
have to 'select V4L2_PARAMS` (or similar).

Is this the best approach or are there alternatives I might be missing ?

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

