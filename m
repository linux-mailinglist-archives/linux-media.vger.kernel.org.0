Return-Path: <linux-media+bounces-51939-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP2bBZy9f2knxAIAu9opvQ
	(envelope-from <linux-media+bounces-51939-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 21:54:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CF8C738B
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 21:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0424630063A2
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 20:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2882D4806;
	Sun,  1 Feb 2026 20:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSIcCCjh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971732D3A77;
	Sun,  1 Feb 2026 20:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769979278; cv=none; b=cWmR5autt0GuBlzBMJJokGKosKgams4gok1FwO5X1Rj/wA/VM7wL//GF6lyqRkUs2Z5tz1ucrBoQgDSwuxcAyah+Oc2F3GOdFDOeXkIsYECf/kILntqUaGSG1vcfD/+Hf07PJA7aqc6gxPJMy5Osl4mfVyAHMC/jwxIvKp2M7i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769979278; c=relaxed/simple;
	bh=j6QE67pZtCUtAgCmImfR+xJthfVY1NSml30h4KLqPRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=du0bYma5A3ObB2bAHiSzTKiTbEZLiPMV5pEQDQdBU9QG2prsbS/40TmSFuzManxfR1pyXYHZeBgIlE17YYdkqzMTpGb/wH6zqoDMDs26dXfLbaP8J6uSX7j3sg4T9YUoz64nWeUzurEEnq5jPXem7mniJy6t5icPPY1gPCSd+Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSIcCCjh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE51AC4CEF7;
	Sun,  1 Feb 2026 20:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769979278;
	bh=j6QE67pZtCUtAgCmImfR+xJthfVY1NSml30h4KLqPRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSIcCCjh9UYFqpzFvO1eSv/YC2cSzLN0lCK8c2saoPShK7dZtUJWZ0dZpVtJhfHf+
	 EJIq+bdlECmp9DnqhWjuVmP65wrDjSFaXJoWwlBg2DqywVyEx5M8hWV1/BouAA+o9a
	 58d9Kv30irDhWbLvuwq5O2GBHF5JzDcXRhSVIzOP9FCdzp0cPaw+/6C9RYKMNCf6ES
	 OFCibDh5UR/hXUYhcdX2r+YFwlUcS3n79wMaD8GK4yDhaNlc61HAsAz1Dqb08wXxtN
	 4pXU17DjdddMquyFRCGThiT5tz8suFdYYNsVats2uYlwiswV/ORS8yGH+vU2dyP9OJ
	 4JMKIMs5KlQzQ==
Date: Sun, 1 Feb 2026 22:54:34 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, jani.nikula@linux.intel.com,
	anisse@astier.eu, oleksandr@natalenko.name,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Message-ID: <aX-9iq8r-3SM00qF@kernel.org>
References: <20260201133342.335680-1-jarkko@kernel.org>
 <20260201182011.GV3374091@killaraus>
 <aX-joEDl_BJai8wY@kernel.org>
 <20260201200649.GW3374091@killaraus>
 <aX-4-gTM9vf03iCp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aX-4-gTM9vf03iCp@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-51939-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jarkko@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 53CF8C738B
X-Rspamd-Action: no action

On Sun, Feb 01, 2026 at 10:35:12PM +0200, Jarkko Sakkinen wrote:
> On Sun, Feb 01, 2026 at 10:06:49PM +0200, Laurent Pinchart wrote:
> > On Sun, Feb 01, 2026 at 09:04:00PM +0200, Jarkko Sakkinen wrote:
> > > On Sun, Feb 01, 2026 at 08:20:11PM +0200, Laurent Pinchart wrote:
> > > > On Sun, Feb 01, 2026 at 03:33:38PM +0200, Jarkko Sakkinen wrote:
> > > > > vcam is a DMA-BUF backed virtual camera driver capable of creating video
> > > > > capture devices to which data can be streamed through /dev/vcam after
> > > > > calling VCAM_IOC_CREATE. Frames are pushed with VCAM_IOC_QUEUE and recycled
> > > > > with VCAM_IOC_DEQUEUE.
> > > > > 
> > > > > Zero-copy semantics are supported for shared DMA-BUF between capture and
> > > > > output.
> > > > >
> > > > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > > ---
> > > > > Early feedback e.g., is this completely in wrong direction? V4L2 world
> > > > > is relatively alien world, and thus I need a sanity check ;-)
> > > > 
> > > > We already have multiple virtual drivers, including vivid and vimc.
> > > > Could you please explain the rationale for yet another one, and why the
> > > > new features it provides (if any) can't be added to existing drivers ?
> > > 
> > > There is a notable user base for v4l2-loopback. It is the defacto choice
> > > for streaming phone cams.
> > 
> > This will then likely face the same hurdles as v4l2-loopback, the main
> > one being that camera support should be upstreamed with proper drivers
> > instead of a closed-source userspace daemon.
> > 
> > For phone cameras, the way forward upstream is libcamera. Until kernel
> > drivers for ISPs are available, the soft ISP is a stop-gap solution. It
> > recently gained GPU acceleration support (with work to improve image
> > quality with additional algorithms ongoing).
> 
> That might have some weight as a pro but the unarguable con is that at
> the same time this policy retains a base of tainted kernels in the wild.
> 
> Not saying that this weight more but it is important to remark this
> fact.

It's widely packaged for different distributions and even embedded build
systems forming across the board tained ecosystem. And this has been
ongoing for years. Suggesting PipeWire as "a fix" for all possible
situations is not "a solution".

BR, Jarkko

