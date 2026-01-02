Return-Path: <linux-media+bounces-49849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6566CEEB84
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 15:01:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 915CB3011FB0
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 14:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985142F5311;
	Fri,  2 Jan 2026 14:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="XBTSIrhH"
X-Original-To: linux-media@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60222D97A5;
	Fri,  2 Jan 2026 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362471; cv=none; b=X33va2oykQVgpFyjH+z3MfbeUOjPWfb1z4jNbFZyZHK6qcVTiTKUnUi29IvIZyiw62v0z2iVdS9EEri5CG3Tl+bCqJRtaB0wTRoT3s+ur13Hn5I+iGVCpGUJ6HRED7it5JoVzGrGukO+j8Yy/ktKbq0WX3G/mHs5pXulAX6mGWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362471; c=relaxed/simple;
	bh=6f2MG+N763IiADhwtWWghtp2dIJe7urQJ8tmH5qnDSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucFAbMonykJa7flgAxPKK26uhxNmRAZb3trlhnrSg2zil7QPqtkSW7gPUkBDOHZu8SljLotrbTAVI8jMyI7qLCO3JEAVlaSd31qGlbBdwvFBULQgAD2kV4vY3ZtPBPfCvVji0EqBBEkx/sJB8a7rv+kUtSo7/auK47wVZFCDloo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=XBTSIrhH; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GxTLdXWJWS4u8qr5xs+QFAr0R8cHrLMggWmYTExNqlI=; b=XBTSIrhHoZQixMJi9GCkAczn/E
	UIqD9dN12Swps6F5ZxeI8WwfzTuCnHn0ubWos1NguSY9Z12Y3TfUcTF2l73rrI4h6ptE4T59HAMxL
	9Lae/MZ7TBFeo+OFLomQ6owvj4aYMlS4Ql5iTXNfFKQ4ZWSG+ba1fBO03FZfTiur92o8bF/15Gd22
	zoJnuGyBWusKQPHLzuldSxiSc0K1oHurh4PeS0NoH3pXA+9LYA0QKw+o+mp3a/O1PvQnrJ2im5Q/D
	7dzZy01PTdBKmEFEa2cEbIG+78oo8QN+CopkX/ycDVdpbLybTQXFU+4p6TvHa11Wdkp/1M8yVXnAe
	tcR+KGgA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <carnil@debian.org>)
	id 1vbfi6-00EV4n-2h; Fri, 02 Jan 2026 14:00:58 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id 450D1BE2DE0; Fri, 02 Jan 2026 15:00:57 +0100 (CET)
Date: Fri, 2 Jan 2026 15:00:57 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Ralf Jung <post@ralfj.de>, 1121718@bugs.debian.org
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	regressions@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD
 Pro Webcam shows flickering artifacts (sometimes)
Message-ID: <aVfPmZ8rUm3Vf7pT@eldamar.lan>
References: <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <aS8YBLEPwF0-NtJO@eldamar.lan>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <ba9a132e-6296-451f-8351-4045c0b72d6c@ralfj.de>
 <4rnbopkefvp6h3dwttj4h7cexehqtbuzzz4gatnebdnjzdy2li@bupytpnlk2xh>
 <2ed13f74-8de3-4caf-8972-26dd5a31e9fc@ralfj.de>
 <uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <0490a39a-28d9-4925-a162-5e4d498be257@ralfj.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0490a39a-28d9-4925-a162-5e4d498be257@ralfj.de>
X-Debian-User: carnil

Hi Ralf,

On Fri, Jan 02, 2026 at 02:24:20PM +0100, Ralf Jung wrote:
> Hi all,
> 
> I did a (lengthy) bisect session, and came out with this commit:

Thanks for doing so and for the time invested!

> 52fbe173baa4df9d14bd733f42ee6b9ceab8299b is the first bad commit
> commit 52fbe173baa4df9d14bd733f42ee6b9ceab8299b (HEAD)
> Author: Ricardo Ribalda <ribalda@chromium.org>
> Date:   Wed Dec 18 21:39:09 2024 +0000
> 
>     media: uvcvideo: Invert default value for nodrop module param
> 
>     The module param `nodrop` defines what to do with frames that contain an
>     error: drop them or sending them to userspace.
> 
>     The default in the rest of the media subsystem is to return buffers with
>     an error to userspace with V4L2_BUF_FLAG_ERROR set in v4l2_buffer.flags.
>     In UVC we drop buffers with errors by default.
> 
>     Change the default behaviour of uvcvideo to match the rest of the
>     drivers and maybe get rid of the module parameter in the future.
> 
>     Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>     Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>     Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>     Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>     Link: https://lore.kernel.org/r/20241218-uvc-deprecate-v2-2-ab814139e983@chromium.org
>     Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>     Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> I added Ricardo in Cc. Ricardo, see
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1121718 for context.
> 
> The bug does not always immediately manifest, so there is a small chance
> that for some of the commits that I marked "good", artifacts would have
> started appearing if I had waited a bit longer. But the commit seems
> reasonably plausible to be able to cause the kind of error I am seeing.
> 
> Given that this is about a module parameter, I assume I could test this by
> booting the latest kernel and setting the parameter back to its previous
> value... but I don't know enough about how the kernel works to actually do
> that.^^ Happy to try that if someone gives me some pointers.

You can create a modprobe.d file /etc/modprobe.d/uvcvideo.conf with

options uvcvideo nodrop=0

to pass 'nodrop=0' parameter when loading the uvcvideo module (then
unload and load the module).

But it already warns in dmesg when doing so with:

uvcvideo: [Deprecated]: nodrop parameter will be eventually removed.

Regards,
Salvatore

