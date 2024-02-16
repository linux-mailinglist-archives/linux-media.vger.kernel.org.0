Return-Path: <linux-media+bounces-5248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD4A8578C4
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 10:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF6821C220E1
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 09:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881631B968;
	Fri, 16 Feb 2024 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asUk8jHs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DB01BF20;
	Fri, 16 Feb 2024 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708075439; cv=none; b=SeY49s/Tb2GeFYYH/BlexCHsRDV8GB1G1S1SmUtSNzIOZt6gkxMEqdddU/916IbgNxneiQ5lP4Px6nmX2tFvWIMk4W5mNk5n8uoUMSjjTA3JB4ktXTXmq7K2ESEIBfEVNL9mifYeZFazRt4clrILTmQ1AbLnai8sl8F4ZVyswas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708075439; c=relaxed/simple;
	bh=Eg4jDgBXY8HVa1SBhWFqj6pMdo/9loP0CDHEo6M1w6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIqXAo/W7/xaYQPABWIPSAp3bEnl+BGanhmIOWGFEDIc4Cj21yUTmw0KzaVGog6IMosPGnRcZ3QS9nLyCwT0w+LxO4QMp3ZWapWaggUqmGA+7kAgH3d50Cu5JNzoyGirHmHMqrrtLzFx78JqWT9YAtFxl30CCip2OqOEKOJ3KT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asUk8jHs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708075437; x=1739611437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Eg4jDgBXY8HVa1SBhWFqj6pMdo/9loP0CDHEo6M1w6w=;
  b=asUk8jHs34LlT50COGrr1CfBaTdaUA2Z/cHwA/3D9kX+y9HddfzcN7ZJ
   RpfEDFHkRigugnRaUCcXB4cxdHXmDH7ZKvoyLmdSpZC5ulCcEIAjpKxJn
   jpEqVGkBCxCg3HKmZG0g9FBMO8dz21Ate/VpEWmK900HFLFCbQ3ldK0VL
   7x8gmiiHLDyFGE2xPIXREgIU2oug8GNj1f0X8QhY46synEujHAGD8dSyl
   vqTPV/aWSLlcG5abEw8BbiYDxj0JI1zROF6YNkRBhVOZ5HztyLhU9a5/L
   G8WuVNr/5hy60YAG8RJOI0ZyHLnaFG0xxqga82XJ4NsSx7/ER1koIFv1f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="27652177"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="27652177"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 01:23:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="8434266"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 01:23:53 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 236DB11F7E1;
	Fri, 16 Feb 2024 11:23:50 +0200 (EET)
Date: Fri, 16 Feb 2024 09:23:50 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	willl will <will@willwhang.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: media: Add bindings for IMX283
Message-ID: <Zc8ppr4mE8ZgVNUs@kekkonen.localdomain>
References: <20240215204436.9194-1-umang.jain@ideasonboard.com>
 <20240215204436.9194-2-umang.jain@ideasonboard.com>
 <55d41858-b567-4e23-8d84-3af81b52d018@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55d41858-b567-4e23-8d84-3af81b52d018@linaro.org>

Hi Krzysztof, Umang,

On Fri, Feb 16, 2024 at 09:03:49AM +0100, Krzysztof Kozlowski wrote:
> > +        properties:
> > +          data-lanes: true
> 
> Provide constraints - which lanes/how many.

Very probably only the number matters on this device. Therefore minimum and
maximum should suffice. (Or an enum. 3 is probably an invalid number of
lanes here, too.)

-- 
Kind regards,

Sakari Ailus

