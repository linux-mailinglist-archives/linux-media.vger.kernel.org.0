Return-Path: <linux-media+bounces-63691-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EcgcNtipIGrO6QAAu9opvQ
	(envelope-from <linux-media+bounces-63691-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 00:25:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA0763B911
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 00:25:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BeAvQ7WQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63691-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63691-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 452B330ACF1A
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 22:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B434D2ED2;
	Wed,  3 Jun 2026 22:20:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EABF438FEF;
	Wed,  3 Jun 2026 22:20:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780525237; cv=none; b=m3flSFx1lvvcW9HJxc7BZP50GuSea9xW7VPR35Owcingd+sOxVvhYhU3mm0gKcZkdvcTYzlrzCph7CX4Z0bEkuDRCFK2R+WqgtGtQ6/dNgAInjhCsTPj1YlDdSXlK/DqUXM4Lp/IWP8UshW2dqUqBet9ykjquIkLK8qW4OMOxe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780525237; c=relaxed/simple;
	bh=+tqJ7VvjI0EpIZ4rEOJSSD0tYpFIFV80Tae3omoKZ04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqitJRqqPWG4L2dGyTpW5Dno9MqDhXIQAFSqA/LZLjfENOstofAMhBkn5UFjaJS88vE9oIzFJPoRUR6ECdUgyZNCxqINReh0j2L8VxfeL7Gk5gtyqYapToLrDadsCzyF85oRCc/MKAwxXipN6PoL4RL4K5+2f+Hp9vdlf3u0Xyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BeAvQ7WQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A683E1F00893;
	Wed,  3 Jun 2026 22:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780525235;
	bh=JGNHTQ73RJVqb1W0KyxoFGA1Bc+H2MChRkwAq6lU+c8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BeAvQ7WQY/o5EULWLEjuO8FLWOpB3WvIY9XeUH7PumxbW7XSJPDxJWSfdF1A791l4
	 oqDPA0yekJZxdqPprxK4B/EFVYHsNc41fGRSODAtOxZB+anpRYMRitraeCPeXSxs+k
	 VdpAtUQJDJQoAIwHSCczuBWSP6tVnVuk/mfdXyupMAs5MvxauinnqEm9f4eZTlQ2M/
	 PoFH6qHkcp7wTBae4D6iQ1PfQsuzlV9ohOz4XT6pXJvatnHYK69YHkfCTozdZ9HGmd
	 gZcZrbuKqGoqqw3MGOAYEmJNFBAYoeimCL0zjC/DGJ/tp9xJww6y8R1crMRG37fr75
	 aEuoMh31nhfUg==
Date: Wed, 3 Jun 2026 17:20:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-media@vger.kernel.org,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-input@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	linux-tegra@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: net: dsa: remove obsolete dsa.txt
Message-ID: <178052523336.2284212.2212106139200660430.robh@kernel.org>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
 <20260603-b4-remove-redirect-stubs-v2-3-c8c19876ab64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-b4-remove-redirect-stubs-v2-3-c8c19876ab64@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-63691-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:akash.sukhavasi@gmail.com,m:dmitry.torokhov@gmail.com,m:linux-media@vger.kernel.org,m:thierry.reding@kernel.org,m:linux-input@vger.kernel.org,m:edumazet@google.com,m:linux-tegra@vger.kernel.org,m:skhan@linuxfoundation.org,m:davem@davemloft.net,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:mchehab@kernel.org,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:horms@kernel.org,m:kuba@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jonathanh@nvidia.com,m:lee@kernel.org,m:linux@armlinux.org.uk,m:pabeni@redhat.com,m:olteanv@gmail.com,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:akashsukhavasi@gmail.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,google.com,linuxfoundation.org,davemloft.net,lunn.ch,nvidia.com,armlinux.org.uk,redhat.com,lwn.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CA0763B911


On Wed, 03 Jun 2026 15:42:20 -0500, Akash Sukhavasi wrote:
> dsa.txt has been a redirect to dsa.yaml since commit bce58590d1bd
> ("dt-bindings: net: dsa: Add DSA yaml binding") introduced the .yaml
> schema. The .yaml has the same filename in the same directory, making
> this redirect unnecessary for discoverability.
> 
> Two files still reference dsa.txt, forcing readers through an extra
> hop to reach the .yaml. The stub has not been touched since August
> 2020. Update references in lan9303.txt and
> Documentation/networking/dsa/dsa.rst to point directly to dsa.yaml
> and remove the stub.
> 
> Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/dsa/dsa.txt     | 4 ----
>  Documentation/devicetree/bindings/net/dsa/lan9303.txt | 2 +-
>  Documentation/networking/dsa/dsa.rst                  | 2 +-
>  3 files changed, 2 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


