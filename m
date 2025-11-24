Return-Path: <linux-media+bounces-47671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 270F0C8223C
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 19:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4D703A552E
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 18:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C19E31A815;
	Mon, 24 Nov 2025 18:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDhmOFds"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13C931A04F;
	Mon, 24 Nov 2025 18:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764009885; cv=none; b=XSAhronkdm0IY+LkuyXjvHmj/JPJCPE6l+xRhte4pQuv/0bj1HB4ZCGFg+ec7ZePgH4nEMoFB9fuA78libLymnwoV3piK7S9/sx55+VGrG7kiffEpkTAdh+DZStX9cHZNKlbiwS8n+Yap2lGcpuGLMhwys4DxTfe7EDkR3dCGUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764009885; c=relaxed/simple;
	bh=UV9pWUzCW+NAMLyodNz/c2YEyHOWyS4QJyt6A+EDrkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFXr2NSLfLKyUV6BEMtVuEDfMh2cp382VJBOFMxbocCyd/0beIgq+lxcqv3kqDfBlCL4zjdeEN1y1VJsOODFeOBV47Bp4XyptJJYumSyq2fN++gAgC0Nzor9pBKUmmwZ1Z7yOL/XkJAXLRA13w3xrKYpGSKp8P5R67O3zEXVqKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDhmOFds; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C930BC4CEF1;
	Mon, 24 Nov 2025 18:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764009885;
	bh=UV9pWUzCW+NAMLyodNz/c2YEyHOWyS4QJyt6A+EDrkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NDhmOFds2UnaaXvrVxIQsVYa+nM6JJUJeQ4MmOxS/eZT2X4iL4grbq20h1E/dbRYU
	 YWVffEcqO7rAOlRLZo+RVBVsr9hfaol9pjKu2oYuW0kdq04d/hACBRwfV3G8nLCaNG
	 kYdIQxGCYZjP9f6oqnK6lSpv4WqdGmPQWsF0UHHHhi+DKlUfpAOrRv5/Hma405RvIM
	 PdzqsZqT6IkTFdvlbeof7WKpnkgxmysmBWqEZwNI9x7vKsr4Ol+VQEeZOSlDRGUE7n
	 0zSPCAx7Mpg9XPXDAarlRSd0FxsVeEnPbTKEVNbFonGgwkmwyDrKWPbtuCXblPWqpE
	 I0ltM8w08VmxA==
Date: Mon, 24 Nov 2025 11:44:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>, linux-media@vger.kernel.org
Subject: Re: drivers/media/i2c/ccs/ccs.o: error: objtool:
 ccs_set_selection(): unexpected end of section .text.ccs_set_selection
Message-ID: <20251124184441.GB1084995@ax162>
References: <aSEGwejeD3f7lnUL@rli9-mobl>
 <20251122013414.GA3094872@ax162>
 <ahukd6b3wonye3zgtptvwzvrxldcruazs2exfvll6etjhmcxyj@vq3eh6pd375b>
 <20251122062946.GA3054484@ax162>
 <aSOKsu3XjLc9GRM-@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSOKsu3XjLc9GRM-@kekkonen.localdomain>

Hi Sakari,

On Mon, Nov 24, 2025 at 12:29:06AM +0200, Sakari Ailus wrote:
> Thanks for cc'ing me.
> 
> I prefer this as there's no guarantee the value read via ccs_get_limit()
> would be non-zero. Presumably it is (and has been so far as no-one has hit
> this to my knowledge), but we shouldn't rely on that.

Ah, that makes sense. I misread some of the other places I thought were
using the value of CCS_LIM() as a divisor, guess I forgot my elementary
order of operations :) This appears to be the only overt one that I can
see.

> I can post a patch as well.

If you have time, that would be great (I am happy to build test and
review it). Otherwise, I can get to it soon.

Cheers,
Nathan

