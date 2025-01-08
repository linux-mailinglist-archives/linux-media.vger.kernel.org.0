Return-Path: <linux-media+bounces-24380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB3BA0559C
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 09:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE77A1654F8
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 08:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548A21EBFFC;
	Wed,  8 Jan 2025 08:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwzY16Jk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEED69476;
	Wed,  8 Jan 2025 08:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325951; cv=none; b=eBA+YQ76I746IBK1V233Cf4Lcb7IHgV27yXVT4lYMiShtUTc4/OTYwspFLu8jKtFuhBGH7FCWcnnouuTUb1WMCw4yP5j5NwtOGYpm+8Z61CItpvgO7/h915tVUuTOH8LZ6B6ur2AbEkpMVbxwiFzxhKKA7ZZ01rKD3qLTDxG8wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325951; c=relaxed/simple;
	bh=RpR7u/xw+bJIICXFrAcpgUOZaGNz3DAFbHhm/PusoBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kU/9jQ1ETSLolDqWg7m/mKCK1HtDOzysv5uDTsM5moFDMVPfwf0XVbWklozEnhuZ6p/pT+5ohHB7ADNQupXrRQrQgIm/j9Xgqrl/xpvT2dAETrLhnQji938YP5lWRecrxBLvlqIFkOwBaV17BhBVO3eHSK0ph/yRHrl0REbksug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HwzY16Jk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736325950; x=1767861950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RpR7u/xw+bJIICXFrAcpgUOZaGNz3DAFbHhm/PusoBo=;
  b=HwzY16Jk9KPkw5YnZIkzQwkg/tF+e5xOj8uGg/0c6HqTbQk9r36IG9Ns
   00vvixLZoPSZf0TjVRHHrL0DMcnAwW2nd8IrG9urHkuROK75+1mRUh5wO
   ZIxkyJQuAtvHS/vi2FgWdKWFLOv93kJzI8TOw39cN7K3ak0eXh8j8OHYp
   3OX2Mk7Tvb45a27CjQ1yHRN0Ym0Rr5qzrunt0ETV85ogBN8NN2yYDkQFA
   yQGROUCBE3KornZe7uHbQAq1j0am1+YK/15bRtUPARDy4b31UWAEGkGTB
   +rfSE0PzECa5COeBxi1wtVrDfcRtORmVBJ0mM31OpNW5QLt4sDNfLnlfd
   w==;
X-CSE-ConnectionGUID: 9iXrekqxTmOMp4yuqGog7Q==
X-CSE-MsgGUID: ln2DC81LSSWp4M5FP2c3ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36562900"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="36562900"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 00:45:49 -0800
X-CSE-ConnectionGUID: nAMvODD5SMmWp+dpY2KmrQ==
X-CSE-MsgGUID: 275BN3AoS7qNgc6Le4Kavw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="102840321"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 00:45:44 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C73EF11F9C0;
	Wed,  8 Jan 2025 10:45:40 +0200 (EET)
Date: Wed, 8 Jan 2025 08:45:40 +0000
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
Message-ID: <Z347NA00DMiyl1VN@kekkonen.localdomain>
References: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org>
 <20241217145612.GA1652259-robh@kernel.org>
 <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>
 <20241219122453.GA4008177-robh@kernel.org>
 <CANiDSCt+LAE-LzCDZgrWP_V-Jc-ywTF1-PuQtyDJMfV9v_ZzGA@mail.gmail.com>
 <CAL_JsqLON5xKoYtowKdk49s-YHbk9bq9akZSH1kHdQ_9vxKSQQ@mail.gmail.com>
 <CANiDSCvRfZiMafeJ6==oyduZCzJsv74pg9LbswnjoXFS2nTm=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiDSCvRfZiMafeJ6==oyduZCzJsv74pg9LbswnjoXFS2nTm=g@mail.gmail.com>

Hi Ricardo,

On Tue, Jan 07, 2025 at 11:37:18AM +0100, Ricardo Ribalda wrote:
> On Fri, 20 Dec 2024 at 23:00, Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, Dec 19, 2024 at 6:42 AM Ricardo Ribalda <ribalda@chromium.org> wrote:
> > >
> > > On Thu, 19 Dec 2024 at 13:24, Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Tue, Dec 17, 2024 at 04:24:27PM +0100, Ricardo Ribalda wrote:
> > > > > Hi Rob
> > > > >
> > > > > On Tue, 17 Dec 2024 at 16:02, Rob Herring <robh@kernel.org> wrote:
> > > > > >
> > > > > > On Thu, Dec 12, 2024 at 09:44:37PM +0000, Ricardo Ribalda wrote:
> > > > > > > For some devices like cameras the system needs to know where they are
> > > > > > > mounted.
> > > > > >
> > > > > > Why do you need this and why only this property and not the dozens
> > > > > > others ACPI has?
> > > > >
> > > > > Userspace needs that information to correctly show it in the UI. Eg;
> > > > >
> > > > > - User facing camera needs to be mirrored during preview.
> > > > > - The user facing camera is selected by default during videoconferences
> > > > > - The world facing camera is selected by default when taking a photo
> > > > > - User facing camera have different parameter defaults than world facing.
> > > >
> > > > We already have "orientation" defined for this purpose.
> > >
> > > Do you mean orientation from
> > > bindings/media/video-interface-devices.yaml ?
> > >
> > > I see a couple of issues:
> > > - Orientation has a very specific meaning for USB typeC. I'd prefer if
> > > we could avoid using that word.
> >
> > Yes, but this is tied to the class of the device, not the bus. I find
> > defining the position for USB devices confusing.
> >
> > > - For other applications different than cameras it might be useful to
> > > know the positions top, bottom, left, right, which are not available
> > > in video-interface-devices
> >
> > Other devices may need some of the 20 other properties in the ACPI
> > table as well.
> >
> > > - The value "external" does not makes too much sense for listed usb devices
> >
> > Then don't use it.
> >
> > > - It makes our lives easier if dt and acpi have the same meaning (less
> > > conversion)
> >
> > We have little to no input into what ACPI does. If we're just going to
> > copy ACPI, then just use ACPI instead.
> >
> > > All that said, for my specific usecase, reusing orientation from
> > > bindings/media/video-interface-devices.yaml works... So if that is
> > > what you all prefer I can send a v2 with that.
> > > Let me know what you think
> >
> > We already have something for cameras. Use it.
> 
> So you are proposing a change like this?
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml
> b/Documentation/devicetree/bindings/usb/usb-device.yaml
> index da890ee60ce6..5322772a4470 100644
> --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> @@ -37,6 +37,10 @@ properties:
>        but a device adhering to this binding may leave out all except
>        for "usbVID,PID".
> 
> +  orientation:
> +    description: If present, specifies the orientation of the usb device.
> +    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientation

Do you need this for a camera or for other kinds of USB devices, too?

What about e.g. the rotation property?

> +
> 
> 
>    reg:
>      description: the number of the USB hub port or the USB host-controller
>        port to which this device is attached. The range is 1-255.

-- 
Regards,

Sakari Ailus

