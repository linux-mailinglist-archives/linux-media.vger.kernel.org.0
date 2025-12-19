Return-Path: <linux-media+bounces-49177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 491E8CD0341
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 15:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 120A730164D0
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 14:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4EE328255;
	Fri, 19 Dec 2025 14:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcBS3Omw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962D11DED57;
	Fri, 19 Dec 2025 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766153272; cv=none; b=uZjGHV0ILv6m2Tjy4p/1oLs3Y/Aykk0QabYVe+tQXXcPXGdpsZO6OBkLkBeLZTy4ZOJKgaluV0IODBt+oijCAxHHQ52CK4+eUwpqwNmCEuVWzDB++rqMt2O2tTR04EaGfthAxifk3zHJMpl2/sLjzob22xacYG6sSsVR+rgjeM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766153272; c=relaxed/simple;
	bh=IytLNYkjuFlNMe8IVwgNkH5Pyqqd5XXVr7rm7cfa1hQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sy7yriiD3/ca7rpyYaHghieeF0iu7E8pXVkwRDEvGRDw2I1mZP94vP9gj/3R4KRPTAoJC6ISXOiw+TpV278zEDDv1aOWX2bjBXXXrHWXRZbaki28EyyaJqEmczlc5+bml29wvULvtvcXT2RW4v78CA7MkQSNCq1FQmWpXiH6ESY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcBS3Omw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766153269; x=1797689269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IytLNYkjuFlNMe8IVwgNkH5Pyqqd5XXVr7rm7cfa1hQ=;
  b=EcBS3OmwKU8ndPenvJw5TVNUPMbwswZmUQZ18WTU+vw+3r1rjhd3zUof
   6qCIic8O+MN+kcWKl+gPLXsj4tX3s4/U1qhT6+/iS/nucHxiHkx+8xPiT
   mGwjSNAEbMqg8riaa3L7CTqQLPQaE6QqXGhqwfrMn0OAy5vdm5bgrEPJf
   V9dcfogeH7g7CQihi+NLUnDTnCDWKsUlSvBMH01oIfDiRhVVv3icyy25x
   qolpW/kUpedfUJpgKY0vC0zu7hWzO5oZRHdlczr+//Dbj02OyGiulTcoz
   8bJl6eU6kBVhCKL4XtRHsANNhu3hOsWrr+I2rXWJweqjtbipwZ/cBzzlG
   w==;
X-CSE-ConnectionGUID: 2Lw4Ivg3Qy63sOFOxImwUA==
X-CSE-MsgGUID: ytImkN9uSYet4sj0H21srA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71973438"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71973438"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:07:48 -0800
X-CSE-ConnectionGUID: SFy4u1FXTd2s4YfOWxgHCQ==
X-CSE-MsgGUID: m5cBbL1eQjyToH+Aiys/mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="222288722"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.34])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:07:44 -0800
Date: Fri, 19 Dec 2025 15:07:37 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: robh@kernel.org, krzk+dt@kernel.org, sakari.ailus@linux.intel.com, 
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Dongcheng Yan <dongcheng.yan@intel.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Jingjing Xiong <jingjing.xiong@intel.com>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] media: i2c: add os05b10 image sensor driver
Message-ID: <7p46ga3lc5ky2234q6c222gz5ftpcaqfvax5ouysr4cj5sczlf@47ukejyhblbq>
References: <20251219084526.22841-1-himanshu.bhavani@siliconsignals.io>
 <20251219084526.22841-3-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219084526.22841-3-himanshu.bhavani@siliconsignals.io>

Hello Himanshu,

Thank you for the patch!

On Fri, Dec 19, 2025 at 02:15:19PM +0530, Himanshu Bhavani wrote:
> Add a v4l2 subdevice driver for the Omnivision OS05B10 sensor.
> 
> The Omnivision OS05B10 image sensor with an active
> array size of 2592 x 1944.
> 
> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Supported resolution: 2592 x 1944 @ 60fps (SBGGR10)
> 
> Co-developed-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

[...]

> +static const struct cci_reg_sequence os05b10_common_regs[] = {
> +	{ CCI_REG8(0x0301), 0x44 },
> +	{ CCI_REG8(0x0303), 0x02 },
> +	{ CCI_REG8(0x0305), 0x32 },
> +	{ CCI_REG8(0x0306), 0x00 },
> +	{ CCI_REG8(0x0325), 0x3b },
> +	{ CCI_REG8(0x3002), 0x21 },
> +	{ CCI_REG8(0x3016), 0x72 },
> +	{ CCI_REG8(0x301e), 0xb4 },
> +	{ CCI_REG8(0x301f), 0xd0 },
> +	{ CCI_REG8(0x3021), 0x03 },
> +	{ CCI_REG8(0x3022), 0x01 },
> +	{ CCI_REG8(0x3107), 0xa1 },
> +	{ CCI_REG8(0x3108), 0x7d },
> +	{ CCI_REG8(0x3109), 0xfc },
> +	{ CCI_REG8(0x3500), 0x00 },
> +	{ CCI_REG8(0x3501), 0x07 },
> +	{ CCI_REG8(0x3502), 0xb6 },
> +	{ CCI_REG8(0x3503), 0x88 },
> +	{ CCI_REG8(0x3508), 0x00 },
> +	{ CCI_REG8(0x3509), 0x80 },
> +	{ CCI_REG8(0x350a), 0x04 },
> +	{ CCI_REG8(0x350b), 0x00 },
> +	{ CCI_REG8(0x350c), 0x00 },
> +	{ CCI_REG8(0x350d), 0x80 },
> +	{ CCI_REG8(0x350e), 0x04 },
> +	{ CCI_REG8(0x350f), 0x00 },
> +	{ CCI_REG8(0x3510), 0x00 },
> +	{ CCI_REG8(0x3511), 0x00 },
> +	{ CCI_REG8(0x3512), 0x20 },
> +	{ CCI_REG8(0x3600), 0x4d },
> +	{ CCI_REG8(0x3601), 0x08 },
> +	{ CCI_REG8(0x3610), 0x87 },
> +	{ CCI_REG8(0x3611), 0x24 },
> +	{ CCI_REG8(0x3614), 0x4c },
> +	{ CCI_REG8(0x3620), 0x0c },
> +	{ CCI_REG8(0x3632), 0x80 },
> +	{ CCI_REG8(0x3633), 0x00 },
> +	{ CCI_REG8(0x3636), 0xcc },
> +	{ CCI_REG8(0x3637), 0x27 },
> +	{ CCI_REG8(0x3660), 0x00 },
> +	{ CCI_REG8(0x3662), 0x10 },
> +	{ CCI_REG8(0x3665), 0x00 },
> +	{ CCI_REG8(0x3666), 0x00 },
> +	{ CCI_REG8(0x366a), 0x14 },
> +	{ CCI_REG8(0x3670), 0x0b },
> +	{ CCI_REG8(0x3671), 0x0b },
> +	{ CCI_REG8(0x3672), 0x0b },
> +	{ CCI_REG8(0x3673), 0x0b },
> +	{ CCI_REG8(0x3678), 0x2b },
> +	{ CCI_REG8(0x367a), 0x11 },
> +	{ CCI_REG8(0x367b), 0x11 },
> +	{ CCI_REG8(0x367c), 0x11 },
> +	{ CCI_REG8(0x367d), 0x11 },
> +	{ CCI_REG8(0x3681), 0xff },
> +	{ CCI_REG8(0x3682), 0x86 },
> +	{ CCI_REG8(0x3683), 0x44 },
> +	{ CCI_REG8(0x3684), 0x24 },
> +	{ CCI_REG8(0x3685), 0x00 },
> +	{ CCI_REG8(0x368a), 0x00 },
> +	{ CCI_REG8(0x368d), 0x2b },
> +	{ CCI_REG8(0x368e), 0x2b },
> +	{ CCI_REG8(0x3690), 0x00 },
> +	{ CCI_REG8(0x3691), 0x0b },
> +	{ CCI_REG8(0x3692), 0x0b },
> +	{ CCI_REG8(0x3693), 0x0b },
> +	{ CCI_REG8(0x3694), 0x0b },
> +	{ CCI_REG8(0x369d), 0x68 },
> +	{ CCI_REG8(0x369e), 0x34 },
> +	{ CCI_REG8(0x369f), 0x1b },
> +	{ CCI_REG8(0x36a0), 0x0f },
> +	{ CCI_REG8(0x36a1), 0x77 },
> +	{ CCI_REG8(0x36b0), 0x30 },
> +	{ CCI_REG8(0x36b2), 0x00 },
> +	{ CCI_REG8(0x36b3), 0x00 },
> +	{ CCI_REG8(0x36b4), 0x00 },
> +	{ CCI_REG8(0x36b5), 0x00 },
> +	{ CCI_REG8(0x36b6), 0x00 },
> +	{ CCI_REG8(0x36b7), 0x00 },
> +	{ CCI_REG8(0x36b8), 0x00 },
> +	{ CCI_REG8(0x36b9), 0x00 },
> +	{ CCI_REG8(0x36ba), 0x00 },
> +	{ CCI_REG8(0x36bb), 0x00 },
> +	{ CCI_REG8(0x36bc), 0x00 },
> +	{ CCI_REG8(0x36bd), 0x00 },
> +	{ CCI_REG8(0x36be), 0x00 },
> +	{ CCI_REG8(0x36bf), 0x00 },
> +	{ CCI_REG8(0x36c0), 0x01 },
> +	{ CCI_REG8(0x36c1), 0x00 },
> +	{ CCI_REG8(0x36c2), 0x00 },
> +	{ CCI_REG8(0x36c3), 0x00 },
> +	{ CCI_REG8(0x36c4), 0x00 },
> +	{ CCI_REG8(0x36c5), 0x00 },
> +	{ CCI_REG8(0x36c6), 0x00 },
> +	{ CCI_REG8(0x36c7), 0x00 },
> +	{ CCI_REG8(0x36c8), 0x00 },
> +	{ CCI_REG8(0x36c9), 0x00 },
> +	{ CCI_REG8(0x36ca), 0x0e },
> +	{ CCI_REG8(0x36cb), 0x0e },
> +	{ CCI_REG8(0x36cc), 0x0e },
> +	{ CCI_REG8(0x36cd), 0x0e },
> +	{ CCI_REG8(0x36ce), 0x0c },
> +	{ CCI_REG8(0x36cf), 0x0c },
> +	{ CCI_REG8(0x36d0), 0x0c },
> +	{ CCI_REG8(0x36d1), 0x0c },
> +	{ CCI_REG8(0x36d2), 0x00 },
> +	{ CCI_REG8(0x36d3), 0x08 },
> +	{ CCI_REG8(0x36d4), 0x10 },
> +	{ CCI_REG8(0x36d5), 0x10 },
> +	{ CCI_REG8(0x36d6), 0x00 },
> +	{ CCI_REG8(0x36d7), 0x08 },
> +	{ CCI_REG8(0x36d8), 0x10 },
> +	{ CCI_REG8(0x36d9), 0x10 },
> +	{ CCI_REG8(0x3701), 0x1d },
> +	{ CCI_REG8(0x3703), 0x2a },
> +	{ CCI_REG8(0x3704), 0x05 },
> +	{ CCI_REG8(0x3709), 0x57 },
> +	{ CCI_REG8(0x370b), 0x63 },
> +	{ CCI_REG8(0x3706), 0x28 },
> +	{ CCI_REG8(0x370a), 0x00 },
> +	{ CCI_REG8(0x370b), 0x63 },
> +	{ CCI_REG8(0x370e), 0x0c },
> +	{ CCI_REG8(0x370f), 0x1c },
> +	{ CCI_REG8(0x3710), 0x00 },
> +	{ CCI_REG8(0x3713), 0x00 },
> +	{ CCI_REG8(0x3714), 0x24 },
> +	{ CCI_REG8(0x3716), 0x24 },
> +	{ CCI_REG8(0x371a), 0x1e },
> +	{ CCI_REG8(0x3724), 0x09 },
> +	{ CCI_REG8(0x3725), 0xb2 },
> +	{ CCI_REG8(0x372b), 0x54 },
> +	{ CCI_REG8(0x3730), 0xe1 },
> +	{ CCI_REG8(0x3735), 0x80 },
> +	{ CCI_REG8(0x3739), 0x10 },
> +	{ CCI_REG8(0x373f), 0xb0 },
> +	{ CCI_REG8(0x3740), 0x28 },
> +	{ CCI_REG8(0x3741), 0x21 },
> +	{ CCI_REG8(0x3742), 0x21 },
> +	{ CCI_REG8(0x3743), 0x21 },
> +	{ CCI_REG8(0x3744), 0x63 },
> +	{ CCI_REG8(0x3745), 0x5a },
> +	{ CCI_REG8(0x3746), 0x5a },
> +	{ CCI_REG8(0x3747), 0x5a },
> +	{ CCI_REG8(0x3748), 0x00 },
> +	{ CCI_REG8(0x3749), 0x00 },
> +	{ CCI_REG8(0x374a), 0x00 },
> +	{ CCI_REG8(0x374b), 0x00 },
> +	{ CCI_REG8(0x3756), 0x00 },
> +	{ CCI_REG8(0x3757), 0x0e },
> +	{ CCI_REG8(0x375d), 0x84 },
> +	{ CCI_REG8(0x3760), 0x11 },
> +	{ CCI_REG8(0x3767), 0x08 },
> +	{ CCI_REG8(0x376f), 0x42 },
> +	{ CCI_REG8(0x3771), 0x00 },
> +	{ CCI_REG8(0x3773), 0x01 },
> +	{ CCI_REG8(0x3774), 0x02 },
> +	{ CCI_REG8(0x3775), 0x12 },
> +	{ CCI_REG8(0x3776), 0x02 },
> +	{ CCI_REG8(0x377b), 0x40 },
> +	{ CCI_REG8(0x377c), 0x00 },
> +	{ CCI_REG8(0x377d), 0x0c },
> +	{ CCI_REG8(0x3782), 0x02 },
> +	{ CCI_REG8(0x3787), 0x24 },
> +	{ CCI_REG8(0x378a), 0x01 },
> +	{ CCI_REG8(0x378d), 0x00 },
> +	{ CCI_REG8(0x3790), 0x1f },
> +	{ CCI_REG8(0x3791), 0x58 },
> +	{ CCI_REG8(0x3795), 0x24 },
> +	{ CCI_REG8(0x3796), 0x01 },
> +	{ CCI_REG8(0x3798), 0x40 },
> +	{ CCI_REG8(0x379c), 0x00 },
> +	{ CCI_REG8(0x379d), 0x00 },
> +	{ CCI_REG8(0x379e), 0x00 },
> +	{ CCI_REG8(0x379f), 0x01 },
> +	{ CCI_REG8(0x37a1), 0x10 },
> +	{ CCI_REG8(0x37a6), 0x00 },
> +	{ CCI_REG8(0x37ab), 0x0e },
> +	{ CCI_REG8(0x37ac), 0xa0 },
> +	{ CCI_REG8(0x37be), 0x0a },
> +	{ CCI_REG8(0x37bf), 0x05 },
> +	{ CCI_REG8(0x37bb), 0x02 },
> +	{ CCI_REG8(0x37bf), 0x05 },
> +	{ CCI_REG8(0x37c2), 0x04 },
> +	{ CCI_REG8(0x37c4), 0x11 },
> +	{ CCI_REG8(0x37c5), 0x80 },
> +	{ CCI_REG8(0x37c6), 0x14 },
> +	{ CCI_REG8(0x37c7), 0x08 },
> +	{ CCI_REG8(0x37c8), 0x42 },
> +	{ CCI_REG8(0x37cd), 0x17 },
> +	{ CCI_REG8(0x37ce), 0x01 },
> +	{ CCI_REG8(0x37d8), 0x02 },
> +	{ CCI_REG8(0x37d9), 0x08 },
> +	{ CCI_REG8(0x37dc), 0x01 },
> +	{ CCI_REG8(0x37e0), 0x0c },
> +	{ CCI_REG8(0x37e1), 0x20 },
> +	{ CCI_REG8(0x37e2), 0x10 },
> +	{ CCI_REG8(0x37e3), 0x04 },
> +	{ CCI_REG8(0x37e4), 0x28 },
> +	{ CCI_REG8(0x37e5), 0x02 },
> +	{ CCI_REG8(0x37ef), 0x00 },
> +	{ CCI_REG8(0x37f4), 0x00 },
> +	{ CCI_REG8(0x37f5), 0x00 },
> +	{ CCI_REG8(0x37f6), 0x00 },
> +	{ CCI_REG8(0x37f7), 0x00 },
> +	{ CCI_REG8(0x3800), 0x01 },
> +	{ CCI_REG8(0x3801), 0x30 },
> +	{ CCI_REG8(0x3802), 0x00 },
> +	{ CCI_REG8(0x3803), 0x00 },
> +	{ CCI_REG8(0x3804), 0x0b },
> +	{ CCI_REG8(0x3805), 0x5f },
> +	{ CCI_REG8(0x3806), 0x07 },
> +	{ CCI_REG8(0x3807), 0xa7 },
> +	{ CCI_REG8(0x3808), 0x0a },
> +	{ CCI_REG8(0x3809), 0x20 },
> +	{ CCI_REG8(0x380a), 0x07 },
> +	{ CCI_REG8(0x380b), 0x98 },
> +	{ CCI_REG8(0x380c), 0x06 },
> +	{ CCI_REG8(0x380d), 0xd0 },
> +	{ CCI_REG8(0x380e), 0x07 },
> +	{ CCI_REG8(0x380f), 0xd6 },
> +	{ CCI_REG8(0x3810), 0x00 },
> +	{ CCI_REG8(0x3811), 0x08 },
> +	{ CCI_REG8(0x3812), 0x00 },
> +	{ CCI_REG8(0x3813), 0x08 },
> +	{ CCI_REG8(0x3814), 0x01 },
> +	{ CCI_REG8(0x3815), 0x01 },
> +	{ CCI_REG8(0x3816), 0x01 },
> +	{ CCI_REG8(0x3817), 0x01 },
> +	{ CCI_REG8(0x3818), 0x00 },
> +	{ CCI_REG8(0x3819), 0x00 },
> +	{ CCI_REG8(0x381a), 0x00 },
> +	{ CCI_REG8(0x381b), 0x01 },
> +	{ CCI_REG8(0x3820), 0x88 },
> +	{ CCI_REG8(0x3821), 0x00 },
> +	{ CCI_REG8(0x3822), 0x12 },
> +	{ CCI_REG8(0x3823), 0x08 },
> +	{ CCI_REG8(0x3824), 0x00 },
> +	{ CCI_REG8(0x3825), 0x20 },
> +	{ CCI_REG8(0x3826), 0x00 },
> +	{ CCI_REG8(0x3827), 0x08 },
> +	{ CCI_REG8(0x3829), 0x03 },
> +	{ CCI_REG8(0x382a), 0x00 },
> +	{ CCI_REG8(0x382b), 0x00 },
> +	{ CCI_REG8(0x3832), 0x08 },
> +	{ CCI_REG8(0x3838), 0x00 },
> +	{ CCI_REG8(0x3839), 0x00 },
> +	{ CCI_REG8(0x383a), 0x00 },
> +	{ CCI_REG8(0x383b), 0x00 },
> +	{ CCI_REG8(0x383d), 0x01 },
> +	{ CCI_REG8(0x383e), 0x00 },
> +	{ CCI_REG8(0x383f), 0x00 },
> +	{ CCI_REG8(0x3843), 0x00 },
> +	{ CCI_REG8(0x3880), 0x16 },
> +	{ CCI_REG8(0x3881), 0x00 },
> +	{ CCI_REG8(0x3882), 0x08 },
> +	{ CCI_REG8(0x389a), 0x00 },
> +	{ CCI_REG8(0x389b), 0x00 },
> +	{ CCI_REG8(0x38a2), 0x02 },
> +	{ CCI_REG8(0x38a3), 0x02 },
> +	{ CCI_REG8(0x38a4), 0x02 },
> +	{ CCI_REG8(0x38a5), 0x02 },
> +	{ CCI_REG8(0x38a7), 0x04 },
> +	{ CCI_REG8(0x38b8), 0x02 },
> +	{ CCI_REG8(0x3c80), 0x3e },
> +	{ CCI_REG8(0x3c86), 0x01 },
> +	{ CCI_REG8(0x3c87), 0x02 },
> +	{ CCI_REG8(0x389c), 0x00 },
> +	{ CCI_REG8(0x3ca2), 0x0c },
> +	{ CCI_REG8(0x3d85), 0x1b },
> +	{ CCI_REG8(0x3d8c), 0x01 },
> +	{ CCI_REG8(0x3d8d), 0xe2 },
> +	{ CCI_REG8(0x3f00), 0xcb },
> +	{ CCI_REG8(0x3f03), 0x08 },
> +	{ CCI_REG8(0x3f9e), 0x07 },
> +	{ CCI_REG8(0x3f9f), 0x04 },
> +	{ CCI_REG8(0x4000), 0xf3 },
> +	{ CCI_REG8(0x4002), 0x00 },
> +	{ CCI_REG8(0x4003), 0x40 },
> +	{ CCI_REG8(0x4008), 0x02 },
> +	{ CCI_REG8(0x4009), 0x0d },
> +	{ CCI_REG8(0x400a), 0x01 },
> +	{ CCI_REG8(0x400b), 0x00 },
> +	{ CCI_REG8(0x4040), 0x00 },
> +	{ CCI_REG8(0x4041), 0x07 },
> +	{ CCI_REG8(0x4090), 0x14 },
> +	{ CCI_REG8(0x40b0), 0x01 },
> +	{ CCI_REG8(0x40b1), 0x01 },
> +	{ CCI_REG8(0x40b2), 0x30 },
> +	{ CCI_REG8(0x40b3), 0x04 },
> +	{ CCI_REG8(0x40b4), 0xe8 },
> +	{ CCI_REG8(0x40b5), 0x01 },
> +	{ CCI_REG8(0x40b7), 0x07 },
> +	{ CCI_REG8(0x40b8), 0xff },
> +	{ CCI_REG8(0x40b9), 0x00 },
> +	{ CCI_REG8(0x40ba), 0x00 },
> +	{ CCI_REG8(0x4300), 0xff },
> +	{ CCI_REG8(0x4301), 0x00 },
> +	{ CCI_REG8(0x4302), 0x0f },
> +	{ CCI_REG8(0x4303), 0x20 },
> +	{ CCI_REG8(0x4304), 0x20 },
> +	{ CCI_REG8(0x4305), 0x83 },
> +	{ CCI_REG8(0x4306), 0x21 },
> +	{ CCI_REG8(0x430d), 0x00 },
> +	{ CCI_REG8(0x4505), 0xc4 },
> +	{ CCI_REG8(0x4506), 0x00 },
> +	{ CCI_REG8(0x4507), 0x60 },
> +	{ CCI_REG8(0x4803), 0x00 },
> +	{ CCI_REG8(0x4809), 0x8e },
> +	{ CCI_REG8(0x480e), 0x00 },
> +	{ CCI_REG8(0x4813), 0x00 },
> +	{ CCI_REG8(0x4814), 0x2a },
> +	{ CCI_REG8(0x481b), 0x40 },
> +	{ CCI_REG8(0x481f), 0x30 },
> +	{ CCI_REG8(0x4825), 0x34 },
> +	{ CCI_REG8(0x4829), 0x64 },
> +	{ CCI_REG8(0x4837), 0x12 },
> +	{ CCI_REG8(0x484b), 0x07 },
> +	{ CCI_REG8(0x4883), 0x36 },
> +	{ CCI_REG8(0x4885), 0x03 },
> +	{ CCI_REG8(0x488b), 0x00 },
> +	{ CCI_REG8(0x4d06), 0x01 },
> +	{ CCI_REG8(0x4e00), 0x2a },
> +	{ CCI_REG8(0x4e0d), 0x00 },
> +	{ CCI_REG8(0x5000), 0xf9 },
> +	{ CCI_REG8(0x5001), 0x09 },
> +	{ CCI_REG8(0x5004), 0x00 },
> +	{ CCI_REG8(0x5005), 0x0e },
> +	{ CCI_REG8(0x5036), 0x00 },
> +	{ CCI_REG8(0x5080), 0x04 },
> +	{ CCI_REG8(0x5082), 0x00 },
> +	{ CCI_REG8(0x5180), 0x00 },
> +	{ CCI_REG8(0x5181), 0x10 },
> +	{ CCI_REG8(0x5182), 0x01 },
> +	{ CCI_REG8(0x5183), 0xdf },
> +	{ CCI_REG8(0x5184), 0x02 },
> +	{ CCI_REG8(0x5185), 0x6c },
> +	{ CCI_REG8(0x5189), 0x48 },
> +	{ CCI_REG8(0x520a), 0x03 },
> +	{ CCI_REG8(0x520b), 0x0f },
> +	{ CCI_REG8(0x520c), 0x3f },
> +	{ CCI_REG8(0x580b), 0x03 },
> +	{ CCI_REG8(0x580d), 0x00 },
> +	{ CCI_REG8(0x580f), 0x00 },
> +	{ CCI_REG8(0x5820), 0x00 },
> +	{ CCI_REG8(0x5821), 0x00 },
> +	{ CCI_REG8(0x3222), 0x03 },
> +	{ CCI_REG8(0x3208), 0x06 },
> +	{ CCI_REG8(0x3701), 0x1d },
> +	{ CCI_REG8(0x37ab), 0x01 },
> +	{ CCI_REG8(0x3790), 0x21 },
> +	{ CCI_REG8(0x38be), 0x00 },
> +	{ CCI_REG8(0x3791), 0x5a },
> +	{ CCI_REG8(0x37bf), 0x1c },
> +	{ CCI_REG8(0x3610), 0x37 },
> +	{ CCI_REG8(0x3208), 0x16 },
> +	{ CCI_REG8(0x3208), 0x07 },
> +	{ CCI_REG8(0x3701), 0x1d },
> +	{ CCI_REG8(0x37ab), 0x0e },
> +	{ CCI_REG8(0x3790), 0x21 },
> +	{ CCI_REG8(0x38be), 0x00 },
> +	{ CCI_REG8(0x3791), 0x5a },
> +	{ CCI_REG8(0x37bf), 0x0a },
> +	{ CCI_REG8(0x3610), 0x87 },
> +	{ CCI_REG8(0x3208), 0x17 },
> +	{ CCI_REG8(0x3208), 0x08 },
> +	{ CCI_REG8(0x3701), 0x1d },
> +	{ CCI_REG8(0x37ab), 0x0e },
> +	{ CCI_REG8(0x3790), 0x21 },
> +	{ CCI_REG8(0x38be), 0x00 },
> +	{ CCI_REG8(0x3791), 0x5a },
> +	{ CCI_REG8(0x37bf), 0x0a },
> +	{ CCI_REG8(0x3610), 0x87 },
> +	{ CCI_REG8(0x3208), 0x18 },
> +	{ CCI_REG8(0x3208), 0x09 },
> +	{ CCI_REG8(0x3701), 0x1d },
> +	{ CCI_REG8(0x37ab), 0x0e },
> +	{ CCI_REG8(0x3790), 0x28 },
> +	{ CCI_REG8(0x38be), 0x00 },
> +	{ CCI_REG8(0x3791), 0x63 },
> +	{ CCI_REG8(0x37bf), 0x0a },
> +	{ CCI_REG8(0x3610), 0x87 },
> +	{ CCI_REG8(0x3208), 0x19 },
> +};

If you can go the extra mile and document some of these registers like in the
imx219 driver, that would be nice!

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait

