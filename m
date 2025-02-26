Return-Path: <linux-media+bounces-27086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C17D6A46636
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 17:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFF413A6088
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8C121CA04;
	Wed, 26 Feb 2025 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIy2WahF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137191DE2A0;
	Wed, 26 Feb 2025 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740586126; cv=none; b=D9XP8PURx8j/MairIBvjViyGI3pXNIaUBA9Oc/sd+ZIbgd0M7vt6+QUwbJa1fmfS6PsOTPQ97NBq3DbGG8gZejb8nvKDBBwawULJzNkFr1x3U/2pslv7Z2lMZG1duf+5VTWywPfX/EmW+dUDvqFSzbbCP10dY4WQlpTeCn3ZuLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740586126; c=relaxed/simple;
	bh=YIhN7xyFT7K0nQ06jXmx+41n6tZRGej2Wzg4+MGtWTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhP3eaLDYAxKuqGUC+cApb/1cuNuOikptUvIaMs3UnoZvppYNDFvfHtLiilH8eMCwDn03R9zab68mOSZu6SWPSyiJdSg6jeYO216nqjSDBuh2zh/t9JRcI/2I/j73yABMMrJ67q8SizxAr/xu/xNwWXhT1nm7zVoHLq1/Sy3BhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIy2WahF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740586125; x=1772122125;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YIhN7xyFT7K0nQ06jXmx+41n6tZRGej2Wzg4+MGtWTA=;
  b=BIy2WahFfy8ck95U0QH+K4H7KNoXu/CDfM7GXD3OCNjfxsvTMBXiwPk/
   Oa5cDEOE1VVII9L76ZqQg8IcKcGGYqfSXpj4RKf0O/7k9UqIltM7zC0bZ
   me3eeI0n+M3yeHaqyBDfDEHIwBGlA7G9VERaQtCVyRM7XRsv0S2/pE9qp
   HDlMxQ0jfVN5SS0ZCTpeCsihTraTQvyvW/xEMG+iWkMbOibWJHbEnOOa/
   LGlcADYdbJ3VLvTUVmWkN/wq/rld7EiiORyQFVg9PMfjuC7e3EDsf2hKc
   qfDwbGmsOXoWAN2NYNsv1V+LnSJe7dSDbEwuVWXRATHloHWtUTxzwpY65
   A==;
X-CSE-ConnectionGUID: cRxxDJXdQf2oSph4myZELA==
X-CSE-MsgGUID: tpivdYVcSpeN2h713KOCKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45221831"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="45221831"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:08:44 -0800
X-CSE-ConnectionGUID: EeN2cePgQJadJV9KcS74OA==
X-CSE-MsgGUID: FhQCKIXsTVyjFb9MYsveXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="121737427"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:08:41 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0F04211F944;
	Wed, 26 Feb 2025 18:08:39 +0200 (EET)
Date: Wed, 26 Feb 2025 16:08:39 +0000
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
Subject: Re: [PATCH v1 1/8] MT9M114: Add bypass-pll DT-binding
Message-ID: <Z788hw7pSpwmL2Ze@kekkonen.localdomain>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
 <20250226153929.274562-2-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226153929.274562-2-mathis.foerst@mt.com>

Hi Mathis,

Please see which subject prefix has been used in the past for these
bindings.

On Wed, Feb 26, 2025 at 04:39:22PM +0100, Mathis Foerst wrote:
> The MT9M114 sensor has an internal PLL that generates the required SYSCLK
> from EXTCLK. It also has the option to bypass the PLL and use EXTCLK
> directly as SYSCLK.
> The current driver implementation uses a hardcoded PLL configuration that
> requires a specific EXTCLK frequency. Depending on the available clocks,
> it can be desirable to use a different PLL configuration or to bypass it.
> 
> Add the 'bypass-pll' property to the MT9M114 DT-bindings to allow selecting
> the PLL bypass mode.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> index f6b87892068a..72e258d57186 100644
> --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> @@ -70,6 +70,10 @@ properties:
>            - bus-type
>            - link-frequencies
>  
> +  onnn,bypass-pll:
> +    description: Bypass the internal PLL of the sensor to use EXTCLK directly as SYSCLK.
> +    type: boolean
> +

But on the content itself: do you need this? Could you instead compare the
external clock frequency to the link-frequencies property value(s)?

>  required:
>    - compatible
>    - reg

-- 
Regards,

Sakari Ailus

