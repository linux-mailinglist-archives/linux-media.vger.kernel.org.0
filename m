Return-Path: <linux-media+bounces-24744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 982FFA11B11
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 08:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4077A3A58E1
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 07:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37C522F85A;
	Wed, 15 Jan 2025 07:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Av9gfyJi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B1722F3B3;
	Wed, 15 Jan 2025 07:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736926752; cv=none; b=dC2pW32MgEkWOy/VNrXtJR6+r4QajkBde50qvmSdKL/1v2Z2yxOzITwODg8cM3c2xJ5hHF39H7GGGB2qIGM5xAzmxSlLtIJ9VIILmJCdtILMeaipwjPD02WQy7g0U83cMA0UgvGuiOB6IrnenKAy0++9mDoeERUq41LuwjV/zFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736926752; c=relaxed/simple;
	bh=DPY/roXzZjdAZ6YP3yf0lbpZsr8gCT9vKa98hBD5uwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwgGhkRhAVc4QoCRCYb1kpWdkEUVHA6LVk23ess6h7Hp5X0PM6GtErAuLOqqFphp2aKwDtSkBIsU6I9LrghAkM1BNiTUnnEJwnM0Vf+VoHrvm4ceSKq9LRwjL+RZu67YuEaNJUSlhrqhS2Z1xtoyCfI6Wms9aW4vk+EEy7XKfRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Av9gfyJi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736926751; x=1768462751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DPY/roXzZjdAZ6YP3yf0lbpZsr8gCT9vKa98hBD5uwg=;
  b=Av9gfyJiHp1TIlgQC2DlsO9TXPCuF6BnabvDk5Y3yyYT9gd4C8dXPW2m
   Xv+JaRhPbUCYTpjREvny7iyrOY6GPt8MetwUjZ/dOXDeYKCPZlmqYa/0f
   ysVktMLERYfo5K9PgAnImWUy7bFoyjH6DxiYA978vR7arQIdeY0WkN4zj
   PHAQKZwQzASjmB41+FDEt5OuxGaqQzatAIxHOZuOd2wMLQ5sTjl2vK8s0
   ACnPgrmMQ16YHWnGZxkkIE39WbruOpUt0EgfMliqZpvqCC9AUdxwUMAmW
   6eyDdnkpXEsoe/7SmImiNkjIRNVds9BxwQ3FHqVlfxVLf8MJwUNS5fYpg
   A==;
X-CSE-ConnectionGUID: BWRGS3N+SdWTKjLcjtNNwA==
X-CSE-MsgGUID: cReyFx5OTkazWlB6wiUBww==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="47912542"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="47912542"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 23:39:10 -0800
X-CSE-ConnectionGUID: UMqyZiuzSv66AB1ay369mQ==
X-CSE-MsgGUID: sZIatDy8SuiT+/3BDPcNSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="105585032"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 23:39:05 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D1E3711F8B3;
	Wed, 15 Jan 2025 09:39:02 +0200 (EET)
Date: Wed, 15 Jan 2025 07:39:02 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Sean Young <sean@mess.org>, Olli Salonen <olli.salonen@iki.fi>,
	Abylay Ospan <aospan@amazon.com>, Jemma Denson <jdenson@gmail.com>,
	Patrick Boettcher <patrick.boettcher@posteo.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Tim Harvey <tharvey@gateworks.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] media: platform: Use str_enable_disable-like helpers
Message-ID: <Z4dmFlJ_0hugX2rY@kekkonen.localdomain>
References: <20250114-str-enable-disable-media-v1-0-9316270aa65f@linaro.org>
 <20250114-str-enable-disable-media-v1-5-9316270aa65f@linaro.org>
 <20250114204240.GA29414@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114204240.GA29414@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Jan 14, 2025 at 10:42:40PM +0200, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> Thank you for the patch.
> 
> On Tue, Jan 14, 2025 at 08:46:21PM +0100, Krzysztof Kozlowski wrote:
> > Replace ternary (condition ? "enable" : "disable") syntax with helpers
> > from string_choices.h because:
> > 1. Simple function call with one argument is easier to read.  Ternary
> >    operator has three arguments and with wrapping might lead to quite
> >    long code.
> 
> It's more difficult to read for me.

I don't have any issue in using the ternary operator either. Using these
helpers makes the lines generally 3 characters shorter.

> 
> > 2. Is slightly shorter thus also easier to read.
> > 3. It brings uniformity in the text - same string.
> > 4. Allows deduping by the linker, which results in a smaller binary
> >    file.
> 
> I don't see why the linker can't de-dup string in the current code.

In fact the functions are static inline so from that point of view I don't
think there's any difference.

> 
> I'm sorry, I just don't see the point in doing this. I'd like to avoid
> those changes in the Linux media subsystem, or at the very least in
> drivers I maintain.

I don't have much of an opinion, perhaps I slightly prefer using these as
the rest of the kernel does, too. Yet if we choose not to use these
helpers, we continue to be occasional targets of largish patchsets "fixing"
this.

-- 
Kind regards,

Sakari Ailus

