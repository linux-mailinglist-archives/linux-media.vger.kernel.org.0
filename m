Return-Path: <linux-media+bounces-38651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E62B156C8
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 02:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1878A3B3EA6
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 00:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E7586338;
	Wed, 30 Jul 2025 00:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqLZvq7H"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B649876034;
	Wed, 30 Jul 2025 00:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753836739; cv=none; b=NKamdRXUBwc4Xljq9OPXtOXdSnF97757WHQq1mDsiFnmHpje5sNC2tJUcTAwln8Y8jCnu6+4gztpFZWnt38MGngkHEol+vwdvDo6vf/PZ3Ymm6JV5opnf/CUl1VcsB8EnQiPUDEIcYYCBAiM8gLDU8fwpSnTbzsR4hZRkBen9/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753836739; c=relaxed/simple;
	bh=jkBmzSmPV94LC+ja+IPJ0d+EvqCY2J5S5RouHbBqu1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRqYgxySNZ0wedfBBsEPjr7A8pO2fPy7jxojPccz2V6mP0wmgnTpYao1ZceJZBi3MvCBk2f4zSngytUjaOjaEKSyhLkDHoWMuuKXpAXoQhMm0giQZom4BwaFc8oqvI1+43qF19WAX3k1uWLQH1QF2MZqmJ52+OYf1WBAaQWvrqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqLZvq7H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A10EC4CEEF;
	Wed, 30 Jul 2025 00:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753836737;
	bh=jkBmzSmPV94LC+ja+IPJ0d+EvqCY2J5S5RouHbBqu1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqLZvq7HqI12euM24CWcJEa6U0shJVZ6f5b+ORyJJpHm1fCWcisczNXjbJENKaSWj
	 AB7pp9gokr7/t8B9spmlxd3OTFtJSMPuhqmymFZqv0vWTNdEsjpg+ZXIeFYc3zcuLT
	 dYIAAAc9tngW9W9XTxXxWYjlF65vsCgqIEU5n6Lgspyr9hBcePqGLKXd3uIzSSApRo
	 Z0AfVfx5ZLtruj2j8QvtnZ4/UGNGE9oLwJpB+CivuHAWLbuLqWHVOdZlsJITEunG1J
	 2teScO4Cg6B20BOAazfK/7yHp+Lp/SM7neazBwUjveV82Ihc5TLKRe8rDpeZRxQkCk
	 3eZ5WbOKyVRYA==
Date: Tue, 29 Jul 2025 17:52:12 -0700
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
Message-ID: <20250730005212.GB2984390@ax162>
References: <20250715-media-s5p-mfc-fix-uninit-const-pointer-v1-1-4d52b58cafe9@kernel.org>
 <9650d2e240a9170175069e3a4f6d6d9512d62aa3.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9650d2e240a9170175069e3a4f6d6d9512d62aa3.camel@ndufresne.ca>

Hi Nicolas,

On Tue, Jul 29, 2025 at 10:24:22AM -0400, Nicolas Dufresne wrote:
> Le mardi 15 juillet 2025 à 15:13 -0700, Nathan Chancellor a écrit :
> > From what I can tell, it seems like ->cmd_host2risc() is only ever
> > called from v6 code, which always passes NULL? It seems like it should
> > be possible to just drop .cmd_host2risc on the v5 side, then update
> > .cmd_host2risc to only take two parameters? If so, I can send a follow
> > up as a clean up, so that this can go back relatively conflict free.
> 
> It seems so yes. For this specific patch, I would probably rename "args" to
> "__unused" to make the reading faster. But does not matter so much if you later
> remove it.

Yes, after this change is picked up in a maintainer's tree, I do plan to
send a patch to remove the "args" parameter altogether. If you really
care, I can certainly rename the parameter in this change to "__unused"
as suggested but if you don't, I will just leave it as is to make
backporting this a little easier.

> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Thanks a lot for taking a look!

Cheers,
Nathan

