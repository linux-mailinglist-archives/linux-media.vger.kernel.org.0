Return-Path: <linux-media+bounces-45114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A3789BF5706
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 11:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 03D4F352612
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 09:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DB932AAC7;
	Tue, 21 Oct 2025 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExLZwfuq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C47F1C28E;
	Tue, 21 Oct 2025 09:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761037863; cv=none; b=mPurxmm9hSueC0yuewXBhIwanaiuCIHETSjk/w00ignzfraR2JIEXCZZfn4hebQrSzZ1pFRVdPPHrS4Dk+VXQMgrRdD8YPCYhK8Jt24PxDGexrPq3rq0BDapJAMf7a9BgxAmx7j/229VeuC6/6JAzl6Sk5Xl3TynzURjxVmyRN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761037863; c=relaxed/simple;
	bh=Gn15FFXEYu9bBVyN2CUJTC7Xigfnh2ZPNvF2Cy/JPec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3ZsmMr4Do+av98jP6/MpJhKNeat5+fqDkaUyinMXhxDps0ZNBRPnGQH3SVH7Gwl908pzavv27AN2iv2/kWIHtDWwbEJiPM6PD05NXM25yD167MQ84ZCW5mQSJZP6eGXkTU+IT19ZDnZfq0R4qb0VErIWVBhD/Siw6+nH+Egg8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExLZwfuq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761037861; x=1792573861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gn15FFXEYu9bBVyN2CUJTC7Xigfnh2ZPNvF2Cy/JPec=;
  b=ExLZwfuqf6fF6R1nZdjlv4l3HFzwsUKVZ9rJxugthoSiKshMeESJHues
   E/CpGtd46ROC5HZW2doPChRU7205EyKgHOqLLljbGZY/K9c5OZO4otyNQ
   WRMeK8a9IFi5EFvfkOgVoBRnXf/Wjl4zhdEtbGpYKkt7mhKy9/QZNDY9U
   PN9tSHKkUQHoRQPW1CcAk2KXnbdROdsZFUyugqB0EZvsDR8MSC0G8qLzF
   Guh2ERNplVXmjC6KuIOAy8TcIppl+XgLr2vSpXpsZ+zxUovqRCs0SdRj/
   wvVdnhr71OFN0ItYC+ihapYSG1zfo0NDdpOVMOOGcXb+M5mJuFK58HtF4
   g==;
X-CSE-ConnectionGUID: 4dolbl83T96b+5Mgz9PAHw==
X-CSE-MsgGUID: Qkjw00eHQ5SB7xalbR5nXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62861016"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="62861016"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 02:11:01 -0700
X-CSE-ConnectionGUID: q0bsW0ckRECq2njvYD+fEA==
X-CSE-MsgGUID: L7A1EdwgTDe8gX2BRg7ZVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="183946832"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.134])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 02:10:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2D2441202B5;
	Tue, 21 Oct 2025 12:10:56 +0300 (EEST)
Date: Tue, 21 Oct 2025 12:10:56 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add Samsung S5KJN1 image
 sensor
Message-ID: <aPdOICr8bqP5a-EM@kekkonen.localdomain>
References: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
 <20251016020419.2137290-2-vladimir.zapolskiy@linaro.org>
 <aPaaLZoLMH3TfyJl@kekkonen.localdomain>
 <060938d1-9c9e-4a0b-a4ca-838b4b9cfa1d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <060938d1-9c9e-4a0b-a4ca-838b4b9cfa1d@linaro.org>

Hi Vladimir,

On Tue, Oct 21, 2025 at 11:00:35AM +0300, Vladimir Zapolskiy wrote:
> Hi Sakari.
> 
> On 10/20/25 23:23, Sakari Ailus wrote:
> > Hi Vladimir,
> > 
> > Thanks for the set.
> > 
> > On Thu, Oct 16, 2025 at 05:04:18AM +0300, Vladimir Zapolskiy wrote:
> > > Add device tree bindings documentation for Samsung S5KJN1 image sensor.
> > > 
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > > ---
> > >   .../bindings/media/i2c/samsung,s5kjn1.yaml    | 95 +++++++++++++++++++
> > >   1 file changed, 95 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
> > > new file mode 100644
> > > index 000000000000..2220b3e528d4
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
> > > @@ -0,0 +1,95 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/samsung,s5kjn1.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Samsung S5KJN1 Image Sensor
> > > +
> > > +description:
> > > +  Samsung S5KJN1 (ISOCELL JN1) image sensor is a 50MP image sensor.
> > > +  The sensor is controlled over a serial camera control bus protocol,
> > > +  the widest supported output image frame size is 8160x6144 at 10 frames
> > > +  per second rate, data output format is RAW10 transferred over 4-lane
> > > +  MIPI D-PHY interface.
> > 
> > Can the sensor work with fewer lanes? This is almost always the case. In
> > this case you'd need data-lanes property but feel free to make 4 the
> > default if you like.
> 
> As usual I don't have access to the sensor datasheet, what is known to me
> is that
> 
> 1) there is no examples in the downstream, when MIPI CSI interface is
> configured in any other mode but 4 lanes D-PHY RAW10,
> 
> 2) right the same information is given in the official scarce booklet:
> 
> https://semiconductor.samsung.com/image-sensor/mobile-image-sensor/isocell-jn1/
> 
> The same reasoning as above is directly applicable to the second sent
> sensor driver of Samsung S5K3M5.
> 
> There is a known practical pattern that if it happens to be of necessity
> any new properties can be added to device's dt bindings later on, thus
> it should be safe to omit any presumably non-configurable hardware
> properties from the description on an early stage.

Even if the driver supports four lanes only, it's very unlikely the sensor
is limited to this. There are two options here:

1. make data-lanes mandatory or

2. add data-lanes as optional with default of four, which the driver
   supports and which is known to function.

-- 
Kind regards,

Sakari Ailus

