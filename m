Return-Path: <linux-media+bounces-11583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 731958C8295
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 10:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A47C01C21550
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 08:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AD98BFA;
	Fri, 17 May 2024 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ue1P2tJJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA117462;
	Fri, 17 May 2024 08:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715934705; cv=none; b=ZYg8lJX0Dw3W0J59SmOC5lVuyHkFWuMcya9aZsbWl2tjIEpoFLPZckrtEyEMHfMmFyLuwRJgWZl7loUt5ZGIEAMfUtAZ/xavGwUDtHwqYQlj/zCSvY2u7AFfNM05fsL3OrXcNxrERfObbPDwnvJfWG8aPzBY9M+blxX7VizqU54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715934705; c=relaxed/simple;
	bh=prBf8znSTTc5nFl7RT8skuny43hVLa6n01mcp7KkR9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ID6BBh4AgHpCCqio0pCbMnbmc3GcgHXHg457AEBAr7PuORsOke812rRBSS3AtXPV9HqrWdTBEcblbE6rlIRCIRS24Gj7PLngeIDZ6CFyRZwHGK7KEPjrK5+TGUVTdSsQVllwPrV98GumAiGeUfe/h3z4GCyUAvj2rZGbYDSAswg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ue1P2tJJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715934704; x=1747470704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=prBf8znSTTc5nFl7RT8skuny43hVLa6n01mcp7KkR9U=;
  b=Ue1P2tJJ6tv7iN9QCIUGPMPWM3dcCytPc98QMgNbaj+yBDHQyvr0ZGUR
   jDd4TCSmDHSUvZy+7D0KLH9qEIZdPdu2LOI/9BCGBW9yWr22x3jZ95VEu
   TfAvigapfwEQV4wmpmhaAnM64t6ySIdHD9l2y45+YyJbNOTWqf0ZQ/3JM
   o0AmU93/R/sJm9HFf8BHGTSv4e7bfGz+tkY6/tGahtbv8vdeZ7iPG4ujv
   Z+sb/LU8qheTjSyrOe6Kg2hxhz5MqVFpyKzpzmlFXkSB5ulduve6jpRwr
   QQXCcCyuyksbd6XEmzC0NjupRgvPRkimDdaKeB7X4L5AbR35zxOwc1NtC
   A==;
X-CSE-ConnectionGUID: rgbCTEznTFCnP0hkFvxykg==
X-CSE-MsgGUID: tPkWu0kiRN6hYpKP+2NSCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12288398"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="12288398"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 01:31:43 -0700
X-CSE-ConnectionGUID: x28zoPStSP6A+QH9cXVSTw==
X-CSE-MsgGUID: ynVcaboxT9OjyDZ+LLrCzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="62545875"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 01:31:38 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 914DD11FA44;
	Fri, 17 May 2024 11:31:35 +0300 (EEST)
Date: Fri, 17 May 2024 08:31:35 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@luigi311.com
Cc: linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pavel@ucw.cz, phone-devel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 21/25] dt-bindings: media: imx258: Add binding for
 powerdown-gpio
Message-ID: <ZkcV5xWZz2jCszxA@kekkonen.localdomain>
References: <20240501152442.1072627-1-git@luigi311.com>
 <20240501152442.1072627-22-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501152442.1072627-22-git@luigi311.com>

Hi Luis,

On Wed, May 01, 2024 at 09:24:38AM -0600, git@luigi311.com wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> Add powerdown-gpio binding as it is required for some boards.

I thought the conclusion was that this wasn't a property of the sensor? If
it needs to be controlled, then this should take place somewhere else than
in the sensor driver.

> 
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Luis Garcia <git@luigi311.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Pavel Machek <pavel@ucw.cz>
> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> index c978abc0cdb3..33338139e6e8 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> @@ -36,6 +36,10 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  powerdown-gpios:
> +    description:
> +      Reference to the GPIO connected to the PWDN pin, if any.
> +
>    reset-gpios:
>      description: |-
>        Reference to the GPIO connected to the XCLR pin, if any.

-- 
Regards,

Sakari Ailus

