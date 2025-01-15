Return-Path: <linux-media+bounces-24745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8BBA11B39
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 08:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8F3B188973C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 07:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F2B2309A1;
	Wed, 15 Jan 2025 07:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uNuxfDRm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1182E234981;
	Wed, 15 Jan 2025 07:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736927097; cv=none; b=tzyEhQvE+faL3bl6r2APXTyfuXv9p9vfZavWFIEQOSNY6xilnzQ0Cc0GWTufUv2qG7Ue6iDacFR2rrEKc9qX85me7VlLKXOJO+ZD4CRN0Tz6iLVtI6+CSOp8/1EX+2x/rjyb/NEEjUPuAVQY3ndE3DoIfeZqETVj4TtNpEAyxP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736927097; c=relaxed/simple;
	bh=yETivipjZoQl3+9ddCxsYwJYKzgChmUNksFU9RqqAB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sr0AK85FHFDFRfFYU7SGrZQ4FG3KmQik8pQtx0s/WS8kytszxo4vwtth3r+fUWnL4bhy6It0W85JlT63p0GTKihUtinVHDFx57edW956K3OKumfnedBiY9vh8QRJBMhLJoR0EkcANtC28mWpPNb/ZU9c4LcdyKIz2Vru9UWQLKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uNuxfDRm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32A9122E;
	Wed, 15 Jan 2025 08:43:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736927034;
	bh=yETivipjZoQl3+9ddCxsYwJYKzgChmUNksFU9RqqAB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uNuxfDRmOPBjyAOvf4yr6K8TZRLpj6sW6NfzjpQqtkAwtFWXh34V35SdW4db9h/sT
	 ZvlEqeaZWuQ1EK7Z4ryWIiWa22f2mJsoCUFZJh2dxOaG1owH7pLZwggbSsWv4PZBcc
	 metRlwVfirBenHOVjI5l4Muxa2bwv8MtSwaTIZVA=
Date: Wed, 15 Jan 2025 09:44:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Sean Young <sean@mess.org>, Olli Salonen <olli.salonen@iki.fi>,
	Abylay Ospan <aospan@amazon.com>, Jemma Denson <jdenson@gmail.com>,
	Patrick Boettcher <patrick.boettcher@posteo.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Tim Harvey <tharvey@gateworks.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] media: platform: Use str_enable_disable-like helpers
Message-ID: <20250115074446.GE29541@pendragon.ideasonboard.com>
References: <20250114-str-enable-disable-media-v1-0-9316270aa65f@linaro.org>
 <20250114-str-enable-disable-media-v1-5-9316270aa65f@linaro.org>
 <20250114204240.GA29414@pendragon.ideasonboard.com>
 <4c79c0e4-dbe9-4f4e-8b2a-a5cf58d49a7c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c79c0e4-dbe9-4f4e-8b2a-a5cf58d49a7c@linaro.org>

On Tue, Jan 14, 2025 at 10:06:15PM +0100, Krzysztof Kozlowski wrote:
> On 14/01/2025 21:42, Laurent Pinchart wrote:
> > Hi Krzysztof,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Jan 14, 2025 at 08:46:21PM +0100, Krzysztof Kozlowski wrote:
> >> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> >> from string_choices.h because:
> >> 1. Simple function call with one argument is easier to read.  Ternary
> >>    operator has three arguments and with wrapping might lead to quite
> >>    long code.
> > 
> > It's more difficult to read for me.
> 
> That's obviously subjective, but I am surprised that such stuff is
> readable for you:
> 
> data & XCSI_DLXINFR_SOTERR ? "true" : "false",
> video->hq_mode ? "on" : "off", video->jpeg_hq_quality);
> 
> or from PCI parts of this set, note that's ternary is split here:
> 
> 	dstat & BT848_DSTATUS_HLOC
> 	? "yes" : "no");

That's likely due to being used to reading those constructs, and is
certainly subjective. I can't tell what option would objectively be
best, but I have a feeling there's actually no objective best.

> >> 2. Is slightly shorter thus also easier to read.
> >> 3. It brings uniformity in the text - same string.
> >> 4. Allows deduping by the linker, which results in a smaller binary
> >>    file.
> > 
> > I don't see why the linker can't de-dup string in the current code.
> > 
> > I'm sorry, I just don't see the point in doing this. I'd like to avoid
> > those changes in the Linux media subsystem, or at the very least in
> > drivers I maintain.
> 
> Ack.

-- 
Regards,

Laurent Pinchart

