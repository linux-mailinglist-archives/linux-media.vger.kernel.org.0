Return-Path: <linux-media+bounces-45064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 593E1BF2EEC
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 213C7422B7B
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 18:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318B33321BB;
	Mon, 20 Oct 2025 18:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M8rWl5kN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9036819049B
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 18:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760984945; cv=none; b=hd7pA7sElStu0262xmo2AmTxGhA9/1aKss5sfgAMTWMAE3s8dC34FWIQX69XWNSJjLNkUUn2ZSLl+xpr5UvbqcqZYR7BnkO+ToeL18pHtLS0eQlgCAY6pk+F4rwyPCdj0VXS8wgr8Y1rPQn013/aNpW7mvWUlLrypIyEO/x4YNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760984945; c=relaxed/simple;
	bh=MplEzXjvnfYSG0KpAgx9yKbMlR0FNFDM5DFdd0WDKfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzGgbEsoj6k8JVH9QGq/GJnXVARNHlmQnk43969h77YqlYyfLmsgfKOUvrxYFHCu5JjbeFq6UYyJaQx8O1cLISQ9gVuepqyfBlHb/erqBkb7Rv7qJKK2ZZUbdEw2TKaDObXWypG+TO4NJ3ElGFqKGHXE1zMo+7J9Pb0n7NQsjUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M8rWl5kN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E574C116D0;
	Mon, 20 Oct 2025 18:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760984945;
	bh=MplEzXjvnfYSG0KpAgx9yKbMlR0FNFDM5DFdd0WDKfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M8rWl5kNPGfjtjVo7K7RGDo2NsJVHLMxJvhn/C6isY2ietkHfn2zucqMxm/dTCvN8
	 a7ATWPS8GVbXKTOMfJe6lkpE2EoIHWq1Cv4t8CJh/tMjvGc6WTg6bZ7Wpikv4HiL33
	 LXrx1C7HLS+jwxaOLxXZ/U39r4m5UcdGzg4C35T/H/4uk9arwA1Am3WPwILmNITM7E
	 A0Of36QMkZgPrCQ3WikDfydUlIgs46uQd7rWpGh0x138KJt/ZSnqU23TlJvzTxzx75
	 a+3RnvpWUPoeElCr5FZQk0D6XQW3AJrp67T3oAZ4GlkPET7Y7STD0pD+Z21Wh0ckXF
	 KfxREe5IgPFwA==
Date: Mon, 20 Oct 2025 11:29:04 -0700
From: Kees Cook <kees@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org,
	Patchwork Integration <patchwork@media-ci.org>
Subject: Re: [v2,0/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <202510201127.D97BCF2@keescook>
References: <20251010030348.it.784-kees@kernel.org>
 <68ed624c.050a0220.3ba739.64ea@mx.google.com>
 <D1CBCBE2-3A54-410A-B15C-F1C621F9F56B@kernel.org>
 <CANiDSCu6xZAuSF5_M-4BMRc52hbSh_1QfDQqaeGR4iD5fdQjQg@mail.gmail.com>
 <202510141344.E0ABCD2C7@keescook>
 <CANiDSCsBAq3Yx4ybarUb_1NkQ-bvfXvWqb-DfqXatkiYJFZWiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCsBAq3Yx4ybarUb_1NkQ-bvfXvWqb-DfqXatkiYJFZWiQ@mail.gmail.com>

On Wed, Oct 15, 2025 at 09:33:40AM +0200, Ricardo Ribalda wrote:
> Hi Dan
> 
> On Tue, 14 Oct 2025 at 22:45, Kees Cook <kees@kernel.org> wrote:
> >
> > On Tue, Oct 14, 2025 at 08:24:00AM +0200, Ricardo Ribalda wrote:
> > > Hi Kees
> > >
> > > Thanks for the report.
> > >
> > >
> > > On Tue, 14 Oct 2025 at 07:41, Kees Cook <kees@kernel.org> wrote:
> > > >
> > > >
> > > >
> > > > On October 13, 2025 1:34:20 PM PDT, Patchwork Integration <patchwork@media-ci.org> wrote:
> > > > >Dear Kees Cook:
> > > > >
> > > > >Thanks for your patches! Unfortunately the Media CI robot detected some
> > > > >issues:
> > > > >
> > > > ># Test static:test-smatch
> > > > >
> > > > >drivers/media/usb/usbtv/usbtv-core.c:157:1: error: bad constant expression
> > > >
> > > > Where can I find what this test actually does?
> > > >
> > > > >For more details, check the full report at:
> > > > >https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/85913402/artifacts/report.htm .
> > > >
> > > > This webserver appears to be misconfigured to send compressed output without the right headers? I can't actually view this URL.
> > >
> > > I will follow-up with fdo maintainers to figure out what happened.
> > > there. On the meantime you can use these url that seems to work:
> > > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/85913402/artifacts/report.txt
> > > https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/85913398
> > >
> > > Basically sparse/smatch do not seem to understand the constant.
> >
> > Yeah, I managed to find the actual scripts that are run for the
> > static-sparse/smatch tests. It looks like those tools aren't correctly
> > handling string literals for __builtin_strlen(), which is a constant for
> > constant arguments.
> >
> > So, that's a C parsing bug in those tools (GCC and Clang are fine).
> 
> Could you take a look at this patch:
> https://patchwork.linuxtv.org/project/linux-media/patch/20251010030610.3032147-3-kees@kernel.org/
> 
> Seems that sparse/smatch are not very happy about __builtin_strlen()
> 
> Could you fix support for __builtin_strlen() in your tool?
> 
> Once Kees lands his patch it will break all the CIs using
> sparse/smatch, including media-ci.
> 
> Eg:
> 
> drivers/media/pci/zoran/zr36060.c:33:1: error: bad constant expression
> drivers/media/usb/pvrusb2/pvrusb2-dvb.c:19:1: error: bad constant expression
> drivers/media/usb/pvrusb2/pvrusb2-dvb.c:19:1: error: bad constant expression

We've waited a decade to get the embedded-NUL check into the modinfo
macros, so I'm happy to wait until we can get the CI tooling updated.

Please keep me posted on when the sparse and smatch have been updated
and I'll re-send the modinfo patch.

Thanks!

-Kees

-- 
Kees Cook

