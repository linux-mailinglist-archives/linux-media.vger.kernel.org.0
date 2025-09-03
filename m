Return-Path: <linux-media+bounces-41728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0BCB4291B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 20:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C226D1BC3A49
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 18:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42448369354;
	Wed,  3 Sep 2025 18:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSgy4D9h"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874A13680B9;
	Wed,  3 Sep 2025 18:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756925535; cv=none; b=A7PdiyMzd4KWrznYTGfnxNG5Wtkkm6D7I1hFOQHd46I6WFXj1kAJOkCq7kjt/h1OBWbvtU/UeTjl9KMUgobjSbb9ITytR3fAJNIcbUxVLRcwURnNaISO9UhRefeBQZylRTB7INAiEU/dvIlcNTOhqRBwkHLFwhukxFgoBBPEhQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756925535; c=relaxed/simple;
	bh=mhZwxZOfoGVVOKWYycNAVIy8/yJ/33jt/6HScs6WZfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+x6iHxGaC1jvqdk9iHDd60YV4tjG9Th9vS1cVFWEQ+89db9XRn8jnXsWDPl/FoH5jTpxv5TiCNncOL80og7xq8nxtMw+N8lXAdsTDC8jTdu9UcI3cp6dmpJvyqIqDoyJaAIhJu04eHKfF6zxQ5X3qgqLonQnIB/5qGobNC5Lto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSgy4D9h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24990C4CEE7;
	Wed,  3 Sep 2025 18:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756925534;
	bh=mhZwxZOfoGVVOKWYycNAVIy8/yJ/33jt/6HScs6WZfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSgy4D9hmmCtLtSAeX6slC444z205ObIwBdJMGVlOeF3w8ufwj8Wh05cu9sCD8VXh
	 9pcdIO+mOnCsGZk6kyU8eOBjyHRgNkxI7LRZHz83aKzW8TJahc2kxfoI59hcBzOTsL
	 aAEiMs0DWGog8q/wGt4BxYTJDhOgpNBgARmaohc/75wZIEUrcZyEym8z2bzTLeP5v4
	 FtvdUZyhryPDVZyPBX2Kuh9nCwSaQQpgWxbg8OWYMhd018uA6AUGNGw30o/+jHNK9S
	 XgN0OB8r9YQkH7alxz1c/PrFMulEj1fhHxLcAv/3VbhPgx1kLTXQyhjQaQPu82iAH3
	 ayBZSF1OPmkbQ==
Date: Wed, 3 Sep 2025 11:52:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: s5p-mfc: Always pass NULL to
 s5p_mfc_cmd_host2risc_v6()
Message-ID: <20250903185209.GB3004824@ax162>
References: <20250715-media-s5p-mfc-fix-uninit-const-pointer-v1-1-4d52b58cafe9@kernel.org>
 <9650d2e240a9170175069e3a4f6d6d9512d62aa3.camel@ndufresne.ca>
 <20250730005212.GB2984390@ax162>
 <699dae8715b77f20f075452ecbaf03c2e0876186.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <699dae8715b77f20f075452ecbaf03c2e0876186.camel@ndufresne.ca>

Hi Nicolas,

On Wed, Sep 03, 2025 at 01:13:00PM -0400, Nicolas Dufresne wrote:
> Le mardi 29 juillet 2025 à 17:52 -0700, Nathan Chancellor a écrit :
> > Hi Nicolas,
> > 
> > On Tue, Jul 29, 2025 at 10:24:22AM -0400, Nicolas Dufresne wrote:
> > > Le mardi 15 juillet 2025 à 15:13 -0700, Nathan Chancellor a écrit :
> > > > From what I can tell, it seems like ->cmd_host2risc() is only ever
> > > > called from v6 code, which always passes NULL? It seems like it should
> > > > be possible to just drop .cmd_host2risc on the v5 side, then update
> > > > .cmd_host2risc to only take two parameters? If so, I can send a follow
> > > > up as a clean up, so that this can go back relatively conflict free.
> > > 
> > > It seems so yes. For this specific patch, I would probably rename "args" to
> > > "__unused" to make the reading faster. But does not matter so much if you
> > > later
> > > remove it.
> > 
> > Yes, after this change is picked up in a maintainer's tree, I do plan to
> > send a patch to remove the "args" parameter altogether. If you really
> > care, I can certainly rename the parameter in this change to "__unused"
> > as suggested but if you don't, I will just leave it as is to make
> > backporting this a little easier.
> > 
> > > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > 
> > Thanks a lot for taking a look!
> 
> While applying your patch, I realized the Hans merged another version of this
> fix, but made by Arnd. It covers the remaining too, so I will mark yours as
> superseded now.
> 
> https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/7fa37ba25a1dfc084e24ea9acc14bf1fad8af14c

Thanks, Arnd's patch is obviously equally correct and the stable tags
remained so everything looks good from my end. Appreciate you doubling
back to this.

Cheers,
Nathan

