Return-Path: <linux-media+bounces-5048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B50E85227F
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 00:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C1B6B222B5
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 23:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A31B51C49;
	Mon, 12 Feb 2024 23:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3qhP0eK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ECA51025;
	Mon, 12 Feb 2024 23:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707780480; cv=none; b=Ob5jWBUO+pBgBcXjMrA3jnx4mmXv10P8/owiYk0EEIUxi8jNDhO2QkJor2VXo4413V0GiS2fYAlTTiV8y8g+EVL5+ExS1Y9RVApZfqInAgTN+lXEfyoQZxFfUPKmQES0klLDx3KhwPHJUU0D8uGHU2cdnOF+Nk9RZRpiyHaT6J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707780480; c=relaxed/simple;
	bh=K5hnkWF2pr9qY4CMY8S2FGPFj4eYlUn4D0jII5LC88I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1WYCN2T5fTkzXcVNcBIjqudm7Hp0poWvrThMH1X1EGWlH10J83jIYtLa72e8K/KoJ9N8xYgXlo114sbK16ySZqEDRsC3M0fMtOa5Gk9B3jZ1RgyG6wsyWQwRs3KigYfE9t05o6auKddfPzJzY8BtC9mvupBe5YTo7Yije4Ygx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3qhP0eK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F07EC433F1;
	Mon, 12 Feb 2024 23:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707780479;
	bh=K5hnkWF2pr9qY4CMY8S2FGPFj4eYlUn4D0jII5LC88I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3qhP0eKL69hznd9YtDHbdoj0ZXRgCuF1To9aggV8TWYpzbLhEG8ozPKGiRPIBVut
	 Pksi/9/lV6Jz9Uo58kbf8h4itYXIMkDEtmX/ZmVaflf+N0rgdEZz8KTnmqnzXKqDBa
	 AnyggUHWOF2jRCU5muZJvZjeLbwUwDNEfvtfaXhZRldjG7ZS6/UYb+2xuN9UWBKZv5
	 seYIippDmVkkjnHwm/tNKJAMktXoDgrDcGuuoNCuLQ2kYpvqSiINnBAS/rw9l2UAzj
	 EDstOhNfdq0Ocbbx95UmH1LJS6kghx9HB2MGPrvHFCjgP6PowWqbemtZ4tf0UHcNEl
	 /CzgxKGOZN38w==
Date: Mon, 12 Feb 2024 16:27:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: justinstitt@google.com, linux-media@vger.kernel.org,
	llvm@lists.linux.dev, mchehab@kernel.org, morbo@google.com,
	ndesaulniers@google.com, patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: mxl5xx: Move xpt structures off stack
Message-ID: <20240212232757.GA3221859@dev-arch.thelio-3990X>
References: <20240111-dvb-mxl5xx-move-structs-off-stack-v1-1-ca4230e67c11@kernel.org>
 <20240210162604.342349-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240210162604.342349-1-ojeda@kernel.org>

On Sat, Feb 10, 2024 at 05:26:04PM +0100, Miguel Ojeda wrote:
> > On Thu, 11 Jan 2024 17:40:36 -0700 Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Closes: https://github.com/ClangBuiltLinux/linux/issues/1977
> 
> The next one: 1978 :)

This is probably the third link I have messed up in the past couple of
weeks :/ Mauro, do you want a v2 for these two minor issues or can you
fix them up during application?

> > of the stackvia 'static const', which is a better location for these
> 
> Nit: space.
> 
> Built-tested for loongarch64:
> 
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Tested-by: Miguel Ojeda <ojeda@kernel.org>
> 
> With this applied, I have a `WERROR`-clean `defconfig` build with a Rust-enabled
> kernel using LLVM 18 (using LLVM-provided apt pre-releases).

Thanks for taking a look, this is great to hear!

Cheers,
Nathan

