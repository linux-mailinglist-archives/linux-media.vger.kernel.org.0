Return-Path: <linux-media+bounces-62931-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id s3uxLz9aF2oPCQgAu9opvQ
	(envelope-from <linux-media+bounces-62931-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 22:55:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B92F15EA419
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 22:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45449304DAF0
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 20:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2FD3BFE52;
	Wed, 27 May 2026 20:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DPj6EpYq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4569313520;
	Wed, 27 May 2026 20:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779915289; cv=none; b=aVutsHYHRedmtru/rLL+QrCi+T2TlTYIcTA/aeKv6yrE3h7HljiEetIO1Xuuka0v+VH2BwbU6KbIijp2hS9fiI1AdabLYfLYpmvlrt3x9fTO2GJ2+7ePym4/inie4JpBtch3CrKA3ki4EtgvGKyl1cXo6UelZTUFpc8mnAE/nRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779915289; c=relaxed/simple;
	bh=1y/ae7S1+3edRLDIok/vBqYgHaISFiLzVQtARvD+oBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8WWG+MMoAz26d+DWb/exMYusAiZAFxNsamjfM7AqJQ2TS+C9r5G6LM0VjXL3pI+wxMkoFJYVq/WhHBY6WWvfZzW+9OlZeLHbAqVuUvQt358n5LcMXue1oHkbPQJ5/T/BA2FGftAmdvicfqr8BOQ/KojaTxpfatDGkNuyvu1z7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DPj6EpYq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (cust-west-par-46-193-0-39.cust.wifirst.net [46.193.0.39])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F8409D1;
	Wed, 27 May 2026 22:54:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779915259;
	bh=1y/ae7S1+3edRLDIok/vBqYgHaISFiLzVQtARvD+oBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DPj6EpYqoqUJhw36a8GiVFXqm0QXklPjFXoapd3y1oelB91DZSWXmyOotT2Z3fNHU
	 EawWh0yHHX24YfZerBVZuD3MGCcWQbo1xxiQ/cYxr5kTcxfD3Q0O8gAMGjTp/f59cd
	 N9d8Cb8qf14xdB9DzTZPxJlPoTTiMM97X9OwEIzk=
Date: Wed, 27 May 2026 22:54:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] media: i2c: convert ternaries to string_choices
 helpers
Message-ID: <20260527205436.GB479227@killaraus.ideasonboard.com>
References: <20260527-cleanup-string-choices-media-i2c-v1-0-e8f7d2284288@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260527-cleanup-string-choices-media-i2c-v1-0-e8f7d2284288@microchip.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62931-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,microchip.com:email]
X-Rspamd-Queue-Id: B92F15EA419
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 08:10:49PM +0530, Balakrishnan Sambath wrote:
> Replace boolean-to-string ternaries with helpers from
> <linux/string_choices.h> across drivers/media/i2c/.

I don't think this is an improvement.

> Strings in uppercase or mixed case ("Yes"/"No", "ON"/"OFF", "On"/"Off")
> in adv7604.c, isl7998x.c, and ths7303.c are left as-is since the
> helpers return lowercase only.
> 
> Build-tested with x86_64 allmodconfig. No functional change.
> 
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
> Balakrishnan Sambath (12):
>       media: max9286: use string_choices helper
>       media: saa7110: use string_choices helper
>       media: tvp7002: use string_choices helper
>       media: vpx3220: use string_choices helper
>       media: msp3400: use string_choices helpers
>       media: tda1997x: use string_choices helper
>       media: ths8200: use string_choices helpers
>       media: adv7511: use string_choices helpers
>       media: saa7127: use string_choices helpers
>       media: adv7604: use string_choices helpers
>       media: tc358743: use string_choices helpers
>       media: adv7842: use string_choices helpers
> 
>  drivers/media/i2c/adv7511-v4l2.c   | 11 +++++-----
>  drivers/media/i2c/adv7604.c        | 26 +++++++++++-----------
>  drivers/media/i2c/adv7842.c        | 44 ++++++++++++++++++--------------------
>  drivers/media/i2c/max9286.c        |  3 ++-
>  drivers/media/i2c/msp3400-driver.c |  5 +++--
>  drivers/media/i2c/saa7110.c        |  3 ++-
>  drivers/media/i2c/saa7127.c        | 13 +++++------
>  drivers/media/i2c/tc358743.c       | 40 +++++++++++++++-------------------
>  drivers/media/i2c/tda1997x.c       |  7 +++---
>  drivers/media/i2c/ths8200.c        |  9 ++++----
>  drivers/media/i2c/tvp7002.c        |  3 ++-
>  drivers/media/i2c/vpx3220.c        |  3 ++-
>  12 files changed, 83 insertions(+), 84 deletions(-)
> ---
> base-commit: a3d78e74dd3ed04797ea351edb7f0a19b961c063
> change-id: 20260527-cleanup-string-choices-media-i2c-5abff65802ea

-- 
Regards,

Laurent Pinchart

