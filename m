Return-Path: <linux-media+bounces-23783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAABE9F7B4B
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 13:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D36D16631E
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 12:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F592248B5;
	Thu, 19 Dec 2024 12:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjRCHDmz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506FA223328;
	Thu, 19 Dec 2024 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734611385; cv=none; b=QK2Czl6XqGkGa7vJXEIgaj86woS7x0HZ427Sl9PCSAjGHzsS+mgj/IagwM/nRpfJbHsV7DGQKJebrXKZBDtDBMM4nc9HTYOEdMMmekB59OUjrDnnSGfpiKHQJekupWo6xOgXA+WA9cqkz6oJatkRkyg4wIpLQSk4yJQJUAZ+JiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734611385; c=relaxed/simple;
	bh=5P/2JAAHnuR/NFk/T659gT2W+QO6cDCXm/CHY/7gssU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzuO/uAoNKdEXJR9ot3H5lIdKTkuLhaf3ReajleB08TdaEEajiTzBkT1TdF1x/NeT+t9eGTIiZG+0Y4O+ZhA9ZGM/Hu3d5VF0PMitdKzFP76IJ2dYGa/aB3g58EW4xbkG3t4pTSdeKgAZm+OuANKMnF3iCDS/MiQgkh59B6ijps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjRCHDmz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734611384; x=1766147384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5P/2JAAHnuR/NFk/T659gT2W+QO6cDCXm/CHY/7gssU=;
  b=UjRCHDmzU1GxJGgMxUVxWTTripBH89FFcjErzWYmnTbdaL6tFqD7mqeP
   kGe9K/kmVx/EAPxO3Mtf+S8oPl0ckX3BtgwMXb4FX/k1b0cHi6xKURMEN
   IYcpOxKO0Hd3qXqfHGG84LARjzVUG1NEDvLq5KvCgaEj0gH3Va+hLBrKh
   HlhyNIakb87+FcQJtZiAkH8pQiCIinbFIcMsu42gOrEp2wHwjwiy1UOlE
   bLjUyZRhoojjvfjS8ieIwKGd9JPxiuqzwvtxbWhwralOo82USMmsQGVpd
   gSp1IhRjv2ei/aj6SiBlWVbWcmpZWhPZO+W5zquIXdSU7rZUmBP4XXovt
   w==;
X-CSE-ConnectionGUID: mlgkGvVnRj+T/VGc6XiLxg==
X-CSE-MsgGUID: wRD1ZObmR+qd+N20uJSYRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="52523744"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="52523744"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 04:29:43 -0800
X-CSE-ConnectionGUID: JA2EFHDFQASrsAsMh2QYpA==
X-CSE-MsgGUID: K9iNSASxTjSsKivY0bz1oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135494197"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 04:29:40 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F11AB11FA41;
	Thu, 19 Dec 2024 14:29:36 +0200 (EET)
Date: Thu, 19 Dec 2024 12:29:36 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rob Herring <robh@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: usb-device: Add panel-location
Message-ID: <Z2QRsMWX-f6Ya74j@kekkonen.localdomain>
References: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org>
 <20241217145612.GA1652259-robh@kernel.org>
 <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>
 <20241219122453.GA4008177-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219122453.GA4008177-robh@kernel.org>

Hello,

On Thu, Dec 19, 2024 at 06:24:53AM -0600, Rob Herring wrote:
> On Tue, Dec 17, 2024 at 04:24:27PM +0100, Ricardo Ribalda wrote:
> > Hi Rob
> > 
> > On Tue, 17 Dec 2024 at 16:02, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Thu, Dec 12, 2024 at 09:44:37PM +0000, Ricardo Ribalda wrote:
> > > > For some devices like cameras the system needs to know where they are
> > > > mounted.
> > >
> > > Why do you need this and why only this property and not the dozens
> > > others ACPI has?
> > 
> > Userspace needs that information to correctly show it in the UI. Eg;
> > 
> > - User facing camera needs to be mirrored during preview.
> > - The user facing camera is selected by default during videoconferences
> > - The world facing camera is selected by default when taking a photo
> > - User facing camera have different parameter defaults than world facing.
> 
> We already have "orientation" defined for this purpose.

I was thinking of the same. It's defined (for cameras) in
Documentation/devicetree/bindings/media/video-interface-devices.yaml .

> 
> > 
> > Right now, the only camera driver that expose the ACPI location
> > information is the IPU from intel
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/pci/intel/ipu-bridge.c#n258
> > 
> > And they are only using the panel.
> > 
> > If we need more information we can consider adding more parameters in
> > the future.

-- 
Regards,

Sakari Ailus

