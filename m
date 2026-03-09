Return-Path: <linux-media+bounces-54918-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMR9LaJ7rmnoFAIAu9opvQ
	(envelope-from <linux-media+bounces-54918-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 08:49:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 331A623505E
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 08:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E4433025A71
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 07:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC3F36AB43;
	Mon,  9 Mar 2026 07:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYlqWn31"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9B3369985;
	Mon,  9 Mar 2026 07:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042539; cv=none; b=TV2h4Ix6381QaOFyaARGPtJFE87NgbHYnuPsZ46XDDWDprSBxvQPabYu7yJ8KyRwXBn6BiHPgGLjgz/k80ABzY+syU7OM+MxNNwqrFuWJVWcBWfudGK8bxBmeK/H+ClZRSIl8RgEYo5BG8gQrZjN1Ze0jR51RGU9I7hfzTrqCX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042539; c=relaxed/simple;
	bh=CQTJbkyf5gB8zNmEIR38OIpefroTsXFq5pQRq3veA2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ou7SsGZLjnEydebM6cv7S43JYDqCzVB/NjjQd4OjFRBCRgL/FE4mkIYHvMkn/bBVudqHB0WQ1qa6BlbszONskg9aa8W6dzyX7d7oj1hiqtB+gyHSUU8Tsqp9kXFU32TRMdM3Mmc5VPVue1f9o/GEjJeYerkFdAKC0UTUQKInetw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYlqWn31; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9411C4CEF7;
	Mon,  9 Mar 2026 07:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773042539;
	bh=CQTJbkyf5gB8zNmEIR38OIpefroTsXFq5pQRq3veA2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PYlqWn311EwWACpjnhP5I/rpsGcKOSL+kM69spYfbZrjKvZc/mA/rRFlBPltavw3d
	 jWPULqx3UhGbh18E8qf01s+5PrVus+50lEoo20sX0T4+MKNFhyLhwxLpLt3GeyqvhM
	 uh6orHJTk6Oz7wrIuX94xwIV8QyX+E/hqYG76bynhO2MK9/H/7rf8lOH+UGsceeXR4
	 Zz8RQ3b1DeZXziYQ7+yNkD8llxbzDjd5zT9/ep93NwHsAdYuKPzlbY0i5TkwomGpLl
	 y4laMwZI908Vyq37peEWtBAXY24ZatT0KVvcgrPwE6HOBkqDZqxhiCB6XX3DKrJ5bb
	 /Z2TfXUWsxDBg==
Date: Mon, 9 Mar 2026 08:48:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: ovti,ov8856: Allow props from
 video-interface-devices
Message-ID: <20260309-infrared-loon-of-fantasy-1d7abd@quoll>
References: <20260307-ov8856-v4l2-props-v1-0-7677b4c658e4@pm.me>
 <20260307-ov8856-v4l2-props-v1-1-7677b4c658e4@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260307-ov8856-v4l2-props-v1-1-7677b4c658e4@pm.me>
X-Rspamd-Queue-Id: 331A623505E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54918-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 04:56:04AM +0000, Alexander Koskovich wrote:
> There is no reason to restrict the allowed rotation degrees to 0 and 180,
> as the sensor can be mounted with any rotation.
> 
> Also, as all the properties described by video-interface-devices.yaml are
> allowed for the image sensor, make them accepted by changing
> additionalProperties: false" to "unevaluatedProperties: false" at the
> schema top-level.

And flash-leds, leds and lens-focus depend on the board design and not
on this sensor pins?

Best regards,
Krzysztof


