Return-Path: <linux-media+bounces-36265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1769AED981
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 12:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6473F3B61CD
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 10:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3241C2571B3;
	Mon, 30 Jun 2025 10:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BINAZAF0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA2D255F49;
	Mon, 30 Jun 2025 10:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278341; cv=none; b=MYCNbMRDxgCW9cB4NBj2/ffpO22hUqvr+7lLhsFaC6c/eVDkWDRkDySDspZiY3oESRxJ1eDzPpsQRsd5odCry9hnVH9+MnXmylq+SC1jHf/bCBqLrW4sOikd1PRY1C3zVacmEnCltk+yHs/awbNkFeyOtr2Lahsyb7m2O63oK+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278341; c=relaxed/simple;
	bh=RSFqeREWgaM1aQE7KXoh84joxLzArgDp6V+nuYoB4AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNiLXKYpSCxRj+mC7hbmNMF4sfrIBdoZg96KfTF0d2Y1vTCGnU1DeVhsnLgb7C7T4oD45558qcINPqj5btnHOcda4v+CxC5ltLik+KNj65hMZySc7iV0NTGcxJAtAP8C0NU5qVjYqPbKnelcUCNF0rUa3vSteL2UpHID61TtSkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BINAZAF0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751278340; x=1782814340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RSFqeREWgaM1aQE7KXoh84joxLzArgDp6V+nuYoB4AA=;
  b=BINAZAF0YSxJoja4e7XapEDesdgMZZ8NYGghcApsAhPTnEtWUr6OU10n
   mbD8s3bsQu6Lxux8yoo6sMjAHb1CTAWNXOOIMd1T7nsiVTBYNo/6sn69A
   dxxCg8lGagKsziv6ayeUk1KRYSjunCYpYaQCNab6848A78hy3ELdhYP1i
   LoTu4AbqQN+ADJovTf8OCF4z5uB4nQ8q3NFEHh4Pd4sMMN2bD8OdlPUFh
   P8aQvMqmvNTsbLTuo4OttNHkivPUL5IX1/nDqDNsktlmQgTJXIleXsJRV
   WVM+S/cZTzpmC18IaFUXpT/saQWFdojyEuT826H72yQEGQxxBxQ/UVp9M
   w==;
X-CSE-ConnectionGUID: CM2uqXK+TcmPTWvRO0ZquQ==
X-CSE-MsgGUID: mNgjO/Y2Q7adBdWUBxeYjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53605054"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53605054"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:12:19 -0700
X-CSE-ConnectionGUID: qXo6RfMHT5i7Utb66m+o9Q==
X-CSE-MsgGUID: nusOzH+dSHmhDzdZ+uAtcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="158927306"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.127])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:12:14 -0700
Date: Mon, 30 Jun 2025 12:12:04 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Markus Elfring <Markus.Elfring@web.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v9 06/13] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <wi7ccmxg3gmqw7j5khl2hxrhht4iw2i6u3bozeb4smo6eg4ppg@md6yjasbbzi6>
References: <20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com>
 <20240220-rk3568-vicap-v9-6-ace1e5cc4a82@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v9-6-ace1e5cc4a82@collabora.com>

Hello Michael,

I think this is the last missing detail :) The series looks good! Thank you
for the all the work!


On Wed, Jun 18, 2025 at 05:38:01PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>

[...]

> +static void rkcif_stream_stop_streaming(struct vb2_queue *queue)
> +{
> +	struct rkcif_stream *stream = queue->drv_priv;
> +	struct rkcif_device *rkcif = stream->rkcif;
> +	u64 mask;
> +	int ret;
> +
> +	mask = BIT_ULL(stream->id);
> +	v4l2_subdev_disable_streams(&stream->interface->sd, RKCIF_IF_PAD_SRC,
> +				    mask);
> +
> +	stream->stopping = true;
> +	ret = wait_event_timeout(stream->wq_stopped, !stream->stopping,
> +				 msecs_to_jiffies(1000));

Checking for stream->stopping is TRUE then waking up wq_stopped
wait_queue is being handled in rkcif_dvp_isr().

It is not the case of rkcif_mipi_isr() so we are always waiting for the
timeout when stopping the stream with the mipi interface.

> +
> +	if (!ret && stream->stop_streaming)
> +		stream->stop_streaming(stream);
> +
> +	pm_runtime_put(rkcif->dev);
> +
> +	rkcif_stream_return_all_buffers(stream, VB2_BUF_STATE_ERROR);
> +
> +	video_device_pipeline_stop(&stream->vdev);
> +}

--
Kind Regards
Mehdi Djait

