Return-Path: <linux-media+bounces-63690-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YGW5I2CpIGq46QAAu9opvQ
	(envelope-from <linux-media+bounces-63690-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 00:23:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EF963B8E8
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 00:23:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="R9gQ/xod";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63690-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63690-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81AF83084446
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 22:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD724D2EC6;
	Wed,  3 Jun 2026 22:20:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6C744102A;
	Wed,  3 Jun 2026 22:20:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780525208; cv=none; b=sXtOTG8FXL3qN+QTIr4XRuVNiRZpF/reVXshj4ogBld8qe1OwifFertxwOOTQBu0p00Y3E9DRCze7ncFtE6cIwiJnzXlnSmPtS6mrXqFeeWeASWyBy9cEPmw/SQLqeRks4g8OLT+7bghMrjvooB4IO8IDz9fYKozlBijUf13uTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780525208; c=relaxed/simple;
	bh=KIPD2k4KC841fZrtnLM0e3w75FpgOpVojJjT05J4mw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIcBJqSO1RddINJjHNYar9uo9ozZ0pMQLisUog833BdWDL46fARglOUCjQyZr0757ZxPokTO0sA1D0QqMUcjFXqpD1EV0aoQLMI9aHdzk7fN9/LHim+SHJWCMoT8J9ANMPkV/rv8MVsng3m+Rwlj3yoZelXPXdEZxubiRWP8Y3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9gQ/xod; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38F21F00893;
	Wed,  3 Jun 2026 22:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780525206;
	bh=v8sHDp4ONRrp+Yvm4SPIIbT9oKkONNFZofdrX7Tp+oY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R9gQ/xodrJUI1h4vSNfSeWebqK1i1UeRekDQpBvmQOGXqpTdKBXi7WiJeFmuublS4
	 AtmN19IRbF9/IgZMylKffAef3HOJ/b98eCqn0bYLSwr4ZJt6KBesSpxaKj6vO89OdZ
	 xl2tlaj4p1RFhrVL0DJtok6K1UGMy6jVMQBgAjOcM6Bi0IqgypRnhTHbuUZT+4WZH6
	 F/j7RVkUnJ/WaqMp/NygcPDIalRJDT71CcLIAlcBfECrEgh2n+kE7beQWM9j2t6hnw
	 9f81hZGzZQTS3NVh4ljltou7wn3xUqAHXQK5OmezEi9t01tF/oKiso+exCqgNBLfRO
	 5o2HfXLPcbmaA==
Date: Wed, 3 Jun 2026 17:20:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
	Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: media: remove obsolete rc.txt
Message-ID: <178052520503.2279647.12293343206224505400.robh@kernel.org>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
 <20260603-b4-remove-redirect-stubs-v2-2-c8c19876ab64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-b4-remove-redirect-stubs-v2-2-c8c19876ab64@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63690-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:akash.sukhavasi@gmail.com,m:kuba@kernel.org,m:jonathanh@nvidia.com,m:pabeni@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:hkallweit1@gmail.com,m:edumazet@google.com,m:devicetree@vger.kernel.org,m:horms@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:davem@davemloft.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:andrew@lunn.ch,m:krzk+dt@kernel.org,m:linux@armlinux.org.uk,m:linux-doc@vger.kernel.org,m:netdev@vger.kernel.org,m:olteanv@gmail.com,m:dmitry.torokhov@gmail.com,m:thierry.reding@kernel.org,m:akashsukhavasi@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,redhat.com,vger.kernel.org,gmail.com,google.com,davemloft.net,lwn.net,linuxfoundation.org,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5EF963B8E8


On Wed, 03 Jun 2026 15:42:19 -0500, Akash Sukhavasi wrote:
> rc.txt has been a single-line redirect to rc.yaml since
> commit 7c31b9d67342 ("media: dt-bindings: media: Add YAML schemas for
> the generic RC bindings"), which introduced the .yaml schema and
> reduced the .txt to a stub in the same change. The .yaml has the same
> filename in the same directory, making this redirect unnecessary
> for discoverability.
> 
> One file still references rc.txt, forcing readers through an extra
> hop to reach the .yaml. The stub has not been touched since August
> 2019. Update the reference in hix5hd2-ir.txt to point directly to
> rc.yaml and remove the stub.
> 
> Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/hix5hd2-ir.txt | 2 +-
>  Documentation/devicetree/bindings/media/rc.txt         | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


