Return-Path: <linux-media+bounces-23466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4899F2EFF
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 12:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AD487A26DB
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 11:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B677A2040B3;
	Mon, 16 Dec 2024 11:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDa8LZAJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D8520100C
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 11:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734348087; cv=none; b=TiFvqJaQH3fK40+E7DbZrrG6xTXo6pMYx6liGYOh9SCcZLWkIZnfVGXEQ2FmDuj+W5tBehH+jn/qLiNB79sbwmDG16hPsRQVkyblevH8h+5rgxIYR7LHYH4oqJTlcZbAWU4W6JhGv7i9BCIxTY91F/mGVCXyTjTUVNRc+mgnGoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734348087; c=relaxed/simple;
	bh=AzgwG0gVbMZxVdpFeHi1ZCioIgw5Km6JWbCzeZ8SqPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scHzed8lHb3qNuFZ2TahygvsTrKC30ITuUNJR6dzdS6zwUayQLCPGawZS9ljwiDUUbXTVXBU1sEpqHOBKVfWvqIwkg+naPZRI4f4CsF6s4+jxEhpVNY2k9XQutaiGuJgw+TFzfO+yUagjqHe3SIETEpDS/eeZFPNtSv7NzPTlUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDa8LZAJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734348086; x=1765884086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AzgwG0gVbMZxVdpFeHi1ZCioIgw5Km6JWbCzeZ8SqPs=;
  b=TDa8LZAJITu6KiLJ5vGpvqEwT2hDzIPgDUNjmCBBgI6wNKAUAQxXVJPx
   46Rh//YWa+ApYNacR3VaNcR0VO9UaGrPQXBVzq8yViEHCbtJv9XEeScC6
   pV1jIT34+YGdXmtVR1GkrywGABpnEftVIxzgP5hWolKvxccP0jMVXW0Cg
   iJFNmTGa7Sg56R96ZB2+QKMHfOScGujbfpsIISPGHI0lhXgogtaXX4KtM
   WJbTZv40k7uXjs1OEWzdHJ5+rXd9coacQh6k+DzyMU/r8Sf0ehF6H+xaD
   1aTvWoqgY7IA3fz7mgw/Hhb2eUCCwpj7CCyolamiRfeZOpabo/KJSsvKS
   A==;
X-CSE-ConnectionGUID: 3nvCGzgVRii5ohBj28/jsg==
X-CSE-MsgGUID: Vub4LK3cQduDkWvdbUa/3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="57210073"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="57210073"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 03:21:25 -0800
X-CSE-ConnectionGUID: Op+tEcXpRNiz0eHdje5MCQ==
X-CSE-MsgGUID: 8h54xaemROec/qfuUE1nwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="97072609"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 03:21:23 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8DB3311F9F7;
	Mon, 16 Dec 2024 13:21:20 +0200 (EET)
Date: Mon, 16 Dec 2024 11:21:20 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 5/5] media: intel/ipu6: Obtain link frequency from a
 sub-device
Message-ID: <Z2ANMJMVwBEosOSd@kekkonen.localdomain>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-6-sakari.ailus@linux.intel.com>
 <20241215170832.GI9975@pendragon.ideasonboard.com>
 <Z1_evC9EsHnXuj_r@kekkonen.localdomain>
 <20241216111326.GK32204@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216111326.GK32204@pendragon.ideasonboard.com>

On Mon, Dec 16, 2024 at 01:13:26PM +0200, Laurent Pinchart wrote:
> On Mon, Dec 16, 2024 at 08:03:08AM +0000, Sakari Ailus wrote:
> > On Sun, Dec 15, 2024 at 07:08:32PM +0200, Laurent Pinchart wrote:
> > > Hi Sakari,
> > > 
> > > Thank you for the patch.
> > > 
> > > I think this should come before 4/5.
> > 
> > Because of...? Both are needed for this to work.
> 
> Because, unless I'm mistaken, it would otherwise introduce a bisection
> breakage. 4/5 drops the LINK_FREQ control from the IVSC driver, and
> obtaining the link frequency through .get_mbus_config() is only
> supported when using the v4l2_get_link_freq() variant that takes a pad
> argument.

That's a fair point, I can change the order.

-- 
Sakari Ailus

