Return-Path: <linux-media+bounces-16992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5259621C6
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 09:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DD661C21199
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 07:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72DC15B103;
	Wed, 28 Aug 2024 07:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEGld0Zr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708C0158A04;
	Wed, 28 Aug 2024 07:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724831484; cv=none; b=WUQ4JXYu4CAoA21kDPfkOrZbK0axtiNAlMRsri2/bjC1FS7BcH6GL6kT/7Da/KDML+WUDmB1LZsZAKlBZIio0EQYGApsH+qM3OhlM2yME1/AtmsNWBRRkF/2/4kbTnXP2l23b1/KDSw0jEZ6JRrD4W839ERzK/yN1uPAnL9jNUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724831484; c=relaxed/simple;
	bh=g6S7cgkwyHTYMqfsr52CVhpQrrl8Vy5/S/YFliyHNKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qaXKnLJjuH5HzYm+U4Fs63anXSdT9aDyrf5i56xl95lKxOw4whp0lowK8HNAMYun2KiDBTNkItZEbtiji6aRAhMHaxXnEjJ0Oe/WmZc94rrdjMjU1z9Qo/hNmQ/MRmQX+ehX1p+WhxSUXLRCNVQANjFnQ3iTZpRI3WoHmxDAchg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEGld0Zr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724831482; x=1756367482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g6S7cgkwyHTYMqfsr52CVhpQrrl8Vy5/S/YFliyHNKE=;
  b=TEGld0ZrtBHs4WRW0gJqK+MgU3l59FRUQ9xQUl9JuNkUeQr3k1wqEeiC
   sCo4VcFAPC2ijqsqnaq1zMEQ2xwYExwvctYpgEYExcQ1ZHrFGeOgMFNi8
   NAWhEcmQzTLhtRMqeDoKOGjQHpokRWpXYUrb43hNWLeqeHraLNPoeiU9P
   yKsfAzOSBpf785eB5kMupns4DDGeCZIlmAOEpJqvhYZ42EPseNCYMaQyo
   stwDDPY2MK3MsU6jonqVYQiUFhJIfZjmRPJhnjInS5+T01NlOVRTe8b6H
   mGE7/OFqwlSw2NmhY35g7oK2yenfw8TL1RYW4hplO/7GYtG8Z2aBHWX9U
   A==;
X-CSE-ConnectionGUID: K01A2caMQ4a6QfWAHREz6w==
X-CSE-MsgGUID: TRGJT7F9Qy2rYMu4x1Bg1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="40849863"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="40849863"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 00:51:21 -0700
X-CSE-ConnectionGUID: mV4/iQEoSU2UdekrGE/mQg==
X-CSE-MsgGUID: xtm+W/8oToWtEBp4ANQBvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="63133947"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 00:51:18 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1D86911F95D;
	Wed, 28 Aug 2024 10:51:16 +0300 (EEST)
Date: Wed, 28 Aug 2024 07:51:16 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, shengnan.wang@mediatek.com,
	yaya.chang@mediatek.com, teddy.chen@mediatek.com,
	yunkec@chromium.org, 10572168@qq.com
Subject: Re: [PATCH] media: i2c: improve suspend/resume switch performance
 for GT9769 VCM driver
Message-ID: <Zs7W9PDY2ny5JI8w@kekkonen.localdomain>
References: <20240817073452.21627-1-zhi.mao@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817073452.21627-1-zhi.mao@mediatek.com>

Hi Zhi,

Thanks for the patch.

On Sat, Aug 17, 2024 at 03:34:02PM +0800, Zhi Mao wrote:
> GT9769 VCM power-on default setting is PD=0,
> so it is not necessary to set again in dw9768_init function,
> and it also has no requirement of setting PD=1
> before power-off in dw9768_release function.
> For GT9769 VCM, PD mode control will add extra time
> when switching between suspend and resume.
> e.g. chrome camera AP can switch between video and photo mode,
> the behavior corresponding to VCM is suspend and resume,
> it will cause camera preview is not smooth.

If this is the problem, wouldn't either of these two be a better option:

- keep the file handle open in the user space, to avoid powering off the
  VCM or

- add autosuspend support to the driver.

I also wouldn't differentiate driver behaviour between the chips. If the
hardware default really is different (is it, this is rare for
register-compatible parts), then the driver needs to reprogram it (at least
on the one with a different default).

-- 
Kind regards,

Sakari Ailus

