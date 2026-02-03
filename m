Return-Path: <linux-media+bounces-52112-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK2/GIYQgmm9OwMAu9opvQ
	(envelope-from <linux-media+bounces-52112-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 16:13:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB620DB222
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 16:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C490A30ADDD3
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 15:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EE3310764;
	Tue,  3 Feb 2026 15:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AId1qLWH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC49130FF27;
	Tue,  3 Feb 2026 15:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131203; cv=none; b=TfaSYDkX/3UWrJ9sgc3cgdzY5asLaxdJldAQCijDf5tnRnHzqFi283hoGIDM77KF3LeI0P3hosQWptq/iYEVHUnbWOOa3vZnFz9b0mnthWmYtz6r5l5eeHSyzl1AYd40flDzLi05c0Z3FadQqP34VlrnQS1lQW2OzpFyc5BQvDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131203; c=relaxed/simple;
	bh=vrEH5IeHQUylaWZeAkwPg7iS3sbxMk0U3aCVh//2XOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnSh+1QuI+xaqOO4qpfDSJyZEGLaTUx8X7Z6emAQ6JclYJoneWE/jVNJNheEt8WBj+MSgR8KVtnXYIWxRGMKzUd9lLKNQyeEk11D5iZluGY+A+0yIuE/FO8l98iWlaTOubkuYdhJaYIMNVGyP+LhEobovo9FhdOVFPnAFgDz2VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AId1qLWH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 850FA1C6;
	Tue,  3 Feb 2026 16:05:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770131158;
	bh=vrEH5IeHQUylaWZeAkwPg7iS3sbxMk0U3aCVh//2XOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AId1qLWHQBQ0Y6Sy8PHJOgVlBsH9W/hiZ60JHS7A1y3BB4wL0fZtG9TLiEyevL8Lx
	 c9/ROKsMsmAYq9Bkx3I2ow7h21CFjLt/Pm02pQ3QOhlcQ3LiLE2qrys9Mx0Qz8Miy9
	 6YI6IZP22NNDeYrjTgfwGjHhYtaeLVdA2ZN7cOJ0=
Date: Tue, 3 Feb 2026 17:06:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, linux-media@vger.kernel.org,
	anisse@astier.eu, oleksandr@natalenko.name,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Message-ID: <20260203150638.GA11369@killaraus>
References: <20260201133342.335680-1-jarkko@kernel.org>
 <20260201182011.GV3374091@killaraus>
 <aX-joEDl_BJai8wY@kernel.org>
 <20260201200649.GW3374091@killaraus>
 <c6b719fdecbfc8a1c15a197b6ae51da56ed54f63@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c6b719fdecbfc8a1c15a197b6ae51da56ed54f63@intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52112-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,obsproject.com:url]
X-Rspamd-Queue-Id: CB620DB222
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 11:50:23AM +0200, Jani Nikula wrote:
> On Sun, 01 Feb 2026, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > On Sun, Feb 01, 2026 at 09:04:00PM +0200, Jarkko Sakkinen wrote:
> >> On Sun, Feb 01, 2026 at 08:20:11PM +0200, Laurent Pinchart wrote:
> >> > On Sun, Feb 01, 2026 at 03:33:38PM +0200, Jarkko Sakkinen wrote:
> >> > > vcam is a DMA-BUF backed virtual camera driver capable of creating video
> >> > > capture devices to which data can be streamed through /dev/vcam after
> >> > > calling VCAM_IOC_CREATE. Frames are pushed with VCAM_IOC_QUEUE and recycled
> >> > > with VCAM_IOC_DEQUEUE.
> >> > > 
> >> > > Zero-copy semantics are supported for shared DMA-BUF between capture and
> >> > > output.
> >> > >
> >> > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> >> > > ---
> >> > > Early feedback e.g., is this completely in wrong direction? V4L2 world
> >> > > is relatively alien world, and thus I need a sanity check ;-)
> >> > 
> >> > We already have multiple virtual drivers, including vivid and vimc.
> >> > Could you please explain the rationale for yet another one, and why the
> >> > new features it provides (if any) can't be added to existing drivers ?
> >> 
> >> There is a notable user base for v4l2-loopback. It is the defacto choice
> >> for streaming phone cams.
> >
> > This will then likely face the same hurdles as v4l2-loopback, the main
> > one being that camera support should be upstreamed with proper drivers
> > instead of a closed-source userspace daemon.
> 
> My use case:
> 
> Input screen capture and webcam into OBS Studio, output the combined
> scene into virtual device, and input that virtual device into an
> application that is designed to work with video devices like that, and
> is not aware of anything fancier. For example, a web based meeting
> software. [1]
> 
> There's nothing proprietary or closed-source here. AFAICT using
> v4l2-loopback is currently the only method suggested or supported by OBS
> Studio, or the plethora of apps that only really understand the video
> devices.
> 
> I don't want to use that out-of-tree module from distro DKMS or
> whatever. Please enlighten me (and apparently a lot of other folks) if
> there's a better option that can be made to work out of the box. And it
> pretty much has to be as simple as 'apt install v4l2loopback-dkms'.

I'd say it should be as simple as 'apt install obs-studio' :-)

OBS has recently gained PipeWire support, but as a source, not a sink.
To cover your use case, we would need to extend OBS with PipeWire sink
support. The video stream that it would then provide to PipeWire would
be available in applications, including web browsers for video
conferencing.

Yes, this will require work on OBS, but the proposed virtual camera
driver does as well as the API on the sink side uses custom ioctls.
v4l2loopback support in OBS won't work out of the box with it. If OBS is
to be extended anyway, it should be done with PipeWire support as that's
where the ecosystem is moving.

PipeWire also includes pw-v4l2, a wrapper script with an LD_PRELOAD-able
library that emulates the V4L2 API. It helps with applications that
require a V4L2 capture device, until they gain native PipeWire support.

> [1] https://obsproject.com/kb/virtual-camera-guide

-- 
Regards,

Laurent Pinchart

