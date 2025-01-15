Return-Path: <linux-media+bounces-24770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5F3A11ED0
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 11:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 771231649D0
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 10:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EE120CCCE;
	Wed, 15 Jan 2025 10:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlwMvqpA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D19248160;
	Wed, 15 Jan 2025 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736935376; cv=none; b=s7c0aj/jR32ieimNCmfDf4ubUYz0f+gcLYnDNJi6FxZzDzlauQZkAnA7mDRnRnfdDv9feWngoyiYQqefa6thngH28D+i1q6bODchnkajRvAE0KdZlgJjX+ypUO00hzzkimTL3Ps9mWFAjU1p5jhsM2CrVfULX5SKjfX9lpy/Lxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736935376; c=relaxed/simple;
	bh=JoZEgsC26B+m7sk2PctIPwPPabGPfFf+j0coBGyXGVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmmGCQHYv2ROTt5FE7AsxZQb5H7a835kHLNCh8dc9YPB+RMGkIMPzMruGFK2Mb7jowdZMfQmL3NFN/a/QZxD+2VQ6qUwXwHkpcvKrXVe/Ue1s/JP6lYNoQJCvWfg0NqJ5ViNIglTgTjSNDDksAPgH4atolbFzWWitRk7ZT71Ks8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlwMvqpA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736935372; x=1768471372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JoZEgsC26B+m7sk2PctIPwPPabGPfFf+j0coBGyXGVs=;
  b=dlwMvqpA+LFPMQTooG2FFX8dBKeTdCHtufLY6qFfDqV2P2KOU7b0R2+Y
   YQXmDmzF0FsR71n0j9emDQTE9VUFZlFqBNHYql6B6ZJdTLT85yKlUs0Vq
   zMo8N7pRFkxxGorAQa49DxzFNh7Ri1N8krE58svfSPP6KYeonwJ2npOTQ
   PpX9ZRLq7eU8Ixm11d85gslas66GuPhxUFV6Px2/Yoc7HSHMmi5jIIAUP
   y7xzg18bmoSwNQ7KQozNjn5RyDI57aGj5rl4opXJvcSs0efy60uSauur0
   pKHh/sW6aQ1jgzx9JUrL5x4ZV77WtDXzpbm9MENOI+S6g/uTa2GFH01K8
   w==;
X-CSE-ConnectionGUID: xljbMPecQ3CV1dWQ8jcqiQ==
X-CSE-MsgGUID: vqWdyVK/ToekrSSDbpmuTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="48264441"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="48264441"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 02:02:51 -0800
X-CSE-ConnectionGUID: wo8lSug0RymJn/8J9m7osg==
X-CSE-MsgGUID: 8vuEDfHkR7adKfLZDXc8zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135945796"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 02:02:48 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E0E9D11F8B3;
	Wed, 15 Jan 2025 12:02:45 +0200 (EET)
Date: Wed, 15 Jan 2025 10:02:45 +0000
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
Message-ID: <Z4eHxTzn1aUyUT7z@kekkonen.localdomain>
References: <20241217145612.GA1652259-robh@kernel.org>
 <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>
 <20241219122453.GA4008177-robh@kernel.org>
 <CANiDSCt+LAE-LzCDZgrWP_V-Jc-ywTF1-PuQtyDJMfV9v_ZzGA@mail.gmail.com>
 <CAL_JsqLON5xKoYtowKdk49s-YHbk9bq9akZSH1kHdQ_9vxKSQQ@mail.gmail.com>
 <CANiDSCvRfZiMafeJ6==oyduZCzJsv74pg9LbswnjoXFS2nTm=g@mail.gmail.com>
 <Z347NA00DMiyl1VN@kekkonen.localdomain>
 <CANiDSCs37N79MnFZxvBJn2Jw3062EdLRuVP4EkJVfJcfMMuPAg@mail.gmail.com>
 <Z35BnplCOVyboSBs@kekkonen.localdomain>
 <CANiDSCteoJ_Lk_G6KQKyK1MWikEHF36bYaSHwFEhJh0BFxb6Dw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCteoJ_Lk_G6KQKyK1MWikEHF36bYaSHwFEhJh0BFxb6Dw@mail.gmail.com>

Hi Ricardo,

On Wed, Jan 08, 2025 at 10:48:34AM +0100, Ricardo Ribalda wrote:
> Hi Sakari
> 
> On Wed, 8 Jan 2025 at 10:13, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Ricardo,
> >
> > On Wed, Jan 08, 2025 at 09:51:34AM +0100, Ricardo Ribalda wrote:
> > > > > diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > > > b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > > > index da890ee60ce6..5322772a4470 100644
> > > > > --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > > > +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > > > > @@ -37,6 +37,10 @@ properties:
> > > > >        but a device adhering to this binding may leave out all except
> > > > >        for "usbVID,PID".
> > > > >
> > > > > +  orientation:
> > > > > +    description: If present, specifies the orientation of the usb device.
> > > > > +    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientation
> > > >
> > > > Do you need this for a camera or for other kinds of USB devices, too?
> > > >
> > > > What about e.g. the rotation property?
> > >
> > > I need it for cameras. I do not have a usecase for rotation now, but I
> > > might have in the future.
> >
> > If it's specific for cameras (UVC kind I presume?), wouldn't it be
> > reasonable to add specific bindings for it?
> Yes, they are uvc cameras
> 
> Do you mean something like this:
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml
> b/Documentation/devicetree/bindings/usb/usb-device.yaml
> index da890ee60ce6..bc80c1e7360f 100644
> --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> @@ -75,6 +75,12 @@ patternProperties:
>            configuration value.
>          maxItems: 1
> 
> +      image-sensor:
> +        description: Video interface properties associated to USB cameras,
> +          typically UVC compliant.
> +        allOf:
> +          - $ref: /schemas/media/video-interface-devices.yaml#
> +

I missed earlier the compatible string comes directly from the USB vendor
and product IDs and this isn't the primary means of identifying a USB
device anyway, IOW we couldn't have a compatible for UVC webcams for
instance.

None of the alternatives here seem exactly great to me but all of them
would likely just work.

I think I prefer your earlier suggestion, the question I have though is
whether or not it should be limited to certain VIDs/PIDs.

>  required:
>    - reg
> 
> @@ -113,6 +119,9 @@ examples:
>              interface@0 {
>                  compatible = "usbif123,abcd.config1.0";
>                  reg = <0 1>;
> +                image-sensor {
> +                  orientation: 0;
> +                };
>              };
> 
>              interface@0,2 {

-- 
Kind regards,

Sakari Ailus

