Return-Path: <linux-media+bounces-19146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E059929DB
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 13:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C21931F2232D
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 11:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939B91D14FA;
	Mon,  7 Oct 2024 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITEQ8/cP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2D61C9DC8
	for <linux-media@vger.kernel.org>; Mon,  7 Oct 2024 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728298994; cv=none; b=kNjaQy3lRt14JtmxnwOMcYPSJygEcjlJzyF0IKutIZ6aJcSLOigUU/TdVzentWg3cPccwQ0cG4jVLvchICvWjs2Du/+igQ5PbHy6bMur8Q2u/4szqQwp1UDgaoX8uSrqk+AowyVm5SUyMUxr9+KpFicOcCGsTpFtintMN1NT7zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728298994; c=relaxed/simple;
	bh=kzr01a9EFsNe3sBae5emwurwUE3WyiPFUjw6yIvzo7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4p4pByuc0IbpYTg+2zsFBNZitsmZFdYvsOTZ6xMiQKbqsWw/sqrtU47h6ey5EV8/guR7wHeWBmLRL+JvXHrJBh7tblrPcCZiFwygYPn1D9nBn7IMwPIlh8kAX6WpnqmAX2VDV5e78GR557yfq8AzljPD1YrLRsTQutb9Lk+w6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITEQ8/cP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728298993; x=1759834993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kzr01a9EFsNe3sBae5emwurwUE3WyiPFUjw6yIvzo7Y=;
  b=ITEQ8/cP0NHZesXlVHswkRcPIQuzPMxBcUKVdgd04XKyi4xTMu+ODLbi
   OShX5iMj1kUKSuLx41+LVH+FpQ6aDZX/taIHtxWH5MYzHIjQo7ZaYhnN3
   6/aGcJD1DEI1JFdIvYL67qDU28p8qVOPwmLuB2E5Kv/3WA6QCC11yDCpE
   sYSZREdcFU4fJlpUxEjyqiACDSzdl8elevbGs82qv2tWWjB5fQXRRcrkc
   sKbFNFLTmlOCarFgiKz4tK7+rQAguQcRsbRXw7L6xPSP6U8KgaJNRMNdY
   ATMKHQeHxDY38o3UJ2EpGH5nbvoyoQCCcEjt7YcbCbf843UKMWmb9iLb9
   g==;
X-CSE-ConnectionGUID: Pb3Al6iNSDiVUtAUmPVZmw==
X-CSE-MsgGUID: 5SnvsSKMSi6/SoJ5Q3pMGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="15059493"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="15059493"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 04:03:10 -0700
X-CSE-ConnectionGUID: 6G9V6NbjQA2MV3DKEAgYbA==
X-CSE-MsgGUID: iXGodqoXSAqWBHL2eFU9iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="80272921"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 04:03:09 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CD8CD11FA50;
	Mon,  7 Oct 2024 14:03:05 +0300 (EEST)
Date: Mon, 7 Oct 2024 11:03:05 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v3 2/3] media: Documentation: Update
 {enable,disable}_streams documentation
Message-ID: <ZwO_6dTQqOgKi1Ts@kekkonen.localdomain>
References: <20240920073503.22536-1-sakari.ailus@linux.intel.com>
 <20240920073503.22536-3-sakari.ailus@linux.intel.com>
 <20240925214654.GA11070@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925214654.GA11070@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Sep 26, 2024 at 12:46:54AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Sep 20, 2024 at 10:35:02AM +0300, Sakari Ailus wrote:
> > Document the expected {enable,disable}_streams callback behaviour for
> > drivers that are stream-unaware i.e. don't specify the
> > V4L2_SUBDEV_CAP_STREAMS sub-device capability flat. In this specific case,
> 
> s/flat/flag/
> 
> > the mask argument can be ignored.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks!

I'll fix the commit message while applying the patch.

-- 
Kind regards,

Sakari Ailus

