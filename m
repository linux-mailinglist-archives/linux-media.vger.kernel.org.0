Return-Path: <linux-media+bounces-32959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D017ABE6D6
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 00:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D2CE4C6966
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 22:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A0525DD0F;
	Tue, 20 May 2025 22:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWdUAzFV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BBA21516E
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 22:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747779705; cv=none; b=Qu6KFEenI1171xwqRSxhBPj2GQrtVUueZoi5bF8V68fm01kzgqyxXN9LfaC47dpZMsmaJ1gmvQZnimg0gpJfuOMxl0ALitOPxEVJza7vI9Wft/JC9M/7E0n4+srGpckLs+cwl589eh3AWW+5tslDKMpG79jCgte6dWR13S+7IXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747779705; c=relaxed/simple;
	bh=D4br3aDJZ86gestD5JrN5318A9IGJHiJEGRmZ/hHfro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjEe3o1C0O1asYN8PBnqM2Kxwu6eXIOwjLYUAt5skSR69OP4Gqz8KuQXbDjuF+Up5a6AM9mF9c2NrIBF1gzVmMde1yLclg/7LUuNnzaelSlmM2T1BbnDvhU9oe5HLwFZ/yDLzhD94HwZaAuJ7lXthbuI7VkXSJWggUn3ICerzuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWdUAzFV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747779704; x=1779315704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D4br3aDJZ86gestD5JrN5318A9IGJHiJEGRmZ/hHfro=;
  b=UWdUAzFVs/DL8ZDlEJ7bLUFTDWqrslMKtwoq0W8Z/yb2CfYj93pC9qMS
   kwtd4hAJCxVi2671VYj/+6CrhggYvr5jOZrdJmdAMmPJ9l3xXAILX6L4d
   EKnn5Nj/muMEw1HVPVI9N/uCZ+LVVfGhs/Et5smG1FDFWC/wLiTi/Wul7
   M8wmWBzGh3qr+sUki+pAHJ9vB3Sites3qLUUH7pl9UU5RyPoc0C/4XsNp
   69+meWcobBMWRz46HWEpTgfFUitQPSIi3XzQaB2fDGYQp1FCViPN3EiiN
   xIyCyVEBu7wYIYXjKrykGeEeF6huhwSRrVZE/Yw9R6UH8sm+/JIEW7GPh
   g==;
X-CSE-ConnectionGUID: kj8aLZPUQqGL5sMhe13Ndg==
X-CSE-MsgGUID: WEDhNlZeThOtuxOJ5qdhVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="52362992"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="52362992"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:21:43 -0700
X-CSE-ConnectionGUID: c58rRBMoQ96iM7tbosbCFw==
X-CSE-MsgGUID: E83QRufESaCrWp3tz+sRsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="163107440"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.93])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:21:42 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 95E8511F746;
	Wed, 21 May 2025 01:21:39 +0300 (EEST)
Date: Tue, 20 May 2025 22:21:39 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl
Subject: Re: [RFC 1/1] media: mc: Add "kaboom" module parameter
Message-ID: <aC0Ac0cZiFqBShO3@kekkonen.localdomain>
References: <20250519113809.296083-1-sakari.ailus@linux.intel.com>
 <20250520153938.GE8070@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520153938.GE8070@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, May 20, 2025 at 05:39:38PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, May 19, 2025 at 02:38:09PM +0300, Sakari Ailus wrote:
> > Add "kaboom" module parameter for the "mc" module. Setting "kaboom" to a
> > non-zero value will delay calling media device IOCTLs by 5 s and if the
> > media device is unregistered and released during this time, NULL pointer
> > is dereferenced and at least a kernel oops will happen:
> 
> This is useful for debugging, but do we really want to merge it in
> mainline ? Can't this patch be carried out-of-tree ?

Rather than merging this anywhere, the problems this patch underlines
should be fixed. The first one that you hit is a NULL pointer dereference
due to lack of refcounting and the second one stems from the device
disappearing while an IOCTL is in progress, leading to similar issues.

-- 
Regards,

Sakari Ailus

