Return-Path: <linux-media+bounces-37266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 619CDAFFBE8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 10:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AD834A3A55
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 08:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A989D28C004;
	Thu, 10 Jul 2025 08:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PI9FuUCE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1AB3208;
	Thu, 10 Jul 2025 08:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752135255; cv=none; b=KAuAAwtCsImPkAHxTbT4kUMtQZwqyaCBp+OfAA/TSX8kNdnOn2liHtORHj3Q8VnWJaSK2VblM/+YqqIBa2drc6W+GgS+b7cLYqsG13sbD/mpNHRSXxeT+t5LKXfZbH67fa/D6AKegHscg93Gp87jNdX+DIsdV6znV2t21TvE8rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752135255; c=relaxed/simple;
	bh=XiQbrbHSYuCQNbkNTFIUy2kvXW3Kfl7lo/NLSUqOPAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FucXox6oxcQ8sQ8lkr2u88fXvz2uueeJwwfQr7v9jpjrfQqWRy6nfh+1Nzh+MQB4Z2oB2nWRgo9obozd8DV6cuHTwpPyvVi4HKpCnb2/nZP5iKF0PgkTKhGctB76wXsPEaRSa7VylpMItVtuYg7PdHFpr0XhQpXrTNIABTsgke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PI9FuUCE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752135254; x=1783671254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XiQbrbHSYuCQNbkNTFIUy2kvXW3Kfl7lo/NLSUqOPAs=;
  b=PI9FuUCEtasJ9UKvwUOcfzRfFxoXFpsMM+fsqLE5ny7mfvMrJxO16TIF
   3Xor8nqrXey8x3bAilDnh4FuSpVVogUxFBw6jUeZHlHjpt35EJzBkao3+
   cbUqaTLy1dG3OmBiu1qHAP9Ax/TeDVdRNL8DenrUyn5VIBVW/bFlcYAG9
   gWgLQCl8074VwrO+X0Vtr4CxwjfA9dHKS5V/39SF/q9fAsRNyvo4o0ZHN
   H98cGRcahYSDvbks2PR574Yw40vwCCcqtVRE37MAgBAcMeWenWiml40Nh
   nJsXN8N+vBoThoypUK2scrK7UCc8C0szHSRlHVwXROVhIKKYsrFk475/e
   Q==;
X-CSE-ConnectionGUID: K4k3CXapT7GutmlXJ++GLw==
X-CSE-MsgGUID: 2QhxT1tJRYCgTBOv3gwTQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54500656"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="54500656"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 01:14:13 -0700
X-CSE-ConnectionGUID: t/xAE7IGRk+I77wD+L63HQ==
X-CSE-MsgGUID: t5NYqiIvRpmLlWABANY9XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="187009296"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.98])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 01:14:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 16EAC12073C;
	Thu, 10 Jul 2025 11:14:07 +0300 (EEST)
Date: Thu, 10 Jul 2025 08:14:07 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 06/10] media: i2c: ov9282: add led_mode v4l2 control
Message-ID: <aG92TxxIRdRES5cs@kekkonen.localdomain>
References: <20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev>
 <20250617-ov9282-flash-strobe-v5-6-9762da74d065@linux.dev>
 <aG7bWXpz5sxYcLKI@kekkonen.localdomain>
 <5i6a77wbggmjjxfridurbq5mrdjksse236vwucawbi43fjv2ae@umy4fe7six5p>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5i6a77wbggmjjxfridurbq5mrdjksse236vwucawbi43fjv2ae@umy4fe7six5p>

Hi Richard,

On Thu, Jul 10, 2025 at 08:50:24AM +0200, Richard Leitner wrote:
> Hi Sakari,
> 
> thanks for the feedback :)
> 
> On Wed, Jul 09, 2025 at 09:12:57PM +0000, Sakari Ailus wrote:
> > Hi Richard,
> > 
> > Thanks for the update.
> > 
> > On Tue, Jun 17, 2025 at 09:31:40AM +0200, Richard Leitner wrote:
> > > Add V4L2_CID_FLASH_LED_MODE support using the "strobe output enable"
> > > feature of the sensor. This implements following modes:
> > > 
> > >  - V4L2_FLASH_LED_MODE_NONE, which disables the strobe output
> > >  - V4L2_FLASH_LED_MODE_FLASH, which enables the strobe output
> > 
> > I really think you should use a different control for this. The sensor can
> > strobe the flash but it won't control its mode.
> > 
> > How about calling it V4L2_FLASH_STROBE_ENABLE?
> 
> I agree on that. But tbh V4L2_FLASH_STROBE_ENABLE somehow sounds wrong
> to me. As the strobe output in the ov9282 case goes high for the strobe
> duration, what do you think about calling it V4L2_FLASH_STROBE_PULSE?

That's how the hardware strobe is supposed to work, there's nothing unusual
in that. How about V4L2_FLASH_HW_STROBE_ENABLE?

> Or should it be V4L2_FLASH_LED_MODE_STROBE_PULSE?
> 
> Regarding disabling the strobe output: Is sticking with V4L2_FLASH_LED_MODE_NONE
> fine? Or do you prefer an additional V4L2_FLASH_(MODE_)STROBE_DISABLE
> or something similar?

This isn't about the LED flash mode and we shouldn't suggest it is.

-- 
Regards,

Sakari Ailus

