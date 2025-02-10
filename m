Return-Path: <linux-media+bounces-25921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FDFA2EEDE
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 14:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1AE51884621
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 13:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C58230991;
	Mon, 10 Feb 2025 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nW/Bmgun"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A374B21C9E0
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739195604; cv=none; b=odh9CBS5xQJrypNGpamnPPF4vLvFD0xTC8wtIDkkEHwc/WLcAq96D+mFYS/hJ3cPW6qD1Ji9wFbwz9epWNKlnFgjkrDOzIM8AZRI/0xiL9/LcY01/5fzdLBNj/r0wZyqYzlcA7KC39OEblUGNmVGuRI8LGb4XSDi/BXOAIu1izQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739195604; c=relaxed/simple;
	bh=JVugNEdDeQh0Li0CEdEkQ8AsNl9L9z1peGFx9yJ0MrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRa/ZTgiwCr1M8HIpkI7wvXGXzHJKTLfBUthIPsQs+u/m6rFAQzvSSVx+nErFXRz3yLCxfpsnuq3mNZ4prfy8YsfwyOOQlnB+81Q23roSL+/YHsUiRp8hEW7DU50VOkAZcmlcbW8LJuZXOkBJVzR0BTJgfZ3RxGCUsD/de8bbII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nW/Bmgun; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739195602; x=1770731602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JVugNEdDeQh0Li0CEdEkQ8AsNl9L9z1peGFx9yJ0MrQ=;
  b=nW/Bmgun9NQa+K1soD94aAvBMVBqonwP1zQRz2ykPqlVd/F3Tr1+5g1E
   D4hNmZbppGPI5q6us0NN/h1b8Qh5OtIxyWEuTkwm7B2XYKgN0tTxyN4Vn
   xoiTsWB48D5cpSwqNB0VFucXeY+xaYshb3jsTpvfNyRAg65LiHEiWbrjw
   tlia7b7Qvl4FCvdTQUfEld6bVvMzo71klGtsegkS4cQoS+GRPv3D39vva
   ZNfk/t3A2zI1dom2AgA3gHcnVVEHxvb3Zxzb8Nc0CwIgcVf6o9bTqggqf
   j0mdMZuik4Zgwtad7oAzA0NV2YpybKediEzf3lK/U6YctQYhEjF56R/gC
   Q==;
X-CSE-ConnectionGUID: 2pYaX3DpSVqajdmxaPWggw==
X-CSE-MsgGUID: RZdSWq7oRwqeQLLuGXJ7RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50415198"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="50415198"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 05:53:21 -0800
X-CSE-ConnectionGUID: dqVhxefkRJ6K+fylaMAbNw==
X-CSE-MsgGUID: 4s30Jf60T/6PfehgfqZtJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112723160"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 05:53:16 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1D9EF11F8D9;
	Mon, 10 Feb 2025 15:53:13 +0200 (EET)
Date: Mon, 10 Feb 2025 13:53:13 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC v5 10/15] media: v4l: uapi: Add a control for colour
 pattern flipping effect
Message-ID: <Z6oEyeX2lcK023KW@kekkonen.localdomain>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
 <20250203085853.1361401-11-sakari.ailus@linux.intel.com>
 <e82b0079-bf52-4b04-b33b-4f3495fffa75@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e82b0079-bf52-4b04-b33b-4f3495fffa75@nxp.com>

Hi Mirela,

On Sun, Feb 09, 2025 at 07:23:10PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 03.02.2025 10:58, Sakari Ailus wrote:
> > Add a bitmask control (V4L2_CID_COLOUR_PATTERN_FLIP) to tell whether
> > flipping results in a change in the sensor's colour pattern, separately
> > horizontally and vertically. The information is essential for raw formats
> > when using generic raw mbus codes.
> 
> Is this control really necessary? Are there cases when V4L2_CID_HFLIP or/and
> V4L2_CID_VFLIP is enabled and the CFA pattern does not change?

Some sensors have some tricks in firmware to avoid changing the pattern (I
suppose in reality they crop one line / column) but this may not be
controllable by the driver, so this possibility should be taken into
account.

> 
> Could a raw sensor driver be capable of reporting the
> V4L2_CID_COLOUR_PATTERN based on current values of the HFLIP/VFLIP? I'm not
> sure I understood all the aspects of patch #7 (V4L2_CID_COLOUR_PATTERN).

In principle it could. The two were originally made independent also
because there was an inconvenient dependency between mbus codes and
controls. If the pattern control does not specify the native pattern but an
active pattern (whatever has an effect on it), the userspace also must
check that configuration to determine the native pattern. My understanding
is the preference on that side is the native pattern.

-- 
Regards,

Sakari Ailus

