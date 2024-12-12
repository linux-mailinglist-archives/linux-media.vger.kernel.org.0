Return-Path: <linux-media+bounces-23254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D14829EE0F8
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 09:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B68021885AD9
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 08:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48C520B805;
	Thu, 12 Dec 2024 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xd8Sxi8S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FC2126C01
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733991350; cv=none; b=Jyb5QHiTq2Qfud0SkulFwwdLGLatM53nhI9Lu/R215wdMPwW3bm+pJLh92yJWOwIF1iu/tr085npTUAzanExTICsDaNww55/EeA7nPAf/0AtR/lWEhPiPDcbFjOJVqZSMJbuAv2yoj+mjtGUuc3u/Gjk3moc+xz1nI6LmUuApz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733991350; c=relaxed/simple;
	bh=cjusBG5LBYWh/hyEILrMl6sGPGmgbnG7oKBmzzeRkrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atja6KNZzhzKtKMnNZhQ9UeFIDvrbgk6ZPxB9yrNyVfC0CUbKd2BzvFiqIv5NdK/7gGW20WG/g9P9Dz24f1Knl+nR9JBW7j20zO84Tgfvqmb/qETGfahiZi73pU97u2IG4AmkBAzsGI0DNFrm78wBAH1v+DAbVj3Vbm1YL/4T8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xd8Sxi8S; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733991348; x=1765527348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cjusBG5LBYWh/hyEILrMl6sGPGmgbnG7oKBmzzeRkrA=;
  b=Xd8Sxi8So85u7t61P6x6dIeqNAP+X3c0gb/oyomch8fjwxTE6dKcFSih
   VvFTk3z4mBGUQrzj9X3wkOYK9mS7hQqsBRXoc78IxYzVMs2oFqn3X3Dlj
   Z7fPRGZkaBoU00QlqVZS/Ja/jUmjgR7nqqxMDTYt/YCnqszpw71seLXu8
   Z1xRNZ68LsBamwDkSnY46ZaLsXouLQmk9VNuNbFgWPNtTGWnmDt13uuvN
   hGyu5GhkiCdnH8BbxUKyel0L3TxpjzTOqbOnmA1GmLX2cQGBQqtC+PNeB
   xQgEs86med05X11xhLvna2jum9aTl1ubxC1EgMvUc/nEXNzlffFC7qZ2D
   w==;
X-CSE-ConnectionGUID: 6MhIr3LtS5qPlNJGY9+ZdQ==
X-CSE-MsgGUID: f+YLGnFyRKu+YL6LBJ86EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34441501"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34441501"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 00:15:48 -0800
X-CSE-ConnectionGUID: MBj2NQVjSP2s3pqM73y5kg==
X-CSE-MsgGUID: EWiUllabTFOsRUtis3mQ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119400987"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 00:15:44 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1ECE011F81D;
	Thu, 12 Dec 2024 10:15:42 +0200 (EET)
Date: Thu, 12 Dec 2024 08:15:42 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Yan, Dongcheng" <dongcheng.yan@intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl, ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, daxing.li@intel.com,
	dongcheng.yan@linux.intel.com, ong.hock.yu@intel.com,
	balamurugan.c@intel.com, wei.a.fu@intel.com
Subject: Re: [PATCH v4] media: i2c: add lt6911uxe hdmi bridge driver
Message-ID: <Z1qbrkRTzqnzHtgz@kekkonen.localdomain>
References: <20241129061546.2237511-1-dongcheng.yan@intel.com>
 <Z1hOBpwLfB_wfRwL@kekkonen.localdomain>
 <66e2d69c-9413-48dc-9dcc-1df7576ddf2d@intel.com>
 <Z1oAGfRs28hgo-sc@kekkonen.localdomain>
 <e48e0778-7911-47ec-b8f2-d4b6e95484c1@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e48e0778-7911-47ec-b8f2-d4b6e95484c1@intel.com>

Hi Dongcheng,

On Thu, Dec 12, 2024 at 03:24:16PM +0800, Yan, Dongcheng wrote:
> Hi Sakari,
> 
> Since you are planning to PR this patch, I will continue to use
> CUR_LINK_FREQ to initialize the link_freq v4l2_ctl.
> 
> Besides, I see your patch in intel/ipu6 that obtains the link frequency from
> the sub-device instead of a control handler.
> 
> Maybe I don't need init link_freq v4l2_ctl anymore?

Please use get_mbus_config() operation.

-- 
Regards,

Sakari Ailus

