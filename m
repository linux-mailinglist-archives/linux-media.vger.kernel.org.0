Return-Path: <linux-media+bounces-1080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEEF7F9DE0
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 11:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81E5F1C20D29
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 10:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974D818B16;
	Mon, 27 Nov 2023 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ct4hLl3j"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7C318A;
	Mon, 27 Nov 2023 02:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701081830; x=1732617830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AH0RtqoF4KI3vHwA85rjVB2jP494O9yweQmmJkW6BU0=;
  b=ct4hLl3j+JuPjJy7DrHOwAmMqarJ0YIH4BVytBupZ1a9+3fKEWdt8Y7A
   sjnnlvPCTW/GFim+/1wY7ulw34ZQQCSe9z3a3ipY445oma6fHNc73ljSl
   1HFNdcDzdEUWWAgcRYrHA13LAHsd+qSRvy4LX98nCpwvPvVyKKzzFm5G7
   ka4DR8kqeb75qfcxQ5eWuggeVi+JY9ByQb8tXocqCrQl8qkaHMUyqnA4W
   ReCmGITSh//PGHpgKhQ0TKHPsnYgpXQCKHGQMB7lySx0T88I0O4wgRjHT
   G7PGMp2lUnUhqtHXqZZc1KsMGz3jam60Z4CN4D/uY2xed+eAYT3tA9DDb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="389825252"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="389825252"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 02:43:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="838661037"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="838661037"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 02:43:46 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 77F4511FCD0;
	Mon, 27 Nov 2023 12:33:15 +0200 (EET)
Date: Mon, 27 Nov 2023 10:33:15 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/5] Add support for DCMIPP camera interface of
 STMicroelectronics STM32 SoC series
Message-ID: <ZWRwa2ImfkZMI8Xz@kekkonen.localdomain>
References: <20231122073927.788810-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122073927.788810-1-alain.volmat@foss.st.com>

Hi Alain,

On Wed, Nov 22, 2023 at 08:39:14AM +0100, Alain Volmat wrote:
> This patchset introduces support for Digital Camera Memory Interface
> Pixel Processor (DCMIPP) of STMicroelectronics STM32 SoC series.
> 
> This initial support implements a single capture pipe
> allowing RGB565, YUV, Y, RAW8 and JPEG capture with
> frame skipping, prescaling and cropping.
> 
> DCMIPP is exposed through 3 subdevices:
> - dcmipp_dump_parallel: parallel interface handling
> - dcmipp_dump_postproc: frame skipping, prescaling and cropping control
> - dcmipp_dump_capture: video device capture node

The DTS changes will presumably be merged via a different tree, right?

-- 
Sakari Ailus

