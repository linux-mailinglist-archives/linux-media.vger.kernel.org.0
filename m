Return-Path: <linux-media+bounces-18954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1311E98C694
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 22:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD94728459C
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 20:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5591CDFD9;
	Tue,  1 Oct 2024 20:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7IsxPM2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E520D1C7B99
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 20:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727813671; cv=none; b=bDy9H1q7oAhDA8LDxErpvoQOx/aWiXpgL4Jn6yNZYVmr6V9xj4gEu2bJRJ1bf5YnrW18b9gum6Uc7FuSLKf8zNW83bNlKyszu82mGlQyDUDPw/aA4o3bLcKcc9I9bAk+cpkox3ELKLHKw5B56uSCaHh85gKUS7NFqvz8zaAE9vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727813671; c=relaxed/simple;
	bh=2AqscqOFxoMCA7OTmmwe5WqeFcEiodzvPjMR2F8rrck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGw5k/LXYDfMVXK1X1HMIwu42V9mkDwe+eh6SU77jURdS+uft7kbikjTRdvr53iqGSbTxJqjKyVJLXylruSGSeWJERcrbGCHlrg7NjUcm7bdRxXMfQyb3+1ip1Nqi+6p4O04i28LYMJB/GFCjj8+BmHY9saAQR7q4U7nNPd/+A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7IsxPM2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727813670; x=1759349670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2AqscqOFxoMCA7OTmmwe5WqeFcEiodzvPjMR2F8rrck=;
  b=D7IsxPM2cZgj3BgwgmCGShbX/V6HKz7WgjRNpCNPzuG5er8Gwo08kGlu
   dgQ/TINinErCw9OvjfX7k5pgj1nmHFRhw5iiAj7UghNy4qPI51HQIewnY
   aS4dBmOF6V/X3Qm420ntWcSD6EysSdij2CXYZAPX5mXz4mGxAkPxLOL/W
   odMV/OpMl0Oq8FwULIX4z49SyGHqAJP/D/oYbKEJzTrvnFcFx21rGMi/o
   WurJBEJc/fIyEpa2qdseSG2EI9oXpXOst+W7tkc6sNXyAqDut2bqusGvC
   /HNJvJwX+jJxuPKRirXTk8Gri42r0QpIRAyFyB/C660FUrprvZHNpDgCO
   Q==;
X-CSE-ConnectionGUID: YFuIWu2rTqqxyUc/YqR0wg==
X-CSE-MsgGUID: 9af3NUrTQTS5Adzu3ZFV8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26474070"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="26474070"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 13:14:30 -0700
X-CSE-ConnectionGUID: OxouuMkWT+6S3raKvZJ/0A==
X-CSE-MsgGUID: XjWnuui2QxO0rLHDzxDOZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="97136811"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 13:14:26 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4907A11F855;
	Tue,  1 Oct 2024 23:14:21 +0300 (EEST)
Date: Tue, 1 Oct 2024 20:14:21 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/4] media: omap3isp: add missing wait_prepare/finish ops
Message-ID: <ZvxYHXVFJoPPBmwl@kekkonen.localdomain>
References: <cover.1725265884.git.hverkuil-cisco@xs4all.nl>
 <1dc1a43151a5c66ed00935055730c56517b44ac9.1725265884.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dc1a43151a5c66ed00935055730c56517b44ac9.1725265884.git.hverkuil-cisco@xs4all.nl>

On Mon, Sep 02, 2024 at 10:31:22AM +0200, Hans Verkuil wrote:
> Without these ops the v4l2-compliance blocking wait test will fail.
> These ops are required to ensure that when VIDIOC_DQBUF has to
> wait for buffers to arrive, the queue lock is correctly released
> and retaken. Otherwise the wait for a buffer would block all other
> queue ioctls.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

