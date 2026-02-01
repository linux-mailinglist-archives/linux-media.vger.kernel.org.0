Return-Path: <linux-media+bounces-51931-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL8DGWmyf2mnwAIAu9opvQ
	(envelope-from <linux-media+bounces-51931-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 21:07:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D19DEC7208
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 21:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79B383008297
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 20:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0672C235B;
	Sun,  1 Feb 2026 20:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H2p6vmhJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0E71DF987;
	Sun,  1 Feb 2026 20:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769976415; cv=none; b=OIDsKnI6iFrQa0PxBNUu7cFpF7zfIyF/t73A15uS5edWyp8QjlEMKdokX84kNtRz2DbBUuu0fdDb6KZ2R35HpJVX9i4eBUr5x7nDeDzc4gT8CVjgQcugAJuVkphAvNoj7LsqHXLv7H0mprCkVCGEslBcJnB1IZ/VMP6MUSTuPgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769976415; c=relaxed/simple;
	bh=vaCDMVxeae+zPHzcYJkZ6gPRr/Oj8xlx/FLS4UMBdhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aC9xcRiBmUROb0GeNVfjjz8b3cSBQZoAkwGVAyp6+FiPYevtQ4qbqQd6eRngxU7Om7OEH21Tnd+f4BKIVaIagfk3dV0Zdnn8ITmzPxs39VY71sWvZV+wi7cM76TY1S5S97R5f6MjFpJl5BxyHFkEjq2j98iH3EPLFXOb4e5M3m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H2p6vmhJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2F2EB1BA;
	Sun,  1 Feb 2026 21:06:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769976371;
	bh=vaCDMVxeae+zPHzcYJkZ6gPRr/Oj8xlx/FLS4UMBdhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2p6vmhJ521cQBDEJaanSabS/ZjcnQ9UWggdEZepFtWi4PtD1MIMFNbido4li7DMS
	 vLZfWdVe4gq4Y40r7QRKkDMoOuVeplgmM0xYPk1xo9eJzESUqeb/xfHEfG9HtoToLt
	 k+GcGiM0nHNatX7ZRGYgfYsbe9I92phiU3TtlPPg=
Date: Sun, 1 Feb 2026 22:06:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-media@vger.kernel.org, jani.nikula@linux.intel.com,
	anisse@astier.eu, oleksandr@natalenko.name,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Message-ID: <20260201200649.GW3374091@killaraus>
References: <20260201133342.335680-1-jarkko@kernel.org>
 <20260201182011.GV3374091@killaraus>
 <aX-joEDl_BJai8wY@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aX-joEDl_BJai8wY@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51931-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D19DEC7208
X-Rspamd-Action: no action

On Sun, Feb 01, 2026 at 09:04:00PM +0200, Jarkko Sakkinen wrote:
> On Sun, Feb 01, 2026 at 08:20:11PM +0200, Laurent Pinchart wrote:
> > On Sun, Feb 01, 2026 at 03:33:38PM +0200, Jarkko Sakkinen wrote:
> > > vcam is a DMA-BUF backed virtual camera driver capable of creating video
> > > capture devices to which data can be streamed through /dev/vcam after
> > > calling VCAM_IOC_CREATE. Frames are pushed with VCAM_IOC_QUEUE and recycled
> > > with VCAM_IOC_DEQUEUE.
> > > 
> > > Zero-copy semantics are supported for shared DMA-BUF between capture and
> > > output.
> > >
> > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > ---
> > > Early feedback e.g., is this completely in wrong direction? V4L2 world
> > > is relatively alien world, and thus I need a sanity check ;-)
> > 
> > We already have multiple virtual drivers, including vivid and vimc.
> > Could you please explain the rationale for yet another one, and why the
> > new features it provides (if any) can't be added to existing drivers ?
> 
> There is a notable user base for v4l2-loopback. It is the defacto choice
> for streaming phone cams.

This will then likely face the same hurdles as v4l2-loopback, the main
one being that camera support should be upstreamed with proper drivers
instead of a closed-source userspace daemon.

For phone cameras, the way forward upstream is libcamera. Until kernel
drivers for ISPs are available, the soft ISP is a stop-gap solution. It
recently gained GPU acceleration support (with work to improve image
quality with additional algorithms ongoing).

> The motivation here is to provide a service optimized for that use and
> purpose. It's virtual but non-generic i.e. not aimed for testing/emulation.
> 
> > >  .../driver-api/media/drivers/index.rst        |    1 +
> > >  .../driver-api/media/drivers/vcam.rst         |   16 +
> > >  MAINTAINERS                                   |    8 +
> > >  drivers/media/Kconfig                         |   13 +
> > >  drivers/media/Makefile                        |    1 +
> > >  drivers/media/vcam.c                          | 1700 +++++++++++++++++
> > >  include/uapi/linux/vcam.h                     |  124 ++
> > >  7 files changed, 1863 insertions(+)
> > >  create mode 100644 Documentation/driver-api/media/drivers/vcam.rst
> > >  create mode 100644 drivers/media/vcam.c
> > >  create mode 100644 include/uapi/linux/vcam.h

[snip]

-- 
Regards,

Laurent Pinchart

