Return-Path: <linux-media+bounces-67299-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OohaDpHxUGp78wIAu9opvQ
	(envelope-from <linux-media+bounces-67299-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 15:20:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D42D673B2DE
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 15:20:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Nkcgzlgy;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67299-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67299-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 528A2300F5FC
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BF342DA3C;
	Fri, 10 Jul 2026 13:17:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5042253A;
	Fri, 10 Jul 2026 13:17:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689459; cv=none; b=FAP/WF6t1v9DBSSf5H2t+Yox3LlrUGcdkYlLtzVNVXuTzhpBUnb4iI3qvmnqttEau/Fkw0K0KM0pAJy4INCmEPLN3eQ+UF3g3Au3SjRIXy77xc5NbNwXdRG8CMH4//LMBaSxqpDxR67IYTONR2Zjqnl0a/JKbATc54LdZ2zYQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689459; c=relaxed/simple;
	bh=u9HkEmSlivo4Abui5Mzh4y8S6Oizy8nUHM8H9wCUXWw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AIdH8Hvs2JSh0H3qZI6fCqigU59wm4kCfWp7FFJ0vLcxXaPGvcFmXfqWWVYozCLe3KES4kPRxBx8/va8ElggC+IC2Uqs5vWSzY4gg/bPKmqVbQBGOqZc2JFGRcLJZjmNMZFcXUOiKYPdFUJJb6M0q/GW0wXW90W++x7Um34rAlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nkcgzlgy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A561F000E9;
	Fri, 10 Jul 2026 13:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783689457;
	bh=zw0YypeyUOtbsvNLDcCQN4Jpmbno3mcoT12qeECqU80=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NkcgzlgyvB5v/KAoevzCXm4WGfsr7DDJ4Vo/KDdyarGH5pWfKF+NOC5ToafDT39kN
	 bsaS7g3WLho8eVVeJdAJlnqVa9TOCw29azuqYl1O6U2ZNkokTHLeQmK4JaLJHhF8Jl
	 U9m7/AmUyfI8fmte+JLqbvroeFFzNVZ7DuwkzSbtuSh8k+hSUYC8ePOd0GD5A+vzS6
	 q0GtYxVsenRzxXhQOa/84idGphD2Pp2tLG8XmXt8JvrmwsTLL7bC2VfIU9iv7n+Q4b
	 jImOMJirq5VhGcXDGxUlWz58ErEIH9WZ15jOjvoYiv1Ao6RLOoTU4jviMyyfl8HXwS
	 VLU0Rfxhi4cXw==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wiB6l-00000000kWy-3h18;
	Fri, 10 Jul 2026 15:17:35 +0200
Date: Fri, 10 Jul 2026 15:17:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Daniel Lundberg Pedersen <dlp@qtec.com>
Cc: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: Bad wrapping in some tables
Message-ID: <20260710151735.40aa2941@localhost>
In-Reply-To: <82c74030-88c6-4bf2-ae76-41c2a68ced61@qtec.com>
References: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
	<87pl0yr9ah.fsf@trenco.lwn.net>
	<DJUP0UXLLHJ0.3P121A982R9TP@ritovision.com>
	<82c74030-88c6-4bf2-ae76-41c2a68ced61@qtec.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dlp@qtec.com,m:rito@ritovision.com,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67299-lists,linux-media=lfdr.de,huawei];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,localhost:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D42D673B2DE

On Fri, 10 Jul 2026 14:38:06 +0200
Daniel Lundberg Pedersen <dlp@qtec.com> wrote:

> Hi
> 
> On 10/07/2026 08:55, Rito Rhymes wrote:
> > I just got caught up to speed, reviewing the links, the regression, the
> > prior state and other relevant context.
> > 
> > Daniel, thanks for pointing out the regression. As Jon said, it's
> > always good to inform the author of the patch, and I'd have been happy
> > to discuss and test out solutions with you.  
> 
> Sorry about that, I'll remember that for next time.
> 
> [...]
> > 
> > The best solution:
> > Make targeted changes to the tables to make them fundamentally behave
> > better on smaller screen sizes.
> > 
> > I began this effort with:
> > [PATCH v3] docs: wrap generated tables to contain small-screen overflow
> > 
> > Jon hadn't followed up after testing out the fix with CSS and my
> > explaining why the wrapper was the better approach, because it prevented
> > regressions. That fix is a start, but more would need to be done.
> > 
> > If Daniel is willing to help test out table fixes and provide examples
> > of regressions, and if Jon has the bandwidth to review my patch
> > submissions to improve the tables, I am willing to tackle this systemic
> > issue, which will result in this issue being resolved as well.  
> 
> I don't mind testing some stuff if you want me to, but as Hans mentions 
> the media docs is full of tables which have these issues, from a quick
> check, almost all sub-pages of the Function Reference are affected:
> 
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/user-func.html

On media, I guess the more complex tables with long widths are the pixfmt 
ones like those:

	https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-rgb.html
	https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-packed-yuv.html

It is a good place to check for issues like that.

Please see the patch I submitted:

	https://lore.kernel.org/linux-doc/1950557405f1150acb1de50de1801f2413223b87.1783673996.git.mchehab+huawei@kernel.org/

It moves width support at the html output from previous
millennium SVGA-resolutions era to modern age.

-- 
Thanks,
Mauro

