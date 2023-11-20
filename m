Return-Path: <linux-media+bounces-630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4D7F1EA2
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 22:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 290F51F262B2
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 21:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FFD374DC;
	Mon, 20 Nov 2023 21:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYWHvejA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70BB3C4;
	Mon, 20 Nov 2023 13:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700515128; x=1732051128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xYtfmY3EVWUKUBltmFEPvtVvDbJhLP5vaAHjt99/IKw=;
  b=HYWHvejAYsV4atKsHgJNalI0chJRRNs4nr51JtduVgoFnUFWl8zq3QtZ
   5aR4hQbQhRbX2Lt/RsZG7PL0Q/9JAsVs1EL8T54ldteSzu+1y6REE6Q8p
   ADmSz1dneJcPPUQzWOEoPLKcxJb1QpoxtMgJjb6j8vBKMZGZrJrdWfvTy
   LNnqXQ/1VdTrhM4A6jmB4/cA/CdAovAO0u18LY0qySFykLrhbTbLf6h72
   2E0R4/92GAEdDJfGoagSWClr0E+W5fUGPCtzcxI8qdcPDTts5484gFHko
   JgrzM6r7GuisLAMXn1++sK5jZ9Ku2LDc24AWNtbHTGYm9yEwbMns0d3iR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="388860353"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="388860353"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 13:18:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="716329079"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="716329079"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 13:18:42 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 423A911FAC4;
	Mon, 20 Nov 2023 23:18:40 +0200 (EET)
Date: Mon, 20 Nov 2023 21:18:40 +0000
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
Subject: Re: [PATCH v7 0/5] Add support for DCMIPP camera interface of
 STMicroelectronics STM32 SoC series
Message-ID: <ZVvNMPfW7OhPByZk@kekkonen.localdomain>
References: <20231120170809.728941-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120170809.728941-1-alain.volmat@foss.st.com>

Hi Alain,

On Mon, Nov 20, 2023 at 06:07:56PM +0100, Alain Volmat wrote:
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
> 
> v7:
>   - correct byteproc set_fmt handling and compose/crop/fmt handling
>   - replace few v4l2_subdev_get_try_* into v4l2_subdev_get_pad_*

Can you rebase this on my my linuxtv.org tree master branch
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/>?

These will be called v4l2_subdev_state_get_* now.

Thanks.

-- 
Regards,

Sakari Ailus

