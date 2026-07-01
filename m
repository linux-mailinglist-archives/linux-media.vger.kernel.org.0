Return-Path: <linux-media+bounces-66171-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P8E6DkjWRGr51goAu9opvQ
	(envelope-from <linux-media+bounces-66171-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:56:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A573A6EB57C
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:56:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=Zr8uOxId;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66171-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66171-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C91C30444CF
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 08:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDF33EFFCD;
	Wed,  1 Jul 2026 08:51:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56943EFFD4
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 08:50:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895859; cv=none; b=tw90o5UjT9Cl4de1VF5VrNzXWDc7aAI6byCG0FAl8jmZVo7hyvnlbZBdrl3CweQ5N9/RLrEpyqD2fOI2HoKR9DHv4HxqXStWu3/trV+DAcqpE3TkBm+DIyP0+67279ipSdS73t2fGr8kpuikdbmljvTUY3ufpio4f3j3TbodPok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895859; c=relaxed/simple;
	bh=H55EFXYEtJ2d9g9JrubASYHPlUgM/ks4LR2U62y++UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UsQsmLu03JucGlJQL0rtpvKGrkJdOk3TbGxB7k+erPlLGg7lH3jZDDPw61doGB6EBvgZfq/EOOBMRoJPj8UHdd3uK9ek9MEvEkP7XEMMJD7He2NdjD1px15ls1sfEmCoI/3vD+hBzIni/fQCxII8cnUyJDFc3Xm6Y7YaHHLC/Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zr8uOxId; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (mob-5-90-48-115.net.vodafone.it [5.90.48.115])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBE19E91;
	Wed,  1 Jul 2026 10:50:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782895811;
	bh=H55EFXYEtJ2d9g9JrubASYHPlUgM/ks4LR2U62y++UU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zr8uOxIdhUDjCE9sOoDwIKpAWYCwEl2XEiSxDdxQJXb1wHlazEfhS4GPRK3tl2RvC
	 33MQ/5L0N5ZdZE4+VCHylJJoGyXyM5Ou0cu8+KifaZ7WZpjMsYZdnv28gcsPlOHgFl
	 3teD8/Eq73bWCNR22dDkGyfSwBUA/2AKvAPfxAFU=
Date: Wed, 1 Jul 2026 10:50:51 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Nayden Kanchev <nayden.kanchev@arm.com>, Konstantin Babin <Konstantin.Babin@arm.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-ctrls: document expected validation scope
Message-ID: <akTUjrM7Y02uGayT@zed>
References: <20260701-v4l2-doc-v1-1-9cce64b7a1c2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701-v4l2-doc-v1-1-9cce64b7a1c2@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66171-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:laurent.pinchart@ideasonboard.com,m:vincenzo.frascino@arm.com,m:jacopo.mondi@ideasonboard.com,m:nayden.kanchev@arm.com,m:Konstantin.Babin@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A573A6EB57C

Hi Linus

On Wed, Jul 01, 2026 at 10:11:20AM +0200, Linus Walleij wrote:
> After discussion on the mailing list it became clear that these
> validations are not expected to be exhaustive.
>
> Link: https://lore.kernel.org/linux-media/20260629133209.GG3054459@killaraus.ideasonboard.com/

The above linked discussion is about parameters buffers, which can
indeed contain large sets of data.

I'm not sure the same applies to extended controls ?

> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index b8698b85bd80..58184b6e386f 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -118,6 +118,18 @@ correct. This prevents the situation where only some of the controls
>  were set/get. Only low-level errors (e. g. a failed i2c command) can
>  still cause this situation.
>
> +The validation of controls is not expected to be exhaustive, for example
> +custom controls under ``V4L2_CTRL_CLASS_USER`` would become very voluminous.
> +The expected behaviour is to reject settings that could:
> +
> +1. Pose stability issues, such as turning the hardware unresponsive requiring
> +   a hard reset, such controls must be rejected.
> +
> +2. Pose security issues, such as compromising unrelated kernel-contained
> +   data to userspace.
> +
> +Extended validation of control values should be performed in userspace.
> +
>  .. tabularcolumns:: |p{6.8cm}|p{4.0cm}|p{6.5cm}|
>
>  .. c:type:: v4l2_ext_control
>
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260701-v4l2-doc-c60195d38d00
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>

