Return-Path: <linux-media+bounces-21830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 095A69D5DBF
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 12:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C376D28189E
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB3C1DDA3E;
	Fri, 22 Nov 2024 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nx01G7IL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C0214A84
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 11:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732273535; cv=none; b=ufqyF9pXpLAcsGJdbT9VUoIG3oVZJua+rAKjbZl+A3PS8anMQH7RuYnEKEmYRE4B626hxJR6tQY3i9+zA6NcvvDHXumwpxZaK8hifGQxBnfvKRmAdYqaQH7/vxLtvV1z7yUQpPt26JcO1LXIYV7KL3AqwDJbf5lddc23JDI1vik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732273535; c=relaxed/simple;
	bh=3JppLsnsxVHXi1/sFRMfoTXtIQdd5tT25m5IU89g1ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8zuas9iAaFv4zfrDMF6GL09M80pl2PbQK1HkWtfnLIn/VYWEwN8kk5+hyBzdtN3fkzSIaSVo4XVqeANCSHYYrzyTNr7E0Ij61r6j5ghPO1EfE7Vxsv3sxx5priqgVjyMD3xMggYgvhdfpa96rpA9NdEZdB7UzgeejxHHli+x+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nx01G7IL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732273533; x=1763809533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3JppLsnsxVHXi1/sFRMfoTXtIQdd5tT25m5IU89g1ng=;
  b=nx01G7ILYk3yMrInpumakCsbAMmt6rD/6Y5SqFLaZbUje+xXyeZJo3dK
   eHw39DBcRtX+wQAeo6RFjZ1/68QB0NzwMT61/ajrxc71m2r0k37kPD2w7
   Y/2PAMDT/r5ouf8poFKJij45RWZRvLtUOIe5O3S86P6ys9S1iZxZqEiaB
   vhZLypm22qCFiLk3oMXwaQBr0vtpb6/u6+8yj2oEKdV1Vzb33huVvIQWK
   X2M7C3PyCw5hec57oycKfEHOd0phTfzYVqKchnMzGASDJDUjrm6FIMvfy
   1dv41CNuFpxuJ6nibVLyQVun/oyjLY7dfA2WNxr54hW4Gv1OpA4AKgPZs
   A==;
X-CSE-ConnectionGUID: AqGn2qWvRau9g+5dl2lJ+w==
X-CSE-MsgGUID: w61SdA54T3Oz6Mj2aIZVSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36332697"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="36332697"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 03:05:32 -0800
X-CSE-ConnectionGUID: 1HbunXj0RKm/JWO/LAz5oA==
X-CSE-MsgGUID: 3nry2ZI5QGyjzrYgGBaIbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="94988468"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.26])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 03:05:27 -0800
Date: Fri, 22 Nov 2024 12:05:18 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: Re: [PATCH 4/8] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <zkutcofvbohwe46ua2jtpawo7avy65ze2n5u7si2lekes553oo@3xq2grunptcy>
References: <20241122100633.8971-1-sakari.ailus@linux.intel.com>
 <20241122100633.8971-5-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122100633.8971-5-sakari.ailus@linux.intel.com>

Hi Sakari,

3 small details

On Fri, Nov 22, 2024 at 12:06:29PM +0200, Sakari Ailus wrote:
> Sub-device configuration models define what V4L2 API elements are
> available on a compliant sub-device and how do they behave.
> 
> The patch also adds a model for common raw sensors.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

[SNIP]

> +
> +The combination of the analogue crop and binning, sub-sampling and scaling
> +operations may result in an image size that may be larger than desirable. For
> +this purpose, a digital crop operation may be performed on the image after these
> +operations. The resulting image size is further output by the sensor.
> +
> +Drivers may only support some of even none of these configurations, in which
                                   |
				   +-> or ?

> +case they do not expose the corresponding selection rectangles.
> +
> +Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
> +
> +.. flat-table:: Selection targets on pads
> +    :header-rows: 1
> +
> +    * - Pad/Stream
> +      - Selection target/format
> +      - Mandatory (X/-)
> +      - Modifiable (X/-)
> +      - Synopsis
> +    * - 1/0
> +      - Format
> +      - X
> +      - \-
> +      - Image data format. The width and height fields of this format are the
> +        same than those for the V4L2_SEL_TGT_CROP_BOUNDS rectangle. The media
                --------------
                     |
		     +-> same as

> +        bus code of this format reflects the native pixel depth of the sensor.
> +    * - 1/0
> +      - V4L2_SEL_TGT_CROP_BOUNDS
> +      - X
> +      - \-
> +      - X
> +      - Digital crop. This rectangle is relative to the V4L2_SEL_TGT_COMPOSE
> +        rectangle on (pad, stream) pair 1/0.
> +    * - 0/0
> +      - Format
> +      - X
> +      - X
> +      - Image data source format. The width and height fields of the format are
> +        the same than for the V4L2_SEL_TGT_CROP rectangle on (pad, stream) pair
                    --------
                       |
                       +-> same as

> +        0/0 and the media bus code reflects the pixel data output of the sensor.
> +    * - 0/1
> +      - Format
> +      - X
> +      - \-
> +      - Embedded data source format.
> +

--
Kind Regards
Mehdi Djait

