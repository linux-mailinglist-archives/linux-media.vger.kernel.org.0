Return-Path: <linux-media+bounces-44477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F0BDB4D7
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 22:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3C583AA329
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 20:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB5027F01E;
	Tue, 14 Oct 2025 20:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgTP8b7w"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07207255F2C
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 20:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760474745; cv=none; b=nZmDgL/VvzRW1eDvx4S5l4wqshSHgJxyZItlovmRdsv5qNCmBEi4WpU8zLc32bJ0NaPO5Yb2gIVCPbdxfr48U2aapg76GMCcx2CCiwXnrrsgRtUzUpITFy8PvaSYNWGLow1s2QDX0zH4hetet1Tbg68se2Ymv6F+9S/1qTZwIRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760474745; c=relaxed/simple;
	bh=9+xyzG6t3TFk/2jDk+pv87EL1EuBvi66t48hBCzcS/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXjuHcEodWmglkrN+jSFLfD/ttyHcM2X1wKZcmYGj/EYF/2rL6py6OjhMjVOfqLNVGcJeU4jpTLhiv9TSqj2HPXdhhCdQMTlBQCM7ppSZKi6cVYXQQjpA6BoXDXk+BlVnWl7UhQ5hqWG3hLYbDHUIvE8mx34XuSs86mF23e1UbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgTP8b7w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EEEC4CEE7;
	Tue, 14 Oct 2025 20:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760474744;
	bh=9+xyzG6t3TFk/2jDk+pv87EL1EuBvi66t48hBCzcS/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EgTP8b7wRJs897GlYnpKB4zvJMOGnHfWTn9yETf7cfBms2+hYSVU3E0OLbFzbu2dJ
	 BIcX5aT0qYlPME9Bztwrf+7HA6NMUWT+l/x6X8CfIBdngKCTlJyJpAx3n9Zogq7to9
	 XpZG0t63JN3jbHwWggR6UoQYx3+Nu5dj/O+Pg7pLRQNwdE/A7Yo6jNbyhHnP/H/8ec
	 H6Wffl+G1iF9a5/2xxlA7/fcJI+mYB/7TvvCbl1iKk3m1UlQM1Gom4WcFB4eNBdupR
	 mlZipsbJAYp1L9W4AqPuAXUVguV+VB8Od5H+8FbRZ5tswtTOZhCyS2e9NF0dHNtcpk
	 6quDm4Z1nRw0g==
Date: Tue, 14 Oct 2025 13:45:44 -0700
From: Kees Cook <kees@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org,
	Patchwork Integration <patchwork@media-ci.org>
Subject: Re: [v2,0/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <202510141344.E0ABCD2C7@keescook>
References: <20251010030348.it.784-kees@kernel.org>
 <68ed624c.050a0220.3ba739.64ea@mx.google.com>
 <D1CBCBE2-3A54-410A-B15C-F1C621F9F56B@kernel.org>
 <CANiDSCu6xZAuSF5_M-4BMRc52hbSh_1QfDQqaeGR4iD5fdQjQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCu6xZAuSF5_M-4BMRc52hbSh_1QfDQqaeGR4iD5fdQjQg@mail.gmail.com>

On Tue, Oct 14, 2025 at 08:24:00AM +0200, Ricardo Ribalda wrote:
> Hi Kees
> 
> Thanks for the report.
> 
> 
> On Tue, 14 Oct 2025 at 07:41, Kees Cook <kees@kernel.org> wrote:
> >
> >
> >
> > On October 13, 2025 1:34:20 PM PDT, Patchwork Integration <patchwork@media-ci.org> wrote:
> > >Dear Kees Cook:
> > >
> > >Thanks for your patches! Unfortunately the Media CI robot detected some
> > >issues:
> > >
> > ># Test static:test-smatch
> > >
> > >drivers/media/usb/usbtv/usbtv-core.c:157:1: error: bad constant expression
> >
> > Where can I find what this test actually does?
> >
> > >For more details, check the full report at:
> > >https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/85913402/artifacts/report.htm .
> >
> > This webserver appears to be misconfigured to send compressed output without the right headers? I can't actually view this URL.
> 
> I will follow-up with fdo maintainers to figure out what happened.
> there. On the meantime you can use these url that seems to work:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/85913402/artifacts/report.txt
> https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/85913398
> 
> Basically sparse/smatch do not seem to understand the constant.

Yeah, I managed to find the actual scripts that are run for the
static-sparse/smatch tests. It looks like those tools aren't correctly
handling string literals for __builtin_strlen(), which is a constant for
constant arguments.

So, that's a C parsing bug in those tools (GCC and Clang are fine).

-Kees

-- 
Kees Cook

