Return-Path: <linux-media+bounces-51748-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA3rI6A7emlB4wEAu9opvQ
	(envelope-from <linux-media+bounces-51748-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 17:38:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD0DA5F10
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 17:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23A52304F5A0
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 16:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE6930BF7D;
	Wed, 28 Jan 2026 16:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gVOaid00"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AC030C63A;
	Wed, 28 Jan 2026 16:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616657; cv=none; b=czRJO6aaovS/RkcEiRSnlS95k3dYTX0zUOt7qHijZlXur0KfJkvWt4SibIpqymne1X10taAnsJnhfEof9Xg2crUKa/Vg43CvVoKlwlHxyV9WBA9EDX+X5qIBmKAouNBVl/ACXoGGQKh2Jc0joDclNiud9FYIHpXSeEi3J9f8hI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616657; c=relaxed/simple;
	bh=45zUWB0jKIz5xo58Qn3659W4XRcukZY3ayN+X4OqnP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmV2ijeFgwxd5UyI60CLKHdFE1aNbF3EmiWAOpMPpviUhXR7/mjX3L6c+8XNtrMbBX0GF0mN7IhfB4fi6e/5bVT17rf1a0b8V35tP2m5ZxIXPJHbr4fquMuHIlfdH1wYzfZ7SsCCHdha3/OYd8PMEceCHZsW7iVqOft/fqbcSto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gVOaid00; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C75C4AF0C;
	Wed, 28 Jan 2026 16:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769616656;
	bh=45zUWB0jKIz5xo58Qn3659W4XRcukZY3ayN+X4OqnP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gVOaid00IWVg9HHqndJFQ8irqmxJXH6DTJ4gz1YO2cXpKh7w9t1gpN5ZJLlIAMH+g
	 ssbws83FzOXPbJA6weIlbFMfPOw3oiuKQLarU7kkilAn8K+ov8y4stoBd/zzW3YEUa
	 Vk0us0i6CFv3CQiIHXWziqsmdJFHU6gbnZ97dN24=
Date: Wed, 28 Jan 2026 17:10:53 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Timoth=E9e?= Kremer <timothee.kremer@epitech.eu>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH] staging: media: av7110: refactor sleep timers
Message-ID: <2026012834-pulp-reuse-4e03@gregkh>
References: <GV2PR02MB11640C6AA4BEEE7A1B584411C8991A@GV2PR02MB11640.eurprd02.prod.outlook.com>
 <2026012844-abruptly-fraying-28a3@gregkh>
 <GV2PR02MB11640D51CC0CEA2978D83E1638991A@GV2PR02MB11640.eurprd02.prod.outlook.com>
 <GV2PR02MB116404A030FFE770E324158D68991A@GV2PR02MB11640.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <GV2PR02MB116404A030FFE770E324158D68991A@GV2PR02MB11640.eurprd02.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51748-lists,linux-media=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:dkim,epitech.eu:email]
X-Rspamd-Queue-Id: 7BD0DA5F10
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 03:08:49PM +0000, Timothée Kremer wrote:
> >From 5169a8c4cf139011f2a4928ae2205d9f9e055675 Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Timoth=C3=A9e=20KREMER?= <timothee.kremer@epitech.eu>
> Date: Wed, 28 Jan 2026 15:57:34 +0100
> Subject: [PATCH] staging: media: av7110: remove dead code
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit

Something went really wrong here, sorry.

Can you use git send-email to send your patches out?

thanks,

greg k-h

