Return-Path: <linux-media+bounces-47488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F90C7400C
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 13:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 601DD2ACF8
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 12:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EED83370EC;
	Thu, 20 Nov 2025 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzcKwPsl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D447033030F;
	Thu, 20 Nov 2025 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763642369; cv=none; b=OrvAWLnD12MuCXnU/oHk0v7kFKeFTAXiUsnaUn5us8z/U2QreL7NzElNjTDjswjpcUODFI5MTIU9jYHaSjHQp0zgE0J7OyvHTyY/7IlEaq7AC0e62hzLbSdH3zs2mGwGHCH+++x79yDJ4eZLgxcY6XjY0rCfh8g5Xrtr6vbZxi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763642369; c=relaxed/simple;
	bh=xSn6nVn3tY51rF6U9R184exgm2ShZsLXIw31IA0SEIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYj0Zd3grLv7+e8om8UM4HlH1cGdgqAcXYYMPXy3/kF80JzHokKX6ILrQbiRyFFKpZQ4ZitEO4kX2FSDBZaU/NSYwyEhjZF3lST0Vf0fKA27vOg6cY9vUg1gocnH36V8pWlrfmowtTtqbZ1ya9/vrAsxQDhRdregBX4SNWnQdzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzcKwPsl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763642368; x=1795178368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xSn6nVn3tY51rF6U9R184exgm2ShZsLXIw31IA0SEIQ=;
  b=KzcKwPslqSSpslrez0GZlaHyz1vI1FdMGZEQFjY2nVkQgTU/oPy1RG6w
   UqrbRlxLUBOOMzE2+kJNpHZX1L2S34vKCm4LUtFAte+qt9SnKZWN6cUi0
   K4DbDfJeyMWXzMn1F3G1SzO2KlDKU0InePczFdEExZvZ/J1DohudbBTH3
   kVKMrydVZ33xRIuioewN3EQm8XIXfo7Qab20rPIQTcwlVPjE47icz2qD3
   f4BpW32/Gyi+oMV5IRj2ThHzzWTXS7XPBYZsP1onvU7qh32s/K8d1+HV5
   LGO8gpKDFRDIuPGDjkPwy41U7Nf0R+swk52tVF3auL+m8e2WX73NBt02A
   w==;
X-CSE-ConnectionGUID: eq5Xgkj9Q3S+o4FoxM29Cg==
X-CSE-MsgGUID: RXzNEwoMQ66ljSHBRfmw9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77175817"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="77175817"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 04:39:27 -0800
X-CSE-ConnectionGUID: ZQiq+zsuSr24GEaxnm+DsA==
X-CSE-MsgGUID: ShzY5c4OSlKddOHS8x5dIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="228662929"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.114])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 04:39:21 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C057E121DCE;
	Thu, 20 Nov 2025 14:39:18 +0200 (EET)
Date: Thu, 20 Nov 2025 14:39:18 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com,
	mripard@kernel.org, y-abhilashchandra@ti.com, devarsht@ti.com,
	s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de,
	conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
	sjoerd@collabora.com, dan.carpenter@linaro.org,
	hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 06/18] media: ti: j721e-csi2rx: add a subdev for the
 core device
Message-ID: <aR8L9kIFcRJoWQUi@kekkonen.localdomain>
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-7-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112115459.2479225-7-r-donadkar@ti.com>

Hi Rishikesh,

On Wed, Nov 12, 2025 at 05:24:47PM +0530, Rishikesh Donadkar wrote:
> +static int ti_csi2rx_sd_s_stream(struct v4l2_subdev *sd, int enable)

Could you instead implement enable_streams and disable_streams pad ops,
please, and use v4l2_subdev_enable_streams() from there?

> +{
> +	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
> +	int ret = 0;
> +
> +	mutex_lock(&csi->mutex);
> +
> +	if (enable) {
> +		if (csi->enable_count > 0) {
> +			csi->enable_count++;
> +			goto out;
> +		}
> +
> +		ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
> +		if (ret)
> +			goto out;
> +
> +		csi->enable_count++;
> +	} else {
> +		if (csi->enable_count == 0) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		if (--csi->enable_count > 0)
> +			goto out;
> +
> +		ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
> +	}
> +
> +out:
> +	mutex_unlock(&csi->mutex);
> +	return ret;
> +}

-- 
Regards,

Sakari Ailus

