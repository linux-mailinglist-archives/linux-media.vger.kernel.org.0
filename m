Return-Path: <linux-media+bounces-18627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D51987255
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 13:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 810171C24CAE
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 11:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98471AE84F;
	Thu, 26 Sep 2024 11:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HnWWDKQD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52181A42D3
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 11:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727348843; cv=none; b=Yd2l+0A2eyn+wf/SaYrIwopAwcuvfwhGFAzG988dhfJ/Dw9foh8CJXSwVz37Y+lf1hrtQescOI9cJ3lvrSA0CLtAMyAtgserndStboxLnkn3F+E9gl+9V/ryS3OoGj3Vtgxm8X1aqZTCIk3g9iMzkarWRy9/H7M3Dr5wDwi0mBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727348843; c=relaxed/simple;
	bh=urmfNhw4Y6IT53N/NfCaF31cBUcnQE54JsIQX+33WHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7pj2mi8I38i20xcnCoQ/qv2haa9kHqrZ66dTv2bk06DFIjYjSoZaC/vOuN4IT2EEXH+T1B12Rq19Hc6G778nDRn/opCcrv5u2bVfrLFSH5C/s6AYqtPzzuotFsCjCixynHSz3Ajc1grLBxJhAg3FGaYVXVvGzTpWs4lZ9bbdvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HnWWDKQD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84D758D4;
	Thu, 26 Sep 2024 13:05:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727348751;
	bh=urmfNhw4Y6IT53N/NfCaF31cBUcnQE54JsIQX+33WHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HnWWDKQDqLh3zJJ/Sr8crBGCiu13nlMOcHa+tydukAynYlIgv00ModPydMG/bvDOx
	 HBiPY4UtxT2rkqVc9mGNfo4E+CDvtwEM8kychLew6+m1vvMa6QwLr19rXz+DR+/a8J
	 vExlZ5YNW4eRZ3GHWGbNK/rH3AyizDQB1OCOC7jA=
Date: Thu, 26 Sep 2024 14:07:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <20240926110717.GF21788@pendragon.ideasonboard.com>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
 <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan>
 <20240925195843.GK30399@pendragon.ideasonboard.com>
 <902b2828-5eb8-4741-90af-8e42f1240e86@xs4all.nl>
 <ZvUpuopPY8lwBHEm@kekkonen.localdomain>
 <20240926121914.69b47a50@foz.lan>
 <20240926102448.GA21788@pendragon.ideasonboard.com>
 <20240926125358.4edf0f9a@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240926125358.4edf0f9a@foz.lan>

On Thu, Sep 26, 2024 at 12:53:58PM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 26 Sep 2024 13:24:48 +0300 Laurent Pinchart escreveu:
> 
> > On Thu, Sep 26, 2024 at 12:19:14PM +0200, Mauro Carvalho Chehab wrote:
> > > Em Thu, 26 Sep 2024 09:30:34 +0000 Sakari Ailus escreveu:
> > >   
> 
> > > Yet, even if the committer did an honest handling of the patch, you may 
> > > still disagree or want some changes at the original patch. On such cases, 
> > > the maintainers may decide to drop the changes and do a normal review
> > > process. They may otherwise request a patch on the top of the applied
> > > one to address the pointed issues.  
> > 
> > Let's do a revert in that case, and keep rebases for cases where having
> > content in the git history causes issues other than bisection problems.
> 
> Rebasing or not is a subsystem maintainers decision.

The job of a maintainer is to make their subsystem thrive. The power of
making decisions comes with the responsibility of cattering for the
needs of the community. In this case, I think the community wants to
avoid rebases as much as possible. Let's work together on avoiding them
by improving whatever processes need to be improved.

> Reverting pollutes
> git history upstream, and it should be done in cases were we want to 
> preserve the history upstream. On cases where the preserving the history 
> doesn't matter, a rebase is better.
> 
> There is also a bad side effect of doing:
> 
> - patch 1: some fixes with c/c stable + fixes tag
> - patch 2: revert patch 1
> - patch 3: apply patch 1 on a different way
> 
> Even with just 3 patches, this can get messy when backporting to fixes,
> as we don't want all three patches backported. We want just patch 3.
> 
> There are also cases like:
> 
> - patch 1: some fixes with c/c stable + fixes tag
> - patch 2: revert patch 1
> - patch 3: a patch needed by patch 1 to not break compilation
> - patch 4: re-apply patch 1
> 
> in this case, patch 3 (or a variant of it) may or may not needed
> to be in fixes.
> 
> This becomes even more complex if there is a pile of patches with
> some with c/c stable and some without. 

We're talking about rare cases here. Let's focus the process on avoiding
rebases. If you think a rebase is needed at some point, let's discuss it
and find consensus.

> I saw already enough badly solved merge conflicts risen on different
> trees because one change was reverted and then applied back with
> about the same content. 

-- 
Regards,

Laurent Pinchart

