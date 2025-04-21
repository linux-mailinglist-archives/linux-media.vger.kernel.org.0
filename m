Return-Path: <linux-media+bounces-30576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC6EA94D85
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 09:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AD731890BE5
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 07:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFA820E708;
	Mon, 21 Apr 2025 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ez9m+SUV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C05F1D63DF;
	Mon, 21 Apr 2025 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745222159; cv=none; b=tr8sNNMsdEYnJWcdTzX23l1w++INul6KKrk4zQLv7wDzu4wtFntOftEzxAs9ytMEPpAO3GV5czxgrm8Gs5KeJd3Vh1gIr1StI+2lS8SbiilMSw+qtiH0X9QLnrSPUap3ToLLU863UbtKBNWi26K+tPgcqdXHdp3z33DjfWnXC50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745222159; c=relaxed/simple;
	bh=6G4c/zZG7Kc5/hL0bEevZukEDVzAy/jTY2Tm/1enJPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M60N9OkkPWPXia+G4nzQn+RFeuQ+3rc6cI8TwFlPEZMTpoiEKx+ObJsUnCZeBJxwFaL0U3GyPK/2LfPny2+mvYoRLM8Mr1d/3U5rv5TWqeZuLa7aegl5r5NwZd3cdKGnC/Wrc2L2HLf7/U9sn2g7abhZ1rjD0mRYbyd0sP/GmHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ez9m+SUV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745222157; x=1776758157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6G4c/zZG7Kc5/hL0bEevZukEDVzAy/jTY2Tm/1enJPc=;
  b=ez9m+SUVAi/HZS7zdoDPWbuaLivckxGfnTzApayydxTMJ2fam0QHi/e4
   BXhmV2p0wVAAY6IpFRZeblzzKUirWB6xmkmxRP+u0EohZHIUVWUdm3BVH
   Q6hQKfp5CmAIacyR9M5qbazcNWU8d8PHvWf7zV8Ah0ShgSCJssE9SsnwI
   xQJLbKequQvOt/pORv4jLh0k3v2bDVIgHgive+HDTqBJsPhCEhIwpueC8
   dP28bmPh287Pi/yKGE05KvvHckJx5coa6xWY0BHHGqvh9l1E/gPs2kbUZ
   jcvSzlbT3SanMYLS2vRX/VR+6J3QGqg+V0HPzU4AnsoLTuHjZcPckys/U
   w==;
X-CSE-ConnectionGUID: Og57QeCwSHqMm+IR+gwO8Q==
X-CSE-MsgGUID: nLGR1yf0SA6i0XFi/26FKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="56931640"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="56931640"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 00:55:57 -0700
X-CSE-ConnectionGUID: UtaCzL9ASiyctQpUGHlyVg==
X-CSE-MsgGUID: yKXlQK+uQ/G7UDS5dOlBGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="131670491"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 00:55:54 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EF84011F871;
	Mon, 21 Apr 2025 10:55:51 +0300 (EEST)
Date: Mon, 21 Apr 2025 07:55:51 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: David Heidelberg <david@ixit.cz>
Cc: Rob Herring <robh@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: dt-bindings: Convert Analog Devices ad5820 to
 DT schema
Message-ID: <aAX6B-zMpu8e_9fP@kekkonen.localdomain>
References: <20250414-b4-ad5820-dt-yaml-v3-1-39bbb5db7b2b@ixit.cz>
 <20250415223557.GA940473-robh@kernel.org>
 <7ae72214-3f91-4bd7-b5f0-07391006f531@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ae72214-3f91-4bd7-b5f0-07391006f531@ixit.cz>

Hi David,

On Fri, Apr 18, 2025 at 01:42:01PM +0200, David Heidelberg wrote:
> On 16/04/2025 00:35, Rob Herring wrote:
> > On Mon, Apr 14, 2025 at 06:04:01PM +0200, David Heidelberg wrote:
> > > +allOf:
> > > +  - $ref: /schemas/iio/iio.yaml#
> > 
> > You have the ref, so #io-channel-cells is allowed, but you need to say
> > what the value for it should be for *this* binding. IOW, you still need
> > to list it explicitly.
> 
> I considered to keep the previous and new binding 1:1 and drop
> #io-channel-chells with the all references to it (missed this one).

There's also one in the commit message.

> 
> Would that be ok for v4?

Sounds good to me.

-- 
Kind regards,

Sakari Ailus

