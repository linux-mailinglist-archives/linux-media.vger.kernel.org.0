Return-Path: <linux-media+bounces-45766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C501DC13BE4
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 891E8500CD1
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0142DCF47;
	Tue, 28 Oct 2025 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Y5Thuq/O"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07752D8782
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 09:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642623; cv=none; b=pgccdDoAnXStLxeYT2uKExqt47T/BJD1qA3sjaLsUKb0+ekIf3ykagXDO99R5rbly8kZyon2ddCOfeZa42n5pENyoz684StSgrlzS78FWd06lYXgPO643SbiWLjEiL3GiKVTInA2up1fOa0uq/5EHOG+F5sodyL2/rF31Z0W6Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642623; c=relaxed/simple;
	bh=5zfnTdS04d8KQXLubWipi8iI0JTdE0qcA4DI/46xMcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3skyXq410MV01cLu5FiueXMDgk5qUtszKvQtRezLZVV0kPyqyTvqGJztpg1A25PuHFelFx2as7ACw73Nb3NFLQrtNAeg7mcSyj7FhoG3iE6Y8NocUOrEhm9gJyU5h4wskGFzTtsT3RXK0fr8thqNDvZw4KCCYM0xshZC9CCcME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Y5Thuq/O; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1761642618; bh=5zfnTdS04d8KQXLubWipi8iI0JTdE0qcA4DI/46xMcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y5Thuq/OfotSHMpMWkDpM/TAlKX7bqNv5igtT6CqbRK15C7q9PrNbpNRC6dxhmrzq
	 7xiftlIW8/VEWv+vqvP1YaSYLm6zoj2+hs7G0LjAz+81iF4ZAxyERQ1ZdaFuokG21J
	 pedYg5FFxOcWy7fLF998C6JmrFTmuCkH6BkZrkt/gSR3QdGgQs5AbDT+Qvavmf5irf
	 9unLHUdUSrTxOXLi4gAHvl0ZeWPVME4kc2+oyWhtFtbqJY5UGBurbo27L1PJcRlbkp
	 DeCaRbBQIoBzrEJLMsz2v4BoRGUpY0Y3SgrXwYt8HlsK+ofXB34cs1D4DFFZoIFOgu
	 4kBMsOZQ4uVGw==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id BB96A1003DC; Tue, 28 Oct 2025 09:10:18 +0000 (GMT)
Date: Tue, 28 Oct 2025 09:10:18 +0000
From: Sean Young <sean@mess.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCHv6 1/3] docs: media: update maintainer-entry-profile for
 multi-committers
Message-ID: <aQCIenbyRXm1e6J6@gofer.mess.org>
References: <cover.1761571713.git.hverkuil+cisco@kernel.org>
 <1495ec4ccdcdfab788fa9d02e11a6028a455e31b.1761571713.git.hverkuil+cisco@kernel.org>
 <aP_s8D35617s6JWU@gofer.mess.org>
 <8bc5196e-9a40-44da-941b-f5f42608c74f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bc5196e-9a40-44da-941b-f5f42608c74f@kernel.org>

On Tue, Oct 28, 2025 at 09:25:29AM +0100, Hans Verkuil wrote:
> On 27/10/2025 23:06, Sean Young wrote:
> > On Mon, Oct 27, 2025 at 02:28:31PM +0100, Hans Verkuil wrote:
> >> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >>
> >> As the media subsystem will experiment with a multi-committers model,
> >> update the Maintainer's entry profile to the new rules.
> >>
> >> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> >> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> > 
> > I've read it and I only have some tiny nits, looks great.
> 
> Thank you!
> 
> > 
> > Reviewed-by: Sean Young <sean@mess.org>
> > 
> 
> <snip>
> 
> >> +It could be wise to also copy the Media Maintainer(s). You should use
> >> +``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
> >> +Please always copy driver's authors and maintainers.
> > 
> > git config for using scripts/get_maintainers.pl is useful
> I'm not sure I understand what you meant with this.

I should have been more specific. I use this in my .gitconfig:

[sendemail]
	tocmd ="scripts/get_maintainer.pl --no-git --no-git-fallback --no-l --no-roles --no-rolestats"
	cccmd ="scripts/get_maintainer.pl --no-git --no-git-fallback --no-m --no-roles --no-rolestats"

I find this very handy, I thought everyone was using this (possibly not).


Sean

