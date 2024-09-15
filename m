Return-Path: <linux-media+bounces-18294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3267497962C
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2024 11:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD0261F217B1
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2024 09:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F4B1C3F08;
	Sun, 15 Sep 2024 09:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vsjmZMZI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29FA17579
	for <linux-media@vger.kernel.org>; Sun, 15 Sep 2024 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726393201; cv=none; b=bpV5M6kWv4aRVHHxELbNmAUTl6DSmXmXbwEqkmioRwVMIZJm6CG7S9IGll/Tp3ZkuxIYhUYlnYMZRWMGfysFkys1Dco7JRn93eHF6iNtS7hIT9KwV7hVpFU7da+Ox//rpWMytjc7oxCjwk6wOUuQHwLKBfr0xGnBaTa3vPBIQ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726393201; c=relaxed/simple;
	bh=ogNSNiHsTEYYkUjzNo/OWq+IU0JFW+laLvxiqzUr3EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGle88uRF3yM/22qIpiNxFrw0cDNLemzDTPbefHTJfUEV+i9fwVxVvWm0v+O4M54vJglj7nfCWR24oXerwyuZq8IBjUHihl02XVam0h4m+BfhT/Fa3edcJP1sTkh0HhI94bd0vWqCkPjHpGHPoaLSyAuUsPG7BdsvshLrg6TSvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vsjmZMZI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85E9D480;
	Sun, 15 Sep 2024 11:38:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726393116;
	bh=ogNSNiHsTEYYkUjzNo/OWq+IU0JFW+laLvxiqzUr3EI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vsjmZMZIa54lQdOOd7IVeGMTpEqMN1vStHtP0HoB58FrldeAsE+3PnB0pvEFmGpq+
	 Cgoqd0m0bbLb2F9XORTeefhJYpT4zEAkISeKkRr+T5Nk4I1mnXojOMd2SU7pFwexPA
	 qvq30JJsCepMhL3hWKebvsU61Cs1NUbzlsYdbwx0=
Date: Sun, 15 Sep 2024 12:39:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Given <dg@cowlark.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Subject: Re: No uvc video support for D3DFMT video GUIDs?
Message-ID: <20240915093922.GJ22087@pendragon.ideasonboard.com>
References: <CALgV52gdx5m3eP88Sqa4s09qy+N4rpaZ8UHFXfphkCXZUxyNHQ@mail.gmail.com>
 <CANiDSCuOojPtX4M9Q7DOe4sR-DpuKp1Rzzpa3NrJxV7HuzAAeg@mail.gmail.com>
 <CALgV52iM3B4G2Sa0jjuMcEZtE+rn8B80NOMWj3i4jEUCiVVnRw@mail.gmail.com>
 <20240913234037.GB9669@pendragon.ideasonboard.com>
 <CALgV52i7=-jH-EmQQb-gaYAs7vuS1bPxyUv_PSvrTKyRYewWuw@mail.gmail.com>
 <CALgV52htoEjohXv7NLTAb7eCy8nPujWtcd82prNZ=jWrVY7wyA@mail.gmail.com>
 <CALgV52jhPHmfaVnbskCXZw-8N4jYFGtowaVMmVL3NwUg1Jiutw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALgV52jhPHmfaVnbskCXZw-8N4jYFGtowaVMmVL3NwUg1Jiutw@mail.gmail.com>

Hi David,

On Sat, Sep 14, 2024 at 12:19:39PM +0200, David Given wrote:
> Solved. https://imgur.com/a/vGJ0Y4a
> 
> Turns out the necessary quirk was UVC_QUIRK_PROBE_MINMAX, and then
> v4l2-compliance goes green and video comes out. It's even the right
> colour.

I'm glad you managed to fix your issue.

> I will polish this up into a patch and send it. Is the list the right
> place or should this go to a specific maintainer?

The linux-media mailing list is the right place. Please CC me as well.

> On Sat, 14 Sept 2024 at 02:23, David Given <dg@cowlark.com> wrote:
> >
> > D'oh! The kernel logs which say this:
> >
> > ---snip---
> > [23824.213720] uvcvideo 3-5.4.3:1.1: Failed to query (130) UVC probe control : -
> > 32 (exp. 26).
> > ---snip---
> >
> > ...show what's going on; the device is reporting an incorrect control
> > packet size. It's probably completely ignoring the incoming packet
> > size and assuming they'll always be 32 bytes, which is wrong.

-32 is the -EPIPE error code. According to
Documentation/driver-api/usb/error-codes.rst, this means the endpoint
has stalled. The camera's firmware "just" doesn't implement support for
this request, and possibly crashed. Apparently the windows driver
doesn't call GET_MIN and GET_MAX on the video probe control, and so
lots of webcams don't implement it.

> > On Sat, 14 Sept 2024 at 02:13, David Given wrote:
> > > On Sat, 14 Sept 2024 at 01:40, Laurent Pinchart wrote:
> > > [...]
> > > > UVC_QUIRK_PROBE_DEF may help. Please check if it results in any change
> > > > in the kernel log messages, not just if you can capture frames from the
> > > > camera, as sometimes multiple quirks may be needed.
> > >
> > > Thanks for the suggestion --- I tried it, and the kernel messages did
> > > indeed look a bit better, but I suspect only because it's not doing
> > > the GET_DEF anymore so isn't reporting it as an error.
> > >
> > > ---snip---
> > > [23584.241771] usb 3-5.4.3: Found UVC 1.00 device IR VIDEO (1fc9:009b)
> > > [23584.241775] usb 3-5.4.3: Forcing device quirks to 0x100 by module parameter f
> > > or testing purpose.
> > > [23584.241777] usb 3-5.4.3: Please report required quirks to the linux-media mai
> > > ling list.
> > > [23584.246791] usbcore: registered new interface driver uvcvideo
> > > ---snip---
> > >
> > > Still doesn't work, mind.
> > >
> > > My gut feeling based on looking at the compliance logs and no
> > > experience with how things actually work is that the format selection
> > > commands are a mess, maybe because they're not expecting the client to
> > > actually try to select or enumerate the formats but instead just
> > > process the frames the device gives? This line looks suspicious:
> > >
> > > ---snip---
> > >        test VIDIOC_TRY_FMT: FAIL
> > >                fail: v4l2-test-formats.cpp(473): expected EINVAL, but got 5 whe
> > > n getting format for buftype 1
> > > ---snip---
> > >
> > > 5 is EIO, so if they're failing the request incorrectly that will
> > > confuse all clients which consider EIO to be a fatal error. It should
> > > be easily quirkable; I'll give it a try.

-- 
Regards,

Laurent Pinchart

