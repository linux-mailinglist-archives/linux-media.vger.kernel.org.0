Return-Path: <linux-media+bounces-65327-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N/krHKvYOGryiwcAu9opvQ
	(envelope-from <linux-media+bounces-65327-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 08:39:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC716ACF97
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 08:39:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QllCbuzr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65327-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65327-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2BEA3029E71
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 06:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8F735F179;
	Mon, 22 Jun 2026 06:39:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52FF340A52;
	Mon, 22 Jun 2026 06:39:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110363; cv=none; b=sGDtEytGdTojeczrTsvozsjxmuOui0ekXy/oe8NfX48dMScDp54UTbb75xy1KlSp68eu9yTWD4Dejo3rcriGa6scb8CmlOvXFeqwFJFAfJluMsEnMgnZl84n3FbSz9vtpxth/c7nWz8MFVi7uoqpiCgUwohOOJgqm1ZXs5phLHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110363; c=relaxed/simple;
	bh=PGA0N2XaqsOojsWjsY+ps8k0K6GXRs9R6suheGDd9d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixyi+pQMVQ2nSzLlfHzOYrRiNGxcf4Y4FdnR9BDDe8GWq31NX7sH29EwXyOQ+BYUoJ5YG5mF0/bIfKU6xIgs26uTJ0GVj6e0Ikw5pWujHDAomSfFQN8g/9mUdZfl356uDZSJt/nHyOPCuLhB+hDBhNWO9+R8/0vd2o2apHOYbkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QllCbuzr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39181F000E9;
	Mon, 22 Jun 2026 06:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782110362;
	bh=0IQsMXVKdHFLQzLX2hMHB6QNRMK9W7yPN3A6edT5RAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QllCbuzrtjkiZ+xKVC91g1eC6iGVKJOjyS23Pix9iVDg238l2oOVsSvoGVlHDah8e
	 LvQ6J3wK0dI8J/jWqZGG5tU4ZlvpzZQPMTeKFErkBA9vJl0j86di9/uZ4Z093Vt6CA
	 QS5QZlz4uscAB/pA2AnddkvQVF5wr2ndlXv+8yBJR2AYbaBLyZ+Pe9ySAA1nrtcxC4
	 pIR0rSJjFoJtEPh8rmwfB2zDXOC9VMoGpBoG7ONCJ9Ubui5twu0TIG3P2XwPIQxXDY
	 sHzTcrIgf6IlX8Wcdk1rupvE//Fi9Bb1o2SyhZvf5XAwYWTF/cMFn+fOjSrBvxQzRp
	 YX6SVc1VirDRg==
Date: Mon, 22 Jun 2026 08:39:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v10 1/4] dt-bindings: clock: imx95-blk-ctl: Use single
 quotes consistently
Message-ID: <20260622-naughty-uncovered-parrot-fe6e04@quoll>
References: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
 <20260618-csi_formatter-v10-1-f23830312ba5@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-csi_formatter-v10-1-f23830312ba5@oss.nxp.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:guoniu.zhou@oss.nxp.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:laurent.pinchart@ideasonboard.com,m:frank.li@nxp.com,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:imx@lists.linux.dev,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:guoniu.zhou@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65327-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com,baylibre.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,nxp.com:email,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BAC716ACF97

On Thu, Jun 18, 2026 at 05:41:35PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Change "clocks" to 'clocks' in the description to match the quote style
> used for property names like '#clock-cells' throughout the file.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v10:
> - New patch to fix inconsistent quote usage (Krzysztof Kozlowski)

I think this is not necessary. I comment to have consistent style for a
new code, but changing this in existing one is just too much of work for
no real benefits.

Best regards,
Krzysztof


