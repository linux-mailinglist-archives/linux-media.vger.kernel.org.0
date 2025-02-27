Return-Path: <linux-media+bounces-27146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E129AA479E9
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 11:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 275931885045
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 10:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0F9229B23;
	Thu, 27 Feb 2025 10:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IpjobHDH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7345B227EAE;
	Thu, 27 Feb 2025 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740651250; cv=none; b=Y2lMbwMvHJMaZgRCwkN3swlqyyq0PnKzpejZ6N8xDcjCN3a0EER/xwaG/Gac+38Cdj2+ixMEeg4O7H84T1eGvotbH8QJ/RNriZI24j6mOikQx3uq4b6rj0mVqgEcyTkgD5RHUFTK5OJvKn1EyGqt7j13MpP4K80tCCRoNgqN1Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740651250; c=relaxed/simple;
	bh=gseLAHp4E+Igv9cI7PtONJP3gJHTR/dnFqtpGS6PFxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6uGdH5uVQ/pQ4mlwWOaL6DsbX2VWZVrzRhjpz4/cSGwCCwY4FWnjrtiIVDdxIE6fV9tsl+lOReUXSpLu9xzTmu7aVg1sUFZrToU5bVgoWxdObDlshX/deRGYTMYicxq0Ek8rY63iVVZN50+hTQXi1ZgpEFT1RRwhNI1/fnI0js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IpjobHDH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740651248; x=1772187248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gseLAHp4E+Igv9cI7PtONJP3gJHTR/dnFqtpGS6PFxQ=;
  b=IpjobHDHjgdy3oJJP9oYg2jfMWY1elIzZCD4IhS4zeUeqWfkATf82pb5
   XIXNw4M2svecqJnWl4DQfsk/PNlVwTFAHkHvUVYAfVBrMuO3UjQ6Ceoya
   Bm/B04Xf9a9+icubcLUJpx2RqDLr0xAm82GH5hSymjgQeJBUnQ7Nt/pds
   pgbGNLk50Uikczor9ddWWIXkdVEVL9HKQkdSVv+y5knXWIZbf82/u3KEb
   VRZhjlbbsQtVkYVy8AEuHpsx05j01oNLVDmneb5b3AmFvPk1WndQzt5cA
   YHhb7xSEPLdBlihHBX+MpUvufpY8rfQl6F7qYpguU4zW8vwbrlXPm7Yuk
   g==;
X-CSE-ConnectionGUID: OMaUPBQQTH2TOX35vrQtgA==
X-CSE-MsgGUID: aC9+0EINReqXz8LaEJkKQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52172112"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="52172112"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 02:14:07 -0800
X-CSE-ConnectionGUID: h0+jg6i9R0yBDlukY4UbCg==
X-CSE-MsgGUID: /TMiIC0sRceQC7YLEYVTJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="122096659"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 02:14:05 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1E68F11F944;
	Thu, 27 Feb 2025 12:14:02 +0200 (EET)
Date: Thu, 27 Feb 2025 10:14:02 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, manuel.traut@mt.com
Subject: Re: [PATCH v1 2/8] MT9M114: Add pad-slew-rate DT-binding
Message-ID: <Z8A66l02Et4J7hj4@kekkonen.localdomain>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
 <20250226153929.274562-3-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226153929.274562-3-mathis.foerst@mt.com>

Hi Mathis,

On Wed, Feb 26, 2025 at 04:39:23PM +0100, Mathis Foerst wrote:
> The MT9M114 supports the different slew rates (0 to 7) on the output pads.

"the output pads" probably means pixel data interface (DVP or CSI-2)
signals in this cases? I suppose this is about clock modulation?
It'd be good to say that.

> At the moment, this is hardcoded to 7 (the fastest rate).
> The user might want to change this values due to EMC requirements.
> 
> Add the 'pad-slew-rate' property to the MT9M114 DT-bindings for selecting
> the desired slew rate.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> index 72e258d57186..666afe10c538 100644
> --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> @@ -74,6 +74,12 @@ properties:
>      description: Bypass the internal PLL of the sensor to use EXTCLK directly as SYSCLK.
>      type: boolean
>  
> +  onnn,slew-rate:
> +    $ref: /schemas/types.yaml#/definitions/uint8

No need to make this 8-bit (i.e. just use 32 bits).

> +    description: Slew rate ot the output pads DOUT[7:0], LINE_VALID, FRAME_VALID and PIXCLK

Please wrap at 80 characters.

Is there more information on the effect than 7 is the fastest?

> +    minimum: 0
> +    maximum: 7

Please also add a default.

> +
>  required:
>    - compatible
>    - reg

-- 
Regards,

Sakari Ailus

