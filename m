Return-Path: <linux-media+bounces-29940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC1A8480A
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 17:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A6FE7AEA00
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 15:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9741E9B3D;
	Thu, 10 Apr 2025 15:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WniQs0YS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087A91E9B27
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299268; cv=none; b=FVAUq3KhBdT6uOhMLZnt9OD1G1RqMkzDXOdz001/s8WrblrOJ4y41e1ojySdrpOWbL7lH7lRSlgAdnFzQ+LbzD0WYUsTJQeSQQ7h2KJ1Z2Zlm1ttQf+hu70ruT9LblJ8ZEAYwLDXI/R7vN3RmfPrLiHuEkoqYLMJzVLJi3vyAeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299268; c=relaxed/simple;
	bh=LPFlfCCpS0SPaB+JsbJz9XcccLDEIWdx0mBYZy/X238=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPR2D0oKhYRaGsxg3dj1In7DEujMIZ2iGAipztGoaeMhDHGI/qzu2iFLNKNkwCbAMjZDswdHGjeCzz2HXWLJLDyIKZLeUDrMY6RndcHaNg0ZTt8gre3wufXptA77IK0qzVklH77MnxHbnwoYwvUBSQxHPWEQX9f59ZpfwD5ENX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WniQs0YS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744299267; x=1775835267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LPFlfCCpS0SPaB+JsbJz9XcccLDEIWdx0mBYZy/X238=;
  b=WniQs0YS4rpfmgutJrh0JWsW7qT7U0QYWjAnDyKkq6WQJWAzq59Zd2C9
   lE0jhkDlXDBqMUnfH1rGStyqV/varc2C9MhonmNRQVrBKO066fFr/YMen
   28R+HM5Mxf8Scw/ztAPqvWAq2bkC+duwZaGd1HuSUOUHhYkgJmaP0RV7K
   K/y5Wh0Ib3I9jgVXu/8MbcHMl6lou6Os7ClHn228Vbwm/pWwjIGiX5GHF
   TpRewt0Cr0Cta1XTEW/CmolTJmmRTrDqalL6DpkAAqu1ywr5mp8jsWPiH
   T46YJnCShV8oxH8nMs9GqKsehDamKksH3cqguJ9Js+hG4McaIOqd81S6P
   w==;
X-CSE-ConnectionGUID: 7ez79o1HQTm7TIYNclSIVQ==
X-CSE-MsgGUID: okTlByzMSvKp8g1kldUVsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45718607"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45718607"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:34:26 -0700
X-CSE-ConnectionGUID: n+NjkRzrQaqaM9NQivRjcw==
X-CSE-MsgGUID: UY2peMj1T9mcOvzpaHrkdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="166138522"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:34:25 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2DB6511F74E;
	Thu, 10 Apr 2025 18:34:22 +0300 (EEST)
Date: Thu, 10 Apr 2025 15:34:22 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH 0/7] media: intel/ipu6: continue on ipu7 code sharing
 preparation
Message-ID: <Z_fk_ofTOzsvbRwZ@kekkonen.localdomain>
References: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>

Hi Stanislaw,

On Mon, Apr 07, 2025 at 03:40:30PM +0200, Stanislaw Gruszka wrote:
> Move and rename more structures to isys.h. Add accessors to make 
> further transformation easier.
> 
> This is on top of:
> https://git.linuxtv.org/sailus/media_tree.git/log/?h=devel
> plus:
> https://lore.kernel.org/linux-media/20250317073856.162147-1-stanislaw.gruszka@linux.intel.com/
> https://lore.kernel.org/linux-media/20250401090953.473339-1-stanislaw.gruszka@linux.intel.com/
> 
> Stanislaw Gruszka (7):
>   media: intel/ipu6: Use isd name in isys.h
>   media: intel/ipu6: Remove line_align
>   media: intel/ipu6: Move common structures definitions to isys.h
>   media: intel/ipu6: Rename common structures
>   media: intel/ipu6: Remove deprecated lock comment
>   media: intel/ipu6: Introduce isys and dev accessors macros
>   media: intel/ipu6: Start using accessors to get dev pointer

My main comment to the set is naming. Can we do so that we keep the current
scheme (ipu or ipu-isys prefix, with or without IPU generation number) and
then reconsider this question when the result (hopefully including IPU 7
ISYS support) is in upstream?

The rest seems entirely reasonable to me -- but see my other comments, too.

-- 
Kind regards,

Sakari Ailus

