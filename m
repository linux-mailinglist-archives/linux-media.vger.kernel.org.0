Return-Path: <linux-media+bounces-47338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CEFC6CB4B
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 05:21:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C66DE4EBD8E
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 04:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A957B2F6907;
	Wed, 19 Nov 2025 04:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fQLh6v4v"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBB04503B;
	Wed, 19 Nov 2025 04:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526025; cv=none; b=bdmMIc3OG6vPNVGFxUDQtBrYSYjQFXOQIph8A2gDH5E/N1lPAbXuSYnrLcpxqYnM3oqMZ1prZanff2lOWaf4lP+fzlfu+VIdeLQ4EUxyvh6+ZGv/kTHXI5wHmfSbbn0k0EUJWlXR2ke3vggt3GJpLd1ONnTjpoMvhc0c/6EMbjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526025; c=relaxed/simple;
	bh=xIUf4BhqjcVp0635jb2PH3RJ96Zp0S114Qz9sJzPrJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qs+E1+S5gu6weECozeuUuGvjDy0N5pJ8m/A7AF8ETf5/cyrWjYKAM37SBYYYwZptdo0fhtXmBxX3UOenuCIKlJIhK0jIFSSGxBYkScx+EFqzBcA0pBV2cy7OWQUTjqj+iTWGgw1khEbbLQP09dFA9+HjLcvHijcpMQcB7K36WWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fQLh6v4v; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 43CC014B0;
	Wed, 19 Nov 2025 05:18:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763525898;
	bh=xIUf4BhqjcVp0635jb2PH3RJ96Zp0S114Qz9sJzPrJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQLh6v4v3brksc6sGxX9A3lGBxU1NZpM6wYTc8RRAfeSsORljJR7UQ7b4BS2Tp13P
	 QMx7g4M2p0rD/s7LA4znCvISpobpD9lJvuovMyB5VLRndeSlHS24Pxbwm7waGfmzSK
	 no4muOMa3mYKCk/duM/qQxX3cyY6kisMgDLHSplo=
Date: Wed, 19 Nov 2025 13:19:55 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Gergo Koteles <soyer@irl.hu>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
Message-ID: <20251119010156.GD23711@pendragon.ideasonboard.com>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org>
 <f922a8271624a6ae765abbf9894867007a29c8e7.camel@irl.hu>
 <CANiDSCs7mdMmCxho+u=DC53kCaUTq05htzpV2=_NEkvq0U0pOw@mail.gmail.com>
 <fd65b83abc22587e592a565dd2b326e8eb63f34c.camel@irl.hu>
 <CANiDSCudzTj0QZMWNnE0gUPFh5heQWRC8z8NOmDHnVXCdqi96A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCudzTj0QZMWNnE0gUPFh5heQWRC8z8NOmDHnVXCdqi96A@mail.gmail.com>

On Tue, Nov 18, 2025 at 10:25:42AM +0100, Ricardo Ribalda wrote:
> On Tue, 18 Nov 2025 at 09:48, Gergo Koteles wrote:
> > On Tue, 2025-11-18 at 07:21 +0100, Ricardo Ribalda wrote:
> > >
> > > Most users expect that the led is always on when the camera is active.
> > > I think the usecases where the led should not be turned on are spooky
> > > or very limited.
> >
> > Or do most users expect that if a piece of hardware has a setting, they
> > can set it without module parameters?
> 
> A piece of hardware that has a non-standard, undocumented setting.
> 
> Do you have a compelling use-case for turning off the privacy LED?

The use case that Logitech added this XU control to support is avoiding
the reflection of the privacy LED in users' glasses.

> > > Even if you use open-source software, when it parses user generated
> > > data, there is a risk for bugs. If there is a bug the only thing
> > > protecting the security of the camera is the membership of the video
> > > group which is a very low barrier.

In modern systems the answer to this would be pipewire and portals (or
similar solutions for vendor operating systems). We'll still need time
until the user won't have direct access to the video device nodes
though.

> > > And once you manage to change the
> > > LED behaviour will persist in other unrelated apps.

Maybe that's something we want to address, and make the control
per-file-handle ?

> > So this is about what if an attacker accessed my passwords, private
> > keys, OTP tokens, emails, pictures and then couldn't take a fresh
> > picture of me in the dark without an LED? I'm smart as hell and I use a
> > privacy tape anyway ;)
> 
> My core goal is simple: if the camera is in use, the privacy LED must
> be ON. If the LED is ON unexpectedly, it serves as a clear indication
> that something unusual is happening.
> 
> Gaining access to the video node does not automatically grant access
> to sensitive data like browser information; there are sandboxes in
> place for that. Also open source does not equate to secure or
> non-malicious code.
> 
> > I think freedom is worth more than this kind of fear.
> 
> No freedom is lost. This change simply increases the
> trustworthiness/reliability of your device.
> 
> On ChromeOS, I don't use a privacy tape, but that's because I know how
> the LED is wired :). I want to achieve a similar level of
> trust/reliability for everyone else.

I'd argue that a privacy tape is useful on those devices too. Far more
common than attack scenarios are cases when you unvoluntarily turn your
webcam on during a call. This is however beside the point.

> In other words, I want to know if someone has seen me without t-shirt,
> eating ice-cream and crying while I am re-watching Coco.

-- 
Regards,

Laurent Pinchart

