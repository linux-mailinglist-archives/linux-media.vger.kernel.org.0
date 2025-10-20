Return-Path: <linux-media+bounces-45070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA26BBF303F
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3F98401D5F
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 18:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0EB2D23BC;
	Mon, 20 Oct 2025 18:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTrEjI5f"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA86F23A9AC
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 18:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760986266; cv=none; b=HPyYWR24pneWHUWVv5CkeGRykUNmWDfpcxAK5P2aXIq+uqrUmkZefEk9biUrjKAVTQU1jbzXqrZ5+mgyPCX4AP0jDadckKTaLsS5AwD5QldI7YCgJiOd2T1HASH+HNsM/rSnZSYE7R9y+DGP2BVNMsOV6bGw8IwyY8rLp/ARz7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760986266; c=relaxed/simple;
	bh=gkyxqD+fLEFbnOckkoG6Fjp8MGOpS4c0+zOPRAHVCEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXSQnE14szY388tDc7aPtgIpD7WGzIMLdh+lyVoVbrvXNnOsofocmvI1ZVVJP2qw3cZKYONU7kYEdHIb7+oejGquI+pm462D7mCsffbSrF7NEN7ccC+5RHX/vU3eG30KEUe6TGuDvkaYpqyvcUuj1HByva8nEEnIuAcHuHV9W3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTrEjI5f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE87C113D0;
	Mon, 20 Oct 2025 18:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760986266;
	bh=gkyxqD+fLEFbnOckkoG6Fjp8MGOpS4c0+zOPRAHVCEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aTrEjI5fVWP02LowTus33xDiH7DP8ln52MfCOFcM7/1z0waCTIl+Pojy4ymIIwfuE
	 ahHALEWaQyzjSC5PkNEz0UOn7sczofr+SIhz7hssc2L6Txgwg/1W9yGh3G4sxHC+qz
	 qJ22m2GHMvt13090VjZL36+mRVBkqK87yeThVzCZLKTQ5lwcCXx3XNekXX/W/RK7OL
	 VzXHa1OIn891VgyXCdAtwCDSvMOwaId6cvXY0e7bVEMf+DQqtrDbCYSQioIfcF3gGl
	 4+obR/9cEjc2Dy7zI9K0E6Yj0PXVFoWd4KI5u/6i0Sil8GwiEcl/HERLGSyQbtMjUi
	 04Vx5w8aOWq1w==
Date: Mon, 20 Oct 2025 11:51:05 -0700
From: Kees Cook <kees@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org,
	Patchwork Integration <patchwork@media-ci.org>
Subject: Re: [v2,0/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <202510201146.F12EA92@keescook>
References: <20251010030348.it.784-kees@kernel.org>
 <68ed624c.050a0220.3ba739.64ea@mx.google.com>
 <D1CBCBE2-3A54-410A-B15C-F1C621F9F56B@kernel.org>
 <CANiDSCu6xZAuSF5_M-4BMRc52hbSh_1QfDQqaeGR4iD5fdQjQg@mail.gmail.com>
 <202510141344.E0ABCD2C7@keescook>
 <CANiDSCsBAq3Yx4ybarUb_1NkQ-bvfXvWqb-DfqXatkiYJFZWiQ@mail.gmail.com>
 <202510201127.D97BCF2@keescook>
 <CANiDSCtbrM4Fg_p56EdV09ts_j8HnMCc1hGH31-BZvv03Z0DjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtbrM4Fg_p56EdV09ts_j8HnMCc1hGH31-BZvv03Z0DjQ@mail.gmail.com>

On Mon, Oct 20, 2025 at 08:35:53PM +0200, Ricardo Ribalda wrote:
> Hi Kees
> 
> On Mon, 20 Oct 2025 at 20:29, Kees Cook <kees@kernel.org> wrote:
> >
> > On Wed, Oct 15, 2025 at 09:33:40AM +0200, Ricardo Ribalda wrote:
> > > Hi Dan
> > >
> > > On Tue, 14 Oct 2025 at 22:45, Kees Cook <kees@kernel.org> wrote:
> > > >
> > > > On Tue, Oct 14, 2025 at 08:24:00AM +0200, Ricardo Ribalda wrote:
> > > > > Hi Kees
> > > > >
> > > > > Thanks for the report.
> > > > >
> > > > >
> > > > > On Tue, 14 Oct 2025 at 07:41, Kees Cook <kees@kernel.org> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > On October 13, 2025 1:34:20 PM PDT, Patchwork Integration <patchwork@media-ci.org> wrote:
> > > > > > >Dear Kees Cook:
> > > > > > >
> > > > > > >Thanks for your patches! Unfortunately the Media CI robot detected some
> > > > > > >issues:
> > > > > > >
> > > > > > ># Test static:test-smatch
> > > > > > >
> > > > > > >drivers/media/usb/usbtv/usbtv-core.c:157:1: error: bad constant expression
> > > > > >
> > > > > > Where can I find what this test actually does?
> > > > > >
> > > > > > >For more details, check the full report at:
> > > > > > >https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/85913402/artifacts/report.htm .
> > > > > >
> > > > > > This webserver appears to be misconfigured to send compressed output without the right headers? I can't actually view this URL.
> > > > >
> > > > > I will follow-up with fdo maintainers to figure out what happened.
> > > > > there. On the meantime you can use these url that seems to work:
> > > > > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/85913402/artifacts/report.txt
> > > > > https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/85913398
> > > > >
> > > > > Basically sparse/smatch do not seem to understand the constant.
> > > >
> > > > Yeah, I managed to find the actual scripts that are run for the
> > > > static-sparse/smatch tests. It looks like those tools aren't correctly
> > > > handling string literals for __builtin_strlen(), which is a constant for
> > > > constant arguments.
> > > >
> > > > So, that's a C parsing bug in those tools (GCC and Clang are fine).
> > >
> > > Could you take a look at this patch:
> > > https://patchwork.linuxtv.org/project/linux-media/patch/20251010030610.3032147-3-kees@kernel.org/
> > >
> > > Seems that sparse/smatch are not very happy about __builtin_strlen()
> > >
> > > Could you fix support for __builtin_strlen() in your tool?
> > >
> > > Once Kees lands his patch it will break all the CIs using
> > > sparse/smatch, including media-ci.
> > >
> > > Eg:
> > >
> > > drivers/media/pci/zoran/zr36060.c:33:1: error: bad constant expression
> > > drivers/media/usb/pvrusb2/pvrusb2-dvb.c:19:1: error: bad constant expression
> > > drivers/media/usb/pvrusb2/pvrusb2-dvb.c:19:1: error: bad constant expression
> >
> > We've waited a decade to get the embedded-NUL check into the modinfo
> > macros, so I'm happy to wait until we can get the CI tooling updated.
> 
> For media-ci. It will probably be after 6.19rc1
> 
> Basically, when
> https://lore.kernel.org/linux-sparse/CACePvbVG2KrGQq4cNKV=wbO5h=jp3M0RO1SdfX8kV4OukjPG8A@mail.gmail.com/T/#t
> lands in media-committers.

That's external to Linux, though; it's a patch for sparse and smatch. How
often does the CI rebuild sparse and smatch?

> How did you plan to land this series? via which tree?

I assume it would go either via the modules tree or the hardening tree.
(Again, no rush.)

> if Chris have not landed his fix yet, maybe you can include that patch
> in your series as 1/X.... That will make every ci happy

Since it's a patch for a separate project, I don't think that will work.
(Maybe I'm misunderstanding something?)

-Kees

-- 
Kees Cook

