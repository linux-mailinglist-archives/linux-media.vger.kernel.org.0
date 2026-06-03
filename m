Return-Path: <linux-media+bounces-63692-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kFoGNSupIGqy6QAAu9opvQ
	(envelope-from <linux-media+bounces-63692-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 00:22:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CD863B8CD
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 00:22:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=k3GeO6pF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63692-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63692-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37E0B3025905
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 22:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7744D2ECE;
	Wed,  3 Jun 2026 22:21:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A8F472776;
	Wed,  3 Jun 2026 22:21:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780525309; cv=none; b=PANItH5NSuLYbkDMYx+CGV+Wvik8KMrb2VBlciIWhzkDC6hC/mw5nqxXXZ560BTNPFg4JoW+cs8tr1erFo82Dn+Bi0yfRsqXEMcRzP+06Gbew6cXyrXeRUqNYzk3OkrKsebC/BKv4tS2+HgJ+7GqqcSdpzDuhUGRTsIIwktS/hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780525309; c=relaxed/simple;
	bh=cbcrkyAVo7R7YIrTwCIYoGljOff0/0nntSX8Png87Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0QdAR5rMQQriTq5kIovZ3AWrZVOuZSXBMmv+8ytCdvgZFOwEsRC1oZS0yclYt1jQ0xm0zy/MZ0Sf2Ve7dGyupolSdSCzA9eg6XlFW0goGVGoxkBeQEZ/4gHAJpR3xLRYj71tMr3/+dy0GS0kWwj43xi26p4c9KAwMaaPGXz7Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3GeO6pF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12131F00893;
	Wed,  3 Jun 2026 22:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780525307;
	bh=7ZiwdJjSjUT++FcwvQEJub8dg8X972gmC/QxoFtYMik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k3GeO6pF8HGEGNPckQC1LsicotRrfZ8rR3azmj32PCdJJi25UETIuUML2Hht2ZgPS
	 LgDOPrcq3YUmSrhnM/6GjnAuiQEhX+URjgP21JQUA+uRj6a8At9wlNZO0TBhjzMfWh
	 Z06ruTT0zhUahfnNGh0LMCT4UqNGE+r4kl/fkmOHUc+uoomDMOKsoKmzbN58jJobKE
	 w6rGUKLwlZ0PvxN29EtFjscE2AHw4hSdainVuv3+Kw0Twh823/ftcD5ZEybLUDBekR
	 rfkf7i/MXw/FYLUwTExMyqgjhathkdaj2eV3BSvESev2uMM/LEqQYspWplk6Rb7Vjs
	 qeRhayafgEQNg==
Date: Wed, 3 Jun 2026 17:21:46 -0500
From: Rob Herring <robh@kernel.org>
To: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee@kernel.org>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-input@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 0/4] dt-bindings: remove redundant .txt redirect stubs
Message-ID: <20260603222146.GA2285556-robh@kernel.org>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63692-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:akash.sukhavasi@gmail.com,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:olteanv@gmail.com,m:horms@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:dmitry.torokhov@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:lee@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:akashsukhavasi@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,lwn.net,linuxfoundation.org,nvidia.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0CD863B8CD

On Wed, Jun 03, 2026 at 03:42:17PM -0500, Akash Sukhavasi wrote:
> Several .txt files under Documentation/devicetree/bindings/ contain
> only a redirect notice pointing to a .yaml schema with the same base
> filename in the same directory. These stubs were useful during the
> .txt to .yaml transition but are now redundant, since the .yaml is
> discoverable by name. Meanwhile, other documentation still references
> some of these stubs, forcing readers through an unnecessary extra hop
> to reach the actual schema.
> 
> This series removes four such stubs and updates all remaining
> cross-references to point directly to the .yaml schemas.
> 
> Other redirect stubs in the tree were evaluated and intentionally
> kept:
> 
>  - Stubs pointing to .yaml files with different names (e.g.,
>    spi-bus.txt -> spi-controller.yaml) serve as breadcrumbs for
>    the renamed schema.
> 
>  - Stubs pointing to multiple .yaml files (e.g., nvmem.txt ->
>    nvmem.yaml and nvmem-consumer.yaml) convey that the content
>    was split.
> 
>  - Stubs pointing to .yaml files in a different directory (e.g.,
>    reset/st,stm32-rcc.txt -> clock/st,stm32-rcc.yaml) serve as
>    cross-directory pointers.
> 
> Two additional same-name, same-directory stubs (leds/common.txt,
> regulator/regulator.txt) have significantly more cross references
> and will be addressed in a follow-up series.
> 
> v2:
> - Patch 4/4: corrected commit message (eight references in six files, not
>   eight files), Sashiko review.
>   https://sashiko.dev/#/patchset/20260529052246.4934-1-akash.sukhavasi@gmail.com?part=4
> 
> v1: https://lore.kernel.org/all/20260529052246.4934-1-akash.sukhavasi@gmail.com/
> 
> Patch 1 supersedes my earlier standalone submission:
> https://lore.kernel.org/all/20260523004223.3045-1-akash.sukhavasi@gmail.com/
> 
> Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> ---
> Akash Sukhavasi (4):
>       dt-bindings: net: remove obsolete mdio.txt
>       dt-bindings: media: remove obsolete rc.txt
>       dt-bindings: net: dsa: remove obsolete dsa.txt
>       dt-bindings: input: remove obsolete matrix-keymap.txt

This goes to 3 different subsystems, so it should be 3 different series. 
No need to resend just for that.

Rob

