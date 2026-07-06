Return-Path: <linux-media+bounces-66700-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P/pTJ65fS2pgQQEAu9opvQ
	(envelope-from <linux-media+bounces-66700-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:56:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2914670DD39
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:56:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oL0ztYX+;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66700-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66700-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61DC5301476B
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 07:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FAA3B3C14;
	Mon,  6 Jul 2026 06:59:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962703ED11D;
	Mon,  6 Jul 2026 06:59:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321171; cv=none; b=cHcd87+kLH56dTlxX7j8tPSpyNL5MQ/yDW2yGiJIwvvqPc7HxY5+r0Phdlh4/Yddew0bZaUUCNO+aRRsdf7+HlLbI/4/AB0tcDahBXtIdYxdBRSODxNc9P/XMgtpkyGF2u/1tZNsPdKnDY5lJDBNsnYBA+nkr7eufwr770fMkbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321171; c=relaxed/simple;
	bh=M97KqKFg5q1siZteL2hVdqd3nKwNKH7S0Qhj/K+5i0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqeGCbKq9Y5vddByT+ZjeLXwerCkjdNfUCtqLtTG26aKHZtuIEgf+tWeEUIlN5DHarxXZ1dABWFye7i8a0Rk+l2Z3fU2sKqUzZxoq90VYG+DHLGCa6vuGGDP9fIIaI8pFSfyFnbs+NMQ1EBNjXw7L9W4GTPvfKrfKLpjSQal8H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oL0ztYX+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4BA1F000E9;
	Mon,  6 Jul 2026 06:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783321158;
	bh=y+lATJnRQ7o/rbZhmJ9nDyBRy1H+M8W2CRQDVnlKZxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oL0ztYX+YNmtoYG/oyXLUbewaxBWatkFUwLtGfQ86IxklFQhTfIx26NBKNAS+OrrX
	 JP1c2umXnXGYQFDiE4fl9s5alDIRS0YuDD+GO/Op/k+MOoWQswTLgAvYD/vCkCkPri
	 oB3nLJmWKBMxGBqVmUObu9kNh/r1AHQJD5g2quRDfhhjJEU5mzVr2a9rlj//nto0Eh
	 RMxhojNjZ+hNQ1Wmo0lkcDxVIi3V7b/KxQUJmsE729kB8D98CCqJFwAf/Z1uiFXFB3
	 9vRX7wE8ZxPWVIy/vvABsFwe1jBDjqMLDIWpygLllZzlfrfHK0k1eX4sUuUZwOhCV2
	 97XS0lIkljExg==
Date: Mon, 6 Jul 2026 08:59:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR
 compatible
Message-ID: <20260706-quantum-celadon-tench-c2f28d@quoll>
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
 <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66700-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:xianwei.zhao@amlogic.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,vger.kernel.org:server fail,sto.lore.kernel.org:server fail,amlogic.com:server fail,quoll:server fail];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,amlogic.com:email,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2914670DD39

On Mon, Jul 06, 2026 at 02:43:27AM +0000, Xianwei Zhao wrote:
> Document the Amlogic A9 IR controller compatible string. The A9 IR
> controller shares the same implementation as the Meson S4 IR block,
> so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
> compatible.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


