Return-Path: <linux-media+bounces-6722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97325876465
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 13:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B373B232C2
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 12:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD3217753;
	Fri,  8 Mar 2024 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxK+3yv1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C1D81F;
	Fri,  8 Mar 2024 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709901425; cv=none; b=SUOPL6o5VMENCR/Uf5QOFNYivJwCb0fG3SGW85G+WW8treMAi24QC2bfk7OlfLdEE6eqg23ci6tb8p74ozqJCcVWY3wQYsDUsVZWtjTIgbFWTnyvHn3XJw/WrOFbwsv67HOaJwZiRaESnRaNVk6/SG9RRQ1K9GQfBbAit8pwMhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709901425; c=relaxed/simple;
	bh=ic8OhF1Jk6KHpHAtIsahFcndseYrUNwaDhT/i4nBLlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dh1ifcJH79Ez4bJAvmuJ3NXIj2WCo0soLTqrGUsyahrt9F2NcSYC7z4e7VnFxY/Cm0+Gf+1OneKZuSPHu5t9x7yBvBMschQIfcg8DNvBiySEN3E5QclzKzfjoQ+JZRnsHjhW/l+VWMpMHfEr8nkv+U5X4fA5tvQ0EUWYVRItU9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxK+3yv1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D37C433F1;
	Fri,  8 Mar 2024 12:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709901424;
	bh=ic8OhF1Jk6KHpHAtIsahFcndseYrUNwaDhT/i4nBLlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oxK+3yv1Y8iJpdxObgk3BWF3SkhgVoZcEf0LVof2PTOVm+hn3E6zo8Dd/BBkVJG2z
	 U/XG6tovCJ9wXPg+QtM1YnsDMFQtOSWpyYoOoqVhQgyy4HI8DCMnjLBJUlV9+2ugAv
	 hPZHuVXgshPvAoAsDSsGz5n6XHWZRHm4G0nRZN3M7/m2AwtjZWHCc9NaTtQVTL1jF/
	 l2t0n7pr5M9DVigSpC6EqHyzOBtq22txWuhfrDSHQjIv/7EXplvaTgpJcI2XaJN3Sx
	 Jy3kgjaYzRQb+JZHDL4KRbFzGeLTCA0vLdb1APYXl3aEthKKdMiBsiFuHtj1GL/548
	 1tVgw8RxeClgg==
Date: Fri, 8 Mar 2024 13:37:01 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 5/5] media: ir-spi: Unify indentation and comment style
Message-ID: <gczjtfg6fwp2ogq2uuotxjxqiaucoelnzrcv76mypbyut2ltpa@piyhwirz7g23>
References: <20240305174933.1370708-1-andriy.shevchenko@linux.intel.com>
 <20240305174933.1370708-6-andriy.shevchenko@linux.intel.com>
 <hwtodfwrgonzzf2dpoqa3b5b3v66ypp7uu7upsnt6dx7weua2f@byxbgpxurhmf>
 <ZehxPFh2ecxsKsOF@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZehxPFh2ecxsKsOF@smile.fi.intel.com>

On Wed, Mar 06, 2024 at 03:35:56PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 05, 2024 at 11:52:15PM +0100, Andi Shyti wrote:
> > On Tue, Mar 05, 2024 at 07:48:30PM +0200, Andy Shevchenko wrote:
> 
> ...
> 
> > > +static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int count)
> > 
> > this goes over 80 characters, though. Not an error, but not worth
> > a change either.
> 
> It's only 82 characters and I consider this as an improvement in readability.
> It's quite pity that some of the subsystems are too conservative, hope this
> one is not an obstacle for them.
> 
> > I'm not going block the patch as the rest is OK.
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> 
> Thank you!
> 
> Btw, don't you want to either add your entry into .mailcap and/or update your
> email address in this source file (and maybe others)? I Cc'ed you only after
> I looked closer to the sources...

yes, will do... I also noticed that lots of updates are missing...

I've been far from all this for too long, so that I have still
a lot of catch up to do :-)

Thanks, Andy!
Andi

