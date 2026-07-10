Return-Path: <linux-media+bounces-67308-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I73qCt8QUWrE+wIAu9opvQ
	(envelope-from <linux-media+bounces-67308-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 17:33:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A4473C4AF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 17:33:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=Ol8D3z8m;
	dmarc=pass (policy=none) header.from=lwn.net;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67308-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67308-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77EC3302A507
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 15:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28D23F2101;
	Fri, 10 Jul 2026 15:27:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C297D2F8E98;
	Fri, 10 Jul 2026 15:27:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783697253; cv=none; b=IZrKgcPfca9WCEc1IRYUVpQ7E6f5G5B7SewC0mxLFDNtIzrjfuNOGbqC4Y2a3D7ycGYOOtDpVd2eAr0u/rGjMVxAdAgJlSfboL8lvPDlZrPctaPvCQfje1qWcapYvz1NYnINjIrFvBQ1V4frSoEBeQ+IopMWcrHbml2Y4Uh3BlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783697253; c=relaxed/simple;
	bh=TjcdxBN+YS1qIld4J/pIkflOExyvQiuyJWBhdY6fTZ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FrBPynvh43f3s6gWRaZ4v9+yTzTftiovn9N276uK/95uwh+bmGyD+LODJRsSMEElbNBhUGlMTZVDJeOS1cqbs9e6T2kM8sI0BQekZKrEqjTvwrVQwYPUDFy1G5t166MLBxY0si4MOIyXNDQleAUUPNi6qX+6gsfhDS0Gx9mmFAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Ol8D3z8m; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A2FD340E3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783697244; bh=vvQEoUVE82+owdtPfVQDI6JM2NHa6BLxY4xHAZI2FDg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ol8D3z8mjcd9ikJthdlEl3pUbJyntm8W94iq/eaTswXjOzuXRYVzx1OT0BKQU++sw
	 heTSti0u7dOubbBGZ5JSlp04dyrXxn4U+wqz4P9FJ4/kdswS+bxb4u00iX7a0puqKu
	 NGBufwut/1SP111sUH6K01GtIe+Vx9DeghhP7pgdHqQaQvZSQzSZj///CkfP1NJKCH
	 zfr9VfCNN6vIBQHQAr+HTtWHB+fcPlSfJ8IRhM7iMdO8jNjqH3G0F8psdhOL0aFtRA
	 9u3BZubarr2i2XoYf2tNO/A6lLmEqEJ49GITHbvcrwG4xx6BzFonn0+vBYFwHivkIq
	 YeFY4ZWNRBRaA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A2FD340E3D;
	Fri, 10 Jul 2026 15:27:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Clinton Phillips
 <clintdotphillips@gmail.com>, Daniel Lundberg Pedersen <dlp@qtec.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Petr Vorel <pvorel@suse.cz>, Randy Dunlap
 <rdunlap@infradead.org>, Rito Rhymes <rito@ritovision.com>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH] docs: custom.css: don't limit randering to old 800px
 monitors
In-Reply-To: <1950557405f1150acb1de50de1801f2413223b87.1783673996.git.mchehab+huawei@kernel.org>
References: <1950557405f1150acb1de50de1801f2413223b87.1783673996.git.mchehab+huawei@kernel.org>
Date: Fri, 10 Jul 2026 09:27:23 -0600
Message-ID: <87fr1qn9us.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67308-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,qtec.com,suse.cz,infradead.org,ritovision.com,linuxfoundation.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab+huawei@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:clintdotphillips@gmail.com,m:dlp@qtec.com,m:hverkuil+cisco@kernel.org,m:mchehab@kernel.org,m:pvorel@suse.cz,m:rdunlap@infradead.org,m:rito@ritovision.com,m:skhan@linuxfoundation.org,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,trenco.lwn.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:from_mime,lwn.net:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86A4473C4AF

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Right now, base.css style imposes a maximum limit of 800 horizontal
> pixels to be compatible with very old SVGA monitors.
>
> Remove such artificial limit, letting the output to be adjusted to
> the browser windows size.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/sphinx-static/custom.css | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index 5aa0a1ed9864..1055db7dc1dd 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -3,6 +3,8 @@
>   * CSS tweaks for the Alabaster theme
>   */
>  
> +div.body {  max-width: none; }
> +

800px is clearly a dumb limit, I have no problem changing that.  Going
to arbitrary width doesn't seem good for readability, though.  What do
you think about, instead, setting a limit in a resolution-independent
say, to (say) 60em?

Thanks,

jon

