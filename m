Return-Path: <linux-media+bounces-20523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD13C9B492B
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 13:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64E581F23BA0
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 12:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EFC205ADE;
	Tue, 29 Oct 2024 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fWsys7nt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C96188CDC;
	Tue, 29 Oct 2024 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730203849; cv=none; b=UPnuPzP1n730oxXM6qDNFluKLmB6HvRzLX9IZFEdCxpq79i6jRRJBRqsXWMA2JAARoAQO3yFXuNyK0DiDK2ukpMjhTG05v/ica9r7Zw0sRaaOnHNOXHqVeZLhxE3QItVW4Fuu2xXWBRqeSaEoudI1owPOp+II7vaFzVWPB4x99U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730203849; c=relaxed/simple;
	bh=3QkexQixL7eVxLYiqNDcKJZUluEyHaHeQ04J4WlbObE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIkd0+81Ucvv7zc/jEMdxnGrYwP9dIZFZTqfn9OFvtBeSi/W1qRfSLYSt8UgoXFrVEnqADpMv/zo1OUPPS3VwAkSbSw8FdVKMjSZ/xSBk5z/1W7gxbUbuNTZHpF/Aihzu2NXsSAmQuFgtUFArgTQU8iyDyAvCXUgWd6adWGc8IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fWsys7nt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 058984D4;
	Tue, 29 Oct 2024 13:10:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730203843;
	bh=3QkexQixL7eVxLYiqNDcKJZUluEyHaHeQ04J4WlbObE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fWsys7ntz+RayOfJfMRmdH2qf+qFqRFVL4eD3/WLevCOIDlSOd04XYxDWWMfMYzhE
	 NahnA43zWm4VU8X7IYSel0+UO+4YpGeQtbNB3HsZrnOcziQdMVjbzN7CccV7Fg8PvS
	 4zA9ig76+o25UpqK8u7AS6RZ2lW+CZGwomKMVPgE=
Date: Tue, 29 Oct 2024 14:10:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	laurentiu.palcu@nxp.com, robert.chiras@nxp.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com, dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com, alain.volmat@foss.st.com,
	julien.vuillaumier@nxp.com, alice.yuan@nxp.com
Subject: Re: [PATCH 1/5] dt-bindings: media: i2c: Add bindings for OX05B1S
 sensor driver
Message-ID: <20241029121039.GM22600@pendragon.ideasonboard.com>
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
 <20241028190628.257249-2-mirela.rabulea@nxp.com>
 <216a2728-ab62-4b76-aca5-8d911687dfbe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <216a2728-ab62-4b76-aca5-8d911687dfbe@kernel.org>

On Tue, Oct 29, 2024 at 07:14:28AM +0100, Krzysztof Kozlowski wrote:
> On 28/10/2024 20:06, Mirela Rabulea wrote:
> > Add bindings for OX05B1S sensor driver
> > 
> > Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
> </form letter>
> 
> Binding also looks very different than all other devices, so re-write it
> starting from EXISTING GOOD bindings. Not some downstream stuff.

Krzysztof, please point to a good example when making this kind of
comment.

> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> A nit, subject: drop second/last "driver". Bindings are for hardware,
> not drivers.

-- 
Regards,

Laurent Pinchart

