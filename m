Return-Path: <linux-media+bounces-42563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1E7B57F4F
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 16:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F01371633CB
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 14:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE5932CF91;
	Mon, 15 Sep 2025 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N2q0dBS2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D1F30C61B;
	Mon, 15 Sep 2025 14:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757947273; cv=none; b=r0FzrXQkpzhHzNhx5aImOMH6dNpSctFZH68cF2GX7dTbL2rz8hhgweCV0uH0f11e/fFTnoCzy/5daJlFb+jdvPVpreCVx1mczAS4hZ9ufwoDgNEUosq4op0ASREAuhRDLNhVzhJ1Ix6HNLjej0Am4AcSLydmA5if1A96C+8JuWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757947273; c=relaxed/simple;
	bh=UCT0GiCK1YOW+PhYr1Pzbcbe42IkXxQYZBGZKDcKnug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5fGB/AQCKHSgkWwl6GX4EMI4/dF2OUeifM9zrQw6EdY1tLiq1zgB5+s4CwvwfdIvmi4N1crtj2Kaw82h+ExS+mj7jCof3+ItenzToENLHfjrYMnnwBeNJ4pu3VKBcLBlnquwBaLlF0UX5ZjZhBTffDigkz8GdGpmGEUCfOQS3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N2q0dBS2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A17D36DF;
	Mon, 15 Sep 2025 16:39:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757947188;
	bh=UCT0GiCK1YOW+PhYr1Pzbcbe42IkXxQYZBGZKDcKnug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2q0dBS2ofT7pUa8jiujbAVSOMtx8wdhwtbRZwtFcdSaOZ+MxGhLqK4oh3ntDZ8Ax
	 FsDYMGCxuOsCmtbznoi9p6baEWTAK0Ij6QkkreAai3ITqpYLUHF1TxJbH++gbYj6vJ
	 Ql8gIMnJ/8P6F8rg8UbitM6gzX48+/uUQxj15t/k=
Date: Mon, 15 Sep 2025 17:40:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: kernel test robot <lkp@intel.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 5/8] media: v4l2-core: Introduce v4l2-params.c
Message-ID: <20250915144040.GA8821@pendragon.ideasonboard.com>
References: <20250820-extensible-parameters-validation-v4-5-30fe5a99cb1f@ideasonboard.com>
 <202508240704.AZwGXBaw-lkp@intel.com>
 <jhynzoppwi22vnrdzrvqixsbvntsli7sj2vtsxrevtmxluveps@q6yzgvlqmxxb>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <jhynzoppwi22vnrdzrvqixsbvntsli7sj2vtsxrevtmxluveps@q6yzgvlqmxxb>

On Mon, Sep 15, 2025 at 03:31:58PM +0200, Jacopo Mondi wrote:
> Question for media maintainers...
> 
> I'm not sure how I should better handle this one
> 
> On Sun, Aug 24, 2025 at 07:16:21AM +0800, kernel test robot wrote:
> > Hi Jacopo,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on a75b8d198c55e9eb5feb6f6e155496305caba2dc]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-uapi-Introduce-V4L2-extensible-params/20250820-210503
> > base:   a75b8d198c55e9eb5feb6f6e155496305caba2dc
> > patch link:    https://lore.kernel.org/r/20250820-extensible-parameters-validation-v4-5-30fe5a99cb1f%40ideasonboard.com
> > patch subject: [PATCH v4 5/8] media: v4l2-core: Introduce v4l2-params.c
> > config: nios2-randconfig-002-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240704.AZwGXBaw-lkp@intel.com/config)
> > compiler: nios2-linux-gcc (GCC) 9.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240704.AZwGXBaw-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202508240704.AZwGXBaw-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    nios2-linux-ld: drivers/media/v4l2-core/v4l2-params.o: in function `v4l2_params_buffer_validate':
> >    v4l2-params.c:(.text+0x124): undefined reference to `vb2_plane_vaddr'
> > >> v4l2-params.c:(.text+0x124): relocation truncated to fit: R_NIOS2_CALL26 against `vb2_plane_vaddr'
> 
> Clearly v4l2-params.c (now v4l2-isp.c) depends on VIDEOBUF2_CORE
> 
> Right now v4l2-params.c gets compiled in as part of the
> videodev-objs Makefile target. IOW is not gated by a KConfig option.
> 
> To select (or better, depend) on VIDEOBUF2_CORE I should guard
> v4l2-params.c with a KConfig option so that I can 'depend on
> VIDEOBUF2_CORE'. Drivers that use the v4l2-params.c helper would then
> have to 'select V4L2_PARAMS` (or similar).

Make it V4L2_ISP :-)

> Is this the best approach or are there alternatives I might be missing ?

We don't want VIDEODEV depending on VB2. I think it also makes sense to
have a separate Kconfig option for these helpers, are they will be used
by a small number of drivers.

Make CONFIG_V4L2_ISP an option that drivers select, not depend on.

-- 
Regards,

Laurent Pinchart

