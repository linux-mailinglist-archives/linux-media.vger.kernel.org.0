Return-Path: <linux-media+bounces-1078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD7B7F9D95
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 11:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB7101C20C7C
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 10:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E9818C3D;
	Mon, 27 Nov 2023 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtSStpWP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD8410F;
	Mon, 27 Nov 2023 02:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701081156; x=1732617156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6ZsD2/0d829tjp3/J12DPotTKkJoMGcOkrsxN0arhzI=;
  b=DtSStpWPcQc2nvraXNduvteZFFKUApl/MANmyYmtai3eiMOT0sPpFz+7
   sUTuVA1UE0wjxjZFLqOE6+wxDJV8Pxn/K1vfP38e+fQKYxIWJKtAl+Tw1
   YmqQEVWsZCFd9ASk60TqrDUT5iqKNZS9k6TDriIsUPmQZA4YF0aZK6Lms
   zWMwP45VX2fgizThtLiYYhw8ZbLLWvlid2hh3qlcysNvFX276N0IED8DV
   VgfeipUf0ILzY5Mx10OW/W/J3rWRUzPaasy9tPdFSC/cHVyijmt73wtJo
   wRfSiPgCUmbkrF56f8PkywyzJUvsH+MuaiiWcUQz7aiMXE8mhmBYKszv/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="377710262"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="377710262"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 02:32:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891693461"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="891693461"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 02:32:31 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C8A9711FCD0;
	Mon, 27 Nov 2023 12:32:28 +0200 (EET)
Date: Mon, 27 Nov 2023 10:32:28 +0000
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
Subject: Re: [PATCH v8 3/5] media: stm32-dcmipp: STM32 DCMIPP camera
 interface driver
Message-ID: <ZWRwPJQA_wNEVD8Y@kekkonen.localdomain>
References: <20231122073927.788810-1-alain.volmat@foss.st.com>
 <20231122073927.788810-4-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122073927.788810-4-alain.volmat@foss.st.com>

Hi Alain,

On Wed, Nov 22, 2023 at 08:39:17AM +0100, Alain Volmat wrote:
> From: Hugues Fruchet <hugues.fruchet@foss.st.com>
> 
> This V4L2 subdev driver enables Digital Camera Memory Interface
> Pixel Processor(DCMIPP) of STMicroelectronics STM32 SoC series.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

One more thing. I think you're missing all the link_validate ops, meaning
it's possible to start the hardware with invalid configuration.

Could you add them? It can be a separate patch. I'll postpone these until
that.

-- 
Regards,

Sakari Ailus

