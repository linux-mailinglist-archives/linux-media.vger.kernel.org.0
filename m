Return-Path: <linux-media+bounces-13956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E26912C44
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 19:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06C471F21944
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 17:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3C7168494;
	Fri, 21 Jun 2024 17:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNanM4eJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF9515FD01;
	Fri, 21 Jun 2024 17:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718989934; cv=none; b=szYd5LP7FPjK5/h+gx54KDCGFUKu3k6qPjj4oIP8nwu5MlZi6tMowRrAlJY14gR83EDxvygo4KX1W/MGGXB/kA+d3ymBcFuXQyd/GxasNu+Tji2Wjq2mqk7jU6LEb9xkW54Rf+ZueM8njHHP1yOzxUqV2nA+Dkii44abWksB4CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718989934; c=relaxed/simple;
	bh=++1Bh6Bz4ld02gS+hABD4jUN+a0ZkMgvKtRMDgV/RNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjPuh8oRGhHrfbWd/cEJywMUkyf0wcVmchOlRug4CcHr8euQCLpEgFRBMVnzUfA8r87PFRrA4aUX/zPynogi/Nb16hWbXJYRBxnFT4VoVpcrgXWLr1Q4+S9dk9jdBMdXSByHgsIfMm7JLU2gE07AKRnXBS8xA38Gp0IwMOnsM9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNanM4eJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718989933; x=1750525933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=++1Bh6Bz4ld02gS+hABD4jUN+a0ZkMgvKtRMDgV/RNM=;
  b=YNanM4eJnaKML3cxHZRljwgGvpa8H9+3M2N6l72yIlm+ndP/nsHsQWjw
   7gdo4yNVcDRYphTk5nkKO3fcl/j9uaKoJuKR+VGGi7igSQpVJJwWNGTWH
   +fe990r8E+wH8OlPRY++F4UMfw6JIUD7irJsh8v1t0U/JKD8ojIq0VAk4
   slOy7UMmLF1s9+/U9L1A1Dmi1q6nDYeTsQPUlZ/bfod4t9X3+ZDQ66iT9
   hNWN4NQWgA40hThiEJL59P/EssWA1ZihKNFBrF6vzwVW9CjslhotiJk25
   Go7lWtak8fqOYjL5Cf83ye9iEC4TnVU5VcACoP8vuzaoc1Vn+YGaeZeFT
   A==;
X-CSE-ConnectionGUID: 8jYNiUh9QUOQUBuLNR9QpA==
X-CSE-MsgGUID: fbAlKcMqR+S+ltv1QJmJ7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="26720321"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="26720321"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 10:12:12 -0700
X-CSE-ConnectionGUID: gSt7STmmRS+chjK92N9MFw==
X-CSE-MsgGUID: kvsIov8dRpW7ZBYGvSqVEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="73858655"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 10:12:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 011D811F855;
	Fri, 21 Jun 2024 20:12:08 +0300 (EEST)
Date: Fri, 21 Jun 2024 17:12:07 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] media: dt-bindings: Add description of OmniVision
 OG01A1B image sensor
Message-ID: <ZnW0Z7miY7bWfC_B@kekkonen.localdomain>
References: <20240620124745.1265011-1-vladimir.zapolskiy@linaro.org>
 <20240620124745.1265011-2-vladimir.zapolskiy@linaro.org>
 <e61b5066-c256-4ad6-93ea-cc10cdfafc31@kernel.org>
 <ZnSLY4MFIwXE6Fj4@kekkonen.localdomain>
 <9824cc10-ab59-4cac-9a88-a1f9bb84a1d5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9824cc10-ab59-4cac-9a88-a1f9bb84a1d5@kernel.org>

Hi Krzysztof,

On Thu, Jun 20, 2024 at 10:28:03PM +0200, Krzysztof Kozlowski wrote:
> On 20/06/2024 22:04, Sakari Ailus wrote:
> > Hi Krzysztof,
> > 
> > On Thu, Jun 20, 2024 at 05:33:15PM +0200, Krzysztof Kozlowski wrote:
> >> On 20/06/2024 14:47, Vladimir Zapolskiy wrote:
> >>> +    properties:
> >>> +      endpoint:
> >>> +        $ref: /schemas/media/video-interfaces.yaml#
> >>> +        unevaluatedProperties: false
> >>> +
> >>> +        properties:
> >>> +          data-lanes:
> >>> +            minItems: 1
> >>> +            maxItems: 2
> >>> +
> >>> +          link-frequencies: true
> >>
> >> This should not be needed.
> > 
> > Why?
> 
> Because it is a no-op. Changes nothing, absolutely nothing. Property is
> allowed from video-interfaces via unevaluatedProperties.

Right, indeed.

This should be listeed as required instead.

> 
> > 
> > Please see
> > <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#handling-clocks>.
> 
> This doe snot cover empty link-frequencies or I could not spot what you
> are referring to.
> 
> Unless you are suggesting that this should be fixed into proper
> frequencies? Then yes, Ack. Keep it with proper values.

-- 
Kind regards,

Sakari Ailus

