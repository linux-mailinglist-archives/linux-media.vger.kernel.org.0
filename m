Return-Path: <linux-media+bounces-26549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874B7A3EEDC
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 09:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF0C27A535F
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 08:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F2D20103B;
	Fri, 21 Feb 2025 08:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRNDj7Dy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5B01FE470;
	Fri, 21 Feb 2025 08:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740127121; cv=none; b=CBLY4qGr09r/+M0fM7O1zco071CM83GhedPDH9pqWl71F8ZgdIc3USLS1U0AAmUWNGBY0R8oY112e3ev9/uqh9lWECQCgGxbQK8tWr419dAJDreaJghmKkiHBD1TYYilsOHp16GEJbRmKzAFeF0rl9lcd+fJC+FNDkbKT38X6NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740127121; c=relaxed/simple;
	bh=nqodSYX9zfwa+wP+jRooDOmd19luEYIiS/x1QP3QuqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFwJl45jt6lv/TVcyOJVbp5OkdidR1TdUL7iWUd8Yj4aFD6v6lbe6RrvMHs/VQtfIXzEy8cu3OQJlgY6tYIj4LOx4ix+c4ee/jMwpKHmrlSdy7PMmIl818hixIjnNXpLpsb+gdZ2nHCPGob/dTZAGMmgzI21Vc7BIyhLbAVhUqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRNDj7Dy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740127120; x=1771663120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nqodSYX9zfwa+wP+jRooDOmd19luEYIiS/x1QP3QuqQ=;
  b=cRNDj7Dyy5ybFnbejEr3tuNkbavsqAPRmB92vlO9nit68D0zi74awByQ
   GPJKTTsVYw/AtnWNOlWBhIRo/lN43rNTELpuUAZSU5TVZ945Wjuk6ptZo
   Sni8uCdGcI0NAoxw45dhYLt+Q6bMTVOfSYaRczJF1y2hgEEWZ98LZ7vnX
   wViGeUxKA+nyQRJB8UFV93DQ+HMl88m9qSc7ru4jM+OwIf+4hy/DSUWDP
   U+TX+xvF27wV1FLk5iqIslULaj+eOSSreuHT3i85ITAPBsuPNiu17Zf0c
   DoQ9Jr6zzvt1ORrG8r8XCNxcNtWwXJzkwpAv3KQl9CwedjxDI+eziLSHA
   Q==;
X-CSE-ConnectionGUID: d58bBZWtRka+y0xDCXz5iA==
X-CSE-MsgGUID: xdK3Yt0ZRD+pfiyAy4tdxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41058466"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="41058466"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 00:38:39 -0800
X-CSE-ConnectionGUID: yBxMvSy1Rh+CXJ0lab4mqA==
X-CSE-MsgGUID: 08+yRwERQR+OdaXElvcbxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115255765"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 00:38:35 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 81C82120289;
	Fri, 21 Feb 2025 10:38:32 +0200 (EET)
Date: Fri, 21 Feb 2025 08:38:32 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: media: video-interfaces: add support
 for Virtual Channel IDs
Message-ID: <Z7g7iCUlsUN2LBIW@kekkonen.localdomain>
References: <20250220230818.275262-1-demonsingur@gmail.com>
 <20250220230818.275262-2-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220230818.275262-2-demonsingur@gmail.com>

Hi Cosmin,

Thanks for the patches.

On Fri, Feb 21, 2025 at 01:08:09AM +0200, Cosmin Tanislav wrote:
> Multi-camera systems often have issues with receiving video streams
> from multiple cameras at the same time because the cameras use the same
> Virtual Channel IDs.
> 
> CSI bridges might not support remapping the Virtual Channel IDs, making
> it impossible to receive the separate video streams at the same
> time, while the CSI receiver is able to de-mux streams based on VC IDs.
> 
> Cameras sometimes have support for changing the VC IDs they output
> themselves.
> 
> For a practical example, GMSL2 deserializer chips do not support VC ID
> remapping in tunnel mode, and neither do the serializers. Allowing the
> cameras to have their VC IDs configured would allow multi-camera setups
> to use tunnel mode.

We've tried to avoid having virtual channels in firmware and in UAPI,
I'm not yet entirely convinced we need to depart from the established
practices. Let's see. Apart from that, please see my comments below.

> 
> Add support for specifying these Virtual Channel IDs in Video Interface
> Endpoints. The supported values are 0 to 3, with a maximum of 4 values.
> Although the CSI-2 specification allows for up to 32 virtual channels,
> most hardware doesn't support more than 4. This can be extended later
> if need be.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/video-interfaces.yaml   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> index 038e85b45befa..414b5fa8f3472 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> @@ -231,6 +231,17 @@ properties:
>        shall be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
>        busses only.
>  
> +  vc-ids:

Other properties aren't using abbreviations, at least most of them. How
about "virtual-channels"?

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4

Shouldn't this be 32?

> +    items:
> +      maximum: 3

31 here, too.

> +    description:
> +      An array of Virtual Channel IDs. These are unsigned integers that specify

I'd leave out the explanation on the data type. It's redundant.

> +      the VC IDs used by the device for its data streams. This property is valid
> +      for MIPI CSI-2 only.
> +
>    strobe:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [ 0, 1 ]

-- 
Kind regards,

Sakari Ailus

