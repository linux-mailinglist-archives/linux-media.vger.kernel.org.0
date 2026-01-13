Return-Path: <linux-media+bounces-50545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72497D181CF
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43707307C737
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C619C2D130C;
	Tue, 13 Jan 2026 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROb0cvQZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4B73161BA;
	Tue, 13 Jan 2026 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300833; cv=none; b=Znwb6Bku1EFdiv8GUlxX+5m3+k69nCu4M0pKWnr4wWTZuKqd2lABSkYo9KnsClXeJXU61Z4YYSujVAswalSnMREkr6KY6zUa+sak4pHQGCxfRrdl4TMrphc7iWUMpB3hs5xU8KWiL6MpxgGPpFFtQTAmPhmIFjcT63ZdewxVu+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300833; c=relaxed/simple;
	bh=26s5QcX6D0qM0hhPF/sNC7TQ5a9ATBf6fwllS64IE0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q73di4xCLG0OT0PMmcIsErmhugzhbUhAL+5bc37pgc0QfYJNe2wTq0V2O9++7q8lxPLiUs6HnLPncv98zVfm+3URF62oNqGwL/A6mcc+dhDk9f90NgqKnWSbfLEtLfxgKHaH8dVx+LEWiR/TXZMzGcQs5V7N0LVnmBluq8L+GqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROb0cvQZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768300830; x=1799836830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=26s5QcX6D0qM0hhPF/sNC7TQ5a9ATBf6fwllS64IE0I=;
  b=ROb0cvQZqbBYljOZ/QrBPYrgXJHjw6GeSApVVA/uGhB74WZONO9E73qd
   HKPwW/2Y2wsrWNqUHtZk1vjoUKl80h4xJrn7FemZtkIaY/k/Iog0XVXbX
   lSHgsO4lDti+lz6D4lw/sa4kCRMEXqQMVRx85cneMm1VZo3r4JfjLT2uh
   qjAoX9v3As3+JFAuk8BO4CQ2kt+xsJ4e7yenuFOmaCR/cjIKr+dhRypV9
   d0zy11CwquOT1RGjYMcPD+ZW/UASkIw4Th/zMfj/3r2J9glcExBGQ8y16
   RCqfs3kJjyRJyOzpKm8pGwjOJwSZx2ggUYYeM9/kiMrvBI9KsxmAkKa7h
   g==;
X-CSE-ConnectionGUID: eXGxX8TgRbi7aE4lNzm+JA==
X-CSE-MsgGUID: /as/I30yToefczk5yE0uew==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73214304"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73214304"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:40:30 -0800
X-CSE-ConnectionGUID: KeYb3GKRQOGzb0fJyiq2Pg==
X-CSE-MsgGUID: +vUVyOBcTEyrC5/UCuQlyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208818629"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.182])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:40:28 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AFA8411FB85;
	Tue, 13 Jan 2026 12:40:25 +0200 (EET)
Date: Tue, 13 Jan 2026 12:40:25 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: "jempty.liang" <imntjempty@163.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dan.scally@ideasonboard.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Fix NULL dev stream alert for tpg
 sub-device
Message-ID: <aWYhGQcDVRDTyvxj@kekkonen.localdomain>
References: <20260113075722.143238-1-imntjempty@163.com>
 <aWYHPKMVFu_QC1Ow@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWYHPKMVFu_QC1Ow@zed>

Hi Jacopo,

On Tue, Jan 13, 2026 at 09:55:10AM +0100, Jacopo Mondi wrote:
> I wonder if v4l2_device_register_subdev() shouldn't WARN or if return
> an error if sd->dev is not initialized. Laurent, Sakari: opinions ?

I might even return an error but I wonder what would break. Perhaps indeed
could start with a warning?

-- 
Sakari Ailus

