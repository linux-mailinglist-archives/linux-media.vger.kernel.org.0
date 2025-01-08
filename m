Return-Path: <linux-media+bounces-24384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 787ADA05670
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 10:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D812188404E
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 09:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751F41F130D;
	Wed,  8 Jan 2025 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwjoK3Sz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74011F03CA;
	Wed,  8 Jan 2025 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327591; cv=none; b=sQBRhv6zOBMF8srH8JBcprDGt6bM6Av7Csu7nThE1uQyy4a6ZHPb0sCpiAbmLgDGqfomOF3sPhUvYeQmnzBole78GFUUyjm1IZLSMYaykAInn48wvPxPWUg9wktUq8jA98gU15cOex5yE6Lygahgnxq7Tem6VbDlaGe7ay8FGGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327591; c=relaxed/simple;
	bh=/JtCeopP0Q7MrEeGjmWDHuGqIDn9+5FewW57GJLDwU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UxyLP3ysP6KBCjzlKyt+Bdsy+pul/yruzUZMEkoOeYTzXSVSC1TnpBRsPem9LMSN/aHGk1bxR+LRJ1+AtAvc3Xw8jkkpmJy35zRbr71C+mjH0ehAES1nRbeH5nqnO/b61tPPAF0mxJjE4vqX1DP6JGgMuSgmD7HM0HqqNXj/bJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwjoK3Sz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736327590; x=1767863590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/JtCeopP0Q7MrEeGjmWDHuGqIDn9+5FewW57GJLDwU0=;
  b=MwjoK3Sz1tTjjTDPXLQ/V40z96/jRICN2o9ZoCTnHEvXUmuQvrf7RWaC
   e4HwnA2z5ODFU/nz9yZB6VAlcN/CcUcfYBgLH9FTZV/4/DZjuE3gXZTlE
   Qn5PjEHElCgYn46WClefeVaxeOp9Zb+3Bb2w4oYm1yap8No3F7MoOq5WB
   IB19rWz+ibnnmRrjjcXHVvaxoGg5SxhtrXeuRGyUZaffhkISiaJPxVSMb
   UxBX3ojMzBzD7GJgZoOHY1elbk8mwi533O6DPr2Kf7OXm4SX4fmVR94po
   twlVx7n6KrnVwwsUYCrLPVkgG1WUuE2Hg7E5SJU2joXIiM7zEFxVCODyS
   g==;
X-CSE-ConnectionGUID: U8P5PA9bRmOQ5IugeTPiQA==
X-CSE-MsgGUID: U4l/6jbKSVmkbuL6po0dkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36444408"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="36444408"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 01:13:09 -0800
X-CSE-ConnectionGUID: vvhgxdWZT+KxN8QU8TuODQ==
X-CSE-MsgGUID: yiWv1KGhQrajp3Pfmm4CXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103886624"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 01:13:06 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D9C3411F9C0;
	Wed,  8 Jan 2025 11:13:02 +0200 (EET)
Date: Wed, 8 Jan 2025 09:13:02 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: usb-device: Add panel-location
Message-ID: <Z35BnplCOVyboSBs@kekkonen.localdomain>
References: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org>
 <20241217145612.GA1652259-robh@kernel.org>
 <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>
 <20241219122453.GA4008177-robh@kernel.org>
 <CANiDSCt+LAE-LzCDZgrWP_V-Jc-ywTF1-PuQtyDJMfV9v_ZzGA@mail.gmail.com>
 <CAL_JsqLON5xKoYtowKdk49s-YHbk9bq9akZSH1kHdQ_9vxKSQQ@mail.gmail.com>
 <CANiDSCvRfZiMafeJ6==oyduZCzJsv74pg9LbswnjoXFS2nTm=g@mail.gmail.com>
 <Z347NA00DMiyl1VN@kekkonen.localdomain>
 <CANiDSCs37N79MnFZxvBJn2Jw3062EdLRuVP4EkJVfJcfMMuPAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCs37N79MnFZxvBJn2Jw3062EdLRuVP4EkJVfJcfMMuPAg@mail.gmail.com>

Hi Ricardo,

On Wed, Jan 08, 2025 at 09:51:34AM +0100, Ricardo Ribalda wrote:
> > > diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > index da890ee60ce6..5322772a4470 100644
> > > --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > @@ -37,6 +37,10 @@ properties:
> > >        but a device adhering to this binding may leave out all except
> > >        for "usbVID,PID".
> > >
> > > +  orientation:
> > > +    description: If present, specifies the orientation of the usb device.
> > > +    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientation
> >
> > Do you need this for a camera or for other kinds of USB devices, too?
> >
> > What about e.g. the rotation property?
> 
> I need it for cameras. I do not have a usecase for rotation now, but I
> might have in the future.

If it's specific for cameras (UVC kind I presume?), wouldn't it be
reasonable to add specific bindings for it?

-- 
Sakari Ailus

