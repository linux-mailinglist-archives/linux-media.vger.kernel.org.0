Return-Path: <linux-media+bounces-50849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED7BD2EC2D
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 10:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 673AB303ACFA
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 09:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8082F356A1A;
	Fri, 16 Jan 2026 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ooo9KWqE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077B6356A1F;
	Fri, 16 Jan 2026 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555837; cv=none; b=gyYsP3iGhz/DA9Z0msBKuqgR/VwlVKbUcbwEjPt16LPaMWX3QcU/oLIMiUH4X48kCEtRO1JukRUVOvffxT4TmuWYiJQ0dF6YgmC8zCltoW+N3IXE4P1gWOeBkgO4l0XzSEs2F6IM231UQCSAviwLd9diR7zjxg90nBy0f0x3A7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555837; c=relaxed/simple;
	bh=G78SYByCYE8fnCEl6tuYgnBRKkXeywjJITz6QrAZUNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GN0FKF+2HaiAXvu8WGRtUhJ7rDPMvPAhssfC51OYsxkLhs5b0vJU3m5eiOUEQvRWEGPBXRqVqMnkPT3gga2pS3kJoFDswRmED2ng6L5r6SoKQneH7CeYAvj/XHUsEM3iKRuaZX2zEDOr/gUSdHptCPnQ7U/h70Is2vMav239L78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ooo9KWqE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768555836; x=1800091836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G78SYByCYE8fnCEl6tuYgnBRKkXeywjJITz6QrAZUNk=;
  b=Ooo9KWqEmkqYt51mao6IJwPBzdonIxaeYrgAGTx5NYpCIaP7yOv14w56
   A+uXyOz0mMdxvlWOX1QdAOj9mU1gxWkEZtboj1FjTqda76e9KArjs9x7p
   cF1xP++KULZkVLOsZfn286ks9Hh8BJUj1jRzixQdv7VcnDasUBYveRXSO
   boVXkL+sfZlZUM9bdhwv5icfhk0Ov0rjxdfXqjeDIo9xjWy/Sd9x/rz8m
   rzzwgIk/CbxC5TwT1v9xoPYEovfpdNRIDfxea9LoscF/fAYQ705iL0Q4l
   J75lSjzDfxhyb+suHmnkfRTjUyhaPxf3gyDFRjqzTDNikbKrcsUXyToF9
   A==;
X-CSE-ConnectionGUID: QDdpxfb4Qr2DQXPg9myDxg==
X-CSE-MsgGUID: 7OEYrbXXSICKauTIJLL5kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73714971"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="73714971"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 01:30:34 -0800
X-CSE-ConnectionGUID: mrTaviXyTgWzR7PUHcvhrA==
X-CSE-MsgGUID: 3VSOaCfIRlu1URvNw4BMlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="210064300"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 01:30:31 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5821E1215F2;
	Fri, 16 Jan 2026 11:30:31 +0200 (EET)
Date: Fri, 16 Jan 2026 11:30:31 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v10 0/8] Add strobe duration and strobe output enable
 v4l2 ctrl
Message-ID: <aWoFN3XmDRoeOwfB@kekkonen.localdomain>
References: <20251209-ov9282-flash-strobe-v10-0-0117cab82e2d@linux.dev>
 <h4ecxwe27hzelohvwhhosvdz5b6ybi25yopicatp54prrkaaai@sir4kskvxza5>
 <lwib4og3xnpmqrvmkenp5m6qywuzwmzilpdh74ugx2jfbm2s2o@zyvplzxtkepo>
 <w43pelg4dzxxswklhnlpmql5snvyjfvvc2hzl4ihvjkklvg2ei@6veozvnjc7pw>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w43pelg4dzxxswklhnlpmql5snvyjfvvc2hzl4ihvjkklvg2ei@6veozvnjc7pw>

Hi Richard,

On Fri, Jan 16, 2026 at 08:08:13AM +0100, Richard Leitner wrote:
> Hi Sakari, Hi Laurent,
> 
> first of all, happy new year 2026 to all of you.
> I hope you had a good start to the new year?
> 
> Regarding this series: Perhaps you've made it your New Year's resolution
> to give it another round of review? ;-) Would be great to get some more
> feedback (or Reviewed-By's).

Thanks for the ping. I thought this was already merged... oh well. It's in
my cleanup branch now.

Thank you for your efforts on this. Having these controls really improves
the flash LED control APIs; hopefully there would be also more users for
these as well.

-- 
Kind regards,

Sakari Ailus

