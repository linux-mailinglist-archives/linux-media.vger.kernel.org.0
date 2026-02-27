Return-Path: <linux-media+bounces-53666-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zk/iKJNKoWn7rwQAu9opvQ
	(envelope-from <linux-media+bounces-53666-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 08:41:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC83D1B4071
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 08:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B47AC307CE91
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 07:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADE636BCC6;
	Fri, 27 Feb 2026 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpG7zHTp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17B61397;
	Fri, 27 Feb 2026 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772177998; cv=none; b=t5GiKBzNd35KHfDEUO/CQ+yLmyZqhcNotbya7pAC1SVugr5GZ5GEcyYIHlgLeLqh6g8Q5REoKEfFhlfJCK/3HxWyb0lUgrW5+j4h9GzyvLH00M2VQslY0J15hMrdp+3hHNfHgqehZ8jA2FMVskZIr++KBnItlZKY71DHSSNMisM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772177998; c=relaxed/simple;
	bh=sOiYomvFhDq7ZX6J8GSoe63dznpvQRU6nVHqlNksY7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Omr2g7aSvxAKXRz4ErE2ZuxcHROQIVKQQPBrfqZ0z/YehmODpSgOogFTFpN7NzOttCPtwnaE1cRfSu5G92XH7PbUqYNI2E4u1wiS6HboV6f3tLQLiwjzBYCj123AcWZHeb40ODK7/yxdlrMgQX4dY28dyCfTe6yW4UnXLIHV/Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpG7zHTp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1085C116C6;
	Fri, 27 Feb 2026 07:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772177998;
	bh=sOiYomvFhDq7ZX6J8GSoe63dznpvQRU6nVHqlNksY7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LpG7zHTpjfu9gK+YkZ5ZMc+iPrUQxQRM+TRD/8fEXAvIU2oEzEfJ8EZYp09RZrNle
	 z3507pfPNT1krjeo+CoR+VRzyHlO2kh1EzkCVJHJ5a8JJYvj6KIlVGcFIh/93SuwQA
	 M2zDS1dYhBz6jucMZEAGInEAH7bPHzcg0ntnfCYBsCvJiYo5aE8cg7ymB+v2eTJxFB
	 LIgoibaoj5BtvYbyZHQNhI/XvgaR+E/eKKehM6LSqh/06DCZAXxWtxkia01p/iGxrw
	 GBqIAQCdiGCxgmRw7bxMVr3uAtK5h6TdsSQcgqQDLQIHGH4EBUBW0bxORzur7FjXUS
	 pJfTz/yU345Hg==
Date: Fri, 27 Feb 2026 08:39:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Detlev Casanova <detlev.casanova@collabora.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
Message-ID: <20260227-aromatic-aboriginal-ibis-d14e7f@quoll>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260226-salute-threaten-a3eabb232396@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260226-salute-threaten-a3eabb232396@spud>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53666-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC83D1B4071
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 06:43:31PM +0000, Conor Dooley wrote:
> On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
> > With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
> > register blocks have been provided for the video decoder unit.
> > 
> > However, the binding does not properly describe the new hardware layout,
> > as it breaks the convention expecting the unit address to indicate the
> > start of the first register range, i.e. 'function' block is listed
> > before 'link' instead of the opposite.
> 
> I don't understand this commit message or rationale for an ABI break.


The description is indeed wrong. The binding properly describes new
hardware layout. They just don't like it.

Hardware has three separate address spaces and EXACT three correct
separate address spaces are described the binding.

> Changing the unit address seems like a "free" fix to your problem,
> especially when reg-names is not a required property that you can rely
> on. Actually, there may be a bug in the driver - it expects reg-names
> for rk3576-vdec and rk3588-vdec but the binding doesn't mandate their
> presence for those devices.
> 
> Deprecating the order also makes little sense to me, given that some of
> these devices only have one reg entry, which as far as I can tell from
> looking at the driver *is* the "function" region, so it can never be
> entirely deprecated.

There is "if" at the bottom of the binding, so the one entry does not
use reg-names.

Best regards,
Krzysztof


