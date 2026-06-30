Return-Path: <linux-media+bounces-66098-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YrSkMBHDQ2oEhAoAu9opvQ
	(envelope-from <linux-media+bounces-66098-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:22:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB966E4CA7
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:22:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=asNYKdG9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66098-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66098-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5FA8830286C3
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 13:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC43413D96;
	Tue, 30 Jun 2026 13:06:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72F141322F;
	Tue, 30 Jun 2026 13:06:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824802; cv=none; b=nTp4H8kDlsMZ5Ahne4W75opOIJqZp50UvK9WbZitekuaJxWA0/axwopYUfB5naDLzCLV+72lqAAQf59dajVVmuYjTJq01iDe+emDLavOsfSZnBRdzJ+vkIOGTg0TZeRTxuxAfDAEZPb4kCb7pwyTw18iJosOUoeAValW21Cai4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824802; c=relaxed/simple;
	bh=QKlrhyzobVAhmV/m1MnqprcVY1OLo/Qe+7LW1AiM6Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeaygC9bnTYpomn9a78GiL4blKCliI2iPvHO7WJkO8toTRTkNmyVy5uGxzd+iw7evRl3hty+2KrdOdbzEQsjzp7sWtLgwuHUdKWy0oCvHwITNSZ0JmqQXgEBpT1502lt4rUErWccciZe+BJsQ9utlUbL4Dlvi+Tvr/YX5T9XOcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=asNYKdG9; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782824799; bh=QKlrhyzobVAhmV/m1MnqprcVY1OLo/Qe+7LW1AiM6Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=asNYKdG9k5OKrOXLTL8geoeQ4xfuIry1KFnvPE0p3GIfyDq9gX5hbx9hQgNXCgllB
	 C+kcDTK4o+m1ltH4D628t/FMy4uQHZujeZ0P3u7s2HxRFWHqPovhog94WufpweNwyE
	 QXA/LjLrMFP8YzA96HkGqTiFmJYL1zlDM64fmZyrw+db6NBIGonFeBeyvUUZrV5b51
	 kXPDAwi/3YAz8dA8idJ/tFU6Qbekbwtz7iXiVTf6UGM+Je71gYQ4sfo4784MoWob5Q
	 e1LaP9NXe2+mqaqSHI+q6hP8+tr+vbKuEZONvkwCxe9Dr/I6UwdzErvw7MuVjZmon+
	 ucmR+jKXeL4UQ==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 0E01C41567; Tue, 30 Jun 2026 14:06:39 +0100 (BST)
Date: Tue, 30 Jun 2026 14:06:38 +0100
From: Sean Young <sean@mess.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: dt-bindings: rc: Sync keymap list with latest
 list
Message-ID: <akO_XqVQ-S72dveD@extorris.mess.org>
References: <cover.1782300922.git.sean@mess.org>
 <2d87b050777b95ffe8adbdf156d2fb1de14c4dfb.1782300922.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d87b050777b95ffe8adbdf156d2fb1de14c4dfb.1782300922.git.sean@mess.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66098-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mess.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[extorris.mess.org:mid,vger.kernel.org:from_smtp,mess.org:dkim,mess.org:email,mess.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCB966E4CA7

Hi Rob, Krzysztof,
 
Could I have an Acked-by: please?

Much appreciated,

Sean

On Wed, Jun 24, 2026 at 12:39:21PM +0100, Sean Young wrote:
> The list is out of sync, so add missing entries, remove obsolete
> entries and sort.
> 
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  Documentation/devicetree/bindings/media/rc.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
> index dedc5a4b81ec..43d84296e70d 100644
> --- a/Documentation/devicetree/bindings/media/rc.yaml
> +++ b/Documentation/devicetree/bindings/media/rc.yaml
> @@ -122,10 +122,10 @@ properties:
>        - rc-proteus-2309
>        - rc-purpletv
>        - rc-pv951
> -      - rc-rc5-tv
>        - rc-rc6-mce
>        - rc-real-audio-220-32-keys
>        - rc-reddo
> +      - rc-siemens-gigaset-rc20
>        - rc-snapstream-firefly
>        - rc-streamzap
>        - rc-su3000
> @@ -147,11 +147,11 @@ properties:
>        - rc-tt-1500
>        - rc-twinhan-dtv-cab-ci
>        - rc-twinhan1027
> +      - rc-vega-s9x
>        - rc-videomate-k100
>        - rc-videomate-s350
>        - rc-videomate-tv-pvr
>        - rc-videostrong-kii-pro
> -      - rc-vega-s9x
>        - rc-wetek-hub
>        - rc-wetek-play2
>        - rc-winfast
> -- 
> 2.54.0

