Return-Path: <linux-media+bounces-7114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D953F87CA9F
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 10:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97A7E28574A
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 09:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63A417BC9;
	Fri, 15 Mar 2024 09:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HveHGjUu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA313182A0
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 09:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710494543; cv=none; b=LfDmwvAh8wNnfNMdCw3nuYamtnH6vA1IvCXK34ho7MYzQkt6pMTCOQ/1apN2xw2uFt5E4NUdH969Q9EUHe52msFEYh2ePyzAykSB0whUtpaQMT2Gyv2AwPtKQmnemwHVwR4rPsy9VN4F0MxGnpOBdvlJHtJu8WRcE2Rfg6o8hMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710494543; c=relaxed/simple;
	bh=rlp9w47SaDJPpkTUfCsb3Gjfncm/b3G6bzE7uBBiE5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SplH+0dOOyVIA1BpIVXNcC0xU0TXpWPfXXNHJ28SDmCcLwNBZ+lDB246Mp15uNKh24dlXCBkgFxiacIunilPM6V4Zbr2B0HnHmXSsjYWEdG6lX2GY4w5CVn/EeScRRl+KKpsBSUmE22dysW08Ra0iGz46K5j4rPFWomc3yt0Azg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HveHGjUu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710494542; x=1742030542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rlp9w47SaDJPpkTUfCsb3Gjfncm/b3G6bzE7uBBiE5c=;
  b=HveHGjUuTlRjZ/e93HugM6AMln8Kn9VyI1LqW3F577VWT5LML/6yFfFb
   lxo5flAfmOreH6V3lq1jPMEcMQUd2qWYh8vmlnGWDWjGHqeHBdmERjwnE
   wCg6Jilss9zTqFNIzeVDbvUcOlJ5kf/YtUqE6CbEPCrnfDsvI79J9YT7l
   sbACTN5U3Ww3d5fnX8Wp/W0sNguJQ85sGSNapKtO3aPI5okf0QlRh17WR
   6V4C3ugmkyjW/URqZG8U4jwwxvzQKnykVH9aQpuKTQAVzlDTqfTY/gNGh
   5Rld5V8WXD5r378MEX9zqh0jBhH+5G6nqboY5aqWWmF23yVgEVSy0rmFM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5219874"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5219874"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 02:22:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="12696900"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 02:22:14 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B9BE311F819;
	Fri, 15 Mar 2024 11:22:11 +0200 (EET)
Date: Fri, 15 Mar 2024 09:22:11 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: mchehab@kernel.org, benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v2] media: dt-bindings: st-vgxy61: relax data-lanes
 restriction
Message-ID: <ZfQTQ5U_iXEaKUjH@kekkonen.localdomain>
References: <20240315090345.1213957-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315090345.1213957-1-julien.massot@collabora.com>

Hi Julien,

On Fri, Mar 15, 2024 at 10:03:45AM +0100, Julien Massot wrote:
> The ST VGXY61 sensors support multiple lane numbers, as
> well as lane mapping.

Wow! This is the first time I see this on the sensor side. Should it be
separately mentioned?

The driver appears to be handling this already.

> ---
> Changes in v2:
> Add minimum/maximum items to restrict lane index to 1..4.
> ---
>  .../devicetree/bindings/media/i2c/st,st-vgxy61.yaml       | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> index 8c28848b226a..a76434ecf23a 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> @@ -67,11 +67,11 @@ properties:
>            data-lanes:
>              description:
>                CSI lanes to use
> +            minItems: 1
> +            maxItems: 4
>              items:
> -              - const: 1
> -              - const: 2
> -              - const: 3
> -              - const: 4
> +              minimum: 1
> +              maximum: 4
>  
>            remote-endpoint: true
>  

-- 
Regards,

Sakari Ailus

