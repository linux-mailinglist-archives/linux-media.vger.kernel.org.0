Return-Path: <linux-media+bounces-63689-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e8Z3EhepIGqr6QAAu9opvQ
	(envelope-from <linux-media+bounces-63689-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 00:22:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7496D63B8BE
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 00:22:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="G5rTgAy/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63689-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63689-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C965303747B
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 22:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A444CA298;
	Wed,  3 Jun 2026 22:19:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAC744102A;
	Wed,  3 Jun 2026 22:19:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780525189; cv=none; b=se7mJo2ZI7fT1w1VKW/PGN6z4K6k5exKcRQvGP6cid0ARcdsfHYJuCEjc5NuAo+0wUWD0K/DlMA8XAHkpvdz6eoZXR+9nt4zuAH/0ukSDIx9DMtDdJeGNIJP98iYez5b1SV6HNukMjIDbe19gWYqiciFqiHEFnqif54uRioBaqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780525189; c=relaxed/simple;
	bh=BR5aeo3iQ0JB7wmfVojceVJfH40c/dFhkFNuU0LfjOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sH7Tmksr+RTlx6BBmHP7Z3BmeUIu34+hLYSl2EjulI2aTNB9GF0eYgOE97T8dlin5SEnGL06gWDUxsDzfDY7nH95rGnEst38Uy1/1bRKsXzzbr8l2looV86qVKV0uJFIs40NkxHpwdUwB0GxVPJNkJetcqfTnc87TtXOFzdgQ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5rTgAy/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23691F00893;
	Wed,  3 Jun 2026 22:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780525188;
	bh=nCMVhv90Nn2BMuaPqjJMi+G5kJwoeTSNQGM33sLQElU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G5rTgAy//7uZaKLPzJtZYJ9/paDknpsfZbE+ns63NecgWCdRiVDPg7O8C/y0lD0+7
	 +MElp7RFTWuSh4RLRtuIwmQTbvgBddlv2J29IJautoRyCnKpIN4wQ1/ObCMjjTmvRR
	 P416Nj8EMnbF9R85BnIWJyQ/3nRnrORbCp+YyQemcXcXWni5cVvUi6kdXljmOhxS/X
	 x6v77QIam2y8zhI6kUD3lAk/q+Yi8MqRzlixk62fpKFCwKndRFDKwVop781yIgDP05
	 wtZfrgEQHHkhSGi3HJUyGdJU5Tb7bByleViLnGteRiDqzzbp82QQoZnHr5N1fvwpXA
	 3uQSavVfb2nDQ==
Date: Wed, 3 Jun 2026 17:19:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-doc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>, linux-input@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: net: remove obsolete mdio.txt
Message-ID: <178052518477.2276321.5278048214870332622.robh@kernel.org>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
 <20260603-b4-remove-redirect-stubs-v2-1-c8c19876ab64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-b4-remove-redirect-stubs-v2-1-c8c19876ab64@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63689-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:akash.sukhavasi@gmail.com,m:hkallweit1@gmail.com,m:davem@davemloft.net,m:olteanv@gmail.com,m:linux-media@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:linux-doc@vger.kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,m:devicetree@vger.kernel.org,m:horms@kernel.org,m:andrew@lunn.ch,m:pabeni@redhat.com,m:lee@kernel.org,m:krzk+dt@kernel.org,m:netdev@vger.kernel.org,m:edumazet@google.com,m:linux-input@vger.kernel.org,m:linux@armlinux.org.uk,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:kuba@kernel.org,m:akashsukhavasi@gmail.com,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,lunn.ch,redhat.com,google.com,armlinux.org.uk,nvidia.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7496D63B8BE


On Wed, 03 Jun 2026 15:42:18 -0500, Akash Sukhavasi wrote:
> mdio.txt has been a single-line redirect to mdio.yaml since
> commit 62d77ff7ecbf ("dt-bindings: net: Add a YAML schemas for the
> generic MDIO options"), which introduced the .yaml schema and reduced
> the .txt to a stub in the same change. The .yaml has the same filename
> in the same directory, making this redirect unnecessary for
> discoverability.
> 
> No files in the tree reference mdio.txt and it has not been touched
> since June 2019. Remove the obsolete stub.
> 
> Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/mdio.txt | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


