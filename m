Return-Path: <linux-media+bounces-63693-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id On63NryrIGom6gAAu9opvQ
	(envelope-from <linux-media+bounces-63693-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 00:33:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD2A63B9A9
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 00:33:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZgaVmRuf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63693-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63693-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C76F73057779
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 22:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BEBC4D8D8A;
	Wed,  3 Jun 2026 22:26:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA3D36EA88;
	Wed,  3 Jun 2026 22:26:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780525601; cv=none; b=urQxwX+jPrvl1zKQ+BEIsNgUbxlPGiwrdl8lxyHShEGMVJtWVJ40CX1zUqDu+S31bT+US/3EBuoQ/Qi0lVqGGxDETxxWhIAaSKL/kOr4+LmOVTAvQ9RgVeFeWWPFKKwd3tyVxnqqPUyANV+nAPUg6dIKq+IQpXfcNPXRJoia4Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780525601; c=relaxed/simple;
	bh=ZywTaRy1msXOxaGd4EYGfCCbubvXJ1Jk0ITU8WIeDMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ys12XYxNWMEYdzMLo33OCzzI/SvWSUiEQEUDm9++a43JjZccvmHhJVWpv2TntdINxB0LreVuAH67gn8YnoGTUjPU6tsBHu+3t3PAasnNZm4pJX9dUnr4tCRO8gP+eZ2lvbgTCAzKP0JRzAZIJ9+MGwmp1t5AF1f/gWeZpAQrZdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgaVmRuf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1463C1F00893;
	Wed,  3 Jun 2026 22:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780525600;
	bh=RrIKouTk6LrlkPuhry9kKUBhABYZtLMPUz5HqEvghk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZgaVmRufssWWHj+XbZOoJjIk1UlxS+Y70wvbAoI1JonWba43ThzW9mscyoB3MkSdo
	 D04MkQT8kMXwvLvk5C0ptnEM+187F8/JvU57y5u5TCa8hGWyKMquvtz/PJ0cnX5WOS
	 LpaX6F+s2ym1XpM92HT8VFcwF7pIOMnFRvFamMlGLna1lARiJTIP02HWi+pAjvXb8C
	 2U1Bb99gk4u4np3xAEyE+PdDxqszFOno/y7fmqMLLAaNuagG2l/2MnJB/xrR8cK5Yr
	 2wM0wnGy0aGcsc9ys4SSgxbaYSXWH6nlUp5hfDbd+CHwlAjY0/bTO2UnqIDbenP5st
	 yWeaDqREmmHzg==
Date: Wed, 3 Jun 2026 17:26:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>, linux-tegra@vger.kernel.org,
	linux-input@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Simon Horman <horms@kernel.org>, devicetree@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Lee Jones <lee@kernel.org>,
	netdev@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 4/4] dt-bindings: input: remove obsolete
 matrix-keymap.txt
Message-ID: <178052559618.2296868.8781332297681333925.robh@kernel.org>
References: <20260603-b4-remove-redirect-stubs-v2-0-c8c19876ab64@gmail.com>
 <20260603-b4-remove-redirect-stubs-v2-4-c8c19876ab64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-b4-remove-redirect-stubs-v2-4-c8c19876ab64@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-63693-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akash.sukhavasi@gmail.com,m:conor+dt@kernel.org,m:davem@davemloft.net,m:andrew@lunn.ch,m:linux-tegra@vger.kernel.org,m:linux-input@vger.kernel.org,m:mchehab@kernel.org,m:hkallweit1@gmail.com,m:thierry.reding@kernel.org,m:linux-media@vger.kernel.org,m:krzk+dt@kernel.org,m:kuba@kernel.org,m:olteanv@gmail.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:dmitry.torokhov@gmail.com,m:jonathanh@nvidia.com,m:horms@kernel.org,m:devicetree@vger.kernel.org,m:pabeni@redhat.com,m:lee@kernel.org,m:netdev@vger.kernel.org,m:skhan@linuxfoundation.org,m:linux@armlinux.org.uk,m:corbet@lwn.net,m:akashsukhavasi@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
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
	FREEMAIL_CC(0.00)[kernel.org,davemloft.net,lunn.ch,vger.kernel.org,gmail.com,google.com,nvidia.com,redhat.com,linuxfoundation.org,armlinux.org.uk,lwn.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DD2A63B9A9


On Wed, 03 Jun 2026 15:42:21 -0500, Akash Sukhavasi wrote:
> matrix-keymap.txt has been a single-line redirect to
> matrix-keymap.yaml since commit 639d6eda3b80 ("dt-bindings: input:
> Convert matrix-keymap to json-schema"), which introduced the .yaml
> schema and reduced the .txt to a stub in the same change. The .yaml
> has the same filename in the same directory, making this redirect
> unnecessary for discoverability.
> 
> Eight instances across six files still reference matrix-keymap.txt,
> forcing readers through an extra hop to reach the .yaml. The stub has
> not been touched since June 2020. Update all references across input
> and mfd binding documentation to point directly to matrix-keymap.yaml
> and remove the stub.
> 
> Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> ---
> v2:
> - Patch 4/4: corrected commit message (eight references in six files,
>   not eight files), Sashiko review.
>   https://sashiko.dev/#/patchset/20260529052246.4934-1-akash.sukhavasi@gmail.com?part=4
> 
> v1: https://lore.kernel.org/all/20260529052246.4934-5-akash.sukhavasi@gmail.com/
> ---
>  Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt    | 2 +-
>  Documentation/devicetree/bindings/input/clps711x-keypad.txt    | 2 +-
>  Documentation/devicetree/bindings/input/matrix-keymap.txt      | 1 -
>  Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt | 2 +-
>  Documentation/devicetree/bindings/input/pxa27x-keypad.txt      | 2 +-
>  Documentation/devicetree/bindings/input/st-keyscan.txt         | 2 +-
>  Documentation/devicetree/bindings/mfd/tc3589x.txt              | 6 +++---
>  7 files changed, 8 insertions(+), 9 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


