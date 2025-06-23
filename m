Return-Path: <linux-media+bounces-35570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D110AE363C
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4236170FD0
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 06:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4131EEA28;
	Mon, 23 Jun 2025 06:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1dH1yPc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8036A45948;
	Mon, 23 Jun 2025 06:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750661451; cv=none; b=OoFNwgMSRjAPNVD2RQPFhGBLOklCoM+f31UO1GBYNMycFx98WOYuwHvCBH2my/Hyu6Ri6STmxwpRVsDfFlZjZ50q6CtUwEBt6o2Qaafu1NcHuo1lff5MxjgiuVnc4twGXcvYe7d2qJ2TGlA1hw0NVvmj7SqRKQIJeMQh/OJdhCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750661451; c=relaxed/simple;
	bh=ID0tYhe+3AnmdvyD6ijER8q96Dh67gLD5peP97R3a94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyC6cwswDd0ofniTa8cUOAAWQQ3y1AA6v7VhXn1ApxHdfRdelVPXebGGt/S+sS5m7WvvFjsBM/O8c8uF4cuC2GCpbs92sUZAeCpdiygoo/f0GOGq5i0okCKFoBBC1QNoe7UxkfIEXyJ84N4+MCE52BSNHvU0phuXZqKVsiL6kiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1dH1yPc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750661450; x=1782197450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ID0tYhe+3AnmdvyD6ijER8q96Dh67gLD5peP97R3a94=;
  b=B1dH1yPco738zrd9MAEzeSUD9mL8q8uOo1QLJRskVyss7XvkSxcji/4t
   6l697NfCmd87hVLGlRbgzAQePo88EyuBnsGGyrvwvKrm4jueENmOn7Owy
   R5zM4se99i3VYmNIGKeLsJh2vpff/njbAVEDNF9/yOUODTxl3BoRnnKFL
   zI/4cuejSicsIF5JS/B5k4Fam1hW6G1A5TJqI//FMha+fOHBICqo5qPk/
   0jXjFRcXB7OuymiAKDxtwrAUjAHkx21/dJmHekm29IeAwBI7Kmicuwmvb
   hhl/94jUn4yh5H5SMUzPEBukKysyfDGRaSx66BYCKPlbeaWRuLqmRNgPa
   Q==;
X-CSE-ConnectionGUID: JO1JKzhFRA6z93vMGusZGw==
X-CSE-MsgGUID: +eSUjNMIS1aM3ML97Ncfyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52987255"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52987255"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:50:50 -0700
X-CSE-ConnectionGUID: 8+RVV+lORPq9cNr/+qIs5g==
X-CSE-MsgGUID: i4cX/fd5SYK6vhXNVZNv/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152184805"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:50:45 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EEE3D11FC36;
	Mon, 23 Jun 2025 09:50:42 +0300 (EEST)
Date: Mon, 23 Jun 2025 06:50:42 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND v4 0/5] media: i2c: imx214: Add support for more
 clock frequencies
Message-ID: <aFj5QnPBO0We5SBQ@kekkonen.localdomain>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>

Hi André,

On Sat, Jun 21, 2025 at 11:37:24AM +0200, André Apitzsch via B4 Relay wrote:
> The imx214 driver currently supports only a 24 MHz external clock. But
> there are devices, like Qualcomm-MSM8916-based phones, which cannot
> provide this frequency. To make the sensor usable by those devices, add
> support for additional clock frequencies.
> 
> This series supersedes
> https://lore.kernel.org/linux-media/20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu/

Is there a difference in this set from the v4 you posted previously?

> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
> Changes in v4:
> - Add missing colon to error message
> - Add A-b, R-b tags
> - Link to v3: https://lore.kernel.org/r/20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu
> 
> Changes in v3:
> - Limit range of pll_ip_clk_freq_hz (Sakari)
> - Drop unneeded 'ret'
> - Use pll.pixel_rate_csi for bit rate calculation
> - Add patch that deprecates the clock-frequency property
> - Link to v2: https://lore.kernel.org/r/20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu
> 
> Changes in v2:
> - Add A-b tags
> - Switch to v4l2_ctrl_s_ctrl_int64() to acquire the control handler mutex
> - Add error handling for v4l2_ctrl_s_ctrl_int64() and
>   imx214_pll_update()
> - Replace "read clock frequency from dt" patch by "remove hard-coded
>   external clock frequency" patch
> - Link to v1:
>   https://lore.kernel.org/r/20250415-imx214_ccs_pll-v1-0-d3d7748e5fbd@apitzsch.eu
> 
> ---
> André Apitzsch (5):
>       media: i2c: imx214: Reorder imx214_parse_fwnode call
>       media: i2c: imx214: Prepare for variable clock frequency
>       media: i2c: imx214: Make use of CCS PLL calculator
>       media: dt-bindings: sony,imx214: Deprecate property clock-frequency
>       media: i2c: imx214: Remove hard-coded external clock frequency
> 
>  .../devicetree/bindings/media/i2c/sony,imx214.yaml |  29 ++-
>  drivers/media/i2c/Kconfig                          |   1 +
>  drivers/media/i2c/imx214.c                         | 263 ++++++++++++++++-----
>  3 files changed, 217 insertions(+), 76 deletions(-)
> ---
> base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
> change-id: 20250406-imx214_ccs_pll-e4aed0e9e532
> 
> Best regards,

-- 
Regards,

Sakari Ailus

