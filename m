Return-Path: <linux-media+bounces-34332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6E7AD1AD4
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 11:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC108188CF51
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 09:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA422512D1;
	Mon,  9 Jun 2025 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJhBM6fW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB5E1A9B4A;
	Mon,  9 Jun 2025 09:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462087; cv=none; b=dq6zWppn4UqXMsf80Egs0z7FpFCKVPu/uk9LKHO7fuog2Bb3CQyyR62u6vEeg7b1IqEqNSImuRSj7Fd6ZxVWP2ujxgtggquqjQRJ1Y6itNEGuykrWCSPkkbT3D6ZwA7LlvFOvm2GYqpyTW+Sf8JCkCyTBWg7gCB8obHquj5jazE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462087; c=relaxed/simple;
	bh=6SLWXDnw707oaOJphaYCLslzKGhWC0qAKWIr8Bfsf/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhZfzgHs2fSlbCcelU912ApKjviSAs5mCdzFzRTukiY0sJAErR6NV6Ekih7ku8IdOxYk1XNtHhlDjbNqGJbySyiJPmv7BYyDVMtxoKnSLrFBlSNq2C62M99STOV8sC9yXmbbwvy5oViiYQpMh0/651sfSTaHx0h4X5u7cLglsek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJhBM6fW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749462086; x=1780998086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6SLWXDnw707oaOJphaYCLslzKGhWC0qAKWIr8Bfsf/I=;
  b=jJhBM6fW6PWNcwfTB2Rs9g+rXo6geDtkgRKqziYX7DTMNM+MwQgjLVEI
   j0OPkMrv+gjAdwXzrR0XGfSUWHuS/n6dj6dJ+a4QzPMs7YMyiBNAOketu
   LX50H6960+2Ac1wgzIOlUS/fPxNhShhBZMHKEsKRmDxnxUS/cMuNnZPcv
   VecHXXNxRLK0X3WZRYXFoRmrXOvdlMG5npl92Qt0JjfaOE4j2VIDuFGW5
   o8rxpxj5sOspB4I4yVN7fkihCXIMB8ELaSJiWG2SQAthkbkdGO+5qATTB
   s1Omvgh3el01N1BTnI+gkPPoqQoDXWcQxltr5Iey4dmKyCh+ZWaf1T/bs
   w==;
X-CSE-ConnectionGUID: eJblwmVeSIus98v2N5iiaQ==
X-CSE-MsgGUID: RZY1HP04QmSQ2Sx8snFGKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51676927"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="51676927"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 02:41:25 -0700
X-CSE-ConnectionGUID: G3Ux45i/RkuTHIr0aHItCA==
X-CSE-MsgGUID: FtW2IOJFSdeO6fpPoFEHhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="177400448"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.36])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 02:41:23 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0D4CA11FC22;
	Mon,  9 Jun 2025 12:41:21 +0300 (EEST)
Date: Mon, 9 Jun 2025 09:41:21 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 01/12] media: rcar-vin: Use correct count of remote
 subdevices
Message-ID: <aEasQagrdjSfvoNs@kekkonen.localdomain>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-2-niklas.soderlund+renesas@ragnatech.se>
 <aEar3NonNYosp4Nm@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEar3NonNYosp4Nm@kekkonen.localdomain>

On Mon, Jun 09, 2025 at 09:39:40AM +0000, Sakari Ailus wrote:
> > * Changes since v4
> > - Use ARRAY_SIZE() instead of updating the incorrect define to
> >   RVIN_REMOTES_MAX.
> 
> Do you still need RVIN_REMOTES_MAX()? Couldn't you use ARRAY_SIZE()
> elsewhere, too?

I checked rcar-vin.h, please ignore the above comment.

-- 
Sakari Ailus

