Return-Path: <linux-media+bounces-30395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A21AAA91453
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18ACE5A1AC0
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859D921518B;
	Thu, 17 Apr 2025 06:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHxU2RlT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389EF1DDA0C
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 06:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872794; cv=none; b=LZGnKtcC2Vpt8e+WrXHULyA/2I3qwqnT/9EolF82FZ1VgiqvqSmlODj1JYfe9jDg0u0TUBQj2Gyst5B+hPKDTeq8oHeltAbsKQW32qfi1tt8rsoPusi02EG4QHoUyzRyrYPTZLdysTQ9sBnJJWFawpUjKM7mO8DeDJ8HIJw1Q2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872794; c=relaxed/simple;
	bh=mAMt1m/u6hcO7vbLPIOezSFiI65bkiZ/TTQJ6Z9DipI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZGZBC4lWwxPCL8gwYkmDIrTRFJy3MvlhRpEcGSO2F2VY6RkYpnMBRdkxmJ3Y3/rcDqc4okNNKzDgKdfjPfvYhLvOE7GJC4Y9ZrrfsBOsG6C93kmAeWYR4cQlkjbsJcZuQCkGRBnIboOuzVFupF35aom9tqVFizrPgQp9qgPeSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHxU2RlT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744872793; x=1776408793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mAMt1m/u6hcO7vbLPIOezSFiI65bkiZ/TTQJ6Z9DipI=;
  b=eHxU2RlTZfh9GahJ5sgXaDoTQIpeMvAfAFH/TWEmN19OdO5V4zRk1HdT
   iAdFOq7STgHOdPXaJf2M0COhbQgyWT/CcQSnQ0kLm+zafzUrf+Dz5yzFU
   296H4Tq+L2xxlTi0UkjVF177RBytSzdknJSql/a+acpQQZo77tRrsjGod
   PfVhT8J3CXkRvY0Jaw//RzG+j+JLp10QrVa8vcBVg7W/9HSyR5z+s5wvf
   NcURFPMhInbo8/G0JdYfc/ToG/2EsXmtdx4Nx4Z07uMjDEQNy3OlBbcIO
   AVPFCXtt4tDeHam9gXJ42LYswyJct1XU3HlUPJ6vooCstJTw26Tuj7Wd5
   A==;
X-CSE-ConnectionGUID: Z/qFfx0kRtu3BY0KEDbmJg==
X-CSE-MsgGUID: wKx+3gvMQ9+8bsshPFpdOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="49141183"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="49141183"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:53:12 -0700
X-CSE-ConnectionGUID: OkuSsKfDTYeXP+H8ylqYHA==
X-CSE-MsgGUID: 9eaTRtL4TX2MQC+mnJ2sDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="153898419"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:53:09 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 54A6611F9C2;
	Thu, 17 Apr 2025 09:53:07 +0300 (EEST)
Date: Thu, 17 Apr 2025 06:53:07 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	dave.stevenson@raspberrypi.com, hverkuil@xs4all.nl,
	ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	dongcheng.yan@linux.intel.com
Subject: Re: [PATCH v5] media: i2c: Add ar0234 camera sensor driver
Message-ID: <aAClUxNhOhcPl9zX@kekkonen.localdomain>
References: <20250410161249.3455729-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410161249.3455729-1-dongcheng.yan@intel.com>

Hi Dongcheng,

On Fri, Apr 11, 2025 at 12:12:49AM +0800, Dongcheng Yan wrote:
> The driver is implemented with V4L2 framework,
> and supports following features:
> 
>     - manual exposure and analog/digital gain control
>     - vblank/hblank control
>     - vflip/hflip control
>     - runtime PM support
>     - 1280x960@30fps and 1920x1200@60fps support
>     - dynamical pll_params set
> 
> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>

I reviewed Laurent's ar0144 driver and it turns out that the ar0144 and
ar0234 sensors are nearly identical in their register interface. Thus they
could be controlled using the same driver, with relatively small changes.
Laurent's driver programmatically sets the register values in general and
does not rely on register lists, which is why I prefer that driver.

Would you be able to add ar0234 support to the ar0144 driver, please?
Sensor configuration independent MSRs are totally fine, I presume there are
some the ar0234 benefits from.

My apologies for telling you this now, after 5 versions of this driver, but
I only learned of this very recently.

I expect Laurent to send v3 of his driver by early next week.

-- 
Kind regards,

Sakari Ailus

