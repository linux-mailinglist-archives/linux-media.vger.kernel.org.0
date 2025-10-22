Return-Path: <linux-media+bounces-45212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E041BFAE89
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 10:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80E353B61D2
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 08:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA42D309F1F;
	Wed, 22 Oct 2025 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANgRhvPR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5663081B4;
	Wed, 22 Oct 2025 08:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761121958; cv=none; b=MFfvgGsm67CFrqn4vHpN0ZlIQDUtslRITtrK+arlwOcls8O5kGMTD5L5QSzQRyIJinNS0bhrKbCrxCa0xYZwz2KzauXgtfmkhu3l5+0339xxT4POExxlDqiCSr3u4hObX0Lcm8ETB+6dN1L4rdbso6rjze5Rqxg63ObDr9ubjx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761121958; c=relaxed/simple;
	bh=eIj7ouvu+yaBu+SJvq2aGfX1xYQei+UMFInFjdhbYS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZdMG2yb4BvYtSOHKFY2cc86j2VmpHUHNHMqBKwx+C8ntk9EK6Vuy31A+nZdf+aMWBW1uA7Wm5mh810+XK+Lhl9YDlMhC8WkWU64Unl5jyH8GqZVaRVAFPqwXIo736IG6FK8gWfnLHhrUnVvwKfdKFlyCcMdK2QeNEYl+NHT3fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ANgRhvPR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761121957; x=1792657957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eIj7ouvu+yaBu+SJvq2aGfX1xYQei+UMFInFjdhbYS4=;
  b=ANgRhvPRSLroQNu1H5kbkm0gaNPgwWW2Z37JM1QpBHOtMbaZp8Y+nQXq
   MqE6o3jUB+nEuXxA1vxtWDCy86U+Iyl7peYN3BlLHFpWYZWs2iTEtLt5/
   96FSN+4KjNzpwArrd+kqrF4UXG1Qkhg8MCGM+iUKDn+N1WLVSoRpewW9N
   M/097MuPB7nCkrJWHqkmTQZYrG6HhyTtLZEreujemt9rukCvM3R+XsDXm
   Qv6654Paa7caUpbKKBsbuXXICoWL7kjDjI8no+lr4xK4OgQEUYiROVcsd
   NWlOAs14ZTPW5pQ3oBDMA2cWpYHf0RhWuQz9yklre1gxaJvIc7OO89O46
   Q==;
X-CSE-ConnectionGUID: MT3SacrwRGCvaRbaWS+4Fg==
X-CSE-MsgGUID: xBLpv/CMSBCF7ZZUvtHcRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62292824"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="62292824"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:32:36 -0700
X-CSE-ConnectionGUID: KZUB0IjgQyCT31mM4TGoFw==
X-CSE-MsgGUID: FAu8/8bvRTOtRTqkG8g5Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="183751869"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.28])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:32:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D1D7F11F87B;
	Wed, 22 Oct 2025 11:32:31 +0300 (EEST)
Date: Wed, 22 Oct 2025 11:32:31 +0300
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
Message-ID: <aPiWn81ekgdyoRX-@kekkonen.localdomain>
References: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
 <20251016020419.2137290-2-vladimir.zapolskiy@linaro.org>
 <aPaaLZoLMH3TfyJl@kekkonen.localdomain>
 <060938d1-9c9e-4a0b-a4ca-838b4b9cfa1d@linaro.org>
 <aPdOICr8bqP5a-EM@kekkonen.localdomain>
 <f3e66a7e-873b-4299-9ec9-be3aa7e100d6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3e66a7e-873b-4299-9ec9-be3aa7e100d6@linaro.org>

Hi Vladimir,

On Tue, Oct 21, 2025 at 01:23:31PM +0300, Vladimir Zapolskiy wrote:
> On 10/21/25 12:10, Sakari Ailus wrote:
> > Hi Vladimir,
> > 
> > On Tue, Oct 21, 2025 at 11:00:35AM +0300, Vladimir Zapolskiy wrote:
> > > Hi Sakari.
> > > 
> > > On 10/20/25 23:23, Sakari Ailus wrote:
> > > > Hi Vladimir,
> > > > 
> > > > Thanks for the set.
> > > > 
> > > > On Thu, Oct 16, 2025 at 05:04:18AM +0300, Vladimir Zapolskiy wrote:
> > > > > Add device tree bindings documentation for Samsung S5KJN1 image sensor.
> > > > > 
> > > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > > > > ---
> > > > >    .../bindings/media/i2c/samsung,s5kjn1.yaml    | 95 +++++++++++++++++++
> > > > >    1 file changed, 95 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..2220b3e528d4
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
> > > > > @@ -0,0 +1,95 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/media/i2c/samsung,s5kjn1.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Samsung S5KJN1 Image Sensor
> > > > > +
> > > > > +description:
> > > > > +  Samsung S5KJN1 (ISOCELL JN1) image sensor is a 50MP image sensor.
> > > > > +  The sensor is controlled over a serial camera control bus protocol,
> > > > > +  the widest supported output image frame size is 8160x6144 at 10 frames
> > > > > +  per second rate, data output format is RAW10 transferred over 4-lane
> > > > > +  MIPI D-PHY interface.
> > > > 
> > > > Can the sensor work with fewer lanes? This is almost always the case. In
> > > > this case you'd need data-lanes property but feel free to make 4 the
> > > > default if you like.
> > > 
> > > As usual I don't have access to the sensor datasheet, what is known to me
> > > is that
> > > 
> > > 1) there is no examples in the downstream, when MIPI CSI interface is
> > > configured in any other mode but 4 lanes D-PHY RAW10,
> > > 
> > > 2) right the same information is given in the official scarce booklet:
> > > 
> > > https://semiconductor.samsung.com/image-sensor/mobile-image-sensor/isocell-jn1/
> > > 
> > > The same reasoning as above is directly applicable to the second sent
> > > sensor driver of Samsung S5K3M5.
> > > 
> > > There is a known practical pattern that if it happens to be of necessity
> > > any new properties can be added to device's dt bindings later on, thus
> > > it should be safe to omit any presumably non-configurable hardware
> > > properties from the description on an early stage.
> > 
> > Even if the driver supports four lanes only, it's very unlikely the sensor
> 
> Well, the second point given above is not about the driver, but it leads
> to the shortest possible sensor hardware spec:
> 
> https://semiconductor.samsung.com/image-sensor/mobile-image-sensor/isocell-jn1/
> 
> If you scroll right to the bottom, it says
> 
> Interface: 4 lanes (2.15 Gbps per lane)
> 
> It does not completely or clearly exclude 1 or 2 lane configuration,
> I know, but "exclusions" are not documented anyway, only something
> presenting gets documented.

Indeed, such brochures only describe the hardware capability, not so much
its configuration in detail.

> 
> > is limited to this. There are two options here:
> > 
> > 1. make data-lanes mandatory or
> > 
> > 2. add data-lanes as optional with default of four, which the driver
> >     supports and which is known to function.
> 
> If you ask, I'd rather prefer to implement the second option in the dt
> binding documentation and driver, let me know if there are any other
> asked changes to be done in a bulk.

Sounds good.

-- 
Regards,

Sakari Ailus

