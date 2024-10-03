Return-Path: <linux-media+bounces-19046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D950F98EFA3
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 14:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4888E1F2239F
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 12:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A385B193082;
	Thu,  3 Oct 2024 12:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+BJpkyi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE0A12CDAE;
	Thu,  3 Oct 2024 12:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727959636; cv=none; b=AX59wiWYwZV4q+3GwKRlWCcOVsvw6VSAfL7AO1r2TVwTOh7GhEFIoMkgWwk83UK4X567aWE0kHKBYMtuYWbfnDrnr8e1BDA76s0jrWgnCsYidljye18ckFop7Fi8IFRLYDrU+DJ4h23utLRgTy+Agxau4sSIDx8pxxB9lksVQf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727959636; c=relaxed/simple;
	bh=+1856lifayqHTmeupphAxTAZvLgmJ4yDkFhAXYTTsNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwXw2xm5CMGv4thkw/Hkmc0Z/LGR7bwR7tELZqvS/ftIYZ5TKyrgMljiw3uMJo1g0d4SFZ/7WnoubzooL2DpQXoKVSy3kPszod96ysrKtywQN0Ac1WQcGBPCgRnAjsXpaBSd+/VolfJJizCdw76AoG3TAMLiSMFCnUBylasBMKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+BJpkyi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727959634; x=1759495634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+1856lifayqHTmeupphAxTAZvLgmJ4yDkFhAXYTTsNU=;
  b=A+BJpkyiPC3S9MVWpXUokxDCgN0y7SNNbJyuEj6ENVE6VfkrNVuLA/L/
   JxRs1JA6r6BypnaSDq9MVU5ZZdfm0Zx4dqGZdrBbAjVEadfSypCFQ7isZ
   n7KSf19ZQvaOkURx4Z0zKc4Si/JdGxXMtD0v79YByDFN8mp8oQ3nnhlZj
   UJn9RlpiBE/N8f9jk7gHdquZuVGC+w6/NDbprlUxbaVKCqCzdigbzq7Ch
   OhJHQ0WPdfjUjU9bTMiHn3AaYlFQwYKoEGLH1BvAKuf/lci+dX8htLR3b
   sBtffp+0bkUs3NJDaSG9gXT9hCUSWrKCs3nXwo0g4Vh+MRaHUuD6sC+qk
   w==;
X-CSE-ConnectionGUID: xf7AfmIETm6ChdESDmaQLQ==
X-CSE-MsgGUID: 47F0wIiaSdWekV9BDY9lbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37708503"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="37708503"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 05:47:13 -0700
X-CSE-ConnectionGUID: x8aHw5ugRIKNvN4tl2eP8w==
X-CSE-MsgGUID: EBs2RlgnQk2V29iCPXweQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="97668185"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 05:47:11 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 25ED211F83B;
	Thu,  3 Oct 2024 15:47:09 +0300 (EEST)
Date: Thu, 3 Oct 2024 12:47:09 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Jason Chen <jason.z.chen@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: dt-bindings: Add OmniVision OV08X40
Message-ID: <Zv6STSKeNNlT83ux@kekkonen.localdomain>
References: <20241002-b4-master-24-11-25-ov08x40-v3-0-483bcdcf8886@linaro.org>
 <20241002-b4-master-24-11-25-ov08x40-v3-2-483bcdcf8886@linaro.org>
 <t4fajppdqagkl7wr2krcucsga4zocz6liar64odk2mnasdyfms@5fp7bfwalson>
 <a86d05c3-5151-4161-8612-58894b1d0203@linaro.org>
 <8554d372-18cb-4351-a5ab-894be09c613b@linaro.org>
 <e8142566-aef5-498e-9d2d-8ac187ce8524@kernel.org>
 <c86f695f-28e2-406d-9f46-c291fca282e4@linaro.org>
 <Zv6LQ0q2XVHgUohh@kekkonen.localdomain>
 <1a4e5aa6-2308-41de-94e7-0077cb265b6d@kernel.org>
 <7ab7a7f0-c035-4210-b4d0-9e08291be475@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ab7a7f0-c035-4210-b4d0-9e08291be475@linaro.org>

Hi Bryan,

On Thu, Oct 03, 2024 at 01:40:34PM +0100, Bryan O'Donoghue wrote:
> On 03/10/2024 13:31, Krzysztof Kozlowski wrote:
> > > > Ah I understand you.
> > > > 
> > > > You're saying the link-frequencies we have in
> > > > Documentation/devicetree/bindings/media/i2c/* are redundant absent hardware
> > > > specific link frequencies being enumerated.
> > > > 
> > > > I'll either enumerate the acceptable set or drop this.
> > > link-frequencies should remain mandatory in bindings, whether there are
> > > hardware specific limits in bindings or not.
> > > <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-
> > > sensor.html#handling-clocks>
> > Yep and my comment was not under required field. Why all this discussion
> > is taken out of context? No wonder everyone interprets it differently.
> > 
> > Best regards,
> 
> Just so I'm 100% clear.
> 
> required:
>     link-frequencies
> 
> is required but
> 
> properties:
>     link-frequencies: true
> 
> is not, and presumably should be dropped from other yaml descriptions
> upstream.

Seems good to me.

-- 
Kind regards,

Sakari Ailus

